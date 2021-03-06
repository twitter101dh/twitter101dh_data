# Einführung Twitter API

## Inhalt
1. Kurze Einführung Twitter API
2. Beantragung des Zugangs zur Twitter-API & Dokumentation
3. Kurzüberblick R & Installation RStudio
4. Kurze Einführung in rtweet
5. Erste Analysen
6. Export der Daten
7. Ressourcen

## Einleitung: Programmieren
* Programmieren ist eigentlich einfach: Wer logische Sätze sprechen kann, kann auch Programmieren / nur muss eben die Vokabeln und Grammtik gelernt werden
* Keine Angst haben vor dem Ausprobieren (trotzdem Backups machen!)
* Jede wissenschaftliche Arbeit basiert auf Recherche, Programmieren genauso: hier aber Google erste Anlaufstelle (+Stackoverflow)
* Alles in R lässt sich genauso auch mit Python umsetzen
* Dieser Workshop soll Anregung und Einleitung sein; Nicht alles wird direkt nachvollziehbar sein und im Detail erklärt / Überforderung ist Programm
* Selbststudium meiner Erfahrung nach deutlich effektiver & effizienter; stattdessen wichtiger: Möglichkeiten zeigen
* Idee: Video anschauen, parallel nachmachen und stoppen, in Kapiteln springen
* Der komplette Code und der Text (also dieser hier!) sind verlinkt

## 1. Kurze Einführung Twitter API
Begriff API 
* Abkürzung für Application Programming Interface: Programmierschnittstelle 
* System zur Kommunikation zweier unterschiedlicher Softwaresysteme (hier: Twittersoftware mit R)

Die Twitter-API ermöglicht die Interaktion mit Twitter, z.B.:
* Abruf und Suche im Tweetarchiv
* Freundschaften & Followerschaften von Nutzer*innen abrufen
* Nachrichten schreiben und abrufen
* vieles mehr

* Hier basierend auf  RESTful API: Standardisierte Schnittstelle (Representational state transfer, Unterprotokoll von http)
* Daten werden im JSON-Format (JavaScript Object Notation) übertragen; offenes Format, ursprünglich Javascript, jetzt sprachübergreifend
Siehe: Dokumentation der Twitter-API https://developer.twitter.com/en/docs

Bisher API 1.1, gerade ist die Twitter API 2 erschienen:
* Unterschiede sind vor allem technischer Natur
* Aber auch Dinge wie die Umbenennung von Favourites zu like
* Wir arbeiten mit 1.1, da viele Packages (gerade rtweet) noch nicht angepasst sind
* Workflow für Endnutzer wird sich kaum ändern (dabei weiter die Dokumentation der Packages beachten)

Grundsätzlich:
* Die API ist kein Archiv-Zugang: Nicht alle Daten sind enthalten
* Gelöschte Tweets & Accounts, Tweets privater Accounts etc. werden nicht angezeigt
* Die Daten sind nicht immer perfekt: Teils Hashtags nicht in den entsprechenden Feldern, aber zeige ich
* Twitter-Daten nicht als Abbild ultimativer Fakten sehen; Zahlen versprechen ultimative Wahrheit, nicht per se der Fall
* Bei relevanten Fragen immer(!) Plausibilitätsprüfungen durchführen
https://developer.twitter.com/en/docs/twitter-api/premium/search-api/faq

## 2. Beantragung des Zugangs zur Twitter-API & Dokumentation
Für die ersten Schritte ist keine API notwendig (siehe Schritt 4 RTweet), für größere Projekte und mehr Zugriff aber eben sinnvoll.
Sofern die Freischaltung (1-4 Tage) nicht rechtzeitig passiert, einfach mit den Beispieldateien arbeiten.
* Standard-API: Abruf 500.000 Tweets pro Monat & Projekt
* Academic Research: 10.000.000 Tweets pro Monat & Projekt

1. In Twitter einloggen, dann auf https://developer.twitter.com/en
2. Auf Apply (oben rechts) - Button "Apply for a developer account"
3. Use-Case darstellen
4. App anlegen
5. API Keys, Access Tokens, and Bearer Token abholen

## 3. Kurzüberblick R & RStudio
* R ist eine Open Source Programmiersprache (GNU General Public License) für statisches Programmieren
* R wurde zum ersten Mal 1993 veröffentlicht, inzwischen in Version 4.0.4
* RStudio ist eine integrierte Entwicklungsumgebung zur Benutzung von R; von RStuido Inc.
* Kostenlose Version: weniger Kooperationsfunktionen und Suppport
* Sehr gut geeignet für den Einstieg

### Vorteile:
* Autovervollständigung
* Syntaxhervorhgebung
* vieles mehr

### 4 Bereiche im App-Fenster
1. Skripte & Variablen-Ansicht
2. Kommandozeile
3. Objekte in der Arbeitsumgebung
4. Package-Verwaltung und Ordnerverzeichnisse

### Datenstrukturen
* Listen, Matrizen, Strings
* data.frame teilen viele der anderen Eigenschaften: Liste von Variablen mit den gleichen Anzahl Zeilen
Data.frame sind unser Hauptarbeitsfeld an dieser Stelle

Download RStudio: https://rstudio.com/products/rstudio/download/
Spickzettel für R/RStudio: https://rstudio.com/resources/cheatsheets/

## 4. Nutzung RTweet
Siehe Video & Code-Beispiele

Dokumentation: https://docs.ropensci.org/rtweet/index.html

## 5. Analysen
Siehe Video & Code-Beispiele
 
## 6. Export
Siehe Video & Code-Beispiele

## 7. Ressourcen
Video: Einfühung in Twitter API:
https://vimeo.com/520272371

Twitter Developer Portal: Dokumentation & API-Portal
https://developer.twitter.com/

Dokumenation rtweet-Package:
https://docs.ropensci.org/rtweet/

Trafford Data Lab, Exploring tweets in R, 2020:
https://medium.com/@traffordDataLab/exploring-tweets-in-r-54f6011a193d

Bob Rudis, 21 Recipes for Mining Twitter Data with rtweet, 2018:
https://rud.is/books/21-recipes/

Mareike König, Paul Ramisch, Die twitternde Zunft, 2021:
https://owncloud.gwdg.de/index.php/s/H3sYrTh3C1mAJx0

vdHD21:
https://vdhd2021.hypotheses.org/189
