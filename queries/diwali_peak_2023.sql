SELECT  
    station,
    recording_time,
    ROUND(AVG(pm25_ugm3), 2) AS avg_pm25,
    COUNT(pm25_ugm3) AS pm25_hours

FROM
    pollution_dataset

WHERE
    station = 'mhada_colony'
    AND (recording_time >= '2023-11-10 00:00:00'
         AND recording_time <= '2023-11-15 00:00:00')
        
GROUP BY
    1,2

ORDER BY
    2;