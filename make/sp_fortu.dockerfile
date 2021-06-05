FROM debian 
RUN apt-get update && \
    apt-get install -y fortune
COPY sp_fortu.sh / 
CMD ["sp_fortu.sh"] 

