# Spring Boot + Prometheus + Grafana

![Java CI with Maven](https://github.com/smzerehpoush/spring-boot_prometheus_grafana/workflows/Java%20CI%20with%20Maven/badge.svg)


This Repository integrates SpringBoot + Prometheus + Grafana

bellow are steps for Spring Boot V2.* : 

## Step 1 : run spring boot application

i provided a script ```build.sh``` to simply create package and run application.
deafult port is 8088


in exesting projects add these maven dependencies
```xml

<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
        
<dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-core</artifactId>
</dependency>
        
<dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-prometheus</artifactId>
</dependency>
```
 and add these configurations to application.yml
```yml
management:
  endpoints:
    web:
      exposure:
        include: "*"
``` 
## Step 2 : integerate Prometheus 

```bash
$ docker pull prom/prometheus
```
and create a configuration file for prometheus named prometheus.yml like the file in project.
and run it like this.
```bash 
$ docker run -d --name prometheus -p 9090:9090 \
-v PATH_TO_PROJECT/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml
```

## Step 3 : integrate Grafana

```bash
$ docker pull grafana/grafana
```

and after that run it like this 
```bash
$ docker run -d --name grafana -p 3000:3000 grafana/grafana
```
and finally integrate grafana with prometheous.
you should go to HOST_IP:3000 (grafana panel) and login with admin/admin auth.
after that you sould add prometheus as datasource and enter HOST_IP:PORT of prometheus.
and after that go to manage dashboards and imprt this dashboard [link to dashboard](https://grafana.com/grafana/dashboards/10280)


have fun :))
