FROM docker.elastic.co/elasticsearch/elasticsearch:5.3.2
MAINTAINER Fábio Luciano <fabioluciano@php.net>
LABEL Description="ELK - ElasticSearch"

ENV elk_elasticsearch_bin '/opt/elasticsearch'
ENV elk_elasticsearch_home '/usr/share/elasticsearch'

ARG elk_elasticsearch
ENV elk_elasticsearch ${elk_elasticsearch:-"http://172.18.0.10:9200"}

ARG elk_logstash
ENV elk_logstash ${elk_logstash:-"http://172.18.0.11:5044"}

ARG elk_kibana
ENV elk_kibana ${elk_kibana:-"http://172.18.0.12:5601"}

ADD files/elasticsearch.yml $elk_elasticsearch_home/config/

VOLUME $elk_elasticsearch_home/data/

EXPOSE 9200/tcp
