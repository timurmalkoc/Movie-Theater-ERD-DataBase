-- ************** customer table ********************
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	emil varchar(50),
	phone varchar(10),
	c_member BOOLEAN,
	ticket_id integer NOT NULL      -- Foregin Key
);

-- ticket_id foreing key **

--************** ticket table ***********************
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	show_date timestamp,  -- duplicate FROM movei TABLE can be removed FROM movie-time TABLE
	show_time timestamp,  -- duplicate FROM movei TABLE can be removed FROM movie-time TABLE
	movie_time_id integer NOT NULL,
	hall_id integer NOT NULL,
	movie_id integer NOT NULL
);

-- movie_time_id foreign key **
-- hall_id foreign key **
-- movie_id foreign key **
-----------------------------------------------------(ticket_id foreign key for customer table)
ALTER TABLE customer
ADD FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id);

------------------------------------------------------

-- *********** movie-time table **********************
CREATE TABLE movie_time(
	movie_time_id SERIAL PRIMARY KEY,
	show_date timestamp,     
	show_time timestamp,
	movie_id integer NOT NULL,
	hall_id integer NOT NULL
);

-----------------------------------------------------(movie_time_id foreign key for ticket table)
ALTER TABLE ticket
ADD FOREIGN KEY(movie_time_id) REFERENCES movie_time(movie_time_id);
-------------------------------------------------------

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title varchar(50),
	description varchar(200),
	length_ integer,
	rating integer,
	relase_year date,
	lang varchar(20)
);

-------------------------------------------------------

-----------------------------------------------------(movie_id foreign key for ticket table)
ALTER TABLE ticket
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);
-------------------------------------------------------

-----------------------------------------------------(movie_id foreign key for movie-time table)
ALTER TABLE movie_time 
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);
-------------------------------------------------------

--********************* hall table ********************
CREATE TABLE hall(
	hall_id SERIAL PRIMARY KEY,
	seat integer
);
-------------------------------------------------------

-----------------------------------------------------(hall_id foreign key for ticket table)
ALTER TABLE ticket
ADD FOREIGN KEY(hall_id) REFERENCES hall(hall_id);
-------------------------------------------------------

-----------------------------------------------------(hall_id foreign key for movie-time table)
ALTER TABLE movie_time 
ADD FOREIGN KEY(hall_id) REFERENCES hall(hall_id);


