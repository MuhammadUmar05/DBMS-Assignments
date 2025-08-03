CREATE DATABASE library_db
CREATE TABLE BOOKS(
book_id SERIAL PRIMARY KEY,
title VARCHAR(60) NOT NULL,
author VARCHAR(60) NOT NULL,
year_published INT NOT NULL,
isAvailable BOOLEAN NOT NULL,
price INT NOT NULL,
publication VARCHAR(60) NOT NULL
);


INSERT INTO BOOKS( title, author, year_published, isavailable, price, publication )
VALUES
('The Alchemist', 'Cohen Paul',1963,TRUE,1100,'AM Publishers'),
('Daffodils', 'William Wordsworth',1500,TRUE,300,'WILL Publishers'),
('The Intern', 'Jake Sean',2012,FALSE,700,'TABOO Publishers'),
('The Wizard of Oz', 'Marilyn Paul',2004,FALSE,500,'Moonlight Publishers'),
('Nottingham', 'Christopher Spree',1996,TRUE,3200,'CAF Publishers'),
('Blue Moon', 'Cohen Paul',1957,TRUE,400,'AM Publishers'),
('Prisoner of Zenda', 'Patrick Richards',2005,FALSE,900,'Saint Peters Publishers'),
('As You Like it', 'William Shakespeare',1427,TRUE,570,'Renaissance Publishers'),
('Elementary Algebra', 'Howard Anton',2010,TRUE,2700,'Nerd Publishers'),
('Harry Potter', 'Lena James',2001,FALSE,4000,'Hogswart Publishers'),
('Fire and Blood', 'George RR Martin',2003,TRUE,400,'GOT Publishers'),
('Chronicles of Narnia', 'George RR Martin',1999,TRUE,1100,'GOT Publishers'),
('Charlotte''s Web', 'Kenneth H Rosen',1951,TRUE,420,'Frost Publishers'),
('Computer Organization', 'William Stallic',2019,TRUE,1400,'Inventory Publishers'),
('War of the Worlds', 'Tom Cruise',2001,FALSE,1700,'GOT Publishers');

SELECT * FROM BOOKS WHERE YEAR_PUBLISHED > 2000;
SELECT * FROM BOOKS WHERE PRICE < 599 ORDER BY PRICE DESC;
SELECT * FROM BOOKS ORDER BY PRICE DESC LIMIT 3;
SELECT * FROM BOOKS ORDER BY YEAR_PUBLISHED DESC OFFSET 2 LIMIT 2;
SELECT * FROM BOOKS WHERE PUBLICATION = 'GOT Publishers' ORDER BY TITLE;



