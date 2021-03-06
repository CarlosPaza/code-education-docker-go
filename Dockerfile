FROM golang:1.15 AS builder
WORKDIR /go/src/fullcycle/
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/fullcycle/
COPY --from=builder /go/src/fullcycle/fullcycle .

ENTRYPOINT ["./fullcycle"]