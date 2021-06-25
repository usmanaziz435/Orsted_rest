SELECT 
index
, trade_id
, execution_time
, price
,volume
, market
, product
, product_duration
, product_type
FROM public."Market_Data"
where product = 'XBID_2h';

SELECT 
TAB1.MARKET
,TAB1.PRODUCT_TYPE
,CNT
,SUM(volume*CNT)/SUM(CNT) AS VOL
FROM public."Market_Data" AS TAB1 
INNER JOIN 
(SELECT 
MARKET
,PRODUCT_TYPE
,COUNT(*) AS CNT
FROM public."Market_Data"
GROUP BY 1,2) AS TAB2
ON TAB1.MARKET=TAB2.MARKET
AND TAB1.PRODUCT_TYPE=TAB2.PRODUCT_TYPE
GROUP BY 1,2,3
ORDER BY VOL DESC

SELECT 
TAB1.MARKET
,TAB1.PRODUCT_TYPE
,MIN(volume) -- This can be changed to any (MIN,MAX,SUM,AVG)
FROM public."Market_Data" AS TAB1 
GROUP BY 1,2


SELECT 
                    market,product_type
                    ,max(price)
                    FROM public."Market_Data"
                    WHERE product_duration='30min'
                    GROUP BY market,product_type
