echo $API_BASE_URL
find /usr/share/nginx/html -type f -exec sed -i -e "s#@API_BASE_URL#$API_BASE_URL#g" {} \;
find /usr/share/nginx/html -type f -exec sed -i -e "s#@AUTH_BASE_URL#$AUTH_BASE_URL#g" {} \;
nginx -g "daemon off;"	
