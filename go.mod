module github.com/draganm/missing-container-metrics

go 1.14

require (
	github.com/containerd/containerd v1.7.3
	github.com/containerd/typeurl/v2 v2.1.1
	github.com/docker/docker v24.0.5+incompatible
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.16.0
	github.com/urfave/cli/v2 v2.25.7
	go.uber.org/zap v1.25.0
)

replace github.com/draganm/missing-container-metrics => ./
