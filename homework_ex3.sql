
mysql -u root -proot
create database Books;
use Books;
SOURCE /home/delusion/Downloads/Books.sql;


INSERT INTO `Authors` (`authorId`, `name`) VALUES (8, 'Paulo Coelho'), (9, 'Dan Brown'), (10, 'George Crowder'), (11, 'Bella Forrest'), (12, 'Andreas Kollender');

INSERT INTO `Books` (`authorId`, `title`, `year`) VALUES (8, 'Eleven Minutes', 2013), (8, 'Brida', 1990), (9, 'Inferno', 2013), (9, 'The Da Vinci Code', 2003), (11, 'A Shade of Vampire', 2012), (11, 'A Clan of Novaks', 2016), (12, 'The Honest Spy', 2017), (12, 'Kolbe', 2015);

DELETE b FROM `Books` b INNER JOIN `Authors` a ON a.authorId = b.authorId;

update `Books` SET authorId = 10;
update `Books` SET authorId = 11 WHERE bookId = 7;
update `Books` SET authorId = 8 WHERE bookId = 8;
update `Books` SET authorId = 7 WHERE authorId = 11;


SELECT COUNT(b.authorId), a.Name FROM `Books` b INNER JOIN `Authors` a ON a.authorId = b.authorId GROUP BY a.name ORDER BY 1 DESC, a.name;
SELECT COUNT(b.authorId), a.name FROM `Books` b RIGHT JOIN `Authors` a ON a.authorId = b.authorId GROUP BY a.name ORDER BY 1 DESC, a.name;

DELETE a FROM `Authors` a WHERE a.authorId IN (8, 9, 10, 11, 12);

DELETE b FROM `Books` b WHERE b.authorId IS NULL;


