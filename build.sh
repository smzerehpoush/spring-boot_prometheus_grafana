echo "##1 : kill old application if exists"
sudo kill -9 $(lsof -i tcp:8088)
echo "##2 create new package of project"
mvn clean package
cd target
JAR_FILE=$(find . -maxdepth 3 -iname "*.jar" | sort -rfV  | head -n 1 | awk "{print $9}" | cut -d "/" -f 2)
mv $JAR_FILE .. && cd ..
echo "##3 run project"
rm nohup.out
nohup java -jar $JAR_FILE &
tail -f ./nohup.out
