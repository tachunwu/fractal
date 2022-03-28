package entity

import "time"

type User struct {
	Base
	Username       string
	Email          string
	PasswordDigest string
}

type Post struct {
	Base
	Content string
	UserId  string
}

type Relationship struct {
	Base
	FollowerId string
	FollowedId string
}

type Base struct {
	Id       string
	CreateAt time.Time
	UpdateAt time.Time
}
