
DROP TABLE if exists current_small_ad;
DROP TABLE if exists global_data;
DROP TABLE if exists small_ad;
DROP TABLE if exists banner_ad;
DROP TABLE if exists rss_feed;
DROP TABLE if exists survey_choice;
DROP TABLE if exists survey;
DROP TABLE if exists ebook;
DROP TABLE if exists book_order;
DROP TABLE if exists purchase;
DROP TABLE if exists review;
DROP TABLE if exists book;
DROP TABLE if exists user;
DROP TABLE if exists client;
DROP TABLE if exists address;
DROP TABLE if exists province;

CREATE TABLE province(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  name TEXT NOT NULL,
  tax_rate DECIMAL(5, 3) NOT NULL,
  second_tax_rate DECIMAL(5, 3) DEFAULT NULL
);

CREATE TABLE address(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  city TEXT NOT NULL,
  province INT NOT NULL, FOREIGN KEY (province) REFERENCES province(id),
  postal_code TEXT NOT NULL,
  address TEXT NOT NULL 
);

CREATE TABLE client(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  shipping_address_id INT NOT NULL, FOREIGN KEY (shipping_address_id) REFERENCES address(id),
  billing_address_id INT NOT NULL, FOREIGN KEY (billing_address_id) REFERENCES address(id),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  home_phone TEXT NOT NULL,
  cell_phone TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE user(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  login TEXT NOT NULL, -- login VARCHAR(40) NOT NULL CHECK (LENGTH(login) > 6),
  password TEXT NOT NULL,
  manager INT UNSIGNED NOT NULL DEFAULT 0 CHECK (manager < 2),
  client_id INT DEFAULT NULL, FOREIGN KEY (client_id) REFERENCES client(id),
  last_genre TEXT DEFAULT NULL
);

CREATE TABLE book(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  date_entered TIMESTAMP NOT NULL DEFAULT current_timestamp,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  publisher TEXT NOT NULL,
  isbn_10 CHAR(10) NOT NULL, UNIQUE (isbn_10),
  isbn_13 CHAR(14) NOT NULL, UNIQUE (isbn_13),
  genre TEXT NOT NULL,
  description TEXT NOT NULL,
  number_of_pages INT UNSIGNED NOT NULL,
  weight INT UNSIGNED NOT NULL,
  dimensions TEXT NOT NULL,
  thumbnail TEXT NOT NULL,
  cover TEXT NOT NULL,
  list_price DECIMAL(5, 2) NOT NULL,
  sale_price DECIMAL(5, 2) NOT NULL,
  wholesale_price DECIMAL(5, 2) NOT NULL,
  number_of_books INT UNSIGNED DEFAULT 0,
  being_sold INT UNSIGNED NOT NULL DEFAULT 1 CHECK (being_sold < 2)
);

CREATE TABLE review(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES user(id),
  book_id INT NOT NULL, FOREIGN KEY (book_id) REFERENCES book(id),
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  rating INT UNSIGNED NOT NULL CHECK (rating > 0 AND rating < 6),
  review_text TEXT,
  status INT UNSIGNED NOT NULL CHECK (approved < 3)
);

CREATE TABLE purchase(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES user(id),
  book_id INT NOT NULL, FOREIGN KEY (book_id) REFERENCES book(id),
  price DECIMAL(5, 2) NOT NULL,
  purchased_on TIMESTAMP NOT NULL DEFAULT current_timestamp,
  number_of_copies INT NOT NULL,
  electronic INT UNSIGNED NOT NULL CHECK (electronic < 2)
);

CREATE TABLE book_order(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  ordered_on TIMESTAMP NOT NULL DEFAULT current_timestamp,
  received_on TIMESTAMP NULL DEFAULT NULL,
  book_id INT NOT NULL, FOREIGN KEY (book_id) REFERENCES book(id),
  quantity INT NOT NULL
);

CREATE TABLE ebook(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  book_id INT NOT NULL, FOREIGN KEY (book_id) REFERENCES book(id),
  eformat TEXT NOT NULL
);

CREATE TABLE survey(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  question TEXT NOT NULL
);

CREATE TABLE survey_choice(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  survey_id INT NOT NULL, FOREIGN KEY (survey_id) REFERENCES survey(id),
  choice TEXT NOT NULL,
  votes INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE rss_feed(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  url TEXT NOT NULL
);

CREATE TABLE banner_ad(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  image TEXT NOT NULL
);

CREATE TABLE small_ad(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  image TEXT NOT NULL
);

CREATE TABLE global_data(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  current_survey INT NOT NULL, FOREIGN KEY (current_survey) REFERENCES survey(id),
  current_feed INT NOT NULL, FOREIGN KEY (current_feed) REFERENCES rss_feed(id),
  minimum_books INT UNSIGNED NOT NULL,
  banner_ad INT NOT NULL, FOREIGN KEY (banner_ad) REFERENCES banner_ad(id)
);

CREATE TABLE current_small_ad(
  id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),
  global_id INT NOT NULL, FOREIGN KEY (global_id) REFERENCES global_data(id),
  small_ad_id INT NOT NULL, FOREIGN KEY (small_ad_id) REFERENCES small_ad(id)
);



