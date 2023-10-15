-- Dummy data for the Order table
INSERT INTO Ecom_platform.Order (cart_id, user_id, payment_type, delivery_estimation, order_date, status)
VALUES
  (1, 1, 'Credit Card', '2 days', '2023-10-12', 'Processing'),
  (2, 6, 'PayPal', '3 days', '2023-10-11', 'Shipped'),
  (3, 10, 'Cash on Delivery', '5 days', '2023-10-10', 'Delivered'),
  (4, 13, 'Credit Card', '2 days', '2023-10-09', 'Processing'),
  (5, 19, 'PayPal', '3 days', '2023-10-08', 'Shipped'),
  (6, 22, 'Cash on Delivery', '5 days', '2023-10-07', 'Delivered'),
  (7, 28, 'Credit Card', '2 days', '2023-10-06', 'Processing'),
  (8, 31, 'PayPal', '3 days', '2023-10-05', 'Shipped'),
  (9, 37, 'Cash on Delivery', '5 days', '2023-10-04', 'Delivered'),
  (10, 41, 'Credit Card', '2 days', '2023-10-03', 'Processing');
