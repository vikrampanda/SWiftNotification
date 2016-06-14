#Pulling Base Image Ubuntu Latest
FROM ubuntu:latest

#Copying Notification Server
RUN mkdir -p /app/SwiftKanban
ADD SwiftNotification /app/SwiftKanban/SwiftNotification

#Adding Startup File and Making it Executable
ADD StartSwiftNotification.sh /app/SwiftKanban/StartSwiftNotification.sh
RUN chmod 777 /app/SwiftKanban/StartSwiftNotification.sh

#Installing java
RUN chmod -R 777 /app/SwiftKanban/SwiftNotification/java
RUN ln -s /app/SwiftKanban/SwiftNotification/java/bin/java /usr/local/bin/
RUN ln -s /app/SwiftKanban/SwiftNotification/java/bin/javac /usr/local/bin/
RUN { \
  echo 'export JAVA_HOME=/app/SwiftKanban/SwiftNotification/java'; \
  echo 'export PATH=$PATH:$JAVA_HOME/bin'; \
 } > ~/.bashrc

CMD [ "/app/SwiftKanban/StartSwiftNotification.sh" ]