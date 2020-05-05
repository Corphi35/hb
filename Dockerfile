ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

# métadonnées exploitables dans l'image accessible via inspect
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois" \
      clef1=bonjour

RUN useradd user1
USER user1
#ici je ne suis plus root mais user1

COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
#COPY heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ;
#RUN chmod +x /entrypoint.sh ; \
    #echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile
EXPOSE 1234/udp 4321/tcp

#défini le point d'entrée sinon bash par défaut
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["battement"]

CMD ["/entrypoint.sh","coucou"]

