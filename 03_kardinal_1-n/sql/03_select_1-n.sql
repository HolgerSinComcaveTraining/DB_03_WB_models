-- 03. Selects

-- Einzeltabellen

SELECT * FROM mydb.cats;
SELECT * FROM mydb.kittens;

SELECT
	cat_name AS Mutter,
    kitten_name AS Kind,
    concat(cat_name, " ist die Mutter von ", kitten_name) AS Verwandschaft
FROM mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id = mydb.kittens.cats_id
;

-- inner join 3 / Wie viele Kinder haben die Katzen?

SELECT
	cat_name AS Katze,
    count(cat_name) AS Kinderzahl
FROM mydb.cats INNER JOIN mydb.kittens
ON mydb.cats.id = mydb.kittens.cats_id
GROUP BY cat_name
;

