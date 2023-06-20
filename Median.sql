USE joins;

SELECT *
FROM table_5;

SELECT *
FROM table_4;

SELECT val
FROM (SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownumber 
      FROM table_4) AS final_result
      WHERE rownumber IN (SELECT
                             CASE 
                                WHEN MAX(rownumber) MOD 2 = 1 THEN (CEIL(MAX(rownumber)/2))
                                ELSE (CEIL(MAX(rownumber)/2),FLOOR(rownumber)/2)
                                END);
                                
                                
SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownumber 
      FROM table_4;

SELECT ROUND(SUM(val)/2, 4) 
FROM
    (SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownumber 
	 FROM table_4 AS final_result) AS final_table
WHERE rownumber IN (2,3);

                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                