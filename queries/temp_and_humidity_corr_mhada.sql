WITH daily_pm25 AS (
    SELECT
        recording_time::date AS date,
        ROUND(AVG(pm25_ugm3), 2) AS avg_pm25,
        COUNT(pm25_ugm3) AS pm25_hours

    FROM 
        pollution_dataset

    WHERE   
        station = 'mhada_colony'

    GROUP BY 
        recording_time::date

    HAVING 
        COUNT(pm25_ugm3) >= 16
),

daily_weather AS (
    SELECT
        time::date AS date,
        ROUND(AVG(wind_speed_10m_ms), 2) AS avg_wind_speed,
        ROUND(AVG(temperature_2m_c), 1) AS avg_temp,
        ROUND(AVG(humidity_2m_pct), 1) AS avg_humidity,
        SUM(rain_mm) AS total_rain

    FROM 
        weather_data

    WHERE 
        location = 'pune'

    GROUP BY 
        time::date
),

joined AS (
    SELECT
        p.date,
        p.avg_pm25,
        p.pm25_hours,
        w.avg_wind_speed,
        w.avg_temp,
        w.avg_humidity,
        w.total_rain

    FROM 
        daily_pm25 AS p

    INNER JOIN daily_weather AS w
        ON p.date = w.date
)

SELECT
    EXTRACT(MONTH FROM date) AS month,
    COUNT(*) AS days,
    ROUND(CORR(avg_pm25, avg_humidity)::numeric, 2) AS corr_humidity,
    ROUND(CORR(avg_pm25, avg_temp)::numeric, 2) AS corr_temp

FROM 
    joined

GROUP BY 
    EXTRACT(MONTH FROM date)

ORDER BY 
    month;