-- 1- Get a list of all the languages in the film
SELECT name FROM language;

--Get all films, even if they don’t have languages.
SELECT film.title, film.description, language.name
FROM film
LEFT JOIN language ON film.language_id = language.language_id;

--Get all languages, even if there are no films in those languages.
SELECT film.title, film.description, language.name
FROM film
RIGHT JOIN language ON film.language_id = language.language_id;
-- 3- Create a new table called new_film with the following columns : id, name. Add some new films to the table.
 CREATE TABLE new_film (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

--Create a new table called customer_review, which will contain film reviews that customers will make.
--Think about the DELETE constraint: if a film is deleted, its review should be automatically deleted.
CREATE TABLE customer_review (
    review_id INT NOT NULL AUTO_INCREMENT,
    film_id INT NOT NULL,
    language_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    review_text TEXT NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (review_id),
    FOREIGN KEY (film_id) REFERENCES new_film(id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES language(id)
);

--Add 2 movie reviews. Make sure you link them to valid objects in the other tables.
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (1, 1, 'Great Film!', 9, 'I loved this movie. The acting was amazing and the storyline was gripping.');

INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (2, 2, 'Terrible Movie', 3, 'I did not like this movie at all. The plot was confusing and the acting was terrible.');

