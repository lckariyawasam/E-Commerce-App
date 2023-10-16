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
  (27, 'Registered', 'Oliver', 'Lee', 'oliver.l@example27.com', 'hashed_password', '+1234567890', '890 Birch St', 'Paris', 'Île-de-France', '75001', 'France');
  
  
  -- Insert more data for Users with Randomized Domain Names and All Address Fields NOT NULL
INSERT INTO Ecom_platform.User (user_id, user_type, first_name, last_name, email, password_hash, phone_number, address_line01, address_city, address_state, address_zip_code, address_country)
VALUES
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
  (45, 'Registered', 'Lucas', 'Martinez', 'lucas.m@example45.com', 'hashed_password', '+1234567890', '456 Oak St', 'Paris', 'Île-de-France', '75001', 'France')
