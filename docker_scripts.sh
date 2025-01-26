URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"

docker run -it \
  --network=data_engineering_zoomcamp_2025_default \
  green-taxi-ingest:v001 \
    --user=root \
    --password=root \
    --host=hw1pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=green_taxi_trips \
    --url=${URL}


URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv"

docker run -it \
  --network=data_engineering_zoomcamp_2025_default \
  taxi-zone-ingest:v001 \
    --user=root \
    --password=root \
    --host=hw1pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=taxi_zones \
    --url=${URL}