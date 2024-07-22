-- DROP DATABASE IF EXISTS messagely_test;
-- CREATE DATABASE messagely_test;

-- \c messagely
\c messagely_test

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS messages CASCADE;

CREATE TABLE users (
    username text PRIMARY KEY,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone text NOT NULL,
    join_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_username text NOT NULL REFERENCES users,
    to_username text NOT NULL REFERENCES users,
    body text NOT NULL,
    sent_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    read_at timestamp with time zone DEFAULT NULL
);

INSERT INTO users (username, password, first_name, last_name, phone)
VALUES
    ('alice', 'password123', 'Alice', 'Smith', '+1234567890'),
    ('bob', 'securepass', 'Bob', 'Johnson', '+1987654321'),
    ('charlie', 'p@ssw0rd!', 'Charlie', 'Brown', '+1122334455'),
    ('diana', 'd1@n@p@ss', 'Diana', 'Miller', '+15550998877');

INSERT INTO messages (from_username, to_username, body, sent_at)
VALUES
    ('alice', 'bob', 'Hey Bob, how are you?', '2024-07-22 10:15:00-04'),
    ('bob', 'alice', 'Hi Alice! I''m good, thanks!', '2024-07-22 10:20:00-04'),
    ('charlie', 'alice', 'Hey Alice, can you review this document?', '2024-07-22 11:00:00-04'),
    ('alice', 'charlie', 'Sure Charlie, I''ll take a look.', '2024-07-22 11:10:00-04'),
    ('diana', 'alice', 'Hi Alice, do you have time for a quick call today?', '2024-07-22 12:30:00-04'),
    ('alice', 'diana', 'Hi Diana, sure! Let''s schedule it for 2 PM.', '2024-07-22 12:35:00-04');


