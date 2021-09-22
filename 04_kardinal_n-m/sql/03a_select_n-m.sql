-- 3a Selects

USE mydb;

-- 1. Join


SELECT 
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN cats ON servants.cats_id = cats.id
;


-- 2. wer bekommt den Lachs

SELECT 
	servant_name AS Diener,
    product_name AS Produkt,
    cat_name AS Herrschaft
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN cats ON servants.cats_id = cats.id
WHERE product_name LIKE "%Lachs%"
;


SELECT
	CONCAT(
		servant_name,
		" ist der Diener von ",
		cat_name,
        " er kauft, ",
		product_name,
		" somit bekommt ",
		cat_name, 
        " den Lachs."
	)
AS "Wer bekommt den Lachs?"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
WHERE product_name LIKE "%Lachs%"
;


