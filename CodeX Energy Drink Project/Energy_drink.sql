-- CodeX is a German beverage company that is aiming to make its mark in the Indian market. 
-- A few months ago, they launched their energy drink in 10 cities in India.
-- Their Marketing team is responsible for increasing brand awareness, market share, and product development. 
-- They conducted a survey in those 10 cities and received results from 10k respondents. 
-- Convert these survey results to meaningful insights which the team can use to drive actions.

USE energy_drink_project;
SELECT * FROM dim_repondents;

SELECT * FROM fact_survey_responses;

SELECT * FROM dim_cities;

# Who prefers energy drink more?
SELECT Gender,COUNT(Respondent_ID) AS COUNT FROM dim_repondents
GROUP BY Gender
ORDER BY COUNT DESC;

SELECT COUNT(Respondent_ID) AS COUNT FROM dim_repondents;

# Which age group prefers energy drinks more?
SELECT Age AS Age_Group,COUNT(*) AS COUNT FROM dim_repondents
GROUP BY Age
ORDER BY COUNT DESC;

# Which type of marketing reaches the most Youth (15-30)?
SELECT Marketing_channels,COUNT(*) AS COUNT FROM fact_survey_responses
INNER JOIN dim_repondents
ON fact_survey_responses.Respondent_ID=dim_repondents.Respondent_ID
WHERE AGE BETWEEN 15 AND 30
GROUP BY Marketing_channels
ORDER BY COUNT DESC;

# What are the preferred ingredients of energy drinks among respondents?
 SELECT Ingredients_expected,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Ingredients_expected
 ORDER BY COUNT DESC;
 
 # What packaging preferences do respondents have for energy drinks?
 SELECT Packaging_preference,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Packaging_preference
 ORDER BY COUNT DESC;
 
 # Who are the current market leaders?
 SELECT Current_brands,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Current_brands
 ORDER BY COUNT DESC;
 
 # What are the primary reasons consumers prefer those brands over ours?
 SELECT Reasons_for_choosing_brands,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Reasons_for_choosing_brands
 ORDER BY COUNT DESC;
 
 # Which marketing channel can be used to reach more customers?
 SELECT Marketing_channels,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Marketing_channels
 ORDER BY COUNT DESC;
 
 # What do people think about our brand? (overall rating)
 SELECT Brand_perception,COUNT(*) AS COUNT
 FROM fact_survey_responses
 GROUP BY Brand_perception
 ORDER BY COUNT DESC;
 
# Which cities do we need to focus more on?
SELECT City,COUNT(*) AS COUNT FROM dim_repondents
INNER JOIN dim_cities
ON dim_repondents.City_ID=dim_cities.City_ID
GROUP BY City
ORDER BY COUNT DESC;

# Where do respondents prefer to purchase energy drinks?
SELECT Purchase_location,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY COUNT DESC;

# What are the typical consumption situations for energy drinks among respondents?
SELECT Typical_consumption_situations,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY COUNT DESC;

# What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

SELECT Limited_edition_packaging,
COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Limited_edition_packaging
ORDER BY COUNT DESC;

SELECT Price_range,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Price_range
ORDER BY COUNT;

# Which area of business should we focus more on our product development? (Branding/taste/availability)
SELECT Taste_experience,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Taste_experience
ORDER BY COUNT DESC;

SELECT Reasons_preventing_trying,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Reasons_preventing_trying
ORDER BY COUNT DESC;

SELECT Brand_perception,COUNT(*) AS COUNT
FROM fact_survey_responses
GROUP BY Brand_perception
ORDER BY COUNT DESC;

 
 
