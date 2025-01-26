SELECT 
    drop_z."Zone" AS dropoff_zone, 
    MAX(t."tip_amount") AS max_tip
FROM green_taxi_trips t
JOIN taxi_zones pick_z ON t."PULocationID" = pick_z."LocationID"
JOIN taxi_zones drop_z ON t."DOLocationID" = drop_z."LocationID"
WHERE pick_z."Zone" = 'East Harlem North'
  AND DATE(t."lpep_pickup_datetime") >= '2019-10-01'
  AND DATE(t."lpep_pickup_datetime") <= '2019-10-31'
GROUP BY drop_z."Zone"
ORDER BY max_tip DESC
LIMIT 1;