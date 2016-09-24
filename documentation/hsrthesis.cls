\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrthesis}[2012/06/06 A LaTex template for HSR Thesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions

\LoadClass[a4paper,oneside]{scrbook}
%\LoadClass[a4paper, oneside]{report}
\usepackage[left=1.8cm,right=1.8cm]{geometry}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\newcommand{\nothing}{}

\pagestyle{plain}

% Including mostly used packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[utf8]{inputenc}

\usepackage[T1]{fontenc}

\usepackage{textcomp}
\usepackage{lmodern}
\usepackage{titlesec}
\usepackage{float}
\usepackage{hhline}

\usepackage{array}
\usepackage{adjustbox}
\usepackage{multirow}
\usepackage{rotating}

\usepackage{color}

\usepackage{listings}
\usepackage{tcolorbox}

\usepackage{epigraph}

\usepackage{lipsum}

\usepackage{lscape}
\usepackage{pdflscape}

\usepackage{fp}
\usepackage{tikz}
\usepackage{xcolor}

\usepackage{pifont}

\usepackage[final]{pdfpages}

\usepackage{sidecap}


\definecolor{bg}{rgb}{0.95,0.95,0.95}




\newcolumntype{R}[2]{%
    >{\adjustbox{angle=#1,lap=\width-(#2)}\bgroup}%
    l%
    <{\egroup}%
}
\newcommand*\rot{\multicolumn{1}{R{90}{1em}}}% no optional argument here, please!

% Copied from http://tex.stackexchange.com/a/313337
\usepackage{enumitem,amssymb}
\newlist{todolist}{itemize}{2}
\setlist[todolist]{label=$\square$}
\usepackage{pifont}
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%
\newcommand{\done}{\rlap{$\square$}{\raisebox{2pt}{\large\hspace{1pt}\cmark}}%
\hspace{-2.5pt}}
\newcommand{\wontfix}{\rlap{$\square$}{\large\hspace{1pt}\xmark}}

% Copied from http://tex.stackexchange.com/a/64765
% makes tables a bit wider
\renewcommand{\arraystretch}{1.5}

%Display URL and Hyperlinks
\usepackage[hyphens]{url}
\usepackage{hyperref}
\usepackage{url}

\usepackage{glossaries}

\usepackage{natbib}
\bibliographystyle{plain}  

%\usepackage[round, sort, compress, authoryear]{natbib}
\usepackage[autostyle]{csquotes}  

\usepackage{ltxtable, tabularx, longtable}
\usepackage{booktabs}
%\definecolor{lightgrey}{rgb}{.9,.9,.9}

% Table Stylings
% http://tex.stackexchange.com/a/13748
%%%%%%%%%%%%%%%%%%%%

\setlength\parindent{0pt}

\newcommand*\heading[1]{\bfseries{#1}}
\newcommand*\beforeheading{\toprule}
\newcommand*\afterheading{\midrule}
\newcommand*\normalline{}
\newcommand*\lastline{\bottomrule}
% Titlepage
%%%%%%%%%%%

\if@titlepage
	\renewcommand{\maketitle}{
		\begin{titlepage}
		% Logos
		\begin{picture}(0,150)(0,-100)
      		\put(0, 0){\includegraphics[height=20mm]{images/hsrlogo.png}}
      	% 	\put(350, 0){\includegraphics[height=15.7mm]{images/mselogo_choped.png}}
		\end{picture}

		% title
		\begin{center}
			\Large\departement\\[3ex]
			\huge\thesistitle\\[1ex]
			\LARGE\thesissubtitle\\[3ex]
			\large\school\\[1ex]
			\normalsize\term\\
			\normalsize\thedate
			\vfill
		\end{center}

		\begin{minipage}{\textwidth}
			\begin{flushleft}
				\large
				\begin{tabular}[t]{ll}
				% Checking Autor(s)
				\ifthenelse{\equal{\thesisauthora}{}}{\message{blub}}{\ifthenelse{\equal{\thesisauthorb}{}}{\emph{Autor:} & \thesisauthora\\[3pt]}{\ifthenelse{\equal{\thesisauthorc}{}}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb\\[3pt]}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb \ \& \thesisauthorc\\[3pt]}}}
				% Checking Supporter
				\ifthenelse{\equal{\professor}{}}{\\}{\emph{Betreuer:} & \professor\\[3pt]}
					\emph{Arbeitsperiode:} & \timeperiode\\[3pt]
					\emph{Arbeitsumfang:} & \workload\\[3pt]
					\emph{Link:} & \url{\linktothesis}
				\end{tabular}
			\end{flushleft}
		\end{minipage}
\end{titlepage}%    
}
   \else
   \renewcommand{\maketitle}{%
     \begin{flushleft}
       \null\hfill
       \vskip 2cm
       \sffamily\bfseries\upshape\huge
       \@title\\
       \mdseries\upshape\large
       \vspace{.5em}%
       \@author, \@date\\
	% \rule{\textwidth}{.5mm}\\
     \end{flushleft}
     \@thanks
     \par
     \vskip 1cm
     }
   \fi