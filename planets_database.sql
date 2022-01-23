create table sw_planets
(
    id              serial
        constraint sw_planets_pk
            primary key,
    name            text,
    diameter        integer,
    climate         text,
    terrain         text,
    surface_water integer,
    population      integer
);

alter table sw_planets
    owner to postgres;

alter table sw_planets
    add id serial;

alter table sw_planets
    add name text;

alter table sw_planets
    add diameter integer;

alter table sw_planets
    add climate text;

alter table sw_planets
    add terrain text;

alter table sw_planets
    add surface_water integer;

alter table sw_planets
    add population integer;

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (1, 'Tatooine', 10465, 'arid', 'desert', 1, 200000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (2, 'Alderaan', 12500, 'temperate', 'grasslands, mountains', 40, 2000000000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (3, 'Yavin IV', 10200, 'temperate, tropical', 'jungle, rainforests', 8, 1000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (4, 'Hoth', 7200, 'frozen', 'tundra, ice caves, mountain ranges', 100, 0);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (5, 'Dagobah', 8900, 'murky', 'swamp, jungles', 8, 0);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (6, 'Bespin', 118000, 'temperate', 'gas giant', 0, 6000000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (7, 'Endor', 4900, 'temperate', 'forests, mountains, lakes', 8, 30000000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (8, 'Naboo', 12120, 'temperate', 'grassy hills, swamps, forests, mountains', 12, 1000000000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (9, 'Coruscant', 12240, 'temperate', 'cityscape, mountains', 2, 1000000000);

INSERT INTO public.sw_planets (id, name, diameter, climate, terrain, surface_water, population)
VALUES (10, 'Kamino', 19720, 'temperate', 'ocean', 100, 1000000000);
