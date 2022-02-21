FROM fiji/fiji

USER root 
RUN chmod -R 777 /opt/fiji
RUN apt -y update && apt -y install default-jre imagemagick
USER fiji

COPY plugins/*.jar /opt/fiji/Fiji.app/plugins/

RUN echo "run("H5J Installer");" > /installer.ijm && ImageJ-linux64 -macro /installer.ijm 

RUN /opt/fiji/entrypoint.sh --update add-update-site ImageScience https://sites.imagej.net/ImageScience/
RUN /opt/fiji/entrypoint.sh --update update || true
RUN /opt/fiji/entrypoint.sh --update update
