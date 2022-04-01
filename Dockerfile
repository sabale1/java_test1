FROM alpine
WORKDIR /tmp
COPY . /tmp
RUN apk add openjdk8
RUN javac Hello.java
ENTRYPOINT java Hello
