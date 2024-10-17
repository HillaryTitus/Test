use shamzy;
select * from covid_data;

#  Global Total Cases and Deaths
SELECT 
    SUM(total_cases) AS total_global_cases,
    SUM(total_deaths) AS total_global_deaths
FROM covid_data;

# Top Continents by Total Cases
SELECT 
    continent,
    MAX(total_cases) AS total_cases
FROM covid_data
GROUP BY continent
ORDER BY total_cases DESC
LIMIT 10;

#  Continent with Highest Death Rates
SELECT 
    continent,
    MAX(total_deaths) / MAX(total_cases) * 100 AS death_rate_percentage
FROM covid_data
GROUP BY continent
ORDER BY death_rate_percentage DESC
LIMIT 10;

# Vaccination Coverage Analysis
SELECT 
    continent,
    MAX(total_vaccinations) AS vaccination_rate
FROM covid_data
GROUP BY continent
ORDER BY vaccination_rate DESC
LIMIT 10;

#  Daily Case Trends by Country
SELECT 
    date,
    SUM(new_cases) AS total_daily_cases
FROM covid_data
WHERE location = 'Afghanistan'
GROUP BY date
ORDER BY date;

# Identifying Peak Case Days
SELECT 
    date,
    country,
    MAX(new_cases) AS peak_cases
FROM covid_data
GROUP BY date, location
ORDER BY peak_cases DESC
LIMIT 10;
 
 