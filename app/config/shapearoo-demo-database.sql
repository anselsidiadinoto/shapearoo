-- psql -U anselsidiadinoto shapearoo_demo < ./app/config/shapearoo-demo-database.sql


DROP TABLE IF EXISTS shops;
CREATE TABLE shops(
    id SERIAL,
    shop_name TEXT
);

DROP TABLE IF EXISTS shop_date;
CREATE TABLE shop_date(
    id SERIAL,
    shop_id INT,
    print_date TEXT,
    join_date TEXT
);

DROP TABLE IF EXISTS shop_location;
CREATE TABLE shop_location(
    id SERIAL,
    shop_id INT,
    shop_address TEXT
);

DROP TABLE IF EXISTS shop_filaments;
CREATE TABLE shop_filaments(
    id SERIAL,
    shop_id INT,
    shop_filament_type TEXT
);

DROP TABLE IF EXISTS shop_filament_colors;
CREATE TABLE shop_filament_colors(
    id SERIAL,
    shop_filament_id INT,
    shop_filament_color TEXT
);

DROP TABLE IF EXISTS shop_images;
CREATE TABLE shop_images(
    shop_id SERIAL,
    shop_image_position TEXT,
    shop_image_url TEXT
);

