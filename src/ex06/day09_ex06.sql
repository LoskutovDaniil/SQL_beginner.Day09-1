CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
															 	pprice numeric default 500,
															 	pdate date default '2022-01-08')
RETURNS TABLE(name varchar) AS
$$
BEGIN
	RETURN QUERY
	SELECT pizzeria.name
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	JOIN person ON person.id = person_visits.person_id
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	WHERE menu.price < pprice
	AND person_visits.visit_date = pdate
	AND person.name = pperson;
END;
$$
LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

