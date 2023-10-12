-- Insert data for Variants
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  -- Variants for Mobile Phones
  (1, 1, '128GB', 'Silver'),
  (2, 1, '128GB', 'Gold'),
  (3, 2, '256GB', 'Black'),
  (4, 2, '256GB', 'White'),
  (5, 3, '128GB', 'Black'),
  (6, 3, '64GB', 'White'),
  (7, 4, '256GB', 'Black'),
  (8, 4, '128GB', 'Blue'),
  (9, 5, '256GB', 'Black'),
  (10, 5, '128GB', 'Blue'),

  -- Variants for TVs
  (11, 6, '55"', '4K'),
  (12, 6, '65"', '4K'),
  (13, 7, '65"', 'OLED'),
  (14, 7, '55"', 'OLED'),
  (15, 8, '60"', '4K'),
  (16, 8, '50"', '4K'),
  (17, 9, '50"', 'LED'),
  (18, 9, '43"', 'LED'),
  (19, 10, '43"', '1080p'),
  (20, 10, '55"', '1080p'),

  -- Variants for Laptops
  (21, 11, '256GB', '8GB'),
  (22, 11, '512GB', '16GB'),
  (23, 12, '256GB', '8GB'),
  (24, 12, '512GB', '16GB'),
  (25, 13, '512GB', '8GB'),
  (26, 13, '256GB', '16GB'),
  (27, 14, '512GB', '8GB'),
  (28, 14, '256GB', '16GB'),
  (29, 15, '1TB', '32GB'),
  (30, 15, '512GB', '16GB'),

  -- Variants for Headphones
  (31, 16, 'Black', 'Active Noise Cancelling'),
  (32, 16, 'Silver', 'Active Noise Cancelling'),
  (33, 17, 'Black', 'Active Noise Cancelling'),
  (34, 17, 'Silver', 'Active Noise Cancelling'),
  (35, 18, 'Black', 'Open-back'),
  (36, 18, 'Silver', 'Open-back'),
  (37, 19, 'Black', 'Active Noise Cancelling'),
  (38, 19, 'Silver', 'Active Noise Cancelling'),
  (39, 20, 'Black', 'Wireless'),
  (40, 20, 'White', 'Wireless'),

  -- Variants for Cameras
  (41, 21, '30MP', 'Zoom Lens'),
  (42, 21, '24MP', 'Prime Lens'),
  (43, 22, '24MP', 'Zoom Lens'),
  (44, 22, '30MP', 'Prime Lens'),
  (45, 23, '30MP', 'Zoom Lens'),
  (46, 23, '24MP', 'Prime Lens'),
  (47, 24, '24MP', 'Zoom Lens'),
  (48, 24, '30MP', 'Prime Lens'),
  (49, 25, '24MP', 'Zoom Lens'),
  (50, 25, '30MP', 'Prime Lens'),

  -- Variants for Watches
  (51, 26, '42mm', 'Space Gray'),
  (52, 26, '38mm', 'Silver'),
  (53, 27, '45mm', 'Black'),
  (54, 27, '41mm', 'Rose Gold'),
  (55, 28, '44mm', 'Black'),
  (56, 28, '40mm', 'Silver'),
  (57, 29, '41mm', 'Gold'),
  (58, 29, '46mm', 'Silver'),
  (59, 30, '40mm', 'Blue'),
  (60, 30, '45mm', 'Black');
  
  -- Variants for Home Appliances
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  (61, 31, '600L', 'Stainless Steel'),
  (62, 31, '450L', 'Black'),
  (63, 32, '8kg', 'White'),
  (64, 32, '7kg', 'Silver'),
  (65, 33, '1000W', 'Stainless Steel'),
  (66, 33, '800W', 'Black'),
  (67, 34, '10 Cups', 'Stainless Steel'),
  (68, 34, '8 Cups', 'Glass'),
  (69, 35, 'Corded', 'Purple'),
  (70, 35, 'Cordless', 'Red');

-- Variants for Gaming Consoles
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  (71, 36, '1TB', 'White'),
  (72, 36, '512GB', 'Black'),
  (73, 37, '1TB', 'Black'),
  (74, 37, '512GB', 'White'),
  (75, 38, '32GB', 'Neon Blue/Red'),
  (76, 38, '64GB', 'Turquoise'),
  (77, 39, '1TB', 'Jet Black'),
  (78, 39, '512GB', 'Robot White'),
  (79, 40, '1TB', 'Cyberpunk 2077 Edition'),
  (80, 40, '512GB', 'Robot White');

-- Variants for Smart Home Security
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  (81, 41, 'Base Station, Contact Sensor, Keypad, Motion Detector', 'White'),
  (82, 41, 'Base Station, Contact Sensor', 'White'),
  (83, 42, '2 Cameras', 'White'),
  (84, 42, '1 Camera', 'White'),
  (85, 43, 'Battery-Powered', 'White'),
  (86, 43, 'Hardwired', 'Black'),
  (87, 44, 'Wired', 'White'),
  (88, 44, 'Wireless', 'Black'),
  (89, 45, 'Indoor', 'White'),
  (90, 45, 'Indoor', 'Black');

-- Variants for Printers
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  (91, 46, '30 ppm', 'White'),
  (92, 46, '25 ppm', 'Black'),
  (93, 47, '15 ppm', 'White'),
  (94, 47, '20 ppm', 'Black'),
  (95, 48, '20 ppm', 'White'),
  (96, 48, '15 ppm', 'Black'),
  (97, 49, '25 ppm', 'White'),
  (98, 49, '30 ppm', 'Black'),
  (99, 50, '18 ppm', 'White'),
  (100, 50, '22 ppm', 'Black');

-- Variants for Tablets
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2)
VALUES
  (101, 51, '128GB', 'Space Gray'),
  (102, 51, '256GB', 'Silver'),
  (103, 52, '64GB', 'Mystic Black'),
  (104, 52, '128GB', 'Mystic Silver'),
  (105, 53, '128GB', 'Platinum'),
  (106, 53, '256GB', 'Cobalt Blue'),
  (107, 54, '32GB', 'Black'),
  (108, 54, '64GB', 'White'),
  (109, 55, '32GB', 'Black'),
  (110, 55, '64GB', 'Aurora Black');
