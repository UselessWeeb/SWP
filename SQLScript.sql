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
  avatar NVARCHAR(100) NOT NULL,
  full_name NVARCHAR(100) NOT NULL,
  gender NVARCHAR(100) NOT NULL,
  address NVARCHAR(MAX) NOT NULL,
  email NVARCHAR(100) NOT NULL UNIQUE,
  phone_number NVARCHAR(20) NOT NULL UNIQUE,
  password NVARCHAR(100) NOT NULL,
  state NVARCHAR(100) NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES [Role]
);
GO

CREATE TABLE Laptop
(
  laptop_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  title VARCHAR(200) NOT NULL,
  main_image VARCHAR(200) NOT NULL,
  original_price FLOAT NOT NULL,
  stock INT NOT NULL,
  products_detail VARCHAR(MAX) NOT NULL,
  sale_price FLOAT NOT NULL,
  brief_information NVARCHAR(50) NOT NULL,
  is_featured INT NOT NULL,
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


CREATE TABLE Order_User(
	order_uid INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fullname NVARCHAR(MAX),
	address NVARCHAR(MAX),
	phone_number NVARCHAR(50),
	email NVARCHAR(MAX),
	add_info NVARCHAR(MAX),
)

CREATE TABLE [Order]
(
  order_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  order_date DATETIME NOT NULL,  
  status INT NOT NULL,
  price FLOAT NOT NULL,
  order_uid INT NOT NULL,  
  FOREIGN KEY (order_uid) REFERENCES [Order_User],  
);
GO

CREATE TABLE Order_Item
(
  order_item_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  order_id INT NOT NULL,
  laptop_id INT NOT NULL,
  quantity INT NOT NULL,
  price FLOAT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES [Order](order_id),
  FOREIGN KEY (laptop_id) REFERENCES [Laptop](laptop_id)
);


CREATE TABLE Order_Information
(
  information_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  order_id INT NOT NULL,
  payment_method NVARCHAR(100) NOT NULL,
  state INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES [Order]
);
GO

CREATE TABLE Token
(
  userid INT NOT NULL,
  tokenString VARCHAR(64) NOT NULL PRIMARY KEY,
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
  blog_content VARCHAR(MAX) NOT NULL,
  views INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User]
);
GO

CREATE TABLE Blog_Category(
	CBlog INT NOT NULL IDENTITY(1,1),
	blog_id INT NOT NULL,
	Category NVARCHAR(100),
	FOREIGN KEY (blog_id) REFERENCES [Blog]
);

CREATE TABLE Slider
(
  slider_id INT NOT NULL IDENTITY(1,1),
  title VARCHAR(100) NOT NULL,
  images VARCHAR(200) NOT NULL,
  details VARCHAR (200) NOT NULL,
  backlink VARCHAR(200) NOT NULL,
  status INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (slider_id),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE Carts (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE cart_items (
    item_id INT IDENTITY(1,1)  PRIMARY KEY,
    cart_id INT NOT NULL,
    laptop_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES Carts(cart_id),
    FOREIGN KEY (laptop_id) REFERENCES [Laptop](laptop_id)
);

CREATE TABLE Score
(
  score_id INT NOT NULL IDENTITY(1,1),
  score INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (score_id),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

ALTER TABLE [Order] add sales_id INT

--create table for user authorization
create table [User_Authorization](
	auth_id int primary key identity(1,1),
	url NVARCHAR(MAX),
	role_id int 
	FOREIGN KEY (role_id) REFERENCES Role(role_id),
)

create table hiddenUrl(
	urlid int primary key identity(1,1),
	url NVARCHAR(MAX)
)

alter table Order_User add Gender nvarchar(10)
Select * from [Order]
ALTER TABLE [Order]
ALTER COLUMN status NVARCHAR(200)
UPDATE [Order] SET status = '0' WHERE status = 'Submitted';
UPDATE [Order] SET status = '1' WHERE status = 'Pending';
UPDATE [Order] SET status = '2' WHERE status = 'Delivering';
UPDATE [Order] SET status = '3' WHERE status = 'Received';

SELECT TOP 1 user_id as sales_id, COUNT([Order].order_id) FROM [User] JOIN [Order] ON [User].user_id = [Order].sales_id GROUP BY [User].user_id ORDER BY COUNT([Order].order_id) ASC

select * from Order_User
select * from [Order]
INSERT INTO [Order] (order_date, price, status, order_uid, sales_id) VALUES (getDATE(), 100, 1, 6, 4)
SELECT * FROM dbo.Order_User
update [Order_User] set gender = 'Male'
select * from Laptop