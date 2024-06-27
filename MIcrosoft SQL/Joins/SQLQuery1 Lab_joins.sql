
CREATE TABLE Salesperson(
    Salesperson_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission FLOAT
);

INSERT INTO Salesperson VALUES
    (1001, 'Sheharyar', 'Islamabad', 0.25),
    (1002, 'Ahmed', 'Lahore', 0.15),
    (1003, 'Shayan', 'Gilgit', 0.20),
    (1004, 'Aziz', 'Karachi', 0.10);
-------------1----------------	
	SELECT s.name ,c.name,s.city 
FROM Salesperson s 
INNER JOIN customer c ON s.city = c.city;

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    Salesperson_id INT,
    FOREIGN KEY(Salesperson_id) REFERENCES Salesperson(Salesperson_id)
);



INSERT INTO customer VALUES
    (2001, 'Harry potter', 'Lahore', 100, 1001),
    (2002, 'Ron Wisely', 'Rawalpindi', 90, 1002),
    (2003, 'Albes Dumbldor', 'karachi', 70, 1003),
    (2004, 'Tom Cruice', 'Rawalpindi', 80, 1004),
    (2005, 'Ciruis Black', 'Lahore', 85, 1001),
    (2006, 'James Potter', 'Islamabad', 95, 1004);


--------task3-----
SELECT c.name AS 'Customer Name', 
       c.city AS 'City', 
       s.name AS 'Salesperson Name', 
       s.commission AS 'Commission'
FROM customer c
INNER JOIN Salesperson s ON c.Salesperson_id = s.Salesperson_id;
----------------Task4-----------------

SELECT c.name , c.city, s.name , s.commission  
FROM customer c
INNER JOIN Salesperson s ON c.Salesperson_id = s.Salesperson_id
WHERE s.commission > 0.12;
     


CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    purch_amount FLOAT,
    order_date DATE,
    customer_id INT,
    Salesperson_id INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(Salesperson_id) REFERENCES Salesperson(Salesperson_id)
);

INSERT INTO orders VALUES
    (721, 150.5, '2022-11-10', 2002, 1002),
    (722, 200.75, '2022-11-11', 2003, 1003),
    (723, 1225.99, '2022-11-12', 2004, 1004),
    (724, 85.60, '2022-11-13', 2005, 1001),
    (725, 1350.99, '2022-11-15', 2006, 1004);

	--------------Task2----------------
	SELECT o.order_id ,  o.purch_amount ,  c.name ,  c.city 
FROM orders o
INNER JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amount BETWEEN 500 AND 2000;

	-----------------Task5-----------
	SELECT c.name ,  c.city ,  c.grade , s.name ,  s.city 
FROM customer c
INNER JOIN Salesperson s ON c.Salesperson_id = s.Salesperson_id;

----------------Task6------------
SELECT c.name , c.city , c.grade ,  s.name  ,  s.city 
FROM customer c
INNER JOIN Salesperson s ON c.Salesperson_id = s.Salesperson_id
WHERE c.grade < 300;





