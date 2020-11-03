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
\RequirePackage{xcolor} % Allows \colorlet
\RequirePackage[skins]{tcolorbox} % Adds colours
% \RequirePackage{ifxetex,ifluatex}
\RequirePackage{fontawesome} % Adds icons like \faCircle
\RequirePackage{datatool} % Allows iterating over csv files
\RequirePackage{pdfcomment} % Allows the insertion of comments and annotations
% \RequirePackage{pgffor}

%% Configuration --------------------------------------------------------------
% Colours
\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}

%%% Data structure
%% Data Path
%% Data iterator
\newcommand{\CSVforeach}[3]{%
% Usage \CSVforeach{Path\To\csv}{Assignements}{Body}
% For the assignements and body syntax check https://www.dickimaw-books.com/latex/admin/html/dtlforeach.shtml
    \DTLloaddb{csv}{#1}
    \DTLforeach*{csv}
    {% Assignements
        #2%
    }%
    {% Body
        #3%
    }%
}

%% Picture
%% Education Highlights
%% Experience
%% Timeline
%% Skills ---------------------------------------------------------------------
\newcommand{\ratingmarker}{\faCircle}% Rating marker for \cvskill

% TODO add optional command and disable comment if description is not provided
% TODO add hyperlink
\newcommand{\cvskill}[3]{% Single skill display
% Usage \cvskill{Text}{Numeric Rating up to 5}{Description}
    \textbf{\pdfmarkupcomment[markup=Underline,color=emphasis]{#1}{#3}}\hfill
    \foreach \x in {1,...,5}{%
    \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\makecvskills}[1]{% Skill display from csv
% Usage \makecvskills{Path\To\csv}
% The csv must be structured with the following header:
% cvlang,skill,level,description,link
    \CSVforeach{#1}%
    {% Assignements
        \cvlang=cvlang,%
        \skill=skill,%
        \level=level,%
        \description=description,%
        \link=link%
    }%
    {% Body
        \cvskill{\skill}{\level}{\description H}
    }%
}

%% Strengths
%% Objective
%% Contact
%% Other Details