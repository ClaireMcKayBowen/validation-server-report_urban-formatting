% Urban Institute Short Report Formatting for LaTeX
%
% Based on the Urban Institute's formatting standards for short reports.
%
% Future projects will include declaring options to create other Urban
% styles such as long reports, briefs, and white paper.
%
% ==============================
% Copyright 2021 Claire McKay Bowen, Ph.D.
%
% This work consists of the files:
% INCLUDE FULL LIST ONCE MADE!
%
% ==============================

% Notes -----------------------------------
% \newcommand defines a new command, and makes an error if it is already defined.
% \renewcommand redefines a predefined command, and makes an error if it is not yet defined.
% \providecommand defines a new command if it isn't already defined.

% \newcommand{<name>}[<args>]{ <code> }
% \fontsize{10}{12}\selectfont (the first number is the pt size of the font, the second number the space in pts between lines: this becomes the value of \baselineskip

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Meta Data and Defaults %%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{urban-formatting}
\LoadClass[twoside]{article} 
\usepackage[top = 1.13in, left = 1.13in, bottom = 1.2in, right = 1.13in, paperheight = 11in, paperwidth = 8.5in]{geometry}

% Packages -----------------------------------
\RequirePackage{% Default
    array, % Table Column Width
    caption, % Figure/Table Caption Formatting
    color, % Color text
    csquotes, % Typesets quotes
    endnotes, % Footnote Formatting
    enumitem, % Itemize Formatting
    fancyhdr, % Header/Footer Formatting
    graphicx, % Figure package
    multicol, % Create Multi-columns
    multirow, % Create Multi-rows
    pdfpages, % Insert pdfs
    scrextend, % Adding margin
    setspace, % Line Spacing
    soul, % Letter Spacing
    subcaption, % Figure/Table Subaption Formatting
    tabularx, % Table Management
    titlesec, % Change Formatting
    tocloft, % For ToC Formatting
    xcolor % Defining new colors
}

% Color Box for footers, headers, etc.
\RequirePackage[most]{tcolorbox}
% Absolute positioning of images (e.g., title page footer image)
\RequirePackage[absolute]{textpos}
% Chicago Reference
\RequirePackage[authordate, autocite = inline, backend = biber, isbn = false, natbib]{biblatex-chicago}
% Colored URL
\usepackage[colorlinks = true,
            linkcolor = black,
            urlcolor  = urban-url,
            citecolor = black,
            anchorcolor = black]{hyperref}

% Urban Colors -----------------------------------
\definecolor{urban-cyan}{HTML}{00aeef}
\definecolor{urban-blue}{HTML}{1696d2}
\definecolor{urban-url}{HTML}{0a4c6a}
\definecolor{urban-gold}{HTML}{ffb918}
\definecolor{urban-gray}{HTML}{9d9fa2}
\definecolor{urban-darkgray}{HTML}{5c5859}
\definecolor{urban-footergray}{HTML}{c6c6c6}
\definecolor{urban-lightgray}{HTML}{d9d9d9}

% General Formatting -----------------------------------
\renewcommand{\baselinestretch}{1.5} % Single spacing
\raggedright % Left justified
\setlength{\parindent}{0.25in} % Paragraph indents
\setlength{\parskip}{9pt} % Paragraph spacing
\setcounter{tocdepth}{2} % TOC listing depth
\setcounter{secnumdepth}{-1} % Suppressing numbering on sections
\let\footnote=\endnote % Changing footnotes to endnotes
\setlength{\unitlength}{1in} % Setting unit length for creating the footers
% Fixing the hyphenation issues
\emergencystretch=\maxdimen
\hyphenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Header/Footer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Urban Gray Bar
\tcbset{
    frame code = {}
    center title,
    left = 0pt,
    right = 0pt,
    top = 5pt,
    bottom = 5pt,
    colback = urban-lightgray,
    colframe = white,
    width=\dimexpr\textwidth\relax,
    enlarge left by=0mm,
    boxsep = 5pt,
    arc=0pt,outer arc=0pt,
}
\pagestyle{fancy}

% Clear the header and remove horizontal line
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title Formatting
\renewcommand{\cfttoctitlefont}{\color{urban-blue}\fontsize{28}{0}\selectfont}

% Font Style
\renewcommand{\cftsecfont}{\fontsize{11}{0}\selectfont}
\renewcommand{\cftsubsecfont}{\fontsize{10}{0}\selectfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftdot}{}

% Indents
\cftsetindents{section}{0.2in}{0.5in}
\cftsetindents{subsection}{0.4in}{0.5in}

% Spacing
\setlength{\cftbeforeloftitleskip}{0in}
\setlength{\cftbeforepartskip}{16pt}
\setlength{\cftbeforesecskip}{8pt}
\setlength{\cftbeforesubsecskip}{8pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bullets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spacing between bullet and text
\setlist[itemize, 1]{leftmargin = 0.5in, labelsep = 4.5mm}
\setlist[enumerate, 1]{leftmargin = 0.5in, labelsep = 3mm}

\setlist[enumerate, 2]{label=\alph*.}

% Blue Square Bullet
\newcommand{\squarebullet}{\textcolor{urban-blue}{\raisebox{.5ex}{\rule{0.7ex}{0.7ex}}}}
\renewcommand{\labelitemi}{\squarebullet}

% Double arrow bullet
\newcommand{\doublearrow}{\fontseries{mb}\selectfont >>}
\renewcommand{\labelitemii}{\doublearrow}

% Spacing between items
\setlist{nosep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Quote %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\quoteblock}[1]{
    \begin{addmargin}[0.5in]{0in}
        #1
    \end{addmargin}
}

% Block Text Style Formatting
\newcommand{\block}[1]{%
    {%
        \begin{addmargin*}[0.5in]{0pt}
            \fontsize{9}{0}%
            \selectfont%
            \noindent%
            #1%
        \end{addmargin*}
    }%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault} % Family Font as Lato
% https://tug.org/FontCatalogue/lato/

% Title Call
\def\title#1{\gdef\@title{#1}\gdef\THETITLE{#1}}

% To be filled
\newcommand{\tbf}{\textcolor{red}}%

% Defining set fonts
\def\normalsize{\fontsize{10}{12}}% 18 to 12 (divide by 1.5 spacing)
\def\enotesize{\fontsize{9}{9}}

% Part Formatting
\titleformat{\part}[display]{\color{urban-blue}}{\thepart}{}{\fontsize{28}{21}\selectfont}% 32 to 21 (divide by 1.5 spacing)
\titlespacing*{\part}{0pt}{-28pt}{0pt}%

% Section Formatting
\titleformat{\section}[display]{}{}{}{\fontsize{18}{16}\selectfont}% 24 to 16 (divide by 1.5 spacing)
\titlespacing*{\section}{0pt}{21pt}{4pt}% 32 to 21, 6 to 4 (divide by 1.5 spacing)

% Subsection Formatting
\titleformat{\subsection}[display]{\bfseries}{}{}{\fontsize{12}{18}\selectfont}%
\titlespacing*{\subsection}{0pt}{12pt}{4pt}% 18 to 12, 6 to 4 (divide by 1.5 spacing)

% Subsubsection Formatting
\titleformat{\subsubsection}[display]{\bfseries\color{urban-gray}}{}{0em}{\fontsize{10}{12}\selectfont\MakeUppercase}% 18 to 12, 6 to 4 (divide by 1.5 spacing)
\titlespacing*{\subsubsection}{0pt}{8pt}{0pt}% 12 to 8 (divide by 1.5 spacing)

% fourthsub Formatting
\newcommand\fourthsub[1]{%
    {%
        \fontsize{10}{0}%
        \fontseries{b}%
        \textit{#1}%
        \selectfont%
    }%
}%

% Policy Center Formatting
\newcommand\policycenter[1]{%
    {%
        \fontsize{8}{0}%
        \fontseries{eb}%
        \selectfont%
        \noindent%
        \textcolor{urban-darkgray}{\MakeUppercase{\so{#1}}}%
    }%
}%

% Title Report Formatting
\newcommand\titlereport[1]{%
    {%
        \fontsize{30}{38}%
        \fontseries{l}%
        \selectfont%
        \noindent#1%
    }%
}%

% Report Subtitle Formatting
\newcommand\reportsubtitle[1]{%
    {%
        \fontsize{14}{18}%
        \fontseries{b}%
        \selectfont%
        \noindent
        \textcolor{urban-blue}{#1}%
    }%
}%

% Author Name Formatting
\newcommand\authorfont[1]{%
    \fontsize{11.5}{14}%
    \selectfont%
    \noindent%
    \textit{#1}%
}%

% Author Affiliation Formatting
\newcommand\affiliationfont[1]{%
    \fontsize{7.5}{7.5}%
    \selectfont%
    \noindent%
    \MakeUppercase{#1}%
}%

% Date Formatting
\newcommand\datefont[1]{%
    \fontsize{11.5}{7}%
    \selectfont%
    \noindent\textcolor{urban-darkgray}{\textit{#1}}%
}%

% About Urban Formatting
\newcommand\about[1]{%
    {%
        \fontsize{10}{18}%
        \fontseries{b}%
        \selectfont%
        \noindent
        \textcolor{urban-blue}{\MakeUppercase{\so{#1}}}%
    }%
}%

% Boiler Plate Formatting
\newcommand*{\boilerplate}[1]{%
    \begin{singlespace}
        {\fontsize{9}{12}%
        \selectfont%
        \noindent#1}%
    \end{singlespace}
}%

% Chapter Intro Para Formatting
\newcommand{\intropara}[1]{%
    {%
        \fontsize{11.5}{0}%
        \selectfont%
        \textbf{#1}%
    }%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figures and Tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% New commands to manually adjust table widths
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% setting the column space to 0
\setlength{\tabcolsep}{0pt}

% Source/Notes Formatting
\newcommand{\source}[1]{%
    {%
        \fontsize{8}{0}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

% Heading Title
\newcommand{\tabheader}[1]{%
    {%
        \fontsize{9.5}{0}%
        \fontseries{b}%
        \selectfont%
        \noindent%
        #1%
    }%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Notes and References %%%%%%%%%%%%%%%%%%%%%%%%%%
% Endnote font size
\renewcommand\enotesize{\fontsize{9}{9}\selectfont}

% Mark with no indent and hanging indent
\renewcommand\enoteformat{%
   \noindent\theenmark\hspace{0.1in}\ \hangindent 0.85\parindent%
}

% Reference font formatting
\renewcommand*{\bibfont}{\fontsize{9}{9}\selectfont}

% Hanging indent
\setlength{\bibhang}{0.15in}

% Changing et al
\DefineBibliographyStrings{english}{andothers={and colleagues}}