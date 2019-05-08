FROM node:alpine as builder
WORKDIR /home/vncuser/docker/sample4
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/vncuser/docker/sample4 /home/vncuserdocker/sample4/html
