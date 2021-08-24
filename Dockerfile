#############
# Build phase
#############

FROM node:alpine as build

WORKDIR /app

# deps
COPY package.json .
RUN npm install

# build
COPY . .
RUN npm run build


###########
# Run phase
###########
FROM nginx

EXPOSE 80

COPY --from=build /app/build /usr/share/nginx/html
