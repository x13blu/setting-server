FROM java:8


ADD

WORKDIR /opt/h2

ENV H2_DATA_DIR $WORKDIR/h2-data
ENV H2_ZIP h2-2014-04-05
ENV DOWNLOAD http://www.h2database.com/$H2_ZIP.zip

RUN mkdir $H2_DATA_DIR


COPY $H2_ZIP.zip $WORKDIR

RUN test ! -f $H2_ZIP.zip && curl $DOWNLOAD || exit 0

RUN unzip $H2_ZIP.zip && rm $H2_ZIP.zip


ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ



ADD start_h2.sh $WORKDIR


ENV H2_ZIP h2-2014-04-05







ENV H2_ZIP h2-2014-04-05
ENV H2_DRIVER h2-1.3.176
ENV DOWNLOAD http://www.h2database.com/$H2_ZIP.zip

ENV WEB_PORT 8082
ENV TCP_PORT 9092



COPY $H2_ZIP.zip $WORKDIR

RUN unzip $H2_ZIP.zip && rm $H2_ZIP.zip

RUN mkdir $H2_DIR
RUN mkdir $H2_DATA_DIR
RUN cd $H2_DIR

RUN echo h2_zip $H2_ZIP.zip
ADD $H2_ZIP.zip H2_DIR

RUN test -e $H2_ZIP.zip

RUN unzip h2.zip && rm h2.zip

#RUN curl $DOWNLOAD -o h2.zip && unzip h2.zip

EXPOSE $WEB_PORT $TCP_PORT

CMD java -cp /opt/h2/bin/$H2_DRIVER.jar org.h2.tools.Server -webAllowOthers -webPort $WEB_PORT -tcpAllowOthers -tcpPort $TCP_PORT -baseDir $H2_DATA_DIR
