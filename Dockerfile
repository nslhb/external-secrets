FROM golang:1.16.3 AS build
COPY . .
RUN make

FROM alpine:3.13

COPY --from=build /go/bin/external-secrets /bin/external-secrets

# Run as UID for nobody
USER 65534

ENTRYPOINT ["/bin/external-secrets"]
