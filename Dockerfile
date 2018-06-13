FROM alpine:3.7

RUN apk add --no-cache curl bash sed grep bc coreutils findutils
COPY uptest.sh /

CMD /uptest.sh 1 -l file.log -h $PINGHOST | \
    xargs -d'\n' -n1 -I payload curl http://humio:8080/api/v1/dataspaces/sandbox/ingest  -X POST  \
    -H "Content-Type: application/json"  \
    -H "Authorization: Bearer " \
    -d '[{"tags": {"host":"ping-container"}, "events" : [payload]}]'