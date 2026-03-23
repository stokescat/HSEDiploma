\NeedsTeXFormat{LaTeX2e} \ProvidesClass{HSEDiploma}
% Класс предоставляет оформление дипломной работы как того требует ВШЭ 
% ну или почти, лол )))))

% Базовый класс
\LoadClass[a4,12pt]{article}

% Пакеты для работы с русским языком
\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{hyphenat} % Для правильных переносов

% Пакет для настройки полей по ГОСТ
\RequirePackage[
	left=3cm,    		% 30mm
	right=1cm,   		% 10mm
	top=2cm,     		% 20mm
	bottom=2cm,  	% 20mm
]{geometry}


% Настройки для агрессивных переносов
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000


% Полуторный межстрочный интервал (коэффициент 1.5)
\RequirePackage{setspace}
\onehalfspacing

% Отступ в абзаце
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm} % ГОСТ 1.25 см

\RequirePackage{microtype}

% Настройка подписей рисунков и таблиц
\RequirePackage{caption}
\captionsetup{
	font={small, it},
	justification=centering,
	labelsep=period,
	skip=5pt
}
% Явное указание положения подписей
\captionsetup[table]{position=top, justification=raggedright, singlelinecheck=off}
\captionsetup[figure]{position=bottom}


% Подписи к рисункам
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}
% Подписи к таблицам
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}


% Содержание
\renewcommand{\contentsname}{Содержание}
\setcounter{tocdepth}{2} % до subsection

% Переопределение \tableofcontents для пустого стиля страницы
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\newpage
	\thispagestyle{empty}
	\oldtableofcontents
}

% Для корректного отображения URL-ссылок
\RequirePackage{url}

% Листинги
\RequirePackage{listings}
\RequirePackage[dvipsnames]{xcolor} % Для подсветки синтаксиса
\RequirePackage{float}





% ГОСТ-настройки листингов
\DeclareCaptionLabelFormat{gostcaption}{Листинг #2} % Формат "Листинг X"
\captionsetup[lstlisting]{
	labelformat=gostcaption,
	 justification=raggedright,
	 position=top,
	singlelinecheck=false,
	font={small,it},
	skip=5pt
}

\lstset{
	basicstyle=\ttfamily,
	escapeinside={(*@}{@*)}, % Определяем escape-последовательность
	% Другие настройки...
}

% Стиль кода по ГОСТ
\lstset{
	language=C,
	basicstyle=\ttfamily\small,
	moredelim=[is][\color{red}]{@-}{-@}, % Маркеры @-...-@ для git-нотации
	moredelim=[is][\color{ForestGreen}]{@+}{+@}, % Маркеры @+...+@ для git-нотации
	numbers=left,
	numberstyle=\tiny\color{gray},
	stepnumber=1,
	numbersep=8pt,
	frame=single,
	rulecolor=\color{black},
	tabsize=4,
%	captionpos=b,
	breaklines=true,
	postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{red}\hookrightarrow\space}},
	extendedchars=true,
	inputencoding=utf8,
	showspaces=false,
	showstringspaces=false,
	backgroundcolor=\color{white},
	keywordstyle=\color{blue}\bfseries,
	commentstyle=\color{red},
	stringstyle=\color{red}
}


\RequirePackage{hyperref}

\hypersetup{
	colorlinks=true,
	linkcolor=blue,  
	urlcolor=blue,
	citecolor=blue
}



% Настройка заголовков
\RequirePackage{titlesec}
\titleformat{\section}{\normalsize\bfseries\centering}{\thesection}{1em}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{1em}{}
\titlespacing*{\section}{0pt}{\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsection}{0pt}{\baselineskip}{0.5\baselineskip}

% Убираем разрыв страницы после заголовков
\newcommand{\sectionbreak}{\clearpage}
\newcommand{\subsectionbreak}{}

% Redefine the Bibliography to deal with a bookmarking issues
\let\TEMPbibliography\bibliography
\renewcommand{\bibliography}[1]{
	\addcontentsline{toc}{section}{Список литературы}
	\TEMPbibliography{#1}
}

%
% ПЕРЕМЕННЫЕ ШАБЛОНА
%

\RequirePackage{etoolbox}

\newcommand{\TheFaculty}{Факультет неизвестных наук}
\newcommand{\TheMajor}{00.00.00 Неизвестная специальность}
\newcommand{\TheProgram}{<<Неизвестная программа>>}

\newcommand{\TheThemeRus}{Очень крутая тема}
\newcommand{\TheThemeEng}{Very cute theme}

\newcommand{\TheStudent}{Пупкин Василий Григорьевич}
\newcommand{\TheStudentEng}{Pupkin Vasiliy Grigorevich}
\newcommand{\TheStudentShort}{В. Г. Пупкин}

% Полное имя научника
\newcommand{\TheSupervisor}{}
% Приставка с должностью, званием и т.д.
\newcommand{\TheSupervisorPrefix}{}

% Полное имя соруководителя
\newcommand{\TheCovisor}{}
\newcommand{\TheCovisorPrefix}{}

% Полное имя консультанта
\newcommand{\TheConsultant}{}
\newcommand{\TheConsultantPrefix}{}

% Полное имя рецензента
\newcommand{\TheReviewer}{}
% Приставка с должностью, званием и т.д.
\newcommand{\TheReviewerPrefix}{}

\newcommand{\TheCity}{Москва}
\newcommand{\TheYear}{2026}

% Титульная страница
\renewcommand{\titlepage}{
	\setcounter{page}{1}
	\thispagestyle{empty}
	\begin{center}
		\textbf{ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ \\ 
				УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ \\
				<<НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ  \\
				«ВЫСШАЯ ШКОЛА ЭКОНОМИКИ» \\}
		\textbf{\TheFaculty} \\
		
		\vspace{1cm}
		\underline{\TheStudent} \\
		\vspace{1cm}
		МАГИСТЕРСКАЯ ДИССЕРТАЦИЯ \\
		\textbf{\textsc{\TheThemeRus}}\\
		\textbf{\textsc{\TheThemeEng}}\\
		\vspace{1cm}
		по направлению подготовки \underline{\TheMajor} \\
		образовательная программа \underline{\TheProgram}\\
		\vspace{1.5cm}
		
		\begin{tabular}{p{0.50\textwidth}r}
			
			\ifdefempty{\TheStudentShort}{}{%
				Студент & \\
				\TheStudentShort & \\ [0.5cm]
			}
			
			\ifdefempty{\TheSupervisor}{}{%
				& Научный руководитель \\
				& \ifdefempty{\TheSupervisorPrefix}{\TheSupervisor}{\TheSupervisorPrefix} \\
				& \ifdefempty{\TheSupervisorPrefix}{}{\TheSupervisor} \\  [0.5cm]
			}
			
			\ifdefempty{\TheCovisor}{}{%
				& Соруководитель \\
				& \ifdefempty{\TheCovisorPrefix}{\TheCovisor}{\TheCovisorPrefix} \\
				& \ifdefempty{\TheCovisorPrefix}{}{\TheCovisor} \\ [0.5cm]
			}

			\ifdefempty{\TheConsultant}{}{%
				& \textbf{Научный консультант} \\
				& \ifdefempty{\TheConsultantPrefix}{\TheConsultant}{\TheConsultantPrefix} \\
				& \ifdefempty{\TheConsultantPrefix}{}{\TheConsultant} \\ [0.5cm]
			}
			
		\end{tabular}
	
		\vfill
		\TheCity, \TheYear
		
	\end{center}

}


\newenvironment{abstractpagerus}{%
	\newpage
	\thispagestyle{empty} % Отключаем колонтитулы для страниц аннотации
	\begin{center}
		{\large \textbf{АННОТАЦИЯ}} \\
		\vspace{0.25cm}
		\TheThemeRus \\
		\textit{\TheStudent}
	\end{center}
}{%

}

\newenvironment{abstractpageeng}{%
	\newpage
	\thispagestyle{empty} % Отключаем колонтитулы для страниц аннотации
	\begin{center}
		{\large \textbf{ABSTRACT}} \\
		\vspace{0.25cm}
		\TheThemeEng \\
		\textit{\TheStudentEng}
	\end{center}
}{%
	
}
