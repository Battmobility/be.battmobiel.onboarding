echo $BOOKING_API_BASE_URL
#find /usr/share/nginx/html -type f -exec sed -i -e "s#@BOOKING_API_BASE_URL#$BOOKING_API_BASE_URL#g" {} \;
#find /usr/share/nginx/html -type f -exec sed -i -e "s#@AUTH_BASE_URL#$AUTH_BASE_URL#g" {} \;
nginx -g "daemon off;"	
