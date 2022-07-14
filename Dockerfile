FROM alpine as build-env
RUN apk add --no-cache build-base
WORKDIR /app
COPY . .
# Compile the binaries
RUN make
FROM alpine
COPY --from=build-env /app/main /app/main
WORKDIR /app
CMD ["/app/main"] 
