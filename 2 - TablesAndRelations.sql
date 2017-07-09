CREATE TABLE public.aircrafts
(
    aircraft_id serial NOT NULL,
    aircraft_model character varying(100) NOT NULL,
    CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.aircrafts
    OWNER to postgres;
	

CREATE TABLE public.crew_members
(
    crew_member_id serial NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    birth_date date NOT NULL,
    CONSTRAINT crew_members_pkey PRIMARY KEY (crew_member_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.crew_members
    OWNER to postgres;
	

-- new table because of many to many relation
CREATE TABLE public.aircraft_crew_member
(
    aircraft_id integer NOT NULL,
    crew_member_id integer NOT NULL,
    CONSTRAINT fk_aircrafts_aircraft_crew_members FOREIGN KEY (aircraft_id)
        REFERENCES public.aircrafts (aircraft_id) MATCH SIMPLE,
    CONSTRAINT fk_crew_members_aircraft_crew_member FOREIGN KEY (crew_member_id)
        REFERENCES public.crew_members (crew_member_id) MATCH SIMPLE)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.aircraft_crew_member
    OWNER to postgres;