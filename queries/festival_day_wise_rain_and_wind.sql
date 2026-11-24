SELECT
    fd.festival_date,
    fd.day_label,
    ROUND(AVG(w.wind_speed_10m_ms), 1) AS wind,
    ROUND(SUM(w.rain_mm), 1) AS rain_mm

FROM 
    festival_dates AS fd

LEFT JOIN weather_data AS w
    ON fd.festival_date = (w.time - INTERVAL '6 hours')::date
   AND w.location = 'pune'

GROUP BY 
    fd.festival_date, 
    fd.day_label

ORDER BY 
    fd.festival_date;