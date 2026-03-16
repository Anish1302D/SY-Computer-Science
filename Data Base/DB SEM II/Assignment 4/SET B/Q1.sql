CREATE TABLE wholesaler(
w_no INT PRIMARY KEY,
w_name VARCHAR(20),
address VARCHAR(30),
city VARCHAR(20)
);

CREATE TABLE product(
product_no INT PRIMARY KEY,
product_name VARCHAR(20),
rate INT
);

CREATE TABLE wholesale_product(
w_no INT,
product_no INT,
quantity INT,
PRIMARY KEY(w_no,product_no)
);

INSERT INTO wholesaler VALUES
(1,'ABC Traders','Pune','Pune'),
(2,'XYZ Suppliers','Mumbai','Mumbai');

INSERT INTO product VALUES
(101,'Laptop',50000),
(102,'Mobile',20000),
(103,'Printer',15000);

INSERT INTO wholesale_product VALUES
(1,101,100),
(1,102,80),
(2,103,120);

CREATE OR REPLACE FUNCTION insert_quantity(q INT)
RETURNS VOID AS $$

BEGIN

IF q < 50 OR q > 200 THEN
RAISE EXCEPTION 'quantity_out_of_range';
END IF;

RAISE NOTICE 'Valid Quantity %',q;

END;
$$ LANGUAGE plpgsql;

SELECT insert_quantity(100);

CREATE OR REPLACE FUNCTION check_rate(r INT)
RETURNS VOID AS $$

BEGIN

IF r <= 0 THEN
RAISE EXCEPTION 'Invalid_Rate_Value';
END IF;

RAISE NOTICE 'Correct Input';

END;
$$ LANGUAGE plpgsql;

SELECT check_rate(200);

CREATE OR REPLACE FUNCTION product_details(pname VARCHAR)
RETURNS VOID AS $$

DECLARE
rec RECORD;

BEGIN

SELECT * INTO rec
FROM product
WHERE product_name = pname;

IF rec IS NULL THEN
RAISE EXCEPTION 'Invalid_Product_Name';
END IF;

RAISE NOTICE 'Product No: %, Rate: %',rec.product_no,rec.rate;

END;
$$ LANGUAGE plpgsql;

SELECT product_details('Laptop');