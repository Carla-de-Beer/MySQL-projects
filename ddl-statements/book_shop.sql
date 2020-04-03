create schema book_shop;

use book_shop;

drop table if exists book;
drop table if exists author;

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

insert into book values (null, '9781234567897', 'The Database Book', 'Understanding SQL', 
'Tutorial on using SQL with MySQL', 23.99, '2020-04-01', '9999-01-01');

select * from book;

insert into author values (null, 1, 'Carla', 'de Beer', 'carla.debeer@sql.io', 
'+44(0)2078536792', 'www.cadebe.com','2020-04-01', '9999-01-01');

select * from author;

alter table book add column asin char(10) after isbn;
alter table book add column upc decimal(12, 0) after asin;
alter table book add column ean decimal(13, 0) after upc;
alter table book add column upc_barcode char(12) as (lpad(upc, 12, '0')) after ean;
alter table book add column ean_barcode char(13) as (lpad(ean, 12, '0')) after upc_barcode;

select lpad(12345678, 12, '0');