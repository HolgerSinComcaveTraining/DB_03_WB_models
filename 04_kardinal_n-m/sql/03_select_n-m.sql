

SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;



-- inner Join 1

SELECT 
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Holger gekauft
-- Wieviel Geld hat Holger ausgegeben

SELECT 
	#servant_name AS Diener,
    #product_name AS "von Holger gekaufte Produkte"
    concat(
    servant_name,
    " kauft ",
    count(product_name),
    " Produkte für ",
    sum(product_price),
    "€."
    ) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Holger"
;

SELECT 
	servant_name AS Diener,
    count(servant_name) AS Artikelanzahl,
    sum(product_price) AS Gesamtkosten
    #product_name AS "von Holger gekaufte Produkte"
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY servant_name
HAVING servant_name = "Holger"
;

-- wer hat Produkt X gekauft?
-- Irgendwas mit Lachs
-- Spalten Diener / Produkt
-- where / like


SELECT 
	servant_name AS Diener,
    product_name As Produkt
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE product_name LIKE "%Lachs" OR product_name LIKE "%Jelly"
;


-- Wie of wurde das Produkt X gekauft?
SELECT 
	#servant_name AS Diener,
    product_name As Produkt,
    count(product_name) AS Anzahl
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name

;

-- welche Umsätze hatte Produkt X
SELECT 
	#servant_name AS Diener,
    product_name As Produkt,
    count(product_name) AS Anzahl,
    sum(product_price) AS Umsatz
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name




