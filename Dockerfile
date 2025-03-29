# Chọn base image từ OpenJDK
FROM maven:3.8.5-openjdk:17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép file JAR đã build vào container
COPY target/demodocker-0.0.1-SNAPSHOT.jar app.jar

# Mở cổng 8080 trong container (Spring Boot mặc định chạy trên cổng 8080)
EXPOSE 8080

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]
