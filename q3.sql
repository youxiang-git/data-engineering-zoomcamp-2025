-- Queries for answering question 3

-- part 1
SELECT COUNT(1) FROM green_taxi_trips
WHERE trip_distance <= 1;

-- part 2
SELECT COUNT(1) FROM green_taxi_trips
WHERE trip_distance > 1 AND trip_distance <= 3;

-- part 3
SELECT COUNT(1) FROM green_taxi_trips
WHERE trip_distance > 3 AND trip_distance <= 7;

-- part 4
SELECT COUNT(1) FROM green_taxi_trips
WHERE trip_distance > 7 AND trip_distance <= 10;

-- part 5
SELECT COUNT(1) FROM green_taxi_trips
WHERE trip_distance >= 10;