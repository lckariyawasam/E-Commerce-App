-- drop database ecom_platform

-- Create the Ecom_platform schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS Ecom_platform DEFAULT CHARACTER SET utf8;
USE Ecom_platform;

-- Create the Product table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product (
  product_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(31) NOT NULL,
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
  delivery_estimation VARCHAR(31) NOT NULL,
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


DELIMITER //
CREATE PROCEDURE update_cart_on_order(IN user_id_param INT)
BEGIN
	DECLARE cartID INT;
	DECLARE vID, q INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT variant_id, quantity FROM cart_item WHERE cart_id = cartID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SELECT cart_id INTO cartID FROM cart WHERE user_id = user_id_param AND status = 'Pending';
    
    OPEN cur;
    read_loop:LOOP
		FETCH cur INTO vID, q;
        IF done THEN
			LEAVE read_loop;
		END IF;
        CALL update_inventory_quantity_for(vID, q);
        UPDATE Cart_item SET status = 'Complete' WHERE variant_id = vID;
        UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
        UPDATE Cart_item SET sold_price_per_item = (SELECT price FROM Variant WHERE variant_id = vID) WHERE variant_id = vID;
        
        
	END LOOP;
    CLOSE cur;
    UPDATE Cart SET status = 'Complete' WHERE cart_id = cartID;
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
CREATE PROCEDURE checkout_user(IN user_id_param INT)
BEGIN
	CALL update_cart_on_order(user_id_param);
    CALL create_new_cart_for(user_id_param);
END
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
    GROUP BY ci.variant_id
    ORDER BY total_sales DESC
    LIMIT 10; 
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE quarterly_sales_reports_for_year(year_param INT)
BEGIN
SELECT DISTINCT
	CONCAT('Q', CAST(QUARTER(sold_date) AS CHAR)) AS Quarter,
	SUM(sold_price_per_item * quantity) OVER (PARTITION BY QUARTER(sold_date)) AS 'Total Sales'
FROM Cart_item
WHERE YEAR(sold_date) = year_param;
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

