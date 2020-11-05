%%%%%%%%%%%%%%%%%
% This is infinity-cv.cls (v0.1, 3 November 2020) written by
% Andreu Giménez Bolinches (esdandreu@gmail.com).
%
%	The MIT License (MIT)
%
%	Copyright (c) 2020 Andreu Gimenez Bolinches
%
%	Permission is hereby granted, free of charge, to any person obtaining a copy
%	of this software and associated documentation files (the "Software"), to deal
%	in the Software without restriction, including without limitation the rights
%	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%	copies of the Software, and to permit persons to whom the Software is
%	furnished to do so, subject to the following conditions:
%	
%	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%	THE SOFTWARE.
%
% Inspirations
% altacv.cls https://github.com/liantze/AltaCV
% twentysecondcv.cls https://www.overleaf.com/project/5fa061c205225d0001bdc7bb
%%%%%%%%%%%%%%%%
\ProvidesClass{infinity-cv}[2020/11/03 CV class]
\LoadClass{extarticle}
\NeedsTeXFormat{LaTeX2e}
%% Packages -------------------------------------------------------------------
\RequirePackage[sfdefault]{roboto}
\usepackage[margin=1.5cm]{geometry} % Sets margins
\RequirePackage{xcolor} % Allows \colorlet
\RequirePackage[skins]{tcolorbox} % Adds colours
% \RequirePackage{ifxetex,ifluatex}
\RequirePackage{fontawesome} % Adds icons like \faCircle
\RequirePackage{datatool} % Allows iterating over csv files
\RequirePackage{pdfcomment} % Allows the insertion of comments and annotations
\RequirePackage{xparse} % Allows complex commands
\RequirePackage{xifthen} % Allows complex boolean logic
\RequirePackage{fancyvrb} % Allows .txt files input
\RequirePackage{datenumber} 
\RequirePackage{calc} 

%% Configuration --------------------------------------------------------------
% Colours
\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}
% CV Language
% This allows to use data with several languages and change only the value of 
% this variable in order to change the whole language of the CV
\newcommand{\cvlang}{en}

%% Skills ---------------------------------------------------------------------
% The following markers can be modified.
% See https://sunsite.icm.edu.pl/pub/CTAN/fonts/fontawesome/doc/fontawesome.pdf
\newcommand{\ratingmarker}{{\footnotesize\faCircle}}% Rating marker for \cvskill
\newcommand{\descriptionmarker}{\faInfoCircle}% Marker for description hover

\NewDocumentCommand{\cvskill}{ O{} O{} m m}{% Single skill display
% Usage \cvskill[description][link]{Text}{Numeric Rating up to 5}
    \ifthenelse{\equal{#1}{}}% If not description
    {%
        \ifthenelse{\equal{#2}{}}{#3}{\href{#2}{#3}}%
        \hfill%
    }%
    {%
        \ifthenelse{\equal{#2}{}}{#3}{\href{#2}{#3}}
        \pdfmarkupcomment[markup=Underline,color=white]{\descriptionmarker}{#1}%
        \hfill%
    }%
    \foreach \x in {1,...,5}{%
    \space{\ifnumgreater{\x}{#4}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\skillsection}[1]{% Style of the Skill Section
    \medskip{\large#1}
}%
\newcommand{\skillscale}[1]{% Style of the Skill Scale
    \rightline{{\scriptsize#1}}
}%

\edef\tmpSkillSectionName{temp} % Temporal auxiliar variable
\edef\tmpSkillScale{temp} % Temporal auxiliar variable
\newcommand{\makecvskills}[1]{% Skill display from csv
% Usage \makecvskills{Database}
% The database must be loaded with \DTLloaddb{path/to/csv}
% The csv must be include at least the following header:
% cvlang,section,skill,level,description,link
    \DTLforeach*{#1}%
    {% Assignements
        \SkillCVLang=cvlang,%
        \SkillSectionName=section,%
        \SkillScale=scale,%
        \Skill=skill,%
        \SkillLevel=level,%
        \SkillDescription=description,%
        \SkillLink=link%
    }%
    {% Body
        \ifthenelse{\equal{\cvlang}{\SkillCVLang}}% Check skill language
        {%
            \ifthenelse{% If new section
                \NOT\equal{\tmpSkillSectionName}{\SkillSectionName}%
            }%
            {%
                \skillsection{\SkillSectionName}
                \skillscale{\SkillScale}
                \edef\tmpSkillSectionName{\SkillSectionName}
                \edef\tmpSkillScale{\SkillScale}
            }%
            {%
                \ifthenelse{% If new scale
                    \NOT\equal{\tmpSkillScale}{\SkillScale}%
                }%
                {\skillscale{\SkillScale}}% Add new scale
                {}% Else don't add scale
            }% Else don't add section name
            \cvskill[\SkillDescription][\SkillLink]{\Skill}{\SkillLevel}%
        }%
        {}% Else don't add it
    }%
}

%% Contact --------------------------------------------------------------------
\newcommand{\makecvcontact}[1]{% Contact display from csv
% Usage \makecvskills{Database}
% The database must be loaded with \DTLloaddb{path/to/csv}
% The csv must be include at least the following header:
% latexDisplay,value
    \DTLforeach*{#1}%
    {%
        \Contact=latexDisplay,%
        \ContactLink=link%
    }%
    {%
        \ifthenelse{\equal{\ContactLink}{}}% If no link
        {\large\Contact}% Then put just the field
        {\href{\ContactLink}{\large\Contact}}% Else make hyperlink
        \hfill
    }%
}

\newcommand{\cvname}[1]{% Name of the CV owner
    {\Huge\color{heading}#1}
}

%% Body -----------------------------------------------------------------------
\newcommand{\bodysection}[1]{{\large#1}\linebreak}

\newcommand{\makecvbody}[1]{% Body display
% Usage \makecvbody{Database}
% The database must be loaded with \DTLloaddb{path/to/csv}
% The csv must be include at least the following header:
% cvlang,field,value
    \DTLforeach*{#1}%
    {%
        \BodyCVLang=cvlang,%
        \BodySection=field,%
        \Body=value%
    }%
    {%
        \ifthenelse{\equal{\BodyCVLang}{\cvlang}}% Check language
        {%
            \bodysection{\BodySection}
            \Body

        }%
        {}% Else don't add it
        \medskip
    }%
}

%% Experience -----------------------------------------------------------------
\newcommand{\experiencecompany}[1]{{\large#1}\linebreak}

% Date difference
\newcounter{startDate}
\newcounter{diffyears}
\newcounter{diffmonths}
\newcounter{diffdays}

\newcommand{\datediff}[4]{% Computes the difference between two dates
% Usage \datediff{startYear}{startMonth}{endYear}{endMonth}
    \setmydatenumber{startDate}{#1}{#2}{1}%
    \setmydatenumber{diffdays}{#3}{#4}{1}%
    \addtocounter{diffdays}{-\thestartDate}%
    \def\diffbefore{ }%
    \def\diffafter{}%
    \ifnum\value{diffdays}<0
        \setcounter{diffdays}{-\value{diffdays}}%
    \fi
    \setcounter{diffyears}{\value{diffdays}/365}%
    \setcounter{diffdays}{\value{diffdays}-365*\value{diffyears}}%
    \setcounter{diffmonths}{\value{diffdays}/30}%
    \setcounter{diffdays}{\value{diffdays}-30*\value{diffmonths}}%
    %
    \diffbefore
    \ifnum\value{diffyears}=0
    \else
        \ifnum\value{diffyears}>1
            \thediffyears\space years,
        \else
            \thediffyears\space year,
        \fi
    \fi
    \ifnum\value{diffmonths}=0
    \else
        \ifnum\value{diffmonths}>1
            \thediffmonths\space months
        \else
            \thediffmonths\space month
        \fi
    \fi
    \diffafter
}

\edef\tmpJobCompany{temp} % Temporal auxiliar variable
\newcommand{\makecvexperience}[1]{% Experience display
% Usage \makecvexperience{Database}
% The database must be loaded with \DTLloaddb{path/to/csv}
% The csv must be include at least the following header:
% cvlang,title,subtitle,company,companyLink,location,startYear,startMonth,endYear,endMonth,description
    \DTLforeach*{#1}%
    {%
        \JobCVLang=cvlang,%
        \JobTitle=title,%
        \JobSubTitle=subtitle,%
        \JobCompany=company,%
        \JobLink=companyLink,%
        \JobLocation=location,%
        \JobStartYear=startYear,%
        \JobStartMonth=startMonth,%
        \JobEndYear=endYear,%
        \JobEndMonth=endMonth,%
        \JobDescription=description%
    }%
    {%
        \ifthenelse{\equal{\JobCVLang}{\cvlang}}% Check language
        {%
            \ifthenelse{% If new company
                \NOT\equal{\tmpJobCompany}{\JobCompany}%
            }%
            {% Write the company name
                \experiencecompany{\JobCompany}
                \edef\tmpJobCompany{temp}
            }%
            {}% Don't write company
            \JobTitle
            \hfill
            \datediff{\JobStartYear}{\JobStartMonth}{\JobEndYear}{\JobEndMonth}
        }%
        {}% Else don't add it
        \medskip
    }%
}
