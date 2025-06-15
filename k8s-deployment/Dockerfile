FROM nginx:apline

WORKDIR /usr/share/nginx/html

# Remove the default nginx index page
RUN rm -rf ./*

COPY index.html .

EXPOSE 80