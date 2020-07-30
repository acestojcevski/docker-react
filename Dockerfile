# Build phase
FROM node:12-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx:1.18-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html/