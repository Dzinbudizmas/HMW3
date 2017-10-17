CREATE TABLE IF NOT EXISTS `Genres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

ALTER TABLE `Books` ADD `genreId` INT(11) DEFAULT NULL;

INSERT INTO `Genres` (`genreId`, `genre`) VALUES (1, 'Horror'), (2, 'Guide'), (3, 'Poetry'), (4, 'Drama');

UPDATE `Books` SET genreId=1 where bookId = 6;
UPDATE `Books` SET genreId=2 where bookId = 7;
UPDATE `Books` SET genreId=3 where bookId = 8;

CREATE TABLE IF NOT EXISTS `BookAuthors` (
  `authorId` INT(11) NOT NULL,
  `bookId` INT(11) NOT NULL,
  PRIMARY KEY (`authorId`, `bookId`)
) Engine=MyISAM;

INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (5, 6), (7, 7), (3, 8);

ALTER TABLE `Books` DROP COLUMN `authorId`;

INSERT INTO `Books` (`title`, `year`, `genreId`) VALUES ('Big dream of red elephant', 2020, 4);
INSERT INTO `Books` (`title`, `year`, `genreId`) VALUES ('Small rabbit in wolf house', 1923, 1);

INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (1, (SELECT bookId FROM `Books` WHERE title = 'Big dream of red elephant'));
INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (3, (SELECT bookId FROM `Books` WHERE title = 'Big dream of red elephant'));
INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (7, (SELECT bookId FROM `Books` WHERE title = 'Big dream of red elephant'));

INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (4, (SELECT bookId FROM `Books` WHERE title = 'Small rabbit in wolf house'));
INSERT INTO `BookAuthors` (`authorId`, `bookId`) VALUES (5, (SELECT bookId FROM `Books` WHERE title = 'Small rabbit in wolf house'));

SELECT b.title, GROUP_CONCAT(a.name) FROM `Books` b INNER JOIN `BookAuthors` ba ON b.bookId = ba.bookId INNER JOIN `Authors` a ON ba.authorId = a.AuthorId GROUP BY b.title;

ALTER TABLE `Books` CONVERT TO CHARACTER SET utf8;

INSERT INTO `Books` (`title`) VALUES ('Lietuvių liaudies pratarmė apie ąčęėįšųūž');