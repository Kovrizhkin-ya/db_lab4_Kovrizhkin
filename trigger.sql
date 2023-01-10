-- Тригер який при додавані нової країни, переводить її назву у верхній регістр.
DROP TRIGGER IF EXISTS trig ON country;
CREATE OR REPLACE FUNCTION upper_country_name() RETURNS TRIGGER AS
$$
    BEGIN
        UPDATE country
        SET country_name = UPPER(country_name)
        WHERE country.country_id = new.country_id;
    RETURN NEW;
    END;
$$
LANGUAGE 'plpgsql';
CREATE TRIGGER trig
AFTER INSERT ON country
FOR EACH ROW EXECUTE FUNCTION upper_country_name();