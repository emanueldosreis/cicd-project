FROM httpd:2.4
COPY ./public/* /usr/local/apache2/htdocs/
RUN echo "docker test run command" >  /usr/local/apache2/htdocs/docker.txt
EXPOSE 80
