-- psql -U anselsidiadinoto shapearoo_demo < ./app/config/shapearoo-demo-database.sql

----------------- SHOP TABLES -----------------
\! echo ""

\! echo "table shops"
DROP TABLE IF EXISTS shops;
CREATE TABLE shops(
    id SERIAL,
    shop_name TEXT
);

\! echo "table shop_date"
DROP TABLE IF EXISTS shop_date;
CREATE TABLE shop_date(
    id SERIAL,
    shop_id INT,
    print_date TEXT,
    join_date TEXT
);

\! echo "table shop_location"
DROP TABLE IF EXISTS shop_location;
CREATE TABLE shop_location(
    id SERIAL,
    shop_id INT,
    shop_address TEXT
);

\! echo "table shop_printers"
DROP TABLE IF EXISTS shop_printers;
CREATE TABLE shop_printers(
    id SERIAL,
    shop_id INT,
    shop_printer TEXT
);

\! echo "table shop_filaments"
DROP TABLE IF EXISTS shop_filaments;
CREATE TABLE shop_filaments(
    id SERIAL,
    shop_id INT,
    shop_filament_type TEXT,
    shop_filament_price DECIMAL
);

\! echo "table shop_filament_colors"
DROP TABLE IF EXISTS shop_filament_colors;
CREATE TABLE shop_filament_colors(
    id SERIAL,
    shop_filament_id INT,
    shop_filament_color TEXT
);

\! echo "table shop_images"
DROP TABLE IF EXISTS shop_images;
CREATE TABLE shop_images(
    id SERIAL,
    shop_id INT,
    shop_image_position TEXT,
    shop_image_url TEXT
);

\! echo "table shop_bio"
DROP TABLE IF EXISTS shop_bio;
CREATE TABLE shop_bio(
    id SERIAL,
    shop_id INT,
    shop_bio_paragraph INT,
    shop_bio_text TEXT
);

\! echo ""

----------------- SHOP VALUES -----------------

\! echo "insert shops"
INSERT INTO shops(shop_name)
VALUES 
    ('Printaroo'), 
    ('Columbia MakerLab'),
    ('Chelsea Fabrication'),
    ('The Workshop at 87th'),
    ('Prints by the Pier'),
    ('3-D Collective');

\! echo "insert shop_location"
INSERT INTO shop_location(shop_id, shop_address)
VALUES
    (1, 'Upper Westside, Manhattan, NY'),
    (2, 'Upper Westside, Manhattan, NY'),
    (3, 'Chelsea, Manhattan, NY'),
    (4, 'Upper Eastside, Manhattan, NY'),
    (5, 'DUMBO, Brooklyn, NY'),
    (6, 'West Village, Manhattan, NY');

\! echo "insert shop_date"
INSERT INTO shop_date(shop_id, print_date, join_date)
VALUES 
    (1, '2008', '2003'),
    (2, '2015', '2022'),
    (3, '2009', '2023'),
    (4, '2018', '2022'),
    (5, '2020', '2023'),
    (6, '2011', '2023');

\! echo "insert shop_printers"
INSERT INTO shop_printers(shop_id, shop_printer)
VALUES
    (1, 'Prusa MK3'),
    (1, 'Makerbot'),
    (1, 'FormLabs'),
    (2, 'MakerBot'),
    (2, 'Ender Creality'),
    (3, 'Prusa MK3'),
    (3, 'MakerBot'),
    (3, 'FormLabs'),
    (4, 'Ender Creality'),
    (4, 'Prusa MK3'),
    (4, 'FormLabs'),
    (5, 'MakerBot'),
    (5, 'Shapeoko'),
    (5, 'Ender Creality'),
    (6, 'FormLabs'),
    (6, 'Shapoko');

\! echo "insert shop_filaments"
INSERT INTO shop_filaments
    (shop_id, 
     shop_filament_type, 
     shop_filament_price)
VALUES
    (1, 'PLA', 0.2), --1
    (1, 'ABS', 0.25), --2
    (1, 'Resin', 0.4), --3
    (2, 'PLA', 0.2), --4
    (2, 'Nylon', 0.3), --5
    (2, 'Resin', 0.45), --6
    (3, 'PLA', 0.2), --7
    (3, 'Resin', 0.4), --8
    (4, 'PLA', 0.2), --9
    (4, 'ABS', 0.23), --10
    (4, 'Wood', 0.3), --11
    (4, 'Resin', 0.5), --12
    (5, 'PLA', 0.2), --13
    (5, 'ABS', 0.22), --14
    (5, 'Resin', 0.45), --15
    (6, 'PLA', 0.2), --16
    (6, 'Carbon Fiber', 0.8); --17


\! echo "insert shop_filament_colors"
INSERT INTO shop_filament_colors(shop_filament_id, shop_filament_color)
VALUES
    (1, 'Pink'),
    (1, 'Yellow'),
    (1, 'Green'),
    (1, 'Blue'),
    (1, 'Purple'),
    (1, 'Red'),
    (1, 'Black'),
    (1, 'White'),
    (2, 'Pink'),
    (2, 'Yellow'),
    (2, 'Green'),
    (2, 'Blue'),
    (2, 'Purple'),
    (2, 'Red'),
    (2, 'Black'),
    (2, 'White'),
    (3, 'White'),
    (3, 'Clear'),

    (4, 'Pink'),
    (4, 'Yellow'),
    (4, 'Green'),
    (4, 'Blue'),
    (4, 'Purple'),
    (4, 'Red'),
    (4, 'Black'),
    (4, 'White'),
    (4, 'Pink'),
    (5, 'Yellow'),
    (5, 'Green'),
    (5, 'Blue'),
    (5, 'Purple'),
    (5, 'Red'),
    (5, 'Black'),
    (5, 'White'),
    (6, 'White'),
    (6, 'Clear'),

    (7, 'Pink'),
    (7, 'Yellow'),
    (7, 'Green'),
    (7, 'Blue'),
    (7, 'Purple'),
    (7, 'Red'),
    (7, 'Black'),
    (7, 'White'),
    (8, 'White'),
    (8, 'Clear'),

    (9, 'Yellow'),
    (9, 'Pink'),
    (9, 'Green'),
    (9, 'Blue'),
    (9, 'Purple'),
    (9, 'Red'),
    (9, 'Black'),
    (9, 'White'),
    (9, 'Pink'),
    (10, 'Yellow'),
    (10, 'Green'),
    (10, 'Blue'),
    (10, 'Purple'),
    (10, 'Red'),
    (10, 'Black'),
    (10, 'White'),
    (11, 'Purple'),
    (11, 'Red'),
    (11, 'Black'),
    (11, 'White'),
    (12, 'White'),
    (12, 'Clear'),

    (13, 'Pink'),
    (13, 'Yellow'),
    (13, 'Green'),
    (13, 'Blue'),
    (13, 'Purple'),
    (13, 'Red'),
    (13, 'Black'),
    (13, 'White'),
    (13, 'Pink'),
    (14, 'Yellow'),
    (14, 'Green'),
    (14, 'Blue'),
    (14, 'Purple'),
    (14, 'Red'),
    (14, 'Black'),
    (14, 'White'),
    (15, 'White'),
    (15, 'Clear'),

    (16, 'Pink'),
    (16, 'Yellow'),
    (16, 'Green'),
    (16, 'Blue'),
    (16, 'Purple'),
    (16, 'Red'),
    (16, 'Black'),
    (16, 'White'),
    (17, 'White'),
    (17, 'Clear'),
    (17, 'Black');

\! echo "insert shop_bio"
INSERT INTO shop_bio(shop_id, shop_bio_paragraph, shop_bio_text) 
VALUES
    (1, 1, '3D Printlife is committed to improving sustainability in 3D printing. We manufacture innovative biodegradable and eco-friendly 3d filaments in the USA, and we offer a curated collection of 3d printers, filaments, photopolymers, and accessories from some of the top manufacturers in the industry.'),

    (1, 2, 'We are also the creators of Life Support, a global networking & tech support site for all things 3d printing, and we offer online, self paced 3d printing training and badge certifications from the New Collar Network.'),

    (1, 3, '3D Printlife is committed to improving sustainability in 3D printing. We manufacture innovative biodegradable and eco-friendly 3d filaments in the USA, and we offer a curated collection of 3d printers, filaments, photopolymers, and accessories from some of the top manufacturers in the industry.'),


    (2, 1, 'Shapeways’ digital manufacturing platform offers customers access to high-quality manufacturing from start to finish through automation, innovation, and digitization. The company’s purpose-built software, a wide selection of materials and technologies, and global supply chain lower manufacturing barriers and speed delivery of quality products. Shapeways’ digital manufacturing services have empowered more than one million customers worldwide to produce more than 21 million parts using 11 different technologies and 90 different materials and finishes.'),

    (2, 2, 'Headquartered in New York City, Shapeways has ISO 9001-compliant manufacturing facilities in Livonia, MI and the Netherlands and a network of verified partners around the globe. In September 2021, Shapeways became a publicly-traded company on the NYSE under the ticker SHPW.'),


    (3, 1, 'delivering localized 3D solutions to designers & engineers making physical products. We enable you to create, iterate and prototype, faster We employ designers and technical experts to provide you the complete end-to-end assistance you need to bring your creations to life.'),

    (3, 2, 'We seamlessly bring ideas off screens and into real life. From the one-person garage operation to a global corporation making the next big thing, we help businesses of any size get parts in their hands fast, enabling them to create, iterate, and prototype faster.'),

    (3, 3, 'We believe that the secret to success is loving what you do. Thats why we are with you every step of the way offering guidance and input that will prove invaluable when you unbox your final print. We want your ideas to flourish, so if we spot room for improvement at any stage of the process well let you know and work through it together.'),


    (4, 1, 'Tangible Creative was founded by graduates of the Parsons School of Design, Nevaris AC, Eugene Chang, and Aaron Lehr in 2016. They started by printing out of the basement of Eugene’s families home in Flushing, Queens. Six months later Tangible Creative moved to its first official location, a 500 sq. ft space in midtown Manhattan. 3D Printers were stacked vertically to the ceiling to make room. They moved to their current location, a 7500 sq. ft facility in Newark, New Jersey in February of 2018.'),

    (4, 2, 'we proudly offer FDM plastic 3D printing services to clients looking for rapid prototyping and production-grade parts. With over 100 FDM 3D printers in our Newark, New Jersey, warehouse, we can produce thousands of parts with unparalleled speed and accuracy. Our custom FDM 3D printing process is perfect for creating product prototypes, models, and end-use parts for various applications, including architectural modeling, experiential marketing, consumer products, and more. Our team of expert designers works closely with clients to understand their specific needs and optimize our FDM printing process to meet their goals.'),

    (4, 3, 'Fused Deposition Modelling (“FDM”) or Fused Filament Fabrication (FFF), the most common 3D printing process, is a material extrusion type additive manufacturing process. S.Scott Crump, the Stratasys founder, first developed and patented the FDM 3D printing process in 1988. And when the patent expired in 2009, it paved the way for commercial FDM printers.'),

    (5, 3, 'Our clients range from first-timers to professional designers. Our approach allows anyone to engage with the product design process. We start by reviewing your artwork or napkin sketches, then we take you through a fun and collaborative design experience. '),

    (5, 3, 'If you just googled “3D Printing Near Me”, you’ve come to the right place! We specialize in designing for all the different types of 3D printers. Our "robot farm" of 30+ 3D printers is available for low volume production runs using recycled or bio-based PLA plastics. We also offer 3D-printing and fabrication in a variety of other materials such as steel, aluminum, acrylic, wood and many more.'),

    (5, 3, 'One of the big advantages of desktop 3D printers is their compact size and low power requirements. These features allow us to bring our studio to you! Our events are fully brandable and tailored to each clients specific goals. We can bring 3D scanners and turn your guests into toys, or we can demonstrate how to 3D-print from single use plastic waste... right there in the room!'),

    (6, 3, 'Softmotion 3D is a lenticular printing company that was founded in 1997 by Guy Brisson. We specialize in the design and production of lenticular images and are committed to providing our customers with the highest level of satisfaction. We offer a range of lenticular printing services, including design assistance, conversion, printing, finishing, and installation, all at affordable prices.'),

    (6, 3, 'Softmotion® 3D is the leading lenticular 3D fine art producer with over 25 years of experience and thousands of satisfied clients. Our team specializes in lenticular 3D creations and printing, and we are dedicated to delivering high-quality products and services to our clients.'),

    (6, 3, 'We constantly push the boundaries of lenticular technology and strive to create innovative and visually stunning products that help our clients stand out in the crowded marketplace. Whether you are a retailer looking to increase sales with motion displays, a designer seeking to create a unique and interactive experience for your clients, or an artist looking to showcase your work in a new and exciting way, we have the expertise and resources to help you succeed.');

\! echo "insert shop_images"
INSERT INTO shop_images(shop_id, shop_image_position, shop_image_url)
VALUES

    (1, 1, 'https://images.cults3d.com/Vg8oZXknMR6sBDMeRt6QD_t598Y=/246x246/filters:no_upscale()/https://files.cults3d.com/uploaders/13329175/illustration-file/af877132-9b2a-4718-8a66-e32c1ff1a5a9/download-32.png'),
    (1, 2, 'https://images-platform.99static.com/4JX8mYS5sPNWcoA3yqTvD_Gn6BI=/0x0:2000x2000/500x500/top/smart/99designs-contests-attachments/84/84229/attachment_84229189'),
    (1, 3, 'https://miro.medium.com/v2/resize:fit:1200/1*l9HdvYyNC9hjiEGjqQha_Q.jpeg'),
    (1, 4, 'https://i0.wp.com/me3d.com.au/wp-content/uploads/2022/05/57976-22.-sd-microsd-holder-customizable.jpg?fit=628%2C472&ssl=1&w=640'),
    (1, 5, 'https://kidscreen.com/wp/wp-content/uploads/2023/02/3D_Toybox-WP.png'),

    (2, 1, 'https://www.format.com/wp-content/uploads/05_copie_large.jpg'),
    (2, 2, 'https://www.zarla.com/images/zarla-next-level-print-1x1-2400x2400-20220124-jh3krjvdkpwtrrxgmfjr.png?crop=1:1,smart&width=250&dpr=2'),
    (2, 3, 'https://i0.wp.com/nerdbot.com/wp-content/uploads/2022/03/rocktapus.jpg?fit=1020%2C669&ssl=1'),
    (2, 4, 'https://i.pinimg.com/474x/e4/23/7a/e4237a3c87a16c48a2431d7fbe01547a--d-prints-d-design.jpg'),
    (2, 5, 'https://www.yankodesign.com/images/design_news/2022/01/this-parametric-3d-printed-sneaker-is-made-entirely-out-of-one-single-flexible-material/parametriks_print_001_1.jpg'),

    (3, 1, 'https://dvyvvujm9h0uq.cloudfront.net/com/articles/1643770932-601781-foldingleafbowljpg.png'),
    (3, 2, 'https://printie3d.com/jo/wp-content/uploads/2019/11/delivery-new.png'),
    (3, 3, 'https://files.cults3d.com/uploaders/17290882/illustration-file/1836c8d8-53ba-4bc6-ac36-61cfe0f22b51/Artboard-6-100.jpg'),
    (3, 4, 'https://www.3dnatives.com/en/wp-content/uploads/sites/2/2021/08/Bottle-Opener.jpg'),
    (3, 5, 'https://www.geeetech.com/blog/wp-content/uploads/2018/01/piklerick-e1516366582913.jpg'),

    (4, 1, 'https://i.etsystatic.com/25969312/r/il/3f39e4/2692629675/il_570xN.2692629675_7kze.jpg'),
    (4, 2, 'https://www.clipartmax.com/png/middle/366-3663260_3d-print-shop-ultimaker-logo.png'),
    (4, 3, 'https://stlmotherhood.com/wp-content/uploads/2020/05/3d-printed-toys-Minecraft-egg-fidget-top.jpg'),
    (4, 4, 'https://static.dezeen.com/uploads/2013/07/dezeen_The-Sugar-Lab-by-Kyle-and-Liz-von-Hasseln-featured.jpg'),
    (4, 5, 'https://images.squarespace-cdn.com/content/v1/54d135aae4b0553df777d404/1432052394765-PL9655XZNX0S59LUM1KS/iphone-3d-printed-heels-3.jpg?format=1000w'),

    (5, 1, 'https://i.pinimg.com/1200x/6d/92/6e/6d926e805c290944c3672fb841abd172.jpg'),
    (5, 2, 'https://global3d.com.au/wp-content/uploads/2023/03/3d-sla-printing-services-2.svg'),
    (5, 3, 'https://www.tctmagazine.com/downloads/7755/download/ford-3d-printing-piecemaker1.png?cb=50f137332437440c984da1b89c312b1e'),
    (5, 4, 'https://www.designnews.com/sites/designnews.com/files/Design%20News/MyMiniFactcory_resize-m-003_700W_0.jpg'),
    (5, 5, 'https://www.3dsourced.com/wp-content/uploads/2020/12/Screenshot-2023-03-27-at-18-09-54-hfgdjgfhdjj-00-00-00-00-5.jpg-JPEG-Image-1500-%C3%97-1500-pixels-%E2%80%94-Scaled-63.jpg'),

    (6, 1, 'https://www.business2community.com/wp-content/uploads/2015/06/20130618-Modibot-Mo-Characters.jpg.jpg'),
    (6, 2, 'https://www.rapidmade.com/wp-content/uploads/2022/09/printdesign.png'),
    (6, 3, 'https://i.etsystatic.com/25379417/r/il/3a1630/2563721954/il_794xN.2563721954_cgqf.jpg'),
    (6, 4, 'https://i.etsystatic.com/26734954/r/il/083835/3038912946/il_794xN.3038912946_209g.jpg'),
    (6, 5, 'https://www.contemporist.com/wp-content/uploads/2017/03/3d-printed-modern-wood-planters-080317-1113-01-800x420.jpg');
    

\! echo ""

---------------- CONSOLE TEST ------------------

-- SELECT * FROM shops;
-- SELECT * FROM shop_location;
-- SELECT * FROM shop_filaments;
-- SELECT * FROM shop_filament_colors;
-- SELECT * FROM shop_bio;