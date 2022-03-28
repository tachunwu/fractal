-- name: CreateUser :one
INSERT INTO fractal.tachun_schema.users (email, username, password_digest) VALUES 
($1, $2, $3);

-- name: CreatePost: one
INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES
($1, $2);

-- name: CreateRelationship :one
INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES
($1, $2);

-- name: ListUserFollowed :many
SELECT 
    follower_id,
    followed_id
FROM
    fractal.tachun_schema.relationships AS relationships
WHERE
    follower_id = $1;

-- name: ListUserPosts :many
SELECT 
    posts.content
FROM
    fractal.tachun_schema.relationships AS relationships
    JOIN    
    fractal.tachun_schema.posts AS posts
    ON 
    relationships.followed_id = posts.user_id
WHERE
    relationships.follower_id = $1
ORDER BY
    posts.creation_time DESC
LIMIT
    2;