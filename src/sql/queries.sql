

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- What are the first 10 recorded observations? Use LIMIT;

SELECT * FROM observations
LIMIT 10;

-- MISSION 2
-- Which region identifiers (region_id) appear in the data? Use SELECT DISTINCT;

SELECT DISTINCT region_id
FROM observations;

-- MISSION 3
-- How many distinct species (species_id) have been observed combine COUNT with DISCTINCT?;

SELECT COUNT(DISTINCT species_id)
FROM observations;

-- MISSION 4
-- How many observations are there for the region with region_id = 2? use WHERE;

SELECT COUNT(*)
FROM observations
WHERE region_id = 2;

-- MISSION 5
-- How many observations were recorded on 1998-08-08? exact date using equality;

SELECT COUNT(*)
FROM observations
WHERE observation_date = '1998-08-08';


-- MISSION 6
-- Which region_id has the most observations?
-- Group by region and count how many times each appears.;

SELECT region_id, COUNT(*) AS total
FROM observations
GROUP BY region_id;
ORDER BY total DESC
LIMIT 1;


-- MISSION 7
-- What are the 5 most frequent species_id?
--Group, order by descending count, and limit the result.;

SELECT species_id, COUNT(*)
FROM observations
GROUP BY species_id
ORDER BY species_id DESC
LIMIT 5;

-- MISSION 8
-- Which species (species_id) have fewer than 5 records?
-- Group by species and use HAVING to apply a condition.;

SELECT species_id
FROM observations
GROUP BY species_id
HAVING COUNT(species_id)<5;


-- MISSION 9
-- Which observers (observer) recorded the most observations?
-- Group by observer name and count the records.;

SELECT observer
FROM observations
GROUP BY observer
HAVING COUNT();


-- MISSION 10
-- Show the region name (regions.name) for each observation.
-- Join observations with regions using region_id.;

SELECT observations.id, regions.name AS region_name
FROM observations 
JOIN regions ON observations.region_id = regions.id;

-- MISSION 11
-- Show the scientific name of each recorded species (species.scientific_name).
-- Join observations with species using species_id.;

SELECT observations.id, species.scientific_name
FROM observations
JOIN species ON observations.species_id = species.id;

-- MISSION 12
-- Which is the most observed species in each region?
-- Group by region and species, and order by count.;

SELECT regions.name AS region, species.scientific_name, COUNT(*) AS total
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY region, species.scientific_name
ORDER BY region, total DESC;
