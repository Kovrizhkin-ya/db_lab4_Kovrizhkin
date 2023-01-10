-- Функція яка виводить водну поверхню кожної країни.
DROP FUNCTION IF EXISTS get_country_water_surface_area(); 
CREATE OR REPLACE FUNCTION get_country_water_surface_area() 
    RETURNS TABLE (с_name varchar, c_wats float)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
    SELECT country_name::varchar, (country_area - country_land_area_km)::float
    FROM country;
END;
$$;
