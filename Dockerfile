FROM mysql:8.0.32-debian
# Install procps to shoew active processes
RUN apt-get update && apt-get install procps -y
# Create user e group mymovie
RUN addgroup mymovie && adduser --system --ingroup mymovie mymovie
# Use user mymovie
USER mymovie
# Set pw for mysql root user
ENV MYSQL_ROOT_PASSWORD root
# Copy mysql scripts to execute at container startup
COPY 1_db_schema.sql /docker-entrypoint-initdb.d/
COPY 2_db_data.sql /docker-entrypoint-initdb.d/
# Expose port 3306
EXPOSE 3306
EXPOSE 33060
# Run mysql
CMD ["mysqld"]