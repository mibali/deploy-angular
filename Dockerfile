# syntax=docker/dockerfile:1

FROM node:18 as node

ENV NODE_ENV=production

WORKDIR /app

COPY ./package*.json .

RUN npm install --production

COPY . .


EXPOSE 4200
# CMD ["npm", "run", "build"]

# RUN ng build 
RUN npm run build

FROM nginx:alpine
COPY --from=node /app/dist/my-app /usr/share/nginx/html
