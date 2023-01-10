-- Процедура яка виводить населення країни за введеним роком.
DROP PROCEDURE IF EXISTS get_country_population(varchar(50), integer);
CREATE OR REPLACE PROCEDURE get_country_population(country_code_arg varchar(50), p_year integer)
LANGUAGE 'plpgsql'
AS $$
DECLARE record_country country.country_name%TYPE;
DECLARE record_population population.population%TYPE;

BEGIN
	SELECT country_name, population into record_country, record_population FROM country
	INNER JOIN population ON country.country_id = population.country_id
	WHERE country_code = country_code_arg AND population_year = p_year;
    RAISE INFO 'Country_name: %,  Country_population: %', TRIM(record_country), record_population;
END;
$$;