FROM rfdhdt/hdt-cpp

ADD tools /tmp/tools
ADD make-all.sh /tmp/make-all.sh

RUN mkdir /opt/bear
RUN cd /usr/local/src/hdt-cpp/hdt-lib && /tmp/make-all.sh

ENV POLICY ic
ENV CATEGORY mat
ENV versions=1298
ENV QUERY subjectLookup/queries-sel-10-e0.2.txt

#    -l 1298 \
WORKDIR /opt/bear
CMD /opt/bear/query-$POLICY-$CATEGORY \
    -d /var/data/dataset/$POLICY/ \
    -l $versions \
    -t spo \
    -i /var/data/queries/$QUERY\
    -o /var/data/output/time-hdt-$POLICY-$CATEGORY-$(echo $QUERY | sed "s/\//-/g").txt

