FROM maven AS stg

RUN mkdir /myapp

WORKDIR /myapp

COPY . /myapp

RUN mvn clean install


FROM openjdk:17

RUN mkdir /java

WORKDIR /java

COPY --from=stg /myapp/target/ /java/

RUN mv /java/*SNAPSHOT.jar /java/myapp.jar
EXPOSE 8080
CMD ["java","-jar","/java/myapp.jar"]