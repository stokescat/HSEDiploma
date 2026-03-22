\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HSEDiplomaPrintable}[2026/03/22 Printable version with black links]

% Загружаем основной класс
\LoadClass{HSEDiploma}

% Перенастраиваем гиперссылки на чёрный цвет
\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	urlcolor=black,
	citecolor=black
}
