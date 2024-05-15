FROM golang:1.21-alpine3.18@sha256:d390d5f2006c4c9cf19709d449a8463e7188643f444d06fcaa96f45b6c29363d as build

RUN mkdir /missing-container-metrics
WORKDIR /missing-container-metrics
COPY go.mod go.sum ./
RUN go mod download
COPY . .
ARG VERSION=master
RUN CGO_ENABLED=0 go build  -ldflags "-X main.Version=$VERSION" -o missing-container-metrics .

FROM scratch
COPY --from=build /missing-container-metrics/missing-container-metrics /missing-container-metrics
EXPOSE 3001
ENTRYPOINT ["/missing-container-metrics"]
