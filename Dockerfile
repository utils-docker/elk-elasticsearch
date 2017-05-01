FROM docker.elastic.co/logstash/logstash:5.3.2
MAINTAINER Fábio Luciano <fabioluciano@php.net>
LABEL Description="ELK - ElasticSearch"

ENV elk_elasticsearch_home '/usr/share/elasticsearch/bin'

ARG elk_elasticsearch
ENV elk_elasticsearch ${elk_elasticsearch:-"http://172.18.0.10:5601"}

ARG elk_logstash
ENV elk_logstash ${elk_logstash:-"http://172.18.0.11:5044"}

ARG elk_kibana
ENV elk_kibana ${elk_kibana:-"http://172.18.0.12:5601"}

RUN $elk_elasticsearch_home/bin/elasticsearch-plugin install royrusso/elasticsearch-HQ

USER root
