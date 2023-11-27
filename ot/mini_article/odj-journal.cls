%%
%% This is file `odj-journal.cls'.
%%
%% ----------------------------------------------------------------
%% odj-journal --- Support for submissions to Cambridge University 
%%   Press journals
%% Email: paul.gessler@overleaf.com
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{odj-journal}
  [2022/10/11 v1.01 Submission to odj journals]
\LoadClass[10pt,letter,twoside]{article}
% Style the sectioning elements:
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus.2ex}%
  {\sffamily\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\sffamily\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\sffamily\itshape}} 
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\sffamily}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\sffamily}}
\def\@hangfrom#1{\setbox\@tempboxa\hbox{{#1}}%
  \hangindent 0pt%\wd\@tempboxa
  \noindent\box\@tempboxa}
\RequirePackage{lastpage} % For getting the last page in the first page header
\RequirePackage{enumitem} % For list styling
\setlist{noitemsep,leftmargin=\parindent}
\RequirePackage[online]{threeparttable} % For table notes
\let\TPTnoteSettingsOrig\TPTnoteSettings
\def\TPTnoteSettings{\TPTnoteSettingsOrig\scriptsize}
\RequirePackage{endnotes}
\newcommand*{\printendnotes}{%
  \def\enoteformat{\rightskip=0pt \leftskip=0pt \parindent=0pt \makeenmark}
  \def\makeenmark{\bgroup\bfseries\theenmark\enspace\egroup}
  \theendnotes
}
%%
\newcommand*\odj@warning{\ClassWarning{odj-journal}}
\newcommand*\odj@ifundefined[1]{%
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname #1\endcsname\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\RequirePackage{xkeyval}
\newcommand*\odj@keyval@bool[2]{%
  \odj@ifundefined{odj@#1#2}{%
    \odj@warning{Unknown option `#2' for key #1}%
  }{%
    \@nameuse{odj@#1#2}%
  }%
}
\newif\ifodj@abbreviations
\newif\ifodj@jel
\newif\ifodj@msc
\newif\ifodj@dates
\newif\ifodj@copyright
\newif\ifodj@articletitle
\newif\ifodj@chaptertitle
\newif\ifodj@email
\newif\ifodj@hyperref
\newif\ifodj@keywords
\newif\ifodj@super
\newif\ifodj@simfonts
\define@key{odj}{abbreviations}[true]{%
  \odj@keyval@bool{abbreviations}{#1}%
}
\define@key{odj}{jel}[true]{%
  \odj@keyval@bool{jel}{#1}%
}
\define@key{odj}{msc}[true]{%
  \odj@keyval@bool{msc}{#1}%
}
\define@key{odj}{suppmat}[true]{%
  \odj@keyval@bool{suppmat}{#1}%
}
\define@key{odj}{suppdata}[true]{%
  \odj@keyval@bool{suppdata}{#1}%
}
\define@key{odj}{orcid}[true]{%
  \odj@keyval@bool{orcid}{#1}%
}
\define@key{odj}{ack}[true]{%
  \odj@keyval@bool{ack}{#1}%
}
\define@key{odj}{contrib}[true]{%
  \odj@keyval@bool{contrib}{#1}%
}
\define@key{odj}{financial}[true]{%
  \odj@keyval@bool{financial}{#1}%
}
\define@key{odj}{conflicts}[true]{%
  \odj@keyval@bool{conflicts}{#1}%
}
\define@key{odj}{ethics}[true]{%
  \odj@keyval@bool{ethics}{#1}%
}
\define@key{odj}{dates}[true]{%
  \odj@keyval@bool{dates}{#1}%
}
\define@key{odj}{copyright}[true]{%
  \odj@keyval@bool{copyright}{#1}%
}
\define@key{odj}{articletitle}[true]{%
  \odj@keyval@bool{articletitle}{#1}%
}
\define@key{odj}{chaptertitle}[true]{%
  \odj@keyval@bool{chaptertitle}{#1}%
}
\define@key{odj}{email}[true]{%
  \odj@keyval@bool{email}{#1}%
}
\define@key{odj}{hyperref}[true]{%
  \odj@keyval@bool{hyperref}{#1}%
}
\define@key{odj}{keywords}[true]{%
  \odj@keyval@bool{keywords}{#1}%
}
\define@key{odj}{super}[true]{%
  \odj@keyval@bool{super}{#1}%
}
\define@key{odj}{usetitle}[true]{%
  \odj@keyval@bool{articletitle}{#1}%
}
\define@key{odj}{simfonts}[true]{%
  \odj@keyval@bool{simfonts}{#1}%
}
\newcommand*\odj@journal{jodjat}
\newcommand*\odj@doi{\odj@warning{No DOI provided}}
\newcommand*\odj@layout{traditional}
\newcommand*\odj@manuscript{article}
\newcommand*\odj@year{\odj@warning{No year provided}}
\newcommand*\odj@vol{\odj@warning{No volume provided}}
\newcommand*\odj@maxauthors{15}
\define@key{odj}{journal}{%
  \def\odj@journal{#1}%
}
\define@key{odj}{layout}{%
  \def\odj@layout{#1}%
}
\define@key{odj}{manuscript}{%
  \AtBeginDocument{\def\odj@manuscript{#1}}%
}
\define@key{odj}{year}{%
  \def\odj@year{#1}%
}
\define@key{odj}{volume}{%
  \def\odj@vol{#1}%
}
\ProcessOptionsX*<odj>
\newcommand*\odj@manuscript@communication{communication}
\newcommand*\odj@manuscript@letter{letter}
\newcommand*\odj@manuscript@note{note}
\newcommand*\odj@manuscript@review{review}
\newcommand*\odj@manuscript@suppinfo{suppinfo}
\setkeys{odj}{
  articletitle,
  super,
  % dates,
  % copyright,
  abbreviations,
  jel,
  msc,
  keywords,
  simfonts
}
% Approximations of commercial fonts:
\newcommand{\simfonts}{%
  \RequirePackage[scaled=0.97]{fbb}
  \RequirePackage[semibold]{sourcesanspro}
  \RequirePackage{sansmath}
  \RequirePackage[italic,eulergreek]{mathastext}
}
\RequirePackage{geometry}
\RequirePackage{changepage}
\RequirePackage{stringstrings}
\RequirePackage[absolute]{textpos}
\RequirePackage[table,svgnames]{xcolor}
\RequirePackage{
  caption,
  floatrow,
  graphicx,
  url,
  mdframed,
  mfirstuc,
%   footmisc,
  alphalph
}
\urlstyle{same}
\captionsetup{
  font={
    footnotesize,
    sf,
%    sansmath
  },
  labelfont=bf,
  labelsep=period
}
\floatsetup{
  font={
    sf,
%    sansmath,
    footnotesize
  }
}
\colorlet{structure@color}{black}
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
   {\csname the#1\endcsname\quad}%  default
   {\csname #1@cntformat\endcsname}% individual control
   }
   \def\section@cntformat{\thesection.\quad}
\renewcommand\appendix{\par
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \gdef\thesection{Appendix \@arabic\c@section}
}
\newmdenv[backgroundcolor=structure@color!15,hidealllines=true,leftmargin=3mm,rightmargin=3mm,innertopmargin=2mm,innerbottommargin=3mm,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=3mm,frametitlebelowskip=0mm]{odj@abstract@box}
\let\abstract@org\abstract
\def\abstract{\odj@abstract@box\small}
\def\endabstract{\endodj@abstract@box}
\ifodj@hyperref
  \expandafter\RequirePackage
\else
  \expandafter\@gobble
\fi
  {hyperref}
\renewcommand*{\title}[2][]{%
  \gdef\odj@title@short{#1}%
  \gdef\@title{#2}%
  \ifx\odj@title@short\@empty
    \global\let\odj@title@short\@title
  \fi
}
\@onlypreamble\title
\newcount\odj@author@cnt
\newcount\odj@affil@cnt
\newcount\odj@affil@alt@cnt
\newcount\odj@footnote@cnt
\newcount\odj@affil@marker@cnt
\def\author#1{%
  \global\advance\odj@author@cnt\@ne\relax
  \expandafter\gdef\csname @author@\@roman\odj@author@cnt\endcsname{#1}%
  \begingroup
    \advance\odj@affil@cnt\@ne
    \expandafter\xdef\csname @author@affil@\@roman
      \odj@author@cnt\endcsname
      {\the\odj@affil@cnt}%
  \endgroup
}
\@onlypreamble\author
\def\and{%
  \odj@warning{%
    \string\and\space not used by the odj-journal class: please see
    the\MessageBreak package documentation for details%
  }%
}
\def\thanks{%
  \odj@warning{%
    \string\thanks\space not used by the odj-journal class: please see
    the\MessageBreak the package documentation for details%
  }%
}
\newcommand*\affiliation[2][\relax]{%
  \ifnum\odj@author@cnt>\z@\relax
    \odj@affil@ifdup{#2}{%
      \odj@affil@swap{#2}%
    }{%
      \global\advance\odj@affil@cnt\@ne\relax
      \expandafter\gdef\csname @address@\@roman\odj@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\odj@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\odj@affil@cnt\endcsname
          {#1}%
      \fi
    }%
  \else
    \odj@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\affiliation
\newcommand*\odj@affil@ifdup[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempswafalse
    \@tempcnta\z@\relax
    \odj@affil@ifdup@aux
    \if@tempswa
      \aftergroup\@firstoftwo
    \else
      \aftergroup\@secondoftwo
    \fi
  \endgroup
}
\newcommand*\odj@affil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @address@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\odj@affil@cnt\relax
      \expandafter\expandafter\expandafter\odj@affil@ifdup@aux
    \fi
  \fi
}
\newcommand*\odj@affil@swap[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \odj@affil@ifdup@aux
    \advance\odj@affil@cnt\@ne\relax
    \odj@affil@swap@aux
  \endgroup
}
\newcommand*\odj@affil@swap@aux{%
  \advance\@tempcntb\@ne\relax
  \expandafter\ifnum\csname @author@affil@\@roman\@tempcntb\endcsname
    = \odj@affil@cnt\relax
    \expandafter\xdef\csname @author@affil@\@roman\@tempcntb\endcsname{%
      \the\@tempcnta
    }%
  \fi
  \ifnum\@tempcntb<\odj@author@cnt\relax
    \expandafter\odj@affil@swap@aux
  \fi
}
\newcommand*\alsoaffiliation[2][\relax]{%
  \ifnum\odj@author@cnt>\z@\relax
    \odj@affil@ifdup{#2}{%
      \odj@alsoaffil@find{#2}%
    }{%
      \global\advance\odj@affil@cnt\@ne\relax
      \@tempcnta\odj@affil@cnt\relax
      \expandafter\gdef\csname @address@\@roman\odj@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\odj@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\odj@affil@cnt\endcsname
          {#1}%
      \fi
    }%
    \@ifundefined{@author@alsoaffil@\@roman\odj@author@cnt}{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\odj@author@cnt
        \endcsname{\the\@tempcnta}%
    }{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\odj@author@cnt
        \endcsname{%
        \csname @author@alsoaffil@\@roman\odj@author@cnt\endcsname
        ,\the\@tempcnta
      }%
    }%
  \else
    \odj@warning{Affiliation with no author}%
  \fi
}
\newcommand*\odj@alsoaffil@find[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \odj@affil@ifdup@aux
  \expandafter\endgroup
  \expandafter\@tempcnta\the\@tempcnta\relax
}
\newcommand*\altaffiliation[1]{%
  \ifnum\odj@author@cnt>\z@\relax
    \begingroup
      \odj@altaffil@ifdup{#1}{%
        \expandafter\xdef\csname @author@altaffil@\\odj@author@cnt
          \endcsname{\the\@tempcnta}%
      }{%
        \global\advance\odj@affil@alt@cnt\@ne\relax
        \expandafter\gdef\csname @altaffil@\\odj@affil@alt@cnt
          \endcsname{#1}%
        \expandafter\xdef\csname @author@altaffil@\@roman\odj@author@cnt
          \endcsname{\the\odj@affil@alt@cnt}%
      }%
    \endgroup
  \else
    \odj@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\altaffiliation
\newcommand*\odj@altaffil@ifdup[1]{%
  \def\@tempa{#1}%
  \@tempswafalse
  \@tempcnta\z@\relax
  \ifnum\odj@affil@alt@cnt>\z@\relax
    \expandafter\odj@altaffil@ifdup@aux
  \fi
  \if@tempswa
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\newcommand*\odj@altaffil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @altaffil@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\odj@affil@alt@cnt\relax
      \expandafter\expandafter\expandafter\odj@altaffil@ifdup@aux
    \fi
  \fi
}
\newcommand*\email[2][]{%
  \ifnum\odj@author@cnt>\z@\relax
    \odj@emailtrue%
    \expandafter\gdef\csname @emailname@\@roman\odj@author@cnt\endcsname
      {#1}%
    \expandafter\gdef\csname @email@\@roman\odj@author@cnt\endcsname
      {#2}%
  \else
    \odj@warning{E-mail with no author}%
  \fi
}
\@onlypreamble\email
\newcommand*\fax[1]{%
  \ifnum\odj@author@cnt>\z@\relax
    \expandafter\gdef\csname @fax@\@roman\odj@author@cnt\endcsname
      {#1}%
  \else
    \odj@warning{Fax number with no author}%
  \fi
}
\@onlypreamble\fax
\newcommand*\phone[1]{%
  \ifnum\odj@author@cnt>\z@\relax
    \expandafter\gdef\csname @phone@\@roman\odj@author@cnt\endcsname
      {#1}%
  \else
    \odj@warning{Phone number with no author}%
  \fi
}
\@onlypreamble\phone
\newcommand*\abbreviations[1]{%
  \gdef\@abbreviations{#1}%
}
\newcommand*\@abbreviations{}
\@onlypreamble\abbreviations
\newcommand*\keywords[1]{%
  \gdef\@keywords{#1}%
}
\newcommand*\@keywords{}
\@onlypreamble\keywords
\newcommand*\odj@abbreviations@print{%
  \ifx\@abbreviations\@empty\else
    {\noindent\bfseries Abbreviations: }
    \@abbreviations
    \par
  \fi
}
\newcommand*\jel[1]{%
  \gdef\@jel{#1}%
}
\newcommand*\@jel{}
\@onlypreamble\jel
\newcommand*\odj@jel@print{%
  \ifx\@jel\@empty\else
    {\noindent\bfseries JEL classification: }
    \@jel
    \par
  \fi
}
\newcommand*\msc[1]{%
  \gdef\@msc{#1}%
}
\newcommand*\@msc{}
\@onlypreamble\msc
\newcommand*\odj@msc@print{%
  \ifx\@msc\@empty\else
    {\noindent\bfseries MSC Codes: }
    \@msc
    \par
  \fi
}
\newcommand*\odj@keywords@print{%
  \ifx\@keywords\@empty\else
    {\noindent\bfseries Keywords: }
    \@keywords
    \par
  \fi
}
\newcommand*\doi[1]{\gdef\odj@doi{#1}}
\@onlypreamble\doi
\newcommand*\received[1] {\gdef\odj@recvd{#1}}
\newcommand*\revised[1]  {\gdef\odj@revd{#1}}
\newcommand*\accepted[1] {\gdef\odj@accptd{#1}}
\newcommand*\published[1]{\gdef\odj@publd{#1}}
\newlength\odj@space@pre@title
\setlength\odj@space@pre@title{1em}
\newlength\odj@space@post@title
\setlength\odj@space@post@title{1em}
\newlength\odj@space@post@author
\setlength\odj@space@post@author{0.5em}
\newlength\odj@space@post@address
\setlength\odj@space@post@address{0pt}
\newlength\odj@space@post@email
\setlength\odj@space@post@email{1.5em}
\newlength\odj@space@post@date
\setlength\odj@space@post@date{0.5em}
\newlength\odj@space@inter@extra
\setlength\odj@space@inter@extra{0.5em}
\newlength\odj@maketitle@width
\setlength\odj@maketitle@width{\textwidth}
\newcommand*\affilsize{\footnotesize}
\newcommand*\authorsize{\normalsize}
\newcommand*\emailsize{\footnotesize}
\newcommand*\titlesize{\LARGE}
\newcommand*\datesize{\footnotesize}
\newcommand*\firstheadsize{\scriptsize}
\newcommand*\affilfont{\footnotesize}
\newcommand*\authorfont{}
\newcommand*\emailfont{\footnotesize}
\newcommand*\emailsymbol{*}
\newcommand*\titlefont{\sffamily\bfseries\raggedright\color{structure@color}}
\newcommand*\datefont{\footnotesize}
\newcommand*\extrasfont{\footnotesize}
\newcommand*\abstractfont{\small}
\newcommand*\journalnamefont{\itshape}
\newcommand*\volumefont{\bfseries}
\newcommand*\odj@etal{\emph{et al.}}
\def\ps@plain{
  \renewcommand{\@oddhead}{\hfill{\journalnamefont\odj@journal@name}\qquad\thepage}%
  \renewcommand{\@evenhead}{\thepage\qquad\@author@i\space\odj@etal\hfill}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddfoot}{\@evenfoot}%
}
\pagestyle{plain}
\newcommand*\odj@copyright@notice{\scriptsize%
  \textcopyright\ Cambridge University Press \odj@year. 
  This is an Open Access article, distributed under the terms of the 
  Creative Commons Attribution licence (\url{http://creativecommons.org/licenses/by/4.0/}), 
  which permits unrestricted re-use, distribution, and reproduction in any medium, 
  provided the original work is properly cited.
}
\def\@maketitle{%
  \setlength\parindent{\z@}
  \ifnum\odj@author@cnt<\z@\relax
    \odj@warning{No authors defined: At least one author is required}%
  \fi
  \newpage\vspace*{\dimexpr-\headsep-\headheight\relax}
  \parbox[b]{\dimexpr\textwidth-26mm\relax}{%
    \firstheadsize{\journalnamefont\odj@journal@name} 
    (\odj@year), {\volumefont\odj@vol}, \thepage--\pageref{LastPage}
    \par% doi:{\odj@doi}
    }\hfill\includegraphics[width=26mm]{img/ub_logo.png}\par
  \vspace*{\baselineskip}
  {\sffamily\bfseries\color{structure@color}\MakeUppercase{\convertchar{\odj@manuscript}{-}{ }}\par}
  \vspace*{\odj@space@pre@title}%
        {%
          \titlefont
          \titlesize
          \let\@fnsymbol\odj@author@fnsymbol
          \let\footnote@org\footnote
          \let\footnote\odj@title@footnote
          \odj@maketitle@suppinfo \@title
          \odj@title@footnote@check
          \global\odj@footnote@cnt\c@footnote
          \@maketitle@title@hook
          \par
        }%
        \vspace*{\odj@space@post@title}%
        {%
          \authorsize
          \authorfont
          \frenchspacing
          \odj@author@list
          \par
        }%
        \vspace*{\odj@space@post@author}%
        {%
          \affilsize
          \affilfont
          \odj@address@list
          \par
        }%
        \vspace*{\odj@space@post@address}%
        {%
          \emailsize
          \emailfont
          \ifodj@email
            \expandafter\odj@contact@details
            \par
            \vspace*{\odj@space@post@email}%
          \fi
        }%
        {%
          \datesize
          \datefont
          \ifodj@dates
            (Received \odj@recvd; revised \odj@revd; accepted \odj@accptd)%; first published online \odj@publd)
            \vspace*{\odj@space@post@date}%
          \fi
          \ifodj@copyright
            \bgroup\let\thefootnote\relax
            \footnote{\odj@copyright@notice}
            \egroup
          \fi
        }%
}
\newcommand*\@maketitle@title@hook{}
\newcommand*\odj@maketitle@suppinfo{%
  \ifx\odj@manuscript\odj@manuscript@suppinfo
    Supporting Information:\\
  \fi
}
\newcommand*\odj@title@footnote[1]{%
  \footnotemark
  \g@addto@macro\@thanks{\footnotetext{#1}}%
}
\newcommand\odj@title@footnote@check{%
  \ifx\@thanks\@empty
  \else
    \begingroup
      \toks@=\expandafter{\@thanks}%
      \xdef\@thanks{%
        \begingroup
          \let\noexpand\@fnsymbol\noexpand\odj@author@fnsymbol
          \the\toks@
        \endgroup
      }%
    \endgroup
  \fi
}
\newcommand*\odj@contact@details{%
  { \emailsymbol{}Corresponding author. Email: \odj@email@list}%
  \odj@number@list
}
\let\@thanks\@empty
\newcommand*\odj@author@list{%
  \@tempcnta\z@\relax
  \ifnum\odj@author@cnt=\z@\relax\else
    \expandafter\odj@author@list@main
  \fi
}
\newcommand*\odj@author@footnotes{}
\newcommand*\odj@author@list@main{%
  \advance\@tempcnta\@ne\relax
  \def\odj@author@footnotes{}%
  \odj@author@list@and
  \space
  \@nameuse{@author@\@roman\@tempcnta}%
  \odj@author@list@comma
  \odj@author@star
  \odj@author@affil
  \odj@author@affil@also
  \odj@author@affil@alt
  \ifx\@empty\odj@author@footnotes\else
    \textsuperscript{\odj@author@footnotes}%
  \fi
  \ifnum\@tempcnta<\odj@author@cnt\relax
    \expandafter\odj@author@list@main
  \fi
}
\newcommand*\odj@author@list@and{%
  \ifnum\odj@author@cnt=\@ne\relax\else
    \ifnum\@tempcnta=\odj@author@cnt\relax
      \space and%
    \fi
  \fi
}
\newcommand*\odj@author@list@comma{%
  \ifnum\odj@author@cnt>\tw@\relax
    \ifnum\@tempcnta<\odj@author@cnt\relax
      ,%
    \fi
  \fi
}
\newcommand*\odj@author@star{%
  \odj@ifundefined{@email@\@roman\@tempcnta}{}{%
    \odj@author@star@aux
  }%
}
\newcommand*\odj@author@star@aux{%
  \protected@edef\odj@author@footnotes{%
    % \odj@author@fnsymbol{\z@}%
    \emailsymbol%
    \ifnum\odj@affil@cnt>\@ne\relax
      %,%
    \else
      \ifnum\odj@affil@alt@cnt>\z@\relax
        %,%
      \fi
    \fi
  }%
}
\newcommand*\odj@author@affil{%
  \odj@ifundefined{%
    @affil@\@roman\csname @author@affil@\@roman\@tempcnta\endcsname
  }{%
    \odj@warning{%
      No affiliation given for author\MessageBreak
      \@nameuse{@author@\@roman\@tempcnta}%
    }%
  }{%
    \odj@author@affil@aux
  }%
}
\newcommand*\odj@author@affil@aux{%
  \ifnum\odj@affil@cnt>\@ne\relax
    \expandafter\odj@affil@marker@cnt\csname @author@affil@\@roman
      \@tempcnta\endcsname\relax
    \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
    \protected@edef\odj@author@footnotes{%
      \odj@author@footnotes
      \odj@author@fnsymbol{\odj@affil@marker@cnt}%
    }%
  \else
    \ifnum\odj@affil@alt@cnt>\z@\relax
      \odj@affil@marker@cnt\@ne\relax
      \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
      \protected@edef\odj@author@footnotes{%
        \odj@author@footnotes
        \odj@author@fnsymbol{\odj@affil@marker@cnt}%
      }%
    \fi
  \fi
}
\newcommand*\odj@author@affil@also{%
  \odj@ifundefined{@author@alsoaffil@\@roman\@tempcnta}{}{%
    \odj@author@affil@also@aux
  }%
}
\newcommand*\odj@author@affil@also@aux{%
  \expandafter\@for\expandafter\@tempa\expandafter:\expandafter
    =\csname @author@alsoaffil@\@roman\@tempcnta\endcsname\do{%
    \odj@affil@marker@cnt\@tempa\relax
    \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
    \protected@edef\odj@author@footnotes{%
      \odj@author@footnotes
      %,%
      \odj@author@fnsymbol{\odj@affil@marker@cnt}%
    }%
  }%
}
\newcommand*\odj@author@affil@alt{%
  \odj@ifundefined{@author@altaffil@\@roman\@tempcnta}{}{%
    \odj@author@affil@alt@aux
  }%
}
\newcommand*\odj@author@affil@alt@aux{%
  \expandafter\odj@affil@marker@cnt
    \csname @author@altaffil@\@roman\@tempcnta\endcsname\relax
  \advance\odj@affil@marker@cnt\odj@affil@cnt\relax
  \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
  \protected@edef\odj@author@footnotes{%
    \odj@author@footnotes
    %,%
    \odj@author@fnsymbol{\odj@affil@marker@cnt}%
  }%
}
\newcommand*{\odj@author@fnsymbol}[1]{%
  \ensuremath{%
    \expandafter\odj@author@fnsymbol@aux\expandafter{\number#1}%
  }%
}
\newcommand*{\odj@author@fnsymbol@aux}[1]{%
  \ifnum#1>10 %
    \expandafter\odj@author@fnsymbol@loop
  \else
    \expandafter\odj@author@fnsymbol@symbol
  \fi
    {#1}%
}
\newcommand*{\odj@author@fnsymbol@loop}[1]{%
   \odj@author@fnsymbol@loop@aux@i#1%
}
\newcommand*{\odj@author@fnsymbol@loop@aux@i}[2]{%
  \odj@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}%
  \expandafter\odj@author@fnsymbol@loop@aux@ii\romannumeral #1000Q{}%
    {\odj@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}}%
}
\newcommand*{\odj@author@fnsymbol@loop@aux@ii}[1]{%
  \@nameuse{odj@author@fnsymbol@loop@aux@#1}%
}
\def\odj@author@fnsymbol@loop@aux@m#1Q#2#3{%
  \odj@author@fnsymbol@loop@aux@ii#1Q{#2#3}{#3}%
}
\newcommand*{\odj@author@fnsymbol@loop@aux@Q}[2]{#1}
\newcommand*{\odj@author@fnsymbol@symbol}[1]{%
  \ifcase #1 *\or
    \dagger\or
      \ddagger\or
        \P\or
          \S\or
            \|\or
              \bot\or
                \#\or
                  @\or
                    \triangle\or
                      \nabla
    \fi
}
\newcommand*\odj@address@list{%
  \ifnum\odj@affil@cnt>\z@
    \expandafter\odj@address@list@auxi
  \else
    \odj@warning{No affiliations: at least one affiliation is needed}%
  \fi
}
\newcommand*\odj@address@list@auxi{%
  \ifnum0%
    \ifnum\odj@affil@cnt>\@ne    1\fi
    \ifnum\odj@affil@alt@cnt>\z@ 1\fi
      >\z@
    \expandafter\odj@address@list@auxii
  \else
    \@address@i\par
  \fi
}
\newcommand*\odj@address@list@auxii{%
  \@tempcnta\z@
  \odj@affil@marker@cnt\odj@footnote@cnt
  \loop\ifnum\@tempcnta<\odj@affil@cnt
    \advance\@tempcnta\@ne
    \advance\odj@affil@marker@cnt\@ne
    \odj@author@fnsymbol{\odj@affil@marker@cnt}%
    \@nameuse{@address@\@roman\@tempcnta}\par% and % TODO handle multiples
  \repeat
  \@tempcnta\z@
  \loop\ifnum\@tempcnta<\odj@affil@cnt
    \advance\@tempcnta\@ne
    \advance\odj@affil@marker@cnt\@ne
    \odj@ifundefined{@altaffil@\@roman\@tempcnta}
      {}
      {%
        \odj@author@fnsymbol{\odj@affil@marker@cnt}%
        \@nameuse{@altaffil@\@roman\@tempcnta}\par
      }%
  \repeat
}
\newcommand*\odj@fnsymbol@org{}
\newcommand*\odj@affil@list{%
  \let\odj@fnsymbol@org\@fnsymbol
  \let\@fnsymbol\odj@author@fnsymbol
  \@tempcnta\z@\relax
  \@tempcntb\z@\relax
  \ifnum\odj@affil@cnt>\@ne\relax
    \expandafter\odj@affil@list@aux
  \else
    \ifnum\odj@affil@alt@cnt>\z@\relax
      \odj@affil@marker@cnt\@ne\relax
      \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
      \footnotetext[^\odj@affil@marker@cnt]{\@affil@i}%
      \@tempcnta\@ne\relax
    \fi
  \fi
  \ifnum\odj@affil@alt@cnt>\z@\relax
    \expandafter\odj@affil@alt@list
  \fi
  \let\@fnsymbol\odj@fnsymbol@org
}
\newcommand*\odj@affil@list@aux{%
  \advance\@tempcnta\@ne\relax
  \odj@affil@marker@cnt\@tempcnta\relax
  \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
  \footnotetext[\odj@affil@marker@cnt]{%
    \@nameuse{@affil@\@roman\@tempcnta}%
  }%
  \ifnum\@tempcnta<\odj@affil@cnt\relax
    \expandafter\odj@affil@list@aux
  \fi
}
\newcommand*\odj@affil@alt@list{%
  \advance\@tempcntb\@ne\relax
  \odj@ifundefined{@altaffil@\@roman\@tempcntb}{}{%
    \odj@altaffil@foot@aux
  }
  \ifnum\@tempcntb<\odj@author@cnt\relax
    \expandafter\odj@affil@alt@list
  \fi
}
\newcommand*\odj@altaffil@foot@aux{%
  \advance\@tempcnta\@ne\relax
  \odj@affil@marker@cnt\@tempcnta\relax
  \advance\odj@affil@marker@cnt\odj@footnote@cnt\relax
  \footnotetext[\odj@affil@marker@cnt]{%
    \@nameuse{@altaffil@\@roman\@tempcntb}%
  }%
}
\newcommand*\odj@email@list@font{}
\newcommand*\odj@email@list{%
  \begingroup
    \def\UrlFont{\odj@email@list@font}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \odj@email@list@aux
    \ifnum\@tempcntb=\z@\relax
      \odj@warning{%
        No e-mail given:\MessageBreak
        at lest one author must have a contact e-mail%
      }%
    \fi
  \endgroup
}
\newcommand*\odj@email@list@aux{%
  \advance\@tempcnta\@ne\relax
  \ifnum\@tempcnta>\odj@author@cnt\relax\else
    \odj@ifundefined{@email@\@roman\@tempcnta}{}{%
      \advance\@tempcntb\@ne\relax
      \ifnum\@tempcntb>\@ne\relax
        ;
      \fi
      \expandafter\expandafter\expandafter\url\expandafter
        \expandafter\expandafter{%
           \csname @email@\@roman\@tempcnta\endcsname
      }%
    }%
    \expandafter\odj@email@list@aux
  \fi
}
\newcommand*\odj@number@list{%
  \begingroup
    \odj@number@list@aux@i{phone}%
    \let\@tempb\@tempa
    \odj@number@list@aux@i{fax}%
    \ifx\@tempa\@empty
      \let\@tempa\@tempb
    \else
      \ifx\@tempb\@empty\else
        \protected@edef\@tempa{%
          \@tempb.\space\@tempa
        }%
      \fi
    \fi
    \ifx\@tempa\@empty\else
      \par
      \@tempa
    \fi
  \endgroup
}
\newcommand*\odj@number@list@aux@i[1]{%
  \def\@tempa{}%
  \@tempcnta\z@\relax
  \def\odj@number@list@aux@ii{%
    \advance\@tempcnta\@ne\relax
    \ifnum\@tempcnta>\odj@author@cnt\relax\else
      \odj@ifundefined{@#1@\@roman\@tempcnta}{}{%
        \odj@ifundefined{@email@\@roman\@tempcnta}{}{%
          \ifx\@tempa\@empty
            \edef\@tempa{%
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \else
            \edef\@tempa{%
              \@tempa
              ;
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \fi
        }%
      }%
      \expandafter\odj@number@list@aux@ii
    \fi
  }%
  \odj@number@list@aux@ii
  \ifx\@tempa\@empty\else
    \protected@edef\@tempa{%
      \MakeUppercase#1: \@tempa
    }%
  \fi
}
\newcommand*\odj@number@list@aux@ii{}
\g@addto@macro\endabstract{%
  \aftergroup\odj@abstract@extras
}
\newcommand*{\odj@abstract@extras}{%
  \bgroup
  \extrasfont
  \ifodj@keywords
    \odj@keywords@print
    \par\vspace*{\odj@space@inter@extra}
  \fi
  \ifodj@jel
    \odj@jel@print
    \par\vspace*{\odj@space@inter@extra}
  \fi
  \ifodj@msc
    \odj@msc@print
    \par\vspace*{\odj@space@inter@extra}
  \fi
  \ifodj@abbreviations
    \odj@abbreviations@print
    \par\vspace*{\odj@space@inter@extra}
  \fi
  \egroup
}
\newcommand*\odj@maketitle@extras{%
  \odj@maketitle@extras@hook
}
\newcommand*\odj@maketitle@extras@hook{}
\g@addto@macro{\maketitle}{\odj@maketitle@extras\thispagestyle{empty}}
\g@addto@macro{\document}{\maketitle}
\newfloat{scheme}{htbp}{los}
\floatname{scheme}{Scheme}
\newfloat{chart}{htbp}{loc}
\floatname{chart}{Chart}
\newfloat{graph}{htbp}{loh}
\floatname{graph}{Graph}
%\newcommand*\schemename{Scheme}
%\newcommand*\chartname{Chart}
%\newcommand*\graphname{Graph}
\floatplacement{table}{htbp}
\floatplacement{figure}{htbp}
\floatstyle{plaintop}
\restylefloat{table}
\let\odj@floatboxreset\@floatboxreset
\def\@floatboxreset{%
  \centering
  \odj@floatboxreset
}
\AtEndOfClass{%
  \colorlet{tbrowcolor}{structure@color!10}
  \colorlet{tbheadcolor}{structure@color!30}
  \arrayrulecolor{structure@color}
}
%% From https://tex.stackexchange.com/a/32366/226
\newcommand*{\trfiller}{%
  \arrayrulecolor{tbrowcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand*{\thfiller}{%
  \arrayrulecolor{tbheadcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand{\headrow}{\rowcolor{tbheadcolor}}
\newcommand{\patchodjtables}{%
  \rowcolors*{1}{tbrowcolor}{tbrowcolor}%
  \setlength{\aboverulesep}{0pt}%
  \setlength{\belowrulesep}{0pt}%
  \setlength{\extrarowheight}{.75ex}%
}
\AtBeginEnvironment{table}{\patchodjtables}
\AtBeginEnvironment{table*}{\patchodjtables}
\newcommand*\odj@section{}
\let\odj@section\section
\newcommand*\odj@subsection{}
\let\odj@subsection\subsection
\newcommand*\odj@subsubsection{}
\let\odj@subsubsection\subsubsection
\newcommand*\odj@startsection@orig{}
\let\odj@startsection@orig\@startsection
\newcommand\odj@startsection[6]{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\let\@startsection\odj@startsection
\newcommand*\odj@startsection@alt[6]{%
  \if@noskipsec \leavevmode \fi
  \par \@tempskipa #4\relax
  \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
  \@ifstar{\@ssect{#3}{#4}{#5}{#6}}
          {\@ssect{#3}{#4}{#5}{#6}}%
}
\newcommand*\odj@sections@none{%
  \@ifstar{%
    \odj@sections@none@aux
  }{%
    \odj@sections@none@aux
  }%
}
\newcommand*\odj@sections@none@aux[2][]{%
  \odj@warning{%
    (Sub)section `#2' ignored%
  }%
}
\patchcmd{\@ssect}{#4}{\color{structure@color}#4}{}{}
\patchcmd{\@sect}{#6}{\color{structure@color}#6}{}{}
\newcommand*\SectionNumbersOff{%
  \let\@startsection\odj@startsection@alt
}
\@onlypreamble\SectionNumbersOff
\newcommand*\SectionNumbersOn{%
  \let\@startsection\odj@startsection
}
\@onlypreamble\SectionNumbersOn
\newcommand*\SectionsOff{%
  \let\section\odj@sections@none
  \let\subsection\odj@sections@none
  \let\subsubsection\odj@sections@none
}
\@onlypreamble\SectionsOff
\newcommand*\SectionsOn{%
  \let\section\odj@section
  \let\subsection\odj@subsection
  \let\subsubsection\odj@subsubsection
}
\@onlypreamble\SectionsOn
\begingroup
  \toks@=\expandafter{\tableofcontents}
  \xdef\tableofcontents{%
    \begingroup
      \let\noexpand\@startsection\noexpand\odj@startsection@orig
      \the\toks@
    \endgroup
  }
\endgroup
\newenvironment{acknowledgement}{%
  \odj@section*{\acknowledgementname}%
}{}
\newenvironment{suppinfo}{%
  \odj@section*{\suppinfoname}%
}{}
\newcommand*\acknowledgementname{Acknowledgement}
\AtEndOfClass{%
  \def\bibsection{%
    \odj@section*{\refname}%
  }%
}
\newcommand*\suppinfoname{Supporting Information Available}
\newcommand*\odj@iffalse{\iffalse}
\newtoks\odj@collect@toks
\newtoks\odj@collect@empty@toks
\newcommand*\odj@collect@begins{}
\newcommand*\odj@collect@content{}
\newcommand\odj@collect[1]{%
  \odj@collect@toks{%
    \expandafter#1\expandafter{\the\odj@collect@toks}%
  }%
  \edef\odj@collect@content{%
    \the\odj@collect@toks
    \noexpand\end{\@currenvir}%
  }%
  \odj@collect@toks\odj@collect@empty@toks
  \def\odj@collect@begins{b}%
  \begingroup
    \expandafter\let\csname\@currenvir\endcsname\odj@collect@aux
    \edef\odj@collect@content{%
      \expandafter\noexpand\csname\@currenvir\endcsname
    }%
    \odj@collect@content
}
\newcommand*\odj@collect@aux{}
\long\def\odj@collect@aux#1\end#2{%
  \edef\odj@collect@begins{%
    \odj@collect@begins@#1\begin\end
    \expandafter\@gobble\odj@collect@begins
  }%
  \ifx\@empty\odj@collect@begins
    \endgroup
    \@checkend{#2}%
    \odj@collect@body{#1}%
  \else
    \odj@collect@body{#1\end{#2}}%
  \fi
  \odj@collect@content
}
\newcommand*\odj@collect@begins@{}
\long\def\odj@collect@begins@#1\begin#2{%
  \ifx\end#2\else
    b\expandafter\odj@collect@begins@
  \fi
}
\newcommand\odj@collect@body[1]{%
  \global\odj@collect@toks\expandafter{\the\odj@collect@toks#1}%
}
\newcommand*\odj@type@list{article,communication,suppinfo}
\newcommand*\odj@type@default{article}
\newcommand*\odj@type@check{%
  \@tempswafalse
  \@for\@tempa:=\odj@type@list\do{%
    \ifx\@tempa\odj@manuscript
      \expandafter\@tempswatrue
    \fi
  }%
  \if@tempswa\else
    \odj@warning{%
      Invalid manuscript type \odj@manuscript:\MessageBreak
      changed to default type \odj@type@default
    }%
    \let\odj@manuscript\odj@type@default
  \fi
}
\newcommand*\odj@setkeys{\setkeys{odj}}
\let\odj@killsecs\SectionsOff
\newcommand*\odj@validtype[2][article]{%
  \def\odj@type@default{#1}%
  \def\odj@type@list{#2}%
}
\newcommand*\odj@par{}
\let\odj@par\par
\let\odjTWOCOL\relax
%%%% CUSTOMISATIONS FOR LARGE LAYOUT
\newcommand*\odj@layout@large{%
  \ifodj@simfonts\simfonts\fi
  \newlength{\odj@sidebar@width}
  \newlength{\odj@real@lmargin}
  \setlength{\odj@sidebar@width}{5cm}
  \setlength{\odj@real@lmargin}{1.5cm}
  \geometry{paperwidth=210mm,paperheight=280mm,
      left=7cm,top=2.3cm,bottom=1.7cm,right=1.4cm,
      columnsep=2em,headsep=0.8cm
      }
  \def\odjTWOCOL{%
      \let\odjTWOCOL\relax%
      {\unskip\parfillskip 0pt\par}%
      \twocolumn\changetext{}{\dimexpr\Gm@lmargin-\odj@real@lmargin\relax}{}{-\dimexpr\Gm@lmargin-\odj@real@lmargin\relax}{}{}%
      \noindent\ignorespaces%
  }
    \def\ps@plain{
      \renewcommand{\@oddhead}{\sffamily{\journalnamefont\odj@journal@name}\hfill\thepage}%
      \renewcommand{\@evenhead}{\sffamily\thepage\hfill\@author@i\space\odj@etal}%
      \renewcommand{\@evenfoot}{}%
      \renewcommand{\@oddfoot}{\@evenfoot}%
    }
  \pagestyle{plain}
  \setcounter{secnumdepth}{0}
  \def\sidebarfont{\sffamily}
  \patchcmd{\odj@keywords@print}{Keywords: }{Keywords:\par}{}{}
  \patchcmd{\odj@msc@print}{Codes: }{Codes:\par}{}{}
  \patchcmd{\odj@jel@print}{classification: }{classification:\par}{}{}
  \patchcmd{\odj@abbreviations@print}{Abbreviations: }{Abbreviations:\par}{}{}
  \def\@maketitle{%
      \vspace*{\dimexpr-\headsep-\headheight\relax}%
      \setlength\parindent{\z@}
      \ifnum\odj@author@cnt<\z@\relax
        \odj@warning{No authors defined: At least one author is required}%
      \fi
      \def\titlefont{\sffamily\mdseries\color{structure@color}\raggedright}
      \def\authorfont{\sffamily}
      \def\affilfont{\sffamily}
      \setlength{\odj@space@inter@extra}{1em}
      \begin{textblock*}{\odj@sidebar@width}(\odj@real@lmargin,\dimexpr\Gm@tmargin-\headsep\relax)
        \raggedright%
        \sidebarfont
        {%
          \journalnamefont
          \odj@journal@name
          \par
        }%
        \vspace*{\odj@space@inter@extra}%
        \textbf{www.cambridge.org}\par%
        \vspace*{3\odj@space@inter@extra}%
        {\large\bfseries\color{structure@color}\xmakefirstuc{\odj@manuscript}\par}%
        \vspace*{\odj@space@inter@extra}%
        {%
          \datesize
          \datefont
          \ifodj@dates
            Received \odj@recvd\\%
            Revised \odj@revd\\%
            Accepted \odj@accptd%\\%
            % First published online \odj@publd%
            \par\vspace*{\odj@space@inter@extra}%
          \fi
          \odj@abstract@extras\par
          \gdef\odj@abstract@extras{}
        }%
        {%
          \emailsize
          \emailfont
          \ifodj@email
            \patchcmd{\odj@contact@details}{Corresponding author}{Author for correspondence}{}{}
            \expandafter\odj@contact@details
            \par
            \vspace*{\odj@space@post@email}%
          \fi
        }%
        % \vspace*{\odj@space@inter@extra}%        
        \end{textblock*}
        % }%
        \begin{textblock*}{\odj@sidebar@width}[0,1](\odj@real@lmargin,\dimexpr\paperheight-\Gm@bmargin\relax)
          \ifodj@copyright
            \raggedright\sidebarfont
            \odj@copyright@notice\par
            \vspace*{2\baselineskip}
          \fi
          \includegraphics[width=\linewidth]{odj-logo-new}
        \end{textblock*}
        {%
          \titlefont
          \titlesize
          \let\@fnsymbol\odj@author@fnsymbol
          \let\footnote@org\footnote
          \let\footnote\odj@title@footnote
          \odj@maketitle@suppinfo \@title
          \odj@title@footnote@check
          \global\odj@footnote@cnt\c@footnote
          \@maketitle@title@hook
          \par
        }%
        \vspace*{\baselineskip}
        {%
          \hrule\vskip2pt
          \authorsize
          \authorfont
          \frenchspacing
          \odj@author@list
          \par\vskip2pt
          \hrule
        }%
        \vspace*{1.5\odj@space@post@author}%
        {%
          \affilsize
          \affilfont
          \odj@address@list
          \par
        }%
    }%
}
\newcommand*\odj@layout@largetwo{%
  \ifodj@simfonts\simfonts\fi
  \geometry{paperwidth=210mm,paperheight=280mm,
      left=1.5cm,top=2.3cm,bottom=1.7cm,right=1.4cm,
      columnsep=2em,headsep=0.8cm
      }
  \patchcmd{\@maketitle}{\firstheadsize}{\sffamily\firstheadsize}{}{}
  \appto{\authorfont}{\sffamily}
  \appto{\affilfont}{\sffamily}
  \appto{\datesize}{\sffamily}
  \appto{\emailfont}{\sffamily}
  \patchcmd{\document}{\maketitle}{}{}{}
  \RequirePackage{environ}
  \let\oldabstract\abstract
  \let\endoldabstract\endabstract
  \RenewEnviron{abstract}{%
    \twocolumn[%
      \begin{@twocolumnfalse}
        \maketitle%
        \begin{oldabstract}%
        \protecting{\BODY}%
        \end{oldabstract}%
      \end{@twocolumnfalse}]}
  \def\ps@plain{
      \renewcommand{\@oddhead}{\sffamily{\journalnamefont\odj@journal@name}\hfill\thepage}%
      \renewcommand{\@evenhead}{\sffamily\thepage\hfill\@author@i\space\odj@etal}%
      \renewcommand{\@evenfoot}{}%
      \renewcommand{\@oddfoot}{\@evenfoot}%
    }
  \pagestyle{plain}
}
\newcommand*\odj@layout@medium{%
  \ifodj@simfonts\simfonts\fi
  \geometry{paperwidth=174mm,paperheight=247mm,
    top=2.3cm,bottom=1.4cm,left=1.8cm,right=1.5cm,
    headsep=0.8cm}
}
\newcommand*\odj@layout@small{%
  \ifodj@simfonts\simfonts\fi
  \geometry{paperwidth=152mm,paperheight=228mm,
    top=2cm,bottom=1.5cm,left=1.7cm,right=1.5cm,
    headsep=0.5cm}
}
\newcommand*\acksize{\normalsize}
\newcommand*\suppsize{\normalsize}
\newcommand*\patch@numeric@authors{%
  %%% Make author markers numeric...
  \renewcommand{\odj@author@fnsymbol@symbol}[1]{##1}
  \pretocmd{\odj@author@fnsymbol}{\let\ensuremath\relax}{}{}
  \patchcmd{\odj@author@star@aux}{\else}{,\else}{}{}
  \patchcmd{\odj@author@star@aux}
    {\ifnum\odj@affil@alt@cnt>\z@\relax}
    {\ifnum\odj@affil@alt@cnt>\z@\relax,}
    {}{}
  \patchcmd{\odj@author@affil@also@aux}
    {\odj@author@fnsymbol}
    {,\odj@author@fnsymbol}
    {}{}
  \patchcmd{\odj@address@list@auxii}
    {\odj@author@fnsymbol{\odj@affil@marker@cnt}}
    {\textsuperscript{\odj@author@fnsymbol{\odj@affil@marker@cnt}}}
    {}{}
}
% Journal Definitions
\def\odj@jnl@default{%
  \def\odj@journal@name{Cambridge Default Journal}
  \odj@layout@medium
}%
\def\odj@jnl@small{%
  \def\odj@journal@name{Analysis and Visualization of Big Data}
  \odj@layout@small
}%
\def\odj@jnl@medium{%
  \def\odj@journal@name{Cambridge Medium}
  \odj@layout@medium
}%
\def\odj@jnl@large{%
  \def\odj@journal@name{Cambridge Large One}
  \odj@layout@large
  \patch@numeric@authors
}
\def\odj@jnl@largetwo{
  \def\odj@journal@name{Cambridge Large Two}
  \odj@layout@largetwo
  \setcounter{secnumdepth}{0}
  \patchcmd{\@maketitle}
    {{\volumefont\odj@vol}, }{}{}{}
  \patch@numeric@authors
  \renewcommand{\email}[2][]{%
    \odj@emailtrue%
    \def\odj@contact@details{%
      {\emailfont \textbf{Author for correspondence: }##1, Email: ##2.}%
    }%
  }
  \let\endnote\footnote
  \let\printendnotes\relax
  \renewcommand{\thefootnote}{\alphalph{\value{footnote}}}
  \renewcommand\footnoterule{}
  \advance\skip\footins 4\p@\@plus2\p@\relax
}
\def\odj@jnl@aog{
  % v1.01: AOG and JOG do NOT want the journal name visible
  \def\odj@journal@name{}
  \odj@layout@large
  \patch@numeric@authors
  \patchcmd{\@maketitle}
    {\includegraphics[width=\linewidth]{odj-logo-new}}
    {\journalnamefont\upshape\normalsize\bfseries cambridge.org}
    {}{}
  \patchcmd{\@maketitle}
    {\textbf{www.cambridge.org}}
    {\includegraphics[width=\linewidth]{odj-logo-new}}
    {}{}
  \renewcommand{\email}[2][]{%
    \odj@emailtrue%
    \def\odj@contact@details{%
      {\emailfont\textbf{Author for correspondence:}\\##1,\\E-mail: ##2}%
    }%
  }
  \renewmdenv[hidealllines=true,leftmargin=\z@,rightmargin=\z@,innerleftmargin=\z@,innerrightmargin=\z@,innertopmargin=\z@,innerbottommargin=\z@,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=2mm,frametitlebelowskip=2mm]{odj@abstract@box}
  \setcounter{secnumdepth}{3}
  \renewcommand*\odj@etal{et al.}
  \providecommand{\odj@reference@code}{%
    \RequirePackage{natbib}
    \bibliographystyle{igs}
    \renewcommand{\bibpreamble}{\let\doi\relax}
    \renewcommand*{\bibfont}{\footnotesize}
    \renewcommand*{\bibsep}{\parsep}
  }
  \renewcommand{\figurename}{Fig.}
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}
\def\odj@jnl@jog{
  % v1.01: AOG and JOG do NOT want the journal name visible
  \def\odj@journal@name{}
  \odj@layout@large
  \patch@numeric@authors
  \patchcmd{\@maketitle}
    {\includegraphics[width=\linewidth]{odj-logo-new}}
    {\journalnamefont\upshape\normalsize\bfseries cambridge.org}
    {}{}
  \patchcmd{\@maketitle}
    {\textbf{www.cambridge.org}}
    {\includegraphics[width=\linewidth]{odj-logo-new}}
    {}{}
  \renewcommand{\email}[2][]{%
    \odj@emailtrue%
    \def\odj@contact@details{%
      {\emailfont\textbf{Author for correspondence:}\\##1,\\E-mail: ##2}%
    }%
  }
  \renewmdenv[hidealllines=true,leftmargin=\z@,rightmargin=\z@,innerleftmargin=\z@,innerrightmargin=\z@,innertopmargin=\z@,innerbottommargin=\z@,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=2mm,frametitlebelowskip=2mm]{odj@abstract@box}
  \setcounter{secnumdepth}{3}
  \renewcommand*\odj@etal{et al.}
  \providecommand{\odj@reference@code}{%
    \RequirePackage{natbib}
    \bibliographystyle{igs}
    \renewcommand{\bibpreamble}{\let\doi\relax}
    \renewcommand*{\bibfont}{\footnotesize}
    \renewcommand*{\bibsep}{\parsep}
  }
  \renewcommand{\figurename}{Fig.}
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}
\def\odj@jnl@bjps{
  \def\odj@journal@name{British Journal of Political Science}
  \odj@layout@medium 
  % \colorlet{structure@color}{green!40!black}
  % \patchcmd{\@maketitle}
  %   {\includegraphics[width=26mm]{odj-logo-new}}
  %   {\parbox{5em}{\fontsize{1em}{1em}\fontfamily{NimbusSans}\bfseries\color{structure@color}British\\Journal of\\Political\\Science}}{}{}
  \patch@numeric@authors
  \let\endnote\footnote
  \let\printendnotes\relax
}
\def\odj@jnl@jjps{
  \def\odj@journal@name{Japanese Journal of Political Science}
  \odj@layout@medium 
  % \patchcmd{\@maketitle}
  %   {\includegraphics[width=26mm]{odj-logo-new}}
  %   {{\fontsize{2em}{2em}{\fontfamily{LinuxBiolinumT-LF}\selectfont JJPS}}}{}{}
  % \patchcmd{\@maketitle}
  %   {(Received \odj@recvd; revised \odj@revd; accepted \odj@accptd; first published online \odj@publd)}
  %   {(First published online \odj@publd)}
  %   {}{}
  \patch@numeric@authors
  \let\endnote\footnote
  \let\printendnotes\relax
  % \renewcommand{\odj@copyright@notice}
  %   {\scriptsize\textcopyright\ Cambridge University Press \odj@year.}
}

\def\odj@jnl@ash{
  \def\odj@journal@name{Antimicrobial Stewardship \& Healthcare Epidemiology}
  \odj@layout@largetwo
  \setcounter{secnumdepth}{0}
  % \definecolor{structure@color}{RGB}{36,62,112}
  \patchcmd{\@maketitle}
    {{\volumefont\odj@vol}, }{}{}{}
  \patch@numeric@authors
  \renewcommand{\email}[2][]{%
    \odj@emailtrue%
    \def\odj@contact@details{%
      {\emailfont \textbf{Author for correspondence: }##1, Email: ##2.}%
    }%
  }
  \let\endnote\footnote
  \let\printendnotes\relax
  \renewcommand{\thefootnote}{\alphalph{\value{footnote}}}
  \renewcommand\footnoterule{}
  \advance\skip\footins 4\p@\@plus2\p@\relax

  %\providecommand{\odj@reference@code}{%
  %  \RequirePackage[style=nejm,autocite=superscript]{biblatex}
  %  \renewcommand*{\bibfont}{\footnotesize}
  %}

  \AtEndOfClass{%
    \arrayrulecolor{black}
  }
}

\def\odj@jnl@pasa{
  \def\odj@journal@name{Publications of the Astronomical Society of Australia}
  \odj@layout@largetwo
  % \definecolor{structure@color}{RGB}{0,32,135}
  \patchcmd{\@maketitle}
    {{\volumefont\odj@vol}, }{}{}{}
  % \renewcommand{\odj@copyright@notice}
  %   {\scriptsize\textcopyright\ Astronomical Society of Australia \odj@year; published by Cambridge University Press.}
  \patch@numeric@authors
  \renewcommand{\email}[2][]{%
    \odj@emailtrue%
    \def\odj@contact@details{%
      {\emailfont \textbf{Author for correspondence: }##1, Email: ##2.}%
    }%
  }
  \let\endnote\footnote
  \let\printendnotes\relax
  \renewcommand{\thefootnote}{\alphalph{\value{footnote}}}
  \renewcommand\footnoterule{}
  \advance\skip\footins 4\p@\@plus2\p@\relax
  \renewmdenv[rightline=false,leftline=false,linecolor=black,linewidth=1pt,leftmargin=\z@,rightmargin=\z@,innerleftmargin=\z@,innerrightmargin=\z@,innertopmargin=\z@,innerbottommargin=2mm,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=2mm,frametitlebelowskip=2mm]{odj@abstract@box}
  %\def\endoldabstract{\par\vspace*{\odj@space@inter@extra}\odj@abstract@extras\endodj@abstract@box}
  %\providecommand{\odj@reference@code}{%
     %\RequirePackage{natbib}
   %  \RequirePackage{aas-macros}
     %\bibliographystyle{alpha}
  %   \renewcommand*{\bibfont}{\footnotesize}
  %   \renewcommand*{\bibsep}{\parsep}
  %}
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}
\def\odj@jnl@psrm{
  \def\odj@journal@name{Political Science Research and Methods}
  \odj@layout@medium 
  % \colorlet{structure@color}{red!70!black}
  \patch@numeric@authors
  % \patchcmd{\@maketitle}
    % {odj-logo-new}{epsa-outline-black}{}{}
  \let\endnote\footnote
  \let\printendnotes\relax
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}
\def\odj@jnl@jpup{
  \def\odj@journal@name{Journal of Public Policy}
  \odj@layout@small 
  \patch@numeric@authors
  % \patchcmd{\@maketitle}
  %   {\includegraphics[width=26mm]{odj-logo-new}}
  %   {\fcolorbox{black}{black}{\includegraphics[height=2em]{pup-logo}}}{}{}
  \let\endnote\footnote
  \let\printendnotes\relax
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}
\ifcsname odj@jnl@\odj@journal\endcsname%
  \csname odj@jnl@\odj@journal\endcsname%
\else%
  \odj@warning{%
    Unknown journal `\odj@journal':\MessageBreak
    using default configuration%
  }%
  \odj@jnl@default%
\fi%
%\providecommand*\odj@reference@code{% default citation style; can be modified in journal config or preamble
%  \RequirePackage[authordate-trad,noibid,backend=biber,natbib]{biblatex-chicago}
%  \renewcommand*{\bibfont}{\footnotesize}
%}
%\odj@reference@code
\odj@type@check
\ifx\odj@manuscript\odj@manuscript@note
  \SectionsOff
\fi
\ifx\odj@manuscript\odj@manuscript@review
  \SectionsOn
  \SectionNumbersOn
\fi
\ifx\odj@manuscript\odj@manuscript@suppinfo
  \setkeys{odj}{maxauthors = 0}
  \def\thepage{S-\arabic{page}}
  \renewcommand*\thefigure{S\@arabic\c@figure}
  \renewcommand*\thescheme{S\@arabic\c@scheme}
  \renewcommand*\thetable{S\@arabic\c@table}
  \AtBeginDocument
    {%
      \renewcommand*\citenumfont[1]{S#1}%
      \renewcommand*\bibnumfmt[1]{(S#1)}%
    }
\fi
\SectionNumbersOn
%% 
%% Based on the achemso class
%% Originally developed by Mats Dahlgren
%% Copyright (C) 1996-1998 by Mats Dahlgren
%% Copyright (C) 2008-2018 by Joseph Wright <joseph.wright@morningstar2.co.uk>
%% Copyright (C) 2019 by Overleaf (WriteLaTeX Limited)
%% 
%% Part of this bundle is derived from cite.sty, to which the
%% following license applies:
%%   Copyright (C) 1989-2009 by Donald Arseneau
%%   These macros may be freely transmitted, reproduced, or
%%   modified provided that this notice is left intact.
%% 
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%%   Paul Gessler.
%% 
%% This work consists of the file odj-journal.cls.
%% 
%%
%% End of file `odj-journal.cls'.
