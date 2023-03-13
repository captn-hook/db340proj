/* Queries */

SELECT * FROM Menu;
SELECT * FROM Ingredient;
SELECT * FROM Storage;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Sales;

SELECT * FROM Menu WHERE sales > 0;

SELECT name, SUM(amount) FROM Ingredient GROUP BY name;

SELECT * FROM Storage WHERE quantity < 1;

SELECT * FROM Employee WHERE position = 'server';

SELECT * FROM Customer WHERE cid IN (SELECT cid FROM Sales);

SELECT name, quantity FROM Storage WHERE (SELECT SUM(name) FROM Sales WHERE name = Storage.name) > quantity;