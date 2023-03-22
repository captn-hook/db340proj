SELECT I.name, S.quantity / I.amount FROM Ingredient I, Storage S WHERE I.name = S.name AND I.item LIKE '%burger%' GROUP BY I.name;
SELECT * FROM Sales WHERE cid IN (SELECT cid FROM Customer WHERE name = 'Tom Hiddleston') AND item LIKE '%shake%';
SELECT SUM(price) FROM Menu WHERE item IN (SELECT item FROM Ingredient WHERE name IN (SELECT name FROM Storage WHERE quantity > 0));
SELECT I.name, SUM(I.amount) FROM Ingredient I GROUP BY I.name;
SELECT * FROM Storage WHERE spoil_date = (SELECT MIN(spoil_date) FROM Storage);