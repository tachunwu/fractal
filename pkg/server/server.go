package server

import (
	"context"
	"log"

	corev1 "github.com/tachunwu/fractal/pkg/proto/core/v1"
)

type FractalServiceServer struct {
	corev1.UnimplementedFractalServiceServer
}

func (s *FractalServiceServer) ListUsers(ctx context.Context, req *corev1.ListUsersRequest) (*corev1.ListUsersResponse, error) {
	log.Println(req)
	return &corev1.ListUsersResponse{}, nil
}
func (s *FractalServiceServer) CreateUser(ctx context.Context, req *corev1.CreateUserRequest) (*corev1.CreateUserResponse, error) {
	log.Println(req)
	return &corev1.CreateUserResponse{}, nil
}
func (s *FractalServiceServer) GetUser(ctx context.Context, req *corev1.GetUserRequest) (*corev1.GetUserResponse, error) {
	log.Println(req)
	return &corev1.GetUserResponse{}, nil
}
func (s *FractalServiceServer) UpdateUser(ctx context.Context, req *corev1.UpdateUserRequest) (*corev1.UpdateUserResponse, error) {
	log.Println(req)
	return &corev1.UpdateUserResponse{}, nil
}
func (s *FractalServiceServer) DeleteUser(ctx context.Context, req *corev1.DeleteUserRequest) (*corev1.DeleteUserResponse, error) {
	log.Println(req)
	return &corev1.DeleteUserResponse{}, nil
}
