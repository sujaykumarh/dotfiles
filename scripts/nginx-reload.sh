#!/bin/sh

echo ""
echo "Enable nginx"
sudo systemctl enable nginx

echo ""
echo "Start nginx"
sudo systemctl start nginx


echo ""
echo "Testing curent /etc/nginx/nginx.conf"
sudo nginx -t

echo ""
echo "Reloading nginx"
sudo systemctl reload nginx

# echo "Restarting nginx"
# sudo systemctl restart nginx

echo ""
echo "NGINX Reload complete"
echo ""
