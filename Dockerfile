FROM klakegg/hugo:ext-alpine AS websitebuild

RUN mkdir -p /hugo
WORKDIR /hugo
ADD . .
RUN hugo

# Hosting Layer
FROM nginx
COPY --from=websitebuild /hugo/public/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
