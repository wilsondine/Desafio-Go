FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT [ "/server" ]
CMD ["/app"]