-- RENAMING. SINCE THE NAME IS "cleaned_order_data" DURING IPORT OF THE DATA
EXEC sp_rename 'cleaned_order_data', 'orders';


--FOR CHECKING THE TABLE,
SELECT * FROM orders


--IS THERE ANY DUPLIOCATE order_id? 
SELECT DISTINCT (COUNT(order_id)) FROM orders;--(it's 110197 total orders, so no duplicate order_id)


-- TOTAL NUMBER OF NULL VALUES IN order_id COLUMN,
SELECT COUNT(order_id) FROM orders
WHERE order_id IS NULL; --(it's 0 null values in order_id column)


-- TOTAL NUMBER OF ORDERS,
SELECT COUNT(order_id) FROM orders  --(it's 110197 total orders)


-- TOTAL REVENUE,
SELECT SUM(price) FROM orders  --(it's 13221498.1120569 total revenue)


-- DATE RNAGE,
SELECT
MIN(order_purchase_timestamp) AS min_date,
MAX(order_purchase_timestamp) AS max_date
FROM orders  --(the date range is from 2016-09-15 12:16:38.0000000 to 2018-08-29 15:00:37.0000000)


-- MONTHLY SALES TREND,
SELECT 
	YEAR(order_purchase_timestamp) AS order_year, 
	MONTH(order_purchase_timestamp) AS order_month, 
	COUNT(order_id) AS total_orders,
	SUM(price) AS total_revenue
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY order_year, order_month --the monthly sales trend is as follows...
/*
order_year		order_month			total_orders					total_revenue
-------------------------------------------------------------------------------------
2016			9					3								134.9700050354
2016			10					313								40325.1098537445
2016			12					1								10.8999996185303
2017			1					913								111798.359863758
2017			2					1858							234223.399852276
2017			3					2897							359198.849533081
2017			4					2569							340669.679661751
2017			5					4004							489338.249369144
2017			6					3489							421923.370126963
2017			7					4416							481604.520348072
2017			8					4797							554699.700491667
2017			9					4737							607399.669447422
2017			10					5214							648247.649996758
2017			11					8475							987765.371120453
2017			12					6187							726033.189807892
2018			1					8037							924645.001465321
2018			2					7518							826437.131327868
2018			3					8017							953356.251186848
2018			4					7827							973534.089434505
2018			5					7810							977544.689771175
2018			6					7010							856077.859473944
2018			7					6963							867953.460258961
2018			8					7142							838576.639660597
*/


-- TOP 10 PRODUCT CATEGORIES BY REVENUE,
SELECT TOP 10 
	product_category_name, 
	COUNT(order_id) AS total_orders,
	SUM(price) AS total_revenue
FROM orders
GROUP BY product_category_name
ORDER BY total_revenue DESC --the top 10 product categories by revenue are as follows...
/*
product_category_name				total_orders				total_revenue
-----------------------------------------------------------------------------------
beleza_saude						9465						1233131.7208693
relogios_presentes					5859						1166176.97770691
cama_mesa_banho						10953						1023434.76004887
esporte_lazer						8431						954852.54893589
informatica_acessorios				7644						888724.607411385
moveis_decoracao					8160						711927.692316055
utilidades_domesticas				6795						615628.690759182
cool_stuff							3718						610204.101855278
automotivo							4140						578966.65078187
brinquedos							4030						471286.480434895
*/


-- TOP 10 STATES BY TOTAL ORDERS,
SELECT TOP 10
	customer_state,
	COUNT(order_id) AS total_orders,
	SUM(price) AS total_revenue
FROM orders
GROUP BY customer_state
ORDER BY total_orders DESC --the top 10 states by revenue are as follows...
/*
customer_state				total_orders				total_revenue
---------------------------------------------------------------------------
SP							46448						5067633.16164017
RJ							14143						1759651.1297828
MG							12916						1552481.8303504
RS							6134						728897.470029354
PR							5649						666063.510443211
SC							4097						507012.130374908
BA							3683						493584.139596939
DF							2355						296498.409964085
GO							2277						282836.69988966
ES							2225						268643.449930191
*/


-- AVERAGE ORDER VALUE,
SELECT ROUND(AVG(price), 0) AS average_order_value
FROM orders --the average order value is 120.00


-- TOP 10 PRODUCT CATEGORIES BY TOTAL ORDERS,
SELECT TOP 10
	product_category_name,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY product_category_name
ORDER BY total_orders DESC --the top 10 product categories by total orders are as follows...
/*
cama_mesa_banho  	     10953
beleza_saude	          9465
esporte_lazer	          8431
moveis_decoracao	      8160
informatica_acessorios	  7644
utilidades_domesticas	  6795
relogios_presentes        5859
telefonia	              4430
ferramentas_jardim	      4268
automotivo	              4140
*/



-- TOTAL ORDERS BY WEEKDAY,
SELECT 
	DATENAME(WEEKDAY, order_purchase_timestamp) AS order_weekday,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATENAME(WEEKDAY, order_purchase_timestamp)
ORDER BY total_orders DESC --the total orders by weekday are as follows...
/*
Monday  	17973
Tuesday  	17858
Wednesday	17219
Thursday	16434
Friday  	15698
Sunday  	13130
Saturday	11885
*/


-- TOTAL ORDERS AND REVENUE BY YEAR,
SELECT 
	YEAR(order_purchase_timestamp) AS order_year,
	COUNT(order_id) AS total_orders,
	SUM(price) AS total_revenue
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY total_orders DESC --the total orders and revenue by year are as follows...
/*
order_year			total_orders						total_revenue
-------------------------------------------------------------------------
2018				60324								7218125.12257922
2017				49556								5962902.00961924
2016				317									40470.9798583984
*/


-- TOTAL REVENUE AND ORDERS BY STATE,
SELECT TOP 10
	SUM(price) AS total_revenue,
	customer_state,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_state
ORDER BY total_orders DESC --the total revenue and orders by state are as follows...
/*
total_revenue				customer_state					total_orders
---------------------------------------------------------------------------
5067633.16164017			SP								46448
1759651.1297828				RJ								14143
1552481.8303504				MG								12916
728897.470029354			RS								6134
666063.510443211			PR								5649
507012.130374908			SC								4097
493584.139596939			BA								3683
296498.409964085			DF								2355
282836.69988966				GO								2277
268643.449930191			ES								2225
*/



-- AVERAGE FREIGHT VALUE,
SELECT 
	ROUND(AVG(freight_value), 2) AS average_freight_value
FROM orders --the average freight value is 19.95



-- MONTHLY SALES TREND IN DETAIL,
SELECT 
	FORMAT(order_purchase_timestamp, 'yyyy-MM') AS order_month,
	COUNT(order_id) AS total_orders,
	SUM(price) AS total_revenue
FROM orders
GROUP BY FORMAT(order_purchase_timestamp, 'yyyy-MM')
ORDER BY order_month --the monthly sales trend is as follows...
/*
order_month					total_orders					total_revenue
---------------------------------------------------------------------------------
2016-09						3								134.9700050354	
2016-10						313								40325.1098537445
2016-12						1								10.8999996185303
2017-01						913								111798.359863758
2017-02						1858							234223.399852276
2017-03						2897							359198.849533081
2017-04						2569							340669.679661751
2017-05						4004							489338.249369144
2017-06						3489							421923.370126963
2017-07						4416							481604.520348072
2017-08						4797							554699.700491667
2017-09						4737							607399.669447422
2017-10						5214							648247.649996758
2017-11						8475							987765.371120453
2017-12						6187							726033.189807892
2018-01						8037							924645.001465321
2018-02						7518							826437.131327868
2018-03						8017							953356.251186848
2018-04						7827							973534.089434505
2018-05						7810							977544.689771175
2018-06						7010							856077.859473944
2018-07						6963							867953.460258961
2018-08						7142							838576.639660597
*/ 



-- DISTRIBUTION OF ORDERS PER CUSTOMER,
SELECT
	orders_per_customer,
	COUNT(customer_unique_id) AS total_customers
FROM (
	SELECT 
		customer_unique_id,
		COUNT(order_id) AS orders_per_customer
	FROM orders
	GROUP BY customer_unique_id
) AS customer_orders
GROUP BY orders_per_customer
ORDER BY orders_per_customer --the distribution of orders per customer is as follows...
/*
orders_per_customer			total_customers
-----------------------------------------------
1							81748
2							8797
3							1646
4							621
5							241
6							190	
7							45
8							16
9							10
10							11
11							11
12							9
13							2
14							3
15							3
18							1
20							2
21							1
24							1
*/



-- TOP 10 CITIES BY TOTAL ORDERS,
SELECT TOP 10
	customer_city,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_city
ORDER BY total_orders DESC --the top 10 cities by total orders are as follows...
/*
sao paulo				17400
rio de janeiro			7592
belo horizonte			3087
brasilia				2341
curitiba				1727
campinas				1626
porto alegre			1573
salvador				1358
guarulhos				1294
sao bernardo do campo	1041
*/



-- TOP 10 PRODUCT CATEGORIES BY AVERAGE PRICE AND FREIGHT VALUE,
SELECT TOP 10
	product_category_name,
	ROUND(AVG(price), 2) AS average_price,
	ROUND(AVG(freight_value), 2) AS avarage_freight_value
FROM orders
GROUP BY product_category_name
ORDER BY ROUND(AVG(PRICE), 2) DESC --the top 10 product categories by average price and freight value are as follows...
/*
Product_categorry_name									average_price				avarage_freight_value
-----------------------------------------------------------------------------------------------------------
pcs														1098.92						48.57
portateis_casa_forno_e_cafe								638.21						36.39
eletrodomesticos_2										467.33						44.39
agro_industria_e_comercio								342.55						27.37
instrumentos_musicais									283.13						27.45
portateis_cozinha_e_preparadores_de_alimentos			280.97						21.03
eletroportateis											277.74						23.33
telefonia_fixa											216.92						17.65
construcao_ferramentas_seguranca						211.88						20.39
relogios_presentes										199.04						16.75
*/



-- TOP 10 PRODUCT CATEGORIES BY ORDER HOUR,
SELECT TOP 20
	product_category_name,
	DATEPART(HOUR, order_purchase_timestamp) AS order_hour,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, order_purchase_timestamp), product_category_name
ORDER BY total_orders DESC --the top 10 product categories by order hour are as follows...
/*
product_category_name					order_hour		total_orders
------------------------------------------------------------------------
cama_mesa_banho							14				795
cama_mesa_banho							13				737
cama_mesa_banho							21				718
cama_mesa_banho							15				716
cama_mesa_banho							16				708
cama_mesa_banho							11				694		
cama_mesa_banho							17				690
cama_mesa_banho							20				681		
beleza_saude							16				675
cama_mesa_banho							22				672
cama_mesa_banho							19				662
cama_mesa_banho							18				652
cama_mesa_banho							10				646
beleza_saude							13				639
beleza_saude							14				633
esporte_lazer							15				626
beleza_saude							11				626
informatica_acessorios					11				614
informatica_acessorios					14				611
cama_mesa_banho							12				594
*/




-- DISTRIBUTION OF ORDERS BY PRICE RANGE,
SELECT 
	COUNT(order_id) AS total_orders,
	CASE 
		WHEN price < 50 THEN '0-50'
		WHEN price BETWEEN 50 AND 100 THEN '50-100'
		WHEN price BETWEEN 100 AND 200 THEN '100-200'
		WHEN price BETWEEN 200 AND 300 THEN '200-300'
		WHEN price BETWEEN 300 AND 500 THEN '300-500'
		WHEN price BETWEEN 500 AND 1000 THEN '500-1000'
		ELSE '1000+'
	END AS price_range,
	SUM(price) AS total_revenue
FROM orders
GROUP BY 
	CASE 
		WHEN price < 50 THEN '0-50'
		WHEN price BETWEEN 50 AND 100 THEN '50-100'
		WHEN price BETWEEN 100 AND 200 THEN '100-200'
		WHEN price BETWEEN 200 AND 300 THEN '200-300'
		WHEN price BETWEEN 300 AND 500 THEN '300-500'
		WHEN price BETWEEN 500 AND 1000 THEN '500-1000'
		ELSE '1000+'
	END
ORDER BY total_orders DESC --the distribution of orders by price range is as follows...
/*
total_orders			price_range			total_revenue
--------------------------------------------------------------
38244					0-50				1197948.62239087
32662					50-100				2447217.68510818
26356					100-200				3785031.0256424
6253					200-300				1554555.06987
3592					300-500				1371946.44049072
2278					500-1000			1577561.15802002
812						1000+				1287238.11053467
*/


