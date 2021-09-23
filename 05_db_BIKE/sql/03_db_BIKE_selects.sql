
-- Relation = Tabelle
USE bike;
/* Query 1
Schreiben Sie einen Select-Befehl, 
der aus der Relation (Tabelle) Personal die Namen aller Personen ermittelt, 
die mehr als 3000 Euro verdienen.
*/

SELECT 
	Name,
    Gehalt
FROM Personal
WHERE Gehalt > 3000
;

/* Query 2
Geben Sie die Gesamtanzahl der für Aufträge reservierten Artikel aus 
(die benötigten Informationen stehen in der Tabelle Reservierung).
*/

SELECT
	sum(Anzahl) AS "Reservierte Artikel"
FROM reservierung
;
    
# Musterlösung

SELECT * FROM Reservierung;

SELECT 
	 sum(Anzahl) AS "Reservierungen (kum.)" 
FROM Reservierung;

/* Query 3
Geben Sie alle Artikel der Relation Lager aus, deren Bestand abzüglich 
des Mindestbestands und der Reservierungen unter den Wert 3 gesunken ist. 
Als Ausgabe werden Artikelnummer und Artikelbezeichnung erwartet.
*/
-- Bedingung:  (Bestand - Mindbest - Reserviert) < 3

SELECT 
	Artnr, 
    Bezeichnung,
    Bestand,
    Mindbest,
    Reserviert
FROM Lager
INNER JOIN artikel ON Artnr = Anr
WHERE (Bestand - Mindbest - Reserviert) < 3
;

/* Query 4
Aus wie vielen Einzelheiten bestehen alle zusammengesetzten Artikel?
Falls ein Einzelteil wieder aus noch kleineren Einzelteilen besteht, 
so ist dies nicht weiter zu berücksichtigen. Tab. Teilestruktur --> Anzahl
*/

SELECT * FROM teilestruktur;
SELECT * FROM artikel;

DROP VIEW IF EXISTS artBezeichnung;

CREATE OR REPLACE VIEW artBezeichnung AS
SELECT 
	Anr,
    Bezeichnung
FROM artikel
;

SELECT * FROM artBezeichnung;



# Übersichtstabelle
SELECT 
	Artnr,
    A.Bezeichnung,
    Einzelteilnr,
    AB.Bezeichnung,
    Anzahl
    #count(Artnr)
FROM teilestruktur AS TS
INNER JOIN artikel AS A ON Artnr = A.Anr
INNER JOIN artBezeichnung AS AB ON Einzelteilnr = AB.Anr
#GROUP BY Artnr
ORDER BY Artnr ASC
;

#Erste Lösung
SELECT 
	Artnr,
    A.Bezeichnung,
    count(Artnr) AS "Anzahl Bestandteile"
FROM teilestruktur AS TS
INNER JOIN artikel AS A ON Artnr = A.Anr
#WHERE AnzahlBestandteile > 1
GROUP BY Artnr
HAVING count(Artnr) > 1
ORDER BY Artnr ASC
;

#Zweite Lösung
CREATE OR REPLACE VIEW stueckzahl AS
SELECT 
	*,
    IF(Einheit = 'CM', 1, Anzahl) as stueckzahl
FROM teilestruktur
;

SELECT * FROM stueckzahl;

SELECT 
	Artnr,
    A.Bezeichnung,
    sum(stueckzahl) AS "Anzahl Bestandteile"
FROM stueckzahl AS SZ
INNER JOIN artikel AS A ON Artnr = A.Anr
GROUP BY Artnr
HAVING sum(stueckzahl) > 1
ORDER BY Artnr ASC
;

# Musterlösung
SELECT 
	Artnr,
	Bezeichnung,
    count(Artnr) AS Teile
FROM Teilestruktur INNER JOIN Artikel ON Teilestruktur.Artnr = Artikel.Anr
GROUP BY Artnr,Bezeichnung
HAVING Teile > 1  # wirklich nur zusammengesetzte Artikel > 1
;

/* Query 5
Geben Sie alle Artikel aus, die vom Auftrag mit der Auftragsnummer 2 reserviert sind.
Geben Sie dazu zu jedem Artikel die Artikelnummer, die Artikelbezeichnung und die Anzahl 
der für diesen Auftrag reservierten Artikel aus. 
*/

SELECT * FROM reservierung;
SELECT * FROM auftragsposten;