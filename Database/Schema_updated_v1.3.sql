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
  INDEX fk_Category_Category1_idx (parent_category_id ASC) VISIBLE,
  CONSTRAINT fk_Category_Category1
    FOREIGN KEY (parent_category_id)
    REFERENCES Ecom_platform.Category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Create the Product_Sub_Category table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product_Sub_Category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  INDEX fk_Product_Sub_Category_Category_idx (category_id ASC) INVISIBLE,
  INDEX fk_Product_Sub_Category_Product_idx (product_id ASC) VISIBLE,
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

-- Create the Cart table
CREATE TABLE IF NOT EXISTS Ecom_platform.Cart (
  cart_id INT NOT NULL,
  user_id INT NOT NULL,
  status VARCHAR(31) NOT NULL,
  PRIMARY KEY (cart_id),
  INDEX cart (cart_id ASC) VISIBLE,
  INDEX fk_Cart_User_idx (user_id ASC) VISIBLE,
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
  INDEX fk_Variant_Product1_idx (Product_id ASC) VISIBLE,
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
  INDEX fk_Cart_item_Cart_idx (cart_id ASC) VISIBLE,
  INDEX fk_Cart_item_Variant_idx (variant_id ASC) VISIBLE,
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

-- Create the Product_Custom_Property table
CREATE TABLE IF NOT EXISTS Ecom_platform.Product_Custom_Property (
  custom_attribute_id INT NOT NULL,
  product_id INT NOT NULL,
  custom_attribute_type VARCHAR(31) NULL,
  custom_attribute_value VARCHAR(31) NULL,
  PRIMARY KEY (custom_attribute_id),
  INDEX fk_Product_Custom_Property_Product1_idx (product_id ASC) VISIBLE,
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

-- Create the Order table
CREATE TABLE IF NOT EXISTS Ecom_platform.Order (
  order_id INT NOT NULL AUTO_INCREMENT,
  cart_id INT NOT NULL,
  user_id INT NOT NULL,
  payment_type VARCHAR(31) NOT NULL,
  delivery_estimation VARCHAR(31) NOT NULL,
  order_date VARCHAR(31) NOT NULL,
  status VARCHAR(31) NOT NULL,
  PRIMARY KEY (order_id),
  INDEX fk_Order_User_idx (user_id ASC) VISIBLE,
  INDEX fk_Order_Cart_idx (cart_id ASC) VISIBLE,
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
