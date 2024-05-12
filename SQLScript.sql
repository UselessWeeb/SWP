CREATE DATABASE FruitShop;


Use [FruitShop];

CREATE TABLE fruit
(
  idFruit INT NOT NULL,
  name NVARCHAR(150) NOT NULL,
  date DATETIME NOT NULL,
  origin NVARCHAR(250) NOT NULL,
  number INT NOT NULL,
  giaGoc INT NOT NULL,
  status INT NOT NULL,
  description NVARCHAR(MAX) NOT NULL,
  phanLoai NVARCHAR(250) NOT NULL,
  image NVARCHAR(250) NOT NULL,
  PRIMARY KEY (idFruit)
);

CREATE TABLE [user]
(
  idUser INT NOT NULL,
  fullName NVARCHAR(250) NOT NULL,
  email NVARCHAR(250) NOT NULL,
  diaChi NVARCHAR(250) NOT NULL,
  phoneNum NVARCHAR(15) NOT NULL,
  role INT NOT NULL,
  gender NVARCHAR(50) NOT NULL,
  point INT NOT NULL,
  PRIMARY KEY (idUser),
);

CREATE TABLE [order]
(
  orderID INT NOT NULL,
  idUser INT NOT NULL,
  idFruit INT NOT NULL,
  num INT NOT NULL,
  status INT NOT NULL,
  totalPrice INT NOT NULL,
  diaChi NVARCHAR(250) NOT NULL,
  phoneNum NVARCHAR(15) NOT NULL,
  orderDate DATETIME NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (idUser) REFERENCES [user],
  FOREIGN KEY (idFruit) REFERENCES fruit(idFruit)
);

CREATE TABLE cart
(
  idUser INT NOT NULL,
  idCart INT NOT NULL,
  date DATETIME NOT NULL,
  totalPrice INT NOT NULL,
  orderID INT NOT NULL,
  PRIMARY KEY (idCart),
  FOREIGN KEY (idUser) REFERENCES [user]
);

CREATE TABLE orderDetail
(
  orderID INT NOT NULL,
  HoaDon INT NOT NULL,
  Price INT NOT NULL,
  number INT NOT NULL,
  quality INT NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (orderID) REFERENCES [order]
);

CREATE TABLE Refund
(
  orderID INT NOT NULL,
  idRefund INT NOT NULL,
  PRIMARY KEY (idRefund),
  FOREIGN KEY (orderID) REFERENCES [order]
);

CREATE TABLE Feedback
(
  idUser INT NOT NULL,
  idFruit INT NOT NULL,
  orderID INT NOT NULL,
  description NVARCHAR(MAX) NOT NULL,
  feedbackID INT NOT NULL,
  PRIMARY KEY (feedbackID),
  FOREIGN KEY (idUser) REFERENCES [user],
  FOREIGN KEY (idFruit) REFERENCES fruit(idFruit),
  FOREIGN KEY (orderID) REFERENCES [order]
);

CREATE TABLE Blog
(
  idBlog INT NOT NULL,
  idUser INT NOT NULL,
  header NVARCHAR(250) NOT NULL,
  description NVARCHAR(MAX) NOT NULL,
  date DATETIME NOT NULL,
  status INT NOT NULL,
  PRIMARY KEY (idBlog),
  FOREIGN KEY (idUser) REFERENCES [user]
);
