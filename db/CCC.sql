DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR (255),
  fund INT4
  );

CREATE TABLE films (
    id SERIAL4 PRIMARY KEY,
    title VARCHAR (255),
    price INT4
  );


  CREATE TABLE screenings (
    id SERIAL4 PRIMARY KEY,
    screening_time VARCHAR (255)
  );

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(id) ON DELETE CASCADE
);
