# Configure YugabyteDB Datasource

Spring Boot automagically creates the Postgres Datasource and connection objects for us and we will only need to specify the application properties to configure our Data source. We'll add the follow properties in our Spring Boot app's `application.properties` file.

```
# Application port.
server.port = 8080

# ---------------------
# JPA/Hibernate config.
spring.jpa.database=POSTGRESQL

# The SQL dialect makes Hibernate generate better SQL for the chosen database.
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect

# Hibernate ddl auto (create, create-drop, validate, update).
spring.jpa.show-sql=true
spring.jpa.generate-ddl=true
spring.jpa.hibernate.ddl-auto=create

# -------------------
# Data-source config.
spring.datasource.platform=postgres
spring.datasource.url=jdbc:postgresql://localhost:5433/yugabyte
spring.datasource.username=yugabyte
spring.datasource.password=yugabyte

# HikariCP config (pool size, default isolation level).
spring.datasource.type=com.zaxxer.hikari.HikariDataSource
spring.datasource.hikari.transactionIsolation=TRANSACTION_SERIALIZABLE
```