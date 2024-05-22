USE [master];
GO

DROP DATABASE IF EXISTS LaptopShop;
GO

CREATE DATABASE LaptopShop;
GO

USE LaptopShop;
GO

CREATE TABLE Role
(
  role_id INT NOT NULL IDENTITY(1,1),
  role_purpose VARCHAR(200) NOT NULL,
  PRIMARY KEY (role_id),
);

CREATE TABLE [User]
(
  user_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  avatar VARCHAR(100) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  gender VARCHAR(100) NOT NULL,
  address VARCHAR(MAX) NOT NULL,
<<<<<<< HEAD
<<<<<<< HEAD
  email VARCHAR(100) NOT NULL UNIQUE,
  phone_number VARCHAR(20) NOT NULL UNIQUE,
=======
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
>>>>>>> c770540 (Update full model and function EditProfile)
=======
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
  password VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES [Role]
);
GO

CREATE TABLE Laptop
(
  laptop_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  title VARCHAR(200) NOT NULL,
<<<<<<< HEAD
<<<<<<< HEAD
  main_image VARCHAR(200) NOT NULL,
  original_price FLOAT NOT NULL,
  stock INT NOT NULL,
  products_detail VARCHAR(MAX) NOT NULL,
  sale_price FLOAT NOT NULL,
  status INT NOT NULL,
  updated_date DATETIME NOT NULL,
);
GO

CREATE TABLE Laptop_Category(
	CLaptop INT NOT NULL IDENTITY(1,1),
	laptop_id INT NOT NULL,
	Category NVARCHAR(100),
	FOREIGN KEY (laptop_id) REFERENCES [Laptop]
)

CREATE TABLE Laptop_Image(
	ILaptop INT NOT NULL IDENTITY(1,1),
	laptop_id INT NOT NULL,
	Image NVARCHAR(100),
	FOREIGN KEY (laptop_id) REFERENCES [Laptop]
)

=======
=======
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
  category VARCHAR(200) NOT NULL,
  image VARCHAR(MAX) NOT NULL,
  original_price FLOAT NOT NULL,
  products_detail VARCHAR(MAX) NOT NULL,
  sale_price FLOAT NOT NULL,
  status INT NOT NULL,
);
GO

<<<<<<< HEAD
>>>>>>> c770540 (Update full model and function EditProfile)
=======
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
CREATE TABLE Order_Information
(
  information_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User]
);
GO

CREATE TABLE [Order]
(
  order_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  order_date DATETIME NOT NULL,
  order_name VARCHAR(100) NOT NULL,
  total_price FLOAT NOT NULL,
  status INT NOT NULL,
  quantity INT NOT NULL,
  user_id INT NOT NULL,
  laptop_id INT NOT NULL,
  information_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User],
  FOREIGN KEY (laptop_id) REFERENCES [Laptop],
  FOREIGN KEY (information_id) REFERENCES Order_Information(information_id)
);
GO

CREATE TABLE Cart
(
  cart_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  title VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL,
  quantity INT NOT NULL,
  total_cost FLOAT NOT NULL,
  user_id INT NOT NULL,
  order_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User],
  FOREIGN KEY (order_id) REFERENCES [Order]
);
GO

<<<<<<< HEAD
<<<<<<< HEAD
CREATE TABLE Token
(
  userid INT NOT NULL,
  tokenString VARCHAR(64) NOT NULL PRIMARY KEY,
=======
=======
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
CREATE TABLE token
(
  token_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  userid INT NOT NULL,
  tokenString VARCHAR(64) NOT NULL,
<<<<<<< HEAD
>>>>>>> c770540 (Update full model and function EditProfile)
=======
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
  expireDate DATETIME NOT NULL,
  purpose INT NOT NULL
);
GO

CREATE TABLE Feedback
(
  feedback_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  user_id INT NOT NULL,
  order_id INT NOT NULL,
  rated_star FLOAT NOT NULL,
  feedback VARCHAR(MAX) NOT NULL,
  images VARCHAR(MAX) NOT NULL,
  status INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User],
  FOREIGN KEY (order_id) REFERENCES [Order]
);
GO

CREATE TABLE Blog
(
  blog_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  thumbnail VARCHAR(200) NOT NULL,
  title VARCHAR(200) NOT NULL,
  updated_date DATETIME NOT NULL,
<<<<<<< HEAD
<<<<<<< HEAD
  blog_content VARCHAR(MAX) NOT NULL,
  is_featured INT NOT NULL,
=======
  category VARCHAR(200) NOT NULL,
  blog_content VARCHAR(MAX) NOT NULL,
>>>>>>> c770540 (Update full model and function EditProfile)
=======
  category VARCHAR(200) NOT NULL,
  blog_content VARCHAR(MAX) NOT NULL,
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User]
);
GO

<<<<<<< HEAD
<<<<<<< HEAD
CREATE TABLE Blog_Category(
	CBlog INT NOT NULL IDENTITY(1,1),
	blog_id INT NOT NULL,
	Category NVARCHAR(100),
	FOREIGN KEY (blog_id) REFERENCES [Blog]
)

CREATE TABLE Post(
	post_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	post_header VARCHAR(200) NOT NULL,
	post_content VARCHAR(MAX) NOT NULL,
	thumbnail VARCHAR(200) NOT NULL,
	is_featured INT NOT NULL,
	info VARCHAR(200) NOT NULL,
	status INT NOT NULL,
	user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES [User]
)

CREATE TABLE Post_Category(
	CPost INT NOT NULL IDENTITY(1,1),
	post_id INT NOT NULL,
	Category NVARCHAR(100),
	FOREIGN KEY (post_id) REFERENCES [Post]
)

=======
>>>>>>> c770540 (Update full model and function EditProfile)
=======
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
CREATE TABLE Slider
(
  slider_id INT NOT NULL IDENTITY(1,1),
  title VARCHAR(100) NOT NULL,
<<<<<<< HEAD
<<<<<<< HEAD
  images VARCHAR(200) NOT NULL,
  details VARCHAR (200) NOT NULL,
=======
  images VARCHAR(MAX) NOT NULL,
>>>>>>> c770540 (Update full model and function EditProfile)
=======
  images VARCHAR(MAX) NOT NULL,
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
  backlink VARCHAR(200) NOT NULL,
  status INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (slider_id),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE Score
(
  score_id INT NOT NULL IDENTITY(1,1),
  score INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (score_id),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
<<<<<<< HEAD
<<<<<<< HEAD
);

SELECT * FROM Blog ORDER BY updated_date
=======
);
>>>>>>> c770540 (Update full model and function EditProfile)
=======
);
>>>>>>> ca7366867f7578dad7e9bab6c27a7c2997e50b16
