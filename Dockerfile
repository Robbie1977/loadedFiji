FROM fiji/fiji

ADD https://imagescience.org/meijering/software/download/imagescience.jar /opt/fiji/Fiji.app/plugins/imagescience.jar
ADD https://imagescience.org/meijering/software/download/TransformJ_.jar /opt/fiji/Fiji.app/plugins/TransformJ_.jar

USER root 
RUN chmod -R 777 /opt/fiji/Fiji.app/plugins
RUN apt -y update && apt -y install imagemagick
USER fiji

RUN ImageJ-linux64 --update update || true
RUN ImageJ-linux64 --update update
