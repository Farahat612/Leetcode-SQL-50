SELECT ROUND(SUM(insurance.TIV_2016),2) AS TIV_2016
FROM insurance
WHERE insurance.TIV_2015 IN
    (
      SELECT TIV_2015
      FROM insurance
      GROUP BY TIV_2015
      HAVING COUNT(*) > 1
    )
    AND CONCAT(LAT, LON) IN
    (
      SELECT CONCAT(LAT, LON)
      FROM insurance
      GROUP BY LAT , LON
      HAVING COUNT(*) = 1
    )