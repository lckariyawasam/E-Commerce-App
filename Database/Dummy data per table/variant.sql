-- Insert data for Variants
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (1, 1, '128GB', 'Silver', '699.99', 'IP12-001-128GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (2, 1, '128GB', 'Gold', '699.99', 'IP12-001-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (3, 2, '256GB', 'Black', '749.99', 'S21-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (4, 2, '256GB', 'White', '749.99', 'S21-001-256GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (5, 3, '128GB', 'Black', '599.99', 'Pixel5-001-128GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (6, 3, '64GB', 'White', '549.99', 'Pixel5-001-64GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (7, 4, '256GB', 'Black', '699.99', 'OP9-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (8, 4, '128GB', 'Blue', '649.99', 'OP9-001-128GB-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (9, 5, '256GB', 'Black', '699.99', 'Mi11-001-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (10, 5, '128GB', 'Blue', '649.99', 'Mi11-001-128GB-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  
  -- Variants for TVs
  (11, 6, '55"', '4K', '799.99', 'TV55-001-55-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (12, 6, '65"', '4K', '999.99', 'TV65-001-65-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (13, 7, '65"', 'OLED', '1299.99', 'OLED65-001-65-OLED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (14, 7, '55"', 'OLED', '1099.99', 'OLED55-001-55-OLED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (15, 8, '60"', '4K', '849.99', 'TV60-001-60-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (16, 8, '50"', '4K', '699.99', 'TV50-001-50-4K', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (17, 9, '50"', 'LED', '449.99', 'TV50-001-50-LED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (18, 9, '43"', 'LED', '399.99', 'TV43-001-43-LED', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (19, 10, '43"', '1080p', '349.99', 'TV43-001-43-1080p', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (20, 10, '55"', '1080p', '449.99', 'TV55-001-55-1080p', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  
  -- Variants for Laptops
  (21, 11, '256GB', '8GB', '799.99', 'LAP256-001-8GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (22, 11, '512GB', '16GB', '999.99', 'LAP512-001-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (23, 12, '256GB', '8GB', '749.99', 'LAP256-002-8GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (24, 12, '512GB', '16GB', '949.99', 'LAP512-002-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (25, 13, '512GB', '8GB', '849.99', 'LAP512-003-8GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (26, 13, '256GB', '16GB', '899.99', 'LAP256-003-16GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (27, 14, '512GB', '8GB', '899.99', 'LAP512-004-8GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (28, 14, '256GB', '16GB', '849.99', 'LAP256-004-16GB-256GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (29, 15, '1TB', '32GB', '1299.99', 'LAP1TB-005-32GB-1TB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (30, 15, '512GB', '16GB', '1199.99', 'LAP512-005-16GB-512GB', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  
  -- Variants for Headphones
  (31, 16, 'Black', 'Active Noise Cancelling', '199.99', 'HP-001-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (32, 16, 'Silver', 'Active Noise Cancelling', '199.99', 'HP-001-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (33, 17, 'Black', 'Active Noise Cancelling', '189.99', 'HP-002-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (34, 17, 'Silver', 'Active Noise Cancelling', '189.99', 'HP-002-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (35, 18, 'Black', 'Open-back', '179.99', 'HP-003-Open-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (36, 18, 'Silver', 'Open-back', '179.99', 'HP-003-Open-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (37, 19, 'Black', 'Active Noise Cancelling', '199.99', 'HP-004-ANC-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (38, 19, 'Silver', 'Active Noise Cancelling', '199.99', 'HP-004-ANC-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (39, 20, 'Black', 'Wireless', '149.99', 'HP-005-Wireless-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (40, 20, 'White', 'Wireless', '149.99', 'HP-005-Wireless-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  
  -- Variants for Cameras
  (41, 21, '30MP', 'Zoom Lens', '799.99', 'CAM-001-30MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (42, 21, '24MP', 'Prime Lens', '699.99', 'CAM-001-24MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (43, 22, '24MP', 'Zoom Lens', '749.99', 'CAM-002-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (44, 22, '30MP', 'Prime Lens', '799.99', 'CAM-002-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (45, 23, '30MP', 'Zoom Lens', '799.99', 'CAM-003-30MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (46, 23, '24MP', 'Prime Lens', '699.99', 'CAM-003-24MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (47, 24, '24MP', 'Zoom Lens', '749.99', 'CAM-004-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (48, 24, '30MP', 'Prime Lens', '799.99', 'CAM-004-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (49, 25, '24MP', 'Zoom Lens', '699.99', 'CAM-005-24MP-Zoom', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (50, 25, '30MP', 'Prime Lens', '749.99', 'CAM-005-30MP-Prime', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  
  -- Variants for Watches
  (51, 26, '42mm', 'Space Gray', '249.99', 'WATCH-001-42mm-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (52, 26, '38mm', 'Silver', '219.99', 'WATCH-001-38mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (53, 27, '45mm', 'Black', '269.99', 'WATCH-002-45mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (54, 27, '41mm', 'Rose Gold', '239.99', 'WATCH-002-41mm-RoseGold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (55, 28, '44mm', 'Black', '259.99', 'WATCH-003-44mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (56, 28, '40mm', 'Silver', '229.99', 'WATCH-003-40mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (57, 29, '41mm', 'Gold', '239.99', 'WATCH-004-41mm-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (58, 29, '46mm', 'Silver', '269.99', 'WATCH-004-46mm-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (59, 30, '40mm', 'Blue', '229.99', 'WATCH-005-40mm-Blue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (60, 30, '45mm', 'Black', '259.99', 'WATCH-005-45mm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
  
-- Variants for Home Appliances with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (61, 31, '600L', 'Stainless Steel', '999.99', 'APPLIANCE-001-600L-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (62, 31, '450L', 'Black', '799.99', 'APPLIANCE-001-450L-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (63, 32, '8kg', 'White', '349.99', 'APPLIANCE-002-8kg-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (64, 32, '7kg', 'Silver', '299.99', 'APPLIANCE-002-7kg-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (65, 33, '1000W', 'Stainless Steel', '149.99', 'APPLIANCE-003-1000W-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (66, 33, '800W', 'Black', '129.99', 'APPLIANCE-003-800W-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (67, 34, '10 Cups', 'Stainless Steel', '89.99', 'APPLIANCE-004-10Cups-StainlessSteel', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (68, 34, '8 Cups', 'Glass', '79.99', 'APPLIANCE-004-8Cups-Glass', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (69, 35, 'Corded', 'Purple', '119.99', 'APPLIANCE-005-Corded-Purple', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (70, 35, 'Cordless', 'Red', '129.99', 'APPLIANCE-005-Cordless-Red', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
  
-- Variants for Gaming Consoles with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (71, 36, '1TB', 'White', '499.99', 'CONSOLE-001-1TB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (72, 36, '512GB', 'Black', '549.99', 'CONSOLE-001-512GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (73, 37, '1TB', 'Black', '499.99', 'CONSOLE-002-1TB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (74, 37, '512GB', 'White', '549.99', 'CONSOLE-002-512GB-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (75, 38, '32GB', 'Neon Blue/Red', '299.99', 'CONSOLE-003-32GB-NeonBlueRed', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (76, 38, '64GB', 'Turquoise', '349.99', 'CONSOLE-003-64GB-Turquoise', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (77, 39, '1TB', 'Jet Black', '499.99', 'CONSOLE-004-1TB-JetBlack', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (78, 39, '512GB', 'Robot White', '549.99', 'CONSOLE-004-512GB-RobotWhite', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (79, 40, '1TB', 'Cyberpunk 2077 Edition', '599.99', 'CONSOLE-005-1TB-Cyberpunk2077', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (80, 40, '512GB', 'Robot White', '549.99', 'CONSOLE-005-512GB-RobotWhite', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
  
-- Variants for Smart Home Security with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (81, 41, 'Base Station, Contact Sensor, Keypad, Motion Detector', 'White', '399.99', 'SECURITY-001-BaseStation-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (82, 41, 'Base Station, Contact Sensor', 'White', '349.99', 'SECURITY-001-BaseStation-ContactSensor-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (83, 42, '2 Cameras', 'White', '499.99', 'SECURITY-002-2Cameras-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (84, 42, '1 Camera', 'White', '299.99', 'SECURITY-002-1Camera-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (85, 43, 'Battery-Powered', 'White', '199.99', 'SECURITY-003-BatteryPowered-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (86, 43, 'Hardwired', 'Black', '249.99', 'SECURITY-003-Hardwired-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (87, 44, 'Wired', 'White', '279.99', 'SECURITY-004-Wired-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (88, 44, 'Wireless', 'Black', '299.99', 'SECURITY-004-Wireless-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (89, 45, 'Indoor', 'White', '149.99', 'SECURITY-005-Indoor-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (90, 45, 'Indoor', 'Black', '149.99', 'SECURITY-005-Indoor-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
  
-- Variants for Printers with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (91, 46, '30 ppm', 'White', '299.99', 'PRINTER-001-30ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (92, 46, '25 ppm', 'Black', '279.99', 'PRINTER-001-25ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (93, 47, '15 ppm', 'White', '199.99', 'PRINTER-002-15ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (94, 47, '20 ppm', 'Black', '219.99', 'PRINTER-002-20ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (95, 48, '20 ppm', 'White', '229.99', 'PRINTER-003-20ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (96, 48, '15 ppm', 'Black', '209.99', 'PRINTER-003-15ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (97, 49, '25 ppm', 'White', '259.99', 'PRINTER-004-25ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (98, 49, '30 ppm', 'Black', '279.99', 'PRINTER-004-30ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (99, 50, '18 ppm', 'White', '229.99', 'PRINTER-005-18ppm-White', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (100, 50, '22 ppm', 'Black', '249.99', 'PRINTER-005-22ppm-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
  
-- Variants for Tablets with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (101, 51, '128GB', 'Space Gray', '449.99', 'TAB-001-128GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (102, 51, '256GB', 'Silver', '549.99', 'TAB-001-256GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (103, 52, '64GB', 'Black', '399.99', 'TAB-002-64GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (104, 52, '128GB', 'Gold', '449.99', 'TAB-002-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (105, 53, '256GB', 'Space Gray', '549.99', 'TAB-003-256GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (106, 53, '64GB', 'Silver', '399.99', 'TAB-003-64GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (107, 54, '128GB', 'Gold', '449.99', 'TAB-004-128GB-Gold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (108, 54, '256GB', 'Black', '549.99', 'TAB-004-256GB-Black', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (109, 55, '64GB', 'Silver', '399.99', 'TAB-005-64GB-Silver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed '),
  (110, 55, '128GB', 'Space Gray', '449.99', 'TAB-005-128GB-SpaceGray', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/eubj2pxfxjdxapyl_setting_xxx_0_90_end_2000.png?alt=media&token=70fc21f0-7afb-4399-b2f2-67ff1a39beed ');
