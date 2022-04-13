package repository

import (
	"context"

	"github.com/tachunwu/fractal/pkg/entity"
)

type Repository interface {
	CreateUser(ctx context.Context, user entity.User) error
	CreatePost(ctx context.Context, post entity.Post) error
	CreateRelationship(ctx context.Context, relationship entity.Relationship) error
	GetUserTimeline(ctx context.Context, user entity.User) ([]entity.Post, error)
	ListFollowedUsers(ctx context.Context, user entity.User) ([]entity.User, error)
}
