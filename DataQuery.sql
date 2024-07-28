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
('avatar3.png', 'Bob Johnson', 'Male', '789 Pine St', 'bob@example.com', '5555555555', CONVERT(VARCHAR(32), HashBytes('MD5', 'password3'), 2), 'active', 4),
('avatar3.png', 'Bob Johnson', 'Male', '789 Pine St', 'v123@gmail.com', '5555555556', CONVERT(VARCHAR(32), HashBytes('MD5', '1234'), 2), 'active', 4);
GO

-- Insert into Laptop
INSERT INTO Laptop (title, main_image, original_price, stock, products_detail, sale_price, brief_information, is_featured, status, updated_date) VALUES
('Asus Vivobook OLED 2020', 'images/Asus/Asus1.jpg', 1000.00, 50, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i5-1135G7</td></tr><tr><td>RAM</td><td>8GB DDR4</td></tr><tr><td>Storage</td><td>512GB SSD</td></tr><tr><td>Display</td><td>14" FHD OLED</td></tr></table>', 900.00, 'The laptop of the future with an OLED display for stunning visuals.', 1, 1, GETDATE()),
('Asus Vivobook 2018', 'images/Asus/Asus2.jpg', 1200.00, 30, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-8550U</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB HDD</td></tr><tr><td>Display</td><td>15.6" FHD</td></tr></table>', 1100.00, 'Reliable performance for everyday tasks.', 1, 1, GETDATE()),
('Dell Inspiron 2020', 'images/Dell/Dell1.jpg', 1500.00, 20, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-10750H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>512GB SSD</td></tr><tr><td>Display</td><td>15.6" FHD</td></tr></table>', 1400.00, 'Thin, yet unbreakable.', 1, 1, GETDATE()),
('Lenovo Thinkpad 2024', 'images/Lenovo/Lenovo1.jpg', 1800.00, 10, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-1260P</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>14" FHD</td></tr></table>', 1700.00, 'The ultimate business laptop.', 1, 1, GETDATE()),
('Dell Precision 2021', 'images/Dell/Dell2.png', 2000.00, 15, '<table class="product-detail"><tr><td>Processor</td><td>Intel Xeon W-10855M</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>15.6" 4K UHD</td></tr></table>', 1900.00, 'A powerful workstation for demanding tasks.', 1, 1, GETDATE()),
('Lenovo Gaming 2020', 'images/Lenovo/Lenovo2.jpg', 2200.00, 5, '<table class="product-detail"><tr><td>Processor</td><td>AMD Ryzen 7 4800H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>15.6" FHD 144Hz</td></tr></table>', 2100.00, 'A powerful gaming laptop with high refresh rate display.', 1, 1, GETDATE()),
('Asus Vivobook 2023', 'images/Asus/Asus3.png', 2500.00, 25, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-11900H</td></tr><tr><td>RAM</td><td>32GB DDR4</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>16" FHD OLED</td></tr></table>', 2400.00, 'A premium laptop for professionals.', 1, 1, GETDATE()),
('Asus Expertbook 2024', 'images/Asus/Asus4.jpg', 2800.00, 12, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-13700H</td></tr><tr><td>RAM</td><td>16GB DDR4</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>14" FHD</td></tr></table>', 2700.00, 'An expert"s choice for business and productivity.', 1, 1, GETDATE()),
('Dell Notebook 2023', 'images/Dell/Dell3.jpg', 3000.00, 18, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-11980HK</td></tr><tr><td>RAM</td><td>64GB DDR4</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>17" 4K UHD</td></tr></table>', 2900.00, 'A high-end notebook with top-tier specifications.', 1, 1, GETDATE()),
('Lenovo Ultrabook 2024', 'images/Lenovo/Lenovo3.jpg', 3200.00, 22, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i7-1260P</td></tr><tr><td>RAM</td><td>32GB LPDDR4X</td></tr><tr><td>Storage</td><td>1TB SSD</td></tr><tr><td>Display</td><td>13.3" FHD</td></tr></table>', 3100.00, 'A lightweight yet powerful ultrabook.', 1, 1, GETDATE()),
('Dell Notebook 2024', 'images/Dell/Dell4.jpg', 3400.00, 14, '<table class="product-detail"><tr><td>Processor</td><td>Intel Core i9-12900HK</td></tr><tr><td>RAM</td><td>64GB DDR5</td></tr><tr><td>Storage</td><td>2TB SSD</td></tr><tr><td>Display</td><td>17" 4K UHD</td></tr></table>', 3300.00, 'Top-of-the-line notebook for professionals.', 1, 1, GETDATE());
GO

-- Insert into Laptop_Category
INSERT INTO Laptop_Category (laptop_id, category) VALUES
(1, 'Asus'),
(2, 'Asus'),
(3, 'Dell'),
(4, 'Lenovo'),
(5, 'Dell'),
(6, 'Lenovo'),
(7, 'Asus'),
(8, 'Asus'),
(9, 'Dell'),
(10, 'Lenovo'),
(11, 'Dell');
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
(11, 'images/11_2.jpg');
GO

-- Insert into Blog
INSERT INTO Blog (thumbnail, title, updated_date, blog_content, views, user_id) VALUES
('images/Blog/Review/review1.jpg', 'Review: Asus Vivobook OLED 2020', GETDATE(), 'In-depth review of the Asus Vivobook OLED 2020, exploring its features, performance, and overall value.', 150, 1),
('images/Blog/Review/review2.jpg', 'Review: Dell Inspiron 2020', GETDATE(), 'Comprehensive review of the Dell Inspiron 2020, including its design, specifications, and user experience.', 250, 2),
('images/Blog/Review/review3.jpg', 'Review: Lenovo Thinkpad 2024', GETDATE(), 'Detailed analysis of the Lenovo Thinkpad 2024, covering its build quality, performance, and usability for business.', 350, 3),
('images/Blog/Review/review4.jpg', 'Review: Dell Precision 2021', GETDATE(), 'Evaluation of the Dell Precision 2021, focusing on its capabilities as a workstation and its performance in demanding tasks.', 450, 1),
('images/Blog/Review/review5.jpg', 'Review: Asus Expertbook 2024', GETDATE(), 'Insights into the Asus Expertbook 2024, highlighting its features, performance, and suitability for business professionals.', 550, 2),
('images/Blog/Event/event1.jpg', 'Event Recap: CES 2024', GETDATE(), 'A comprehensive recap of the CES 2024 event, showcasing the latest innovations and technologies in the laptop industry.', 300, 3),
('images/Blog/Event/event2.png', 'Event Highlights: Computex 2024', GETDATE(), 'Highlights from Computex 2024, featuring new product announcements and trends in the tech world.', 400, 1),
('images/Blog/Event/event3.jpg', 'Event Summary: TechCrunch Disrupt 2024', GETDATE(), 'Summary of TechCrunch Disrupt 2024, covering major talks, startup showcases, and emerging technologies.', 500, 2),
('images/Blog/Event/event4.jpg', 'Event Overview: Google I/O 2024', GETDATE(), 'Overview of Google I/O 2024, detailing keynotes, product launches, and developer sessions.', 600, 3),
('images/Blog/Event/event5.jpg', 'Event Insights: Apple WWDC 2024', GETDATE(), 'Insights from Apple WWDC 2024, focusing on software updates, new hardware announcements, and developer news.', 700, 1);
GO

-- Insert into Blog_Category
INSERT INTO Blog_Category (blog_id, Category) VALUES
(1, 'Reviews'),
(2, 'Reviews'),
(3, 'Reviews'),
(4, 'Reviews'),
(5, 'Reviews'),
(6, 'Events'),
(7, 'Events'),
(8, 'Events'),
(9, 'Events'),
(10, 'Events');
GO

-- Insert into Slider
INSERT INTO Slider (title, images, details, backlink, status, user_id) VALUES
('Summer Sale', 'images/slider1.jpg', 'Check out our summer sale!', 'http://example.com/sale', 1, 1),
('New Arrivals', 'images/slider2.jpg', 'Explore the latest laptops', 'http://example.com/new', 1, 2),
('Best Sellers', 'images/slider3.jpg', 'See our best selling laptops', 'http://example.com/best', 1, 3);
GO

insert into User_Authorization VALUES 

('/blog', 6),
('/blog', 5),
('/userauthorization', 1),
('/login', 6),
('/productdetails', 5),
('/productdetails', 6),
('/feedback', 5),
('/feedback', 6),
('/product', 5),
('/product', 6),
('/salesdashboard', 2),
('/salesdashboard', 4),
('/orderdetails', 2),
('/orderdetails', 4),
('/salesorderlist', 4),
('/salesorderlist', 2),
('/', 5),
('/', 6)

INSERT INTO hiddenUrl VALUES('/productdetails')
INSERT INTO hiddenUrl VALUES('/login')
insert into hiddenUrl VALUES('/orderdetails')
select * from [User]
update [User] set [state] = 'active'

delete from [User_Authorization] where url = '/order'
select * from [Order]

select * from [User_Authorization]
select * from Feedback