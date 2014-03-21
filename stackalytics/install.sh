#!/bin/bash
apt-get -y install libpython2.7-dev python-pip git memcached nginx uwsgi uwsgi-plugin-python
pip install --upgrade pip
pip install pbr

mkdir /opt/stack/
chown stackalytics.stackalytics /opt/stack
mkdir /var/local/stackalytics 
chown stackalytics.stackalytics /var/local/stackalytics
 
cd /opt/stack/
git clone git://github.com/stackforge/stackalytics.git

cd /opt/stack/stackalytics
python setup.py install

cd /var/local/stackalytics
git clone http://git.linaro.org/lava/lava-server.git
git clone http://git.linaro.org/lava/lava-dispatcher.git
cp /usr/local/etc/stackalytics/* /usr/local/etc


cat > /etc/uwsgi/apps-enabled/stackalytics.conf <<EOF
<uwsgi>
    <socket>/tmp/stackalytics.sock</socket>
    <pythonpath>/opt/stack/stackalytics/dashboard/</pythonpath>
    <module>web:app</module>
    <plugins>python27</plugins>
    <env>STACKALYTICS_CONF=/usr/local/etc/stackalytics/stackalytics.conf</env>
</uwsgi>
EOF

cat > /etc/nginx/sites-enabled/stackalytics.conf <<EOF
server {
	listen   80; 
	location / {
        	uwsgi_pass  unix:///tmp/stackalytics.sock;
        	include     uwsgi_params;
	}
	location  /static/ {
        	alias  /opt/stack/stackalytics/dashboard/static/;
	}
}
EOF
service uwsgi restart
rm /etc/nginx/sites-enabled/default
service nginx restart
