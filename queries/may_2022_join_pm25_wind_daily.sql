WITH daily_pm25 AS( 
    SELECT  
        station,
        recording_time :: DATE AS date,
        ROUND(AVG(pm25_ugm3), 2) AS avg_pm25,
        COUNT(pm25_ugm3) AS pm25_hours

    FROM
        pollution_dataset

    WHERE
        station = 'karve_road'

    GROUP BY
        station,
        recording_time :: DATE

    HAVING
        COUNT(pm25_ugm3) >= 16

    ORDER BY
        date
), daily_weather AS(
     SELECT
        location,
        time::date AS date,
        ROUND(AVG(wind_speed_10m_ms), 2) AS avg_wind_speed,
        SUM(rain_mm) AS total_rain

    FROM    
        weather_data
    
    WHERE
        location = 'pune'

    GROUP BY
        location,
        time::date

    ORDER BY
        time::date
), joined AS (
    SELECT 
        daily_pm25.date AS date,
        daily_pm25.avg_pm25 AS avg_pm25,
        daily_pm25.pm25_hours AS pm25_hours,
        daily_weather.avg_wind_speed AS avg_wind_speed,
        daily_weather.total_rain AS total_rain

    FROM
        daily_pm25

    INNER JOIN daily_weather ON daily_pm25.date = daily_weather.date
)

   SELECT
       EXTRACT(YEAR FROM joined.date) AS year,
       EXTRACT(MONTH FROM joined.date) AS month,
       CASE
        WHEN joined.total_rain = 0 THEN 'DRY'
        WHEN joined.total_rain > 1 THEN 'RAINY'
        ELSE 'LIGHT'
       END AS rainy_group,
       COUNT(*) AS days,
       ROUND(AVG(joined.avg_pm25), 1) AS mean_pm25,
       CORR(joined.avg_pm25, joined.avg_wind_speed) AS correlation_pm25_wind_speed


   FROM 
       joined

   GROUP BY 
       1, 2, 3

   ORDER BY 
       1, 2, 3;

SELECT
    EXTRACT(YEAR FROM time) AS year,
    SUM(rain_mm) AS total_rain,
    ROUND(AVG(wind_speed_10m_ms), 1) AS avg_wind_speed

FROM
    weather_data

WHERE
    EXTRACT(MONTH FROM time) = 5
    AND location = 'pune'

GROUP BY    
    1

ORDER BY 
    2;

