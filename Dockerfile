FROM node:20-alpine as builder

WORKDIR /opt/docusaurus
ARG HOST
ARG PORT
ARG TYPESENSE_API_KEY

ENV HOST=$HOST
ENV PORT=$PORT
ENV TYPESENSE_API_KEY=$TYPESENSE_API_KEY

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

FROM nginx:alpine

COPY --from=builder /opt/docusaurus/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
