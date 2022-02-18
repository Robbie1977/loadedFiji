FROM fiji/fiji

USER root 
RUN chmod -R 777 /opt/fiji/Fiji.app/plugins
RUN apt -y update && apt -y install imagemagick
USER fiji

RUN /opt/fiji/entrypoint.sh --update add-update-site ImageScience https://sites.imagej.net/ImageScience/
RUN /opt/fiji/entrypoint.sh --headless --update update 
