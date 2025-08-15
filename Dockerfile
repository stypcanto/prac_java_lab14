# Imagen base de Tomcat
# Imagen base de Tomcat con JDK 17
FROM tomcat:10.1-jdk17

# Eliminamos aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el WAR compilado desde Maven
COPY target/Lab14-Implementacion-Web-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war


# Exponer puerto
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]