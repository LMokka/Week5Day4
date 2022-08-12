--Week 5 Thursday Questions
--1.  Create a Stored Procedure that will insert a new film into the film table with the following arguments:
--title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating

SELECT *
FROM film


CREATE OR REPLACE PROCEDURE add_new_film(title VARCHAR(300), description VARCHAR(300), release_year INT, language_id INT, rental_duration INT, rental_rate float, length float, replacement_cost float, rating MPAA_RATING) 
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

CALL add_new_film('The Sixth Man', 'Comedy Movie', 1997, 1, 7, 2.99, 107, 20.00, 'PG-13');	

--2. Create a Stored Function that will take in a category_id and return the number of films in that category
SELECT *
FROM category

SELECT COUNT(film_id), category_id  
FROM film_category
WHERE category_id = 1
GROUP BY category_id
ORDER BY COUNT

CREATE OR REPLACE FUNCTION get_film_count(num INT)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE film_count INTEGER;
BEGIN
	SELECT COUNT(film_id) INTO film_count
	FROM film_category
	WHERE category_id = num;
	RETURN film_count;
END;
$$;

SELECT get_film_count('1');


