FROM arm64v8/rust:slim AS build
WORKDIR /usr/local/src/website
COPY . .
RUN cargo build --release

FROM debian:buster-slim
WORKDIR /usr/local/bin
COPY --from=build /usr/local/src/website/target/release/website ./website
EXPOSE 80
VOLUME /data
ENTRYPOINT ./website
