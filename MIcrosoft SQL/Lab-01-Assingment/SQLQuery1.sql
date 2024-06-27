create table Authors(
AuthorID varchar(15) Primary key,
AuthorName varchar(20)
);

Create Table Publishers(
PublisherID varchar(15) Primary key,
PublisherName varchar(20)
publication_year int
);

Create Table Books(
ISBN varchar(15) Primary key,
Title varchar(15)
);

Create Table bookAuthors(
ISBN varchar(15),
AuthorID varchar(20)
);

Create Table bookBorrowers(
BorrowerID varchar(15),
ISBN varchar(15),
BorrowDate int,
ReturnDate int
);
Create Table Borrowers(
BorrowerID varchar(15),
BorrowerName varchar(15)
);

Insert into Authors Values('720', 'Mr.Potter')
Insert into Authors Values('721', 'Servus Snap')
Insert into Authors Values('720', 'Demorgon')

Insert into Publishers  Values('702', 'Prof.Dumdeldor',2004)
Insert into Publishers Values('703', 'Ron Wisely',2014)
Insert into Publishers Values('704', 'Hermoini Greager',2024)

Insert into Books  Values('712', 'rules of Power')
Insert into Books Values('713', 'Your future')
Insert into Books Values('719', 'Dark Soul')

Insert into bookAuthors  Values('722', '1234')
Insert into bookAuthors Values('723', '74674')
Insert into bookAuthors Values('724', '1334')

Insert into bookBorrowers  Values('732', '3691',02-10-2004,02-11-2004)
Insert into bookBorrowers Values('733', '3692',03-10-2004,03-11-2004)
Insert into bookBorrowers Values('734', '3693', 04-10-2004,04-11-2004)

Insert into Borrowers  Values('742', 'Prof.Dumdeldor')
Insert into Borrowers Values('743', 'Ron Wisely')
Insert into Borrowers Values('744', 'Hermoini')

SELECT Title FROM Books;
SELECT AuthorName FROM Authors;
SELECT PublisherName FROM Publishers;

SELECT Title FROM Books WHERE publication_year > 2000;

SELECT AuthorName FROM Authors ORDER BY name 'Prof.Dumdeldor';

SELECT COUNT(*) AS total_books FROM Books;

SELECT b.title 
FROM Books b 
JOIN bookAuthors ba ON b.ISBN = ba.ISBN 
JOIN Authors a ON ba.author_id = a.author_id 
WHERE a.name = 'Author 1';

DELETE FROM Books WHERE publication_year < 2010;