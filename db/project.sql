CREATE DATABASE project;
USE project

-- create table statements
CREATE TABLE IF NOT EXISTS genre (
   genreID INT PRIMARY KEY NOT NULL,
   genre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS mediaType (
   mediaTypeID int PRIMARY KEY,
   type varchar(50)
);

CREATE TABLE IF NOT EXISTS media (
   mediaID int PRIMARY KEY,
   title varchar(100) NOT NULL,
   mediaType int NOT NULL,
   media int NOT NULL,
   rating int NOT NULL,
   genre int NOT NULL,
   mood int,
   FOREIGN KEY (genre)
        REFERENCES genre(genreID),
   FOREIGN KEY (mediaType)
        REFERENCES mediaType(mediaTypeID)
);

CREATE TABLE IF NOT EXISTS book (
   bookID int,
   author varchar(100) NOT NULL ,
   description varchar(2000),
   pages int NOT NULL,
   mediaID int NOT NULL,
   PRIMARY KEY (mediaID, bookID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS song (
   songID int,
   artist varchar(100) NOT NULL,
   BPM int NOT NULL,
   length int NOT NULL,
   mediaID int,
   PRIMARY KEY (mediaID, songID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS movie (
   movieID int,
   director varchar(100) NOT NULL,
   description varchar(2000),
   length int NOT NULL,
   mediaID int,
   PRIMARY KEY (mediaID, movieID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS colorScheme (
   colorSchemeID INT PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   headerColor VARCHAR(20) NOT NULL,
   textColor VARCHAR(20) NOT NULL,
   backgroundColor VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS mood (
   moodID INT PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   colorScheme INT NOT NULL,
   FOREIGN KEY (colorScheme)
       REFERENCES colorScheme(colorSchemeID)
);

CREATE TABLE IF NOT EXISTS user (
   userID INT PRIMARY KEY NOT NULL,
   name VARCHAR(100) NOT NULL,
   biography TEXT,
   email VARCHAR(100) NOT NULL,
   phoneNumber VARCHAR(20),
   mood INT NOT NULL,
   FOREIGN KEY (mood) REFERENCES mood(moodID)
);


CREATE TABLE IF NOT EXISTS log (
   userID INT NOT NULL,
   mediaID INT NOT NULL,
   favorite boolean,
   rating int,
   review VARCHAR(2000),
   logID int AUTO_INCREMENT PRIMARY KEY,
   FOREIGN KEY (userID) REFERENCES user(userID),
   FOREIGN KEY (mediaID) REFERENCES media(mediaID)
);

CREATE TABLE IF NOT EXISTS journalEntry (
   journalID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   title VARCHAR(500) NOT NULL,
   text TEXT,
   user INT NOT NULL,
   date DATETIME,
   FOREIGN KEY (user)
       REFERENCES user(userID)
);

CREATE TABLE IF NOT EXISTS userGoal (
   goalID INT PRIMARY KEY NOT NULL,
   text TEXT,
   user INT NOT NULL,
   deadline DATE,
   FOREIGN KEY (user) REFERENCES user(userID)
);

-- insert statements
INSERT INTO colorScheme (ColorSchemeID, Name, HeaderColor, TextColor, BackgroundColor) VALUES
(1, 'Bright Day', '#FFFFFF', '#000000', '#FFFF00'),
(2, 'Deep Space', '#000033', '#FFFFFF', '#000066');


INSERT INTO mood (moodID, Name, colorScheme) VALUES
(1, 'Inspired', 1),
(2, 'Relaxed', 2),
(3, 'Sad', 2);


INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES
(1, 'Jack Dell', 'CEO of a tech startup, passionate about entrepreneurship and productivity.', 'jack.dell@aol.com', '787-555-0101', 1),
(2, 'Taylor Mack', 'Freelance writer with a keen interest in mindfulness and creative expression.', 'taylor.mack@gmail.com', '211-555-0102', 3),
(3, 'Ashton Bray', 'University student who loves culture and travel!', 'ashtonbrayyy@gmail.com', '443-187-8854', 1),
(4, 'Jason Bol', 'I love data!', 'jasonbol@yahoo.com', '301-444-1997', 2);


INSERT INTO mediaType (mediaTypeID, type) VALUES
(1, 'Song'),
(2, 'Book'),
(3, 'Movie');


INSERT INTO genre (genreID, genre) VALUES
(1, 'Business'),
(2, 'Self-Help'),
(3, 'Science Fiction'),
(4, 'Comedy'),
(5, 'Drama'),
(6, 'Pop');


INSERT INTO media (MediaID, title, mediaType, media, rating, genre, mood) VALUES
(1, 'Interstellar', 3, 1, 4.8, 5, 1),
(2, 'The Shawshank Redemption', 3, 2, 4.9, 5, 3),
(3, 'A Brief History of Time', 2, 1, 4.6, 3, 1),
(4, 'How to Win Friends & Influence People', 2, 2, 3.4, 2, 1),
(5, 'Shape of You', 1, 1, 4.5, 6, 2),
(6, 'Halo', 1, 2, 4.7, 6, 1);


INSERT INTO book (MediaID, BookID, Author, Description, Pages) VALUES
(3, 1, 'Stephen Hawking', 'A popular science book on cosmology.', 256),
(4, 2, 'Dale Carnegie', 'A self-help book about being the best.', 288);


INSERT INTO song (MediaID, SongID, Artist, BPM, Length) VALUES
(5, 1, 'Ed Sheeran', 95, 90),
(6, 2, 'Beyoncé', 120, 95);


INSERT INTO movie (MediaID, MovieID, Director, Description, Length) VALUES
(1, 1, 'Christopher Nolan', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanitys survival.', 169),
(2, 2, 'Frank Darabont', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142);


INSERT INTO log (UserID, MediaID, Favorite, Rating, Review, logID) VALUES
(1, 1, true, 5, 'A cinematic masterpiece that goes beyond typical sci-fi. Thought-provoking and visually stunning.', 1),
(2, 5, true, 4.3, 'This song is so catchy! I cant stop listening to it. Ed Sheeran never disappoints.', 2),
(3, 3, false, 2.5, NULL, 3);


INSERT INTO journalEntry (JournalID, Title, Text, User, date) VALUES
(1, 'Daily Reflections', 'Felt inspired after watching Interstellar. Makes you think about our place in the universe. I want to watch some similar movies soon', 4, '2023-04-01'),
(2, 'Exploring Comedies', 'I really want to watch some more comedies. Recently I have seen a few Adam Sandler films and they really brought up my mood after a bad day!', 2, '2024-02-12');


INSERT INTO userGoal (GoalID, Text, User, Deadline) VALUES
(1, 'Read 12 business books this year', 4, '2023-12-31'),
(2, 'Practice mindfulness daily', 2, '2023-12-31');