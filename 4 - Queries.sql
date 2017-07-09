-- oldest crew member
SELECT * FROM crew_members ORDER BY birth_date ASC LIMIT 1

-- second oldest
SELECT * FROM (SELECT * FROM crew_members ORDER BY birth_date ASC LIMIT 2) AS two ORDER BY birth_date DESC LIMIT 1

-- fifth oldest
SELECT * FROM (SELECT * FROM crew_members ORDER BY birth_date ASC LIMIT 5) AS five ORDER BY birth_date DESC LIMIT 1

-- most experienced
SELECT
			CM.first_name, CM.last_name, COUNT(CM.crew_member_id) AS nb_aircrafts
FROM
			crew_members CM
       		INNER JOIN
        	aircraft_crew_member ACM
            ON CM.crew_member_id = ACM.crew_member_id
GROUP BY
			CM.crew_member_id
ORDER BY
			nb_aircrafts DESC
LIMIT 1

-- least experienced - zero included
SELECT
			CM.first_name, CM.last_name, COUNT(ACM.crew_member_id) AS nb_aircrafts
FROM
			crew_members CM
       		LEFT OUTER JOIN
        	aircraft_crew_member ACM
            ON CM.crew_member_id = ACM.crew_member_id
GROUP BY
			CM.crew_member_id
ORDER BY
			nb_aircrafts ASC
LIMIT 1