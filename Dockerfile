FROM openresty/openresty:bionic

RUN mkdir -p /usr/local/openresty/nginx/conf/conf.d

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY prometheus.conf /usr/local/openresty/nginx/conf/conf.d/prometheus.conf

RUN opm get knyar/nginx-lua-prometheus

RUN mkdir -p /var/log/nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGTERM

EXPOSE 9145 80

CMD ["nginx", "-g", "daemon off;"]
