DROP TABLE IF EXISTS card_holder CASCADE; 
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;


CREATE TABLE card_holder (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE credit_card (
    card VARCHAR(20) PRIMARY KEY NOT NULL,
    cardholder_id INT, 
    FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(15)
);

CREATE TABLE merchant (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    id_merchant_category INT,
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction (
    id INT NOT NULL PRIMARY KEY,
    date TIMESTAMP,
    amount FLOAT(20),
    card VARCHAR(20),
    id_merchant INT,
    FOREIGN KEY (card) REFERENCES credit_card(card),
    FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);