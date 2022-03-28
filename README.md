# fractal

## Pre-require
* Go
* CockroachDB

## Module 1: Distributed SQL
In this module, we need to familiar with Distributed SQL (a kind of SQL database that design for scale, maybe base on Google Spanner or Calvin/SLOG papers). I choose CockroachDB to practice with this module.

### Objectives
* Admin CockroachDB (eg: setup database and user-schema...)
* Design application schema (eg: tables, indexes...)

## Module 2: Repository & Entity & Interactor
In this module, we need to use Go to transfer SQL command into Go code. You may use some database driver or ORM libraries like GORM or pgxpool.

### Objectives
* Implement ```crdbRepository struct``` and ```Repository interface``` 
* Implement ```package entity``` for repository to use

## Module 3: Protobuf & gRPC & HTTP
In this module, we need to build a client interface, in other words, we need to provide HTTP endpoints and gRPC contracts. We can use protobuf and buf.build to manage and generate code. There are many tools you can use with protobuf such as grpc-gateway or envoy-validator.
* Implement protobuf files
* Implemment HTTP endpoint
* Implement gRPC contract
* Implement protobuf validator

## Module 4: Layout
In this module, we need to organize our code that we wrote in previous modules.

## Module 5: Deploy
In this module, we need to packaging our application into container and deploy on kubernetes.
