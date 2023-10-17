-- drop database ecom_platform
-- drop database dbms_project

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
CREATE TABLE IF NOT EXISTS Ecom_platform.User (
  user_id INT NOT NULL,
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
  cart_id INT NOT NULL,
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
  variant_id INT NOT NULL,
  Product_id INT NOT NULL,
  variant_attribute_value_1 VARCHAR(128) NULL,
  variant_attribute_value_2 VARCHAR(128) NULL,
  price VARCHAR(64) NOT NULL,
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
  cart_item_id INT NOT NULL,
  variant_id INT NOT NULL,
  cart_id INT NOT NULL,
  quantity VARCHAR(31) NOT NULL,
  status VARCHAR(31) NOT NULL,
  sold_date DATE NULL,
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
  custom_attribute_id INT NOT NULL,
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
  Inventory_id INT NOT NULL,
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
CREATE PROCEDURE update_inventory_quantity(IN variant_id_param INT, IN quantity_param INT)
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
        CALL update_inventory_quantity(vID, q);
        UPDATE Cart_item SET status = 'Complete' WHERE variant_id = vID;
        UPDATE Cart_item SET sold_date = CURDATE() WHERE variant_id = vID;
        
	END LOOP;
    CLOSE cur;
    UPDATE Cart SET status = 'Complete' WHERE cart_id = cartID;
END;
//
DELIMITER ;


