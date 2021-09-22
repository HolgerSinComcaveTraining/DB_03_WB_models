
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
    

/* Query 3
Geben Sie alle Artikel der Relation Lager aus, deren Bestand abzüglich 
des Mindestbestands und der Reservierungen unter den Wert 3 gesunken ist. 
Als Ausgabe werden Artikelnummer und Artikelbezeichnung erwartet.
*/
-- Bedingung:  (Bestand - Mindbest - Reserviert) < 3

/* Query 4
Aus wie vielen Einzelheiten bestehen alle zusammengesetzten Artikel?
Falls ein Einzelteil wieder aus noch kleineren Einzelteilen besteht, 
so ist dies nicht weiter zu berücksichtigen. Tab. Teilestruktur --> Anzahl
*/

/* Query 5
Geben Sie alle Artikel aus, die vom Auftrag mit der Auftragsnummer 2 reserviert sind.
Geben Sie dazu zu jedem Artikel die Artikelnummer, die Artikelbezeichnung und die Anzahl 
der für diesen Auftrag reservierten Artikel aus. 
*/