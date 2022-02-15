create table sw_planets
(
    id            serial
        constraint sw_planets_pk
            primary key,
    name          text,
    diameter      integer,
    climate       text,
    terrain       text,
    surface_water integer,
    population    integer
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

create table residents
(
    name       text,
    height     integer,
    mass       integer,
    hair_color text,
    skin_color text,
    eye_color  text,
    birth_year integer,
    gender     text,
    id         serial
        constraint residents_pk
            primary key
);

alter table residents
    owner to postgres;

create unique index residents_id_uindex
    on residents (id);

alter table residents
    add name text;

alter table residents
    add height integer;

alter table residents
    add mass integer;

alter table residents
    add hair_color text;

alter table residents
    add skin_color text;

alter table residents
    add eye_color text;

alter table residents
    add birth_year integer;

alter table residents
    add gender text;

alter table residents
    add id serial;

INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Wicket Systri Warrick', 88, 20, 'brown', 'brown', 'brown', '8BBY', 'male', 30, 'Endor');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Taun We', 213, 0, 'none', 'grey', 'black', 'unknown', 'female', 73, 'Kamino');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Shmi Skywalker', 163, 0, 'black', 'fair', 'brown', '72BBY', 'female', 43, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Rugor Nass', 206, 0, 'none', 'green', 'orange', 'unknown', 'male', 38, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Roos Tarpals', 224, 82, 'none', 'grey', 'orange', 'unknown', 'male', 37, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Ric Olié', 183, 0, 'brown', 'fair', 'blue', 'unknown', 'male', 39, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Raymus Antilles', 188, 79, 'brown', 'light', 'brown', 'unknown', 'male', 81, 'Alderaan');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('R5-D4', 97, 32, 'n/a', 'white, red', 'red', 'unknown', 'n/a', 8, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('R2-D2', 96, 32, 'n/a', 'white, blue', 'red', '33BBY', 'n/a', 3, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Quarsh Panaka', 183, 0, 'black', 'dark', 'brown', '62BBY', 'male', 42, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Palpatine', 170, 75, 'grey', 'pale', 'yellow', '82BBY', 'male', 21, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Padmé Amidala', 185, 45, 'brown', 'light', 'brown', '46BBY', 'female', 35, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Owen Lars', 178, 120, 'brown, grey', 'light', 'blue', '52BBY', 'male', 6, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Luke Skywalker', 172, 77, 'blonde', 'fair', 'blue', '19BBY', 'male', 1, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Lobot', 175, 79, 'none', 'light', 'blue', '39BBY', 'male', 26, 'Bespin');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Leia Organa', 150, 49, 'brown', 'light', 'brown', '19BBY', 'female', 5, 'Alderaan');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Lama Su', 229, 88, 'none', 'grey', 'black', 'unknown', 'male', 72, 'Kamino');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Jocasta Nu', 167, 0, 'white', 'fair', 'blue', 'unknown', 'female', 74, 'Coruscant');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Jar Jar Binks', 196, 66, 'none', 'orange', 'orange', '52BBY', 'male', 36, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Gregar Typho', 185, 85, 'black', 'dark', 'brown', 'unknown', 'male', 60, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Finis Valorum', 170, 0, 'blonde', 'fair', 'blue', '91BBY', 'male', 34, 'Coruscant');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Dormé', 165, 0, 'brown', 'light', 'brown', 'unknown', 'female', 66, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Darth Vader', 202, 136, 'none', 'white', 'yellow', '41.9BBY', 'male', 4, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Cordé', 157, 0, 'brown', 'light', 'brown', 'unknown', 'female', 61, 'Naboo');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Cliegg Lars', 183, 0, 'brown', 'fair', 'blue', '82BBY', 'male', 62, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('C-3PO', 167, 75, 'n/a', 'gold', 'yellow', '112BBY', 'n/a', 2, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Boba Fett', 183, 78, 'black', 'fair', 'brown', '31.5BBY', 'male', 22, 'Kamino');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Biggs Darklighter', 183, 84, 'black', 'light', 'brown', '24BBY', 'male', 9, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Beru Whitesun Lars', 165, 75, 'brown', 'light', 'blue', '47BBY', 'female', 7, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Bail Prestor Organa', 191, 0, 'black', 'tan', 'brown', '67BBY', 'male', 68, 'Alderaan');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Anakin Skywalker', 188, 84, 'blonde', 'fair', 'blue', '41.9BBY', 'male', 11, 'Tatooine');
INSERT INTO public.residents (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, id,
                              home_planet)
VALUES ('Adi Gallia', 184, 50, 'none', 'dark', 'blue', 'unknown', 'female', 55, 'Coruscant');

create table api_users
(
    id       serial
        constraint api_users_pk
            primary key,
    username varchar not null,
    password varchar not null
);

alter table api_users
    owner to postgres;

create unique index api_users_id_uindex
    on api_users (id);

create unique index api_users_username_uindex
    on api_users (username);


create table planet_votes
(
    id              integer default nextval('"planet-votes_id_seq"'::regclass) not null
        constraint "planet-votes_pk"
            primary key,
    planet_id       integer,
    planet_name     varchar,
    user_id         integer,
    submission_time timestamp
);

