DROP TABLE IF EXISTS university;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS answer;

CREATE TABLE university (
  id INTEGER PRIMARY KEY,
  uuid VARCHAR(36) UNIQUE NOT NULL,
  name TEXT NOT NULL
);

CREATE TABLE course (
  id INTEGER PRIMARY KEY,
  uuid VARCHAR(36) UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  professor TEXT NOT NULL
);

CREATE TABLE question (
  id INTEGER PRIMARY KEY,
  uuid VARCHAR(36) UNIQUE NOT NULL,
  course_id VARCHAR(36) NOT NULL,
  question TEXT NOT NULL,
  creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  rating INT NOT NULL DEFAULT 0
);

CREATE TABLE answer (
  id INTEGER PRIMARY KEY,
  uuid VARCHAR(36) UNIQUE NOT NULL,
  question_id VARCHAR(36) NOT NULL,
  answer TEXT NOT NULL,
  creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  correct INTEGER NOT NULL DEFAULT 0,
  points FLOAT NOT NULL DEFAULT 1.0,
  FOREIGN KEY (question_id) REFERENCES question (uuid)
);