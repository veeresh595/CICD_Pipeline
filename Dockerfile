FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from /app/target/Uber.jar
EXPOSE 9090
CMD ["java","-jar","Uber.jar"]