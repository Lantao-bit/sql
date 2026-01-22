
Create database if not exists library;

-- <col name 
CREATE TABLE IF NOT EXISTS books (
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS authoris (
    author_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS authors_books (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    author_id INT UNSIGNED NOT NULL
);

ALTER TABLE authors_books ADD CONSTRAINT fk_authors_authors_books
 FOREIGN KEY(author_id) REFERENCES authors(author_id);

ALTER TABLE authors_books ADD CONSTRAINT fk_books_authors_books
 FOREIGN KEY(book_id) REFERENCES books(book_id);