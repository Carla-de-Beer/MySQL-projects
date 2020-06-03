CREATE SCHEMA book_shop;

use book_shop;

DROP TABLE if exists book;
DROP TABLE if exists author;

CREATE TABLE book (
    book_id INT NOT NULL AUTO_INCREMENT,
    isbn VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    subtitle VARCHAR(255),
    book_description TEXT,
    price DECIMAL(9 , 2 ),
    date_created DATETIME(6),
    date_updated DATETIME(6),
    UNIQUE KEY (isbn),
    PRIMARY KEY (book_id)
);

CREATE TABLE author (
    author_id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    website VARCHAR(255),
    date_created DATETIME(6),
    date_updated DATETIME(6),
    PRIMARY KEY (author_id),
    CONSTRAINT fk_book_author FOREIGN KEY (book_id)
        REFERENCES book (book_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO book VALUES (null, '9781234567897', 'The Database Book', 'Understanding SQL', 
'Tutorial on using SQL with MySQL', 23.99, '2020-04-01', '9999-01-01');

SELECT * FROM book;

INSERT INTO author VALUES (null, 1, 'Carla', 'de Beer', 'carla.debeer@sql.io', 
'+44(0)2078536792', 'www.cadebe.com','2020-04-01', '9999-01-01');

SELECT * FROM author;

ALTER TABLE book add column asin char(10) after isbn;
ALTER TABLE book add column upc decimal(12, 0) after asin;
ALTER TABLE book add column ean decimal(13, 0) after upc;
ALTER TABLE book add column upc_barcode char(12) AS (lpad(upc, 12, '0')) after ean;
ALTER TABLE book add column ean_barcode char(13) AS (lpad(ean, 12, '0')) after upc_barcode;

SELECT lpad(12345678, 12, '0');