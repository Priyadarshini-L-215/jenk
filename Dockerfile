FROM eclipse-temurin:23-jdk
WORKDIR /app
COPY . /app
RUN javac Main.java
CMD ["java","Main"]
