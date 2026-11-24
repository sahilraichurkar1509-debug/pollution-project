SELECT
    fd.festival_date,
    fd.day_label,
    ROUND(MAX(pollution_dataset.pm25_ugm3), 1) AS max_pm25,
    COUNT(pollution_dataset.pm25_ugm3) AS pm25_hours,
    ROUND(AVG(pollution_dataset.pm25_ugm3), 1) AS mean_pm25

FROM
    festival_dates AS fd

LEFT JOIN pollution_dataset
    ON fd.festival_date = (pollution_dataset.recording_time - INTERVAL '6 hours')::date
   AND pollution_dataset.station = 'karve_road'

GROUP BY
    fd.festival_date,
    fd.day_label

ORDER BY
    fd.festival_date;