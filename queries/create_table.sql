
SELECT
      EXTRACT(YEAR FROM recording_time) AS year,
      COUNT(*) AS record_count,
      COUNT(pm25_ugm3) AS pm25_count
FROM
      pollution_dataset
GROUP BY
      EXTRACT(YEAR FROM recording_time);


--to check if raw_karve_road_2024 table is filled correctly
SELECT
      COUNT (*) AS total_records,
      COUNT (pm25_ugm3) AS pm25_count
FROM 
      raw_karve_road_2024;


--to check if pollution_dataset table is filled correctly
SELECT
      station,
      COUNT(*) AS record_count,
      COUNT(pm25_ugm3) AS pm25_count
      
FROM
      pollution_dataset

GROUP BY
      station;


--to check station, year and month wise data in pollution_dataset table
SELECT
      station,
      EXTRACT(YEAR FROM recording_time) AS year,
      EXTRACT(MONTH FROM recording_time) AS month,
      ROUND(AVG(pm25_ugm3), 2) AS avg_pm25,
      ROUND(COUNT(pm25_ugm3) / COUNT(*)::numeric * 100, 2) AS pm25_percentage

FROM
      pollution_dataset

WHERE
      station = 'mhada_colony'
      

GROUP BY
      station,
      EXTRACT(YEAR FROM recording_time),
      EXTRACT(MONTH FROM recording_time)

HAVING
      ROUND(COUNT(pm25_ugm3) / COUNT(*)::numeric * 100, 2) > 60

ORDER BY
      station,
      year,
      month;

-- to compare the average, min, max and median pm25 values 
SELECT
      station,
      EXTRACT(YEAR FROM recording_time) AS year,
      EXTRACT(MONTH FROM recording_time) AS month,
      COUNT(pm25_ugm3) AS pm25_count,
      AVG(pm25_ugm3) AS avg_pm25,
      MIN(pm25_ugm3) AS min_pm25,
      MAX(pm25_ugm3) AS max_pm25,
      PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY pm25_ugm3) AS median_pm25

FROM
      pollution_dataset

WHERE

      station = 'mhada_colony'
      AND EXTRACT(YEAR FROM recording_time) = 2022
      AND EXTRACT(MONTH FROM recording_time) = 5

GROUP BY
      station,
      EXTRACT(YEAR FROM recording_time),
      EXTRACT(MONTH FROM recording_time);

SELECT 
      recording_time :: DATE as date
FROM pollution_dataset
LIMIT 10;
      
