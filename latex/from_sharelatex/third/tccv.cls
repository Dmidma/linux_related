% Copyright (C) 2012  Nicola Fontana <ntd at entidi.it>
%
% This program can be redistributed and/or modified under
% the terms of the LaTeX Project Public License, either
% version 1.3 of this license or (at your option) any later
% version. The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all LaTeX distributions
% version 2005/12/01 or later.
%
% Based on the original idea by Alessandro Plasmati found at
% http://www.latextemplates.com/template/two-column-one-page-cv
%
% The most relevant changes from his work are:
%
% * this is a class, not a template document;
% * tccv is based on scrartcl (from Koma-script), not on article;
% * the fonts are selected from the PSNFSS collection, so no
%   custom font installation should be required;
% * heavily based the implementation on custom environments and
%   macros, so the document is much easier to read (and customize);
% * it is plain LaTeX/Koma-script, so the CV can be compiled
%   with the usual tools, latex and pdflatex included.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tccv}
              [2012/11/09 v1.0
 Two Column Curriculum Vitae]

\LoadClass[10pt]{scrartcl}

\setcounter{secnumdepth}{-1}
\RequirePackage[hmargin=1.25cm,vmargin=1.25cm,twocolumn,columnsep=1.25cm]{geometry}
\RequirePackage{bookman,etoolbox,marvosym,needspace,tabularx,xcolor}
\RequirePackage{fontawesome}
\RequirePackage{ragged2e}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to manage math fonts
\RequirePackage[math-style=TeX]{unicode-math}


\RequirePackage{hyperref}
\hypersetup{
colorlinks=true,
linkcolor=red,
allbordercolors=white
}




\pagestyle{empty}
\setlength\parindent{0pt}
\color[HTML]{303030} % Default foreground color
\definecolor{link}{HTML}{39719B} % Hyperlinks
\hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
\setkomafont{disposition}{\color[HTML]{801010}}
\setkomafont{section}{\scshape\Large\mdseries}
\setkomafont{part}{\fontfamily{pzc}\selectfont\Huge}


\usepackage[default]{sourcesanspro}
% In tccv \part must contain the subject of the curriculum vitae.
% The command will start a new page and output in onecolumn the
% subject (first and last name) with the hardcoded text
% "Curriculum vitae" under it.
\renewcommand\part[1]{%
    \twocolumn[%
    \begin{center}
	\vskip-\lastskip%
	{\usekomafont{part} #1} 
    \medskip
    \end{center}]}



% Define an environment for cvitems(for cventry)
\newenvironment{cvitems} {
    \fontsize{9pt}{1em}
    \vspace{-4mm}
    \begin{justify}
        \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
            \setlength{\parskip}{0pt}
            \renewcommand{\labelitemi}{\bullet}
    }{
\end{itemize}
\end{justify}
\vspace{-2mm}
}



% Overrides the \section command to capitalize every
% word for cosmetic purposes and draws a rule under it.
\makeatletter
\let\old@section\section
\renewcommand\section[2][]{%
    \old@section[#1]{#2}%
    \newdimen\raising%
    \raising=\dimexpr-0.7\baselineskip\relax%
    \vskip\raising\hrule height 0.4pt\vskip-\raising}
\makeatother


% Renders a personal data box:
%
% |[
% \personal[optional: web site without scheme (no http:// prefix)]
%          {address}{phone number}{email}
% ]|
\newcommand\personal[6][]{%
    \needspace{0.5\textheight}%
    \newdimen\boxwidth%
    \boxwidth=\dimexpr\linewidth-2\fboxsep\relax%
    % \colorbox[HTML]{F5DD9D}{%
    \colorbox[HTML]{E8F4FF}{%
    \begin{tabularx}{\boxwidth}{c|X}
    \Writinghand & {#2}\smallskip\\
    \Telefon     & {#3}\smallskip\\
    \Letter      & \href{mailto:#4}{#4}\\
    \faGithub    & \href{https://github.com/dmidma}{#5}\\
    \faLinkedin & \href{https://www.linkedin.com/in/oussema-hidri-5b87a9a1/}{#6}
    \ifstrempty{#1}{}{\smallskip\\ \Lightning & \href{http://#1}{#1}}
    \end{tabularx}}}

\newenvironment{eventlist}{
    \newcommand\eventbegin[2]{
	    {\Large\textit{##1}\smallskip}\\
        {\ifstrempty{##2}{\medskip}{\raggedleft##2\medskip\\}}
    }
    \raggedright 
    \newcommand\eventend[1]{
        {\raggedleft\textsc{##1}\\[1pt]}
        \medskip
    }
}


% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item[optional: what has been achieved]{years}{subject}{notes}
% ]|

\newenvironment{yearlist}{%
    \renewcommand\item[5]{%
            \raggedright { \bfseries ##1}
    \smallskip\\
    {\ifstrempty{##5}{\textit{##4}}{\textit{\href{##5}{##4}}}}
    { ##3 } \\
    {\raggedleft\textsc{##2}\\[1pt]\medskip}
	}
}


%\newenvironment{yearlist}{%
%    \renewcommand\item[4][]{%
%	{\textsc{##2}} & {\bfseries ##3} \\
%	\ifstrempty{##1}{}{& {\textsc{##1}} \\}
%	& {\textit{##4}}\medskip\\}
%    \tabularx{\linewidth}{rX}}
%    {\endtabularx}


\newenvironment{courseslist}{%
\renewcommand\item[5][]{%
    \begin{tabularx}{\linewidth}{rX}
        {\textsc{##2}} & {\ifstrempty{##5}{\textit{##4}}{\textit{\href{##5}{##4}}}} \\
	    \ifstrempty{##1}{}{& {\textsc{##1}} }
    \end{tabularx}
    \vspace{-2mm}
    {\vskip-\lastskip\bfseries\hspace{5mm}##3}
    \bigskip}
}





% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item{fact}{description}
% ]|
\newenvironment{factlist}{%
    \newdimen\unbaseline
    \unbaseline=\dimexpr-\baselinestretch\baselineskip\relax
    \renewcommand\item[2]{%
	\textsc{##1} & {\raggedright ##2\medskip\\}\\[\unbaseline]}
    \tabularx{\linewidth}{rX}}
    {\endtabularx}
%%
%% End of file `tccv.cls'.
