/* sample data */

INSERT INTO MENU VALUES ('burger', 5, 0);

INSERT INTO INGREDIENT VALUES ('beef', 'burger', 1);
INSERT INTO INGREDIENT VALUES ('bun', 'burger', 2);
INSERT INTO INGREDIENT VALUES ('lettuce', 'burger', .1);
INSERT INTO INGREDIENT VALUES ('tomato', 'burger', .1);
INSERT INTO INGREDIENT VALUES ('cheese', 'burger', .1);
INSERT INTO INGREDIENT VALUES ('onion', 'burger', .1);

INSERT INTO MENU VALUES ('double burger', 7, 0);

INSERT INTO INGREDIENT VALUES ('beef', 'double burger', 2);
INSERT INTO INGREDIENT VALUES ('bun', 'double burger', 2);
INSERT INTO INGREDIENT VALUES ('lettuce', 'double burger', .2);
INSERT INTO INGREDIENT VALUES ('tomato', 'double burger', .2);
INSERT INTO INGREDIENT VALUES ('cheese', 'double burger', .2);
INSERT INTO INGREDIENT VALUES ('onion', 'double burger', .2);

INSERT INTO MENU VALUES ('triple burger', 9, 0);

INSERT INTO INGREDIENT VALUES ('beef', 'triple burger', 3);
INSERT INTO INGREDIENT VALUES ('bun', 'triple burger', 3);
INSERT INTO INGREDIENT VALUES ('lettuce', 'triple burger', .3);
INSERT INTO INGREDIENT VALUES ('tomato', 'triple burger', .3);
INSERT INTO INGREDIENT VALUES ('cheese', 'triple burger', .3);
INSERT INTO INGREDIENT VALUES ('onion', 'triple burger', .3);

INSERT INTO MENU VALUES ('fries', 3, 0);

INSERT INTO INGREDIENT VALUES ('potato', 'fries', 1);
INSERT INTO INGREDIENT VALUES ('oil', 'fries', .1);

INSERT INTO MENU VALUES ('vanilla shake', 4, 0);

INSERT INTO INGREDIENT VALUES ('ice cream', 'vanilla shake', 1);
INSERT INTO INGREDIENT VALUES ('milk', 'vanilla shake', 1);
INSERT INTO INGREDIENT VALUES ('vanilla', 'vanilla shake', .1);

INSERT INTO MENU VALUES ('chocolate shake', 4, 0);

INSERT INTO INGREDIENT VALUES ('ice cream', 'chocolate shake', 1);
INSERT INTO INGREDIENT VALUES ('milk', 'chocolate shake', 1);
INSERT INTO INGREDIENT VALUES ('chocolate', 'chocolate shake', .1);

INSERT INTO MENU VALUES ('salad', 4, 0);

INSERT INTO INGREDIENT VALUES ('lettuce', 'salad', 1);
INSERT INTO INGREDIENT VALUES ('tomato', 'salad', 1);
INSERT INTO INGREDIENT VALUES ('onion', 'salad', 1);

INSERT INTO MENU VALUES ('chicken nuggets', 5, 0);

INSERT INTO INGREDIENT VALUES ('chicken', 'chicken nuggets', 1);

INSERT INTO STORAGE VALUES ('chicken', 10, '2023-01-02');
INSERT INTO STORAGE VALUES ('beef', 10, '2023-01-02');
INSERT INTO STORAGE VALUES ('bun', 10, '2023-01-01');
INSERT INTO STORAGE VALUES ('lettuce', 10, '2023-02-04');
INSERT INTO STORAGE VALUES ('tomato', 10, '2023-01-11');
INSERT INTO STORAGE VALUES ('cheese', 10, '2023-03-21');
INSERT INTO STORAGE VALUES ('onion', 10, '2023-01-01');
INSERT INTO STORAGE VALUES ('potato', 10, '2023-07-01');
INSERT INTO STORAGE VALUES ('oil', 10, '2023-11-01');
INSERT INTO STORAGE VALUES ('ice cream', 10, '2023-01-21');
INSERT INTO STORAGE VALUES ('milk', 10, '2023-01-01');
INSERT INTO STORAGE VALUES ('vanilla', 10, '2023-01-01');
INSERT INTO STORAGE VALUES ('chocolate', 10, '2023-01-11');

INSERT INTO EMPLOYEE VALUES (1, 'Mr Man', 10000, 'manager');
INSERT INTO EMPLOYEE VALUES (2, 'Jane Badall', 5000, 'server');
INSERT INTO EMPLOYEE VALUES (3, 'Joe Mama', 5000, 'server');
INSERT INTO EMPLOYEE VALUES (4, 'Jill Biden', 6000, 'cook');
INSERT INTO EMPLOYEE VALUES (5, 'Jack Uhvaltraeds', 6000, 'cook');

INSERT INTO CUSTOMER VALUES (1, 'Bob Bob', '555-444-5555', '123 Main St');
INSERT INTO CUSTOMER VALUES (2, 'Sad Sally', '555-333-5555', '123 Other St');
INSERT INTO CUSTOMER VALUES (3, 'Tom Hiddleston', '222-555-5555', '123 Lost St');
INSERT INTO CUSTOMER VALUES (4, 'Mary Me', '555-555-111', '1323 Found Rd');

INSERT INTO SALES VALUES ('2023-01-01', 1, 2, 'burger');
INSERT INTO SALES VALUES ('2023-01-01', 1, 2, 'fries');

INSERT INTO SALES VALUES ('2023-01-02', 2, 3, 'burger');
INSERT INTO SALES VALUES ('2023-01-02', 2, 3, 'fries');

INSERT INTO SALES VALUES ('2023-01-03', 3, 2, 'double burger');
INSERT INTO SALES VALUES ('2023-01-03', 3, 2, 'chocolate shake');

INSERT INTO RESERVATION VALUES ('2023-01-01', '1:00', 2);
INSERT INTO RESERVATION VALUES ('2023-01-01', '2:00', 3);
INSERT INTO RESERVATION VALUES ('2023-01-01', '3:00', 4);
