# Spring Boot + Prometheus + Grafana

![Java CI with Maven](https://github.com/smzerehpoush/spring-boot_prometheus_grafana/workflows/Java%20CI%20with%20Maven/badge.svg)


This Repository integrates SpringBoot + Prometheus + Grafana

## Step 1 : run spring boot application

i provided a script ```build.sh``` to simply create package and run application.
default port is 8088. 

notes : configuration file for spring boot v1.5 and v2 is different. so there are two directories for each version.
and also prometheus config. so based on your project version check directories.


in existing projects add these maven dependencies
```xml

<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
        
<!--this is for spring boot v2, for v1.5 check bellow-->
<dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-core</artifactId>
</dependency>
<!--this is for spring boot v1.5-->
<dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-spring-legacy</artifactId>
</dependency>
        

<dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-prometheus</artifactId>
</dependency>
```
 and add these configurations to application.yml
```yaml
management:
  endpoints:
    web:
      exposure:
        include: "*"
``` 
## Step 2 : integrate Prometheus 

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
and finally integrate Grafana with Prometheus.
you should go to HOST_IP:3000 (Grafana panel) and login with admin/admin auth.
after that you should add prometheus as datasource and enter HOST_IP:PORT of prometheus.
and after that go to manage dashboards and import this dashboard [link to dashboard for v2](https://grafana.com/grafana/dashboards/10280) or [link to dashboard for v1.5](https://grafana.com/grafana/dashboards/7731) 


have fun :))
