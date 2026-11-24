INSERT INTO pollution_dataset (
      station,
      recording_time,
      pm25_ugm3,
      pm10_ugm3,
      wind_speed_ms,
      wind_direction_deg,
      humidity_pct
)

SELECT
      'mhada_colony',
      reading_time,
      pm25_ugm3,
      pm10_ugm3,
      ws_ms,
      wd_deg,
      rh_pct

FROM
      raw_karve_road_2024;


TRUNCATE TABLE raw_karve_road_2024;

