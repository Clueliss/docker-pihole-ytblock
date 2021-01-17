FROM pihole/pihole:latest

RUN cd /opt && \
    git clone https://github.com/kboghdady/youTube_ads_4_pi-hole.git && \
    mv youTube_ads_4_pi-hole pihole-yt && \
    cd pihole-yt && \
    sed -i "s|repoDir='/pi/youTube_ads_4_pi-hole'|repoDir='/opt/pihole-yt'|" youtube.sh && \
    chmod +x youtube.sh && \
    (crontab -l 2> /dev/null; echo "0 */1 * * * /opt/pihole-yt/youtube.sh > /dev/null") | crontab -
