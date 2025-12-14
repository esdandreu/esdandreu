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
\usepackage{accsupp} % \BeginAccSupp ... \EndAccSupp
\RequirePackage{xstring} % Allows \IfStrEq




%% Configuration --------------------------------------------------------------
% Colors
\definecolor{Heading}{HTML}{002880} \colorlet{heading}{Heading}
\definecolor{Emphasis}{HTML}{203445} \colorlet{emphasis}{Emphasis}
\definecolor{Body}{HTML}{1e2830} \colorlet{body}{Body}
\colorlet{url}{gray!60!blue}
\AtBeginDocument{\color{body}}
% Styling
% https://www.overleaf.com/learn/latex/sections_and_chapters
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before-code>}[<after-code>]
% \titlespacing{command}{left spacing}{before spacing}{after spacing}[right]
\titleformat{\section}[block]{\color{heading}\large\filcenter}{}{1em}{}
\titlespacing*{\section}{0pt}{5pt plus 2pt minus 1pt}{0pt plus 2pt minus 2pt}
\titleformat{\subsection}[runin]{\color{emphasis}\bfseries}{}{0pt}{}
\titlespacing*{\subsection}{0pt}{0pt}{1em}

% Commands
% Invisible text that's still exposed to copy/paste, screen readers, and many parsers.
\newcommand{\invisible}[1]{%
  \BeginAccSupp{method=pdfstringdef,unicode=true,ActualText={#1}}%
  \null % zero-width anchor so the PDF actually emits a content object
  \EndAccSupp{}
}

% Expand acronyms for machines while keeping the short form for humans.
\newcommand{\abbr}[2]{% #1 = visible short, #2 = machine-readable expansion
  \BeginAccSupp{method=pdfstringdef,unicode=true,ActualText={#2}}#1\EndAccSupp{}
}

