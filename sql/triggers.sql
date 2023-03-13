
CREATE TRIGGER SALESTRIGGER 
AFTER INSERT ON SALES 
BEGIN 
UPDATE MENU 
SET sold = sold + 1 
WHERE item = NEW.item; 
UPDATE STORAGE 
SET quantity = quantity - 1 
WHERE name = (SELECT name FROM INGREDIENT WHERE item = NEW.item); 
END;