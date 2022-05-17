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
\RequirePackage{pdfcomment} % Allows the insertion of comments and annotations
\RequirePackage{titlesec} % Better styling for sections
\RequirePackage{enumitem} % Better itemize control

%% Configuration --------------------------------------------------------------
% Colours
\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}
% Styling
% https://www.overleaf.com/learn/latex/sections_and_chapters
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before-code>}[<after-code>]
% \titlespacing{command}{left spacing}{before spacing}{after spacing}[right]
\titleformat{\section}[block]{\color{heading}\Large\filcenter}{}{1em}{}
\titlespacing*{\section}{0pt}{5pt plus 2pt minus 1pt}{0pt plus 2pt minus 2pt}
\titleformat{\subsection}[block]{\color{emphasis}\large}{}{1em}{}
\titlespacing*{\subsection}{10pt}{0pt plus 2pt minus 1pt}{2pt plus 2pt minus 2pt}
\titleformat{\subsubsection}{\color{heading}\scshape}{}{1em}{}
\titlespacing*{\subsubsection}{0pt}{5pt plus 2pt minus 1pt}{2pt plus 2pt minus 2pt}

% Compact itemize
\def\labelitemi{--}
\setlist[itemize]{leftmargin=*,itemsep=0pt,topsep=0pt,partopsep=0pt,parsep=0pt}