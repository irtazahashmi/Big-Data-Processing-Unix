#!/usr/bin/env bash
echo "Running logParsing.sh"

# ---- APACHE ----
cd ./../data/apacheLog || exit

# -- Q1 --
echo "-- Q1 --"
# Write a pipeline that from access_log get all POST requests and displays time, clientIP, path, statusCode, size
# For example: 10/Mar/2004:12:02:59,10.0.0.153,/cgi-bin/mailgraph2.cgi,200,2987
accessData=$(cat access_log | grep 'POST' access_log | awk '{print $4 "," $1 "," $7 "," $9 "," $10}' | cut -c 2-)
# Print accessData
echo "Access data:"
echo "$accessData"


echo "--------"
# -- Q2 --
echo "-- Q2 --"
# Write a pipeline that returns the IP and path of larges size of the response to a POST request
# so for example: 192.168.0.1,/actions/logout
# hint: you could re-use accessData to make it easier
largestResponse=$(cat access_log | grep 'POST' access_log | awk '{print $10 " " $1 "," $7'} | sort -nr | awk '{print $2,$3'} | head -1 )
echo "The largest Response was to:"
echo "$largestResponse"

echo "--------"
# -- Q3--
echo "-- Q3 --"
# Write a pipeline that returns the amount and IP of the client that did the most POST requests
# so for example: 20 192.168.0.1
# hint: you could re-use accessData to make it easier
mostRequests=$(cat access_log | grep 'POST' access_log | awk '{print $1'} | tr ' ' '\n' | sort | uniq -c | sort -n | tail -n 1 | sort -nr)
echo "The most requests where done by:"
echo "$mostRequests"

echo "--------"

#end on start path
cd ../../pipelines/ || exit
