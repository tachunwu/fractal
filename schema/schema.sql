CREATE TABLE fractal.tachun_schema.users (
    id UUID DEFAULT gen_random_uuid(),
    email STRING UNIQUE,
    username STRING,
    password_digest STRING,
    -- 
    creation_time TIMESTAMPTZ DEFAULT now(),
    update_time TIMESTAMPTZ DEFAULT,
    -- 
    CONSTRAINT "primary" PRIMARY KEY (id)
);

CREATE TABLE fractal.tachun_schema.posts (
    id UUID DEFAULT gen_random_uuid(),
    content TEXT NOT NULL,
    user_id UUID REFERENCES fractal.tachun_schema.users(id),
    -- 
    creation_time TIMESTAMPTZ DEFAULT now(),
    update_time TIMESTAMPTZ,
    -- 
    CONSTRAINT "primary" PRIMARY KEY (user_id, creation_time)
);

CREATE TABLE fractal.tachun_schema.relationships (
    id UUID DEFAULT gen_random_uuid(),
    follower_id UUID REFERENCES fractal.tachun_schema.users(id), 
    followed_id UUID REFERENCES fractal.tachun_schema.users(id), 
    -- 
    creation_time TIMESTAMPTZ DEFAULT now(),
    update_time TIMESTAMPTZ DEFAULT, 
    -- 
    CONSTRAINT "primary" PRIMARY KEY (follower_id)
);
