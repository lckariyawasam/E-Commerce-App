

-- Insert data for Mobile Phones
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('iPhone 12', '150g', 'Apple', 'IP12-001', 'Storage', 'Color'),
  ('Samsung Galaxy S21', '170g', 'Samsung', 'S21-001', 'Storage', 'Color'),
  ('Google Pixel 5', '151g', 'Google', 'Pixel5-001', 'Storage', 'Color'),
  ('OnePlus 9', '170g', 'OnePlus', 'OP9-001', 'Storage', 'Color'),
  ('Xiaomi Mi 11', '196g', 'Xiaomi', 'Mi11-001', 'Storage', 'Color');

-- Insert data for TVs
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Samsung 55" 4K Smart TV', '20kg', 'Samsung', 'TV55-001', 'Screen Size', 'Resolution'),
  ('LG 65" OLED TV', '25kg', 'LG', 'OLED65-001', 'Screen Size', 'Resolution'),
  ('Sony 60" 4K Smart TV', '22kg', 'Sony', 'TV60-001', 'Screen Size', 'Resolution'),
  ('TCL 50" LED TV', '18kg', 'TCL', 'TCL50-001', 'Screen Size', 'Resolution'),
  ('Hisense 43" 1080p TV', '15kg', 'Hisense', 'H43-001', 'Screen Size', 'Resolution');

-- Insert data for Laptops
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Dell XPS 13', '1.2kg', 'Dell', 'XPS13-001', 'Storage Size', 'RAM Size'),
  ('MacBook Air', '1.3kg', 'Apple', 'MBA-001', 'Storage Size', 'RAM Size'),
  ('HP Spectre x360', '1.4kg', 'HP', 'Spectre-001', 'Storage Size', 'RAM Size'),
  ('Lenovo ThinkPad X1 Carbon', '1.35kg', 'Lenovo', 'X1C-001', 'Storage Size', 'RAM Size'),
  ('Asus ROG Zephyrus G14', '1.7kg', 'Asus', 'Zephyrus-001', 'Storage Size', 'RAM Size');

-- Insert data for Headphones
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Sony WH-1000XM4', '250g', 'Sony', 'WH-1000XM4-001', 'Color', 'Noise Cancelling'),
  ('Bose QuietComfort 35 II', '235g', 'Bose', 'QC35II-001', 'Color', 'Noise Cancelling'),
  ('Sennheiser HD 660 S', '260g', 'Sennheiser', 'HD660S-001', 'Color', 'Noise Cancelling'),
  ('Beats Solo Pro', '220g', 'Beats', 'SoloPro-001', 'Color', 'Noise Cancelling'),
  ('JBL Free X', '95g', 'JBL', 'FreeX-001', 'Color', 'Wireless');

-- Insert data for Cameras
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Canon EOS 5D Mark IV', '800g', 'Canon', '5DMarkIV-001', 'Megapixels', 'Lens Type'),
  ('Nikon D750', '750g', 'Nikon', 'D750-001', 'Megapixels', 'Lens Type'),
  ('Sony Alpha A7 III', '650g', 'Sony', 'AlphaA7-001', 'Megapixels', 'Lens Type'),
  ('Panasonic Lumix GH5', '725g', 'Panasonic', 'LumixGH5-001', 'Megapixels', 'Lens Type'),
  ('Fujifilm X-T4', '580g', 'Fujifilm', 'XT4-001', 'Megapixels', 'Lens Type');

-- Insert data for Watches
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Apple Watch Series 6', '45g', 'Apple', 'AW-S6-001', 'Size', 'Color'),
  ('Samsung Galaxy Watch 3', '52g', 'Samsung', 'GW3-001', 'Size', 'Color'),
  ('Garmin Forerunner 945', '50g', 'Garmin', 'Forerunner945-001', 'Size', 'Color'),
  ('Fossil Gen 5', '55g', 'Fossil', 'Gen5-001', 'Size', 'Color'),
  ('Fitbit Versa 3', '40g', 'Fitbit', 'Versa3-001', 'Size', 'Color');

-- Insert data for Home Appliances
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Samsung Refrigerator', '85kg', 'Samsung', 'RF-001', 'Capacity', 'Color'),
  ('LG Washing Machine', '65kg', 'LG', 'WM-001', 'Capacity', 'Color'),
  ('Whirlpool Microwave Oven', '30kg', 'Whirlpool', 'MO-001', 'Capacity', 'Color'),
  ('Breville Coffee Maker', '5kg', 'Breville', 'CM-001', 'Capacity', 'Color'),
  ('Dyson Vacuum Cleaner', '7kg', 'Dyson', 'VC-001', 'Capacity', 'Color');

-- Insert data for Gaming Consoles
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('PlayStation 5', '4.5kg', 'Sony', 'PS5-001', 'Storage', 'Color'),
  ('Xbox Series X', '4.4kg', 'Microsoft', 'XSX-001', 'Storage', 'Color'),
  ('Nintendo Switch', '0.88kg', 'Nintendo', 'Switch-001', 'Storage', 'Color'),
  ('Sony PlayStation 4', '2.8kg', 'Sony', 'PS4-001', 'Storage', 'Color'),
  ('Xbox One X', '4.43kg', 'Microsoft', 'XO-X-001', 'Storage', 'Color');
  
-- Insert data for Smart Home Security
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Ring Alarm Security Kit', '1.1kg', 'Ring', 'AlarmKit-001', 'Components', 'Color'),
  ('Arlo Pro 4 Security Camera', '400g', 'Arlo', 'Pro4-001', 'Resolution', 'Color'),
  ('Nest Hello Video Doorbell', '180g', 'Nest', 'Hello-001', 'Compatibility', 'Color'),
  ('SimpliSafe Home Security System', '2.2kg', 'SimpliSafe', 'SecuritySystem-001', 'Components', 'Color'),
  ('Blink Mini Indoor Camera', '65g', 'Blink', 'Mini-001', 'Resolution', 'Color');
  
  -- Insert data for Printers
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('HP LaserJet Pro', '11kg', 'HP', 'LaserJetPro-001', 'Print Speed', 'Color'),
  ('Epson EcoTank', '6.8kg', 'Epson', 'EcoTank-001', 'Print Speed', 'Color'),
  ('Canon PIXMA', '5.5kg', 'Canon', 'PIXMA-001', 'Print Speed', 'Color'),
  ('Brother HL-L2350DW', '7kg', 'Brother', 'HL-L2350DW-001', 'Print Speed', 'Color'),
  ('Xerox WorkCentre', '15kg', 'Xerox', 'WorkCentre-001', 'Print Speed', 'Color');
  
  -- Insert data for Tablets
INSERT INTO Ecom_platform.Product (title, weight, brand, SKU, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Apple iPad Pro', '470g', 'Apple', 'iPadPro-001', 'Storage', 'Color'),
  ('Samsung Galaxy Tab S7', '500g', 'Samsung', 'TabS7-001', 'Storage', 'Color'),
  ('Microsoft Surface Pro 7', '770g', 'Microsoft', 'SurfacePro7-001', 'Storage', 'Color'),
  ('Amazon Fire HD 10', '500g', 'Amazon', 'FireHD10-001', 'Storage', 'Color'),
  ('Lenovo Tab M10', '480g', 'Lenovo', 'TabM10-001', 'Storage', 'Color');

