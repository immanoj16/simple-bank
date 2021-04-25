createdb:
	docker exec -it postgres createdb --username postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres dropdb simple_bank

startdb:
	docker compose up -d

stopdb:
	docker compose down

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlgenerate:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: createdb migrateup migratedown startdb stopdb dropdb

