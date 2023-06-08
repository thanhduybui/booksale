CREATE DATABASE  IF NOT EXISTS `booksale`;

USE `booksale`;


DROP TABLE IF EXISTS `Authors`;
CREATE TABLE Authors (
  author_id int  PRIMARY KEY auto_increment,
  name NVARCHAR(255),
  biography TEXT,
  country NVARCHAR(100)
)auto_increment=1;

INSERT INTO Authors (name, biography, country)
VALUES ( 'Nguyễn Nhật Ánh', '
Nguyễn Nhật Ánh là một nhà văn nổi tiếng và được yêu thích ở Việt Nam. Sinh ngày 07/05/1955 tại Hà Nội, ông đã gắn bó với viết lách từ thời học sinh và trở thành một trong những tác giả tiêu biểu của văn học trẻ Việt Nam.

Nguyễn Nhật Ánh nổi tiếng với những tác phẩm thiếu nhi, mang tính nhân văn cao và sâu sắc. Ông đã tạo ra những câu chuyện đáng yêu và cảm động, tạo cảm hứng cho độc giả trẻ. Một trong những tác phẩm nổi tiếng nhất của ông là "Kính vạn hoa" và "Cho tôi xin một vé đi tuổi thơ".', 'Việt Nam');

INSERT INTO Authors (name, biography, country)
VALUES ( 'Mark Twain', 'Mark Twain, tên thật là Samuel Langhorne Clemens (30/11/1835 - 21/4/1910), là một nhà văn nổi tiếng người Mỹ. Ông được biết đến với bút danh Mark Twain, là một trong những tác giả xuất sắc và ảnh hưởng nhất của văn học Mỹ. Ông được coi là một trong những người tiên phong của văn học hiện thực Mỹ.

Mark Twain nổi tiếng với tác phẩm "The Adventures of Tom Sawyer" (Cuộc phiêu lưu của Tom Sawyer) và "Adventures of Huckleberry Finn" (Cuộc phiêu lưu của Huckleberry Finn). Những tác phẩm này mang tính biểu cảm sâu sắc và phản ánh cuộc sống ở miền Nam Hoa Kỳ trong thời kỳ hậu nô lệ.

', 'Hoa Kỳ');
INSERT INTO Authors (name, biography, country)
VALUES ('J.D.Salinger ', 'J.D. Salinger là một nhà văn người Mỹ được biết đến với tác phẩm nổi tiếng "The Catcher in the Rye" (Người Bắt Cá Rô). Sinh vào năm 1919 tại New York, Salinger đã tạo ra một tác phẩm văn học kinh điển và ảnh hưởng sâu sắc đến văn chương thế giới.

', 'Hoa Kỳ');

INSERT INTO Authors (name, biography, country)
VALUES ( 'William Shakespeare', 'William Shakespeare là một nhà viết kịch, nhà thơ và diễn viên người Anh, được coi là nhà văn vĩ đại nhất trong ngôn ngữ Anh và nhà viết kịch hàng đầu thế giới. Ông thường được gọi là nhà thơ quốc gia của Anh và "Bậc thầy của Avon". Các tác phẩm của Shakespeare, bao gồm các vở kịch như "Romeo và Juliet", "Hamlet" và "Macbeth", vẫn được biểu diễn và nghiên cứu cho đến ngày nay. Những tác phẩm của ông khám phá nhiều chủ đề, bao gồm tình yêu, bi kịch, hài kịch và bản chất con người. Sự ảnh hưởng sâu sắc của  đối với văn học và sân khấu vẫn còn đọng mãi qua các thế kỷ, k
hiến ông trở thành một nhân vật bền vững trong thế giới nghệ thuật và văn hóa.', 'Anh');

INSERT INTO Authors (name, biography, country)
VALUES ('José Mauro de Vasconcelos', 'José Mauro de Vasconcelos là một nhà văn người Brazil sinh vào ngày 26 tháng 2 năm 1920 và qua đời vào ngày 24 tháng 7 năm 1984. Ông được biết đến với tài năng văn học phong phú và sự sáng tạo độc đáo.', 'Brazil');

INSERT INTO Authors (name, biography, country)
VALUES ('Vũ Trọng Phụng', '
Vũ Trọng Phụng (1912-1939) là một trong những nhà văn tiêu biểu và tài năng của văn học Việt Nam. Ông được biết đến với tư cách là một nhà văn, nhà báo, và nhà hoạt động văn học xuất sắc trong thời kỳ trước cách mạng.

Sinh ra trong một gia đình trí thức ở Hà Nội, Vũ Trọng Phụng đã sớm thể hiện đam mê với văn học và nghệ thuật. Ông đã tốt nghiệp trường Quốc học Huế và trở thành một trong những tác giả nổi tiếng nhất của thập kỷ 1930.', 'Việt Nam');


DROP TABLE IF EXISTS `Categories`;
CREATE TABLE Categories (
  category_id int  PRIMARY KEY auto_increment,
  name VARCHAR(255),
  is_active tinyint
)auto_increment=1;

INSERT INTO Categories (name, is_active) VALUES
('Tiểu thuyết', 1),
('Kinh tế', 1),
('Khoa học', 1),
('Tâm lý', 1),
('Lịch sử', 1),
('Self-help', 1),
('Thiếu nhi', 1),
('Sách mới', 1),
('Nổi bật', 1),
('Giảm giá', 1);


DROP TABLE IF EXISTS `Sub_categories`;
CREATE TABLE Sub_categories (
  sub_category_id int PRIMARY KEY auto_increment,
  name VARCHAR(255),
  category_id int,
  
  constraint `FK_sub_categories_categories`  FOREIGN KEY(`category_id`) References Categories(`category_id`)
)auto_increment=1;


INSERT INTO Sub_categories (name, category_id) VALUES
('Kinh điển', 1),
('Văn học Việt nam', 1),
('Thế giới', 1),
('Kinh tế học', 2),
('Kinh doanh', 2),
('Marketing', 2),
('Khoa học tự nhiên', 3),
('Khoa học xã hội', 3),
('Tâm lý phát triển cá nhân', 4),
('Tâm lý học hành vi', 4),
('Lịch sử thế giới', 5),
('Lịch sử Việt Nam', 5),
('Sách tự nhiên', 6),
('Sách kỹ năng sống', 6),
('Sách thiếu nhi', 7),
('Sách học tiếng Anh cho thiếu nhi', 7);


DROP TABLE IF EXISTS `Publishers`;
CREATE TABLE Publishers (
  publisher_id int PRIMARY KEY auto_increment,
  name VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(20),
  is_active tinyint
)auto_increment=1;


INSERT INTO Publishers (name, address, phone, is_active) VALUES
('Kim Đồng', '123 Đường Sách, Hà Nội', '0123456789', 1),
('Văn học', '456 Đường Văn Chương, Hồ Chí Minh', '0987654321', 1),
('Trẻ', '789 Đường Trẻ Thơ, Đà Nẵng', '0369852147', 1),
('Nhã Nam', '147 Đường Thanh Niên, Hà Nội', '0321548796', 1),
('Omegabooks', '951 Đường Chính Trị, Hà Nội', '0987123456', 1);

DROP TABLE IF EXISTS `Books`;
CREATE TABLE Books (
  book_id int  PRIMARY KEY auto_increment,
  title VARCHAR(255),
  author_id int,
  publisher_id int,
  publication_year INT,
  discount int,
  main_img text,
  price DECIMAL(10, 3),
  quantity INT,
  category_id int,
  subcategory_id int,
  is_active tinyint,
  
   constraint `FK_books_authors` FOREIGN KEY(`author_id`) References Authors(`author_id`),
   constraint `FK_books_category` FOREIGN KEY(`category_id`) References Categories(`category_id`),
   constraint `FK_books_subcategory` foreign key(`subcategory_id`) references Sub_categories(`sub_category_id`) ,
   constraint `FK_books_publisher` foreign key(`publisher_id`) references Publishers(`publisher_id`) 
) auto_increment=1;

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES ('Dã ngoại nơi Mặt sau của Thế giới (Otherside Picnic) 2', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/QZJB7DKY.jpg', 76000, 50, 1, 1, 1),
	('Những cậu bé can đảm thế', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/TGGOCQQQ.jpg', 76000, 60, 1, 1, 1),
    ('Chú bé mang pyjama sọc', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/9/5BK3HGO4.jpg', 76000, 60, 1, 1, 1),
    ('Đi tìm Dora', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/HDEA67JF.jpg', 76000, 60, 1, 1, 1),
    ('Bản đồ thế giới cà phê', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/1/30/K86N2QWU.jpg', 76000, 60, 1, 1, 1),
    ('Voi con tìm mẹ', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/1/5/QTM32K8R.jpg', 76000, 60, 1, 1, 1),
    ('Điềm lành', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/13/V5VL3E5N.jpg', 76000, 60, 1, 1, 1),
    ('Nhóc Nicolas', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/21/ZACRFIN2.jpg', 76000, 60, 1, 1, 1),
    ('Nhóc Nicolas phiền muộn', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/21/WOFCT7SH.jpg', 76000, 60, 1, 1, 1),
    ('Con người và Biểu tượng', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/16/GSNU7AJZ.jpg', 76000, 60, 3, 8, 1),
    ('Phát triển năng lực cảm xúc xã hội', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/13/SLKMB8TL.jpg', 76000, 60, 1, 1, 1),
    ('Bụi sao', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/26/ZZTQBSJD.jpg', 76000, 60, 1, 1, 1),
    ('Ngày mới - Việt Nam Danh Tác', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/18/N4KEGXTZ.jpg', 76000, 60, 1, 1, 1),
    ('Tiếng vọng đèo Khau Chỉa', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/4/HTZ5DBZ1.jpg', 76000, 60, 1, 1, 1),
    ('Bố mẹ ơi, con từ đâu tới', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/4/14/B4QRWYV8.jpg', 76000, 60, 7, 1, 1)
    ;


DROP Table if exists `Images`;
CREATE TABLE Images(
	img_id int auto_increment primary key,
    img_url text not null,
    book_id int,
    
    constraint `FK_image_book` foreign key(`book_id`) references Books(`book_id`)
)auto_increment=1;


Drop table if exists `Book_Category`;
CREATE TABLE Book_Category(
	book_id int not null,
    category_id int not null,
    
	constraint `FK_bookcategory_book` FOREIGN KEY(`book_id`) References Books(`book_id`),
    constraint `FK_bookcategory_category` FOREIGN KEY(`category_id`) References Categories(`category_id`)
);


DROP TABLE IF EXISTS `Roles`;
CREATE TABLE Roles (
  role_id INT PRIMARY KEY,
  role_name ENUM('ROLE_CUSTOMER', 'ROLE_MANAGER', 'ROLE_ADMIN')
);



INSERT INTO Roles (role_id, role_name) VALUES (1, 'ROLE_CUSTOMER');
INSERT INTO Roles (role_id, role_name) VALUES (2, 'ROLE_MANAGER');
INSERT INTO Roles (role_id, role_name) VALUES (3, 'ROLE_ADMIN');


DROP TABLE IF EXISTS `Users`;
CREATE TABLE Users (
  user_id bigint PRIMARY KEY auto_increment,
  full_name NVARCHAR(255) not null,
  email VARCHAR(255) unique not null,
  address NVARCHAR(255),
  password VARCHAR(255) not null,
  phone VARCHAR(20),
  enable tinyint,
  is_lock tinyint
)auto_increment=1;

INSERT INTO Users (full_name, email, address, password, phone, enable, is_lock)
VALUES('Bùi Thanh Duy', 'dtb1742002@gmail.com', 'Ho Chi Minh, Viet Nam', '$2a$12$aVNMqqYZnOStzUTPO9f.JOgUWXTrzmgZy9v0UoTuSHq2pZL.3QIFC', '0383314133', 1, 0 );



DROP TABLE IF EXISTS `User_Role`;
CREATE TABLE `User_Role`(
	user_id bigint not null,
    role_id int not null,
    constraint `user_role_user` foreign key(`user_id`) references Users(`user_id`),
    constraint `user_role_role` foreign key(`role_id`) references Roles(`role_id`)
);

INSERT INTO `User_Role`(user_id, role_id)
VALUE(1, 1),
	(1,2);

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE Orders (
  order_id bigint PRIMARY KEY,
  user_id bigint,
  order_date DATE,
  total_price DECIMAL(10, 2),
  constraint `FK_orders_customer` FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

DROP TABLE IF EXISTS `Order_Items`;
CREATE TABLE Order_Items (
  order_item_id bigint PRIMARY KEY,
  order_id bigint,
  book_id int,
  quantity INT,
  price DECIMAL(10, 2),
  constraint `FK_order_items_orders` FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  constraint `FK_order_itens_books` FOREIGN KEY (book_id) REFERENCES Books(book_id)
);









