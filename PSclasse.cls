%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
%  %NAME%    : Classe permettant l'écriture rapide d'un rapport type
%              rapport de stage Pour monsieur Poinsot
%  %AUTHORs%  : Jean-Emmanuel Longueville,
%  %EMAIL%   : jean-emmanuel.longueville-chez-etudiant.univ-rennes1.fr
%  %VERSION% : 0.1.2 (07/01/2010)
%
%    Copyright (C) 
%    
%    This program is free software; you can redistribute it and/or
%    modify it under the terms of the GNU General Public License
%    as published by the Free Software Foundation; either version 2
%    of the License, or (at your option) any later version.
%    
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%    
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
%
%
%    The GNU General Public License can be found on the website
%    http://www.fsf.org
%    
%    Les travaux de traduction de la GPL peuvent être trouvés sur le
%    site : http://www.april.org/gnu/gpl_french.html
%
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Cette classe est inspirée de beaucoup des travaux de Virginie Quesnay
% Cependant, je tiens particulièrement à remercier M. François Pétiard de la liste 
% liste Gut <gut@ens.fr> pour sa précieuse aide au débugage de cette classe.
%
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%==============================================================================
% Changelog 0.1.2
%Fin d'utilisation de a4wide, utilisation de géométry et définition de celui ci.
%changement du nom de classe pour avoir quelque chose qui puisse convenir pour la version finale.
%		Changer l'interligne de base en 1.5
%		Rajouter les commandes concernant l'export en Pdf.
%A faire
%		Préparer la mise en page des remerciements ainsi que le paramétrage de la page de résumé.
%		vérifier la présence de la déclaration de la page des matières.
%		In fine voir les set counter page de toutes les pages générées.
%Ajouter remerciement à la liste Gutenberg et à l'association.
%===============================================================================

%On détermine le langage dans lequel on écrit :
	\NeedsTeXFormat{LaTeX2e}
 %Nous donnons un nom à la classe et sa datte et version pour pouvoir s'y retrouver
		\ProvidesClass{PSclasse}[2010/01/11 Classe personnelle, V0.1]
 
% classe de base
%\LoadClass[a4paper,12pt,twoside]{article}
\LoadClass[a4paper,12pt]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% On a besoin des packages suivants :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extensions
%pour un ptit peu de couleur et du times
	\RequirePackage{color}
	\RequirePackage{txfonts}
%Définition du codage des caractères
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
%utilisation des paquets de l'AMS
%Pour tout ce qui est critère mathématique flèche et autre ...
	%\RequirePackage{amsmath}
	\RequirePackage{amsfonts}
	\RequirePackage{amssymb}
	\RequirePackage{textcomp}	
%Normalement pour faire un sommaire
	\RequirePackage{shorttoc}
% Pour faire une figure
	\RequirePackage{subfig} % petit a petit B
	\RequirePackage{float} %pour avoir le texte qui tourne autours de la figure.
	\RequirePackage{caption}%pour modifier la présentation des légendes
%pour permettre l'incorporation d'image.
	\RequirePackage{graphicx}
%Pour faire de l'économiser de papier (Délimitation des marges comme demander par monsieur poinsot) pour modifier les marges facilement
	\RequirePackage[pdftex,a4paper,centering,body={155mm,250mm},left=25mm,top=25mm]{geometry}
	\geometry{a4paper} 
	\RequirePackage{chngpage}
%pour gérer les variations d'interligne
	\RequirePackage{setspace} 
% pour personnaliser les entêtes et pieds de page
	\RequirePackage{fancyhdr}
% pour pouvoir facilement passer la partie centrale du document en plusieurs colonnes.
	\RequirePackage{multicol}
%Pour la numerotation des lignes
	\RequirePackage{lineno}
%Pour la bibliographie
	\RequirePackage[comma,numbers,round]{natbib}
%utilisation de la langue française et anglaise
\RequirePackage[english,frenchb]{babel}

%Pour les pdf
	%\RequirePackage[pdftex]{hyperref}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%pour faire la page de garde
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des variables et des macros pour les modifier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macro qui permet de créer rapidement de nouvelles commandes
\newcommand{\creecommande}[1]{%
  \expandafter\newcommand\csname #1\endcsname[1]{%
    \@ifundefined{@#1}{}{%
      \ClassWarning{PSclasse}{\expandafter\protect\csname
        @#1\endcsname\space est defini plus d'une fois.}}%
    \expandafter\gdef\csname @#1\endcsname{##1}}}

% Macro qui permet d'utiliser une des nouvelle commande
\newcommand{\utilisecommande}[3]{%
  \@ifundefined{@#1}{%
    \ClassWarning{PSclasse}{\expandafter\protect\csname
        @#1\endcsname\space n'est pas defini pour l'utilisation de #2}%
  }{%
    #3}%
}
% Nom du fichier de bibliographie
	\creecommande {bib}

\renewcommand\section{\@startsection {section}{1}{\z@}%
	{-1.5ex \@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus.2ex}%
	{\reset@font\Large\bfseries}}


\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                    {-1.5ex\@plus -1ex \@minus -.2ex}%
                                     {1.1ex \@plus .2ex}%
                                    {\reset@font\large\bfseries}}

\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\z@}%
	{-1ex \@plus -1ex \@minus -.2ex}%
	{1ex \@plus.2ex}%
	{\reset@font\normalsize\bfseries}}
%%%%%%%%%%%%%%%%%
% Pour le stage %
%%%%%%%%%%%%%%%%%

% année
	\creecommande {annee}
% nom de l'auteur
	\creecommande {auteur}
% type de rapport (rapport de stage, rapport préliminaire, ...)
	\creecommande {typerapport}
% titre 
	\creecommande {titre}
% titre resumé
	\creecommande {titreresum}	
% titre en anglais
	\creecommande {titrea}
% nom du logo de l'entreprise
	\creecommande {dessintitre}
% date à utiliser
	\creecommande {jour}
% maitre de stage
	\creecommande {maitrestage}
% tuteur de stage
	\creecommande {tuteurstage}
%Periode et Soutenance
	\creecommande{per}
	\creecommande{sout}

%%%%%%%%%%%%%%%%%%%%
% Pour le document %
%%%%%%%%%%%%%%%%%%%%
% mots clefs (mots clefs pour décrire le rapport)
	\creecommande {motscles}
% résumé (contient le résumé du contenu du rapport)
	\creecommande {resum}
% mots clefs (mots clefs pour décrire le rapport en anglais)
	\creecommande {keywords}	
%résumé (contient le résumé du contenu du rapport en anglais)
	\creecommande {abstracts}

%%%%%%%%%%%%%%
% Université %
%%%%%%%%%%%%%%
% logo de l'université
	\creecommande {logouniv}
% sigle de l'université
	\creecommande {sigleuniv}
% nom complet univ
	\creecommande {nomuniv}
% option étude
	\creecommande {optionetude}
%%%%%%%%%%%%%%
% Entreprise %
%%%%%%%%%%%%%%
% nom de l'image logo de entreprise
	\creecommande {logoentrep}
% nom entreprise
	\creecommande {nomentrep}
% adresse entreprise
	\creecommande {addrentrep}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% On configure deux trois trucs ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Espacement entre les figures et leur légende
%\setlength{\abovecaptionskip}{-2mm}
%\setlength{\belowcaptionskip}{-2mm}

% utilisation des commandes classiques de page de garde
\title{\@titre}
\author{\@auteur}
\date{\@jour}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\logoentreprise} {
\begin{minipage}{6cm}
	\begin{center}
		\utilisecommande{logoentrep}{logoentreprise}{\includegraphics [width=3cm]{\@logoentrep}\\}
	  \footnotesize{\utilisecommande{nomentrep}{logoentreprise}{\textsc{\@nomentrep}\\}}
		\footnotesize{\utilisecommande{addrentrep}{logoentreprise}{\textit{\@addrentrep}\\}}
	\end{center}\end{minipage}
	\vspace*{5mm}
}

\newcommand{\logoauteur} {
\begin{minipage}{6cm}
	\begin{center}
			\utilisecommande{auteur}{logoauteur}{\textsc{\@auteur}\\}
			\utilisecommande{sigleuniv}{logoauteur}{\textit{\@sigleuniv}\\}
			\utilisecommande{annee}{logoauteur}{\textit{Année \@annee}\\}
			\utilisecommande{per}{logoauteur}{\@per\\}
			\utilisecommande{sout}{logoauteur}{Date de soutenance : \@sout\\}
	\end{center}
\end{minipage}
\vspace*{5mm}
}

\newcommand{\logouniversite}{
	\begin{minipage}{6cm}
		\begin{center}%
			\utilisecommande{logouniv}{logouniversite}{\includegraphics [width=3cm]{\@logouniv}\\}
			\vspace{2mm}
			\utilisecommande{nomuniv}{logouniversite}{\textsc{\tiny{\@nomuniv}}}
			\vspace{1mm}\\
			\utilisecommande{optionetude}{logouniversite}{\textit{\@optionetude}}
			\vspace{1mm}\\
		\end{center}
	\end{minipage}}

\newcommand{\logotuteurs}{
  \begin{minipage}{7cm}
    \utilisecommande{tuteurstage}{logotuteur}{Enseignant tuteur~: \@tuteurstage \\}     
    \utilisecommande{maitrestage}{logotuteur}{Maîtres de stage~: \@maitrestage}
  \end{minipage}}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % réglage des paramètres pour la création des pdf à mettre dans l'entête du document
	\newcommand{\docpdf}{
		\hypersetup{
			colorlinks = true,
			linkcolor=blue,
			urlcolor=blue,
			citecolor=blue,
			plainpages=false,
			pdftitle={\@typerapport},
			pdfauthor={\@author},
			pdfsubject={\@title},
			pdfkeywords={\@motscles}
			}}

	
% Insère une figure de la largeur du texte \figautowidth {nom_fichier}{titre}{label}
	\newcommand{\figautowidth}[3]{
		\begin{figure}[H]
			\begin{center}
				\includegraphics [width=\textwidth]{#1}
			\end{center}
			\caption{#2}\label{#3}
			\end{figure}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Crée la page de titre
\newcommand{\pagedetitre}{
  %\cleardoublepage
    \begin{center} 
      \begin{minipage}{17.5cm}
      \logoentreprise \hfill \logoauteur
        \begin{center}
          \vfill
        % Double ligne %
        \vspace*{6cm}
        {\hrule height 1.5pt}
        \vspace*{1mm}
        {\hrule height 0.1pt}
        \vspace*{2mm}
        %%%%%%%%%%%%%%%
        \vspace{1cm}
        \utilisecommande{typerapport}{page de titre}{\large{\textsc{\@typerapport}}\\}
        \utilisecommande{titre}{page de titre}{\large{\@titre}}
        \vspace{1cm}
        % Double ligne inversée %
        \vspace*{2mm}
        {\hrule height 0.1pt}
        \vspace*{1mm}
        {\hrule height 1.5pt}
        \vspace*{4cm}
        %%%%%%%%%%%%%%%%
        \vfill
      \end{center}
    \end{minipage}\\
    \begin{flushbottom}
      \vfill
      \begin{minipage}{17.5cm}
        \utilisecommande{maitrestage}{page de titre}{Maître de stage~: \@maitrestage}
        \hfill 
        \utilisecommande{tuteurstage}{page de titre}{Correspondant universitaire~: \@tuteurstage}%
      \end{minipage}
    \end{flushbottom}
  \end{center}
}

% Crée la page de titre d'un autre type avec le dessintitre centré
\newcommand{\pagedetitrefun}{
  %\cleardoublepage%
  \thispagestyle{empty}%
  %\setcounter{page}{-2}%
\pdfbookmark[0]{Page de garde}{a}
  \begin{center}%
    \begin{minipage}{17.5cm}
      \logoentreprise \hfill \logoauteur
        %\vspace*{2cm}
		\vfill
        \begin{center}
          \utilisecommande{typerapport}{pagedetitrefun}{\large{\textsc{\@typerapport}}\\}
          {{\large\@titre\par} }
         \vfill%\vspace*{5mm}
			\begin{center}
			\utilisecommande{dessintitre}{pagedetitrefun}{\includegraphics [height=12cm, width=15cm, keepaspectratio=true]{\@dessintitre}}
			\end{center}
          \par%\vspace*{1cm} 
          \vfill%\vspace*{1cm}
        %%%%%%%%%%%%%%%%
        \end{center}
      \end{minipage}\\
      \begin{flushbottom}
        \vfill
        \begin{minipage}{17.5cm}
          \logotuteurs \hfill \logouniversite
      \end{minipage}
    \end{flushbottom}
  \end{center}
}

% Crée la page de table des matières
\newcommand{\pagedesmatieres}{
	%\cleardoublepage
	\thispagestyle{empty}
	\setcounter{page}{-1}
	\pdfbookmark[0]{\contentsname}{pagedesmatieres}
	\tableofcontents
	
}

% Crée la page de bibliographie
\newcommand{\bibliographie}{
  \addcontentsline{toc}{section}{Bibliographie}			
		\bibliography{Bibs/\@bib}
		%\bibliographystyle{Bibs/abbrv-fr}
		%\bibliographystyle{Bibs/plainnat-fr}
		\bibliographystyle{Bibs/plainnat-fr-url}
}
%Page de remerciement
\newcommand{\merci}{
	\pdfbookmark[1]{Remerciements}{b}
	\thispagestyle{empty}
	\begin{center}
		{\Large \textbf{Remerciements}}
		\end{center}
	\vfill
	\input{partie/3-remerciements}
	\vfill
	\newpage
	~
	\thispagestyle{empty}
	\newpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%pour faire le quatrieme de couverture page avec les résumés et autres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crée la page avec les cadres pour le résumé et les mots clés
	%\newlength{\logowidth} 
	%\setlength{\logowidth}{\linewidth}
\newcommand{\pagederesume}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \vspace{\stretch{1}}%
		
			%On affiche le titre en français
		\begin{center}{\scshape\strut \utilisecommande{titreresum}{pagederesume}{\@titreresum} \strut}
		\end{center}
		\vspace{0.5cm}
			
			%On affiche le Resumé en français
        {\scshape\bfseries \quad Résumé :\newline}
        {\small\strut \utilisecommande{resum}{pagederesume}{\@resum} \strut}%
    \vspace{0.5cm}%
	
			%On affiche les mots clés en français
        {\scshape\bfseries \quad Mots-clefs :}
        {\scriptsize\strut \utilisecommande{motscles}{pagederesume}{\@motscles} \strut}
  \vspace*{1cm}
  
			%On affiche le titre en anglais
		\begin {center}{\scshape\strut \utilisecommande{titrea}{pagederesume}{\@titrea} \strut}
		\end{center}
		\vspace{0.5cm}
		
			%On affiche le Resumé en Anglais
        {\scshape\bfseries \quad Abstract :\newline}
	\selectlanguage{english}
        {\small\strut \utilisecommande{abstracts}{pagederesume}{\@abstracts} \strut}%
    \vspace{0.5cm}%
	
			%On affiche les mots clés en Anglais
        {\scshape\bfseries \quad Keywords :}
        {\scriptsize\strut \utilisecommande{keywords}{pagederesume}{\@keywords} \strut}
	\pdfbookmark[0]{Résumé+Abstract}{c}
}

%Definition des symbôles mâles femelles
% this is wasyfont.tex version 2.01--92/10
\font\tenwasy = wasy10
\font\wasyb = wasyb10
\font\ninewasy = wasy9
\font\eightwasy = wasy8
\font\sevenwasy = wasy7
\font\fivewasy = wasy5
\newfam\wasyfam
\newcount\wasyfamcount
\wasyfamcount=\wasyfam \multiply\wasyfamcount by 256
\def\wasy{\fam\wasyfam\tenwasy}
\textfont\wasyfam=\tenwasy
\scriptfont\wasyfam=\sevenwasy
\scriptscriptfont\wasyfam=\fivewasy
%%%%%% special macro
\def\overstrike#1#2{{\setbox0\hbox{$#2$}\hbox to \wd0{\hss
    $#1$\hss}\kern-\wd0\box0}}
%%%%%% special symbols
\def\male{\hbox{\wasy\char"1A}}
\def\female{\hbox{\wasy\char"19}}