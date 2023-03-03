CREATE DATABASE db;

USE db;

CREATE TABLE table_1(
Region VARCHAR(20),
Sub_Category VARCHAR(50),
Sales FLOAT);

SELECT *
FROM table_1;


INSERT INTO table_1
VALUES ('South', 'Bookcases', 261.96),
('South', 'Chairs', 731.94),
('West', 'Labels', 14.62),
('South', 'Tables', 957.5775),
('South', 'Storage', 22.368),
('West', 'Furnishings', 48.86),
('West', 'Art', 7.28),
('West', 'Phones', 907.152),
('West', 'Binders', 18.504),
('West', 'Appliances', 114.9),
('West', 'Tables', 1706.184),
('West', 'Phones', 911.424),
('South', 'Paper', 15.552),
('West', 'Binders', 407.976),
('Central', 'Appliances', 68.81),
('Central', 'Binders', 2.544),
('Central', 'Storage', 665.88),
('West', 'Storage', 55.5),
('West', 'Art', 8.56),
('West', 'Phones', 213.48),
('West', 'Binders', 22.72),
('Central', 'Art', 19.46),
('Central', 'Appliances', 60.34),
('East', 'Chairs', 71.372),
('West', 'Tables', 1044.63);


SELECT Sub_Category,
ROUND(SUM(CASE WHEN Region='East' THEN Sales ELSE 0 END),2) AS 'East',
ROUND(SUM(CASE WHEN Region='West' THEN Sales ELSE 0 END),2) AS 'West',
ROUND(SUM(CASE WHEN Region='South' THEN Sales ELSE 0 END),2) AS 'South',
ROUND(SUM(CASE WHEN Region='Central' THEN Sales ELSE 0 END),2) AS 'Central'
FROM table_1
GROUP BY Sub_Category;








