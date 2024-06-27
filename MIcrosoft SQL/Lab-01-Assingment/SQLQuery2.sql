-- 1. Retrieve the titles of all books in the library.
SELECT title FROM Books;

-- 2. Retrieve the names of all authors present in the database.
SELECT name FROM Authors;

-- 3. List the names of all publishers stored in the database.
SELECT name FROM Publishers;

-- 4. Retrieve the titles of all books published after the year 2000.
SELECT title FROM Books WHERE publication_year > 2000;

-- 5. Retrieve the names of all authors sorted alphabetically.
SELECT name FROM Authors ORDER BY name ASC;

-- 6. Write a SQL query to count the total number of books present in the library.
SELECT COUNT(*) AS total_books FROM Books;

-- 7. Write a SQL query to retrieve the titles of all books written by 'Author 1'.
SELECT b.title 
FROM Books b 
JOIN Book_Authors ba ON b.ISBN = ba.ISBN 
JOIN Authors a ON ba.author_id = a.author_id 
WHERE a.name = 'Author 1';

-- 8. Write a SQL statement to delete all records from the Books table where the publication year is before 2010.
DELETE FROM Books WHERE publication_year < 2010;

-- 9. Retrieve the names of all authors who have not written any books.
SELECT name 
FROM Authors 
LEFT JOIN Book_Authors ON Authors.author_id = Book_Authors.author_id 
WHERE Book_Authors.author_id IS NULL;

-- 10. Write a SQL query to retrieve the names of all books borrowed by a specific borrower with borrower ID '123'.
SELECT b.title 
FROM Books b 
JOIN Borrowers_Books bb ON b.ISBN = bb.ISBN 
WHERE bb.borrower_id = '123';

-- 11. Retrieve the titles of all books along with their corresponding publisher names.
SELECT b.title, p.name AS publisher_name 
FROM Books b 
JOIN Publishers p ON b.publisher_id = p.publisher_id;
