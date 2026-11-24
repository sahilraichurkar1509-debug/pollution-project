CREATE TABLE weather_data (
       location TEXT,
       time TIMESTAMP,
       rain_mm NUMERIC,
       wind_speed_10m_ms NUMERIC,
       wind_direction_10m_deg NUMERIC,
       temperature_2m_c NUMERIC,
       humidity_2m_pct NUMERIC,
       PRIMARY KEY (location, time)
      )
    
SELECT * FROM weather_data;

CREATE TABLE raw_weather(

       time TIMESTAMP,
       rain_mm NUMERIC,
       wind_speed_10m_ms NUMERIC,
       wind_direction_10m_deg NUMERIC,
       temperature_2m_c NUMERIC,
       humidity_2m_pct NUMERIC
)

SELECT * FROM raw_weather;

INSERT INTO weather_data (
       location,
       time,
       rain_mm,
       wind_speed_10m_ms,
       wind_direction_10m_deg,
       temperature_2m_c,
       humidity_2m_pct
)

SELECT
       'pune',
       time,
       rain_mm,
       wind_speed_10m_ms,
       wind_direction_10m_deg,
       temperature_2m_c,
       humidity_2m_pct

FROM 
       raw_weather;
    

SELECT * FROM weather_data;

SELECT
    location,
    time::date AS date,
    ROUND(AVG(wind_speed_10m_ms), 2) AS avg_wind_speed,
    SUM(rain_mm) AS total_rain

FROM    
    weather_data

WHERE
    EXTRACT(YEAR FROM time) = 2022
    AND EXTRACT(MONTH FROM time) = 5

GROUP BY
    location,
    time::date

ORDER BY
    time::date;
    
