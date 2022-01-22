-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column 
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS years;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  year_id INTEGER,
  rating TEXT,
  director TEXT
);
CREATE TABLE performances (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  character_id INTEGER,
  year_id INTEGER,
  movie_id INTEGER
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
 );

 CREATE TABLE years (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  year INTEGER
 );

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!


INSERT INTO movies
VALUES 
(1,"Batman Begins", 1, "PG-13", "Christopher Nolan"),
(2,"The Dark Knight", 2,"PG-13", "Christopher Nolan"),
(3,"The Dark Knight Rises", 3,"PG-13", "Christopher Nolan");


INSERT INTO characters
VALUES 
(1,"Bruce Wayne"),
(2,"Alfred"),
(3,"Ra's Al Ghul"),
(4,"Rachel Dawes"),
(5,"Commissioner Gordon"),
(6,"Joker"),
(7,"Harvey Dent"),
(8,"Bane"),
(9,"John Blake"),
(10,"Selina Kyle");

INSERT INTO performances
VALUES 
(1,"Christian Bale",1,1,1),
(2,"Michael Caine",2,1,1),
(3,"Liam Neeson",3,1,1),
(4,"Katie Holmes",4,1,1),
(5,"Gary Oldman",5,1,1),
(6,"Christian Bale",1,2,2),
(7,"Heath Ledger",6,2,2),
(8,"Aaron Eckhart",7,2,2),
(9,"Michael Caine",2,2,2),
(10,"Maggie Gyllenhall",4,2,2),
(11,"Christian Bale",1,3,3),
(12,"Gary Oldman",5,3,3),
(13,"Tom Hardy",8,3,3),
(14,"Joseph Gordon-Levitt",9,3,3),
(15,"Anne Hathaway",10,3,3);

INSERT INTO years
VALUES 
(1,2005),
(2,2008),
(3,2012);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
.width 25 15 15
SELECT movies.name, years.year, movies.rating, movies.director 
FROM movies
INNER JOIN years ON movies.year_id = years.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
-- TODO!
.width 25 25 25
SELECT movies.name, performances.name, characters.name
FROM performances
INNER JOIN movies ON performances.movie_id = movies.id
INNER JOIN characters ON performances.character_id = characters.id;

-- Create the rest of the tables


