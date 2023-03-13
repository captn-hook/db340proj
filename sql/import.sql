/* create tables */

CREATE TABLE MENU (
            item VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE ,
            price INTEGER(5) NOT NULL,
            sold INTEGER(5) NOT NULL DEFAULT 0
        );

        CREATE TABLE INGREDIENT (
            name VARCHAR(30) NOT NULL REFERENCES STORAGE(name),
            item VARCHAR(30) NOT NULL REFERENCES MENU(item),
            amount FLOAT(5) NOT NULL,
            PRIMARY KEY (name, item)
        );

        CREATE TABLE STORAGE (
            name VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE,
            quantity FLOAT(5) NOT NULL,
            spoil_date VARCHAR(8) NOT NULL
        );

        CREATE TABLE EMPLOYEE (
            eid INTEGER(6) PRIMARY KEY NOT NULL UNIQUE,
            name VARCHAR(25) NOT NULL,
            salary INTEGER(8) NOT NULL,
            position VARCHAR(25) NOT NULL
        );

        CREATE TABLE CUSTOMER (
            cid INTEGER(10) PRIMARY KEY NOT NULL UNIQUE,
            name VARCHAR(25) NOT NULL,
            phone TEXT NOT NULL,
            address TEXT NOT NULL
        );

        CREATE TABLE SALES (
            date VARCHAR(8) NOT NULL,
            cid INTEGER(10) REFERENCES CUSTOMER(cid),
            server INTEGER(6) REFERENCES EMPLOYEE(eid),
            item VARCHAR(30) NOT NULL REFERENCES MENU(item),
            PRIMARY KEY (date, cid, item)
        );

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

        CREATE TRIGGER DELETESALESTRIGGER
            AFTER DELETE ON SALES
            BEGIN
                UPDATE MENU
                SET sold = sold - 1
                WHERE item = OLD.item;
                UPDATE STORAGE
                SET quantity = quantity + 1
                WHERE name = (SELECT name FROM INGREDIENT WHERE item = OLD.item);
            END;