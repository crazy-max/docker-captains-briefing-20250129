# syntax=docker/dockerfile:1

ARG GO_VERSION=1.23

FROM golang:${GO_VERSION}-alpine AS build
WORKDIR /src
RUN --mount=type=bind,target=. \
  go build -ldflags "-s -w" -o /usr/bin/app .

FROM scratch AS binary
COPY --from=build /usr/bin/app /app
# enable scanning for this stage
ARG BUILDKIT_SBOM_SCAN_STAGE=true

FROM alpine
COPY --from=binary /app /usr/bin/app
CMD ["app"]
