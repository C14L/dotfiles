

Create a new Spring Boot app via command line:

curl https://start.spring.io/starter.tgz -d packaging=jar \
-d dependencies=data-jpa,web,h2,lombok \
-d baseDir=crud-mockmvc -d artifactId=crud-mockmvc \
-d name=crud-mockmvc -d type=maven-project \
-d groupId=com.makariev.examples.spring | tar -xzvf -

