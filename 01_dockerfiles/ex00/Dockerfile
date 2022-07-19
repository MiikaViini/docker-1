# Using alpine image
FROM alpine

# Updating and installing vim
RUN apk update && apk add vim

# Start vim in container
CMD ["vim"]

# Build image:
# docker build -t alpinevim .

# Run container
# docker run -it --rm alpinevim
