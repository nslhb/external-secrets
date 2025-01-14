FROM golang:1.16.3 AS build
WORKDIR /go/src/app
COPY . .
RUN make

FROM alpine:3.13

COPY --from=build /go/src/app/bin/external-secrets /bin/external-secrets

# Run as UID for nobody
USER 65534

ENTRYPOINT ["/bin/external-secrets"]
