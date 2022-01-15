/*  Africa energy statistics Data Exploration 
Skills used:  joins, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/
SELECT 
    RegionName, IndicatorName, date, Value
FROM
    portfolio.`african-reg-eng-stat`
GROUP BY 2;
    
    /*join the indicator table to show the indicator name */
    
SELECT 
    Indicator.Indicator_Name,
    indicator.Indicator,
    RegionName,
    Value,
    YEAR(date)
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator;
    
    /*showing the total value through years 2000 to 2014 per country */
    
    
SELECT 
    RegionName,
    indicator.Indicator_Name,
    SUM(Value) AS total,
    YEAR(date)
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator
WHERE
    NOT Region = 1
GROUP BY 2 , 1;
    
 
    
    
    /* showing energy stat for Sudan  */
    
    
SELECT 
    RegionName, indicator.Indicator_Name, SUM(Value) AS total
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator
WHERE
    RegionName = 'Sudan'
GROUP BY 2;
    
    
    
    /*  lets see stat of Production of electricity from solar, wind, tide, wave and other sources, GWh for all african contries */

    
SELECT 
    indicator.Indicator_Name,
    regionname,
    SUM(Value) AS total_energy
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator
WHERE
    indicatorname = 'Production of electricity from solar, wind, tide, wave and other sources, GWh'
GROUP BY 2
ORDER BY 3 DESC;


/* breaking down by regions west africa */
SELECT 
    RegionName,
    indicator.Indicator_Name,
    SUM(Value) AS total,
    YEAR(date)
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator
WHERE
     Region = 105
GROUP BY 2 , 1
order by 3 desc;



/*    Creating View to store data for later visualizations  */

create view africatotalenergy as
SELECT 
    RegionName,
    indicator.Indicator_Name,
    SUM(Value) AS total,
    YEAR(date)
FROM
    portfolio.`african-reg-eng-stat`
        JOIN
    indicator ON portfolio.`african-reg-eng-stat`.Indicator = indicator.Indicator
WHERE
    NOT Region = 1
GROUP BY 2 , 1;
    

    