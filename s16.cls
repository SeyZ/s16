\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{s16}

\LoadClass[a4paper, 11pt]{report}

% ------ common packages ------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} 
\RequirePackage{amssymb}
\RequirePackage[frenchb]{babel}
	\frenchbsetup{PartNameFull=false}
% -----------------------------

% ------ color settings ------
\RequirePackage[table]{xcolor}
\definecolor{verylightgray}{gray}{0.95}
\definecolor{darkgray}{gray}{0.30}
% ----------------------------

% ------ variables ------
\def\shiftsecleft{57pt}
\def\shiftsubsecleft{\shiftsecleft}

\def\partlinedepth{3pt}

% -----------------------

% ------  fonts settings ------
\DeclareFixedFont{\partnumfont}{T1}{ptm}{m}{n}{100pt} % part num
\DeclareFixedFont{\partchapfont}{T1}{ptm}{m}{n}{16pt} % part word
\DeclareFixedFont{\parttitfont}{T1}{ptm}{m}{n}{30pt} % part name

\DeclareFixedFont{\chapnumfont}{T1}{phv}{b}{n}{80pt} % chapter num
\DeclareFixedFont{\chapchapfont}{T1}{phv}{m}{n}{30pt} % chapter word
\DeclareFixedFont{\chaptitfont}{T1}{phv}{b}{n}{25pt} % chapter name

\DeclareFixedFont{\secnumfont}{T1}{phv}{b}{n}{18pt} % section num
\DeclareFixedFont{\sectitfont}{T1}{phv}{b}{n}{18pt} % section name

\DeclareFixedFont{\subsecnumfont}{T1}{phv}{b}{n}{15pt} % subsection num
\DeclareFixedFont{\subsectitfont}{T1}{phv}{b}{n}{15pt} % subsection name

\DeclareFixedFont{\subsubsectitfont}{T1}{phv}{b}{n}{12pt} % subsubsection name
% ---------------------------	

% ------ marges settings ------
\RequirePackage[top=75pt,bottom=55pt,right=57pt,left=114pt]{geometry}
\reversemarginpar
% -------------------------------

% ------ TOC settings ------
\let\oldtoc=\tableofcontents
\def\tableofcontents{{%
	\parskip=1pt%
	\oldtoc}%
}
% --------------------------

% ------ headers settings ------
\RequirePackage{fancyhdr}
\pagestyle{fancy}

\addtolength{\headheight}{4pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\headrulewidth}{1.14pt}

\lfoot{}
\cfoot{}
\rfoot{}
\lhead{\scriptsize{\color{gray}{Confidential}}}
\chead{}
\rhead{\space\rightmark\space$\blacklozenge$\space\textbf{\thepage}}
% ------------------------------

% ------ matters settings ------
\newif\if@mainmatter \@mainmattertrue
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}%
}
  
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
}
  
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse%
}
% ------------------------------

% ------ part's style ------
\makeatletter
\def\part{\@ifstar\part@nonum\part@num}
\def\part@num#1{%
	\cleardoublepage
	\null\vfill
	\refstepcounter{part}
	{%
		\hfill\parttitfont\raisebox{30pt}{\partname}\hskip15pt\partnumfont\thepart
		\vskip20pt\noindent\rule{\linewidth}{\partlinedepth} % print a line
		\vskip20pt\noindent\parttitfont{#1} % print the part's name
	}%	
	\vfill\null%
  	\clearpage%
	\addcontentsline{toc}{part}{%
    	\protect\numberline{\thepart}#1}%
}
\def\part@nonum#1{%
	\cleardoublepage
	\null\vfill
	{%
		\noindent\rule{\linewidth}{3pt} % print a line
		\vskip20pt\noindent\parttitfont{#1} % print the part's name
	}%	
	\vfill\null%
  	\clearpage%
}
\makeatother
% --------------------------

% ------ preface definition ------
\def\preface#1{%
	\chapter*{#1}%
}
% --------------------------------

% ------ chapter's style ------
\makeatletter
\def\@makechapterhead#1{%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsecleft %
		\noindent\chapchapfont\raisebox{15pt}{\@chapapp{}}%
		\hskip10pt\color{gray}\chapnumfont\thechapter%	
	}}
	{%
		\vskip10pt\hrule%
		\vskip20pt\noindent\chaptitfont#1\vskip30pt%
	}
}
\def\@makeschapterhead#1{%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsecleft %
		\noindent\chaptitfont#1\vskip10pt%
		\hrule\vskip30pt
	}}
}
% -----------------------------

% ------ section's style ------
\def\thesection{\arabic{section}}

\makeatletter
\def\section{\@ifstar\section@nonum\section@num}
\def\section@num#1{%
	\removelastskip%
	\vskip25pt\goodbreak%
	\refstepcounter{section}%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsecleft
		\noindent\secnumfont{\thesection}%
		\hskip10pt\sectitfont{#1}%
		\vskip10pt\noindent\hrule%
		\vskip15pt\goodbreak%
	}}%
	\sectionmark{#1}%
	\addcontentsline{toc}{section}{%
    	\protect\numberline{\thesection}#1}%
}
\def\section@nonum#1{%
	\removelastskip%
	\vskip25pt\goodbreak%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsecleft
		\noindent%
		\sectitfont{#1}%
		\vskip10pt\noindent\hrule%
		\vskip15pt\goodbreak%
	}}%
	\sectionmark{#1}%
}
\makeatother

% -----------------------------

% ------ subsection's style ------
\makeatletter
\def\subsection{\@ifstar\subsection@nonum\subsection@num}
\def\subsection@num#1{%
	\removelastskip%
	\vskip20pt\goodbreak%
	\refstepcounter{subsection}%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsubsecleft
		\noindent\subsecnumfont{\thesubsection}%
		\hskip10pt\subsectitfont{#1}%
		\vskip7pt\goodbreak%
	}}%
	\addcontentsline{toc}{subsection}{\protect\numberline{%
		\thesubsection}#1}%
}
\def\subsection@nonum#1{%
	\removelastskip%
	\vskip20pt\goodbreak%
	\hbox to \hsize{\hss\vbox{\advance\hsize by \shiftsubsecleft
		\noindent%
		\subsectitfont{#1}%
		\vskip7pt\goodbreak%
	}}%
}
\makeatother
% --------------------------------

% ------ subsubsection's style ------
\makeatletter
\def\subsubsection{\@ifstar\subsubsection@nonum\subsubsection@num}
\def\subsubsection@num#1{%
	\removelastskip%
	\vskip20pt\goodbreak%
	\refstepcounter{subsubsection}%
	{%
		\noindent\subsubsectitfont{#1}%
		\vskip7pt%
	}%
	\addcontentsline{toc}{subsubsection}{%
    	\protect\numberline{\thesubsubsection}#1}%
}
\def\subsubsection@nonum#1{%
	\removelastskip%
	\vskip20pt\goodbreak%
	{%
		\noindent\subsubsectitfont{#1}%
		\vskip7pt%
	}%
}
\makeatother
% -----------------------------------

% ------ paragraph settings ------
\makeatletter
\parskip=\z@
\makeatother
% --------------------------------

% ------ figure settings ------
\addto\captionsfrench{\def\figurename{\textbf{Figure}}}
\makeatletter
\renewcommand{\thefigure}{\textbf{\thesection}}
\@addtoreset{figure}{section}
\makeatother
% -----------------------------

