#CREATE DATABASE halloween_candy ;
USE halloween_candy;
CREATE TABLE candy_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    competitorname VARCHAR(100),
    chocolate BOOLEAN,
    fruity BOOLEAN,
    caramel BOOLEAN,
	peanutyalmondy BOOLEAN,
    nougat BOOLEAN,
    crispedricewafer BOOLEAN,
    hard BOOLEAN,
    bar BOOLEAN,
    pluribus BOOLEAN,
    sugarpercent FLOAT,
    pricepercent FLOAT,
    winpercent FLOAT
    );
    select * FROM candy_ranking; 
    
    #Check the first 10 rows
	SELECT * FROM candy_ranking LIMIT 10;
    
    #Count the number of rows    
    SELECT COUNT(*) AS total_candies FROM candy_ranking;
    
    # Get column names and data types 
    #DESCRIBE candy_ranking; 
    
    #Find the highest-winperecnt candy 
    SELECT  competitorname,winpercent
	FROM candy_ranking 
	ORDER BY winpercent DESC 
    LIMIT 1;

    #Find the lowest-winpercent candy
    SELECT competitorname,winpercent
    FROM candy_ranking 
    ORDER BY  winpercent ASC 
    LIMIT 1;  
    
    #Find the average pricepercent
    SELECT AVG(pricepercent) AS avg_pricepercent FROM candy_ranking;
    
   # Comparison and Filtering
   #Find candies winpercent in the top 10
   SELECT competitorname,winpercent
   FROM candy_ranking
   ORDER BY  winpercent DESC 
   LIMIT 10;
   
   #Find candies with winpercent between 50 and 100
   SELECT competitorname,winpercent
   FROM candy_ranking 
   WHERE winpercent BETWEEN 50 AND 100 
   ORDER BY winpercent DESC;  
   
   # Category-Based Analysis
   #dataset includes columns like chocolate, sugar_percent, etc., you can analyze them
   #Count how many candies contain chocolate

SELECT COUNT(*) AS total_chocolate_candies 
FROM candy_ranking 
WHERE chocolate = 1;

 #Find the highest-pricepercent chocolate candy 
 SELECT competitorname , pricepercent
 FROM candy_ranking 
 WHERE chocolate = 1 
 ORDER BY pricepercent DESC 
 LIMIT 1;
 
 #Compare the average pricepercent of chocolate vs. non-chocolate candies
 SELECT chocolate, AVG(pricepercent) AS avg_pricepercent 
 FROM candy_ranking 
 GROUP BY chocolate; 
 
#Find the most common winpercent:

SELECT winpercent, COUNT(*) AS count  
FROM candy_ranking 
GROUP BY winpercent ORDER BY count DESC LIMIT 1;
   
#Identify candies that have winpercent similar to a specific candy
SELECT competitorname, winpercent   
FROM candy_ranking 
WHERE ABS(winpercent - (SELECT winpercent FROM candy_ranking WHERE competitorname = 'Sugar Babies')) < 5;

 #Find candies with sugar content above average
SELECT competitorname , sugarpercent, winpercent 
FROM candy_ranking 
WHERE sugarpercent > (SELECT AVG(sugarpercent) FROM candy_ranking) 
ORDER BY sugarpercent DESC;

 #Find the Most Expensive and Cheapest Candy
SELECT competitorname, pricepercent  
FROM candy_ranking  
ORDER BY pricepercent DESC  
LIMIT 1;  -- Most expensive  

SELECT competitorname, pricepercent 
FROM candy_ranking 
ORDER BY pricepercent ASC  
LIMIT 1;  -- Cheapest   

#Find candies that contain chocolate, are sugary, and have high win percentages:

SELECT competitorname, winpercent, chocolate, sugarpercent  
FROM candy_ranking  
WHERE chocolate = 1 AND sugarpercent > 0.6  
ORDER BY winpercent DESC  
LIMIT 10;


    
    
  
  
    
    

     
     
     
     
     
     
     