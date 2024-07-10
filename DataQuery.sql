USE LaptopShop;
GO

-- Insert into Role
INSERT INTO [Role] (role_purpose) VALUES 
('admin'), 
('sale_manager'), 
('marketing'), 
('sale'),  
('customer'), 
('guest');
GO

-- Insert into User
INSERT INTO [User] (avatar, full_name, gender, address, email, phone_number, password, state, role_id) VALUES
('avatar1.png', 'John Doe', 'Male', '123 Main St', 'john@example.com', '1234567890', CONVERT(VARCHAR(32), HashBytes('MD5', 'password1'), 2), 'active', 1),
('avatar2.png', 'Jane Smith', 'Female', '456 Oak St', 'jane@example.com', '0987654321', CONVERT(VARCHAR(32), HashBytes('MD5', 'password2'), 2), 'active', 2),
('avatar3.png', 'Bob Johnson', 'Male', '789 Pine St', 'bob@example.com', '5555555555', CONVERT(VARCHAR(32), HashBytes('MD5', 'password3'), 2), 'active', 3),
('avatar3.png', 'Bob Johnson', 'Male', '789 Pine St', 'v123@gmail.com', '5555555555', CONVERT(VARCHAR(32), HashBytes('MD5', '1234'), 2), 'active', 2);
GO

-- Insert into Laptop
INSERT INTO Laptop (title, main_image, original_price, stock, products_detail, sale_price, brief_information, is_featured, status, updated_date) VALUES
('Asus Vivobook OLED 2020', 'images/product/Asus/Asus1.jpg', 1000.00, 50, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i5-1135G7</td></tr><tr><td>RAM</td><td>8GB DDR4</td></tr><tr><td>Storage</td><td>512GB SSD</td></tr><tr><td>Display</td><td>14" FHD OLED</td></tr></table>', 900.00, 'The laptop of the future with an OLED display for stunning visuals.', 1, 1, GETDATE()),
('Asus Vivobook 2018', 'images/product/Asus/Asus2.jpg', 1200.00, 30, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-8550U</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB HDD</td></tr><tr><td>Display</td><td>15.6" FHD</td></tr></table>', 1100.00, 'Reliable performance for everyday tasks.', 1, 1, GETDATE()),
('Dell Inspiron 2020', 'images/product/Dell/Dell1.jpg', 1500.00, 20, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-10750H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>512GB SSD</td></tr><tr><td>Display</td><td>15.6" FHD</td></tr></table>', 1400.00, 'Thin, yet unbreakable.', 1, 1, GETDATE()),
('Lenovo Thinkpad 2024', 'images/product/Lenovo/Lenovo1.jpg', 1800.00, 10, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-1260P</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>14" FHD</td></tr></table>', 1700.00, 'The ultimate business laptop.', 1, 1, GETDATE()),
('Dell Precision 2021', 'images/product/Dell/Dell2.png', 2000.00, 15, '<table class="product-detail"><tr><td>Processor</td><td>Intel Xeon W-10855M</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>15.6" 4K UHD</td></tr></table>', 1900.00, 'A powerful workstation for demanding tasks.', 1, 1, GETDATE()),
('Lenovo Gaming 2020', 'images/product/Lenovo/Lenovo2.jpg', 2200.00, 5, '<table class="product-detail"><tr><td>Processor</td><td>AMD Ryzen 7 4800H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>15.6" FHD 144Hz</td></tr></table>', 2100.00, 'A powerful gaming laptop with high refresh rate display.', 1, 1, GETDATE()),
('Asus Vivobook 2023', 'images/product/Asus/Asus3.jpg', 2500.00, 25, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-11900H</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>16" FHD OLED</td></tr></table>', 2400.00, 'A premium laptop for professionals.', 1, 1, GETDATE()),
('Asus Expertbook 2024', 'images/product/Asus/Asus4.jpg', 2800.00, 12, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-13700H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>14" FHD</td></tr></table>', 2700.00, 'An expert"s choice for business and productivity.', 1, 1, GETDATE()),
('Dell Notebook 2023', 'images/product/Dell/Dell3.jpg', 3000.00, 18, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-11980HK</td></tr><tr><td>RAM</td><td>64GB DDR4</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>17" 4K UHD</td></tr></table>', 2900.00, 'A high-end notebook with top-tier specifications.', 1, 1, GETDATE()),
('Lenovo Ultrabook 2024', 'images/product/Lenovo/Lenovo3.jpg', 3200.00, 22, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-1260P</td></tr><tr><td>RAM</td><td>32GB LPDDR4X</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>13.3" FHD</td></tr></table>', 3100.00, 'A lightweight yet powerful ultrabook.', 1, 1, GETDATE()),
('Dell Notebook 2024', 'images/product/Dell/Dell4.jpg', 3400.00, 14, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-12900HK</td></tr><tr><td>RAM</td><td>64GB DDR5</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>17" 4K UHD</td></tr></table>', 3300.00, 'Top-of-the-line notebook for professionals.', 1, 1, GETDATE()),

GO

-- Insert into Laptop_Category
INSERT INTO Laptop_Category (laptop_id, category) VALUES
(1, 'Business'),
(2, 'Everyday Use'),
(3, 'High Performance'),
(4, 'Business'),
(5, 'Workstation'),
(6, 'Gaming'),
(7, 'Business'),
(8, 'Business'),
(9, 'High Performance'),
(10, 'Business'),
(11, 'High Performance');
GO

-- Insert into Laptop_Image
INSERT INTO Laptop_Image (laptop_id, Image) VALUES
(1, 'images/1_1.jpg'),
(1, 'images/1_2.jpg'),
(2, 'images/2_1.jpg'),
(2, 'images/2_2.jpg'),
(3, 'images/3_1.jpg'),
(3, 'images/3_2.jpg'),
(4, 'images/4_1.jpg'),
(4, 'images/4_2.jpg'),
(5, 'images/5_1.jpg'),
(5, 'images/5_2.jpg'),
(6, 'images/6_1.jpg'),
(6, 'images/6_2.jpg'),
(7, 'images/7_1.jpg'),
(7, 'images/7_2.jpg'),
(8, 'images/8_1.jpg'),
(8, 'images/8_2.jpg'),
(9, 'images/9_1.jpg'),
(9, 'images/9_2.jpg'),
(10, 'images/10_1.jpg'),
(10, 'images/10_2.jpg'),
(11, 'images/11_1.jpg'),
(11, 'images/11_2.jpg'),
(12, 'images/12_1.jpg'),
(12, 'images/12_2.jpg'),
(13, 'images/13_1.jpg'),
(13, 'images/13_2.jpg'),
(14, 'images/14_1.jpg'),
(14, 'images/14_2.jpg'),
(15, 'images/15_1.jpg'),
(15, 'images/15_2.jpg'),
(16, 'images/16_1.jpg'),
(16, 'images/16_2.jpg'),
(17, 'images/17_1.jpg'),
(17, 'images/17_2.jpg'),
(18, 'images/18_1.jpg'),
(18, 'images/18_2.jpg'),
(19, 'images/19_1.jpg'),
(19, 'images/19_2.jpg'),
(20, 'images/20_1.jpg'),
(20, 'images/20_2.jpg');
GO

INSERT INTO Order_User (fullname, address, phone_number, email, add_info) VALUES
('John Doe', '123 Main St', '1234567890', 'john@example.com', 'N/A'),
('Jane Smith', '456 Oak St', '0987654321', 'jane@example.com', 'N/A'),
('Bob Johnson', '789 Pine St', '5555555555', 'bob@example.com', 'N/A'),
('Alice Brown', '321 Elm St', '1231231234', 'alice@example.com', 'N/A'),
('Charlie Davis', '654 Maple St', '9876543210', 'charlie@example.com', 'N/A');
GO

-- Insert into [Order]
INSERT INTO [Order] (order_date, status, price, order_uid) VALUES
(GETDATE() - 30, 2, 900.00, 1),
(GETDATE() - 25, 3, 1100.00, 2),
(GETDATE() - 20, 0, 1400.00, 3),
(GETDATE() - 18, 1, 2000.00, 4),
(GETDATE() - 15, 2, 2200.00, 5),
(GETDATE() - 12, 1, 2500.00, 1),
(GETDATE() - 10, 3, 2800.00, 2),
(GETDATE() - 8, 1, 3000.00, 3),
(GETDATE() - 5, 0, 3200.00, 4),
(GETDATE() - 3, 1, 3500.00, 5),
(GETDATE() - 2, 2, 3800.00, 1),
(GETDATE() - 1, 3, 4000.00, 2);
GO

-- Insert into Order_Item
INSERT INTO Order_Item (order_id, laptop_id, quantity, price) VALUES
(1, 1, 1, 900.00),
(2, 2, 1, 1100.00),
(3, 3, 1, 1400.00),
(4, 4, 1, 2000.00),
(5, 5, 1, 2200.00),
(6, 6, 1, 2500.00),
(7, 7, 1, 2800.00),
(8, 8, 1, 3000.00),
(9, 9, 1, 3200.00),
(10, 10, 1, 3500.00),
(11, 11, 1, 3800.00),
(12, 12, 1, 4000.00);
GO

-- Insert into Order_Information
INSERT INTO Order_Information (order_id, payment_method, state) VALUES
(1, 'Credit Card', 1),
(2, 'PayPal', 1),
(3, 'Credit Card', 1),
(4, 'Credit Card', 1),
(5, 'PayPal', 1),
(6, 'Credit Card', 1),
(7, 'PayPal', 1),
(8, 'Credit Card', 1),
(9, 'Credit Card', 1),
(10, 'PayPal', 1),
(11, 'Credit Card', 1),
(12, 'Credit Card', 1);
GO

-- Insert into Feedback
INSERT INTO Feedback (user_id, order_id, rated_star, feedback, images, status) VALUES
(1, 1, 5, 'Great product!', 'images/feedback1.jpg', 1),
(2, 2, 4, 'Good value for money.', 'images/feedback2.jpg', 1),
(3, 3, 5, 'Excellent laptop!', 'images/feedback3.jpg', 1);
GO

-- Insert into Blog
INSERT INTO Blog (thumbnail, title, updated_date, blog_content, views, user_id) VALUES
('images/blog1.jpg', 'The Future of Laptops', GETDATE(), 'Content about future laptops...', 100, 1),
('images/blog2.jpg', 'Top 10 Laptops in 2024', GETDATE(), 'Content about top 10 laptops...', 200, 2),
('images/blog3.jpg', 'How to Choose a Laptop', GETDATE(), 'Content about choosing laptops...', 300, 3);
GO

-- Insert into Blog_Category
INSERT INTO Blog_Category (blog_id, Category) VALUES
(1, 'Technology'),
(2, 'Reviews'),
(3, 'Guides');
GO

-- Insert into Slider
INSERT INTO Slider (title, images, details, backlink, status, user_id) VALUES
('Summer Sale', 'images/slider1.jpg', 'Check out our summer sale!', 'http://example.com/sale', 1, 1),
('New Arrivals', 'images/slider2.jpg', 'Explore the latest laptops', 'http://example.com/new', 1, 2),
('Best Sellers', 'images/slider3.jpg', 'See our best selling laptops', 'http://example.com/best', 1, 3);
GO

-- Insert into Carts
INSERT INTO Carts (user_id) VALUES
(1),
(2),
(3);
GO

-- Insert into cart_items
INSERT INTO cart_items (cart_id, laptop_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);
GO

-- Insert into Score
INSERT INTO Score (score, user_id) VALUES
(100, 1),
(200, 2),
(300, 3);
GO
SELECT * FROM [Order]
INSERT INTO [User] (avatar, full_name, gender, address, email, phone_number, password, state, role_id) VALUES
('avatar1.png', 'John Doe', 'Male', '123 Main St', 'v123@gmail.com', '1234567899', CONVERT(VARCHAR(32), HashBytes('MD5', '1234'), 2), 'active', 4)
SELECT * FROM [Order]

update [Order] set status = 3 where order_id between 6 and 8

update [Order] set sales_id = 2 where order_id between 1 and 7

update [Order] set sales_id = 4 where order_id between 8 and 12

SELECT * FROM User_Authorization
insert into User_Authorization VALUES 
('/blog', 6),
('/blog', 5),
('/userauthorization', 1),
('/login', 6),
('/productdetails', 5),
('/productdetails', 6)

INSERT INTO hiddenUrl VALUES('/login')
INSERT INTO hiddenUrl VALUES('/logout')
INSERT INTO hiddenUrl VALUES('/login')
INSERT INTO hiddenUrl VALUES('/addtocart')
INSERT INTO hiddenUrl VALUES('/setcart')
INSERT INTO hiddenUrl VALUES('/deletefromcart')
SELECT * FROM hiddenUrl ORDER BY urlid OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
