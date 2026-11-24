SELECT  
    station,
    recording_time :: DATE AS date,
    ROUND(AVG(pm25_ugm3), 2) AS avg_pm25,
    COUNT(pm25_ugm3) AS pm25_hours

FROM
    pollution_dataset

WHERE
    station = 'mhada_colony'
    AND EXTRACT(YEAR FROM recording_time) = 2022
    AND EXTRACT(MONTH FROM recording_time) = 5

GROUP BY
    station,
    recording_time :: DATE

HAVING
    COUNT(pm25_ugm3) >= 16

ORDER BY
    date;
