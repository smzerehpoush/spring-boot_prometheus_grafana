# Spring Boot + Prometheus + Grafana

![Java CI with Maven](https://github.com/smzerehpoush/spring-boot_prometheus_grafana/workflows/Java%20CI%20with%20Maven/badge.svg)


This Repository integrates SpringBoot v2.* + Prometheus + Grafana

## Step 1 : run spring boot application

i provided a script ```build.sh``` to simply create package and run application.
deafult port is 8088

## Step 2 : integerate Prometheus 

```
docker pull prom/prometheus
```
and create a configuration file for prometheus named prometheus.yml like the file in project.
and run it like this.
```
docker run -d --name prometheus -p 9090:9090 \
-v PATH_TO_PROJECT/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml
```

## Step 3 : integrate Grafana

```
docker pull grafana/grafana
```

and after that run it like this 
```
docker run -d --name grafana -p 3000:3000 grafana/grafana
```
and finally integrate grafana with prometheous.
you should go to HOST_IP:3000 (grafana panel) and login with admin/admin auth.
after that you sould add prometheus as datasource and enter HOST_IP:PORT of prometheus.
and after that go to manage dashboards and imprt this dashboard [link to dashboard](https://grafana.com/grafana/dashboards/10280)
have fun :))
