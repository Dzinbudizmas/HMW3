create table `UserClicks` (`clickId` INT auto_increment, `userId` INT, `dateTime` DATETIME, primary key(`clickid`));

insert into `UserClicks` (`userId`, `dateTime`) VALUES (1, '2017-01-01'), (1, '2017-01-02'), (1, '2017-01-09'), (2, '2017-01-01'), (2, '2017-01-10'), (1, '2017-02-01'), (1, '2017-02-10'), (2, '2017-02-01');

select count(distinct userId), MONTH(`dateTime`) from `UserClicks` where YEAR(dateTime) = YEAR(curdate())  GROUP BY MONTH(dateTime);



CREATE TABLE `Clients` (`clientId` INT auto_increment, `birthDate` date, primary KEY (`clientId`));

INSERT INTO `Clients` (`birthDate`) VALUES ('1900-10-01'), ('1920-10-17'), ('2000-10-17'), ('1990-10-02');

select clientId, YEAR(FROM_DAYS(DATEDIFF(curdate(), birthDate))) from `Clients` where MONTH(birthDate) = MONTH(curdate()) and DAY(birthDate) = DAY(CURDATE());



create TABLE `News` (`newsId` int auto_increment, `text` text, `date` date, PRIMARY KEY (`newsId`));
CREATE TABLE `Comments` (`commentId` int auto_increment, `text` text, `date` date, `newsId` int, PRIMARY KEY (`commentId`));

INSERT INTO `News` (`text`, `date`) VALUES ('1', '2000-01-01'), ('2', '2000-02-01'), ('3', '2000-03-01'), ('4', '2000-04-01'), ('5', '2000-05-01'), ('6', '2000-06-01'), ('7', '2000-07-01'), ('8', '2000-08-01');
INSERT INTO `Comments` (`text`, `date`, `newsId`) VALUES ('4c1', '2000-04-02', 4), ('4c2', '2000-04-03', 4),('6c1', '2000-06-02', 6), ('6c2', '2000-06-04', 6);

select n.*, (select text from `Comments` where newsId = n.newsId order by date desc limit 1  ) from `News` n ORDER BY n.date DESC limit 10;
