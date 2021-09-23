FROM fluent/fluentd:v1.14-debian-1

USER root

RUN gem install fluent-plugin-datadog

USER fluent

COPY fluent.conf /fluentd/etc/

CMD ["fluentd", "-o", "/fluentd/log/fluentd.log"]
