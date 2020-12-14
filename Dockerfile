FROM rustlang/rust:nightly-alpine AS build
WORKDIR /usr/local/src/website
COPY . .
RUN cargo build --release

FROM alpine:latest
WORKDIR /usr/local/bin
COPY --from=build /usr/local/src/website/target/release/website ./website
EXPOSE 80
VOLUME /data
ENTRYPOINT ./website
