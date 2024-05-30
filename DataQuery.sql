--disclaimed: 
--data only used to testing
INSERT INTO [Role] (role_purpose) VALUES ('admin'), ('sale_manager'), ('marketing'), ('sale'), ('deliverer'), ('customer')
GO

--vertified user
select * from [User]
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('John Doe', 'image/avatar/default.jpg' ,'Male', '123 Main St', 'sansunderswap2004@gmail.com', '123-456-7890', '123456', 'vertified', 1);
GO

select * from Blog_Category
--unvertified user
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('Loel', 'images/avatar/default.jpg' ,'Male', '123 Main St', 'longndhe181257@fpt.edu.vn', '123-456-7891', '123456', 'unvertified', 2);
GO

--blog
INSERT INTO Blog (title, thumbnail, updated_date, blog_content, is_featured, user_id) 
select * from Blog
Update Laptop set Laptop.products_detail = '

<h2>Technical Specifications</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Component</th>
                            <th>Specification</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Processor</td>
                            <td>Intel Core i7-10750H</td>
                        </tr>
                        <tr>
                            <td>RAM</td>
                            <td>16GB DDR4</td>
                        </tr>
                        <tr>
                            <td>Storage</td>
                            <td>512GB SSD</td>
                        </tr>
                        <tr>
                            <td>Display</td>
                            <td>15.6-inch Full HD (1920x1080)</td>
                        </tr>
                        <tr>
                            <td>Graphics</td>
                            <td>NVIDIA GeForce GTX 1650</td>
                        </tr>
                        <tr>
                            <td>Battery Life</td>
                            <td>Up to 8 hours</td>
                        </tr>
                        <tr>
                            <td>Operating System</td>
                            <td>Windows 10 Home</td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <p>The Dell Inspiron 7510 also includes a variety of ports and connectivity options:</p>
                <ul>
                    <li>USB 3.1 Type-C</li>
                    <li>USB 3.1 Type-A</li>
                    <li>HDMI 2.0</li>
                    <li>SD card reader</li>
                    <li>Wi-Fi 6 and Bluetooth 5.1</li>
                </ul>'
Update Blog set blog_content = '            <div>
                <p class="text-muted">This computer is surely better than it looks</p>
                <br>
				<img src="images/thumbnail/1.jpg" alt="single-post" class="img-fluid">
                <p>The Dell Inspiron 7510 is designed to meet the needs of both professionals and casual users. Here are some of its key features:</p>
                <ul>
                    <li>Powerful Intel Core i7 processor</li>
                    <li>16GB DDR4 RAM for seamless multitasking</li>
                    <li>512GB SSD for fast boot and load times</li>
                    <li>15.6-inch Full HD display</li>
                    <li>NVIDIA GeForce GTX 1650 graphics card</li>
                </ul>
                <br>
                <h2>Technical Specifications</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Component</th>
                            <th>Specification</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Processor</td>
                            <td>Intel Core i7-10750H</td>
                        </tr>
                        <tr>
                            <td>RAM</td>
                            <td>16GB DDR4</td>
                        </tr>
                        <tr>
                            <td>Storage</td>
                            <td>512GB SSD</td>
                        </tr>
                        <tr>
                            <td>Display</td>
                            <td>15.6-inch Full HD (1920x1080)</td>
                        </tr>
                        <tr>
                            <td>Graphics</td>
                            <td>NVIDIA GeForce GTX 1650</td>
                        </tr>
                        <tr>
                            <td>Battery Life</td>
                            <td>Up to 8 hours</td>
                        </tr>
                        <tr>
                            <td>Operating System</td>
                            <td>Windows 10 Home</td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <p>The Dell Inspiron 7510 also includes a variety of ports and connectivity options:</p>
                <ul>
                    <li>USB 3.1 Type-C</li>
                    <li>USB 3.1 Type-A</li>
                    <li>HDMI 2.0</li>
                    <li>SD card reader</li>
                    <li>Wi-Fi 6 and Bluetooth 5.1</li>
                </ul>
                <br>
                <p>This laptop is perfect for users who need a balance of power, portability, and reliability. Whether youre working on complex projects, enjoying multimedia content, or gaming, the Dell Inspiron 7510 delivers top-notch performance.</p>
            </div>
        </div>
    </div>
<p>'
select * from Blog
select * from Blog_Category
INSERT INTO Blog_Category (blog_id, Category) VALUES
(1002, 'DELL'),
(1004, 'DELL');
GO
--product
select * from Slider
select * from Laptop INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id

INSERT INTO Laptop (title, main_image, original_price, products_detail, sale_price, stock, status, updated_date) 
VALUES 
('Dell XPS 15', 'images/product/1.jpg', 1500.00, 'Dell XPS 15 details here...', 1200.00, 100, 1, GETDATE()),
('Dell PRECISION 7510', 'images/product/2.jpg', 1300.00, 'Dell PRECISION 7510 details...', 1300.00, 150, 1, GETDATE()),
('HP Envy 13', 'images/product/3.jpg', 1100.00, 'HP Envy 13 details...', 1100.00, 100, 1, GETDATE()),
('Lenovo ThinkPad X1', 'images/product/4.jpg', 1200.00, 'Lenovo ThinkPad X1 details...', 1200.00, 100, 1, GETDATE()),
('MacBook Pro 15', 'images/product/5.jpg', 2400.00, 'MacBook Pro 15 details...', 2400.00, 200, 1, GETDATE()),
('Acer Aspire 7', 'images/product/6.jpg', 900.00, 'Acer Aspire 7 details...', 900.00, 50, 1, GETDATE()),
('Asus ROG Zephyrus', 'images/product/7.jpg', 2500.00, 'Asus ROG Zephyrus details...', 2500.00, 70, 1, GETDATE()),
('Microsoft Surface Laptop 4', 'images/product/8.jpg', 1500.00, 'Surface Laptop 4 details...', 1500.00, 80, 1, GETDATE()),
('Dell XPS 13', 'images/product/9.jpg', 1400.00, 'Dell XPS 13 details...', 1400.00, 120, 1, GETDATE()),
('HP Spectre x360', 'images/product/10.jpg', 1300.00, 'HP Spectre x360 details...', 1300.00, 90, 1, GETDATE()),
('Lenovo Yoga 920', 'images/product/11.jpg', 1000.00, 'Lenovo Yoga 920 details...', 1000.00, 60, 1, GETDATE()),
('Apple MacBook Air', 'images/product/12.jpg', 999.00, 'MacBook Air details...', 999.00, 200, 1, GETDATE()),
('Asus ZenBook 14', 'images/product/13.jpg', 850.00, 'Asus ZenBook 14 details...', 850.00, 150, 1, GETDATE()),
('Razer Blade Stealth', 'images/product/14.jpg', 1800.00, 'Razer Blade Stealth details...', 1800.00, 80, 1, GETDATE()),
('MSI GS65 Stealth', 'images/product/15.jpg', 1900.00, 'MSI GS65 Stealth details...', 1900.00, 90, 1, GETDATE()),
('Alienware m15 R3', 'images/product/16.jpg', 2100.00, 'Alienware m15 R3 details...', 2100.00, 70, 1, GETDATE()),
('Toshiba Portege X30', 'images/product/17.jpg', 1450.00, 'Toshiba Portege X30 details...', 1450.00, 40, 1, GETDATE()),
('LG Gram 17', 'images/product/18.jpg', 1600.00, 'LG Gram 17 details...', 1600.00, 100, 1, GETDATE()),
('Samsung Notebook 9', 'images/product/19.jpg', 950.00, 'Samsung Notebook 9 details...', 950.00, 110, 1, GETDATE()),
('Dell Inspiron 15', 'images/product/20.jpg', 700.00, 'Dell Inspiron 15 details...', 700.00, 130, 1, GETDATE()),
('Lenovo Legion Y540', 'images/product/21.jpg', 1100.00, 'Lenovo Legion Y540 details...', 1100.00, 95, 1, GETDATE());
GO

INSERT INTO Laptop_Category (laptop_id, Category) VALUES
(2, 'Ultrabook'),
(3, 'Ultrabook'),
(4, 'Business'),
(5, 'Ultrabook'),
(6, 'Gaming'),
(7, 'Gaming'),
(8, 'Ultrabook'),
(9, 'Ultrabook'),
(10, 'Convertible'),
(11, 'Convertible'),
(12, 'Ultrabook'),
(13, 'Ultrabook'),
(14, 'Gaming'),
(15, 'Gaming'),
(16, 'Gaming'),
(17, 'Business'),
(18, 'Ultrabook'),
(19, 'Ultrabook'),
(20, 'Budget'),
(21, 'Gaming'),
(22, 'Ultrabook');
GO

INSERT INTO Laptop_Image (laptop_id, Image) VALUES
(22, 'images/product/1.jpg'),
(2, 'images/product/2.jpg'),
(3, 'images/product/3.jpg'),
(4, 'images/product/4.jpg'),
(5, 'images/product/5.jpg'),
(6, 'images/product/6.jpg'),
(7, 'images/product/7.jpg'),
(8, 'images/product/8.jpg'),
(9, 'images/product/9.jpg'),
(10, 'images/product/10.jpg'),
(11, 'images/product/11.jpg'),
(12, 'images/product/12.jpg'),
(13, 'images/product/13.jpg'),
(14, 'images/product/14.jpg'),
(15, 'images/product/15.jpg'),
(16, 'images/product/16.jpg'),
(17, 'images/product/17.jpg'),
(18, 'images/product/18.jpg'),
(19, 'images/product/19.jpg'),
(20, 'images/product/20.jpg'),
(21, 'images/product/21.jpg');
GO

--slider(s)
INSERT INTO Slider (title, images, details, backlink, status, user_id) 
VALUES ('Summer Sale', 'images/summer-sale.jpg', 'Products being sale up to 90% !', 'http://example.com/sale', 1, 1);
GO

INSERT INTO Slider (title, images, details, backlink, status, user_id) 
VALUES ('Sudden Sale', 'images/sudden-sale.jpg', 'Some odd products is being saled ! How cool', 'http://example.com/sale', 1, 1);
GO

SELECT TOP 3 laptop_id, title, main_image, original_price, stock, products_detail, sale_price, status, updated_date FROM Laptop WHERE is_featured = 1