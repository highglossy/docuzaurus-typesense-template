FROM node:20-alpine as builder

WORKDIR /opt/docusaurus
ARG PROJECT
ARG PROJECT_URL
ARG HOST
ARG PORT
ARG TYPESENSE_API_KEY
ARG TYPESENSE_PORT

ENV PROJECT=$PROJECT
ENV PROJECT_URL=$PROJECT_URL
ENV HOST=$HOST
ENV PORT=$PORT
ENV TYPESENSE_API_KEY=$TYPESENSE_API_KEY
ENV TYPESENSE_PORT=$TYPESENSE_PORT

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

FROM nginx:alpine

COPY --from=builder /opt/docusaurus/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
