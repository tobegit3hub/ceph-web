# Ceph Web

## Introduction

Ceph-web is the management tool for ceph with full features.

* Easy to run with docker contaienr
* Lightweight management tools
* Full APIs from ceph-rest-api
* Web UI with material design

![](./screenshot.png)

## Installation

```
docker run -d --net=host tobegit3hub/ceph-web
```

Please go to <http://127.0.0.1:8080> in the brower.

## Notice

Ceph-web accesses official ceph-rest-api service. You can run [ceph/demo](https://github.com/ceph/ceph-docker/tree/master/demo) to setup all-in-one ceph cluster locally.

```
docker run -d --net=host -e MON_IP=192.168.0.20 -e CEPH_NETWORK=192.168.0.0/24 ceph/demo
```
