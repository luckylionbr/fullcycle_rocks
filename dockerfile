FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" -o /app main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app /app

CMD ["./main"]