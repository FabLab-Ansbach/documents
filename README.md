# Öffentliche Dokumente des FabLab Ansbach e.V.

Dieses Repository beinhaltet öffentlich einsehbare Dokumente des FabLab Ansbach e.V. in seiner Ausgangsform (LaTeX) und als PDF.

## Voraussetzungen

Alle Dokumente sind, zur einfacheren Versionsverwaltung, mit LaTeX gesetzt und werden zusätzlich in einer gerenderten PDF-Version vorgehalten.
Zum setzen dieser Dokumente ist eine funktionsfähige LaTeX-Umgebung mit zusätzlichen Paketen notwendig.

Für bestimmte Dokumente zusätzlich notwendige Pakete:

- pbox
- ctable
- tikz

## Installation

Um alle benötigten CTAN-Pakete zur Verfügung zu haben müssen diese Pakete installiert sein:

- texlive-latex-base
- texlive-latex-recommended
- texlive-latex-extra
- texlive-pictures
- texlive-fonts-recommended

Alternativ ist eine Installation von texlive-full möglich.

### Ubuntu

```bash
sudo apt update
sudo apt install texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-pictures texlive-fonts-recommended
```

Sollte man die Verwendung eines eigenen LaTeX-Editors bevorzugen kann noch **TexStudio** installiert werden:

```bash
sudo add-apt-repository ppa:sunderme/texstudio
sudo apt update
sudo apt install texstudio
```

## Projektstruktur

```bash
/..
|- src/                         LaTeX-Dokumente
    |- ..
    |- Pressemitteilungen/
|- include/                     Wiederverwendbare LaTeX-Snippets
|- images/                      Eingebundene Bilder
|- pdf/                         Gerenderte Dokumente
|- make.sh                      Helper-Skript zum Rendern von Dokumenten
```

## Verwendung

### Schreiben von Dokumenten

Damit alle öffentlichen Dokumente einer einhaltlichen Formatierung folgen, soll in jedem Dokument das Template eingebunden werden. Im Template sind die grundsätzlichen Formatierungen des Dokuments definiert. Dazu zählen z.B. Kopfzeile, Fußzeile und Schriftgröße/Schriftart.

```LaTeX
\title{Wichtiges Dokument}
\author{FabLab Ansbach e.V.}
\date{xx.xx.xxxx}

\input{template}

\begin{document}
    % TEXT HIER EINFUEGEN
\end{document}
```

Am Anfang jedes Dokuments wird der Titel und das Datum gesetzt. Der Autor bleibt "FabLab Ansbach e.V.". Diese Angaben sind notwendig um ggf. mit `\maketitle` ein Titelblatt zu erzeugen. Der Befehl muss innerhalb des Dokumentenrahmes stehen:

```LaTeX
\title{Wichtiges Dokument mit Titelblatt}
\author{FabLab Ansbach e.V.}
\date{xx.xx.xxxx}

\input{template}

\begin{document}
\maketitle % Erzeugt ein Titelblatt
    % TEXT HIER EINFUEGEN
\end{document}
```

### Rendern von Dokumenten

Um das erzeugen von PDF-Dokumenten zu erleichtern gibt es das Skript **make.sh**.
Dieses erzeugt aus den .tex Dateien in **src/** entsprechende PDF-Dokumente und legt diese in **pdf/** ab. Gleichzeitig werden die zusätzlich erzeugten Hilfsdateien von LaTeX nach der Generierung wieder gelöscht.

Rendern aller vorhandenen Dokumente: `./make.sh`
Rendern eines bestimmten Dokuments: `./make.sh Dokumentenname`

Beim Rendern eines bestimmten Dokuments erwartet das Skript den Dateinamen ohne Dateiendung. Es wird automatisch im passenden src-Verzeichnis gesucht, weshalb die Angabe des genauen Pfads nicht notwendig ist.

z.B. Erzeugen der Satzung als PDF-Dokument: `./make.sh satzung`
