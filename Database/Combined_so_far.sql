drop database ecom_platform;

-- Create the Ecom_plaquarterly_sales_reports_for_yeartform schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS Ecom_platform DEFAULT CHARACTER SET utf8;
USE Ecom_platform;

-- Create the Product table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product (
  product_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(127) NOT NULL,
  weight VARCHAR(31) NOT NULL,
  brand VARCHAR(31) NOT NULL,
  description TEXT,
  Variant_attribute_type_1 VARCHAR(31) NOT NULL,
  Variant_attribute_type_2 VARCHAR(31) NOT NULL,
  PRIMARY KEY (product_id)
) ENGINE = InnoDB;

-- Create the Category table
CREATE TABLE IF NOT EXISTS Ecom_platform.Category (
  category_id INT NOT NULL AUTO_INCREMENT,
  parent_category_id INT,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY (category_id),
  CONSTRAINT fk_Category_Category1
    FOREIGN KEY (parent_category_id)
    REFERENCES Ecom_platform.Category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
CREATE INDEX name_idx ON Category(name);

-- Create the Product_Sub_Category table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product_Sub_Category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  CONSTRAINT fk_Product_Sub_Category_Category
    FOREIGN KEY (category_id)
    REFERENCES Ecom_platform.Category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Product_Sub_Category_Product
    FOREIGN KEY (product_id)
    REFERENCES Ecom_platform.Product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Create the User table
CREATE TABLE IF NOT EXISTS Ecom_platform.`User` (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_type VARCHAR(31) NOT NULL,
  first_name VARCHAR(64) NULL,
  last_name VARCHAR(64) NULL,
  email VARCHAR(128) NULL,
  password_hash VARCHAR(256) NULL,
  phone_number VARCHAR(64) NULL,
  address_line01 VARCHAR(128) NULL,
  address_city VARCHAR(64) NULL,
  address_state VARCHAR(64) NULL,
  address_zip_code VARCHAR(64) NULL,
  address_country VARCHAR(64) NULL,
  PRIMARY KEY (user_id)
) ENGINE = InnoDB;
CREATE INDEX email_idx
	ON user(email);


-- Create the Cart table
CREATE TABLE IF NOT EXISTS Ecom_platform.Cart (
  cart_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  status VARCHAR(31) NOT NULL,
  PRIMARY KEY (cart_id),
  CONSTRAINT fk_Cart_UserID
    FOREIGN KEY (user_id)
    REFERENCES Ecom_platform.User (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Create the Variant table
CREATE TABLE IF NOT EXISTS Ecom_platform.Variant (
  variant_id INT NOT NULL AUTO_INCREMENT,
  Product_id INT NOT NULL,
  variant_attribute_value_1 VARCHAR(128) NULL,
  variant_attribute_value_2 VARCHAR(128) NULL,
  price NUMERIC(10,2) NOT NULL,
  sku VARCHAR(64) NOT NULL,
  icon VARCHAR(511) NULL,
  PRIMARY KEY (variant_id),
  CONSTRAINT fk_Variant_Product1
    FOREIGN KEY (Product_id)
    REFERENCES Ecom_platform.Product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Create the Cart_item table
CREATE TABLE IF NOT EXISTS Ecom_platform.Cart_item (
  cart_item_id INT NOT NULL AUTO_INCREMENT,
  variant_id INT NOT NULL,
  cart_id INT NOT NULL,
  quantity INT NOT NULL,
  status VARCHAR(31) NOT NULL,
  sold_date DATE NULL,
  sold_price_per_item NUMERIC(10,2) NULL,
  PRIMARY KEY (cart_item_id),
  CONSTRAINT fk_Cart_item_Cart
    FOREIGN KEY (cart_id)
    REFERENCES Ecom_platform.Cart (cart_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Cart_item_Variant
    FOREIGN KEY (variant_id)
    REFERENCES Ecom_platform.Variant (variant_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
CREATE INDEX cart_id_idx
	ON Cart_item(cart_id);

-- Create the Product_Custom_Property table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product_Custom_Property (
  custom_attribute_id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  custom_attribute_type VARCHAR(31) NULL,
  custom_attribute_value VARCHAR(31) NULL,
  PRIMARY KEY (custom_attribute_id),
  CONSTRAINT fk_Product_Custom_Property_Product1
    FOREIGN KEY (product_id)
    REFERENCES Ecom_platform.Product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Create the Inventory table
CREATE TABLE IF NOT EXISTS Ecom_platform.Inventory (
  Inventory_id INT NOT NULL AUTO_INCREMENT,
  variant_id INT NOT NULL,
  quantity INT NULL,
  PRIMARY KEY (Inventory_id, variant_id),
  CONSTRAINT fk_Inventory_Variant
    FOREIGN KEY (variant_id)
    REFERENCES Ecom_platform.Variant (variant_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
CREATE INDEX variant_id_idx
	ON inventory(variant_id);


-- Create the Order table
CREATE TABLE IF NOT EXISTS Ecom_platform.`Order` (
  order_id INT NOT NULL AUTO_INCREMENT,
  cart_id INT NOT NULL,
  user_id INT NOT NULL,
  payment_type VARCHAR(31) NOT NULL,
  est_delivery_days INT NOT NULL,
  order_date VARCHAR(31) NOT NULL,
  status VARCHAR(31) NOT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_Order_User
    FOREIGN KEY (user_id)
    REFERENCES Ecom_platform.User (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Order_Cart
    FOREIGN KEY (cart_id)
    REFERENCES Ecom_platform.Cart (cart_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
CREATE INDEX user_id_idx
	ON `Order`(user_id);
    
DELIMITER //
CREATE PROCEDURE update_inventory_quantity_for(IN variant_id_param INT, IN quantity_param INT)
BEGIN
  DECLARE inventory_count INT;
  SELECT quantity INTO inventory_count FROM Inventory WHERE variant_id = variant_id_param;
  
  IF inventory_count >= quantity_param THEN
    UPDATE Inventory SET quantity = quantity - quantity_param WHERE variant_id = variant_id_param;
  ELSE
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Variant does not exist in the Inventory table';
  END IF;
END;
//
DELIMITER ;


-- DELIMITER //
-- CREATE PROCEDURE update_cart_on_order(IN user_id_param INT)
-- BEGIN
-- 	DECLARE cartID INT;
-- 	DECLARE vID, q INT;
--     DECLARE done INT DEFAULT FALSE;
--     DECLARE cur CURSOR FOR SELECT variant_id, quantity FROM cart_item WHERE cart_id = cartID;
-- 	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

--     SELECT cart_id INTO cartID FROM cart WHERE user_id = user_id_param AND status = 'Pending';
--     
--     OPEN cur;
--     read_loop:LOOP
-- 		FETCH cur INTO vID, q;
--         IF done THEN
-- 			LEAVE read_loop;
-- 		END IF;
--         CALL update_inventory_quantity_for(vID, q);
--         UPDATE Cart_item SET status = 'Complete' WHERE variant_id = vID;
--         UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
--         UPDATE Cart_item SET sold_price_per_item = (SELECT price FROM Variant WHERE variant_id = vID) WHERE variant_id = vID;
--         
--         
-- 	END LOOP;
--     CLOSE cur;
--     UPDATE Cart SET status = 'Complete' WHERE cart_id = cartID;
-- END;
-- //
-- DELIMITER ;

DELIMITER //
CREATE PROCEDURE `update_cart_on_order`(IN user_id_param INT, OUT out_of_stock_variant_id INT, IN cart_id_param INT)
BEGIN
    DECLARE vID, q INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE out_of_stock INT DEFAULT NULL;
    DECLARE cur CURSOR FOR SELECT variant_id, quantity FROM cart_item WHERE cart_id = cart_id_param;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    START TRANSACTION;
    
    OPEN cur;
    read_loop:LOOP
        FETCH cur INTO vID, q;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if the item is in inventory
        IF NOT EXISTS (SELECT 1 FROM Inventory WHERE variant_id = vID AND quantity >= q) THEN
            -- Item is not in inventory
            SET out_of_stock = vID;
            LEAVE read_loop;
        END IF;

        -- Update inventory and cart_item
        CALL update_inventory_quantity_for(vID, q);
        UPDATE Cart_item SET status = 'Complete' WHERE variant_id = vID;
        UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
        UPDATE Cart_item SET sold_price_per_item = (SELECT price FROM Variant WHERE variant_id = vID) WHERE variant_id = vID;
    END LOOP;

    CLOSE cur;

    -- If an item is out of stock, rollback the transaction
    IF out_of_stock IS NOT NULL THEN
        ROLLBACK;
        SET out_of_stock_variant_id = out_of_stock;
    ELSE
        -- All items are in stock, commit the transaction
        COMMIT;
    END IF;

    -- Set the cart status
    UPDATE Cart SET status = CASE WHEN out_of_stock IS NULL THEN 'Complete' ELSE 'Pending' END WHERE cart_id = cart_id_param;
END;
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE create_new_cart_for(IN user_id_param INT)
BEGIN
	INSERT INTO Ecom_platform.Cart(user_id, status) VALUES (user_id_param, 'Pending');
END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `checkout_user`(IN user_id_param INT, IN payment_type_param VARCHAR(31))
BEGIN
	DECLARE stock_out_variant_id INT;
    DECLARE delivery_days INT;
    DECLARE cartId INT;
    
    SELECT cart_id INTO cartID FROM cart WHERE user_id = user_id_param AND status = 'Pending';
	CALL update_cart_on_order(user_id_param, stock_out_variant_id, cartId);
    IF stock_out_variant_id IS NULL THEN
		SELECT get_delivery_date_for_user(user_id_param) INTO delivery_days;
        INSERT INTO Ecom_platform.`Order`(cart_id, user_id, payment_type, est_delivery_days, order_date, `status`) VALUES (cartId, user_id_param, payment_type_param, delivery_days, CURDATE(), 'Processing');
		CALL create_new_cart_for(user_id_param);
        SELECT stock_out_variant_id AS insufficient_stock_variant_id, delivery_days AS est_delivery_days;
	ELSE
		SELECT stock_out_variant_id AS insufficient_stock_variant_id, NULL AS est_delivery_days;
	END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION get_delivery_date_for_user(user_id_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
	IF (SELECT address_state FROM `user` WHERE user_id = user_id_param) = 'TX' THEN
		RETURN 5;
	ELSE 
		RETURN 7;
	END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE products_with_most_number_of_sales_between(
    IN start_date_param DATE, IN end_date_param DATE)
BEGIN
    SELECT 
    p.product_id,
    p.title,
    v.sku,
	SUM(ci.quantity) AS total_sales
    FROM Cart_Item ci
    INNER JOIN Variant v 
		ON ci.variant_id = v.variant_id
	INNER JOIN Product p
		ON p.product_id = v.product_id
    WHERE ci.sold_date BETWEEN start_date_param AND end_date_param
    GROUP BY v.product_id, v.sku
    ORDER BY total_sales DESC
    LIMIT 10; 
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE quarterly_sales_reports_for_year(year_param INT)
BEGIN
    -- Generate a subquery to get all quarters
    SET @quarters = 'Q1,Q2,Q3,Q4';

    -- Calculate sales for each quarter and year
    SELECT quarters.Quarter, IFNULL(SUM(ci.sold_price_per_item * ci.quantity), 0) AS 'Total Sales'
    FROM (
        SELECT 'Q1' AS Quarter
        UNION SELECT 'Q2'
        UNION SELECT 'Q3'
        UNION SELECT 'Q4'
    ) quarters
    LEFT JOIN Cart_item ci ON quarters.Quarter = CONCAT('Q', CAST(QUARTER(ci.sold_date) AS CHAR)) AND YEAR(ci.sold_date) = year_param
    GROUP BY quarters.Quarter;

END //

DELIMITER ;


DELIMITER //
CREATE FUNCTION category_with_most_orders()
RETURNS VARCHAR(31)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE category_name VARCHAR(31);
    SELECT c.name INTO category_name
    FROM Cart_Item ci
    INNER JOIN Variant v ON ci.variant_id = v.variant_id
    INNER JOIN Product p ON p.product_id = v.product_id
    INNER JOIN product_sub_category psc ON psc.product_id = p.product_id
    INNER JOIN Category c ON c.category_id = psc.category_id
    WHERE c.parent_category_id IS NOT NULL
    GROUP BY psc.category_id
    ORDER BY SUM(ci.quantity) DESC
    LIMIT 1;
    RETURN category_name;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION most_interest_month_for_product(product_id_param INT)
RETURNS VARCHAR(31)
DETERMINISTIC
NO SQL
READS SQL DATA
BEGIN
    DECLARE most_interest_period INT;
    SELECT
        MAX(period_number) INTO most_interest_period
    FROM (
        SELECT
            DATE_FORMAT(sold_date, '%Y-%m-01') AS period_start,
            COUNT(*) AS activity_count,
            CEIL(MONTH(sold_date)) AS period_number
        FROM Cart_Item ci
        INNER JOIN Variant v ON v.variant_id = ci.variant_id
        WHERE v.product_id = product_id_param
        GROUP BY period_start, period_number
        ORDER BY activity_count DESC
        LIMIT 1
    ) AS interest_period;
    RETURN MONTHNAME(CONCAT(YEAR(CURDATE()), '-', most_interest_period, '-01'));
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE order_report_on_customer(IN user_id_param INT)
BEGIN
SELECT
	o.order_id,
    o.cart_id,
    o.user_id,
    o.payment_type,
    u.user_type,
    o.order_date,
    o.`status`
FROM `Order` o
INNER JOIN `User` u ON o.user_id = u.user_id
WHERE o.user_id = user_id_param;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `update_cart_on_order_on_request`(IN user_id_param INT, IN cart_id_param INT)
BEGIN
    DECLARE vID, q INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE out_of_stock INT DEFAULT NULL;
    DECLARE if_cart_is_partial TINYINT DEFAULT 0;
    DECLARE available_q, sold_price INT;
    DECLARE cur CURSOR FOR SELECT variant_id, quantity FROM cart_item WHERE cart_id = cart_id_param;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    

    START TRANSACTION;

    OPEN cur;
    read_loop:LOOP
        FETCH cur INTO vID, q;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if the item is in inventory
        SELECT quantity FROM Inventory WHERE variant_id = vID INTO available_q;
        SELECT price FROM Variant WHERE variant_id = vID INTO sold_price;
        
        IF available_q < q THEN
            -- Item is partially in stock
            SET if_cart_is_partial = 1;
            UPDATE Cart_item SET status = 'Complete', quantity = available_q WHERE variant_id = vID;
            INSERT INTO cart_item (variant_id, cart_id, quantity, status, sold_date, sold_price_per_item)
            VALUES (vID, cart_id_param, q - available_q, 'On Order', CURDATE(), sold_price);
            UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
            UPDATE Cart_item SET sold_price_per_item = sold_price WHERE variant_id = vID;
        ELSE
            -- Item is in stock
            CALL update_inventory_quantity_for(vID, q);
            UPDATE Cart_item SET status = 'Complete' WHERE variant_id = vID;
            UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
            UPDATE Cart_item SET sold_price_per_item = sold_price WHERE variant_id = vID;
        END IF;
    END LOOP;

    CLOSE cur;

    IF if_cart_is_partial = 1 THEN
        UPDATE Cart SET status = 'Partial' WHERE cart_id = cart_id_param;
    ELSE
        UPDATE Cart SET status = 'Complete' WHERE cart_id = cart_id_param;
    END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `checkout_user_on_request`(IN user_id_param INT, IN payment_type_param VARCHAR(31))
BEGIN
	DECLARE stock_out_variant_id INT;
    DECLARE delivery_days INT;
    DECLARE cartId INT;
    
    SELECT cart_id INTO cartID FROM cart WHERE user_id = user_id_param AND status = 'Pending';
	CALL update_cart_on_order_on_request(user_id_param, cartId);
    
	SELECT get_delivery_date_for_user(user_id_param) INTO delivery_days;
    SET delivery_days = delivery_days + 3;
	INSERT INTO Ecom_platform.`Order`(cart_id, user_id, payment_type, est_delivery_days, order_date, `status`) VALUES (cartId, user_id_param, payment_type_param, delivery_days, CURDATE(), 'Partial');
	CALL create_new_cart_for(user_id_param);
	SELECT delivery_days AS est_delivery_days;
	
END;
//
DELIMITER ;


-- Insert data for Users with Randomized Domain Names and All Address Fields NOT NULL
INSERT INTO Ecom_platform.User (user_type, first_name, last_name, email, password_hash, phone_number, address_line01, address_city, address_state, address_zip_code, address_country)
VALUES
  ('Registered', 'John', 'Doe', 'john.doe@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Main St', 'Houston', 'TX', '77001', 'United States'),
  ('Registered', 'Alice', 'Smith', 'alice.smith@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Elm St', 'Houston', 'TX', '77002', 'United States'),
  ('Registered', 'Bob', 'Johnson', 'bob.johnson@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '789 Oak St', 'Houston', 'TX', '77003', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Pine St', 'Houston', 'TX', '77004', 'United States'),
  ('Registered', 'Eva', 'Brown', 'eva.brown@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '234 Birch St', 'Houston', 'TX', '77005', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Cedar St', 'Houston', 'TX', '77006', 'United States'),
  ('Registered', 'Michael', 'Johnson', 'michael.j@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '789 Elm St', 'Houston', 'TX', '77007', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Oak St', 'Houston', 'TX', '77008', 'United States'),
  ('Registered', 'Sophia', 'Wang', 'sophia.w@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Pine St', 'Houston', 'TX', '77009', 'United States'),
  ('Registered', 'David', 'Chen', 'david.c@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '234 Cedar St', 'Houston', 'TX', '77010', 'United States'),
  ('Registered', 'Emily', 'Kumar', 'emily.k@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Elm St', 'Houston', 'TX', '77011', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Main St', 'Houston', 'TX', '77012', 'United States'),
  ('Registered', 'Daniel', 'Garcia', 'daniel.g@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '345 Oak St', 'Houston', 'TX', '77013', 'United States'),
  ('Registered', 'Olivia', 'Davis', 'olivia.d@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Birch St', 'Houston', 'TX', '77014', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Cedar St', 'Houston', 'TX', '77015', 'United States'),
  ('Registered', 'Lucas', 'Wilson', 'lucas.w@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '789 Pine St', 'Houston', 'TX', '77016', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Oak St', 'Houston', 'TX', '77017', 'United States'),
  ('Registered', 'Isabella', 'Lee', 'isabella.l@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '234 Elm St', 'Houston', 'TX', '77018', 'United States'),
  ('Registered', 'James', 'Gonzalez', 'james.g@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Oak St', 'Houston', 'TX', '77019', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Pine St', 'Houston', 'TX', '77020', 'United States'),
  ('Registered', 'Ava', 'Perez', 'ava.p@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Cedar St', 'Houston', 'TX', '77021', 'United States'),
  ('Registered', 'Logan', 'Martinez', 'logan.m@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Birch St', 'Houston', 'TX', '77022', 'United States'),
  ('Registered', 'Sophia', 'Harris', 'sophia.h@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Pine St', 'Houston', 'TX', '77023', 'United States'),
  ('Registered', 'Liam', 'Taylor', 'liam.t@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Elm St', 'Houston', 'TX', '77024', 'United States'),
  ('Registered', 'Tom', 'Steven', 'steven@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Oak St', 'Houston', 'TX', '77025', 'United States'),
  ('Registered', 'Sophia', 'Smith', 'sophia.s@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Cedar St', 'Houston', 'TX', '77026', 'United States'),
  ('Registered', 'Oliver', 'Lee', 'oliver.l@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Birch St', 'Paris', 'Île-de-France', '75001', 'France'),
  ('Registered', 'Emma', 'Gonzalez', 'emma.g@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '234 Oak St', 'Seoul', 'Seoul', '04522', 'South Korea'),
  ('Registered', 'Liam', 'Hernandez', 'liam.h@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Cedar St', 'Beijing', 'Beijing', '100000', 'China'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Main St', 'Berlin', 'Berlin', '10117', 'Germany'),
  ('Registered', 'Sophia', 'Rodriguez', 'sophia.r@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Elm St', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
  ('Registered', 'Oliver', 'Smith', 'oliver.s@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '789 Oak St', 'New York', 'NY', '10001', 'United States'),
  ('Registered', 'Ava', 'Brown', 'ava.b@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Pine St', 'Los Angeles', 'CA', '90001', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Cedar St', 'Chicago', 'IL', '60601', 'United States'),
  ('Registered', 'Lucas', 'Martinez', 'lucas.m@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Oak St', 'Paris', 'Île-de-France', '75001', 'France'),
  ('Registered', 'Sophia', 'Taylor', 'sophia.t@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Elm St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  ('Registered', 'Oliver', 'Lee', 'oliver.l@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Pine St', 'New York', 'NY', '10001', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '567 Cedar St', 'Seoul', 'Seoul', '04522', 'South Korea'),
  ('Registered', 'Emma', 'Gonzalez', 'emma.g@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '234 Elm St', 'Beijing', 'Beijing', '100000', 'China'),
  ('Registered', 'Liam', 'Hernandez', 'liam.h@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '890 Oak St', 'Berlin', 'Berlin', '10117', 'Germany'),
  ('Registered', 'Sophia', 'Rodriguez', 'sophia.r@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Cedar St', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
  ('Registered', 'Oliver', 'Smith', 'oliver.s@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Oak St', 'New York', 'NY', '10001', 'United States'),
  ('Registered', 'Ava', 'Brown', 'ava.b@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '789 Elm St', 'Los Angeles', 'CA', '90001', 'United States'),
  ('Guest', 'Guest', 'User', 'guest@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '123 Pine St', 'Chicago', 'IL', '60601', 'United States'),
  ('Registered', 'Lucas', 'Martinez', 'lucas.m@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '456 Oak St', 'Paris', 'Île-de-France', '75001', 'France'),
  ('Admin', 'John', 'Smith', 'admin@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '117, Wijerama Road,', 'Colombo 7', 'Colombo', '00700', 'Sri Lanka'),
  ('Content Manager', 'David', 'Brown', 'contentmanager@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '117, Wijerama Road,', 'Colombo 7', 'Colombo', '00700', 'Sri Lanka'),
  ('Inventory Manager', 'James', 'Lee', 'inventorymanager@gmail.com', '$bcrypt-sha256$v=2,t=2b,r=12$4ECMEENZozcTLJR4PDl49u$4Uopa6BZi3HVeDmKqCbGGUrpV6pyy9a', '+1234567890', '117, Wijerama Road,', 'Colombo 7', 'Colombo', '00700', 'Sri Lanka');


  -- Insert data for Main Categories
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (1, NULL, 'Electronics'),
  (2, NULL, 'Toys'),
  (3, NULL, 'Cosmetics and Body Care'),
  (4, NULL, 'Food and Beverage'),
  (5, NULL, 'Furniture and Decor'),
  (6, NULL, 'Pet Care and Toys');

-- Insert data for Subcategories of Electronics
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (7, 1, 'Mobile Phones'),
  (8, 1, 'TVs'),
  (9, 1, 'Laptops'),
  (10, 1, 'Headphones'),
  (11, 1, 'Cameras'),
  (12, 1, 'Watches'),
  (13, 1, 'Home Appliances'),
  (14, 1, 'Gaming Consoles'),
  (15, 1, 'Smart Home Security'),
  (16, 1, 'Printers'),
  (17, 1, 'Tablets');

-- Insert data for Subcategories of Toys
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (18, 2, 'Action Figures'),
  (19, 2, 'Board Games'),
  (20, 2, 'Dolls'),
  (21, 2, 'Remote Control Toys'),
  (22, 2, 'Educational Toys');

-- Insert data for Subcategories of Cosmetics and Body Care
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (23, 3, 'Skincare'),
  (24, 3, 'Makeup'),
  (25, 3, 'Fragrances'),
  (26, 3, 'Hair Care');

-- Insert data for Subcategories of Food and Beverage
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (27, 4, 'Snacks'),
  (28, 4, 'Beverages'),
  (29, 4, 'Canned Goods'),
  (30, 4, 'Condiments and Spices');

-- Insert data for Subcategories of Furniture and Decor
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (31, 5, 'Furniture'),
  (32, 5, 'Home Decor'),
  (33, 5, 'Lighting'),
  (34, 5, 'Bedding and Linens');

-- Insert data for Subcategories of Pet Care and Toys
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (35, 6, 'Pet Food'),
  (36, 6, 'Pet Toys'),
  (37, 6, 'Pet Grooming'),
  (38, 6, 'Pet Accessories');

  -- Insert data for Mobile Phones
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('iPhone 12', '150g', 'Apple', 'The iPhone 12 is a flagship smartphone from Apple, featuring a stunning Super Retina XDR display, A14 Bionic chip, and a dual-camera system. It comes in various storage capacities and colors, providing a premium user experience.', 'Storage', 'Color'),
  ('Samsung Galaxy S21', '170g', 'Samsung', 'The Samsung Galaxy S21 is a powerful Android phone with a brilliant AMOLED display, Exynos 2100 processor, and excellent camera capabilities. It comes in different storage options and attractive color choices.', 'Storage', 'Color'),
  ('Google Pixel 5', '151g', 'Google', 'The Google Pixel 5 is a pure Android experience with a fantastic camera, 5G support, and a sleek design. It comes with multiple storage options and eye-catching color variants.', 'Storage', 'Color'),
  ('OnePlus 9', '170g', 'OnePlus', 'The OnePlus 9 is a flagship killer with a high-refresh-rate display, Snapdragon 888 chipset, and Hasselblad-tuned cameras. It offers ample storage and color selections for tech enthusiasts.', 'Storage', 'Color'),
  ('Xiaomi Mi 11', '196g', 'Xiaomi', 'The Xiaomi Mi 11 is a budget-friendly flagship with a vibrant display, Snapdragon 888 processor, and versatile camera system. It''s available in various storage and color combinations.', 'Storage', 'Color');

-- Insert data for TVs
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Samsung 55" 4K Smart TV', '20kg', 'Samsung', 'The Samsung 55" 4K Smart TV is a premium television with a large and vibrant screen, offering 4K resolution for a stunning visual experience. Its perfect for enjoying your favorite movies, shows, and games.', 'Screen Size', 'Resolution'),
  ('LG 65" OLED TV', '25kg', 'LG', 'The LG 65" OLED TV provides an exceptional viewing experience with its OLED display technology, offering deep blacks and vibrant colors. With a large screen, its ideal for cinematic entertainment.', 'Screen Size', 'Resolution'),
  ('Sony 60" 4K Smart TV', '22kg', 'Sony', 'The Sony 60" 4K Smart TV is designed to deliver exceptional picture quality with 4K resolution. Its a smart TV that offers a range of features for streaming and connectivity, making it a great addition to any home theater.', 'Screen Size', 'Resolution'),
  ('TCL 50" LED TV', '18kg', 'TCL', 'The TCL 50" LED TV is a reliable and affordable choice for those seeking a quality television with a 50-inch screen. It offers clear and crisp images with a focus on energy efficiency.', 'Screen Size', 'Resolution'),
  ('Hisense 43" 1080p TV', '15kg', 'Hisense', 'The Hisense 43" 1080p TV is a compact and budget-friendly option, ideal for smaller spaces. It delivers Full HD resolution and is perfect for casual viewing and gaming.', 'Screen Size', 'Resolution');

-- Insert data for Laptops
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Dell XPS 13', '1.2kg', 'Dell', 'The Dell XPS 13 is a lightweight and powerful laptop. It offers excellent portability and features a variety of storage and RAM options, making it a versatile choice for work and entertainment.', 'Storage Size', 'RAM Size'),
  ('MacBook Air', '1.3kg', 'Apple', 'The MacBook Air is a sleek and elegant laptop by Apple. Known for its thin and lightweight design, its a great choice for on-the-go users. Its available with different storage and RAM configurations.', 'Storage Size', 'RAM Size'),
  ('HP Spectre x360', '1.4kg', 'HP', 'The HP Spectre x360 is a versatile 2-in-1 laptop with a premium build. Its designed for flexibility and offers various storage and RAM options, ensuring you can find the perfect fit for your needs.', 'Storage Size', 'RAM Size'),
  ('Lenovo ThinkPad X1 Carbon', '1.35kg', 'Lenovo', 'The Lenovo ThinkPad X1 Carbon is a business-class laptop known for its durability and performance. With different storage and RAM sizes available, its an excellent choice for professionals.', 'Storage Size', 'RAM Size'),
  ('Asus ROG Zephyrus G14', '1.7kg', 'Asus', 'The Asus ROG Zephyrus G14 is a gaming laptop designed for high-performance gaming. It offers various storage and RAM configurations to meet the demands of gamers and enthusiasts.', 'Storage Size', 'RAM Size');


-- Insert data for Headphones
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Sony WH-1000XM4', '250g', 'Sony', 'The Sony WH-1000XM4 headphones offer an exceptional audio experience. With advanced noise-canceling technology and a variety of stylish colors, they provide an immersive and personalized listening journey.', 'Color', 'Noise Cancelling'),
  ('Bose QuietComfort 35 II', '235g', 'Bose', 'The Bose QuietComfort 35 II headphones are renowned for their noise-canceling prowess. They come in different colors and deliver a premium audio experience for those seeking tranquility.', 'Color', 'Noise Cancelling'),
  ('Sennheiser HD 660 S', '260g', 'Sennheiser', 'The Sennheiser HD 660 S headphones are designed for audiophiles. With various color options and advanced noise-canceling, they ensure a superb and immersive listening adventure.', 'Color', 'Noise Cancelling'),
  ('Beats Solo Pro', '220g', 'Beats', 'The Beats Solo Pro headphones offer a stylish audio solution. Equipped with noise-canceling and available in different colors, they provide a premium auditory experience for fashion-conscious users.', 'Color', 'Noise Cancelling'),
  ('JBL Free X', '95g', 'JBL', 'The JBL Free X headphones provide wireless convenience and come in various attractive colors. They offer a lightweight and cordless audio experience for those on the move.', 'Color', 'Wireless');

-- Insert data for Cameras
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Canon EOS 5D Mark IV', '800g', 'Canon', 'The Canon EOS 5D Mark IV is a professional DSLR camera known for its high-resolution images. It features advanced megapixels and a versatile lens system, making it a top choice for photographers and videographers.', 'Megapixels', 'Lens Type'),
  ('Nikon D750', '750g', 'Nikon', 'The Nikon D750 is a powerful DSLR camera designed for enthusiasts and professionals. With impressive megapixels and a range of lens options, it provides superb image quality and versatility.', 'Megapixels', 'Lens Type'),
  ('Sony Alpha A7 III', '650g', 'Sony', 'The Sony Alpha A7 III is a mirrorless camera renowned for its outstanding image quality. With cutting-edge megapixels and a variety of lens choices, it delivers exceptional results for photographers and content creators.', 'Megapixels', 'Lens Type'),
  ('Panasonic Lumix GH5', '725g', 'Panasonic', 'The Panasonic Lumix GH5 is a versatile mirrorless camera tailored for both photography and videography. Offering impressive megapixels and lens diversity, its a go-to choice for creative professionals.', 'Megapixels', 'Lens Type'),
  ('Fujifilm X-T4', '580g', 'Fujifilm', 'The Fujifilm X-T4 is a mirrorless camera perfect for photography and videography. With advanced megapixels and various lens options, its designed to inspire creativity and capture stunning visuals.', 'Megapixels', 'Lens Type');

-- Insert data for Watches
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Apple Watch Series 6', '45g', 'Apple', 'The Apple Watch Series 6 is a premium smartwatch that offers an array of health and fitness features. Available in various sizes and stylish colors, it seamlessly integrates with your Apple devices.', 'Size', 'Color'),
  ('Samsung Galaxy Watch 3', '52g', 'Samsung', 'The Samsung Galaxy Watch 3 is a feature-packed smartwatch with a strong focus on health tracking. It comes in different sizes and attractive color options, making it a perfect companion for Samsung users.', 'Size', 'Color'),
  ('Garmin Forerunner 945', '50g', 'Garmin', 'The Garmin Forerunner 945 is a high-performance GPS running watch designed for athletes. Its available in different sizes and stylish colors, making it a great tool for tracking and improving your workouts.', 'Size', 'Color'),
  ('Fossil Gen 5', '55g', 'Fossil', 'The Fossil Gen 5 is a fashionable smartwatch that combines style with functionality. With multiple size options and eye-catching color choices, its a great accessory for tech-savvy individuals.', 'Size', 'Color'),
  ('Fitbit Versa 3', '40g', 'Fitbit', 'The Fitbit Versa 3 is a fitness-focused smartwatch that excels at tracking your health and workouts. It comes in various sizes and appealing colors, helping you achieve your fitness goals in style.', 'Size', 'Color');

-- Insert data for Home Appliances
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Samsung Refrigerator', '85kg', 'Samsung', 'The Samsung Refrigerator is a high-capacity and energy-efficient appliance that keeps your food fresh. With different capacities and color choices, it complements your kitchen and storage needs.', 'Capacity', 'Color'),
  ('LG Washing Machine', '65kg', 'LG', 'The LG Washing Machine is a reliable laundry appliance with various load capacities and color options. Its designed to make your laundry tasks easier and more efficient.', 'Capacity', 'Color'),
  ('Whirlpool Microwave Oven', '30kg', 'Whirlpool', 'The Whirlpool Microwave Oven is a versatile kitchen appliance that offers different cooking capacities and color selections. It simplifies your cooking and heating needs.', 'Capacity', 'Color'),
  ('Breville Coffee Maker', '5kg', 'Breville', 'The Breville Coffee Maker is a stylish and functional coffee machine with varying capacities and color variants. It brews your favorite coffee just the way you like it.', 'Capacity', 'Color'),
  ('Dyson Vacuum Cleaner', '7kg', 'Dyson', 'The Dyson Vacuum Cleaner is a powerful cleaning solution for your home. It comes in different capacities and colors, making cleaning tasks a breeze with a touch of style.', 'Capacity', 'Color');

-- Insert data for Gaming Consoles
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('PlayStation 5', '4.5kg', 'Sony', 'The PlayStation 5 is a next-gen gaming console that offers an immersive gaming experience. It comes in various storage options and color variations, providing top-tier gaming entertainment.', 'Storage', 'Color'),
  ('Xbox Series X', '4.4kg', 'Microsoft', 'The Xbox Series X is a powerful gaming console designed for high-performance gaming. Its available in different storage capacities and attractive color choices, delivering top-quality gaming experiences.', 'Storage', 'Color'),
  ('Nintendo Switch', '0.88kg', 'Nintendo', 'The Nintendo Switch is a versatile gaming system that offers on-the-go gaming fun. Its available with various storage options and stylish color selections, providing unique gaming adventures.', 'Storage', 'Color'),
  ('Sony PlayStation 4', '2.8kg', 'Sony', 'The Sony PlayStation 4 is a popular gaming console known for its extensive game library. It comes with different storage capacities and color options, offering diverse gaming experiences.', 'Storage', 'Color'),
  ('Xbox One X', '4.43kg', 'Microsoft', 'The Xbox One X is a gaming console that delivers 4K gaming and entertainment. Its available in multiple storage options and sleek color variants, offering a fantastic gaming and multimedia experience.', 'Storage', 'Color');

-- Insert data for Smart Home Security
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Ring Alarm Security Kit', '1.1kg', 'Ring', 'The Ring Alarm Security Kit is a comprehensive home security solution. It includes various components for protecting your home and comes in a range of colors to match your style and decor.', 'Components', 'Color'),
  ('Arlo Pro 4 Security Camera', '400g', 'Arlo', 'The Arlo Pro 4 Security Camera is a high-resolution wireless camera for monitoring your property. It offers different color options and ensures you have a clear view of your surroundings.', 'Resolution', 'Color'),
  ('Nest Hello Video Doorbell', '180g', 'Nest', 'The Nest Hello Video Doorbell enhances your homes security and convenience. Its compatible with your smart home system and offers stylish color choices to suit your entryway.', 'Compatibility', 'Color'),
  ('SimpliSafe Home Security System', '2.2kg', 'SimpliSafe', 'The SimpliSafe Home Security System is a reliable solution for protecting your home. It includes various components to ensure safety and security. You can choose from a range of colors to match your decor.', 'Components', 'Color'),
  ('Blink Mini Indoor Camera', '65g', 'Blink', 'The Blink Mini Indoor Camera is a compact security camera for monitoring the inside of your home. It offers different resolution options and is available in various colors to blend seamlessly with your interior.', 'Resolution', 'Color');

-- Insert data for Printers
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('HP LaserJet Pro', '11kg', 'HP', 'The HP LaserJet Pro is a reliable and efficient printer for your business needs. It offers high print speed and vibrant color printing. Perfect for offices and professional use.', 'Print Speed', 'Color'),
  ('Epson EcoTank', '6.8kg', 'Epson', 'The Epson EcoTank printer is an eco-friendly choice with cost-saving ink tanks. It delivers fast print speeds and stunning color prints, making it an ideal solution for home and small office printing.', 'Print Speed', 'Color'),
  ('Canon PIXMA', '5.5kg', 'Canon', 'The Canon PIXMA printer is known for its exceptional print quality and versatility. It boasts high print speed and vivid color output, making it a great choice for both documents and photos.', 'Print Speed', 'Color'),
  ('Brother HL-L2350DW', '7kg', 'Brother', 'The Brother HL-L2350DW is a compact monochrome laser printer designed for efficiency. It offers fast print speeds and high-quality text output, perfect for business and home use.', 'Print Speed', 'Color'),
  ('Xerox WorkCentre', '15kg', 'Xerox', 'The Xerox WorkCentre is a heavy-duty multifunction printer with impressive print speed and color capabilities. Its a reliable choice for businesses seeking high-performance printing and copying.', 'Print Speed', 'Color');

-- Insert data for Tablets
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Apple iPad Pro', '470g', 'Apple', 'The Apple iPad Pro is a top-tier tablet with a powerful A12Z Bionic chip, stunning Retina display, and support for the Apple Pencil. Available in various storage options and colors for premium performance and style.', 'Storage', 'Color'),
  ('Samsung Galaxy Tab S7', '500g', 'Samsung', 'The Samsung Galaxy Tab S7 is a versatile Android tablet featuring a Super AMOLED display, Snapdragon 865+ processor, and S Pen support. It comes in different storage capacities and attractive color choices for productivity and entertainment.', 'Storage', 'Color'),
  ('Microsoft Surface Pro 7', '770g', 'Microsoft', 'The Microsoft Surface Pro 7 is a 2-in-1 tablet with laptop-like performance. It boasts an Intel Core processor, PixelSense display, and versatility for work and play. Its available in various storage options and stylish colors.', 'Storage', 'Color'),
  ('Amazon Fire HD 10', '500g', 'Amazon', 'The Amazon Fire HD 10 is a budget-friendly tablet for entertainment and productivity. It offers a Full HD display, long battery life, and access to Amazons content ecosystem. Available in different storage capacities and colors.', 'Storage', 'Color'),
  ('Lenovo Tab M10', '480g', 'Lenovo', 'The Lenovo Tab M10 is an affordable Android tablet with a family-friendly design. It features a bright display, Dolby Atmos audio, and ample storage options in a sleek form. Choose from a variety of storage capacities and appealing colors.', 'Storage', 'Color');

-- Insert data for Action Figures
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Toy Car - Red Racer', '200g', 'Speedy Toys', 'Zoom around with this red toy car. Its designed for speed and fun play for kids.', 'Color', 'Size'),
  ('Toy Car - Blue Cruiser', '210g', 'DriveMaster', 'Take a leisurely drive with this blue toy car. Its perfect for imaginative adventures.', 'Color', 'Size'),
  ('Toy Jeep - Safari Adventure', '230g', 'Wild Explorers', 'Embark on a safari adventure with this toy jeep. It features realistic details and a removable roof.', 'Color', 'Size'),
  ('Toy Helicopter - Rescue Chopper', '250g', 'Rescue Heroes', 'Be a hero with this rescue helicopter. It comes with rotating blades and a working winch for daring missions.', 'Color', 'Size'),
  ('Toy Helicopter - Police Pursuit', '260g', 'Law Enforcement Toys', 'Chase down the bad guys with this police helicopter. It features a searchlight and working doors.', 'Color', 'Size');
-- Insert data for Board Games
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Toy Blaster - Laser Shooter', '150g', 'Galactic Warriors', 'Defend the galaxy with this laser blaster. It features light and sound effects for epic battles.', 'Type', 'Color'),
  ('Toy Sword - Knights Weapon', '180g', 'Medieval Adventures', 'Become a noble knight with this toy sword. Its perfect for medieval role-play.', 'Type', 'Color'),
  ('Dinosaur World Board Game', '850g', 'Prehistoric Games', 'Travel back in time to a world of dinosaurs with this exciting board game. Compete to build the best dinosaur park.', 'Number of Players', 'Game Board Size'),
  ('Pirates Treasure Board Game', '900g', 'Treasure Hunt Games', 'Sail the high seas in search of hidden treasure. This board game is perfect for aspiring pirates and treasure hunters.', 'Number of Players', 'Game Board Size'),
  ('Fantasy Quest Board Game', '875g', 'Mythic Adventures', 'Venture into a realm of fantasy and magic with this cooperative board game. Solve quests and face mythical creatures.', 'Number of Players', 'Game Board Size');

-- Insert data for Dolls
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Fashion Model Doll - Summer Style', '240g', 'Dolly Inc.', 'Dress up your fashion model doll in the latest summer fashions. This set includes beachwear and accessories for a stylish look.', 'Outfit Style', 'Accessory Set'),
  ('Princess Doll - Royal Gown', '280g', 'Royal Toys', 'Create a fairytale with this princess doll. She wears a beautiful royal gown and comes with a tiara and royal accessories.', 'Outfit Style', 'Accessory Set'),
  ('Mermaid Doll - Underwater Adventure', '250g', 'AquaToys', 'Dive into an underwater adventure with this mermaid doll. She has a colorful tail and comes with aquatic-themed accessories.', 'Outfit Style', 'Accessory Set'),
  ('Pop Star Doll - Stage Sensation', '260g', 'Star Performers', 'Get ready for a concert with this pop star doll. Shes dressed in a glamorous stage outfit and has a microphone for singing.', 'Outfit Style', 'Accessory Set'),
  ('Fairy Tale Doll - Enchanted Forest', '270g', 'Fantasy Toys', 'Enter an enchanted forest with this fairy tale doll. She comes with a magical wand and a whimsical outfit.', 'Outfit Style', 'Accessory Set');

-- Insert data for Remote Control Toys
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Remote Control Racing Car - Speedster', '590g', 'RC Racers', 'Experience the thrill of high-speed racing with this remote control car. Its built for speed and maneuverability.', 'Speed', 'Frequency Band'),
  ('Remote Control Helicopter - Sky Master', '650g', 'AeroTech', 'Take to the skies with this remote control helicopter. Its designed for easy flying and aerial stunts.', 'Speed', 'Frequency Band'),
  ('Remote Control Boat - Aquatic Voyager', '600g', 'Splash Navigators', 'Set sail with this remote control boat. Its perfect for adventures on the water and comes with realistic detailing.', 'Speed', 'Frequency Band'),
  ('Remote Control Drone - Aerial Explorer', '700g', 'DroneTech', 'Explore the world from above with this remote control drone. Its equipped with a camera for capturing stunning aerial photos and videos.', 'Speed', 'Frequency Band'),
  ('Remote Control Monster Truck - Off-Road Racer', '750g', 'Monster Wheels', 'Conquer rough terrain with this remote control monster truck. Its oversized wheels provide stability and durability.', 'Speed', 'Frequency Band');

-- Insert data for Educational Toys
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Science Lab Kit - Chemistry Edition', '420g', 'LearnTech', 'Discover the wonders of chemistry with this science lab kit. It includes experiments, chemicals, and safety equipment for young scientists.', 'Age Range', 'Experiment Type'),
  ('Robotic Building Kit - STEM Explorer', '480g', 'Robotics Unlimited', 'Build your own robots with this STEM robotic kit. Its a fun and educational way to learn about engineering and programming.', 'Age Range', 'Robot Type'),
  ('Math Puzzles Set - Number Cruncher', '360g', 'Math Wizards', 'Solve mathematical puzzles and challenges with this set. Its a great way to improve math skills in a fun and engaging way.', 'Age Range', 'Puzzle Type'),
  ('Geography Explorer Globe', '500g', 'GeoDiscover', 'Explore the world with this interactive globe. It provides information about countries, landmarks, and geography in an engaging manner.', 'Age Range', 'Geography Type'),
  ('Solar System Planetarium Kit', '400g', 'AstroKids', 'Learn about the solar system and astronomy with this planetarium kit. It includes models and educational materials for aspiring astronomers.', 'Age Range', 'Astronomy Type');

-- Insert data for Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (1, '128GB', 'Silver', '699.99', 'IP12-001-128GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/1.jpeg?alt=media&token=2864a9ec-eafd-4fce-87dd-06639d891aa6&_gl=1*1jzclm6*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODU0My42MC4wLjA.'),
  (1, '128GB', 'Gold', '699.99', 'IP12-001-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/2.jpeg?alt=media&token=bc6561c2-4cc2-4620-b04c-062cc33a99ae&_gl=1*tex6im*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODcyMi42MC4wLjA.'),
  (2, '256GB', 'Black', '749.99', 'S21-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/3.jpg?alt=media&token=5709f631-3a2c-43d2-a0e2-3b547e1063fa&_gl=1*80vm1w*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTA3Mi4zMS4wLjA.'),
  (2, '256GB', 'White', '749.99', 'S21-001-256GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/4.jpg?alt=media&token=c5877b5e-11dd-413a-9c73-e2da081430dd&_gl=1*83m6g1*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTE4Ni4xOS4wLjA.'),
  (3, '128GB', 'Black', '599.99', 'Pixel5-001-128GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/5.jpg?alt=media&token=f78d807e-6d32-42fe-b66d-a1827b0b788a&_gl=1*148cx31*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTMzOS42MC4wLjA.'),
  (3, '64GB', 'White', '549.99', 'Pixel5-001-64GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/6.jpg?alt=media&token=987cdb75-92e2-4199-81d9-e08f252fd686&_gl=1*1s69byc*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTM5Ni4zLjAuMA..'),
  (4, '256GB', 'Black', '699.99', 'OP9-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/7.png?alt=media&token=ea2daf2c-629f-4da1-8749-6120dead3ca9&_gl=1*1jsglft*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTE1MC41NS4wLjA.'),
  (4, '128GB', 'Blue', '649.99', 'OP9-001-128GB-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/8.jpg?alt=media&token=5c10ba50-1c3d-41ff-8c02-b3b4353f5e08&_gl=1*nqv1cw*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTUwMi42MC4wLjA.'),
  (5, '256GB', 'Black', '699.99', 'Mi11-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/9.jpg?alt=media&token=129b27ac-92e8-412f-8507-420d4c037baf&_gl=1*tfwmsm*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTU0MC4yMi4wLjA.'),
  (5, '128GB', 'Blue', '649.99', 'Mi11-001-128GB-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/10.jpg?alt=media&token=df544604-574e-4ce0-8ebb-55396c9800cc&_gl=1*1jfn1cx*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTI1OS42MC4wLjA.');
  -- Variants for TVs
  INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (6, '55"', '4K', '799.99', 'TV55-001-55-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/11.jpg?alt=media&token=402d504b-0c2e-4565-8b96-27606e7872b3&_gl=1*1t34pg9*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTIzMC42MC4wLjA.'),
  (6, '65"', '4K', '999.99', 'TV65-001-65-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/12.jpg?alt=media&token=4554fba3-748e-4e0c-bdbf-4d16093e999c&_gl=1*1jpi8sf*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTg4NC4yMi4wLjA.'),
  (7, '65"', 'OLED', '1299.99', 'OLED65-001-65-OLED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/13.jpg?alt=media&token=b3c04374-4dd3-4e77-aa84-fef23169b661&_gl=1*18ii8pz*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTAyMi4zNC4wLjA.'),
  (7, '55"', 'OLED', '1099.99', 'OLED55-001-55-OLED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/14.jpg?alt=media&token=a4051eec-d396-4966-8ce5-ddeccf19d8a3&_gl=1*1ktxnbd*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTEwMy4xNi4wLjA.'),
  (8, '60"', '4K', '849.99', 'TV60-001-60-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/15.jpg?alt=media&token=37e413d2-cfc2-4498-b6ef-9a5425af9832&_gl=1*1xv7v01*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTA4My4zNi4wLjA.'),
  (8, '50"', '4K', '699.99', 'TV50-001-50-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/16.jpg?alt=media&token=2e5dd079-35c4-47ba-adfd-a5dc3b646924&_gl=1*1ua418g*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTA1OS42MC4wLjA.'),
  (9, '50"', 'LED', '449.99', 'TV50-001-50-LED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/17.jpg?alt=media&token=41e97b66-8eca-4055-88d0-909d5e9cc2c9&_gl=1*ht9trr*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODk5Ni42MC4wLjA.'),
  (9, '43"', 'LED', '399.99', 'TV43-001-43-LED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/18.jpg?alt=media&token=5637edfb-61b0-4831-9560-524d16008544&_gl=1*usbx5l*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODgzOC41LjAuMA..'),
  (10, '43"', '1080p', '349.99', 'TV43-001-43-1080p', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/19.png?alt=media&token=fd555580-9e0d-421d-afee-2b5c09dedee0&_gl=1*b1z23y*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjAuMTY5ODM0MTA0My42MC4wLjA.'),
  (10, '55"', '1080p', '449.99', 'TV55-001-55-1080p', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/20.png?alt=media&token=b697ea3d-20a7-4735-80de-fe64a289cbf9&_gl=1*eoq91b*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODk4Mi4xMC4wLjA.'),
  -- Variants for Laptops
  (11, '256GB', '8GB', '799.99', 'LAP256-001-8GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/21.jpg?alt=media&token=2676f99e-7607-4d0a-9ea0-c1808f7ca078&_gl=1*1kea19e*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODg5Ni4yMy4wLjA.'),
  (11, '512GB', '16GB', '999.99', 'LAP512-001-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/22.jpg?alt=media&token=ba834c52-c20c-41f4-834f-00c6be8201ee&_gl=1*2xqol1*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODc0NS4zNy4wLjA.'),
  (12, '256GB', '8GB', '749.99', 'LAP256-002-8GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/23.jpg?alt=media&token=c294b834-39a3-4104-8460-b7a54d0180bd&_gl=1*1sfq39c*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODgwOS4zNC4wLjA.'),
  (12, '512GB', '16GB', '949.99', 'LAP512-002-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/24.jpg?alt=media&token=22f3cfcf-632a-450e-a6b0-1a4830c56ba0&_gl=1*14je43y*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODc4My42MC4wLjA.'),
  (13, '512GB', '8GB', '849.99', 'LAP512-003-8GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/25.jpg?alt=media&token=a8e42137-7f07-48f5-9869-3a3f8233beed&_gl=1*1hx3if*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODgyNi4xNy4wLjA.'),
  (13, '256GB', '16GB', '899.99', 'LAP256-003-16GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/26.jpg?alt=media&token=055ee93e-a36b-4091-a034-2a541edd066d&_gl=1*c3tpuv*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM0MTA0My44LjEuMTY5ODM0MTg0Ni42MC4wLjA.'),
  (14, '512GB', '8GB', '899.99', 'LAP512-004-8GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/27.jpg?alt=media&token=38668e92-16fb-413c-915c-c404c052693f&_gl=1*pj3u5j*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODkzMi42MC4wLjA.'),
  (14, '256GB', '16GB', '849.99', 'LAP256-004-16GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/28.jpg?alt=media&token=b746807e-eaab-4983-b53e-f623bf85c3e4&_gl=1*aozjjq*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODkxOC4xLjAuMA..'),
  (15, '1TB', '32GB', '1299.99', 'LAP1TB-005-32GB-1TB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/29.jpg?alt=media&token=1d63efa7-24d2-4512-984c-0bce0cc557e2&_gl=1*146h1tf*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODI5MDM1OS4xMi4xLjE2OTgyOTE4ODkuNjAuMC4w'),
  (15, '512GB', '16GB', '1199.99', 'LAP512-005-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/30.jpg?alt=media&token=1e0a160b-6f0e-49c1-8d8c-357853756bde&_gl=1*1p2figt*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODI5MDM1OS4xMi4xLjE2OTgyOTIwMzIuNTkuMC4w'),
  
  -- Variants for Headphones
  (16, 'Black', 'Active Noise Cancelling', '199.99', 'SONY-001-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/31.jpg?alt=media&token=ac1f8bc2-f29d-4aa0-9a55-1169fed32977&_gl=1*1hp9hrf*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODI5MDM1OS4xMi4xLjE2OTgyOTI2MjkuNTguMC4w'),
  (16, 'Silver', 'Active Noise Cancelling', '199.99', 'SONY-001-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/32.jpg?alt=media&token=cac76cf2-8072-4d47-bf53-575a5e603a8e&_gl=1*1x8i631*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODI5MDM1OS4xMi4xLjE2OTgyOTI2NzEuMTYuMC4w'),
  (17, 'Black', 'Active Noise Cancelling', '189.99', 'BOSE-002-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/33.jpg?alt=media&token=a6cfe9e9-a25b-4900-8edd-01350308cf19&_gl=1*1q848yn*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY2MzYuMzguMC4w'),
  (17, 'Silver', 'Active Noise Cancelling', '189.99', 'BOSE-002-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/34.jpg?alt=media&token=b5f2eb30-31b3-4c16-9cf4-a1f312c9c2db&_gl=1*j2x0hf*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY3MDguNTguMC4w'),
  (18, 'Black', 'Open-back', '179.99', 'SENNHEISER-003-Open-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/35.jpg?alt=media&token=36f83fb3-066f-4c29-a655-10cafab8ebb6&_gl=1*11hdfkf*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY3NjIuNC4wLjA.'),
  (18, 'Silver', 'Open-back', '179.99', 'SENNHEISER-003-Open-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/36.jpg?alt=media&token=23f7fef7-fd26-400b-87a7-ca88ee5981bd&_gl=1*gzcbx9*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY4MTEuNjAuMC4w'),
  (19, 'Black', 'Active Noise Cancelling', '199.99', 'BEATS-004-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/37.jpg?alt=media&token=82ba178b-1618-41ee-bfd3-57195849e65b&_gl=1*1t5xkwc*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY4NDEuMzAuMC4w'),
  (19, 'Silver', 'Active Noise Cancelling', '199.99', 'BEATS-004-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/38.jpg?alt=media&token=b746c967-e905-4f0c-9603-f46cd13c2635&_gl=1*1mjigm2*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY4NjIuOS4wLjA.'),
  (20, 'Black', 'Wireless', '149.99', 'JBL-005-Wireless-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/39.jpg?alt=media&token=eba90749-ee44-4de5-9bb3-668814061f25&_gl=1*3iewk5*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY4OTMuNTguMC4w'),
  (20, 'White', 'Wireless', '149.99', 'JBL-005-Wireless-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/40.jpg?alt=media&token=4dee47e0-7c46-4529-ae78-da6b579a3972&_gl=1*bojxrm*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY5MjkuMjIuMC4w'),
  
  -- Variants for Cameras
  (21, '30MP', 'Zoom Lens', '799.99', 'CANON-001-30MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/41.jpg?alt=media&token=c646675b-3fa0-4ee4-a806-c1e199a57078&_gl=1*zexkam*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjY5NzMuNjAuMC4w'),
  (21, '24MP', 'Prime Lens', '699.99', 'CANON-001-24MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/42.jpg?alt=media&token=eceb5f67-999f-4b5a-9f60-d62834cc88cd&_gl=1*gusqs7*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcwMDYuMjcuMC4w'),
  (22, '24MP', 'Zoom Lens', '749.99', 'NIKON-002-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/43.jpg?alt=media&token=3ce6607d-abf6-40ab-aeff-6a60e3c7c726&_gl=1*1uojatc*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcwMzguNTUuMC4w'),
  (22, '30MP', 'Prime Lens', '799.99', 'NIKON-002-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/44.jpg?alt=media&token=980c4eed-c1ac-4907-9c43-51b72ab3f3af&_gl=1*tjcllt*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcwNjIuMzEuMC4w'),
  (23, '30MP', 'Zoom Lens', '799.99', 'SONY-003-30MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/45.jpg?alt=media&token=92d095f3-243b-45b1-86da-3e1a14a828c8&_gl=1*rfrjda*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcxMTMuNTguMC4w'),
  (23, '24MP', 'Prime Lens', '699.99', 'SONY-003-24MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/46.jpg?alt=media&token=7431f99c-0b49-484a-9c36-28847fcc736c&_gl=1*1o9c9j0*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcxMzIuMzkuMC4w'),
  (24, '24MP', 'Zoom Lens', '749.99', 'LUMIX-004-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/47.jpg?alt=media&token=d3bce039-1af1-42fc-8491-0debb056fb0f&_gl=1*yjkbf8*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcxNTcuMTQuMC4w'),
  (24, '30MP', 'Prime Lens', '799.99', 'LUMIX-004-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/48.jpg?alt=media&token=4f94eb4e-f9e2-439d-bda2-5872b0b84837&_gl=1*z2ptw0*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcxODEuNjAuMC4w'),
  (25, '24MP', 'Zoom Lens', '699.99', 'FUJIFILM-005-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/49.jpg?alt=media&token=6a9d8554-5316-4d3e-af2e-6eeeb2e587b6&_gl=1*1vr6cqp*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcyMTMuMjguMC4w'),
  (25, '30MP', 'Prime Lens', '749.99', 'FUJIFILM-005-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/50.jpg?alt=media&token=1dfb03ee-936c-46dc-bd56-5db6dae66190&_gl=1*4vpyru*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjcyMzguMy4wLjA.'),
  
  -- Variants for Watches
  (26, '42mm', 'Space Gray', '249.99', 'IWATCH-001-42mm-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/51.jpg?alt=media&token=e0d8c572-5550-43d4-9395-79649979de37&_gl=1*vu14gt*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjczMTMuNjAuMC4w'),
  (26, '38mm', 'Silver', '219.99', 'IWATCH-001-38mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/52.jpg?alt=media&token=eb7173c0-6056-448b-9da6-532218ef5625&_gl=1*pwokii*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjczMzcuMzYuMC4w'),
  (27, '45mm', 'Black', '269.99', 'SAMSUNG-002-45mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/53.jpg?alt=media&token=048e4039-6468-4647-aacf-99f46849573b&_gl=1*g5di1k*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjczNTUuMTguMC4w'),
  (27, '41mm', 'Rose Gold', '239.99', 'SAMSUNG-002-41mm-RoseGold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/54.jpg?alt=media&token=76cb8999-4699-4eb3-8378-476d1d717a89&_gl=1*k10v1n*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0MjczNzcuNjAuMC4w'),
  (28, '44mm', 'Black', '259.99', 'GARMIN-003-44mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/55.jpg?alt=media&token=989848ff-c0cf-4e98-a899-bd171cf7545d&_gl=1*11fjny8*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0Mjc0MDEuMzYuMC4w'),
  (28, '40mm', 'Silver', '229.99', 'GARMIN-003-40mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/56.jpg?alt=media&token=f7a26317-3c92-4d69-b7fe-6a699b7d2aa9&_gl=1*y9pkb3*_ga*MTE3NjM4MDI1MS4xNjk3NzI1Mjcw*_ga_CW55HF8NVT*MTY5ODQyNjQ4Ni4xNC4xLjE2OTg0Mjc0MjQuMTMuMC4w'),
  (29, '41mm', 'Gold', '239.99', 'FOSSIL-004-41mm-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/57.jpg?alt=media&token=1af93cc9-4d91-4224-b85b-2a525bd4a681&_gl=1*11j94fn*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNTYyMS41Mi4wLjA. '),
  (29, '46mm', 'Silver', '269.99', 'FOSSIL-004-46mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/58.jpg?alt=media&token=b9bb8eb3-e986-40ae-aa34-7d8162f45012&_gl=1*29khff*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNjEyOS40Ni4wLjA. '),
  (30, '40mm', 'Blue', '229.99', 'FITBIT-005-40mm-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/59.jpg?alt=media&token=b66a14ab-1599-4d65-ba78-0227da4f71ce&_gl=1*10inkfk*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNjIyNS42MC4wLjA. '),
  (30, '45mm', 'Black', '259.99', 'FITBIT-005-45mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/60.jpg?alt=media&token=6a7abf78-e4e4-4050-b523-02ff16990937&_gl=1*81xp33*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNjI4NS42MC4wLjA. ');
  
-- Variants for Home Appliances with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (31, '600L', 'Stainless Steel', '999.99', 'SAMSUNG-001-600L-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/61.jpg?alt=media&token=a2496287-96e9-4d84-bad4-c8ff52d35ab9&_gl=1*cgs5dy*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzA4Ni43LjAuMA.. '),
  (31, '450L', 'Black', '799.99', 'SAMSUNG-001-450L-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/62.jpg?alt=media&token=28766fdb-9a2d-43d5-a223-db634f61224c&_gl=1*105lk48*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzE1Ni42MC4wLjA.'),
  (32, '8kg', 'White', '349.99', 'LG-002-8kg-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/63.jpg?alt=media&token=cb41538c-65fa-4c68-b74d-f515b5326616&_gl=1*1gkvlq3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzE5NC4yMi4wLjA.'),
  (32, '7kg', 'Silver', '299.99', 'LG-002-7kg-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/64.jpg?alt=media&token=8cb69db3-2f23-4220-b0b3-866e6917c890&_gl=1*g8t30p*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzIzNi42MC4wLjA.'),
  (33, '1000W', 'Stainless Steel', '149.99', 'WHIRLPOOL-003-1000W-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/65.jpg?alt=media&token=350314a1-11a9-4848-87a4-259fa90d5c10&_gl=1*14zu1x5*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzI4My4xMy4wLjA. '),
  (33, '800W', 'Black', '129.99', 'WHIRLPOOL-003-800W-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/66.jpg?alt=media&token=a535fa90-140c-4410-887e-622aa14ed79c&_gl=1*1t6wxrr*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzMxMy42MC4wLjA.'),
  (34, '10 Cups', 'Stainless Steel', '89.99', 'BREVILLE-004-10Cups-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/67.jpg?alt=media&token=ec0506ae-71a9-44a2-943e-978627757f36&_gl=1*3uow0u*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzM3Ni42MC4wLjA. '),
  (34, '8 Cups', 'Glass', '79.99', 'BREVILLE-004-8Cups-Glass', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/68.jpg?alt=media&token=77274b55-7eaa-4a84-a9b9-17df6553e3e1&_gl=1*ar7hck*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzQwOS4yNy4wLjA.'),
  (35, 'Corded', 'Purple', '119.99', 'DYSON-VACUUM-005-Corded-Purple', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/69.jpg?alt=media&token=7d069e16-3e26-4d35-a877-959bb5ca943d&_gl=1*4sefic*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzQzOC42MC4wLjA. '),
  (35, 'Cordless', 'Red', '129.99', 'DYSON-VACUUM-005-Cordless-Red', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/70.jpg?alt=media&token=077e2d6b-fd6d-4ef6-b4c3-68ff4e217cfe&_gl=1*1wql53b*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzNzQ2OC4zMC4wLjA. ');
  
-- Variants for Gaming Consoles with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (36, '1TB', 'White', '499.99', 'PS5-001-1TB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/71.jpg?alt=media&token=d7617a88-c3d8-44f5-918a-3abe630f4f0c&_gl=1*6if2wm*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODA2NS4zMC4wLjA. '),
  (36, '512GB', 'Black', '549.99', 'PS5-001-512GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/72.jpg?alt=media&token=c60669f3-fa9c-4451-ac50-fe27a31129b3&_gl=1*116n53h*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODI3OC42MC4wLjA. '),
  (37, '1TB', 'Black', '499.99', 'XBOXX-002-1TB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/73.jpg?alt=media&token=827e82f8-f51d-4a6c-9caa-c57796355ced&_gl=1*n1dsvw*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODMxMC4yOC4wLjA. '),
  (37, '512GB', 'White', '549.99', 'XBOXX-002-512GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/74.jpg?alt=media&token=8e113aff-473d-493b-bab4-0c78edb6f62a&_gl=1*11ohql1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODMzMC44LjAuMA.. '),
  (38, '32GB', 'Neon Blue/Red', '299.99', 'NINTENDO-003-32GB-NeonBlueRed', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/75.jpg?alt=media&token=044159a2-6571-4475-bebf-2df18f361a87&_gl=1*jixo5e*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODM0OC42MC4wLjA. '),
  (38, '64GB', 'Turquoise', '349.99', 'NINTENDO-003-64GB-Turquoise', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/76.jpg?alt=media&token=c2c8556d-3f26-4e99-a1e0-c21641a1fcde&_gl=1*19pgfmp*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODM2OC40MC4wLjA. '),
  (39, '1TB', 'Jet Black', '499.99', 'PS4-004-1TB-JetBlack', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/77.jpg?alt=media&token=47fe3eb2-ac95-42bf-b7bc-acacde26fdf6&_gl=1*55wih0*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODM5MC4xOC4wLjA. '),
  (39, '512GB', 'Robot White', '549.99', 'PS4-004-512GB-RobotWhite', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/78.jpg?alt=media&token=da12ee70-9acf-44b7-ac7f-a1ab3cce8257&_gl=1*1c8xkac*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODQxMC42MC4wLjA. '),
  (40, '1TB', 'Cyberpunk 2077 Edition', '599.99', 'XBOX1-005-1TB-Cyberpunk2077', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/79.jpg?alt=media&token=e93f4999-72d2-4d99-af73-87e5cc379cb9&_gl=1*8sbliv*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODQyOS40MS4wLjA. '),
  (40, '512GB', 'Robot White', '549.99', 'XBOX1-005-512GB-RobotWhite', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/80.jpg?alt=media&token=817acc6d-e069-4111-b017-cb4674a337e1&_gl=1*1qf11ng*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzODQ2NC42LjAuMA.. ');
  
-- Variants for Smart Home Security with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (41, 'Base Station, Contact Sensor, Keypad, Motion Detector', 'White', '399.99', 'SECURITY-001-BaseStation-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/81.jpg?alt=media&token=63d6dd9b-04ff-4e2a-9ae4-51c644f41c77&_gl=1*1auqkir*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODEzOTk0OC4yNi4wLjA. '),
  (41, 'Base Station, Contact Sensor', 'White', '349.99', 'SECURITY-001-BaseStation-ContactSensor-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/82.jpg?alt=media&token=b250431d-9541-40cc-b98c-9c6f80bacd1b&_gl=1*cswzb0*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDY5OC40NC4wLjA. '),
  (42, '2 Cameras', 'White', '499.99', 'SECURITY-002-2Cameras-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/83.jpg?alt=media&token=33f88b71-5ca6-4cfc-8ccc-01c1534e3269&_gl=1*11tzn57*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDcxNC4yOC4wLjA. '),
  (42, '1 Camera', 'White', '299.99', 'SECURITY-002-1Camera-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/84.jpg?alt=media&token=0603fb79-0191-463a-9523-b9d22ec527e9&_gl=1*g1l42w*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDcyOS4xMy4wLjA. '),
  (43, 'Battery-Powered', 'White', '199.99', 'SECURITY-003-BatteryPowered-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/85.jpg?alt=media&token=25d9cfbb-6079-484b-a933-63400c812400&_gl=1*iz69f2*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDc0OS42MC4wLjA. '),
  (43, 'Hardwired', 'Black', '249.99', 'SECURITY-003-Hardwired-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/86.jpg?alt=media&token=298de63d-61c7-4b48-b819-f9fc4ccf8340&_gl=1*1duo7b5*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDc2NS40NC4wLjA. '),
  (44, 'Wired', 'White', '279.99', 'SECURITY-004-Wired-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/87.jpg?alt=media&token=50c3b682-e8fc-494d-8062-480025a30e86&_gl=1*1od3sj1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDc5MC4xOS4wLjA. '),
  (44, 'Wireless', 'Black', '299.99', 'SECURITY-004-Wireless-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/88.jpg?alt=media&token=043ec0c1-2715-4b8d-9ec4-02a9b24cb663&_gl=1*1xf632a*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDgxMS42MC4wLjA. '),
  (45, 'Indoor', 'White', '149.99', 'SECURITY-005-Indoor-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/89.jpg?alt=media&token=fd2af550-de38-4b8d-887b-b835f5a09e70&_gl=1*1yy6iai*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDgyNS40Ni4wLjA. '),
  (45, 'Indoor', 'Black', '149.99', 'SECURITY-005-Indoor-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/90.jpg?alt=media&token=d5943726-a89c-4934-9dcd-75f1a93b9dec&_gl=1*xdsdm*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODEzNTI2Ny4yLjEuMTY5ODE0MDg0My4yOC4wLjA. ');
  
-- Variants for Printers with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (46, '30 ppm', 'White', '299.99', 'PRINTER-001-30ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/91.jpg?alt=media&token=c6d15cdb-8951-4dcf-b75a-b74cf626cf81&_gl=1*3s74v3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjAuMTY5ODE1MTkzMi42MC4wLjA. '),
  (46, '25 ppm', 'Black', '279.99', 'PRINTER-001-25ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/92.jpg?alt=media&token=b1fce6f2-3dac-425f-80eb-f5dcd73a1b90&_gl=1*12jcj13*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MTk1Ni4zNi4wLjA. '),
  (47, '15 ppm', 'White', '199.99', 'PRINTER-002-15ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/93.jpg?alt=media&token=ad3f3dd7-2959-47ae-aba6-ebde197fc51e&_gl=1*1nsat9w*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MjEwNi42MC4wLjA. '),
  (47, '20 ppm', 'Black', '219.99', 'PRINTER-002-20ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/94.jpg?alt=media&token=8214a93e-4258-451b-940d-2871a5bf1c07&_gl=1*17wk3wa*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MjE0My4yMy4wLjA. '),
  (48, '20 ppm', 'White', '229.99', 'PRINTER-003-20ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/95.jpg?alt=media&token=97aefdaa-9153-4f3e-a31b-9ece49e69ca4&_gl=1*pf2q57*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MjE2Mi40LjAuMA.. '),
  (48, '15 ppm', 'Black', '209.99', 'PRINTER-003-15ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/96.jpg?alt=media&token=41d674b0-2cf3-4a13-8c66-20ce19adf04f&_gl=1*s2br6q*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MjIwNC4yMy4wLjA. '),
  (49, '25 ppm', 'White', '259.99', 'PRINTER-004-25ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/97.jpg?alt=media&token=63f74c22-e7fa-4ac1-abdb-edc355eb03fa&_gl=1*xu0gx8*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MjI1OS42MC4wLjA. '),
  (49, '30 ppm', 'Black', '279.99', 'PRINTER-004-30ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/98.jpg?alt=media&token=be528a7a-9e35-4f91-ac25-5a2c87e7ed33&_gl=1*1gstnnh*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MzAzNi4yNC4wLjA. '),
  (50, '18 ppm', 'White', '229.99', 'PRINTER-005-18ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/99.jpg?alt=media&token=45dbf0bb-4a2d-4ec9-8fa6-4ad6db466808&_gl=1*n09ghc*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MzA2MS42MC4wLjA. '),
  (50, '22 ppm', 'Black', '249.99', 'PRINTER-005-22ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/100.jpg?alt=media&token=dc568e65-4761-45ad-a53f-9d98d28c2977&_gl=1*13glgzp*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1MzI5Ni42MC4wLjA. ');
  
-- Variants for Tablets with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (51, '128GB', 'Space Gray', '449.99', 'TAB-001-128GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/101.jpg?alt=media&token=99d53095-c74b-447c-a9b2-c08fce5fea44&_gl=1*lev42*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDQ0Ni42MC4wLjA. '),
  (51, '256GB', 'Silver', '549.99', 'TAB-001-256GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/102.jpg?alt=media&token=3408eda8-8dc5-4d34-be37-fffe685e572f&_gl=1*e7zkm0*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDQ4NS4yMS4wLjA. '),
  (52, '64GB', 'Black', '399.99', 'TAB-002-64GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/103.jpg?alt=media&token=6137b7bb-ad90-4033-9a68-237ff1484dc8&_gl=1*zfinr7*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDU0Ni42MC4wLjA. '),
  (52, '128GB', 'Gold', '449.99', 'TAB-002-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/104.jpg?alt=media&token=e650a3a9-dbec-4223-9cea-751b57ac1292&_gl=1*k0zccn*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDU2My40My4wLjA. '),
  (53, '256GB', 'Space Gray', '549.99', 'TAB-003-256GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/105.jpg?alt=media&token=1c4b6e4e-1b05-4553-94d0-ad5ba3568519&_gl=1*m7w4jk*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDU5My4xMy4wLjA. '),
  (53, '64GB', 'Silver', '399.99', 'TAB-003-64GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/106.jpg?alt=media&token=23f0ccc7-0c28-4b2a-8d05-8f4e640f06ae&_gl=1*1adtue1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDYyNi42MC4wLjA. '),
  (54, '128GB', 'Gold', '449.99', 'TAB-004-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/107.jpg?alt=media&token=b288367e-14a5-437e-b088-a8875230c809&_gl=1*w18yf1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDY0Ny4zOS4wLjA. '),
  (54, '256GB', 'Black', '549.99', 'TAB-004-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/108.jpg?alt=media&token=8afd6c0a-8ccc-43fb-9858-20a21d1ba11e&_gl=1*17qwfxb*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDY3MC4xNi4wLjA. '),
  (55, '64GB', 'Silver', '399.99', 'TAB-005-64GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/109.jpg?alt=media&token=e5ca173e-b7c2-428f-8acb-bede5ccea0a1&_gl=1*1mjg0rp*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDY4OC42MC4wLjA. '),
  (55, '128GB', 'Space Gray', '449.99', 'TAB-005-128GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/110.jpg?alt=media&token=f4b679aa-5513-4359-88ef-d3d8cbebc24e&_gl=1*1kxh5ke*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODE1MTkzMi40LjEuMTY5ODE1NDcyMS4yNy4wLjA. ');

-- Action Figures Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (56, 'Red Racer', 'Small', '9.99', 'TC001-RedRacerSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/111.jpg?alt=media&token=5238bf0b-5640-446f-b75a-15feecf7918a&_gl=1*1ndk6t7*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjAuMTY5ODc0Njc2Ny42MC4wLjA.'),
  (56, 'Red Racer', 'Large', '14.99', 'TC002-RedRacerLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/112.jpg?alt=media&token=c93a8cd8-7769-4b44-96ba-a740acca12f1&_gl=1*1pi0i8x*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njc3NC41My4wLjA.'),
  (57, 'Blue Cruiser', 'Small', '10.99', 'TC003-BlueCruiserSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/113.jpg?alt=media&token=6108f7d7-7526-448e-aa77-1bf6227fef33&_gl=1*lukne1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njc4MC40Ny4wLjA.'),
  (57, 'Blue Cruiser', 'Large', '15.99', 'TC004-BlueCruiserLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/114.jpg?alt=media&token=2410efbc-4ac3-4c36-b00c-1891d03d0f2a&_gl=1*1rf4xrl*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgyNi4xLjAuMA..'),
  (58, 'Safari Adventure', 'Small', '12.99', 'TJ001-SafariSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/115.jpg?alt=media&token=3fae24c2-0b13-4dcb-be3b-4aea73849216&_gl=1*wzcg75*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzMS42MC4wLjA.'),
  (58, 'Safari Adventure', 'Large', '17.99', 'TJ002-SafariLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/116.jpg?alt=media&token=289326d5-30f3-4281-af11-15e8f43045a8&_gl=1*5qbgn4*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzNC41Ny4wLjA.'),
  (59, 'Rescue Chopper', 'Small', '11.99', 'TH001-RescueSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/117.jpg?alt=media&token=218c71fd-8f7d-4471-baa2-0514edf9bd85&_gl=1*1me1z7o*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzNy41NC4wLjA.'),
  (59, 'Rescue Chopper', 'Large', '16.99', 'TH002-RescueLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/118.jpg?alt=media&token=c4cb5748-3238-40fc-aa4a-aad677ad9bc3&_gl=1*1jmsxmx*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg0MS41MC4wLjA.'),
  (60, 'Police Pursuit', 'Small', '12.99', 'TH003-PoliceSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/119.jpg?alt=media&token=362731b1-390c-4520-af0a-61786b7912ee&_gl=1*12ttxsf*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg0Ni40NS4wLjA.'),
  (60, 'Police Pursuit', 'Large', '17.99', 'TH004-PoliceLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/120.jpg?alt=media&token=24bc866a-df3a-4572-bbbf-e0f147609875&_gl=1*v0heew*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg1My4zOC4wLjA.');
  
-- Board Games Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (61, 'Laser Shooter', 'Red', '7.99', 'TW001-LaserRed', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/121.jpg?alt=media&token=c6d4fd51-77f6-463e-bd80-875f3942518d&_gl=1*13dibzu*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk0OC42MC4wLjA.'),
  (61, 'Laser Shooter', 'Blue', '7.99', 'TW002-LaserBlue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/122.jpg?alt=media&token=ca91662c-cb4a-45a1-9726-59844067f9b6&_gl=1*1b67pj*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1Mi41Ni4wLjA.'),
  (62, 'Knight\'s Weapon', 'Silver', '9.99', 'TW003-SwordSilver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/123.jpg?alt=media&token=314a57d8-5bd3-45b6-9923-1aeadb8b1088&_gl=1*1ydqx04*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1Ni41Mi4wLjA.'),
  (62, 'Knight\'s Weapon', 'Gold', '9.99', 'TW004-SwordGold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/124.jpg?alt=media&token=74a45fc3-8608-4a7d-8e03-79eab85a8acc&_gl=1*1w4ersx*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1OS40OS4wLjA.'),
  (63, 'Dinosaur World', '2-5 Players', '32.99', 'BG005-DinosaurWorld', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/125.jpg?alt=media&token=cea8a379-acc1-4f9c-9522-0a361fc91ddc&_gl=1*3l3o4d*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk2My40NS4wLjA.'),
  (63, 'Dinosaur World', '2-5 Players', '37.99', 'BG006-DinosaurWorld', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/126.jpg?alt=media&token=e1147672-ad23-4cdd-a194-3be85e5fabcb&_gl=1*1i6fvnb*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk2OC40MC4wLjA.'),
  (64, 'Pirates Treasure', '2-4 Players', '28.99', 'BG007-PiratesTreasure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/127.jpg?alt=media&token=f3bf9cf2-d8a5-4b3b-ae0b-64b8d0e8ab39&_gl=1*fkrl06*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3Mi4zNi4wLjA.'),
  (64, 'Pirates Treasure', '2-4 Players', '33.99', 'BG008-PiratesTreasure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/128.jpg?alt=media&token=dc352ee6-aba6-4dcc-a90b-10f4d625821d&_gl=1*u0ehqr*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3NS4zMy4wLjA.'),
  (65, 'Fantasy Quest', '2-6 Players', '31.99', 'BG009-FantasyQuest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/129.jpg?alt=media&token=d019933d-2159-42f8-b679-06c66971980d&_gl=1*1scibti*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3OS4yOS4wLjA.'),
  (65, 'Fantasy Quest', '2-6 Players', '36.99', 'BG010-FantasyQuest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/130.jpg?alt=media&token=68927ad1-1f85-44a8-879a-8c7ef1c170f2&_gl=1*1bcmbe*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk4NC4yNC4wLjA.');
  
-- Dolls Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '9.99', 'DL001-FashionModelSummer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/131.jpg?alt=media&token=b6cccf3b-4d4f-402b-aa2a-32abbd0a942b&_gl=1*17r8mik*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzEzMi42MC4wLjA.'),
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '11.99', 'DL002-FashionModelSummer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/132.jpg?alt=media&token=2c859400-18e3-4db6-b876-c4425ff60f82&_gl=1*350b4w*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE0NS40Ny4wLjA.'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '11.99', 'DL003-PrincessRoyalGown', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/133.jpg?alt=media&token=0a8fa059-0d94-4eda-9053-c85784faec3c&_gl=1*1s3cyr7*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE1MC40Mi4wLjA.'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '13.99', 'DL004-PrincessRoyalGown', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/134.jpg?alt=media&token=e3695e31-2fca-4b5d-99cc-7d30a260ca76&_gl=1*1vhbzud*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE1NC4zOC4wLjA.'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '10.99', 'DL005-MermaidAdventure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/135.jpg?alt=media&token=350af85c-715e-4455-9f57-5ee094d14b90&_gl=1*1di8inn*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE2MS4zMS4wLjA.'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '12.99', 'DL006-MermaidAdventure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/136.jpg?alt=media&token=6be9c93a-c205-4360-a68b-3e9dba6feca1&_gl=1*1vuy678*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE3MC4yMi4wLjA.'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '12.99', 'DL007-PopStarSensation', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/137.jpg?alt=media&token=e927f4f8-545d-4adb-ac9b-19ef342aeaba&_gl=1*1mrr835*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE3NS4xNy4wLjA.'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '14.99', 'DL008-PopStarSensation', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/138.jpg?alt=media&token=dd2da737-63f2-4eb4-8010-3b337c0ae2e0&_gl=1*1xjftb9*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE4MC4xMi4wLjA.'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '8.99', 'DL009-FairyTaleForest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/139.jpg?alt=media&token=9e532c7d-254d-42ec-9053-9a26dca147ca&_gl=1*1l22i8p*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE4NS43LjAuMA..'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '10.99', 'DL010-FairyTaleForest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/140.jpg?alt=media&token=d0090b1f-57e9-4e62-9ecb-a839067b7fe3&_gl=1*rlfhrs*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE5Mi42MC4wLjA.');

-- Remote Control Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (71, 'Racing Car - Speedster', '2.4GHz', '29.99', 'RC001-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/141.jpg?alt=media&token=b5cf3c8e-078f-4d09-8056-37d531b431c2&_gl=1*1tn3qj3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzI5OS42MC4wLjA.'),
  (71, 'Racing Car - Speedster', '2.4GHz', '31.99', 'RC002-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/142.jpg?alt=media&token=8e88e206-792b-4410-8f74-361c58023693&_gl=1*yg7x70*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMwMy41Ni4wLjA.'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '39.99', 'RC003-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/143.jpg?alt=media&token=8327ad29-eaee-49aa-a867-664bbca52336&_gl=1*1o0hph0*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMwOC41MS4wLjA.'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '41.99', 'RC004-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/144.jpg?alt=media&token=13e7f052-edaa-4bdf-9d2a-6402335af375&_gl=1*l4hxa2*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMxMy40Ni4wLjA.'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '35.99', 'RC005-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/145.jpg?alt=media&token=598d2c0b-0851-4d3f-955c-941e3dcc9218&_gl=1*1sfwt36*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMxOC40MS4wLjA.'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '37.99', 'RC006-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/146.jpg?alt=media&token=70d003ed-86d8-4935-8262-a68bee514374&_gl=1*z2qkwu*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMyOC4zMS4wLjA.'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '49.99', 'RC007-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/147.jpg?alt=media&token=af53194a-c881-496a-9f2c-966cecd4808f&_gl=1*1xeyt79*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMzOC4yMS4wLjA.'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '51.99', 'RC008-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/148.jpg?alt=media&token=36c4b4a3-bc2d-4e33-be6f-062483cfbde6&_gl=1*fj1e28*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM0Ny4xMi4wLjA.'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '45.99', 'RC009-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/149.jpg?alt=media&token=79c8dc7d-7fa8-414e-b0b5-63c777b5337d&_gl=1*siydti*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM2MC42MC4wLjA.'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '47.99', 'RC010-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/150.jpg?alt=media&token=7ec06a6f-3b0c-4ac1-958e-3daa332fe5d6&_gl=1*1hxksmr*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM2Ni41NC4wLjA.');
  
  -- Educational Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '39.99', 'ET001-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/151.jpg?alt=media&token=e4bca776-9789-4184-a919-ef67d2117735&_gl=1*bsl132*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ2Mi42MC4wLjA.'),
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '42.99', 'ET002-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/152.jpg?alt=media&token=39fb2425-78c1-4fcb-b081-d80d21e07bb6&_gl=1*5z7vis*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ2OC41NC4wLjA.'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '49.99', 'ET003-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/153.jpg?alt=media&token=7b4ab2a1-d72e-4295-9b88-3c4bb668d9ee&_gl=1*11ukq5f*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ3NC40OC4wLjA.'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '52.99', 'ET004-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/154.jpg?alt=media&token=12cc7e0e-416f-4b23-8693-9fccd23544fd&_gl=1*10lp50z*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ3OS40My4wLjA.'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '19.99', 'ET005-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/155.jpg?alt=media&token=c5108bb4-b0cf-4828-b7e1-c679ddc52cf0&_gl=1*1l88szb*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ4NC4zOC4wLjA.'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '21.99', 'ET006-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/156.jpg?alt=media&token=16cccd9c-2d82-4ea0-81fa-5a3e2efe06ac&_gl=1*1udz7ay*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ5MS4zMS4wLjA.'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '24.99', 'ET007-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/157.jpg?alt=media&token=5c63ca88-dfb5-4698-ab37-52b20a527c2c&_gl=1*yrxb0m*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ5OC4yNC4wLjA.'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '26.99', 'ET008-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/158.jpg?alt=media&token=86011faf-920c-4be0-bf1b-2591fc8a97a8&_gl=1*1x6svv3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUwNC4xOC4wLjA.'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '29.99', 'ET009-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/159.jpg?alt=media&token=501388c1-14e0-43d8-80eb-d5100a5955a7&_gl=1*104solm*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUwOS4xMy4wLjA.'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '31.99', 'ET010-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/160.jpg?alt=media&token=e46c2423-0b23-45ae-b701-f87df8fb4495&_gl=1*1everx5*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUxNS43LjAuMA..'),
  (1, '265GB', 'Silver', '899.99', 'IP12-001-256GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/1.jpeg?alt=media&token=2864a9ec-eafd-4fce-87dd-06639d891aa6&_gl=1*1jzclm6*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODU0My42MC4wLjA.'),
  (1, '265GB', 'Gold', '899.99', 'IP12-001-256GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/2.jpeg?alt=media&token=bc6561c2-4cc2-4620-b04c-062cc33a99ae&_gl=1*tex6im*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzODcyMi42MC4wLjA.'),
  (7, '65"', 'OLED evo', '1499.99', 'OLED65-001-65-OLED-evo', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/13.jpg?alt=media&token=b3c04374-4dd3-4e77-aa84-fef23169b661&_gl=1*18ii8pz*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTAyMi4zNC4wLjA.'),
  (7, '55"', 'OLED evo', '1299.99', 'OLED55-001-55-OLED-evo', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/14.jpg?alt=media&token=a4051eec-d396-4966-8ce5-ddeccf19d8a3&_gl=1*1ktxnbd*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODMzODA2NS43LjEuMTY5ODMzOTEwMy4xNi4wLjA.');
-- Records for Product_Sub_Category
-- Referring to Electronics Category (Mobile Phones)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (1, 7), -- iPhone 12
  (2, 7), -- Samsung Galaxy S21
  (3, 7), -- Google Pixel 5
  (4, 7), -- OnePlus 9
  (5, 7); -- Xiaomi Mi 11

-- Referring to Electronics Category (TVs)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (6, 8), -- Samsung 55" 4K Smart TV
  (7, 8), -- LG 65" OLED TV
  (8, 8), -- Sony 60" 4K Smart TV
  (9, 8), -- TCL 50" LED TV
  (10, 8); -- Hisense 43" 1080p TV

-- Referring to Electronics Category (Laptops)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (11, 9), -- Dell XPS 13
  (12, 9), -- MacBook Air
  (13, 9), -- HP Spectre x360
  (14, 9), -- Lenovo ThinkPad X1 Carbon
  (15, 9); -- Asus ROG Zephyrus G14

-- Referring to Electronics Category (Headphones)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (16, 10), -- Sony WH-1000XM4
  (17, 10), -- Bose QuietComfort 35 II
  (18, 10), -- Sennheiser HD 660 S
  (19, 10), -- Beats Solo Pro
  (20, 10); -- JBL Free X

-- Referring to Electronics Category (Cameras)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (21, 11), -- Canon EOS 5D Mark IV
  (22, 11), -- Nikon D750
  (23, 11), -- Sony Alpha A7 III
  (24, 11), -- Panasonic Lumix GH5
  (25, 11); -- Fujifilm X-T4

-- Referring to Electronics Category (Watches)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (26, 12), -- Apple Watch Series 6
  (27, 12), -- Samsung Galaxy Watch 3
  (28, 12), -- Garmin Forerunner 945
  (29, 12), -- Fossil Gen 5
  (30, 12); -- Fitbit Versa 3

-- Referring to Electronics Category (Home Appliances)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (31, 13), -- Samsung Refrigerator
  (32, 13), -- LG Washing Machine
  (33, 13), -- Whirlpool Microwave Oven
  (34, 13), -- Breville Coffee Maker
  (35, 13); -- Dyson Vacuum Cleaner\
  
-- Referring to Electronics Category (Gaming Consoles)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (36, 14), -- PlayStation 5
  (37, 14), -- Xbox Series X
  (38, 14), -- Nintendo Switch
  (39, 14), -- Sony PlayStation 4
  (40, 14); -- Xbox One X

-- Referring to Electronics Category (Smart Home Security)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (41, 15), -- Ring Alarm Security Kit
  (42, 15), -- Arlo Pro 4 Security Camera
  (43, 15), -- Nest Hello Video Doorbell
  (44, 15), -- SimpliSafe Home Security System
  (45, 15); -- Blink Mini Indoor Camera

-- Referring to Electronics Category (Printers)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (46, 16), -- HP LaserJet Pro
  (47, 16), -- Epson EcoTank
  (48, 16), -- Canon PIXMA
  (49, 16), -- Brother HL-L2350DW
  (50, 16); -- Xerox WorkCentre

-- Referring to Electronics Category (Tablets)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (51, 17), -- Apple iPad Pro
  (52, 17), -- Samsung Galaxy Tab S7
  (53, 17), -- Microsoft Surface Pro 7
  (54, 17), -- Amazon Fire HD 10
  (55, 17); -- Lenovo Tab M10;
  
  -- Referring to Electronics Category (Action Figures)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (56, 18), 
  (57, 18), 
  (58, 18), 
  (59, 18),
  (60, 18);
    
  -- Referring to Electronics Category (Board Games)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (61, 19), 
  (62, 19), 
  (63, 19), 
  (64, 19),
  (65, 19);
  
  -- Referring to Electronics Category (Dolls)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (66, 20), 
  (67, 20), 
  (68, 20), 
  (69, 20),
  (70, 20); 
  
  -- Referring to Electronics Category (Remote Control Toys)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (71, 21), 
  (72, 21), 
  (73, 21), 
  (74, 21),
  (75, 21);
  
  -- Referring to Electronics Category (Educational Toys)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (76, 22), 
  (77, 22), 
  (78, 22), 
  (79, 22),
  (80, 22);


-- Insert data for Inventory
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  -- Inventory for Mobile Phones
  (1, 50),
  (2, 30),
  (3, 40),
  (4, 25),
  (5, 60),
  (6, 45),
  (7, 55),
  (8, 70),
  (9, 35),
  (10, 48),

  -- Inventory for TVs
  (11, 20),
  (12, 1),
  (13, 22),
  (14, 17),
  (15, 28),
  (16, 25),
  (17, 30),
  (18, 27),
  (19, 40),
  (20, 35),

  -- Inventory for Laptops
  (21, 12),
  (22, 15),
  (23, 14),
  (24, 10),
  (25, 18),
  (26, 20),
  (27, 11),
  (28, 13),
  (29, 8),
  (30, 9),

  -- Inventory for Headphones
  (31, 90),
  (32, 80),
  (33, 70),
  (34, 65),
  (35, 55),
  (36, 48),
  (37, 75),
  (38, 60),
  (39, 110),
  (40, 95),

  -- Inventory for Cameras
  (41, 25),
  (42, 20),
  (43, 30),
  (44, 28),
  (45, 22),
  (46, 18),
  (47, 32),
  (48, 27),
  (49, 16),
  (50, 14),

  -- Inventory for Watches
  (51, 35),
  (52, 42),
  (53, 50),
  (54, 48),
  (55, 38),
  (56, 40),
  (57, 46),
  (58, 45),
  (59, 36),
  (60, 33),

  -- Inventory for Home Appliances
  (61, 15),
  (62, 18),
  (63, 24),
  (64, 20),
  (65, 28),
  (66, 26),
  (67, 12),
  (68, 14),
  (69, 10),
  (70, 1),

  -- Inventory for Gaming Consoles
  (71, 30),
  (72, 25),
  (73, 40),
  (74, 35),
  (75, 22),
  (76, 20),
  (77, 33),
  (78, 28),
  (79, 17),
  (80, 14),

  -- Inventory for Smart Home Security
  (81, 20),
  (82, 18),
  (83, 25),
  (84, 22),
  (85, 15),
  (86, 12),
  (87, 28),
  (88, 26),
  (89, 10),
  (90, 9);
  
-- Variants for Printers
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  (91, 35),
  (92, 30),
  (93, 42),
  (94, 38),
  (95, 48),
  (96, 40),
  (97, 28),
  (98, 32),
  (99, 24),
  (100, 26);
  
  -- Variants for Tablets
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  (101, 70),
  (102, 62),
  (103, 80),
  (104, 75),
  (105, 68),
  (106, 60),
  (107, 78),
  (108, 72),
  (109, 55),
  (110, 52);
  
  -- Variants for NewlyAdded
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  (111, 20),
  (112, 23),
  (113, 33),
  (114, 12);
  
-- Variants 
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  (115, 35),
  (116, 30),
  (117, 42),
  (118, 38),
  (119, 48),
  (120, 40),
  (121, 28),
  (122, 32),
  (123, 24),
  (124, 26),
  (125, 35),
  (126, 30),
  (127, 42),
  (128, 38),
  (129, 48),
  (130, 40),
  (131, 28),
  (132, 32),
  (133, 24),
  (134, 26),
  (135, 70),
  (136, 62),
  (137, 80),
  (138, 75),
  (139, 68),
  (140, 60),
  (141, 78),
  (142, 72),
  (143, 55),
  (144, 52),
  (145, 20),
  (146, 23),
  (147, 33),
  (148, 12);

-- Variants
INSERT INTO Ecom_platform.Inventory (variant_id, quantity)
VALUES
  (149, 70),
  (150, 62),
  (151, 80),
  (152, 75),
  (153, 68),
  (154, 60),
  (155, 78),
  (156, 72),
  (157, 55),
  (158, 52),
  (159, 20),
  (160, 23),
  (161, 33),
  (162, 12),
  (163, 50),
  (164, 30);

-- Example Cart records
INSERT INTO Ecom_platform.Cart (user_id, status)
VALUES
  (1, 'Complete'),
  (2, 'Complete'),  
  (3, 'Complete'),
  (4, 'Complete'),
  (5, 'Complete'),
  (6, 'Complete'),
  (7, 'Complete'),  
  (8, 'Complete'),
  (9, 'Complete'),
  (10, 'Complete'),
  (11, 'Complete'), 
  (12, 'Complete'),
  (13, 'Complete'),    
  (14, 'Complete'), 
  (15, 'Complete'),
  (16, 'Complete'),
  (17, 'Complete'),
  (18, 'Complete'),
  (19, 'Complete'),   
  (20, 'Complete'),  
  (21, 'Pending'),
  (22, 'Pending'),
  (23, 'Pending'), 
  (24, 'Pending'),
  (25, 'Pending'),
  (26, 'Pending'),
  (27, 'Pending');
  
-- Additional Cart records for remaining users
INSERT INTO Ecom_platform.Cart (user_id, status)
VALUES
  (28, 'Pending'),
  (29, 'Pending'), 
  (30, 'Pending'),
  (31, 'Pending'),
  (32, 'Pending'), 
  (33, 'Pending'),
  (34, 'Pending'),
  (35, 'Pending'),
  (36, 'Pending'),
  (37, 'Pending'),
  (38, 'Pending'),
  (39, 'Pending'),
  (40, 'Pending'), 
  (41, 'Pending'),
  (42, 'Pending'),
  (43, 'Pending'),
  (44, 'Pending'),
  (45, 'Pending');


INSERT INTO Ecom_platform.Cart (user_id, status)
VALUES
  (1, 'Pending'),
  (2, 'Pending'),  
  (3, 'Pending'),
  (4, 'Pending'),
  (5, 'Pending'),
  (6, 'Pending'),
  (7, 'Pending'),  
  (8, 'Pending'),
  (9, 'Pending'),
  (10, 'Pending'),
  (11, 'Pending'), 
  (12, 'Pending'),
  (13, 'Pending'),    
  (14, 'Pending'), 
  (15, 'Pending'),
  (16, 'Pending'),
  (17, 'Pending'),
  (18, 'Pending'),
  (19, 'Pending'),   
  (20, 'Pending');
  
-- Example Cart_item records
INSERT INTO Ecom_platform.Cart_item (variant_id, cart_id, quantity, status, sold_date, sold_price_per_item)
VALUES
-- Cart 1
  (1, 1, 2, 'Complete', '2022-01-12', '699.99'), -- Mobile Phones (variant_id 1) - 2 items
  (11, 1, 1, 'Complete', '2022-01-12', '799.99'), -- TVs (variant_id 11) - 1 item
  (51, 1, 2, 'Complete', '2022-01-12', '249.99'), -- Watches (variant_id 51) - 2 items
  (61, 1, 4, 'Complete', '2022-01-12', '999.99'), -- Home Appliances (variant_id 61) - 4 items

-- Cart 2
  (1, 2, 3, 'Complete', '2022-05-11', '699.99'), -- Mobile Phones (variant_id 1) - 3 items
  (12, 2, 2, 'Complete', '2022-05-11', '999.99'), -- TVs (variant_id 12) - 2 items
  (22, 2, 1, 'Complete', '2022-05-11', '999.99'), -- Laptops (variant_id 22) - 1 item
  (32, 2, 4, 'Complete', '2022-05-11', '199.99'), -- Headphones (variant_id 32) - 4 items
  (42, 2, 3, 'Complete', '2022-05-11', '699.99'), -- Cameras (variant_id 42) - 3 items

-- Cart 3
  (13, 3, 2, 'Complete', '2023-03-10','1299.99'), -- TVs (variant_id 13) - 2 items (sold)
  (23, 3, 1, 'Complete', '2023-03-10','749.99'), -- Laptops (variant_id 23) - 1 item (sold)
  (53, 3, 2, 'Complete', '2023-03-10','269.99'), -- Watches (variant_id 53) - 2 items (sold)
  (63, 3, 1, 'Complete', '2023-03-10','349.99'), -- Home Appliances (variant_id 63) - 1 item (sold)

-- Cart 4
  (24, 4, 2, 'Complete', '2023-04-09', '949.99'), -- Laptops (variant_id 24) - 2 items
  (34, 4, 6, 'Complete', '2023-04-09', '189.99'), -- Headphones (variant_id 34) - 6 items
  (44, 4, 5, 'Complete', '2023-04-09', '799.99'), -- Cameras (variant_id 44) - 5 items
  (54, 4, 3, 'Complete', '2023-04-09', '239.99'), -- Watches (variant_id 54) - 3 items
  (64, 4, 2, 'Complete', '2023-04-09', '299.99'), -- Home Appliances (variant_id 64) - 2 items
  
-- Cart 5
  (5, 5, 2, 'Complete', '2023-05-08', '599.99'), -- Mobile Phones (variant_id 5) - 2 items (sold)
  (15, 5, 1, 'Complete', '2023-05-08', '849.99'), -- TVs (variant_id 15) - 1 item (sold)

-- Cart 6
  (6, 6, 2, 'Complete', '2023-06-07', '549.99'), -- Mobile Phones (variant_id 6) - 2 items (sold)
  (16, 6, 1, 'Complete', '2023-06-07', '699.99'), -- TVs (variant_id 16) - 1 item (sold)
  (26, 6, 2, 'Complete', '2023-06-07', '899.99'), -- Laptops (variant_id 26) - 2 items (sold)
  (36, 6, 1, 'Complete', '2023-06-07', '179.99'), -- Headphones (variant_id 36) - 1 item (sold)
  (46, 6, 2, 'Complete', '2023-06-07', '699.99'), -- Cameras (variant_id 46) - 2 items (sold)

-- Cart 7
  (7, 7, 3, 'Complete', '2023-07-06', '699.99'), -- Mobile Phones (variant_id 7) - 3 items
  (17, 7, 2, 'Complete', '2023-07-06', '449.99'), -- TVs (variant_id 17) - 2 items

-- Cart 8
  (8, 8, 4, 'Complete', '2023-08-05', '649.99'), -- Mobile Phones (variant_id 8) - 4 items
  (18, 8, 3, 'Complete', '2023-08-05', '399.99'), -- TVs (variant_id 18) - 3 items

-- Cart 9
  (9, 9, 5, 'Complete', '2023-09-04', '699.99'), -- Mobile Phones (variant_id 9) - 5 items

-- Cart 10 
  (61, 11, 3, 'Complete', '2023-10-03', '999.99'), -- Home Appliances (variant_id 61) - 3 items
  (71, 11, 2, 'Complete', '2023-10-03', '499.99'), -- Gaming Consoles (variant_id 71) - 2 items

-- Cart 11 (Partial Cart)
  (111, 11, 3, 'Complete', '2023-01-14', '14.99'), 
  (160, 11, 2, 'Complete', '2023-01-14', '31.99'), 

-- Cart 12
  (121, 12, 4, 'Complete', '2023-02-13', '34.99'),

-- Cart 13 (Empty Cart)
  (143, 13, 5, 'Complete', '2023-03-22', '39.99'), 
  (145, 13, 1, 'Complete', '2023-03-22', '35.99'), 

-- Cart 14
  (155, 14, 1, 'Complete', '2023-04-25', '19.99'),
  (156, 14, 1, 'Complete', '2023-04-25', '21.99'), 
  (134, 14, 2, 'Complete', '2023-04-25', '13.99'), 

-- Cart 15
  (122, 15, 3, 'Complete', '2023-05-30', '39.99'), 
  (128, 15, 2, 'Complete', '2023-05-30', '33.99'), 

-- Cart 16
  (130, 16, 4, 'Complete', '2023-06-29', '36.99'),
  (140, 16, 2, 'Complete', '2023-06-29', '10.99'), 
  (150, 16, 3, 'Complete', '2023-06-29', '47.99'), 
  (159, 16, 2, 'Complete', '2023-06-29', '29.99'), 

-- Cart 17 
  (116, 17, 1, 'Complete', '2023-07-18', '21.99'), 
  (152, 17, 3, 'Complete', '2023-07-18', '42.99'), 
  (119, 17, 2, 'Complete', '2023-07-18', '15.99'), 

-- Cart 18 
  (144, 18, 4, 'Complete', '2023-08-19', '41.99'), 
  
-- Cart 19
  (133, 19, 3, 'Complete', '2023-09-24', '11.99'), 
  (135, 19, 2, 'Complete', '2023-09-24', '10.99'), 

-- Cart 20
  (127, 20, 4, 'Complete', '2023-10-31', '28.99'), 
  (151, 20, 3, 'Complete', '2023-10-31', '39.99'), 

-- Cart 21
  (11, 21, 2, 'Pending', NULL, NULL), -- Mobile Phones (variant_id 11) - 2 items (sold)
  (21, 21, 1, 'Pending', NULL, NULL), -- Laptops (variant_id 21) - 1 item (sold)

-- Cart 22 (Partial Cart)
  (31, 22, 2, 'Pending', NULL, NULL), -- Headphones (variant_id 31) - 2 items
  (41, 22, 1, 'Pending', NULL, NULL), -- Cameras (variant_id 41) - 1 item (sold)

-- Cart 23 (Empty Cart)
-- No items in the cart

-- Cart 24
  (51, 24, 1, 'Pending', NULL, NULL), -- Watches (variant_id 51) - 1 item

-- Cart 25
  (60, 25, 2, 'Pending', NULL, NULL), -- Home Appliances (variant_id 60) - 2 items
  (70, 25, 5, 'Pending', NULL, NULL), -- Gaming Consoles (variant_id 70) - 1 item (sold)

-- Cart 26 (Partial Cart)
  (90, 26, 2, 'Pending', NULL, NULL), -- Smart Home Security (variant_id 90) - 2 items

-- Cart 27
  (10, 27, 3, 'Pending', NULL, NULL), -- Mobile Phones (variant_id 10) - 3 items (sold)
  (20, 27, 2, 'Pending', NULL, NULL), -- Laptops (variant_id 20) - 2 items

-- Cart 28
  (30, 28, 4, 'Pending', NULL, NULL), -- Headphones (variant_id 30) - 4 items (sold)
  (40, 28, 2, 'Pending', NULL, NULL), -- Cameras (variant_id 40) - 2 items (sold)

-- Cart 29 (Empty Cart)
-- No items in the cart

-- Cart 30
  (50, 30, 3, 'Pending', NULL, NULL), -- Watches (variant_id 50) - 3 items
  (70, 30, 2, 'Pending', NULL, NULL), -- Gaming Consoles (variant_id 70) - 2 items

-- Cart 31
  (90, 31, 3, 'Pending', NULL, NULL), -- Smart Home Security (variant_id 90) - 3 items
  (51, 31, 2, 'Pending', NULL, NULL), -- Mobile Phones (variant_id 51) - 2 items (sold)

-- Cart 32
  (61, 32, 1, 'Pending', NULL, NULL), -- Home Appliances (variant_id 61) - 1 item
  (71, 32, 3, 'Pending', NULL, NULL), -- Gaming Consoles (variant_id 71) - 3 items

-- Cart 33
  (31, 33, 4, 'Pending', NULL, NULL), -- Headphones (variant_id 31) - 4 items (sold)
  (91, 33, 2, 'Pending', NULL, NULL), -- Printers (variant_id 91) - 2 items (sold)

-- Cart 34 (Partial Cart)
  (102, 34, 1, 'Pending', NULL, NULL), -- Tablets (variant_id 102) - 1 item
  (70, 34, 3, 'Pending', NULL, NULL), -- Gaming Consoles (variant_id 70) - 3 items (sold)

-- Cart 35 (Empty Cart)
-- No items in the cart

-- Cart 36
  (40, 36, 4, 'Pending', NULL, NULL), -- Cameras (variant_id 40) - 4 items (sold)
  (51, 36, 2, 'Pending', NULL, NULL), -- Watches (variant_id 51) - 2 items

-- Cart 37
  (61, 37, 1, 'Pending', NULL, NULL), -- Home Appliances (variant_id 61) - 1 item (sold)
  (70, 37, 3, 'Pending', NULL, NULL), -- Gaming Consoles (variant_id 70) - 3 items (sold)

-- Cart 38
  (91, 38, 4, 'Pending', NULL, NULL), -- Printers (variant_id 91) - 4 items
  (101, 38, 2, 'Pending', NULL, NULL), -- Tablets (variant_id 101) - 2 items

-- Cart 39 (Partial Cart)
  (40, 39, 1, 'Pending', NULL, NULL), -- Cameras (variant_id 40) - 1 item (sold)
  (50, 39, 3, 'Pending', NULL, NULL), -- Watches (variant_id 50) - 3 items

-- Cart 40 (Empty Cart)
-- No items in the cart

-- Cart 41
  (91, 41, 4, 'Pending', NULL, NULL), 
  (101, 41, 2, 'Pending', NULL, NULL); 

-- Dummy data for the Order table with updated dates
INSERT INTO Ecom_platform.Order (cart_id, user_id, payment_type, est_delivery_days, order_date, status)
VALUES
  (1, 1, 'Credit Card', '5', '2022-01-12', 'Delivered'),
  (2, 6, 'PayPal', '5', '2022-05-11', 'Delivered'),
  (3, 10, 'Cash on Delivery', '5', '2023-03-10', 'Delivered'),
  (4, 13, 'Credit Card', '5', '2023-04-09', 'Delivered'),
  (5, 19, 'PayPal', '5', '2023-05-08', 'Delivered'),
  (6, 22, 'Cash on Delivery', '5', '2023-06-07', 'Delivered'),
  (7, 28, 'Credit Card', '7', '2023-07-06', 'Delivered'),
  (8, 31, 'PayPal', '7', '2023-08-05', 'Delivered'),
  (9, 37, 'Cash on Delivery', '7', '2023-09-04', 'Delivered'),
  (10, 41, 'Credit Card', '7', '2023-10-03', 'Delivered'),

  (11, 2, 'Credit Card', '5', '2023-01-14', 'Processing'),
  (12, 7, 'PayPal', '5', '2023-02-13', 'Delivered'),
  (13, 11, 'Cash on Delivery', '5', '2023-03-22', 'Delivered'),
  (14, 14, 'Credit Card', '5', '2023-04-25', 'Delivered'),
  (15, 20, 'PayPal', '5', '2023-05-30', 'Delivered'),
  (16, 23, 'Cash on Delivery', '5', '2023-06-29', 'Delivered'),
  (17, 29, 'Credit Card', '7', '2023-07-18', 'Delivered'),
  (18, 32, 'PayPal', '7', '2023-08-19', 'Delivered'),
  (19, 38, 'Cash on Delivery', '7', '2023-09-24', 'Delivered'),
  (20, 40, 'Credit Card', '7', '2023-10-31', 'Processing');

-- Insert data for Product_Custom_Property table
-- Insert custom properties for Mobile Phones
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (1, 'Screen Size', '6.1 inches'),
  (1, 'Operating System', 'iOS 15'),
  (2, 'Screen Size', '6.2 inches'),
  (2, 'Operating System', 'Android 11'),
  (3, 'Screen Size', '6.0 inches'),
  (3, 'Operating System', 'Android 11'),
  (4, 'Screen Size', '6.55 inches'),
  (4, 'Operating System', 'OxygenOS 11'),
  (5, 'Screen Size', '6.81 inches'),
  (5, 'Operating System', 'MIUI 12');

-- Insert custom properties for TVs
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (6, 'Smart Features', 'Built-in Voice Asst.'),
  (6, 'HDR Support', 'Dolby Vision'),
  (7, 'Smart Features', 'WebOS Smart TV'),
  (7, 'HDR Support', 'OLED HDR'),
  (8, 'Smart Features', 'Android TV'),
  (8, 'HDR Support', '4K HDR'),
  (9, 'Smart Features', 'Android TV'),
  (9, 'HDR Support', '4K HDR'),
  (10, 'Smart Features', 'Roku TV'),
  (10, 'HDR Support', '1080p HDR');

-- Insert custom properties for Laptops
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (11, 'Processor', 'Intel Core i7'),
  (11, 'Display Size', '13.3 inches'),
  (12, 'Processor', 'Apple M1 Chip'),
  (12, 'Display Size', '13.3 inches'),
  (13, 'Processor', 'Intel Core i7'),
  (13, 'Display Size', '13.3 inches'),
  (14, 'Processor', 'Intel Core i7'),
  (14, 'Display Size', '14 inches'),
  (15, 'Processor', 'AMD Ryzen 9'),
  (15, 'Display Size', '14 inches');

-- Insert custom properties for Headphones
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (16, 'Wireless Tech.', 'Bluetooth 5.0'),
  (16, 'Battery Life', 'Up to 30 hours'),
  (17, 'Wireless Tech.', 'Bluetooth 4.2'),
  (17, 'Battery Life', 'Up to 20 hours'),
  (18, 'Wireless Tech.', 'Bluetooth 5.0'),
  (18, 'Battery Life', 'Up to 20 hours'),
  (19, 'Wireless Tech.', 'Bluetooth 5.0'),
  (19, 'Battery Life', 'Up to 22 hours'),
  (20, 'Wireless Tech.', 'Bluetooth 4.2'),
  (20, 'Battery Life', 'Up to 6 hours');

-- Insert custom properties for Cameras
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (21, 'Resolution', '30.4 Megapixels'),
  (21, 'Lens Type', 'EF 24-105mm f/4L'),
  (22, 'Resolution', '24.3 Megapixels'),
  (22, 'Lens Type', 'AF-S NIKKOR 24-120mm'),
  (23, 'Resolution', '24.2 Megapixels'),
  (23, 'Lens Type', 'FE 28-70mm f/3.5-5.6'),
  (24, 'Resolution', '20.3 Megapixels'),
  (24, 'Lens Type', 'Lumix G Vario 12-60mm'),
  (25, 'Resolution', '26.1 Megapixels'),
  (25, 'Lens Type', 'XF 18-55mm f/2.8-4 R');

-- Insert custom properties for Watches
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (26, 'Battery Life', 'Up to 18 hours'),
  (26, 'Health Features', 'ECG and Blood O2'),
  (27, 'Battery Life', 'Up to 2 days'),
  (27, 'Health Features', 'Heart Rate and Sleep'),
  (28, 'Battery Life', 'Up to 14 days'),
  (28, 'Health Features', 'GPS and Pulse Oxi'),
  (29, 'Battery Life', 'Up to 24 hours'),
  (29, 'Health Features', 'Heart Rate and GPS'),
  (30, 'Battery Life', 'Up to 6 days'),
  (30, 'Health Features', 'Heart Rate and Activity');

-- Insert custom properties for Home Appliances
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (31, 'Energy Efficiency', 'ENERGY STAR Cert.'),
  (31, 'Capacity', '25.5 cubic feet'),
  (32, 'Energy Efficiency', 'ENERGY STAR Cert.'),
  (32, 'Capacity', '4.5 cubic feet'),
  (33, 'Energy Efficiency', 'ENERGY STAR Cert.'),
  (33, 'Capacity', '1.6 cubic feet'),
  (34, 'Energy Efficiency', 'Not Applicable'),
  (34, 'Capacity', '12 cups'),
  (35, 'Energy Efficiency', 'ENERGY STAR Cert.'),
  (35, 'Capacity', '1.3 liters');

-- Insert custom properties for Gaming Consoles
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (36, 'CPU', 'Custom AMD Zen 2 Octa'),
  (36, 'GPU', 'Custom RDNA 2'),
  (37, 'CPU', 'Custom AMD Zen 2 Octa'),
  (37, 'GPU', 'Custom RDNA 2'),
  (38, 'CPU', 'Custom NVIDIA Tegra X1'),
  (38, 'GPU', 'Custom NVIDIA Tegra X1'),
  (39, 'CPU', 'Custom AMD Jaguar Octa'),
  (39, 'GPU', 'AMD Radeon GCN'),
  (40, 'CPU', 'Custom AMD Jaguar Octa'),
  (40, 'GPU', 'AMD Radeon GCN');

-- Insert custom properties for Smart Home Security
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (41, 'Number of Sensors', '8'),
  (41, 'Wireless Connectivity', 'Wi-Fi and Z-Wave'),
  (42, 'Resolution', '2K HDR'),
  (42, 'Wireless Connectivity', 'Wi-Fi and Bluetooth'),
  (43, 'Video Resolution', '1080p HD'),
  (43, 'Wireless Connectivity', 'Wi-Fi and Bluetooth'),
  (44, 'Number of Sensors', '9'),
  (44, 'Wireless Connectivity', 'Wi-Fi and Cellular'),
  (45, 'Resolution', '1080p HD'),
  (45, 'Wireless Connectivity', 'Wi-Fi and Bluetooth');

-- Insert custom properties for Printers
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (46, 'Print Speed', '55 ppm'),
  (46, 'Color Printing', 'Yes'),
  (47, 'Print Speed', '15 ppm'),
  (47, 'Color Printing', 'Yes'),
  (48, 'Print Speed', '20 ppm'),
  (48, 'Color Printing', 'Yes'),
  (49, 'Print Speed', '32 ppm'),
  (49, 'Color Printing', 'Yes'),
  (50, 'Print Speed', '70 ppm'),
  (50, 'Color Printing', 'Yes');

-- Insert custom properties for Tablets
INSERT INTO Ecom_platform.Product_Custom_Property (product_id, custom_attribute_type, custom_attribute_value)
VALUES
  (51, 'Display Size', '11 in.'),
  (51, 'Processor', 'Apple A12Z Bionic'),
  (52, 'Display Size', '11 in.'),
  (52, 'Processor', 'Snapdragon 865+'),
  (53, 'Display Size', '12.3 in.'),
  (53, 'Processor', 'Intel Core i7'),
  (54, 'Display Size', '10.1 in.'),
  (54, 'Processor', 'MediaTek Helio P60T'),
  (55, 'Display Size', '10.3 in.'),
  (55, 'Processor', 'MediaTek Helio P22T');

  
delimiter //
CREATE DEFINER = root@localhost 
TRIGGER create_cart_after_user_registration_trigger
	AFTER INSERT ON `User`
    FOR EACH ROW
BEGIN
	INSERT INTO Cart(user_id, status) VALUES (NEW.user_id, 'Pending');
END;
//
DELIMITER ;
