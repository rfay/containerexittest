FROM busybox

ADD files /

ENTRYPOINT ["/start.sh"]
