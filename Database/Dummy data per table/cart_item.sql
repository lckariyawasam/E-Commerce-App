-- Example Cart_item records
-- Cart 1
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (1, 1, 1, 2, 'Pending', NULL), -- Mobile Phones (variant_id 1) - 2 items
  (2, 11, 1, 1, 'Pending', NULL), -- TVs (variant_id 11) - 1 item
  (6, 51, 1, 2, 'Pending', NULL), -- Watches (variant_id 51) - 2 items
  (7, 61, 1, 4, 'Pending', NULL); -- Home Appliances (variant_id 61) - 4 items

-- Cart 2
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (8, 1, 2, 3, 'Pending', NULL), -- Mobile Phones (variant_id 1) - 3 items
  (9, 12, 2, 2, 'Pending', NULL), -- TVs (variant_id 12) - 2 items
  (10, 22, 2, 1, 'Pending', NULL), -- Laptops (variant_id 22) - 1 item
  (11, 32, 2, 4, 'Pending', NULL), -- Headphones (variant_id 32) - 4 items
  (12, 42, 2, 3, 'Pending', NULL); -- Cameras (variant_id 42) - 3 items

-- Cart 3
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (16, 13, 3, 2, 'Complete', '2023-10-12'), -- TVs (variant_id 13) - 2 items (sold)
  (17, 23, 3, 1, 'Complete', '2023-10-12'), -- Laptops (variant_id 23) - 1 item (sold)
  (20, 53, 3, 2, 'Complete', '2023-10-12'), -- Watches (variant_id 53) - 2 items (sold)
  (21, 63, 3, 1, 'Complete', '2023-10-12'); -- Home Appliances (variant_id 63) - 1 item (sold)

-- Cart 4
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (24, 24, 4, 2, 'Pending', NULL), -- Laptops (variant_id 24) - 2 items
  (25, 34, 4, 6, 'Pending', NULL), -- Headphones (variant_id 34) - 6 items
  (26, 44, 4, 5, 'Pending', NULL), -- Cameras (variant_id 44) - 5 items
  (27, 54, 4, 3, 'Pending', NULL), -- Watches (variant_id 54) - 3 items
  (28, 64, 4, 2, 'Pending', NULL); -- Home Appliances (variant_id 64) - 2 items
  
-- Cart 5
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (29, 5, 5, 2, 'Complete', '2023-10-13'), -- Mobile Phones (variant_id 5) - 2 items (sold)
  (30, 15, 5, 1, 'Complete', '2023-10-13'); -- TVs (variant_id 15) - 1 item (sold)

-- Cart 6
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (31, 6, 6, 2, 'Complete', '2023-10-14'), -- Mobile Phones (variant_id 6) - 2 items (sold)
  (32, 16, 6, 1, 'Complete', '2023-10-14'), -- TVs (variant_id 16) - 1 item (sold)
  (33, 26, 6, 2, 'Complete', '2023-10-14'), -- Laptops (variant_id 26) - 2 items (sold)
  (34, 36, 6, 1, 'Complete', '2023-10-14'), -- Headphones (variant_id 36) - 1 item (sold)
  (35, 46, 6, 2, 'Complete', '2023-10-14'); -- Cameras (variant_id 46) - 2 items (sold)

-- Cart 7
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (36, 7, 7, 3, 'Pending', NULL), -- Mobile Phones (variant_id 7) - 3 items
  (37, 17, 7, 2, 'Pending', NULL); -- TVs (variant_id 17) - 2 items

-- Cart 8
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (38, 8, 8, 4, 'Pending', NULL), -- Mobile Phones (variant_id 8) - 4 items
  (39, 18, 8, 3, 'Pending', NULL); -- TVs (variant_id 18) - 3 items

-- Cart 9
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (40, 9, 9, 5, 'Pending', NULL); -- Mobile Phones (variant_id 9) - 5 items

-- Cart 10 (Empty Cart)
-- No items in the cart

-- Cart 11 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (41, 61, 11, 3, 'Pending', NULL), -- Home Appliances (variant_id 61) - 3 items
  (42, 71, 11, 2, 'Pending', NULL); -- Gaming Consoles (variant_id 71) - 2 items

-- Cart 12
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (43, 10, 12, 4, 'Complete', '2023-10-15'); -- Mobile Phones (variant_id 10) - 4 items (sold)

-- Cart 13 (Empty Cart)
-- No items in the cart

-- Cart 14
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (44, 70, 14, 1, 'Pending', NULL); -- Home Appliances (variant_id 70) - 1 item

-- Cart 15
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (45, 75, 15, 3, 'Pending', NULL), -- Gaming Consoles (variant_id 75) - 3 items
  (46, 85, 15, 2, 'Pending', NULL); -- Smart Home Security (variant_id 85) - 2 items

-- Cart 16
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (47, 80, 16, 4, 'Complete', '2023-10-16'), -- Gaming Consoles (variant_id 80) - 4 items (sold)
  (48, 90, 16, 2, 'Complete', '2023-10-16'); -- Smart Home Security (variant_id 90) - 2 items (sold)

-- Cart 17 (Empty Cart)
-- No items in the cart

-- Cart 18 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (50, 40, 18, 2, 'Pending', NULL); -- Cameras (variant_id 40) - 2 items
  
-- Cart 19
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (51, 20, 19, 3, 'Complete', '2023-10-18'), -- Laptops (variant_id 20) - 3 items (sold)
  (52, 30, 19, 2, 'Complete', '2023-10-18'); -- Headphones (variant_id 30) - 2 items (sold)

-- Cart 20
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (53, 40, 20, 4, 'Pending', NULL), -- Cameras (variant_id 40) - 4 items
  (54, 50, 20, 3, 'Complete', '2023-10-19'); -- Watches (variant_id 50) - 3 items (sold)

-- Cart 21
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (55, 11, 21, 2, 'Complete', '2023-10-20'), -- Mobile Phones (variant_id 11) - 2 items (sold)
  (56, 21, 21, 1, 'Complete', '2023-10-20'); -- Laptops (variant_id 21) - 1 item (sold)

-- Cart 22 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (57, 31, 22, 2, 'Pending', NULL), -- Headphones (variant_id 31) - 2 items
  (58, 41, 22, 1, 'Complete', '2023-10-21'); -- Cameras (variant_id 41) - 1 item (sold)

-- Cart 23 (Empty Cart)
-- No items in the cart

-- Cart 24
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (59, 51, 24, 1, 'Pending', NULL); -- Watches (variant_id 51) - 1 item

-- Cart 25
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (60, 60, 25, 2, 'Pending', NULL), -- Home Appliances (variant_id 60) - 2 items
  (61, 70, 25, 1, 'Complete', '2023-10-22'); -- Gaming Consoles (variant_id 70) - 1 item (sold)

-- Cart 26 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (62, 90, 26, 2, 'Pending', NULL); -- Smart Home Security (variant_id 90) - 2 items

-- Cart 27
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (63, 10, 27, 3, 'Complete', '2023-10-23'), -- Mobile Phones (variant_id 10) - 3 items (sold)
  (64, 20, 27, 2, 'Pending', NULL); -- Laptops (variant_id 20) - 2 items

-- Cart 28
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (65, 30, 28, 4, 'Complete', '2023-10-24'), -- Headphones (variant_id 30) - 4 items (sold)
  (66, 40, 28, 2, 'Complete', '2023-10-24'); -- Cameras (variant_id 40) - 2 items (sold)

-- Cart 29 (Empty Cart)
-- No items in the cart

-- Cart 30
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (67, 50, 30, 3, 'Pending', NULL), -- Watches (variant_id 50) - 3 items
  (68, 70, 30, 2, 'Pending', NULL); -- Gaming Consoles (variant_id 70) - 2 items

-- Cart 31
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (69, 90, 31, 3, 'Pending', NULL), -- Smart Home Security (variant_id 90) - 3 items
  (70, 51, 31, 2, 'Complete', '2023-10-25'); -- Mobile Phones (variant_id 51) - 2 items (sold)

-- Cart 32
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (71, 61, 32, 1, 'Pending', NULL), -- Home Appliances (variant_id 61) - 1 item
  (72, 71, 32, 3, 'Pending', NULL); -- Gaming Consoles (variant_id 71) - 3 items

-- Cart 33
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (73, 31, 33, 4, 'Complete', '2023-10-26'), -- Headphones (variant_id 31) - 4 items (sold)
  (74, 91, 33, 2, 'Complete', '2023-10-26'); -- Printers (variant_id 91) - 2 items (sold)

-- Cart 34 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (75, 102, 34, 1, 'Pending', NULL), -- Tablets (variant_id 102) - 1 item
  (76, 70, 34, 3, 'Complete', '2023-10-27'); -- Gaming Consoles (variant_id 70) - 3 items (sold)

-- Cart 35 (Empty Cart)
-- No items in the cart

-- Cart 36
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (77, 40, 36, 4, 'Complete', '2023-10-28'), -- Cameras (variant_id 40) - 4 items (sold)
  (78, 51, 36, 2, 'Pending', NULL); -- Watches (variant_id 51) - 2 items

-- Cart 37
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (79, 61, 37, 1, 'Complete', '2023-10-29'), -- Home Appliances (variant_id 61) - 1 item (sold)
  (80, 70, 37, 3, 'Complete', '2023-10-29'); -- Gaming Consoles (variant_id 70) - 3 items (sold)

-- Cart 38
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (81, 91, 38, 4, 'Pending', NULL), -- Printers (variant_id 91) - 4 items
  (82, 101, 38, 2, 'Pending', NULL); -- Tablets (variant_id 101) - 2 items

-- Cart 39 (Partial Cart)
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (83, 40, 39, 1, 'Complete', '2023-10-30'), -- Cameras (variant_id 40) - 1 item (sold)
  (84, 50, 39, 3, 'Pending', NULL); -- Watches (variant_id 50) - 3 items

-- Cart 40 (Empty Cart)
-- No items in the cart

-- Cart 41
INSERT INTO Ecom_platform.Cart_item (cart_item_id, variant_id, cart_id, quantity, status, sold_date)
VALUES
  (85, 91, 41, 4, 'Pending', NULL), -- Printers (variant_id 91) - 4 items
  (86, 101, 41, 2, 'Pending', NULL); -- Tablets (variant_id 101) - 2 items
