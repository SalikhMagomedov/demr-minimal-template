% ========================
% ==== Identification ====
% ========================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{demi}[2019/03/18. v1.3. Class for DEMR (mathreports.ru) (authors only)]
% ========================

% =================================
% ==== Preliminary declaration ====
% =================================
% Journal Name
\def\@name{Дагестанские Электронные Математические Известия}
\newcommand{\set@name}[1]{\def\@name{#1}}
\newcommand{\get@name}{\@name}

% Short Title
\def\@shortTitle{???}
\newcommand{\setShortTitle}[1]{\def\@shortTitle{#1}}
\newcommand{\get@shortTitle}{\@shortTitle}

% Biblio Number
\def\@bibNumber{0}
\newcommand{\set@bibNumber}[1]{\def\@bibNumber{#1}}
\newcommand{\setBibNumber}[1]{\def\@bibNumber{#1}\booltrue{manualbibnum}}
\newcommand{\getBibNumber}{\@bibNumber}

% Biblio text in annotation (main language, ru by default)
\def\@mainbibname{Библиография}
\def\@mainbibcountername{названий}
\def\@mainBibData{\@mainbibname: \getBibNumber \, \@mainbibcountername.}
\newcommand{\set@mainBibCounterName}[1]{\def\@mainbibcountername{#1}}
\newcommand{\setMainBibCounterName}[1]{\def\@mainbibcountername{#1}\booltrue{manualbibtextmain}}
\newcommand{\set@mainBibName}[1]{\def\@mainbibname{#1}}
\newcommand{\get@mainBibData}{\@mainBibData}

% Biblio text in annotation (other language, en by default)
\def\@otherbibname{Bibliography}
\def\@otherbibcountername{items}
\def\@otherBibData{\@otherbibname: \getBibNumber \, \@otherbibcountername.}
\newcommand{\set@otherBibCounterName}[1]{\def\@otherbibcountername{#1}}
\newcommand{\setOtherBibCounterName}[1]{\def\@otherbibcountername{#1}\booltrue{manualbibtextother}}
\newcommand{\set@otherBibName}[1]{\def\@otherbibname{#1}}
\newcommand{\get@otherBibData}{\@otherBibData}

% UDC Number
\def\@udc{0}
\newcommand{\setUdc}[1]{\def\@udc{#1}}
\newcommand{\get@udc}{\@udc}

% UDC Name
\def\@udcname{УДК}
\newcommand{\set@udcname}[1]{\def\@udcname{#1}}
\newcommand{\get@udcname}{\@udcname}

% Keywords Name (main language, ru by default)
\def\@mainkeywordsname{Ключевые слова}
\newcommand{\set@mainkeywordsname}[1]{\def\@mainkeywordsname{#1}}
\newcommand{\get@mainkeywordsname}{\@mainkeywordsname}

% Keywords Name (other language, en by default)
\def\@otherkeywordsname{Keywords}
\newcommand{\set@otherkeywordsname}[1]{\def\@otherkeywordsname{#1}}
\newcommand{\get@otherkeywordsname}{\@otherkeywordsname}

% If authcount >= 4, then replace authors[2, 3, ...] with this text
\def\@otherauthorsstring{и др.}
\newcommand{\set@otherauthorsstrng}[1]{\def\@otherauthorsstring{#1}}
\newcommand{\get@otherauthorsstrng}{\@otherauthorsstring}

% watermark text
\def\@revtext{mathreports.ru}
\newcommand{\set@revtext}[1]{\def\@revtext{#1}}
\newcommand{\get@revtext}{\@revtext}

% absolut line number style for rev option
\newcommand{\@revnumabsolut}{%
	\newsavebox{\@linebox}
	\savebox{\@linebox}[3em][t]{\parbox[t]{3em}{%
			\@tempcnta\@ne\relax
			\loop{\underline{\scriptsize\the\@tempcnta}}\\
			\advance\@tempcnta by \@ne\ifnum\@tempcnta<46\repeat}}%
	\booltrue{revnuminsert}}

% inline line number style for rev option
\newcommand{\@revnuminline}{%
	\RequirePackage[pagewise, mathlines]{lineno}
	\renewcommand\linenumberfont{\normalfont\small}
	\booltrue{revnuminline}
	
	\linenumbers
}

% setting default line number style
\newcommand{\revnum}{\@revnuminline}

% setting default bib counter text
\newcommand{\auto@main@bibcountertext}[1]{\auto@bibcountertext@ru{#1}}
\newcommand{\auto@other@bibcountertext}[1]{\auto@bibcountertext@en{#1}}

% ++++ RU ++++
% ++++ MAIN ++++
\newcommand{\mainlang@ru}{%
	\AtEndOfClass{\main@language{russian}} % babel option
	\set@name{Дагестанские Электронные Математические Известия}
	\set@udcname{УДК}
	\set@mainBibName{Библиография}
	\set@mainBibCounterName{названий}
	\set@mainkeywordsname{Ключевые слова}
	\set@otherauthorsstrng{и др.}
	
	\renewcommand{\auto@main@bibcountertext}[1]{\auto@bibcountertext@ru{##1}}
}
% ++++ OTHER ++++
\newcommand{\otherlang@ru}{%
	\set@otherBibName{Библиография}
	\set@otherBibCounterName{названий}
	\set@otherkeywordsname{Ключевые слова}
	
	\renewcommand{\auto@other@bibcountertext}[1]{\auto@bibcountertext@ru{##1}}
}
% ++++ BIB COUNTER TEXT ++++
\newcommand{\auto@bibcountertext@ru}[1]{%
\ifthenelse{%
	\intcalcMod{#1}{100} > 10%
	\and%
	\intcalcMod{#1}{100} < 20%
}{%
	названий%
}{%
	\ifthenelse{%
		\intcalcMod{#1}{10} = 1%
	}{%
		название%
	}{%
		\ifthenelse{%
			\intcalcMod{#1}{10} > 1%
			\and%
			\intcalcMod{#1}{10} < 5%
		}{%
			названия%
		}{%
			названий%
		}%
	}%
}%
}%

% ++++ EN ++++
% ++++ MAIN ++++
\newcommand{\mainlang@en}{%
	\AtEndOfClass{\main@language{english}} % babel option
	\set@name{Daghestan Electronic Mathematical Reports}
	\set@udcname{UDC}
	\set@mainBibName{Bibliography}
	\set@mainBibCounterName{items}
	\set@mainkeywordsname{Keywords}
	\set@otherauthorsstrng{and others}
	
	\renewcommand{\auto@main@bibcountertext}[1]{\auto@bibcountertext@en{##1}}
}
% ++++ OTHER ++++
\newcommand{\otherlang@en}{%
	\set@otherBibName{Bibliography}
	\set@otherBibCounterName{items}
	\set@otherkeywordsname{Keywords}
	
	\renewcommand{\auto@other@bibcountertext}[1]{\auto@bibcountertext@en{##1}}
}
% ++++ BIB COUNTER TEXT ++++
\newcommand{\auto@bibcountertext@en}[1]{%
\ifthenelse{%
	#1 = 1
}{%
	item%
}{%
	items%
}%
}%

% Base class
\LoadClass[twoside, 14pt]{extarticle}

% Required Packages
%\RequirePackage[utf8]{inputenc}
% For named options
\RequirePackage{pgfkeys}
	\pgfkeys{
		/demr/.cd,
			mainlang/.is choice, % option for main language
			mainlang/ru/.code={\mainlang@ru},
			mainlang/en/.code={\mainlang@en},
			otherlang/.is choice, % option for other language
			otherlang/ru/.code={\otherlang@ru},
			otherlang/en/.code={\otherlang@en},
			revtext/.code=\set@revtext{#1}, % setting watermark text
			revnumstyle/.is choice, % option for changing string numbers style
			revnumstyle/absolut/.code={\renewcommand{\revnum}{\@revnumabsolut}},%
			revnumstyle/inline/.code={\renewcommand{\revnum}{\@revnuminline}},%
	}
% Applying named options to class
\RequirePackage{pgfopts}
	\ProcessPgfOptions{/demr}
\RequirePackage[T1,T2A]{fontenc} % For Cyrillic font encoding
\RequirePackage[english,russian]{babel} % For typographical rules
\RequirePackage{fancyhdr} % Page stylizing
\RequirePackage[explicit]{titlesec} % Title formatting (sections and subsections)
\RequirePackage{etoolbox} % Using commands in this class
	\newbool{rev} % Is this article for reviewers?
	\newbool{mainlangonly} % True if only one language
	\newbool{digsig} % Setting op at the end of ducument signature field (experimental feature)
	\newbool{manualbibnum} % true when used \setBibNumber
	\newbool{manualbibtextmain}  % true when used \setMainBibCounterName
	\newbool{manualbibtextother} % true when used \setOtherBibCounterName
	\newbool{revnuminsert} % true when revnumstyle=absolut
	\newbool{revnuminline} % true when revnumstyle=inline
\RequirePackage{hyperref} % Coloring refs
\RequirePackage{amsthm} % Define theoremstyles
\RequirePackage{titletoc} % Add section* and subsection* to ToC
\RequirePackage{cite} % Improve cites style
\RequirePackage{totcount} % for auto-cite counter
\RequirePackage{intcalc} % for mod calculation
\RequirePackage{ifthen} % for auto-bibcountertext
% =================================

% =================
% ==== Options ====
% =================
% Main = russian, other = english
\DeclareOption{ru}{
	\mainlang@ru
	\otherlang@en
}
% Main = english, other = russian
\DeclareOption{en}{
	\mainlang@en
	\otherlang@ru
}
% For Review Only
\DeclareOption{rev}{%	
	\booltrue{rev}
}
% Only one language
\DeclareOption{mainlangonly}{%
	\booltrue{mainlangonly}
}
% Using digital signature field
\DeclareOption{digsig}{%
	\booltrue{digsig}
}
% Using article options in tex file
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% =================

% ==========================
% ==== More declaration ====
% ==========================
% setup named options with special command
\newcommand{\demrsetup}[1]{%
	\pgfkeys{/demr/.cd,#1}
}

% Counters
\newcounter{idx} % index
\newcounter{authcount} % Author counter

% Setting start page
\newcommand{\setStartPage}[1]{\setcounter{page}{#1}}

% Command for creating 2 abstracts (ru and en by default)
\newcommand{\abstracts}[2]{%
	\begin{quotation}
		#1
		
		\get@mainBibData
		\ifbool{mainlangonly}{}{%
			
			\null
			
			#2
			
			\get@otherBibData
		}
	\end{quotation}%
}

% Command for creating keywords (ru and en be default)
\newcommand{\keywords}[2]{%
	\begin{quotation}
		\textbf{\get@mainkeywordsname:}
		#1
		\ifbool{mainlangonly}{}{%
			
			\textbf{\get@otherkeywordsname:}
			#2
		}
	\end{quotation}%
}

% Defining list of Autors with email and addresses
\newcommand\addAuth[2][]{
	\stepcounter{authcount}
	\csdef{auth@mainname\theauthcount}{#2}
	\csdef{auth@othername\theauthcount}{#1}
	\csdef{auth@address\theauthcount}{}
	\csdef{auth@email\theauthcount}{}
}

% add address to current author
\newcommand{\address}[1]{
	\csdef{auth@address\theauthcount}{#1}
}

% add emain to current author
\newcommand{\email}[1]{
	\csdef{auth@email\theauthcount}{#1}
}

% create new author
\newcommand{\auth@names}{%
	\setcounter{idx}{0}%
	\loop%
		\stepcounter{idx}%
		\csuse{auth@mainname\theidx}%
		\ifnumless{\theidx}{\theauthcount}{, }{}%
	\ifnum \theidx < \theauthcount
	\repeat
}%

% get all authors data
\newcommand{\auth@data}{%
	\setcounter{idx}{0}%
	\loop%
		\stepcounter{idx}%
		\textbf{\csuse{auth@mainname\theidx} \ifcsempty{auth@othername\theidx}{}{\ifbool{mainlangonly}{}{(\csuse{auth@othername\theidx})}}}\par\noindent%
		\csuse{auth@address\theidx}\par\noindent%
		\ifcsempty{auth@email\theidx}{}{\textit{E-mail:} \href{mailto:\csuse{auth@email\theidx}}{\csuse{auth@email\theidx}}\par\noindent}%
		\ifnumless{\theidx}{\theauthcount}{\vskip 0.5em}{}\noindent%
	\ifnum \theidx < \theauthcount
	\repeat
}%

% show one author if authcount >= 4
\newcommand{\auth@shortnames}{\ifnumless{\theauthcount}{4}{\auth@names}{\csuse{auth@mainname1} \get@otherauthorsstrng}}

% Page settings
\voffset = -0.75in 
\hoffset = 0in 
\oddsidemargin = 0pt 
\evensidemargin = 0pt
\headheight = 14.5pt
\textheight = 8.69in
\textwidth = 6.27in

% setup ref colors
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	citecolor=blue,
	urlcolor=blue,
	filecolor=blue,
	bookmarksnumbered=true,
	pdfstartview=FitH,
	pdfhighlight=/N
}

% settings for plain theorem style
\newtheoremstyle{plain}% stylename
	{5pt}% space above
	{5pt}% space below
	{\itshape}% bodyfont
	{\parindent}% indentamt
	{\scshape}% headfont
	{.}% headpunct
	{.5em}% headspace
	{}% headspec
%

% settings for definition theorem style
\newtheoremstyle{definition}% stylename
	{5pt}% space above
	{5pt}% space below
	{\upshape}% bodyfont
	{\parindent}% indentamt
	{\scshape}% headfont
	{.}% headpunct
	{.5em}% headspace
	{}% headspec
%
	
% settings for proof style	
\renewenvironment{proof}[1][\proofname]
	{\par%
	\pushQED{\qed}%
	\normalfont{\scshape #1\@addpunct{.}}%
	\hspace\labelsep\ignorespaces}%
	{\popQED\endtrivlist\@endpefalse}
%

% autosetting bibNumber
\newtotcounter{citnum}
\def\oldbibitem{} \let\oldbibitem=\bibitem
\def\bibitem{\stepcounter{citnum}\oldbibitem}
\set@bibNumber{\total{citnum}}
\newcommand{\set@BibText}[1]{%
	\ifbool{manualbibtextmain}{}{%
		\set@mainBibCounterName{\auto@main@bibcountertext{#1}}%
	}%
	\ifbool{manualbibtextother}{}{%
		\set@otherBibCounterName{\auto@other@bibcountertext{#1}}%
	}%
}
\AtBeginDocument{%
	\ifbool{manualbibnum}{%
		\set@BibText{\getBibNumber}%
	}{%
		\set@BibText{\totvalue{citnum}}%
	}%
}%

% Indent first line after section
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue

% set default author variable
\author{\auth@names}

\ifbool{rev}{%
	\RequirePackage[printwatermark]{xwatermark} % Create watermark (for review only)
	\RequirePackage{xcolor} % Colors
	
	% Creating watermark
	\newwatermark[allpages, color=blue!10, angle=-45, scale=2, xpos=0, ypos=0]{\get@revtext}
	
	% Creating line numbers
	\revnum
}

% amsmath package support with 'revnumstyle=inline' option
\ifbool{revnuminline}{%
\AtBeginDocument{
	\newcommand*\linenomathpatchAMS[1]{%
		\expandafter\pretocmd\csname #1\endcsname {\linenomathAMS}{}{}%
		\expandafter\pretocmd\csname #1*\endcsname{\linenomathAMS}{}{}%
		\expandafter\apptocmd\csname end#1\endcsname {\endlinenomath}{}{}%
		\expandafter\apptocmd\csname end#1*\endcsname{\endlinenomath}{}{}%
	}
	
	%% Definition of \linenomathAMS depends on whether the mathlines option is provided
	\expandafter\ifx\linenomath\linenomathWithnumbers
	\let\linenomathAMS\linenomathWithnumbers
	%% The following line gets rid of an extra line numbers at the bottom:
	\patchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{}{}
	\else
	\let\linenomathAMS\linenomathNonumbers
	\fi
	
	\linenomathpatchAMS{equation} %% <- unnecessary, equation is already patched
	\linenomathpatchAMS{gather}
	\linenomathpatchAMS{multline}
	\linenomathpatchAMS{align}
	\linenomathpatchAMS{alignat}
	\linenomathpatchAMS{flalign}
}
}{}

% set style for all pages
\pagestyle{fancy}

% setup headers
\fancyhf{}
\fancyhead[CO]{\small\get@shortTitle}
\fancyhead[RE]{\small\auth@shortnames}
\ifbool{revnuminsert}{%
	% Placing line numbers to the left side of page
	\lhead{\small\thepage%
		\begin{picture}(0,0)%
			\put(-26,-25){\usebox{\@linebox}}%
		\end{picture}}
}%
{%
	\fancyhead[LE,RO]{\small\thepage}
}

% setup plain style
\fancypagestyle{plain}{
	\fancyhf{}
	\ifbool{revnuminsert}
		{\lhead{}%
			\begin{picture}(0,0)%
				\put(-26,-50){\usebox{\@linebox}}%
			\end{picture}}
		{\lhead{}}
	\chead{\small\get@name}
	\rhead{}
	\rfoot{\small\copyright \quad \auth@shortnames}
}

% make title info
\def\@maketitle{%
	\newpage
	\noindent \get@udcname\, \get@udc
	\begin{center}%
		{\bfseries\auth@names\par}%
		{\Large\bfseries \@title \par}%
	\end{center}%
	\par}

% setup first page
\thispagestyle{plain}

% setup \section{title} style
\titleformat{\section} % command
	{\centering\large\normalfont\bfseries} % format
	{\thesection.} % label
	{0.5em} % separation
	{#1} % before code
%
% setup \section*{title} style
\titleformat{name = \section, numberless} % command
	{\centering\large\normalfont\bfseries} % format
	{} % label
	{0.5em} % separation
	{#1} % before code
	[\addcontentsline{toc}{section}{#1}] % after code
%
% setup \subsection{title} style
\titleformat{\subsection} % command
	{\centering\normalfont\bfseries} % format
	{\thesubsection.} % label
	{0.5em} % separation
	{#1} % before code
%
% setup \subsection*{title} style
\titleformat{name = \subsection, numberless} % command
	{\centering\normalfont\bfseries} % format
	{} % label
	{0.5em} % separation
	{#1} % before code
	[\addcontentsline{toc}{subsection}{#1}] % after code
%

% setup thebibliography style
\let\old@thebibliography\thebibliography
\renewcommand\thebibliography[1]{
	\old@thebibliography{#1}
	\setlength{\parskip}{2pt}
	\setlength{\itemsep}{0pt plus 0.3ex}
}

\ifbool{digsig}{\RequirePackage{eforms}}{}

% add authors information after thebibliography
\AfterEndEnvironment{thebibliography}{%
	\ifbool{rev}{}{%
		\vskip1.5em%
				\small\auth@data
		\ifbool{digsig}{%
			\sigField{mySig}{3in}{4\baselineskip}
		}{}
	}
}