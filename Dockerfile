FROM maven:alpine

# Install docker + git
RUN apk update docker;\
    apk add --no-cache docker;\
    apk update git;\
    apk add --no-cache git;\
    addgroup root docker