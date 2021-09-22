-- SELECTS

-- Einzeltabellen

SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

SELECT * FROM mydb.cats JOIN mydb.servants;

-- Inner Join 1 / Gesamte Tabelle
SELECT
	*
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
;

-- Inner Join 2 / Wer dient wem
-- Wer dient Grizabella
-- Wem dient Fatih

SELECT
	cat_name AS Katze,
    servant_name AS Diener
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE servant_name = "Holger"
;

-- Inner Join 2a / (wer dient wem?)
-- "X ist der Diener von y" / Dienstverhältnis

SELECT
	concat(servant_name, " ist der Diener von ", cat_name) AS Dienstverhältnis
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
#WHERE servant_name = "Holger"
;

-- Inner Join 3 / Dienstzeit
SELECT
	servant_name Diener,
    yrs_served AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
;

-- Inner Join 4 / Dienstzeit
-- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit"

SELECT
	concat(servant_name, " - der Diener von ", cat_name, " - ist der Diener mit der längsten Dienstzeit") AS "längste Dienstzeit"
	#MAX(yrs_served) AS Dienstzeit
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE yrs_served = (SELECT MAX(yrs_served) FROM mydb.servants)
;

DROP VIEW IF EXISTS mydb.max_time;
CREATE VIEW mydb.max_time AS
	SELECT
		MAX(yrs_served)
	FROM mydb.servants;
    
SELECT * FROM mydb.max_time;
    
    
    

    
    