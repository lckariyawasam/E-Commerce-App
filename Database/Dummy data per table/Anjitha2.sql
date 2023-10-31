
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
  (56, 'Red Racer', 'Small', '9.99', 'TC001-RedRacerSmall', ''),
  (56, 'Red Racer', 'Large', '14.99', 'TC002-RedRacerLarge', ''),
  (57, 'Blue Cruiser', 'Small', '10.99', 'TC003-BlueCruiserSmall', ''),
  (57, 'Blue Cruiser', 'Large', '15.99', 'TC004-BlueCruiserLarge', '');
  (58, 'Safari Adventure', 'Small', '12.99', 'TJ001-SafariSmall', ''),
  (58, 'Safari Adventure', 'Large', '17.99', 'TJ002-SafariLarge', '');
  (59, 'Rescue Chopper', 'Small', '11.99', 'TH001-RescueSmall', ''),
  (59, 'Rescue Chopper', 'Large', '16.99', 'TH002-RescueLarge', ''),
  (60, 'Police Pursuit', 'Small', '12.99', 'TH003-PoliceSmall', ''),
  (60, 'Police Pursuit', 'Large', '17.99', 'TH004-PoliceLarge', '');
  
-- Board Games Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (61, 'Laser Shooter', 'Red', '7.99', 'TW001-LaserRed', ''),
  (61, 'Laser Shooter', 'Blue', '7.99', 'TW002-LaserBlue', ''),
  (62, 'Knight\'s Weapon', 'Silver', '9.99', 'TW003-SwordSilver', ''),
  (62, 'Knight\'s Weapon', 'Gold', '9.99', 'TW004-SwordGold', '');
  (63, 'Dinosaur World', '2-5 Players', '32.99', 'BG005-DinosaurWorld', ''),
  (63, 'Dinosaur World', '2-5 Players', '37.99', 'BG006-DinosaurWorld', ''),
  (64, 'Pirates Treasure', '2-4 Players', '28.99', 'BG007-PiratesTreasure', ''),
  (64, 'Pirates Treasure', '2-4 Players', '33.99', 'BG008-PiratesTreasure', ''),
  (65, 'Fantasy Quest', '2-6 Players', '31.99', 'BG009-FantasyQuest', ''),
  (65, 'Fantasy Quest', '2-6 Players', '36.99', 'BG010-FantasyQuest', '');
  
-- Dolls Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '9.99', 'DL001-FashionModelSummer', 'a*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (66, 'Fashion Model - Summer Style', 'Accessory Set', '11.99', 'DL002-FashionModelSummer', '_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '11.99', 'DL003-PrincessRoyalGown', 'A1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (67, 'Princess - Royal Gown', 'Accessory Set', '13.99', 'DL004-PrincessRoyalGown', 'htt1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '10.99', 'DL005-MermaidAdventure', 'http*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (68, 'Mermaid - Underwater Adventure', 'Accessory Set', '12.99', 'DL006-MermaidAdventure', 'htt_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '12.99', 'DL007-PopStarSensation', 'httOTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (69, 'Pop Star - Stage Sensation', 'Accessory Set', '14.99', 'DL008-PopStarSensation', 'httga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '8.99', 'DL009-FairyTaleForest', 'htt_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (70, 'Fairy Tale - Enchanted Forest', 'Accessory Set', '10.99', 'DL010-FairyTaleForest', 'httpsa*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w');

-- Remote Control Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (71, 'Racing Car - Speedster', '2.4GHz', '29.99', 'RC001-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (71, 'Racing Car - Speedster', '2.4GHz', '31.99', 'RC002-RacingCarSpeedster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '39.99', 'RC003-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (72, 'Helicopter - Sky Master', '2.4GHz', '41.99', 'RC004-HelicopterSkyMaster', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '35.99', 'RC005-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (73, 'Boat - Aquatic Voyager', '2.4GHz', '37.99', 'RC006-BoatAquaticVoyager', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '49.99', 'RC007-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (74, 'Drone - Aerial Explorer', '2.4GHz', '51.99', 'RC008-DroneAerialExplorer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '45.99', 'RC009-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (75, 'Monster Truck - Off-Road Racer', '2.4GHz', '47.99', 'RC010-MonsterTruckRacer', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w');
  
  -- Educational Toys Variants
INSERT INTO Ecom_platform.Variant (Product_id, variant_attribute_value_1, variant_attribute_value_2, price, sku, icon)
VALUES
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '39.99', 'ET001-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (76, 'Science Lab Kit - Chemistry Edition', 'Ages 8+', '42.99', 'ET002-ScienceLabChemistry', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '49.99', 'ET003-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (77, 'Robotic Building Kit - STEM Explorer', 'Ages 10+', '52.99', 'ET004-RoboticBuildingSTEM', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '19.99', 'ET005-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (78, 'Math Puzzles Set - Number Cruncher', 'Ages 6+', '21.99', 'ET006-MathPuzzlesNumberCruncher', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '24.99', 'ET007-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (79, 'Geography Explorer Globe', 'Ages 7+', '26.99', 'ET008-GeographyExplorerGlobe', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '29.99', 'ET009-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w'),
  (80, 'Solar System Planetarium Kit', 'Ages 9+', '31.99', 'ET010-SolarSystemPlanetarium', 'https://firebasestorage.googleapis.com/v0/b/ecomproject-7cfba.appspot.com/o/0.png?alt=media&token=94d5c16a-ee74-42b7-93e7-535d4b725dc2&_gl=1*1i1s1k2*_ga*OTA1NDY0ODY3LjE2OTc3MjM2Mzc.*_ga_CW55HF8NVT*MTY5ODM3OTc5Ni4xMC4xLjE2OTgzNzk5MTQuNjAuMC4w');
