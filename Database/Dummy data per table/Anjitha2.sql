
==========  -- Product_id starting from 56   ===============
==========  -- Variant_id starting from 111  ===============

-- Insert data for Action Figures
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Toy Car - Red Racer', '200g', 'Speedy Toys', 'Zoom around with this red toy car. It's designed for speed and fun play for kids.', 'Color', 'Size'),
  ('Toy Car - Blue Cruiser', '210g', 'DriveMaster', 'Take a leisurely drive with this blue toy car. It's perfect for imaginative adventures.', 'Color', 'Size'),
  ('Toy Jeep - Safari Adventure', '230g', 'Wild Explorers', 'Embark on a safari adventure with this toy jeep. It features realistic details and a removable roof.', 'Color', 'Size');
  ('Toy Helicopter - Rescue Chopper', '250g', 'Rescue Heroes', 'Be a hero with this rescue helicopter. It comes with rotating blades and a working winch for daring missions.', 'Color', 'Size'),
  ('Toy Helicopter - Police Pursuit', '260g', 'Law Enforcement Toys', 'Chase down the bad guys with this police helicopter. It features a searchlight and working doors.', 'Color', 'Size');
-- Insert data for Board Games
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Toy Blaster - Laser Shooter', '150g', 'Galactic Warriors', 'Defend the galaxy with this laser blaster. It features light and sound effects for epic battles.', 'Type', 'Color'),
  ('Toy Sword - Knight's Weapon', '180g', 'Medieval Adventures', 'Become a noble knight with this toy sword. It's perfect for medieval role-play.', 'Type', 'Color');
  ('Dinosaur World Board Game', '850g', 'Prehistoric Games', 'Travel back in time to a world of dinosaurs with this exciting board game. Compete to build the best dinosaur park.', 'Number of Players', 'Game Board Size'),
  ('Pirates Treasure Board Game', '900g', 'Treasure Hunt Games', 'Sail the high seas in search of hidden treasure. This board game is perfect for aspiring pirates and treasure hunters.', 'Number of Players', 'Game Board Size'),
  ('Fantasy Quest Board Game', '875g', 'Mythic Adventures', 'Venture into a realm of fantasy and magic with this cooperative board game. Solve quests and face mythical creatures.', 'Number of Players', 'Game Board Size');

-- Insert data for Dolls
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Fashion Model Doll - Summer Style', '240g', 'Dolly Inc.', 'Dress up your fashion model doll in the latest summer fashions. This set includes beachwear and accessories for a stylish look.', 'Outfit Style', 'Accessory Set'),
  ('Princess Doll - Royal Gown', '280g', 'Royal Toys', 'Create a fairytale with this princess doll. She wears a beautiful royal gown and comes with a tiara and royal accessories.', 'Outfit Style', 'Accessory Set'),
  ('Mermaid Doll - Underwater Adventure', '250g', 'AquaToys', 'Dive into an underwater adventure with this mermaid doll. She has a colorful tail and comes with aquatic-themed accessories.', 'Outfit Style', 'Accessory Set'),
  ('Pop Star Doll - Stage Sensation', '260g', 'Star Performers', 'Get ready for a concert with this pop star doll. Shes dressed in a glamorous stage outfit and has a microphone for singing.', 'Outfit Style', 'Accessory Set'),
  ('Fairy Tale Doll - Enchanted Forest', '270g', 'Fantasy Toys', 'Enter an enchanted forest with this fairy tale doll. She comes with a magical wand and a whimsical outfit.', 'Outfit Style', 'Accessory Set');

-- Insert data for Remote Control Toys
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Remote Control Racing Car - Speedster', '590g', 'RC Racers', 'Experience the thrill of high-speed racing with this remote control car. Its built for speed and maneuverability.', 'Speed', 'Frequency Band'),
  ('Remote Control Helicopter - Sky Master', '650g', 'AeroTech', 'Take to the skies with this remote control helicopter. Its designed for easy flying and aerial stunts.', 'Speed', 'Frequency Band'),
  ('Remote Control Boat - Aquatic Voyager', '600g', 'Splash Navigators', 'Set sail with this remote control boat. Its perfect for adventures on the water and comes with realistic detailing.', 'Speed', 'Frequency Band'),
  ('Remote Control Drone - Aerial Explorer', '700g', 'DroneTech', 'Explore the world from above with this remote control drone. Its equipped with a camera for capturing stunning aerial photos and videos.', 'Speed', 'Frequency Band'),
  ('Remote Control Monster Truck - Off-Road Racer', '750g', 'Monster Wheels', 'Conquer rough terrain with this remote control monster truck. Its oversized wheels provide stability and durability.', 'Speed', 'Frequency Band');

-- Insert data for Educational Toys
INSERT INTO Ecom_platform.Product (title, weight, brand, description, Variant_attribute_type_1, Variant_attribute_type_2)
VALUES
  ('Science Lab Kit - Chemistry Edition', '420g', 'LearnTech', 'Discover the wonders of chemistry with this science lab kit. It includes experiments, chemicals, and safety equipment for young scientists.', 'Age Range', 'Experiment Type'),
  ('Robotic Building Kit - STEM Explorer', '480g', 'Robotics Unlimited', 'Build your own robots with this STEM robotic kit. Its a fun and educational way to learn about engineering and programming.', 'Age Range', 'Robot Type'),
  ('Math Puzzles Set - Number Cruncher', '360g', 'Math Wizards', 'Solve mathematical puzzles and challenges with this set. Its a great way to improve math skills in a fun and engaging way.', 'Age Range', 'Puzzle Type'),
  ('Geography Explorer Globe', '500g', 'GeoDiscover', 'Explore the world with this interactive globe. It provides information about countries, landmarks, and geography in an engaging manner.', 'Age Range', 'Geography Type'),
  ('Solar System Planetarium Kit', '400g', 'AstroKids', 'Learn about the solar system and astronomy with this planetarium kit. It includes models and educational materials for aspiring astronomers.', 'Age Range', 'Astronomy Type');


==============   Variants ===============================================

-- Action Figures Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (56, 'Red Racer', 'Small', '9.99', 'TC001-RedRacerSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/111.jpg?alt=media&token=5238bf0b-5640-446f-b75a-15feecf7918a&_gl=1*1ndk6t7*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjAuMTY5ODc0Njc2Ny42MC4wLjA.'),
  (56, 'Red Racer', 'Large', '14.99', 'TC002-RedRacerLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/112.jpg?alt=media&token=c93a8cd8-7769-4b44-96ba-a740acca12f1&_gl=1*1pi0i8x*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njc3NC41My4wLjA.'),
  (57, 'Blue Cruiser', 'Small', '10.99', 'TC003-BlueCruiserSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/113.jpg?alt=media&token=6108f7d7-7526-448e-aa77-1bf6227fef33&_gl=1*lukne1*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njc4MC40Ny4wLjA.'),
  (57, 'Blue Cruiser', 'Large', '15.99', 'TC004-BlueCruiserLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/114.jpg?alt=media&token=2410efbc-4ac3-4c36-b00c-1891d03d0f2a&_gl=1*1rf4xrl*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgyNi4xLjAuMA..');
  (58, 'Safari Adventure', 'Small', '12.99', 'TJ001-SafariSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/115.jpg?alt=media&token=3fae24c2-0b13-4dcb-be3b-4aea73849216&_gl=1*wzcg75*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzMS42MC4wLjA.'),
  (58, 'Safari Adventure', 'Large', '17.99', 'TJ002-SafariLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/116.jpg?alt=media&token=289326d5-30f3-4281-af11-15e8f43045a8&_gl=1*5qbgn4*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzNC41Ny4wLjA.');
  (59, 'Rescue Chopper', 'Small', '11.99', 'TH001-RescueSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/117.jpg?alt=media&token=218c71fd-8f7d-4471-baa2-0514edf9bd85&_gl=1*1me1z7o*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NjgzNy41NC4wLjA.'),
  (59, 'Rescue Chopper', 'Large', '16.99', 'TH002-RescueLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/118.jpg?alt=media&token=c4cb5748-3238-40fc-aa4a-aad677ad9bc3&_gl=1*1jmsxmx*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg0MS41MC4wLjA.'),
  (60, 'Police Pursuit', 'Small', '12.99', 'TH003-PoliceSmall', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/119.jpg?alt=media&token=362731b1-390c-4520-af0a-61786b7912ee&_gl=1*12ttxsf*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg0Ni40NS4wLjA.'),
  (60, 'Police Pursuit', 'Large', '17.99', 'TH004-PoliceLarge', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/120.jpg?alt=media&token=24bc866a-df3a-4572-bbbf-e0f147609875&_gl=1*v0heew*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njg1My4zOC4wLjA.');
  
-- Board Games Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (61, 'Laser Shooter', 'Red', '7.99', 'TW001-LaserRed', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/121.jpg?alt=media&token=c6d4fd51-77f6-463e-bd80-875f3942518d&_gl=1*13dibzu*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk0OC42MC4wLjA.'),
  (61, 'Laser Shooter', 'Blue', '7.99', 'TW002-LaserBlue', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/122.jpg?alt=media&token=ca91662c-cb4a-45a1-9726-59844067f9b6&_gl=1*1b67pj*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1Mi41Ni4wLjA.'),
  (62, 'Knight\'s Weapon', 'Silver', '9.99', 'TW003-SwordSilver', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/123.jpg?alt=media&token=314a57d8-5bd3-45b6-9923-1aeadb8b1088&_gl=1*1ydqx04*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1Ni41Mi4wLjA.'),
  (62, 'Knight\'s Weapon', 'Gold', '9.99', 'TW004-SwordGold', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/124.jpg?alt=media&token=74a45fc3-8608-4a7d-8e03-79eab85a8acc&_gl=1*1w4ersx*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk1OS40OS4wLjA.');
  (63, 'Dinosaur World', '2-5 Players', '32.99', 'BG005-DinosaurWorld', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/125.jpg?alt=media&token=cea8a379-acc1-4f9c-9522-0a361fc91ddc&_gl=1*3l3o4d*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk2My40NS4wLjA.'),
  (63, 'Dinosaur World', '2-5 Players', '37.99', 'BG006-DinosaurWorld', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/126.jpg?alt=media&token=e1147672-ad23-4cdd-a194-3be85e5fabcb&_gl=1*1i6fvnb*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk2OC40MC4wLjA.'),
  (64, 'Pirates Treasure', '2-4 Players', '28.99', 'BG007-PiratesTreasure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/127.jpg?alt=media&token=f3bf9cf2-d8a5-4b3b-ae0b-64b8d0e8ab39&_gl=1*fkrl06*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3Mi4zNi4wLjA.'),
  (64, 'Pirates Treasure', '2-4 Players', '33.99', 'BG008-PiratesTreasure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/128.jpg?alt=media&token=dc352ee6-aba6-4dcc-a90b-10f4d625821d&_gl=1*u0ehqr*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3NS4zMy4wLjA.'),
  (65, 'Fantasy Quest', '2-6 Players', '31.99', 'BG009-FantasyQuest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/129.jpg?alt=media&token=d019933d-2159-42f8-b679-06c66971980d&_gl=1*1scibti*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk3OS4yOS4wLjA.'),
  (65, 'Fantasy Quest', '2-6 Players', '36.99', 'BG010-FantasyQuest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/130.jpg?alt=media&token=68927ad1-1f85-44a8-879a-8c7ef1c170f2&_gl=1*1bcmbe*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0Njk4NC4yNC4wLjA.');
  
-- Dolls Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '9.99', 'DL001-FashionModelSummer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/131.jpg?alt=media&token=b6cccf3b-4d4f-402b-aa2a-32abbd0a942b&_gl=1*17r8mik*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzEzMi42MC4wLjA.'),
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '11.99', 'DL002-FashionModelSummer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/132.jpg?alt=media&token=2c859400-18e3-4db6-b876-c4425ff60f82&_gl=1*350b4w*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE0NS40Ny4wLjA.'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '11.99', 'DL003-PrincessRoyalGown', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/133.jpg?alt=media&token=0a8fa059-0d94-4eda-9053-c85784faec3c&_gl=1*1s3cyr7*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE1MC40Mi4wLjA.'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '13.99', 'DL004-PrincessRoyalGown', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/134.jpg?alt=media&token=e3695e31-2fca-4b5d-99cc-7d30a260ca76&_gl=1*1vhbzud*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE1NC4zOC4wLjA.'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '10.99', 'DL005-MermaidAdventure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/135.jpg?alt=media&token=350af85c-715e-4455-9f57-5ee094d14b90&_gl=1*1di8inn*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE2MS4zMS4wLjA.'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '12.99', 'DL006-MermaidAdventure', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/136.jpg?alt=media&token=6be9c93a-c205-4360-a68b-3e9dba6feca1&_gl=1*1vuy678*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE3MC4yMi4wLjA.'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '12.99', 'DL007-PopStarSensation', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/137.jpg?alt=media&token=e927f4f8-545d-4adb-ac9b-19ef342aeaba&_gl=1*1mrr835*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE3NS4xNy4wLjA.'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '14.99', 'DL008-PopStarSensation', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/138.jpg?alt=media&token=dd2da737-63f2-4eb4-8010-3b337c0ae2e0&_gl=1*1xjftb9*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE4MC4xMi4wLjA.'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '8.99', 'DL009-FairyTaleForest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/139.jpg?alt=media&token=9e532c7d-254d-42ec-9053-9a26dca147ca&_gl=1*1l22i8p*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE4NS43LjAuMA..'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '10.99', 'DL010-FairyTaleForest', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/140.jpg?alt=media&token=d0090b1f-57e9-4e62-9ecb-a839067b7fe3&_gl=1*rlfhrs*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzE5Mi42MC4wLjA.');

-- Remote Control Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (71, 'Racing Car - Speedster', '2.4GHz', '29.99', 'RC001-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/141.jpg?alt=media&token=b5cf3c8e-078f-4d09-8056-37d531b431c2&_gl=1*1tn3qj3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzI5OS42MC4wLjA.'),
  (71, 'Racing Car - Speedster', '2.4GHz', '31.99', 'RC002-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/142.jpg?alt=media&token=8e88e206-792b-4410-8f74-361c58023693&_gl=1*yg7x70*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMwMy41Ni4wLjA.'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '39.99', 'RC003-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/143.jpg?alt=media&token=8327ad29-eaee-49aa-a867-664bbca52336&_gl=1*1o0hph0*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMwOC41MS4wLjA.'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '41.99', 'RC004-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/144.jpg?alt=media&token=13e7f052-edaa-4bdf-9d2a-6402335af375&_gl=1*l4hxa2*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMxMy40Ni4wLjA.'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '35.99', 'RC005-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/145.jpg?alt=media&token=598d2c0b-0851-4d3f-955c-941e3dcc9218&_gl=1*1sfwt36*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMxOC40MS4wLjA.'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '37.99', 'RC006-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/146.jpg?alt=media&token=70d003ed-86d8-4935-8262-a68bee514374&_gl=1*z2qkwu*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMyOC4zMS4wLjA.'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '49.99', 'RC007-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/147.jpg?alt=media&token=af53194a-c881-496a-9f2c-966cecd4808f&_gl=1*1xeyt79*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzMzOC4yMS4wLjA.'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '51.99', 'RC008-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/148.jpg?alt=media&token=36c4b4a3-bc2d-4e33-be6f-062483cfbde6&_gl=1*fj1e28*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM0Ny4xMi4wLjA.'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '45.99', 'RC009-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/149.jpg?alt=media&token=79c8dc7d-7fa8-414e-b0b5-63c777b5337d&_gl=1*siydti*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM2MC42MC4wLjA.'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '47.99', 'RC010-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/150.jpg?alt=media&token=7ec06a6f-3b0c-4ac1-958e-3daa332fe5d6&_gl=1*1hxksmr*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzM2Ni41NC4wLjA.');
  
  -- Educational Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '39.99', 'ET001-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/151.jpg?alt=media&token=e4bca776-9789-4184-a919-ef67d2117735&_gl=1*bsl132*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ2Mi42MC4wLjA.'),
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '42.99', 'ET002-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/152.jpg?alt=media&token=39fb2425-78c1-4fcb-b081-d80d21e07bb6&_gl=1*5z7vis*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ2OC41NC4wLjA.'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '49.99', 'ET003-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/153.jpg?alt=media&token=7b4ab2a1-d72e-4295-9b88-3c4bb668d9ee&_gl=1*11ukq5f*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ3NC40OC4wLjA.'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '52.99', 'ET004-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/154.jpg?alt=media&token=12cc7e0e-416f-4b23-8693-9fccd23544fd&_gl=1*10lp50z*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ3OS40My4wLjA.'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '19.99', 'ET005-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/155.jpg?alt=media&token=c5108bb4-b0cf-4828-b7e1-c679ddc52cf0&_gl=1*1l88szb*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ4NC4zOC4wLjA.'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '21.99', 'ET006-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/156.jpg?alt=media&token=16cccd9c-2d82-4ea0-81fa-5a3e2efe06ac&_gl=1*1udz7ay*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ5MS4zMS4wLjA.'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '24.99', 'ET007-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/157.jpg?alt=media&token=5c63ca88-dfb5-4698-ab37-52b20a527c2c&_gl=1*yrxb0m*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzQ5OC4yNC4wLjA.'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '26.99', 'ET008-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/158.jpg?alt=media&token=86011faf-920c-4be0-bf1b-2591fc8a97a8&_gl=1*1x6svv3*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUwNC4xOC4wLjA.'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '29.99', 'ET009-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/159.jpg?alt=media&token=501388c1-14e0-43d8-80eb-d5100a5955a7&_gl=1*104solm*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUwOS4xMy4wLjA.'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '31.99', 'ET010-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/160.jpg?alt=media&token=e46c2423-0b23-45ae-b701-f87df8fb4495&_gl=1*1everx5*_ga*Nzk0MzkyMTY2LjE2OTgxMzI1MTY.*_ga_CW55HF8NVT*MTY5ODc0Njc2Ny41LjEuMTY5ODc0NzUxNS43LjAuMA..');
