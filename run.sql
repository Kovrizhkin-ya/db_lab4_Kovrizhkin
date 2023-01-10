--Виклик функції
SELECT get_country_water_surface_area(); 

--Виклик процедури
CALL get_country_population('USA', '2021');

--Виклик тригеру
INSERT INTO country(country_id, country_name, country_code, country_area, country_land_area_km)
VALUES('5', 'Japan', 'JPN', '377930', '364500');
SELECT * FROM country;