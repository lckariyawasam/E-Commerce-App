-- Insert data for Users with Randomized Domain Names and All Address Fields NOT NULL
INSERT INTO Ecom_platform.User (user_id, user_type, first_name, last_name, email, password_hash, phone_number, address_line01, address_city, address_state, address_zip_code, address_country)
VALUES
  (1, 'Registered', 'John', 'Doe', 'john.doe@example1.com', 'hashed_password', '+1234567890', '123 Main St', 'New York', 'NY', '10001', 'United States'),
  (2, 'Registered', 'Alice', 'Smith', 'alice.smith@example2.com', 'hashed_password', '+1234567890', '456 Elm St', 'Los Angeles', 'CA', '90001', 'United States'),
  (3, 'Registered', 'Bob', 'Johnson', 'bob.johnson@example3.com', 'hashed_password', '+1234567890', '789 Oak St', 'Chicago', 'IL', '60601', 'United States'),
  (4, 'Guest', 'Guest', 'User', 'guest@example4.com', 'hashed_password', '+1234567890', '567 Pine St', 'London', 'London', 'W1A 1AA', 'United Kingdom'),
  (5, 'Registered', 'Eva', 'Brown', 'eva.brown@example5.com', 'hashed_password', '+1234567890', '234 Birch St', 'Paris', 'Île-de-France', '75001', 'France'),
  (6, 'Guest', 'Guest', 'User', 'guest@example6.com', 'hashed_password', '+1234567890', '890 Cedar St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  (7, 'Registered', 'Michael', 'Johnson', 'michael.j@example7.com', 'hashed_password', '+1234567890', '789 Elm St', 'Los Angeles', 'CA', '90001', 'United States'),
  (8, 'Guest', 'Guest', 'User', 'guest@example8.com', 'hashed_password', '+1234567890', '456 Oak St', 'London', 'London', 'W1A 1AA', 'United Kingdom'),
  (9, 'Registered', 'Sophia', 'Wang', 'sophia.w@example9.com', 'hashed_password', '+1234567890', '123 Pine St', 'New York', 'NY', '10001', 'United States'),
  (10, 'Registered', 'David', 'Chen', 'david.c@example10.com', 'hashed_password', '+1234567890', '234 Cedar St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  (11, 'Registered', 'Emily', 'Kumar', 'emily.k@example11.com', 'hashed_password', '+1234567890', '567 Elm St', 'Los Angeles', 'CA', '90001', 'United States'),
  (12, 'Guest', 'Guest', 'User', 'guest@example12.com', 'hashed_password', '+1234567890', '890 Main St', 'Paris', 'Île-de-France', '75001', 'France'),
  (13, 'Registered', 'Daniel', 'Garcia', 'daniel.g@example13.com', 'hashed_password', '+1234567890', '345 Oak St', 'Chicago', 'IL', '60601', 'United States'),
  (14, 'Registered', 'Olivia', 'Davis', 'olivia.d@example14.com', 'hashed_password', '+1234567890', '456 Birch St', 'London', 'London', 'W1A 1AA', 'United Kingdom'),
  (15, 'Guest', 'Guest', 'User', 'guest@example15.com', 'hashed_password', '+1234567890', '123 Cedar St', 'New York', 'NY', '10001', 'United States'),
  (16, 'Registered', 'Lucas', 'Wilson', 'lucas.w@example16.com', 'hashed_password', '+1234567890', '789 Pine St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  (17, 'Guest', 'Guest', 'User', 'guest@example17.com', 'hashed_password', '+1234567890', '567 Oak St', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
  (18, 'Registered', 'Isabella', 'Lee', 'isabella.l@example18.com', 'hashed_password', '+1234567890', '234 Elm St', 'Seoul', 'Seoul', '04522', 'South Korea'),
  (19, 'Registered', 'James', 'Gonzalez', 'james.g@example19.com', 'hashed_password', '+1234567890', '890 Oak St', 'Beijing', 'Beijing', '100000', 'China'),
  (20, 'Guest', 'Guest', 'User', 'guest@example20.com', 'hashed_password', '+1234567890', '123 Pine St', 'Berlin', 'Berlin', '10117', 'Germany'),
  (21, 'Registered', 'Ava', 'Perez', 'ava.p@example21.com', 'hashed_password', '+1234567890', '456 Cedar St', 'Paris', 'Île-de-France', '75001', 'France'),
  (22, 'Registered', 'Logan', 'Martinez', 'logan.m@example22.com', 'hashed_password', '+1234567890', '567 Birch St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  (23, 'Registered', 'Sophia', 'Harris', 'sophia.h@example23.com', 'hashed_password', '+1234567890', '890 Pine St', 'New York', 'NY', '10001', 'United States'),
  (24, 'Registered', 'Liam', 'Taylor', 'liam.t@example24.com', 'hashed_password', '+1234567890', '123 Elm St', 'Chicago', 'IL', '60601', 'United States'),
  (25, 'Guest', 'Guest', 'User', 'guest@example25.com', 'hashed_password', '+1234567890', '456 Oak St', 'Los Angeles', 'CA', '90001', 'United States'),
  (26, 'Registered', 'Sophia', 'Smith', 'sophia.s@example26.com', 'hashed_password', '+1234567890', '567 Cedar St', 'London', 'London', 'W1A 1AA', 'United Kingdom'),
  (27, 'Registered', 'Oliver', 'Lee', 'oliver.l@example27.com', 'hashed_password', '+1234567890', '890 Birch St', 'Paris', 'Île-de-France', '75001', 'France'),
  (28, 'Registered', 'Emma', 'Gonzalez', 'emma.g@example28.com', 'hashed_password', '+1234567890', '234 Oak St', 'Seoul', 'Seoul', '04522', 'South Korea'),
  (29, 'Registered', 'Liam', 'Hernandez', 'liam.h@example29.com', 'hashed_password', '+1234567890', '890 Cedar St', 'Beijing', 'Beijing', '100000', 'China'),
  (30, 'Guest', 'Guest', 'User', 'guest@example30.com', 'hashed_password', '+1234567890', '123 Main St', 'Berlin', 'Berlin', '10117', 'Germany'),
  (31, 'Registered', 'Sophia', 'Rodriguez', 'sophia.r@example31.com', 'hashed_password', '+1234567890', '456 Elm St', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
  (32, 'Registered', 'Oliver', 'Smith', 'oliver.s@example32.com', 'hashed_password', '+1234567890', '789 Oak St', 'New York', 'NY', '10001', 'United States'),
  (33, 'Registered', 'Ava', 'Brown', 'ava.b@example33.com', 'hashed_password', '+1234567890', '567 Pine St', 'Los Angeles', 'CA', '90001', 'United States'),
  (34, 'Guest', 'Guest', 'User', 'guest@example34.com', 'hashed_password', '+1234567890', '123 Cedar St', 'Chicago', 'IL', '60601', 'United States'),
  (35, 'Registered', 'Lucas', 'Martinez', 'lucas.m@example35.com', 'hashed_password', '+1234567890', '456 Oak St', 'Paris', 'Île-de-France', '75001', 'France'),
  (36, 'Registered', 'Sophia', 'Taylor', 'sophia.t@example36.com', 'hashed_password', '+1234567890', '890 Elm St', 'Sydney', 'New South Wales', '2000', 'Australia'),
  (37, 'Registered', 'Oliver', 'Lee', 'oliver.l@example37.com', 'hashed_password', '+1234567890', '123 Pine St', 'New York', 'NY', '10001', 'United States'),
  (38, 'Guest', 'Guest', 'User', 'guest@example38.com', 'hashed_password', '+1234567890', '567 Cedar St', 'Seoul', 'Seoul', '04522', 'South Korea'),
  (39, 'Registered', 'Emma', 'Gonzalez', 'emma.g@example39.com', 'hashed_password', '+1234567890', '234 Elm St', 'Beijing', 'Beijing', '100000', 'China'),
  (40, 'Registered', 'Liam', 'Hernandez', 'liam.h@example40.com', 'hashed_password', '+1234567890', '890 Oak St', 'Berlin', 'Berlin', '10117', 'Germany'),
  (41, 'Registered', 'Sophia', 'Rodriguez', 'sophia.r@example41.com', 'hashed_password', '+1234567890', '123 Cedar St', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
  (42, 'Registered', 'Oliver', 'Smith', 'oliver.s@example42.com', 'hashed_password', '+1234567890', '456 Oak St', 'New York', 'NY', '10001', 'United States'),
  (43, 'Registered', 'Ava', 'Brown', 'ava.b@example43.com', 'hashed_password', '+1234567890', '789 Elm St', 'Los Angeles', 'CA', '90001', 'United States'),
  (44, 'Guest', 'Guest', 'User', 'guest@example44.com', 'hashed_password', '+1234567890', '123 Pine St', 'Chicago', 'IL', '60601', 'United States'),
  (45, 'Registered', 'Lucas', 'Martinez', 'lucas.m@example45.com', 'hashed_password', '+1234567890', '456 Oak St', 'Paris', 'Île-de-France', '75001', 'France');

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

-- Insert data for Variants
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (1, 1, '128GB', 'Silver', '699.99', 'IP12-001-128GB-Silver', NULL),
  (2, 1, '128GB', 'Gold', '699.99', 'IP12-001-128GB-Gold', NULL),
  (3, 2, '256GB', 'Black', '749.99', 'S21-001-256GB-Black', NULL),
  (4, 2, '256GB', 'White', '749.99', 'S21-001-256GB-White', NULL),
  (5, 3, '128GB', 'Black', '599.99', 'Pixel5-001-128GB-Black', NULL),
  (6, 3, '64GB', 'White', '549.99', 'Pixel5-001-64GB-White', NULL),
  (7, 4, '256GB', 'Black', '699.99', 'OP9-001-256GB-Black', NULL),
  (8, 4, '128GB', 'Blue', '649.99', 'OP9-001-128GB-Blue', NULL),
  (9, 5, '256GB', 'Black', '699.99', 'Mi11-001-256GB-Black', NULL),
  (10, 5, '128GB', 'Blue', '649.99', 'Mi11-001-128GB-Blue', NULL),
  
  -- Variants for TVs
  (11, 6, '55"', '4K', '799.99', 'TV55-001-55-4K', NULL),
  (12, 6, '65"', '4K', '999.99', 'TV65-001-65-4K', NULL),
  (13, 7, '65"', 'OLED', '1299.99', 'OLED65-001-65-OLED', NULL),
  (14, 7, '55"', 'OLED', '1099.99', 'OLED55-001-55-OLED', NULL),
  (15, 8, '60"', '4K', '849.99', 'TV60-001-60-4K', NULL),
  (16, 8, '50"', '4K', '699.99', 'TV50-001-50-4K', NULL),
  (17, 9, '50"', 'LED', '449.99', 'TV50-001-50-LED', NULL),
  (18, 9, '43"', 'LED', '399.99', 'TV43-001-43-LED', NULL),
  (19, 10, '43"', '1080p', '349.99', 'TV43-001-43-1080p', NULL),
  (20, 10, '55"', '1080p', '449.99', 'TV55-001-55-1080p', NULL),
  
  -- Variants for Laptops
  (21, 11, '256GB', '8GB', '799.99', 'LAP256-001-8GB-256GB', NULL),
  (22, 11, '512GB', '16GB', '999.99', 'LAP512-001-16GB-512GB', NULL),
  (23, 12, '256GB', '8GB', '749.99', 'LAP256-002-8GB-256GB', NULL),
  (24, 12, '512GB', '16GB', '949.99', 'LAP512-002-16GB-512GB', NULL),
  (25, 13, '512GB', '8GB', '849.99', 'LAP512-003-8GB-512GB', NULL),
  (26, 13, '256GB', '16GB', '899.99', 'LAP256-003-16GB-256GB', NULL),
  (27, 14, '512GB', '8GB', '899.99', 'LAP512-004-8GB-512GB', NULL),
  (28, 14, '256GB', '16GB', '849.99', 'LAP256-004-16GB-256GB', NULL),
  (29, 15, '1TB', '32GB', '1299.99', 'LAP1TB-005-32GB-1TB', NULL),
  (30, 15, '512GB', '16GB', '1199.99', 'LAP512-005-16GB-512GB', NULL),
  
  -- Variants for Headphones
  (31, 16, 'Black', 'Active Noise Cancelling', '199.99', 'HP-001-ANC-Black', NULL),
  (32, 16, 'Silver', 'Active Noise Cancelling', '199.99', 'HP-001-ANC-Silver', NULL),
  (33, 17, 'Black', 'Active Noise Cancelling', '189.99', 'HP-002-ANC-Black', NULL),
  (34, 17, 'Silver', 'Active Noise Cancelling', '189.99', 'HP-002-ANC-Silver', NULL),
  (35, 18, 'Black', 'Open-back', '179.99', 'HP-003-Open-Black', NULL),
  (36, 18, 'Silver', 'Open-back', '179.99', 'HP-003-Open-Silver', NULL),
  (37, 19, 'Black', 'Active Noise Cancelling', '199.99', 'HP-004-ANC-Black', NULL),
  (38, 19, 'Silver', 'Active Noise Cancelling', '199.99', 'HP-004-ANC-Silver', NULL),
  (39, 20, 'Black', 'Wireless', '149.99', 'HP-005-Wireless-Black', NULL),
  (40, 20, 'White', 'Wireless', '149.99', 'HP-005-Wireless-White', NULL),
  
  -- Variants for Cameras
  (41, 21, '30MP', 'Zoom Lens', '799.99', 'CAM-001-30MP-Zoom', NULL),
  (42, 21, '24MP', 'Prime Lens', '699.99', 'CAM-001-24MP-Prime', NULL),
  (43, 22, '24MP', 'Zoom Lens', '749.99', 'CAM-002-24MP-Zoom', NULL),
  (44, 22, '30MP', 'Prime Lens', '799.99', 'CAM-002-30MP-Prime', NULL),
  (45, 23, '30MP', 'Zoom Lens', '799.99', 'CAM-003-30MP-Zoom', NULL),
  (46, 23, '24MP', 'Prime Lens', '699.99', 'CAM-003-24MP-Prime', NULL),
  (47, 24, '24MP', 'Zoom Lens', '749.99', 'CAM-004-24MP-Zoom', NULL),
  (48, 24, '30MP', 'Prime Lens', '799.99', 'CAM-004-30MP-Prime', NULL),
  (49, 25, '24MP', 'Zoom Lens', '699.99', 'CAM-005-24MP-Zoom', NULL),
  (50, 25, '30MP', 'Prime Lens', '749.99', 'CAM-005-30MP-Prime', NULL),
  
  -- Variants for Watches
  (51, 26, '42mm', 'Space Gray', '249.99', 'WATCH-001-42mm-SpaceGray', NULL),
  (52, 26, '38mm', 'Silver', '219.99', 'WATCH-001-38mm-Silver', NULL),
  (53, 27, '45mm', 'Black', '269.99', 'WATCH-002-45mm-Black', NULL),
  (54, 27, '41mm', 'Rose Gold', '239.99', 'WATCH-002-41mm-RoseGold', NULL),
  (55, 28, '44mm', 'Black', '259.99', 'WATCH-003-44mm-Black', NULL),
  (56, 28, '40mm', 'Silver', '229.99', 'WATCH-003-40mm-Silver', NULL),
  (57, 29, '41mm', 'Gold', '239.99', 'WATCH-004-41mm-Gold', NULL),
  (58, 29, '46mm', 'Silver', '269.99', 'WATCH-004-46mm-Silver', NULL),
  (59, 30, '40mm', 'Blue', '229.99', 'WATCH-005-40mm-Blue', NULL),
  (60, 30, '45mm', 'Black', '259.99', 'WATCH-005-45mm-Black', NULL);
  
-- Variants for Home Appliances with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (61, 31, '600L', 'Stainless Steel', '999.99', 'APPLIANCE-001-600L-StainlessSteel', NULL),
  (62, 31, '450L', 'Black', '799.99', 'APPLIANCE-001-450L-Black', NULL),
  (63, 32, '8kg', 'White', '349.99', 'APPLIANCE-002-8kg-White', NULL),
  (64, 32, '7kg', 'Silver', '299.99', 'APPLIANCE-002-7kg-Silver', NULL),
  (65, 33, '1000W', 'Stainless Steel', '149.99', 'APPLIANCE-003-1000W-StainlessSteel', NULL),
  (66, 33, '800W', 'Black', '129.99', 'APPLIANCE-003-800W-Black', NULL),
  (67, 34, '10 Cups', 'Stainless Steel', '89.99', 'APPLIANCE-004-10Cups-StainlessSteel', NULL),
  (68, 34, '8 Cups', 'Glass', '79.99', 'APPLIANCE-004-8Cups-Glass', NULL),
  (69, 35, 'Corded', 'Purple', '119.99', 'APPLIANCE-005-Corded-Purple', NULL),
  (70, 35, 'Cordless', 'Red', '129.99', 'APPLIANCE-005-Cordless-Red', NULL);
  
-- Variants for Gaming Consoles with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (71, 36, '1TB', 'White', '499.99', 'CONSOLE-001-1TB-White', NULL),
  (72, 36, '512GB', 'Black', '549.99', 'CONSOLE-001-512GB-Black', NULL),
  (73, 37, '1TB', 'Black', '499.99', 'CONSOLE-002-1TB-Black', NULL),
  (74, 37, '512GB', 'White', '549.99', 'CONSOLE-002-512GB-White', NULL),
  (75, 38, '32GB', 'Neon Blue/Red', '299.99', 'CONSOLE-003-32GB-NeonBlueRed', NULL),
  (76, 38, '64GB', 'Turquoise', '349.99', 'CONSOLE-003-64GB-Turquoise', NULL),
  (77, 39, '1TB', 'Jet Black', '499.99', 'CONSOLE-004-1TB-JetBlack', NULL),
  (78, 39, '512GB', 'Robot White', '549.99', 'CONSOLE-004-512GB-RobotWhite', NULL),
  (79, 40, '1TB', 'Cyberpunk 2077 Edition', '599.99', 'CONSOLE-005-1TB-Cyberpunk2077', NULL),
  (80, 40, '512GB', 'Robot White', '549.99', 'CONSOLE-005-512GB-RobotWhite', NULL);
  
-- Variants for Smart Home Security with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (81, 41, 'Base Station, Contact Sensor, Keypad, Motion Detector', 'White', '399.99', 'SECURITY-001-BaseStation-White', NULL),
  (82, 41, 'Base Station, Contact Sensor', 'White', '349.99', 'SECURITY-001-BaseStation-ContactSensor-White', NULL),
  (83, 42, '2 Cameras', 'White', '499.99', 'SECURITY-002-2Cameras-White', NULL),
  (84, 42, '1 Camera', 'White', '299.99', 'SECURITY-002-1Camera-White', NULL),
  (85, 43, 'Battery-Powered', 'White', '199.99', 'SECURITY-003-BatteryPowered-White', NULL),
  (86, 43, 'Hardwired', 'Black', '249.99', 'SECURITY-003-Hardwired-Black', NULL),
  (87, 44, 'Wired', 'White', '279.99', 'SECURITY-004-Wired-White', NULL),
  (88, 44, 'Wireless', 'Black', '299.99', 'SECURITY-004-Wireless-Black', NULL),
  (89, 45, 'Indoor', 'White', '149.99', 'SECURITY-005-Indoor-White', NULL),
  (90, 45, 'Indoor', 'Black', '149.99', 'SECURITY-005-Indoor-Black', NULL);
  
-- Variants for Printers with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (91, 46, '30 ppm', 'White', '299.99', 'PRINTER-001-30ppm-White', NULL),
  (92, 46, '25 ppm', 'Black', '279.99', 'PRINTER-001-25ppm-Black', NULL),
  (93, 47, '15 ppm', 'White', '199.99', 'PRINTER-002-15ppm-White', NULL),
  (94, 47, '20 ppm', 'Black', '219.99', 'PRINTER-002-20ppm-Black', NULL),
  (95, 48, '20 ppm', 'White', '229.99', 'PRINTER-003-20ppm-White', NULL),
  (96, 48, '15 ppm', 'Black', '209.99', 'PRINTER-003-15ppm-Black', NULL),
  (97, 49, '25 ppm', 'White', '259.99', 'PRINTER-004-25ppm-White', NULL),
  (98, 49, '30 ppm', 'Black', '279.99', 'PRINTER-004-30ppm-Black', NULL),
  (99, 50, '18 ppm', 'White', '229.99', 'PRINTER-005-18ppm-White', NULL),
  (100, 50, '22 ppm', 'Black', '249.99', 'PRINTER-005-22ppm-Black', NULL);
  
-- Variants for Tablets with Price, SKU, and Icon
INSERT INTO Ecom_platform.Variant (variant_id, Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (101, 51, '128GB', 'Space Gray', '449.99', 'TAB-001-128GB-SpaceGray', NULL),
  (102, 51, '256GB', 'Silver', '549.99', 'TAB-001-256GB-Silver', NULL),
  (103, 52, '64GB', 'Black', '399.99', 'TAB-002-64GB-Black', NULL),
  (104, 52, '128GB', 'Gold', '449.99', 'TAB-002-128GB-Gold', NULL),
  (105, 53, '256GB', 'Space Gray', '549.99', 'TAB-003-256GB-SpaceGray', NULL),
  (106, 53, '64GB', 'Silver', '399.99', 'TAB-003-64GB-Silver', NULL),
  (107, 54, '128GB', 'Gold', '449.99', 'TAB-004-128GB-Gold', NULL),
  (108, 54, '256GB', 'Black', '549.99', 'TAB-004-256GB-Black', NULL),
  (109, 55, '64GB', 'Silver', '399.99', 'TAB-005-64GB-Silver', NULL),
  (110, 55, '128GB', 'Space Gray', '449.99', 'TAB-005-128GB-SpaceGray', NULL);


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

-- Referring to Electronics Category (Gaming Consoles)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (31, 13), -- PlayStation 5
  (32, 13), -- Xbox Series X
  (33, 13), -- Nintendo Switch
  (34, 13), -- Sony PlayStation 4
  (35, 13); -- Xbox One X

-- Referring to Electronics Category (Home Appliances)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (36, 35), -- Samsung Refrigerator
  (37, 35), -- LG Washing Machine
  (38, 35), -- Whirlpool Microwave Oven
  (39, 35), -- Breville Coffee Maker
  (40, 35); -- Dyson Vacuum Cleaner

-- Referring to Electronics Category (Smart Home Security)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (41, 36), -- Ring Alarm Security Kit
  (42, 36), -- Arlo Pro 4 Security Camera
  (43, 36), -- Nest Hello Video Doorbell
  (44, 36), -- SimpliSafe Home Security System
  (45, 36); -- Blink Mini Indoor Camera

-- Referring to Electronics Category (Printers)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (46, 37), -- HP LaserJet Pro
  (47, 37), -- Epson EcoTank
  (48, 37), -- Canon PIXMA
  (49, 37), -- Brother HL-L2350DW
  (50, 37); -- Xerox WorkCentre

-- Referring to Electronics Category (Tablets)
INSERT INTO Ecom_platform.Product_Sub_Category (product_id, category_id)
VALUES
  (51, 38), -- Apple iPad Pro
  (52, 38), -- Samsung Galaxy Tab S7
  (53, 38), -- Microsoft Surface Pro 7
  (54, 38), -- Amazon Fire HD 10
  (55, 38); -- Lenovo Tab M10;


  -- Insert data for Inventory
INSERT INTO Ecom_platform.Inventory (Inventory_id, variant_id, quantity)
VALUES
  -- Inventory for Mobile Phones
  (1, 1, 50),
  (2, 2, 30),
  (3, 3, 40),
  (4, 4, 25),
  (5, 5, 60),
  (6, 6, 45),
  (7, 7, 55),
  (8, 8, 70),
  (9, 9, 35),
  (10, 10, 48),

  -- Inventory for TVs
  (11, 11, 20),
  (12, 12, 18),
  (13, 13, 22),
  (14, 14, 17),
  (15, 15, 28),
  (16, 16, 25),
  (17, 17, 30),
  (18, 18, 27),
  (19, 19, 40),
  (20, 20, 35),

  -- Inventory for Laptops
  (21, 21, 12),
  (22, 22, 15),
  (23, 23, 14),
  (24, 24, 10),
  (25, 25, 18),
  (26, 26, 20),
  (27, 27, 11),
  (28, 28, 13),
  (29, 29, 8),
  (30, 30, 9),

  -- Inventory for Headphones
  (31, 31, 90),
  (32, 32, 80),
  (33, 33, 70),
  (34, 34, 65),
  (35, 35, 55),
  (36, 36, 48),
  (37, 37, 75),
  (38, 38, 60),
  (39, 39, 110),
  (40, 40, 95),

  -- Inventory for Cameras
  (41, 41, 25),
  (42, 42, 20),
  (43, 43, 30),
  (44, 44, 28),
  (45, 45, 22),
  (46, 46, 18),
  (47, 47, 32),
  (48, 48, 27),
  (49, 49, 16),
  (50, 50, 14),

  -- Inventory for Watches
  (51, 51, 35),
  (52, 52, 42),
  (53, 53, 50),
  (54, 54, 48),
  (55, 55, 38),
  (56, 56, 40),
  (57, 57, 46),
  (58, 58, 45),
  (59, 59, 36),
  (60, 60, 33),

  -- Inventory for Home Appliances
  (61, 61, 15),
  (62, 62, 18),
  (63, 63, 24),
  (64, 64, 20),
  (65, 65, 28),
  (66, 66, 26),
  (67, 67, 12),
  (68, 68, 14),
  (69, 69, 10),
  (70, 70, 9),

  -- Inventory for Gaming Consoles
  (71, 71, 30),
  (72, 72, 25),
  (73, 73, 40),
  (74, 74, 35),
  (75, 75, 22),
  (76, 76, 20),
  (77, 77, 33),
  (78, 78, 28),
  (79, 79, 17),
  (80, 80, 14),

  -- Inventory for Smart Home Security
  (81, 81, 20),
  (82, 82, 18),
  (83, 83, 25),
  (84, 84, 22),
  (85, 85, 15),
  (86, 86, 12),
  (87, 87, 28),
  (88, 88, 26),
  (89, 89, 10),
  (90, 90, 9);
  
-- Variants for Printers
INSERT INTO Ecom_platform.Inventory (Inventory_id, variant_id, quantity)
VALUES
  (91, 91, 35),
  (92, 92, 30),
  (93, 93, 42),
  (94, 94, 38),
  (95, 95, 48),
  (96, 96, 40),
  (97, 97, 28),
  (98, 98, 32),
  (99, 99, 24),
  (100, 100, 26);
  
  -- Variants for Tablets
INSERT INTO Ecom_platform.Inventory (Inventory_id, variant_id, quantity)
VALUES
  (101, 101, 70),
  (102, 102, 62),
  (103, 103, 80),
  (104, 104, 75),
  (105, 105, 68),
  (106, 106, 60),
  (107, 107, 78),
  (108, 108, 72),
  (109, 109, 55),
  (110, 110, 52);


-- Example Cart records
INSERT INTO Ecom_platform.Cart (cart_id, user_id, status)
VALUES
  (1, 1, 'Pending'),
  (2, 2, 'Pending'),
  (3, 3, 'Complete'),
  (4, 4, 'Pending'),
  (5, 5, 'Complete'),
  (6, 6, 'Complete'),
  (7, 7, 'Pending'),
  (8, 8, 'Complete'),
  (9, 9, 'Pending'),
  (10, 10, 'Complete'),
  (11, 11, 'Complete'),
  (12, 12, 'Pending'),
  (13, 13, 'Complete'),
  (14, 14, 'Complete'),
  (15, 15, 'Pending'),
  (16, 16, 'Complete'),
  (17, 17, 'Pending'),
  (18, 18, 'Complete'),
  (19, 19, 'Pending'),
  (20, 20, 'Complete'),
  (21, 21, 'Pending'),
  (22, 22, 'Complete'),
  (23, 23, 'Pending'),
  (24, 24, 'Complete'),
  (25, 25, 'Complete'),
  (26, 26, 'Pending'),
  (27, 27, 'Pending');

-- Additional Cart records for remaining users
INSERT INTO Ecom_platform.Cart (cart_id, user_id, status)
VALUES
  (28, 28, 'Pending'),
  (29, 29, 'Complete'),
  (30, 30, 'Pending'),
  (31, 31, 'Complete'),
  (32, 32, 'Complete'),
  (33, 33, 'Pending'),
  (34, 34, 'Complete'),
  (35, 35, 'Pending'),
  (36, 36, 'Complete'),
  (37, 37, 'Complete'),
  (38, 38, 'Pending'),
  (39, 39, 'Complete'),
  (40, 40, 'Complete'),
  (41, 41, 'Pending'),
  (42, 42, 'Complete'),
  (43, 43, 'Pending'),
  (44, 44, 'Complete'),
  (45, 45, 'Pending');


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
