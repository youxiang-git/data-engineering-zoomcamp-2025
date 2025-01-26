SELECT z."LocationID", z."Zone", SUM(t.total_amount) AS sum_total_amount
FROM green_taxi_trips t 
JOIN taxi_zones z
ON t."PULocationID" = z."LocationID"
WHERE DATE(t."lpep_pickup_datetime") = '2019-10-18'
GROUP BY z."LocationID", z."Zone"
ORDER BY sum_total_amount DESC;