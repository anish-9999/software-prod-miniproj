FROM openjdk:11
COPY ./target/calculatorDevOps-7.0-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "calculatorDevOps-7.0-SNAPSHOT.jar"]
