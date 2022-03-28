package repository

import (
	"context"
	"log"

	"github.com/jackc/pgx/v4/pgxpool"
	"github.com/tachunwu/fractal/pkg/entity"
)

func NewCrdbRepository(conn string) *crdbRepository {

	pool, err := pgxpool.Connect(context.Background(), conn)

	if err != nil {
		log.Fatal("Unable to connect database: ", err)
	}
	return &crdbRepository{
		pool: pool,
	}
}

type crdbRepository struct {
	pool *pgxpool.Pool
}

func (r *crdbRepository) CreateUser(ctx context.Context, user entity.User) error {
	if _, err := r.pool.Exec(context.Background(),
		"INSERT INTO fractal.tachun_schema.users (email, username, password_digest) VALUES ($1, $2, $3)",
		user.Email,
		user.Username,
		user.PasswordDigest,
	); err != nil {
		log.Println(err)
	}
	return nil
}

func (r *crdbRepository) CreatePost(ctx context.Context, post entity.Post) error {
	if _, err := r.pool.Exec(context.Background(),
		"INSERT INTO fractal.tachun_schema.posts(content, user_id) VALUES ($1, $2);",
		post.Content,
		post.UserId,
	); err != nil {
		log.Println(err)
	}
	return nil
}

func (r *crdbRepository) CreateRelationship(ctx context.Context, relationship entity.Relationship) error {
	if _, err := r.pool.Exec(context.Background(),
		"INSERT INTO fractal.tachun_schema.relationships (follower_id, followed_id) VALUES ($1, $2)",
		relationship.FollowerId,
		relationship.FollowedId,
	); err != nil {
		log.Println(err)
	}
	return nil
}

func (r *crdbRepository) GetUserTimeline(ctx context.Context, user entity.User) ([]entity.Post, error) {
	timeline := []entity.Post{}
	rows, _ := r.pool.Query(context.Background(),
		`
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
			2`,
		user.Id,
	)

	for rows.Next() {
		var content string
		err := rows.Scan(content)
		if err != nil {
			return nil, err
		}
		timeline = append(timeline, entity.Post{
			Content: content,
		})
	}

	return timeline, nil
}

func (r *crdbRepository) ListFollowedUsers(ctx context.Context, user entity.User) ([]entity.User, error) {
	return nil, nil
}
