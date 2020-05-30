
New webserver setup:

    # apt update && apt upgrade
    # adduser xxxxxx
    # usermod -aG sudo xxxxxx
    # su - xxxxxx  # to test sudo rights

    # apt install vim tmux htop jq python3 python3-pip redis \
      tree traceroute postgresql nginx mariadb-server \
      virtualenvwrapper

Harden setup for MariaDB

    # mysql_secure_installation

Add virtualenvwrapper to user's `.bashrc`

    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh

Setup sshd daemon

    # vim /etc/ssh/sshd_config

    | PubkeyAuthentication yes
    | AllowUsers xxxxxx root
    | PasswordAuthentication no

    # cp -r /root/.ssh /home/xxxxxx/
    # chown -R xxxxxx:xxxxxx /home/xxxxxx/.ssh
    # chmod 700 /home/xxxxxx/.ssh
    # chmod 600 /home/xxxxxx/.ssh/authorized_keys
    # systemctl restart sshd

Now the user has the same pubkey as the root. Try to ssh into the server with
the new user. Then try out the user's sudo rights

    $ sudo ls -la /root

If that is successful, remove the "root" user from the sshd login

    # vim /etc/ssh/sshd_config

    | AllowUsers xxxxxx

Finally, restart the server in case the update required it.

Try to get fail2ban with email notification working....

    $ sudo apt install fail2ban postfix mailutils

Set up Let's Encrypt certbot with nginx plugin:

    $ sudo apt install certbot python3-certbot-nginx

    $ sudo ln -s /var/www/yaix.de/.nginx.conf /etc/nginx/sites-enabled/yaix.de

    $ sudo certbot --nginx -d yaix.de -d www.yaix.de

Certbot automatically updates the nginx config. BUT: one of the servers needs to
be set as "default\_server" in order for SSL to work, eg:

    server {
        listen 443 default_server ssl;
        server_name yaix.de;

        root /var/www/yaix.de;
        index index.html;

        location ~ /\. {
            deny all;
        }




