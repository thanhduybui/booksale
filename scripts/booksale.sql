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


DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE Sub_categories (
  subcategory_id int PRIMARY KEY auto_increment,
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
   constraint `FK_books_subcategory` foreign key(`subcategory_id`) references Sub_categories(`subcategory_id`) ,
   constraint `FK_books_publisher` foreign key(`publisher_id`) references Publishers(`publisher_id`) 
) auto_increment=1;


-- INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
-- VALUES ('Dã ngoại nơi Mặt sau của Thế giới (Otherside Picnic) 2', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/QZJB7DKY.jpg', 76000, 50, 1, 1, 1),
-- 	('Những cậu bé can đảm thế', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/TGGOCQQQ.jpg', 76000, 60, 1, 3, 1),
--     ('Chú bé mang pyjama sọc', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/9/5BK3HGO4.jpg', 76000, 60, 1, 3, 1),
--     ('Đi tìm Dora', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/2/8/HDEA67JF.jpg', 76000, 60, 1, 3, 1),
--     ('Bản đồ thế giới cà phê', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/1/30/K86N2QWU.jpg', 76000, 60, 1, 1, 1),
--     ('Voi con tìm mẹ', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/1/5/QTM32K8R.jpg', 76000, 60, 1, 3, 1),
--     ('Điềm lành', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/13/V5VL3E5N.jpg', 76000, 60, 1, 3, 1),
--     ('Nhóc Nicolas', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/21/ZACRFIN2.jpg', 76000, 60, 1, 3, 1),
--     ('Nhóc Nicolas phiền muộn', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/21/WOFCT7SH.jpg', 76000, 60, 1, 3, 1),
--     ('Con người và Biểu tượng', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/16/GSNU7AJZ.jpg', 76000, 60, 3, 8, 1),
--     ('Phát triển năng lực cảm xúc xã hội', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/13/SLKMB8TL.jpg', 76000, 60, 6, 14, 1),
--     ('Bụi sao', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/26/ZZTQBSJD.jpg', 76000, 60, 1, 3, 1),
--     ('Ngày mới - Việt Nam Danh Tác', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/18/N4KEGXTZ.jpg', 76000, 60, 1, 2, 1),
--     ('Tiếng vọng đèo Khau Chỉa', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/10/4/HTZ5DBZ1.jpg', 76000, 60, 1, 2, 1),
--     ('Bố mẹ ơi, con từ đâu tới', 1, 1, 2022, 10, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/4/14/B4QRWYV8.jpg', 76000, 60, 7, 15, 1);


-- Văn học Việt Nam 
INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Gió đầu mùa - Việt Nam Danh Tác', 1, 1, 2002, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/21/DGDZBYGY.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Nắng trong vườn - Việt Nam Danh Tác', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/V3WXDZK3.jpg', 46000, 100, 1, 2, 1 );
    
INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Đám trẻ nhiễu văn hóa', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/6/21/25TXXGOL.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Chùa Đàn', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/5/12/9YLI42GM.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Bài thơ của một người yêu nước mình', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/9/4/DKQYFA75.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Muốn làm nữ hoàng, đừng yêu như hầu gái', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/11/14/2QAYBLJW.jpg', 46000, 100, 1, 2, 1 );


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Ký túc xá phòng 307', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/11/14/C3F24YNQ.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Người đưa thư tình', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/11/20/YB9HLB6Z.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Thảm kịch vĩ nhân', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/10/29/3GX3U5U3.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Về nhà (TB 2019)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/6/21/C5FA2DHX.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Ly rượu trần gian', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/7/8/SN8N3FX2.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Để con được chích - Hiểu hết về vắc xin và miễn dịch', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/6/28/1A4LDY89.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Sông ngân khi tỏ khi mờ', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/5/22/KEJYZJBV.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Đại Nam dị truyện (TB 2019)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/5/9/7YYWZJ3H.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Cái nồi gì thế?', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/5/14/NXGRTV9V.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Tôi bỏ quên tôi ở nước Anh (TB 2019)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/9/6/RJ1F7AGY.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Chân đi không mỏi ( TB 2019)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/4/9/2C13SJEU.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Mama - Mẹ', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/4/19/WAXUV1L7.jpg', 46000, 100, 1, 2, 1 );

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active)
VALUES('Hà nội băm sáu phố phường - Danh tác', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2019/3/28/6O2RJL2M.jpg', 46000, 100, 1, 2, 1 );

-- Văn học nước ngoài
INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Điềm lành - Những lời tiên tri tuyệt đích và chuẩn xác của phù thủy Agnes Nutter', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/13/V5VL3E5N.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Một thoáng ta rực rỡ ở nhân gian ( Bìa cứng)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/14/XY4V4T1I.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tận hưởng hành trình nuôi con sữa mẹ', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/11/15/CGKPM7QW.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tiếng núi', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/9/14/899HQYIC.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Làm sao dừng lại thời gian', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/9/12/1RJP3DAX.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Những chuyện tình thế kỷ mới', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/9/12/KDHP55N8.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Không ai sống giống ai trong cuộc đời này', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/7/20/J5213DVZ.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Sáng trăng', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/7/11/4TH9IWTX.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Cô gái mặc váy tím', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/7/11/UXYZPE2L.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('AI THẢ CÁC THẦN RA?', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/7/11/1B5GKXCF.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Bàn về âm nhạc - Trò chuyện cùng Seiji Ozawa', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/6/21/YLZQH5YU.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Mã mẫu tử', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/4/5/ITIP1FEH.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tâm hồn cao thượng (Bìa cứng)', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/21/7QBCRMMF.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('9 màu chia ly', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/21/O7J4WSKW.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tâm hồn cao thượng', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/10/DAUQRNH8.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Dịch bệnh Atlantis ', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/16/1YF9HFCE.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Trúc thư dao 1 - Nước Tần - Có nàng tên Thập', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/8/ZNT9MAO1.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tàn lửa', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/10/MQH1WHJS.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Anne tóc đỏ làng Avonlea', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/3/8/OV41WE4J.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Và rồi núi vọng', 1, 1, 2022, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/9/1/TBOT3NT6.jpg', 80000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Lắng nghe gió hát', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/31/IM4S7NHK.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Faust - Johann WolfGang Von Goethe', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/6/9/46XLHEM7.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Diệt chủng', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/30/IEMIY2L1.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Hãy đi đặt người canh gác', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/4YRFRQRX.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Lời nhắn cuối cùng', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/17/LAYEVALU.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Cha và Con (Ivan Turgenev)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/17/G59LJ9W5.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Chiếc hộp Pandora', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/17/VWXQF8RO.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Truyện ma (M.R.James)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/8/DVBH3XKI.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Momo (Michael Ende)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/8/OSWXECG1.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Ngụy chứng của Solomon - Tập 2 Quyết định', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/4/18/DRIPI7CD.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Người truyền tin (phần thứ ba của Người truyền ký ức)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/4/12/TEQIOVCD.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Hãy về với cha', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/24/IOISKFAC.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Thiên nga và dơi', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/21/PP15XG7Q.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Ca trực - Silo Tháp Giống #2', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/21/E9GVRPUS.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Thị trấn bị nguyền rủa - HEX', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/21/O3F5O5FJ.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Hội nghị của bầy chim - Tập V của Trại trẻ đặc biệt của cô Peregrine', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/21/8D6GKQYM.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Thú tội', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/CW8L4E73.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Em sẽ đến cùng cơn mưa', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/24/TKJL457A.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Bọ tuyết', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/14/RCN7X24K.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Vật chứa linh hồn', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/14/CTG94MJP.jpg', 96000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tội ác và hình phạt', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/7/2/UH8ZDY1I.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Bạch dạ hành (TB 2021)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/6/1/DQ51DZK7.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Tam thể 3 - Tử thần sống mãi ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/4/20/3OWFHY1U.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('451 độ F (Bìa Cứng)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/3/31/5FLRD8VR.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Zarathustra đã nói như thế - Bìa cứng ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/4/1/5UWRRRK6.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Cuộc đời là một tiểu thuyết', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2021/1/12/PLXV6NFL.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Sử ký III - Thế gia', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/11/16/8Y8JP5K2.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('1Q84 (Tập 3)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/3/16/UKEKDH1M.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Chín mạng', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/12/7/ZYJO4UDP.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Khuyến học( Bìa cứng)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/11/16/18NX6Z1D.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Trong khi chờ đợi Godot ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/12/7/ERA1QXWE.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Sa môn Không Hải thết yến bầy quỷ Đại Đường tập 4', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/11/5/3QL8A544.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Hoa vẫn nở mỗi ngày', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/11/3/72C7S812.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Chúc mẹ ngủ ngon', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/10/27/H2PQB7LZ.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Kem đá 6- Dù được ban đôi cánh', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/9/18/4WBD9Q8Y.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Sa môn Không Hải thết yến bầy quỷ Đại Đường tập 3', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/10/8/CQG9P9GU.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Trái tim của Brutus', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/8/31/ZVBYI4J8.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Cảnh ngộ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/7/15/AWWIEYUW.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Nhà đầu tư thông minh ( TB 199.000)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/7/2/TZFQ255S.jpg', 103000, 100, 1, 3, 1);

INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) 
VALUES('Bút ký người đi săn', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2020/6/16/UHPYJK3I.jpg', 103000, 100, 1, 3, 1);


-- Sách thiếu nhi
INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Cuốn sách lớn rực rỡ về bác sĩ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/31/TKTK58SD.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Cuốn sách lớn rực rỡ về lính cứu hỏa', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/31/9NPR484Q.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Ông Thối Hoắc - Bestseller hài hước SỐ MỘT nước Anh của David Walliams', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/17/Y6PYCTC6.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Say mê dẫn dắt mình khôn lớn - Những câu chuyện để trưởng thành', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/JTHZFJMJ.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Sức mạnh của những tấm gương - Những câu chuyện để trưởng thành', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/WY575P1B.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Chăm chỉ học thành tài - Những câu chuyện để trưởng thành', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/UHOD1KNU.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Mình tự chịu trách nhiệm - Những câu chuyện để trưởng thành', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/7CP3OEKY.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Tự tin khiến mình càng xuất sắc - Những câu chuyện để trưởng thành', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/5/23/AIZMCKIQ.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Chuyện xóm gà – Chim dodo bé bỏng ở xóm gà', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/4/12/BB5Z99Z1.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Chuyện xóm gà – Giải cứu dòng sông hôi thối', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/4/12/635TMBZA.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Chuyện xóm gà – Quả trứng của Hoàng đế ', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/4/12/PMN1V7IG.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('PHÁT TRIỂN KỸ NĂNG XÃ HỘI - 50 hoạt động thú vị giúp bạn nhỏ kết bạn, giao tiếp và thành thạo các kỹ năng xã hội', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/LNN9DC2X.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Vì mẹ yêu con nhiều - Because I love you so much', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/3YXB9DJP.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Nụ hôn đầu tiên - The very first kiss', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/HHYMMT6A.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Con nuôi một em mèo được không? - Can I have a little cat? (Sách song ngữ Anh - Việt)', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2023/3/23/9S9VWYBN.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Hỏi đáp cùng em! - Làm thế nào để bảo vệ thiên nhiên?', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/14/VSJB3PPU.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Hỏi đáp cùng em! - Bóng đá!', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/12/14/XGLMT5IJ.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Tô màu phát triển não bộ cho bé 1-5 tuổi Tập 5', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/9/9/WVTGDXMZ.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Tô màu phát triển não bộ cho bé 1-5 tuổi Tập 6', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/9/9/NYO2UXWV.jpg', 103000, 100, 7, 15, 1);


INSERT INTO Books (title, author_id, publisher_id, publication_year, discount, main_img, price, quantity, category_id, subcategory_id, is_active) VALUES('Bố đã từng xa con', 1, 1, 2023, 30, 'http://static.nhanam.com.vn/thumb/0x230/crop/Books/Images/2022/7/5/Q7DKCVUQ.jpg', 103000, 100, 7, 15, 1); 

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


Drop table if exists `Book_Subcategory`;
CREATE TABLE Book_Subcategory(
	book_id int not null,
    subcategory_id int not null,
    
	constraint `FK_booksubcategory_book` FOREIGN KEY(`book_id`) References Books(`book_id`),
    constraint `FK_booksubcategory_subcategory` FOREIGN KEY(`subcategory_id`) References Sub_Categories(`subcategory_id`)
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
  full_name NVARCHAR(255),
  email VARCHAR(255) unique not null,
  password VARCHAR(255) not null,
  phone VARCHAR(20),
  enable tinyint,
  is_lock tinyint
)auto_increment=1;

INSERT INTO Users (full_name, email, password, phone, enable, is_lock)
VALUES('Bùi Thanh Duy', 'dtb1742002@gmail.com', '$2a$12$aVNMqqYZnOStzUTPO9f.JOgUWXTrzmgZy9v0UoTuSHq2pZL.3QIFC', '0383314133', 1, 0 );



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

DROP TABLE IF EXISTS `confirmation_token`;
CREATE TABLE confirmation_token (
  token_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  token VARCHAR(255) not null,
  created_at DATETIME not null,
  expired_at DATETIME not null,
  confirm_at DATETIME,
  user_id BIGINT,
  CONSTRAINT `FK_token_user` FOREIGN KEY (user_id) REFERENCES Users(user_id)
)AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `address`;
CREATE TABLE address (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  province VARCHAR(255),
  district VARCHAR(255),
  ward VARCHAR(255),
  street VARCHAR(255),
  type VARCHAR(255),
  description VARCHAR(300),
  user_id BIGINT NOT NULL,
 CONSTRAINT `FK_address_user` FOREIGN KEY (user_id) REFERENCES users(user_id)
 
)AUTO_INCREMENT=1;

INSERT INTO address (province, district, ward, street, type, description, user_id)
VALUES
('Hà Nội', 'Quận Ba Đình', 'Phường Cống Vị', 'Đường Kim Mã', 'Nhà riêng', 'Địa chỉ số 1', 1),
('Hồ Chí Minh', 'Quận 1', 'Phường Bến Nghé', 'Đường Đồng Khởi', 'Chung cư', 'Địa chỉ số 2', 1);




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

SELECT b.book_id, b.author_id, b.discount, b.is_active, b.main_img, b.price, b.publication_year, b.publisher_id, b.quantity, b.title
FROM books b
JOIN book_category c ON b.book_id = c.book_id
WHERE c.category_id = 2;


-- // INSERT BOOK_CATEGORY PROCEDURE
DELIMITER //
CREATE PROCEDURE InsertBookCategories()
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 79 DO
        INSERT INTO Book_Category (book_id, category_id)
        VALUES (counter, 1);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE InsertBookSubCategories()
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 20 DO
        INSERT INTO Book_SubCategory (book_id, subcategory_id)
        VALUES (counter, 2);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


Call InsertBookSubCategories();










