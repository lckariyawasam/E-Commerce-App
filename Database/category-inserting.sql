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
  (13, 1, 'Gaming Consoles');

-- Insert data for Subcategories of Toys
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (14, 2, 'Action Figures'),
  (15, 2, 'Board Games'),
  (16, 2, 'Dolls'),
  (17, 2, 'Remote Control Toys'),
  (18, 2, 'Educational Toys');

-- Insert data for Subcategories of Cosmetics and Body Care
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (19, 3, 'Skincare'),
  (20, 3, 'Makeup'),
  (21, 3, 'Fragrances'),
  (22, 3, 'Hair Care');

-- Insert data for Subcategories of Food and Beverage
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (23, 4, 'Snacks'),
  (24, 4, 'Beverages'),
  (25, 4, 'Canned Goods'),
  (26, 4, 'Condiments and Spices');

-- Insert data for Subcategories of Furniture and Decor
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (27, 5, 'Furniture'),
  (28, 5, 'Home Decor'),
  (29, 5, 'Lighting'),
  (30, 5, 'Bedding and Linens');

-- Insert data for Subcategories of Pet Care and Toys
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (31, 6, 'Pet Food'),
  (32, 6, 'Pet Toys'),
  (33, 6, 'Pet Grooming'),
  (34, 6, 'Pet Accessories');
  
-- Insert remaining data for Subcategories of Electronics
INSERT INTO Ecom_platform.Category (category_id, parent_category_id, name)
VALUES
  (35, 1, 'Home Appliances'),
  (36, 1, 'Smart Home Security'),
  (37, 1, 'Printers'),
  (38, 1, 'Tablets');
