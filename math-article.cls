\ProvidesClass{math-article}[2025/05/11 LaTeX class for math papers]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt]{article}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

%%%%%%%%%%%%%%%% general imports  %%%%%%%%%%%%%%%%
\usepackage{amsmath,amsthm,amsfonts,amssymb} % base math packages
\usepackage[left=2.5cm, right=2.5cm, bottom=2.5cm]{geometry}
\usepackage{mathtools, xparse, xspace, ragged2e} % required internally
% some useful imports
\usepackage[onehalfspacing]{setspace}
\usepackage{bm}
\usepackage{graphicx}
\usepackage{tikz}

%%%%%%%%%%%%%%%% general definitions %%%%%%%%%%%%%
\newcommand{\R}{\mathbb{R}} % real numbers
\newcommand{\N}{\mathbb{N}} % natural numbers
\newcommand{\Z}{\mathbb{Z}} % whole numbers
\newcommand{\C}{\mathbb{C}} % complex numbers
\newcommand{\Q}{\mathbb{Q}} % rational
\DeclarePairedDelimiterX\Set[2]{\lbrace}{\rbrace}%
 { #1 \,\delimsize|\, #2 } % http://tex.stackexchange.com/questions/13634/define-pretty-sets-in-latex-esp-how-to-do-the-condition-separator
 \DeclarePairedDelimiter\abs{\lvert}{\rvert}
% Algorithm runtimes start
\renewcommand{\O}[1]{\mathrm{O}(#1)}
\renewcommand{\o}[1]{\mathrm{o}(#1)}
\newcommand{\BigO}[1]{\mathcal{O}(#1)}
\newcommand{\BigOmega}[1]{\Omega(#1)}
\newcommand{\SmallOmega}[1]{\omega(#1)}
% Algorithm runtimes ends
\newcommand{\limn}{\lim \limits_{n \rightarrow \infty} } % shortcut for limits
\newcommand{\opt}{\ensuremath{L^*}\xspace} % optimal solution for a problem
\ExplSyntaxOn % custom intervals
\cs_new_protected:Nn \interval_dispatch:nnn {
    \str_case:nnF {#1} {
        {oo}{\ensuremath\left( #2, #3 \right)}
        {cc}{\ensuremath\left[ #2, #3 \right]}
        {oc}{\ensuremath\left( #2, #3 \right]}
        {co}{\ensuremath\left[ #2, #3 \right)}
    }{
        \ClassError{custom-interval}{Invalid Interval Parameters}{Possible\space Options\space for\space interval:\space oo,\space cc,\space oc,\space co}
        #2, #3
    }
}
\NewDocumentCommand{\interval}{O{cc}mm}{
    \interval_dispatch:nnn {#1} {#2} {#3}
}
\ExplSyntaxOff
%%%%%%%%%%%%%%%% custom  flavor   %%%%%%%%%%%%%%%%
% color \emph blue-violet start
\usepackage{color,xcolor,graphicx,overpic}
\definecolor{Emph}{rgb}{0.2,0.2,0.8}
\renewcommand{\emph}[1]{\textcolor{Emph}{\bf{#1}}}
\newcommand{\Emph}[1]{\textcolor{Emph}{#1}}
% color \emph blue-violet end
\newcommand{\TODO}[1]{\textcolor{orange}{TODO: #1}} % color todos orange
\newcommand{\mktitle}[2]{ % alternative maketitle to be consistent with previous submissions
    \begin{center}
        \scalebox{2.5}{\textbf{#1}} \\
        \vspace*{\baselineskip}
        Submitted by \\ #2
    \end{center}
    \hrule
}

%%%%%%%%%%%%%%%% document start %%%%%%%%%%%%%%%%%%
\AtBeginDocument{
    \RaggedRight
}
