#!/bin/bash
apt-get update
apt-get install -y nginx

current_time=$(date "+%Y.%m.%d-%H.%M.%S.%N")
echo "Current Time : $current_time"

echo "I'm a new server created on ${current_time}" > /var/www/html/index.html
service nginx start

DOMAIN=vidyasagarmsc.xyz
SUBDOMAIN=lb.${DOMAIN}

echo "Creating a self-signed certificate"

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=IN/ST=karnataka/L=bangalore/O=OrgName/OU=IT Department/CN=${SUBDOMAIN}"

cat > /etc/nginx/sites-enabled/${DOMAIN} << 'EOF'
server {
        # SSL configuration
        #
        listen 443 ssl;
        listen [::]:443 ssl;
        #
        # Note: You should disable gzip for SSL traffic.
        # See: https://bugs.debian.org/773332
        #
        # Read up on ssl_ciphers to ensure a secure configuration.
        # See: https://bugs.debian.org/765782
        #
        # Self signed certs generated by the ssl-cert package
        # Don't use them in a production server!
        #
        # include snippets/snakeoil.conf;
        ssl_certificate     /etc/ssl/certs/nginx-selfsigned.crt; # The certificate file
        ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key; # The private key file
        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name ${SUBDOMAIN};

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
EOF

#echo "Enabling Firewall and adding rules"
#sudo ufw enable
#sudo ufw allow ssh
#sudo ufw allow 'Nginx Full'
sudo systemctl restart nginx