/*drop tables*/

DROP IF EXISTS EMPLOYEE;
DROP IF EXISTS MANAGER;
DROP IF EXISTS CUSTOMER;
DROP IF EXISTS MENU_ITEM;
DROP IF EXISTS MENU_ORDER;
DROP IF EXISTS INGREDIENT;
DROP IF EXISTS RESERVATION;
DROP IF EXISTS PREPARED_BY;
DROP IF EXISTS MADE_OF;

/* create tables */

CREATE TABLE EMPLOYEE (
    Eid VARCHAR(20) PRIMARY KEY NOT NULL,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    Job_type VARCHAR(20) NOT NULL,
    Pay_rate FLOAT(5) NOT NULL,
    Mid VARCHAR(20) REFERENCES MANAGER(Mid)
);

CREATE TABLE MANAGER (
    Eid VARCHAR(20) NOT NULL REFERENCES EMPLOYEE(Eid),
    Mid VARCHAR(20) NOT NULL,
    PRIMARY KEY (Eid)
);

CREATE TABLE CUSTOMER (
    Cid VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20) NOT NULL
);

CREATE TABLE MENU_ITEM (
    ItemID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    Item_type VARCHAR(10) NOT NULL,
    Item_name VARCHAR(20) NOT NULL,
    Price INTEGER(3) NOT NULL
);

CREATE TABLE MENU_ORDER (
    Oid VARCHAR(10) NOT NULL,
    ItemID VARCHAR(10) NOT NULL,
    Count INTEGER(2) NOT NULL,
    Table_num INTEGER(3) NOT NULL,
    Cid VARCHAR(20) REFERENCES CUSTOMER(Cid),
    Eid VARCHAR(20) NOT NULL REFERENCES EMPLOYEE(Eid),
    PRIMARY KEY (Oid, ItemID)
);

CREATE TABLE INGREDIENT (
    IngredientID VARCHAR(10) NOT NULL,
    Expiration DATE NOT NULL,
    Ingredient_name VARCHAR(20) NOT NULL,
    Count Integer(3),
    PRIMARY KEY (IngredientID, Expiration)
);

CREATE TABLE RESERVATION (
    Rid VARCHAR(20) PRIMARY KEY,
    Cid VARCHAR(20) NOT NULL REFERENCES CUSTOMER(Cid),
    Date DATE NOT NULL,
    Time VARCHAR(5) NOT NULL,
    Num_party INTEGER(2) NOT NULL
);

CREATE TABLE PREPARED_BY (
    Oid VARCHAR(20) NOT NULL REFERENCES MENU_ORDER(Oid),
    ItemID VARCHAR(20) NOT NULL REFERENCES MENU_ITEM(ItemID),
    Eid VARCHAR(20) NOT NULL REFERENCES EMPLOYEE(Eid),
    PRIMARY KEY (Oid, ItemID, Eid)
);

CREATE TABLE MADE_OF (
    ItemID VARCHAR(20) NOT NULL REFERENCES MENU_ITEM(ItemID),
    IngredientID VARCHAR(20) NOT NULL REFERENCES INGREDIENT(IngredientID),
    PRIMARY KEY (ItemID, IngredientID)
);

INSERT INTO EMPLOYEE VALUES("E1", "John", "Deer", "Cook", 20.50, "M0");
INSERT INTO EMPLOYEE VALUES("E2", "Jane", "Doe", "Cook", 20.50, "M0");
INSERT INTO EMPLOYEE VALUES("E3", "Bart", "Ender", "Bartender", 16.00, "M0");
INSERT INTO EMPLOYEE VALUES("E4", "Sally", "Servesalot", "Server", 13.50, "M0");
INSERT INTO EMPLOYEE VALUES("E0", "Molly", "Managerface", "Manager", 26.50, NULL);

INSERT INTO MANAGER VALUES("E0", "M0");

INSERT INTO CUSTOMER VALUES("C1", "Marco", "Polo");
INSERT INTO CUSTOMER VALUES("C2", "Bendy", "McBenderson");
INSERT INTO CUSTOMER VALUES("C3", "Betty", "Crocker");
INSERT INTO CUSTOMER VALUES("C4", "Martha", "Stewart");
INSERT INTO CUSTOMER VALUES("C5", "Guy", "Fieri");

INSERT INTO MENU_ITEM VALUES("D1", "Drink", "Mimosa", 10);
INSERT INTO MENU_ITEM VALUES("D2", "Drink", "Irish Coffee", 12);
INSERT INTO MENU_ITEM VALUES("F1", "Food", "Chicken & Waffles", 15);
INSERT INTO MENU_ITEM VALUES("F2", "Food", "Parfait", 10);
INSERT INTO MENU_ITEM VALUES("F3", "Food", "Breakfast Burrito", 12);

INSERT INTO INGREDIENT VALUES("I1", "2024/03/21", "Prosecco", 10);
INSERT INTO INGREDIENT VALUES("I2", "2030/03/21", "Jameson", 4);
INSERT INTO INGREDIENT VALUES("I3", "2023/03/30", "OJ", 4);
INSERT INTO INGREDIENT VALUES("I4", "2023/04/21", "Coffee", 20);
INSERT INTO INGREDIENT VALUES("I5", "2026/06/15", "Bailey's", 4);
INSERT INTO INGREDIENT VALUES("I6", "2023/03/28", "Chicken", 10);
INSERT INTO INGREDIENT VALUES("I7", "2023/04/04", "Waffles", 10);
INSERT INTO INGREDIENT VALUES("I8", "2023/08/20", "Maple Syrup", 10);
INSERT INTO INGREDIENT VALUES("I9", "2023/04/17", "Yogurt", 12);
INSERT INTO INGREDIENT VALUES("I10", "2023/10/10", "Granola", 8);
INSERT INTO INGREDIENT VALUES("I11", "2023/03/29", "Strawberries", 15);
INSERT INTO INGREDIENT VALUES("I12", "2023/04/20", "Eggs", 26);
INSERT INTO INGREDIENT VALUES("I13", "2023/04/17", "Potato", 6);
INSERT INTO INGREDIENT VALUES("I14", "2023/05/30", "Cheese", 15);
INSERT INTO INGREDIENT VALUES("I15", "2023/04/27", "Onions", 6);
INSERT INTO INGREDIENT VALUES("I16", "2023/06/06", "Tortilla", 15);

INSERT INTO RESERVATION VALUES("R1", "C1", "2023/03/21", "10:00", 1);
INSERT INTO RESERVATION VALUES("R2", "C2", "2023/03/21", "09:00", 2);
INSERT INTO RESERVATION VALUES("R3", "C3", "2023/03/21", "10:15", 1);
INSERT INTO RESERVATION VALUES("R4", "C4", "2023/03/22", "08:00", 2);
INSERT INTO RESERVATION VALUES("R5", "C5", "2023/03/23", "11:00", 1);

INSERT INTO MENU_ORDER VALUES("O1", "D1", 2, 4, "C2", "E4");
INSERT INTO MENU_ORDER VALUES("O2", "F1", 1, 2, "C1", "E4");
INSERT INTO MENU_ORDER VALUES("O3", "F2", 1, 5, "C3", "E4");
INSERT INTO MENU_ORDER VALUES("O4", "F3", 1, 4, "C2", "E4");
INSERT INTO MENU_ORDER VALUES("O5", "D1", 3, 1, "C4", "E0");
INSERT INTO MENU_ORDER VALUES("O6", "D2", 1, 2, "C5", "E0");
INSERT INTO MENU_ORDER VALUES("O7", "F1", 1, 2, "C5", "E0");

INSERT INTO PREPARED_BY VALUES("O1", "D1", "E3");
INSERT INTO PREPARED_BY VALUES("O2", "F1", "E1");
INSERT INTO PREPARED_BY VALUES('O3', 'F2', 'E2');
INSERT INTO PREPARED_BY VALUES('O4', 'F3', 'E2');
INSERT INTO PREPARED_BY VALUES('O5', 'D1', 'E3');
INSERT INTO PREPARED_BY VALUES('O6', 'D2', 'E3');
INSERT INTO PREPARED_BY VALUES('O7', 'F1', 'E1');

INSERT INTO MADE_OF VALUES('D1', 'I1');
INSERT INTO MADE_OF VALUES('D1', 'I3');
INSERT INTO MADE_OF VALUES('D2', 'I2');
INSERT INTO MADE_OF VALUES('D2', 'I4');
INSERT INTO MADE_OF VALUES('D2', 'I5');
INSERT INTO MADE_OF VALUES('F1', 'I6');
INSERT INTO MADE_OF VALUES('F1', 'I7');
INSERT INTO MADE_OF VALUES('F1', 'I8');
INSERT INTO MADE_OF VALUES('F2', 'I9');
INSERT INTO MADE_OF VALUES('F2', 'I10');
INSERT INTO MADE_OF VALUES('F2', 'I11');
INSERT INTO MADE_OF VALUES('F3', 'I12');
INSERT INTO MADE_OF VALUES('F3', 'I13');
INSERT INTO MADE_OF VALUES('F3', 'I14');
INSERT INTO MADE_OF VALUES('F3', 'I15');
INSERT INTO MADE_OF VALUES('F3', 'I16');