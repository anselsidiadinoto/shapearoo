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
    shop_id INT,
    print_date TEXT,
    join_date TEXT
);

\! echo "table shop_location"
DROP TABLE IF EXISTS shop_location;
CREATE TABLE shop_location(
    shop_id INT,
    shop_address TEXT
);

\! echo "table shop_printers"
DROP TABLE IF EXISTS shop_printers;
CREATE TABLE shop_printers(
    shop_id INT,
    shop_printer TEXT
);

\! echo "table shop_filaments"
DROP TABLE IF EXISTS shop_filaments;
CREATE TABLE shop_filaments(
    shop_id INT,
    shop_filament_type TEXT,
    shop_filament_price DECIMAL
);

\! echo "table shop_filament_colors"
DROP TABLE IF EXISTS shop_filament_colors;
CREATE TABLE shop_filament_colors(
    shop_filament_type TEXT,
    shop_filament_color TEXT
);

\! echo "table shop_images"
DROP TABLE IF EXISTS shop_images;
CREATE TABLE shop_images(
    shop_id INT,
    shop_image_position TEXT,
    shop_image_url TEXT
);

\! echo "table shop_bio"
DROP TABLE IF EXISTS shop_bio;
CREATE TABLE shop_bio(
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
    (1, 'PLA', 0.2), 
    (1, 'ABS', 0.25), 
    (1, 'Resin', 0.4), 
    (2, 'PLA', 0.2), 
    (2, 'Nylon', 0.3), 
    (2, 'Resin', 0.45),
    (3, 'PLA', 0.2), 
    (3, 'Resin', 0.4),
    (4, 'PLA', 0.2), 
    (4, 'ABS', 0.23), 
    (4, 'Wood', 0.3), 
    (4, 'Resin', 0.5), 
    (5, 'PLA', 0.2), 
    (5, 'ABS', 0.22), 
    (5, 'Resin', 0.45), 
    (6, 'PLA', 0.2), 
    (6, 'Carbon Fiber', 0.8); 


\! echo "insert shop_filament_colors"
INSERT INTO shop_filament_colors(shop_filament_type, shop_filament_color)
VALUES
    ('PLA', 'Pink'),
    ('PLA', 'Yellow'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('ABS', 'Pink'),
    ('ABS', 'Yellow'),
    ('ABS', 'Green'),
    ('ABS', 'Blue'),
    ('ABS', 'Purple'),
    ('ABS', 'Red'),
    ('ABS', 'Black'),
    ('ABS', 'White'),
    ('Resin', 'White'),
    ('Resin', 'Clear'),

    ('PLA', 'Pink'),
    ('PLA', 'Yellow'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('PLA', 'Pink'),
    ('Nylon', 'Yellow'),
    ('Nylon', 'Green'),
    ('Nylon', 'Blue'),
    ('Nylon', 'Purple'),
    ('Nylon', 'Red'),
    ('Nylon', 'Black'),
    ('Nylon', 'White'),
    ('Resin', 'White'),
    ('Resin', 'Clear'),

    ('PLA', 'Pink'),
    ('PLA', 'Yellow'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('Resin', 'White'),
    ('Resin', 'Clear'),

    ('PLA', 'Yellow'),
    ('PLA', 'Pink'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('PLA', 'Pink'),
    ('ABS', 'Yellow'),
    ('ABS', 'Green'),
    ('ABS', 'Blue'),
    ('ABS', 'Purple'),
    ('ABS', 'Red'),
    ('ABS', 'Black'),
    ('ABS', 'White'),
    ('Wood', 'Purple'),
    ('Wood', 'Red'),
    ('Wood', 'Black'),
    ('Wood', 'White'),
    ('Resin', 'White'),
    ('Resin', 'Clear'),

    ('PLA', 'Pink'),
    ('PLA', 'Yellow'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('PLA', 'Pink'),
    ('ABS', 'Yellow'),
    ('ABS', 'Green'),
    ('ABS', 'Blue'),
    ('ABS', 'Purple'),
    ('ABS', 'Red'),
    ('ABS', 'Black'),
    ('ABS', 'White'),
    ('Resin', 'White'),
    ('Resin', 'Clear'),

    ('PLA', 'Pink'),
    ('PLA', 'Yellow'),
    ('PLA', 'Green'),
    ('PLA', 'Blue'),
    ('PLA', 'Purple'),
    ('PLA', 'Red'),
    ('PLA', 'Black'),
    ('PLA', 'White'),
    ('Carbon Fiber', 'White'),
    ('Carbon Fiber', 'Clear'),
    ('Carbon Fiber', 'Black');

\! echo "insert shop_bio"
INSERT INTO shop_bio(shop_id, shop_bio_paragraph, shop_bio_text) 
VALUES
    (1, 1, '3D Printlife is committed to improving sustainability in 3D printing. We manufacture innovative biodegradable and eco-friendly 3d filaments in the USA, and we offer a curated collection of 3d printers, filaments, photopolymers, and accessories from some of the top manufacturers in the industry.'),

    (1, 2, 'We are also the creators of Life Support, a global networking & tech support site for all things 3d printing, and we offer online, self paced 3d printing training and badge certifications from the New Collar Network.'),

    (1, 3, '3D Printlife is committed to improving sustainability in 3D printing. We manufacture innovative biodegradable and eco-friendly 3d filaments in the USA, and we offer a curated collection of 3d printers, filaments, photopolymers, and accessories from some of the top manufacturers in the industry.'),


    (2, 1, 'Shapeways digital manufacturing platform offers customers access to high-quality manufacturing from start to finish through automation, innovation, and digitization. The companys purpose-built software, a wide selection of materials and technologies, and global supply chain lower manufacturing barriers and speed delivery of quality products. Shapeways’ digital manufacturing services have empowered more than one million customers worldwide to produce more than 21 million parts using 11 different technologies and 90 different materials and finishes.'),

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

\! echo "table designers"
DROP TABLE IF EXISTS designers;
CREATE TABLE designers(
    id SERIAL,
    designer_name TEXT
);

\! echo "table designer_date"
DROP TABLE IF EXISTS designer_date;
CREATE TABLE designer_date(
    designer_id INT,
    designer_date TEXT,
    join_date TEXT
);

\! echo "table designer_bio"
DROP TABLE IF EXISTS designer_bio;
CREATE TABLE designer_bio(
    designer_id INT,
    designer_bio_paragraph INT,
    designer_bio_text TEXT
);

\! echo "table designer_images"
DROP TABLE IF EXISTS designer_images;
CREATE TABLE designer_images(
    designer_id INT,
    designer_image_position TEXT,
    designer_image_url TEXT
);

\! echo ""

\! echo "insert designers"
INSERT INTO designers(designer_name)
VALUES
    ('hantaro2233'),
    ('Muds3DGoods'),
    ('Yorkshire3D'),
    ('LostTravelerLee3D'),
    ('3DConcemptToCreation'),
    ('STL3DPrintGod'),
    ('7Printz'),
    ('WangMander'),
    ('Cobotech'),
    ('DERXYCRAFT');

\! echo "insert designer_date"
INSERT INTO designer_date(designer_id, designer_date, join_date)
VALUES
    (1,'2015','2023'),
    (2,'2013','2022'),
    (3,'2019','2023'),
    (4,'2021','2022'),
    (5,'2006','2023'),
    (6,'2010','2022'),
    (7,'2015','2023'),
    (8,'2022','2022'),
    (9,'2016','2022'),
    (10,'2012','2023');

\! echo "insert_designer_bio"
INSERT INTO designer_bio(designer_id, designer_bio_paragraph, designer_bio_text)
VALUES
    (1, 1, 'We believe that play has always been an accessible way of learning culture and identity. Drawing inspiration from this, we want to create new ways of play for the present and further develop for the future. An illustrator artist and graphic designer in Phoenix, Arizona. He specializes in helping individuals and companies increase target-market visibility by creating eye-catching artwork. He’s committed to staying current with trending design and constantly challenges himself to learn more.'),
    (2, 1, 'A DELIBERATE AND DYNAMIC, FULL-SERVICE CREATIVE AGENCY WITH A DESIGN & TECHNOLOGY FOCUS. WE BUILT THE STUDIO OUT OF OUR OWN DISILLUSIONMENT WITH THE FAST-PACED CREATIVE LANDSCAPE IN NEW YORK CITY (AND BEYOND) — BLOATED BUDGETS, INEXPERIENCED PEOPLE, AND WORK THAT DIDN’T SOLVE ANY PROBLEMS, BEYOND LOOKING GREAT IN THE PORTFOLIO OF AGENCY X. THAT DISILLUSIONMENT, AND A SHARED FIXATION WITH SWEATING THE DETAILS, IS WHY WE DO WHAT WE DO.'),
    (3, 1, 'SUP surfer, traveler, hiker, cook, mother, and a fan of holistic health. Driven by design that has purpose, is functional yet emotionally rich. Thrive in a collaborative environment spanning disciplines and bringing together teams of creatives aimed at making experiences that are proactive, supportive, dependable, and delightful. Nothing ventured, nothing gained. With a background in psychology, she combines an empathy for the consumer experience with her natural talent creating unique and memorable visuals.'),
    (4, 1, 'Holistic, fluid and at times playfully unpredictable, our approach to crafting visual identities is macro in framework and micro in detail. Work that is critically selective yet emotionally rich, spanning disciplines and bringing together teams of creatives attuned to the needs of today’s clients.'),
    (5, 1, 'I am a creative problem solver with experience across all mediums, and have a passion for elevating brands through great visual design. I love to work with brands who are seeing a refresh, or who just want to continue evolving and looking towards the future. While very diverse, her aesthetic approach often merges minimalism with a distinct sense of play. Strategically, her work aims to elevate brand offerings by pinpointing audience appeal and distilling core messaging down to its clearest and freshest visual form.'),
    (6, 1, 'My work distinguishes itself with bold, unexpected materials & color combinations while her love of fine art is peppered throughout with the inclusion of multimedia art forms such as illustration, screen printing, & ceramics. Through collaboration with a diverse range of clients & varied industries, she explores function, encourages interaction, and successfully differentiates narratives through the visualization of her designwork.'),
    (7, 1, 'My aim is to investigate the processes of type design —and design itself— as a non-dogmatic practice. Stressing the form, stretching the concepts up to corrupting rules and misuse of tools. I like to conceive typography as system and medium. He aims to match creativity and marketing, enjoys the difference in viewers and thrive when given the opportunity to form concepts from beginning to end. He attempts for honest, original and true communication by partnering with people and brands who he admires'),
    (8, 1, 'An internationally recognized brand strategy and design studio committed to the creation of forward-looking identities and experiences. We translate narratives into systems to create long-term, scalable business value. The studio embraces the arts and technology equally, providing guidance to clients that pursue influential change through their products and services.'),
    (9, 1, 'We are a diverse group of thinkers, designers, and collaborators— with global expertise. We are practitioners, who lead by example, partnering with clients to generate new approaches to work and collaboration. Collectively, we push brands forward. High-contrast. Thick and decisive, bold and iconic, blunt and minimal. A sterling muse smashed to atoms. With respect to the rules, there are no rules.'),
    (10, 1, 'We’re nimble, allowing us to put thoughtful design first, every time. Our clients, are more than just that — they are partners. We collaborate with like-minded folks, on projects we are inspired by. This lean and mean structure helps maintain our focus and priorities, (which we think) makes for better work. The most fruitful relationships are those where we walk away from the process having learned something new. I collaborate with people, teams, and businesses to develop design systems, strategies, and processes to do better and more interesting creative work.');

\! echo "insert designer_images"
INSERT INTO designer_images(designer_id, designer_image_position, designer_image_url)
VALUES
    (1, 1, 'https://stlmotherhood.com/wp-content/uploads/2020/05/3d-printed-toys-Minecraft-egg-fidget-top.jpg'),
    (1, 2, 'https://facfox.com/wp-content/uploads/2020/10/3d-printed-pumpkin-spider-transf-gigapixel-scale-2_00x.jpg'),
    (1, 3, 'https://files.cults3d.com/uploaders/7246533/illustration-file/1454428595-7863-4392/Capture_d_e_cran_2016-02-02_a__16.50.48.png'),
    (1, 4, 'https://files.cults3d.com/uploaders/21565954/illustration-file/9d78ca99-d1fb-46ea-b002-8d5f8330c0a6/511E638B-D220-486A-A97E-9AAACB8167AC.jpeg'),
    (1, 5, 'https://jingdaily.com/wp-content/uploads/2012/03/china-file03.jpg'),

    (2, 1, 'https://cdn2.sculpteo.com/wp-content/uploads/2019/07/VeroWhite-02.jpg'),
    (2, 2, 'https://www.liqcreate.com/wp-content/uploads/2021/03/lithophane3-1024x1024.jpg'),
    (2, 3, 'https://www.fabbaloo.com/wp-content/uploads/2020/09/nano-coated-white.jpg'),
    (2, 4, 'https://parts-badger.com/wp-content/uploads/2022/01/SLS-Part-2E.jpg'),
    (2, 5, 'https://foyr.com/learn/wp-content/uploads/2021/11/how-to-market-yourself-as-an-interior-designer-500x500.jpg'),

    (3, 1, 'https://assets.rbl.ms/26144911/origin.jpg'),
    (3, 2, 'https://www.yankodesign.com/images/design_news/2022/01/this-parametric-3d-printed-sneaker-is-made-entirely-out-of-one-single-flexible-material/parametriks_print_001_2.jpg'),
    (3, 3, 'https://www.google.com/url?sa=i&url=https%3A%2F%2F3dshoes.com%2Fblogs%2Fnews%2Fparametric-3d-printed-sneaker&psig=AOvVaw37shxg_oB5pYHdaonxM463&ust=1692302313100000&source=images&cd=vfe&opi=89978449&ved=0CA8QjRxqFwoTCJiZ08P74YADFQAAAAAdAAAAABAa'),
    (3, 4, 'https://fusedfootwear.com/cdn/shop/products/FUSED-Oki-Translucent-D2_1024x.jpg?v=1620270472'),
    (3, 5, 'https://competition.adesignaward.com/award-winner-designer.php?profile=182659'),

    (4, 1, 'https://blog.prusa3d.com/wp-content/uploads/2016/12/8.jpg'),
    (4, 2, 'https://i.all3dp.com/workers/images/fit=scale-down,w=1200,h=675,gravity=0.5x0.5,format=auto/wp-content/uploads/2022/07/26134558/spitfire-cahitt-via-thingiverse-220726.jpg'),
    (4, 3, 'https://static.wixstatic.com/media/0cdfd4_0f814a1fe65e47dea5608e2af85ded87~mv2.jpeg/v1/fill/w_640,h_482,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/0cdfd4_0f814a1fe65e47dea5608e2af85ded87~mv2.jpeg'),
    (4, 4, 'https://www.gambody.com/blog/wp-content/uploads/2016/09/boeing-737-300-airplane-3d-model.jpg'),
    (4, 5, 'https://assets-global.website-files.com/5ec7dad2e6f6295a9e2a23dd/622541367142114a4e272cd6_virtual-talent-showcase.jpg'),

    (5, 1, 'https://ik.imagekit.io/printapot/wp-content/uploads/IMG_0522_instagram-600x600.jpg'),
    (5, 2, 'https://i.etsystatic.com/24139329/r/il/913b78/3927058741/il_570xN.3927058741_4fzi.jpg'),
    (5, 3, 'https://media.printables.com/media/prints/225251/images/2056517_ec46c87c-5ed1-44ed-b8c6-64dcaed597cc/thumbs/cover/320x240/jpg/dsc06287.webp'),
    (5, 4, 'https://i.etsystatic.com/29902982/r/il/02be2d/3246737093/il_fullxfull.3246737093_7vw1.jpg'),
    (5, 5, 'https://media.licdn.com/dms/image/C4E03AQFinbEz7kaUKg/profile-displayphoto-shrink_800_800/0/1516293217629?e=2147483647&v=beta&t=qNHmQ9WRMia5qAA9Yx6d6SdU-KsT0sA_J5ZvEOs9lis'),

    (6, 1, 'https://cdn2.sculpteo.com/wp-content/uploads/elementor/thumbs/MaquetteMerveille_FtNb4di-o8p0lnpbcmzzzbwjet25fz4bw50ocfd5a8taekvh20.jpg'),
    (6, 2, 'https://images.ctfassets.net/dovsnf6qrcem/Ip8pH356Kqyuwa6Ocq2QM/47824f5d0efc73dde2a071d1b2fd051e/3D_printed_architectural_model_side_view.jpg?w=600&h=406&fl=progressive&q=50&fm=jpg'),
    (6, 3, 'https://www.tctmagazine.com/downloads/6944/download/Model%203.jpg?cb=f5521e4fd481aacda99ce3bc413746fa'),
    (6, 4, 'https://files.cults3d.com/uploaders/13452529/illustration-file/68112e39-7337-4362-8919-05dfac642ad1/2019-04-07%2013.37.12-1.jpg'),
    (6, 5, 'https://graphicriver.img.customer.envatousercontent.com/files/411362792/Preview_Images.jpg?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=590&s=4c4f61b0fd5fcab9342a6f531c8a18c5'),

    (7, 1, 'https://images.squarespace-cdn.com/content/v1/5af1803d506fbef0bc69bead/1585905645495-VVLIWLU4CTC9IP30TRRK/Beijing_Stadium_1%28edited%29.jpg?format=2500w'),
    (7, 2, 'https://3dwithus.com/wp-content/uploads/2023/02/Architecture-and-Landmarks-Miniatures.jpg'),
    (7, 3, 'https://top3dshop.com/image/catalog/blog/review_3/deciding_on_the_best_3d_printer_for_miniatures/image_29.jpg'),
    (7, 4, 'https://howto3dprint.net/wp-content/uploads/2022/09/London-3D-printed-edited.png'),
    (7, 5, 'https://media.licdn.com/dms/image/D4E03AQGx_PZJjwzCsQ/profile-displayphoto-shrink_800_800/0/1679860284422?e=2147483647&v=beta&t=tgUYkQN2o_7oa2WdYW-nWgNw6ZjGbQTORejmDouFcNg'),

    (8, 1, 'https://files.cults3d.com/uploaders/18032340/illustration-file/4759d9d3-33df-4e94-ab0b-107c9e9b21b9/hamsterhouse01.jpg'),
    (8, 2, 'https://img1.yeggi.com/page_images_cache/4072456_hamsters-house-hamsters-house-3d-printable-model-to-download-'),
    (8, 3, 'https://images.cults3d.com/yfou4B7D0xp4xfkoGyO6CgKQrrE=/246x246/filters:no_upscale()/https://files.cults3d.com/uploaders/26785396/illustration-file/762fb68e-77b4-41f3-af86-cc6e4cadd557/hamster-rest.jpg'),
    (8, 4, 'https://www.naturepl.com/cache/pcache2/01320067.jpg'),
    (8, 5, 'https://i.pinimg.com/originals/f5/b4/a8/f5b4a88e86f4d376fc9eb53b327c2f88.png'),

    (9, 1, 'https://static.dezeen.com/uploads/2013/07/dezeen_The-Sugar-Lab-by-Kyle-and-Liz-von-Hasseln-featured.jpg'),
    (9, 2, 'https://assets.pinshape.com/uploads/image/file/98059/gyroid-cube-3d-printing-98059.JPG'),
    (9, 3, 'https://www.advancedsciencenews.com/wp-content/uploads/2022/06/3D-printing-self-sensing-materials.jpg'),
    (9, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJILNqS7v6HhVPFoz8vQYMIQx6brnmlBN1iDX1t-lrDK_IzjtCbgM4cUJYmu1WxI_wLIw&usqp=CAU'),
    (9, 5, 'https://www.westend61.de/images/0000967393pw/portrait-of-young-female-computer-aided-designer-in-design-studio-CUF22226.jpg'),

    (10, 1, 'https://i.all3dp.com/workers/images/fit=scale-down,w=1200,h=630,gravity=0.5x0.5,format=jpeg/wp-content/uploads/2022/05/14105200/phone-stand-tilt.jpg'),
    (10, 2, 'https://content.instructables.com/F66/1P3T/IXUQ1QA4/F661P3TIXUQ1QA4.jpg?auto=webp'),
    (10, 3, 'https://cdn.trendhunterstatic.com/thumbs/3dprinted-phone.jpeg?auto=webp'),
    (10, 4, 'https://i.imgur.com/ETIuQvB.jpg'),
    (10, 5, 'https://media.istockphoto.com/id/1350738308/photo/young-office-worker-woman-with-laptop-looking-at-camera.jpg?s=612x612&w=0&k=20&c=2DBar5Le-az2Yh63kO2soZOWb013fodti9KoUg1Y-_g=');



\! echo ""

\! echo "table designs"
DROP TABLE IF EXISTS designs;
CREATE TABLE designs(
    id SERIAL,
    designer_id INT,
    design_name TEXT,
    design_price DECIMAL,
    design_weight DECIMAL
);

\! echo "table_design_images"
DROP TABLE IF EXISTS design_images;
CREATE TABLE design_images(
    design_id INT,
    design_image_position TEXT,
    design_image_url TEXT
);

\! echo "table_design_information"
DROP TABLE IF EXISTS design_information;
CREATE TABLE design_information(
    design_id INT,
    design_information_paragraph INT,
    design_information_text TEXT
);

\! echo ""

\! echo "insert designs"
INSERT INTO designs(designer_id, design_name, design_price, design_weight)
VALUES 
    (1, 'Red Lobster', 5.00, 23), --1
    (1, 'Pumkin Spider', 4.00, 30), --2 
    (2, '3DX Gears', 2.00, 35 ), --3
    (2, 'Converse World', 7.00, 100), --4
    (2, '3D Coca-cola', 3.50, 80), --5
    (3, 'High Fidelity Shoes', 10.00, 300 ), --6
    (4, '1/50 VTOL Aeroplane', 7.00, 250 ), --7
    (4, 'Boing 787 Dreamliner', 8.50, 350), --8
    (4, 'Mitsubishi A6M Zero', 7.25, 90), --9
    (5, 'Alvaro Siza Planter', 5.00, 125), --10
    (5, 'Elephant Succulent', 3.50, 50), --11
    (6, 'Notre-Dame Section', 6.00, 90), --12
    (6, 'Glazing 1/40', 4.50, 150), --13
    (6, 'Ronchamp LeCorbuzier', 5.00, 95), --14
    (6, 'Broolyn Brownstone', 6.25, 170), --15
    (7, 'Midtown Skyline', 4.00, 120), --16
    (7, 'London Central', 6.35, 215), --17
    (8, 'Smurf Cottage', 8.00, 75), --18
    (8, 'Hamster Hammock', 6.00, 85), --19
    (8, 'Hybrid Hide', 4.50, 98), --20
    (9, 'Tesseract', 9.00, 120), --21
    (9, 'Raja Coral', 7.50, 150), --22
    (10, 'Retro iPhone Cover', 6.40, 90), --23
    (10, 'Gearbox Seethrough', 5.00, 40); --24


\! echo "insert design_images"
INSERT INTO design_images(design_id, design_image_position, design_image_url)
VALUES
    (1, 1, 'https://files.cults3d.com/uploaders/21565954/illustration-file/9d78ca99-d1fb-46ea-b002-8d5f8330c0a6/511E638B-D220-486A-A97E-9AAACB8167AC.jpeg'),
    (2, 1, 'https://facfox.com/wp-content/uploads/2020/10/3d-printed-pumpkin-spider-transf-gigapixel-scale-2_00x.jpg'),
    (3, 1, 'https://cdn2.sculpteo.com/wp-content/uploads/2019/07/VeroWhite-02.jpg'),
    (4, 1, 'https://www.fabbaloo.com/wp-content/uploads/2020/09/nano-coated-white.jpg'),
    (5, 1, 'https://www.liqcreate.com/wp-content/uploads/2021/03/lithophane3-1024x1024.jpg'),
    (6, 1, 'https://assets.rbl.ms/26144911/origin.jpg'),
    (7, 1, 'https://static.wixstatic.com/media/0cdfd4_0f814a1fe65e47dea5608e2af85ded87~mv2.jpeg/v1/fill/w_640,h_482,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/0cdfd4_0f814a1fe65e47dea5608e2af85ded87~mv2.jpeg'),
    (8, 1, 'https://www.gambody.com/blog/wp-content/uploads/2016/09/boeing-737-300-airplane-3d-model.jpg'),
    (9, 1, 'https://i.all3dp.com/workers/images/fit=scale-down,w=1200,h=675,gravity=0.5x0.5,format=auto/wp-content/uploads/2022/07/26134558/spitfire-cahitt-via-thingiverse-220726.jpg'),
    (10, 1, 'https://i.etsystatic.com/29902982/r/il/02be2d/3246737093/il_fullxfull.3246737093_7vw1.jpg'),
    (11, 1, 'https://ik.imagekit.io/printapot/wp-content/uploads/IMG_0522_instagram-600x600.jpg'),
    (12, 1, 'https://cdn2.sculpteo.com/wp-content/uploads/elementor/thumbs/MaquetteMerveille_FtNb4di-o8p0lnpbcmzzzbwjet25fz4bw50ocfd5a8taekvh20.jpg'),
    (13, 1, 'https://images.ctfassets.net/dovsnf6qrcem/Ip8pH356Kqyuwa6Ocq2QM/47824f5d0efc73dde2a071d1b2fd051e/3D_printed_architectural_model_side_view.jpg?w=600&h=406&fl=progressive&q=50&fm=jpg'),
    (14, 1, 'https://www.tctmagazine.com/downloads/6944/download/Model%203.jpg?cb=f5521e4fd481aacda99ce3bc413746fa'),
    (15, 1, 'https://files.cults3d.com/uploaders/13452529/illustration-file/68112e39-7337-4362-8919-05dfac642ad1/2019-04-07%2013.37.12-1.jpg'),
    (16, 1, 'https://top3dshop.com/image/catalog/blog/review_3/deciding_on_the_best_3d_printer_for_miniatures/image_29.jpg'),
    (17, 1, 'https://howto3dprint.net/wp-content/uploads/2022/09/London-3D-printed-edited.png'),
    (18, 1, 'https://files.cults3d.com/uploaders/18032340/illustration-file/4759d9d3-33df-4e94-ab0b-107c9e9b21b9/hamsterhouse01.jpg'),
    (19, 1, 'https://images.cults3d.com/yfou4B7D0xp4xfkoGyO6CgKQrrE=/246x246/filters:no_upscale()/https://files.cults3d.com/uploaders/26785396/illustration-file/762fb68e-77b4-41f3-af86-cc6e4cadd557/hamster-rest.jpg'),
    (20, 1, 'https://img1.yeggi.com/page_images_cache/4072456_hamsters-house-hamsters-house-3d-printable-model-to-download-'),
    (21, 1, 'https://static.dezeen.com/uploads/2013/07/dezeen_The-Sugar-Lab-by-Kyle-and-Liz-von-Hasseln-featured.jpg'),
    (22, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJILNqS7v6HhVPFoz8vQYMIQx6brnmlBN1iDX1t-lrDK_IzjtCbgM4cUJYmu1WxI_wLIw&usqp=CAU'),
    (23, 1, 'https://cdn.trendhunterstatic.com/thumbs/3dprinted-phone.jpeg?auto=webp'),
    (24, 1, 'https://i.imgur.com/ETIuQvB.jpg');

\! echo "insert design_information"
INSERT INTO design_information(design_id, design_information_paragraph, design_information_text)
VALUES
    (1, 1, 'Lobsters are a family (Nephropidae, synonym Homaridae[2]) of marine crustaceans. They have long bodies with muscular tails and live in crevices or burrows on the sea floor. Three of their five pairs of legs have claws, including the first pair, which are usually much larger than the others. Highly prized as seafood, lobsters are economically important and are often one of the most profitable commodities in the coastal areas they populate.[3]'),
    (2, 1, 'A pumpkin is a vernacular term for mature winter squash of species and varieties in the genus Cucurbita that has culinary and cultural significance[1][2] but no agreed upon botanical or scientific meaning.[3] The term pumpkin is sometimes used interchangeably with "squash" or "winter squash"'),
    (3, 1, 'A gear is a rotating circular machine part having cut teeth or, in the case of a cogwheel or gearwheel, inserted teeth (called cogs), which mesh with another (compatible) toothed part to transmit (convert) torque and speed. The basic principle behind the operation of gears is analogous to the basic principle of levers.[1] A gear may also be known informally as a cog. '),
    (4, 1, 'Converse customized shoes for the New York Renaissance (the "Rens"), the first all-African-American professional basketball team. The shoes were designed to be "non-skid", which gave basketball players better grip.[11] An extra strip of rubber was eventually added to protect the shoes from constant pivoting; this was called the "pivot button".'),
    (5, 1, 'Coca-Cola, or Coke, is a carbonated soft drink manufactured by the Coca-Cola Company. In 2013, Coke products were sold in over 200 countries worldwide, with consumers drinking more than 1.8 billion company beverage servings each day.[1] Coca-Cola ranked No. 87 in the 2018 Fortune 500 list of the largest United States corporations by total revenue.[2] Based on Interbrands best global brand study of 2020, Coca-Cola was the worlds sixth most valuable brand.[3]'),
    (6, 1, 'Sneakers have gone by a variety of names, depending on geography and changing over the decades. The broader category inclusive of sneakers is athletic shoes. The term athletic shoes is typically used for shoes utilized for jogging or road running and indoor sports such as basketball, but tends to exclude shoes for sports played on grass such as association football and rugby football, which are generally known in North America as "cleats" and in British English as "boots" or "studs"'),
    (7, 1, 'A vertical take-off and landing (VTOL) aircraft is one that can take off and land vertically without relying on a runway. This classification can include a variety of types of aircraft including helicopters as well as thrust-vectoring fixed-wing aircraft and other hybrid aircraft with powered rotors such as cyclogyros/cyclocopters and gyrodynes.[1]'),
    (8, 1, 'The Boeing 787 Dreamliner is an American wide-body jet airliner developed and manufactured by Boeing Commercial Airplanes. After dropping its unconventional Sonic Cruiser project, Boeing announced the conventional 7E7 on January 29, 2003, which focused largely on efficiency. The program was launched on April 26, 2004, with an order for 50 aircraft from All Nippon Airways (ANA), targeting a 2008 introduction.'),
    (9, 1, 'The Mitsubishi A6M "Zero" is a long-range carrier-based fighter aircraft formerly manufactured by Mitsubishi Aircraft Company, a part of Mitsubishi Heavy Industries, and was operated by the Imperial Japanese Navy (IJN) from 1940 to 1945. The A6M was designated as the Mitsubishi Navy Type 0 carrier fighter (零式艦上戦闘機, rei-shiki-kanjō-sentōki), or the Mitsubishi A6M Rei-sen.'),
    (10, 1, 'Siza completed his first built work (four houses in Matosinhos) even before completing his studies in 1954, the same year that he first opened his private practice in Porto. Along with Fernando Távora, he soon became one of the most notable faculty member of the Porto School of Architecture, where both were teachers. Both architects worked together between 1955 and 1958. Another architect he has collaborated with is Eduardo Souto de Moura'),
    (11, 1, 'Elephants are the largest living land animals. Three living species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. They are the only surviving members of the family Elephantidae and the order Proboscidea; extinct relatives include mammoths and mastodons. Distinctive features of elephants include a long proboscis called a trunk, tusks, large ear flaps, pillar-like legs, and tough but sensitive grey skin.'),
    (12, 1, 'Notre-Dame de Paris (French: [nɔtʁ(ə) dam də paʁi] (listen); meaning "Our Lady of Paris"), referred to simply as Notre-Dame,[a] is a medieval Catholic cathedral on the Île de la Cité (an island in the Seine River), in the 4th arrondissement of Paris, France. The cathedral, dedicated to the Virgin Mary, is considered one of the finest examples of French Gothic architecture. '),
    (13, 1, 'Glazing, which derives from the Middle English for glass, is a part of a wall or window, made of glass.[1][2] Glazing also describes the work done by a professional "glazier". Glazing is also less commonly used to describe the insertion of ophthalmic lenses into an eyeglass frame.[3] Common types of glazing that are used in architectural applications include clear and tinted float glass, tempered glass, and laminated glass as well as a variety of coated glasses, all of which can be glazed singly or as double, or even triple, glazing units. '),
    (14, 1, 'The chapel of Notre Dame du Haut, designed by Le Corbusier, is located in Ronchamp. It is a shrine for the Catholic Church at Ronchamp and was built for a reformist Church looking to continue its relevancy. Warning against decadence, reformers within the Church looked to renew its spirit by embracing modern art and architecture as representative concepts.'),
    (15, 1, 'Brownstone is a brown Triassic–Jurassic[1][2] sandstone that was historically a popular building material. The term is also used in the United States and Canada to refer to a townhouse clad in this or any other aesthetically similar material. There are many brownstones throughout numerous NYC neighborhoods, especially in the Brooklyn neighborhoods of Park Slope, Clinton Hill, Fort Greene, Cobble Hill, Carroll Gardens, Boerum Hill, Gowanus,'),
    (16, 1, 'Midtown Manhattan is the central portion of the New York City borough of Manhattan and serves as the citys primary central business district. Midtown is home to some of the citys most prominent buildings, including the Empire State Building, the Chrysler Building, the Hudson Yards Redevelopment Project, the headquarters of the United Nations, Grand Central Terminal, and Rockefeller Center'),
    (17, 1, 'London (/ˈlʌndən/ (listen)) is the capital and largest city of England and the United Kingdom, with a population of just under 9 million.[1][note 1] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea and has been a major settlement for two millennia.[9] The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains its mediaeval boundaries'),
    (18, 1, 'A cottage, during Englands feudal period, was the holding by a cottager (known as a cotter or bordar) of a small house with enough garden to feed a family and in return for the cottage, the cottager had to provide some form of service to the manorial lord.[2] However, in time cottage just became the general term for a small house'),
    (19, 1, 'A hammock (from Spanish hamaca, borrowed from Taíno and Arawak hamaka) is a sling made of fabric, rope, or netting, suspended between two or more points, used for swinging, sleeping, or resting. It normally consists of one or more cloth panels, or a woven network of twine or thin rope stretched with ropes between two firm anchor points such as trees or posts. '),
    (20, 1, 'The ideal floor for a hamster is solid and covered with bedding.[5] Hamsters whose cages have thick bedding experience greater health.[5] Wire flooring can harm hamster paws, causing bumblefoot, so floors are typically covered with solid materials such as cardboard, ceramic, or specially designated mats.[6][7] Wire cages that permit hamsters to throw bedding material through the wires as they burrow, dig, and play are commonplace'),
    (21, 1, 'In geometry, a tesseract is the four-dimensional analogue of the cube; the tesseract is to the cube as the cube is to the square.[1] Just as the surface of the cube consists of six square faces, the hypersurface of the tesseract consists of eight cubical cells. The tesseract is one of the six convex regular 4-polytopes.'),
    (22, 1, 'Corals are marine invertebrates within the class Anthozoa of the phylum Cnidaria. They typically form compact colonies of many identical individual polyps. Coral species include the important reef builders that inhabit tropical oceans and secrete calcium carbonate to form a hard skeleton.'),
    (23, 1, 'Mobile accessories include any hardware that is not integral to the operation of a mobile smartphone as designed by the manufacturer. Its purpose is to protect the mobile from being damaged or to use for more convenient use of the mobile. People can choose whether to use these accessories for their mobile, as they are not a necessity'),
    (24, 1, 'A gear is a rotating circular machine part having cut teeth or, in the case of a cogwheel or gearwheel, inserted teeth (called cogs), which mesh with another (compatible) toothed part to transmit (convert) torque and speed. The basic principle behind the operation of gears is analogous to the basic principle of levers.[1] A gear may also be known informally as a cog. Geared devices can change the speed, torque, and direction of a power source. ');

\! echo ""

---------------- CONSOLE TEST ------------------

-- SELECT * FROM shops;
-- SELECT * FROM shop_location;
-- SELECT * FROM shop_filaments;
-- SELECT * FROM shop_filament_colors;
-- SELECT * FROM shop_bio;
-- SELECT * FROM designers;
-- SELECT * FROM designs;