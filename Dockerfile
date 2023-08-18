FROM golang:1.19-alpine3.18@sha256:c5e8766b6a7b77fd60a48c2b932f7ea66f7001489c4cf18d0265cff595613bee as build

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
