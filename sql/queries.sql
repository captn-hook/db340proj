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

/* gets the amount of each ingredient in storage divided by the amount in a item */
SELECT I.name, S.quantity / I.amount FROM Ingredient I, Storage S WHERE I.name = S.name AND I.item LIKE '%burger%' GROUP BY I.name;

/* gets the amount of milkshakes sold by Tom Hiddleston */
SELECT * FROM Sales WHERE cid IN (SELECT cid FROM Customer WHERE name = 'Tom Hiddleston') AND item LIKE '%shake%';

/* gets the max profit from the curent storage */
SELECT SUM(price) FROM Menu WHERE item IN (SELECT item FROM Ingredient WHERE name IN (SELECT name FROM Storage WHERE quantity > 0));

/* a measure of how much of each ingredient is used in the menu */
SELECT I.name, SUM(I.amount) FROM Ingredient I GROUP BY I.name;

/* gets the soonest to expire ingredient */
SELECT * FROM Storage WHERE spoil_date = (SELECT MIN(spoil_date) FROM Storage);