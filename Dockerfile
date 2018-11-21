FROM golang:1.11.2 as builder

RUN go get -u -v github.com/haya14busa/reviewdog/cmd/reviewdog
RUN cd /go/src/github.com/haya14busa/reviewdog/cmd/reviewdog && \
        CGO_ENABLED=0 go build -v .


FROM alpine:3.8

COPY --from=builder /go/src/github.com/haya14busa/reviewdog/cmd/reviewdog/reviewdog /reviewdog

ENTRYPOINT /reviewdog
