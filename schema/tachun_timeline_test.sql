-- insert users
INSERT INTO fractal.tachun_schema.users (email, username, password_digest) VALUES 
('tachunwu@gmail.com', 'tachun', '12345678');

INSERT INTO fractal.tachun_schema.users (email, username, password_digest) VALUES 
('peter@gmail.com', 'peter', '87654321');

INSERT INTO fractal.tachun_schema.users (email, username, password_digest) VALUES 
('bill@gmail.com', 'bill', '!@#$%^&*');

--                    id                  |       email        | username | password_digest |         creation_time         |          update_time
-- ---------------------------------------+--------------------+----------+-----------------+-------------------------------+--------------------------------
--   673a0bd3-8937-423c-b25a-bc40b25031b8 | peter@gmail.com    | peter    | 87654321        | 2022-03-28 07:22:48.963041+00 | 2022-03-28 07:22:48.963041+00
--   85dcdde9-5ae5-49f0-a8f2-511007a1d9e6 | tachunwu@gmail.com | tachun   | 12345678        | 2022-03-28 07:21:53.651099+00 | 2022-03-28 07:21:53.651099+00
--   a13be8cf-84c5-41b7-abc5-c4eaed9877dd | bill@gmail.com     | bill     | !@#$%^&*        | 2022-03-28 07:22:49.358955+00 | 2022-03-28 07:22:49.358955+00

-- insert relationships 
INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES
('673a0bd3-8937-423c-b25a-bc40b25031b8', '85dcdde9-5ae5-49f0-a8f2-511007a1d9e6');

INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES
('673a0bd3-8937-423c-b25a-bc40b25031b8', 'a13be8cf-84c5-41b7-abc5-c4eaed9877dd');

INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES
('85dcdde9-5ae5-49f0-a8f2-511007a1d9e6', '673a0bd3-8937-423c-b25a-bc40b25031b8');

INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES
('a13be8cf-84c5-41b7-abc5-c4eaed9877dd', '673a0bd3-8937-423c-b25a-bc40b25031b8');

-- insert posts 
INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('Today is a good day', '673a0bd3-8937-423c-b25a-bc40b25031b8');

INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('Yesterday was a bad day', '673a0bd3-8937-423c-b25a-bc40b25031b8');

INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('Fuck up everyday', '85dcdde9-5ae5-49f0-a8f2-511007a1d9e6');

INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('Smoke weed everyday', '85dcdde9-5ae5-49f0-a8f2-511007a1d9e6');

INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('LSD can open my mind', '85dcdde9-5ae5-49f0-a8f2-511007a1d9e6');

INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
('Wrote 2 leetcode yesterday', 'a13be8cf-84c5-41b7-abc5-c4eaed9877dd');

-- service: Get followed user list 
SELECT 
    follower_id,
    followed_id
FROM
    fractal.tachun_schema.relationships AS relationships
WHERE
    follower_id = '673a0bd3-8937-423c-b25a-bc40b25031b8';

-- service: Get followed user's posts
SELECT 
    posts.content
FROM
    fractal.tachun_schema.relationships AS relationships
    JOIN    
    fractal.tachun_schema.posts AS posts
    ON 
    relationships.followed_id = posts.user_id
WHERE
    relationships.follower_id = '673a0bd3-8937-423c-b25a-bc40b25031b8'
ORDER BY
    posts.creation_time DESC
LIMIT
    2;
