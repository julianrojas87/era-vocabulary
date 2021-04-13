### Multi-stage Docker image

# STAGE 1: Start from a JAVA ready container
FROM openjdk:16-slim-buster AS docs
# Create a new directory for app files
RUN mkdir -p /opt/era-vocabulary
# Set working directory in the container
WORKDIR /opt/era-vocabulary
# Copy source files
COPY . .
# Create output folder
RUN mkdir public
# Execute WIDOCO
RUN ./generate-docs.sh

# STAGE 2: Start from NGINX ready container
FROM nginx
# Copy built application from stage 1
COPY --from=docs /opt/era-vocabulary/public /usr/www/era-vocabulary
# Copy reference data
COPY era-skos.ttl /usr/www/era-vocabulary
# Copy NGINX config files
COPY ./nginx/ /etc/nginx