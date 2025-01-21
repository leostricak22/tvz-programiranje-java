DROP TABLE IF EXISTS RESTAURANT_MEAL;
DROP TABLE IF EXISTS RESTAURANT_ORDER_MEAL;
DROP TABLE IF EXISTS RESTAURANT_ORDER;
DROP TABLE IF EXISTS RESTAURANT_CHEF;
DROP TABLE IF EXISTS RESTAURANT_WAITER;
DROP TABLE IF EXISTS RESTAURANT_DELIVERER;
DROP TABLE IF EXISTS CHEF;
DROP TABLE IF EXISTS WAITER;
DROP TABLE IF EXISTS DELIVERER;
DROP TABLE IF EXISTS CONTRACT;
DROP TABLE IF EXISTS MEAL_INGREDIENT;
DROP TABLE IF EXISTS INGREDIENT;
DROP TABLE IF EXISTS MEAL;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS RESTAURANT;
DROP TABLE IF EXISTS ADDRESS;

CREATE TABLE CATEGORY(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(25) NOT NULL,
    DESCRIPTION VARCHAR(250) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE INGREDIENT(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(25) NOT NULL,
    CATEGORY_ID LONG NOT NULL,
    KCAL DECIMAL(6,2) NOT NULL,
    PREPARATION_METHOD VARCHAR(255),
    PRIMARY KEY (ID),
FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(ID)
);

CREATE TABLE MEAL(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(25) NOT NULL,
    CATEGORY_ID LONG NOT NULL,
    PRICE DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(ID)
);

CREATE TABLE MEAL_INGREDIENT(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    MEAL_ID LONG NOT NULL,
    INGREDIENT_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(MEAL_ID ) REFERENCES MEAL(ID),
    FOREIGN KEY(INGREDIENT_ID ) REFERENCES INGREDIENT(ID)
);

CREATE TABLE CONTRACT(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    SALARY DECIMAL(6,2) NOT NULL,
    BONUS DECIMAL(6,2) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE,
    TYPE VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE CHEF(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    BONUS DECIMAL(6,2) NOT NULL,
    CONTRACT_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(CONTRACT_ID) REFERENCES CONTRACT(ID)

);

CREATE TABLE WAITER(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    BONUS DECIMAL(6,2) NOT NULL,
    CONTRACT_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(CONTRACT_ID) REFERENCES CONTRACT(ID)
);

CREATE TABLE DELIVERER(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    BONUS DECIMAL(6,2) NOT NULL,
    CONTRACT_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(CONTRACT_ID) REFERENCES CONTRACT(ID)
);

CREATE TABLE ADDRESS(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    STREET VARCHAR(50) NOT NULL,
    HOUSE_NUMBER VARCHAR(10) NOT NULL,
    CITY VARCHAR(30) NOT NULL,
    POSTAL_CODE INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE RESTAURANT(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(25) NOT NULL,
    ADDRESS_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(ADDRESS_ID ) REFERENCES ADDRESS(ID)
);

CREATE TABLE RESTAURANT_MEAL(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ID LONG NOT NULL,
    MEAL_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(RESTAURANT_ID ) REFERENCES RESTAURANT(ID),
    FOREIGN KEY(MEAL_ID ) REFERENCES MEAL(ID)
);


CREATE TABLE RESTAURANT_CHEF(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ID LONG NOT NULL,
    CHEF_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(CHEF_ID ) REFERENCES CHEF(ID),
    FOREIGN KEY(RESTAURANT_ID ) REFERENCES RESTAURANT(ID)
);

CREATE TABLE RESTAURANT_WAITER(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ID LONG NOT NULL,
    WAITER_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(WAITER_ID ) REFERENCES WAITER(ID),
    FOREIGN KEY(RESTAURANT_ID ) REFERENCES RESTAURANT(ID)
);

CREATE TABLE RESTAURANT_DELIVERER(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ID LONG NOT NULL,
    DELIVERER_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(DELIVERER_ID) REFERENCES DELIVERER(ID),
    FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(ID)
);

CREATE TABLE RESTAURANT_ORDER(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ID LONG NOT NULL,
    DELIVERER_ID LONG NOT NULL,
    DATE_AND_TIME TIMESTAMP NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(RESTAURANT_ID) REFERENCES RESTAURANT(ID),
    FOREIGN KEY(DELIVERER_ID) REFERENCES DELIVERER(ID)
);

CREATE TABLE RESTAURANT_ORDER_MEAL(
    ID LONG GENERATED ALWAYS AS IDENTITY,
    RESTAURANT_ORDER_ID LONG NOT NULL,
    MEAL_ID LONG NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY(RESTAURANT_ORDER_ID) REFERENCES RESTAURANT_ORDER(ID),
    FOREIGN KEY(MEAL_ID) REFERENCES MEAL(ID)
);

INSERT INTO CATEGORY(NAME, DESCRIPTION) VALUES('MEAT', 'Meat food or ingredient');
INSERT INTO CATEGORY(
     NAME,
     DESCRIPTION
) VALUES('VEGETABLES', 'Vegetables food or ingredient');
INSERT INTO CATEGORY(NAME, DESCRIPTION) VALUES('VEGAN', 'Vegan food or
ingredient');
INSERT INTO INGREDIENT(NAME, CATEGORY_ID, KCAL, PREPARATION_METHOD)
VALUES('Meat for ćevapi', 1, 1000, 'Barbecue');
INSERT INTO INGREDIENT(NAME, CATEGORY_ID, KCAL, PREPARATION_METHOD)
VALUES('Season salad', 2, 50, 'Raw');
INSERT INTO INGREDIENT(NAME, CATEGORY_ID, KCAL, PREPARATION_METHOD)
VALUES('Falafel', 1, 100, 'Frying');
INSERT INTO MEAL(NAME, CATEGORY_ID, PRICE)
VALUES('Ćevapi with salad', 1, 10.00);
INSERT INTO MEAL(NAME, CATEGORY_ID, PRICE)
VALUES('Falafel with salad', 3, 12.00);
INSERT INTO MEAL_INGREDIENT(MEAL_ID, INGREDIENT_ID) VALUES(1, 1);
INSERT INTO MEAL_INGREDIENT(MEAL_ID, INGREDIENT_ID) VALUES(1, 1);
INSERT INTO MEAL_INGREDIENT(MEAL_ID, INGREDIENT_ID) VALUES(2, 2);
INSERT INTO MEAL_INGREDIENT(MEAL_ID, INGREDIENT_ID) VALUES(2, 3);

INSERT INTO CONTRACT(SALARY, BONUS, START_DATE, TYPE) VALUES(3000, 500, '2010-01-01','FULL_TIME');
INSERT INTO CONTRACT(SALARY, BONUS, START_DATE, TYPE) VALUES(3000, 500, '2011-01-01', 'FULL_TIME');
INSERT INTO CONTRACT(SALARY, BONUS, START_DATE, TYPE) VALUES(3000, 500, '2012-01-01', 'FULL_TIME');
INSERT INTO CONTRACT(SALARY, BONUS, START_DATE, TYPE) VALUES(3000, 500, '2013-01-01', 'FULL_TIME');
INSERT INTO CONTRACT(SALARY, BONUS, START_DATE, TYPE) VALUES(3000, 500, '2014-01-01', 'FULL_TIME');

INSERT INTO CHEF(FIRST_NAME, LAST_NAME, CONTRACT_ID, BONUS) VALUES('Ivo', 'Kuhar', 1, 100);
INSERT INTO CHEF(FIRST_NAME, LAST_NAME, CONTRACT_ID, BONUS) VALUES('Janica', 'Kuharica', 4, 200);
INSERT INTO CHEF(FIRST_NAME, LAST_NAME, CONTRACT_ID, BONUS) VALUES('Ivica', 'Gurman', 5, 300);
INSERT INTO WAITER(FIRST_NAME, LAST_NAME, CONTRACT_ID, BONUS) VALUES('Martina', 'Konobar', 2, 400);
INSERT INTO DELIVERER(FIRST_NAME, LAST_NAME, CONTRACT_ID, BONUS) VALUES('Zdravko', 'Dostavljač', 3, 500);
INSERT INTO ADDRESS(STREET, HOUSE_NUMBER, CITY, POSTAL_CODE) VALUES('Ante Starčevića',
            '32', 'Koprivnica', 48000);
INSERT INTO RESTAURANT(NAME, ADDRESS_ID) VALUES('Mesne delicije i ostalo', 1);
INSERT INTO RESTAURANT_CHEF(RESTAURANT_ID, CHEF_ID)
VALUES(1,1);
INSERT INTO RESTAURANT_WAITER(RESTAURANT_ID, WAITER_ID)
VALUES(1,1);
INSERT INTO RESTAURANT_DELIVERER(RESTAURANT_ID, DELIVERER_ID)
VALUES(1,1);
INSERT INTO RESTAURANT_ORDER(RESTAURANT_ID, DELIVERER_ID, DATE_AND_TIME)
VALUES(1,1, CURRENT_TIMESTAMP);
INSERT INTO RESTAURANT_MEAL(RESTAURANT_ID, MEAL_ID)
VALUES(1,1);
INSERT INTO RESTAURANT_MEAL(RESTAURANT_ID, MEAL_ID)
VALUES(1,2);
INSERT INTO RESTAURANT_ORDER_MEAL(RESTAURANT_ORDER_ID, MEAL_ID)
VALUES(1,1);
INSERT INTO RESTAURANT_ORDER_MEAL(RESTAURANT_ORDER_ID, MEAL_ID)
VALUES(1,2);
INSERT INTO ADDRESS(STREET, HOUSE_NUMBER, CITY, POSTAL_CODE) VALUES('Ilica', '1','Zagreb', 10000);
INSERT INTO RESTAURANT(NAME, ADDRESS_ID) VALUES('Veganize', 2);
INSERT INTO RESTAURANT_CHEF(RESTAURANT_ID, CHEF_ID)
VALUES(2,2);
INSERT INTO RESTAURANT_CHEF(RESTAURANT_ID, CHEF_ID)
VALUES(2,3);