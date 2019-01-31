DROP TABLE IF EXISTS castings;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS movies;


CREATE TABLE stars (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL4 PRIMARY KEY,
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
  star_fee INT8
);
