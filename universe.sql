--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    comet_type character varying(50) NOT NULL,
    description text,
    perihelion_distance numeric(10,5) NOT NULL,
    aphelion_distance numeric(10,5) NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    distance_from_earth integer,
    age_in_million_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean,
    moon_type character varying(50) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_type character varying(50) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    description text,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(50) NOT NULL,
    description text,
    mass_solar_masses numeric(10,5),
    luminosity_solar_units numeric(10,5),
    distance_from_earth integer,
    age_in_milions_of_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Periodic', 'Famous periodic comet visible every 75-76 years.', 0.58600, 35.08000, 75.32, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Non-periodic', 'One of the brightest comets seen in recent decades.', 0.91400, 370.80000, 2533.00, 1);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 'Non-periodic', 'Known for its close approach to Earth in 1996.', 0.23000, 471.00000, 17000.00, 1);
INSERT INTO public.comet VALUES (4, 'Encke', 'Periodic', 'Comet with one of the shortest known orbital periods.', 0.33900, 4.09000, 3.30, 1);
INSERT INTO public.comet VALUES (5, 'Swift-Tuttle', 'Periodic', 'Source of the Perseid meteor shower.', 0.95950, 51.20000, 133.28, 1);
INSERT INTO public.comet VALUES (6, 'Tempel-Tuttle', 'Periodic', 'Source of the Leonid meteor shower.', 0.97700, 19.60000, 33.20, 1);
INSERT INTO public.comet VALUES (7, 'Biela', 'Periodic', 'Comet that split into two pieces in the 19th century.', 0.86000, 6.50000, 6.60, 1);
INSERT INTO public.comet VALUES (8, 'Borrelly', 'Periodic', 'Visited by the Deep Space 1 spacecraft.', 1.35000, 5.86000, 6.90, 1);
INSERT INTO public.comet VALUES (9, 'Crommelin', 'Periodic', 'Comet with a highly elliptical orbit.', 0.74300, 17.92000, 27.40, 1);
INSERT INTO public.comet VALUES (10, 'Ikeya-Seki', 'Sungrazing', 'One of the brightest comets of the 20th century.', 0.00780, 165.30000, 880.00, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy.', 0, 13500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy.', 2537000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Part of the Local Group.', 3000000, 10000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Interacting with NGC 5195.', 23000000, 400);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'Large bulge and prominent dust lane.', 29000000, 900);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 'Located in Ursa Major.', 21000000, 14000);
INSERT INTO public.galaxy VALUES (7, 'Sunflower', 'Spiral', 'Known for its bright core.', 27000000, 500);
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 'Lenticular', 'Result of a galactic collision.', 500000000, 10000);
INSERT INTO public.galaxy VALUES (9, 'Cigar', 'Starburst', 'High star formation rate.', 12000000, 10000);
INSERT INTO public.galaxy VALUES (10, 'Black Eye', 'Spiral', 'Dark band of absorbing dust.', 17000000, 6000);
INSERT INTO public.galaxy VALUES (11, 'Circinus', 'Spiral', 'Contains a Seyfert nucleus.', 13000000, 10000);
INSERT INTO public.galaxy VALUES (12, 'Bodes Galaxy', 'Spiral', 'Part of a pair of interacting galaxies.', 12000000, 700);
INSERT INTO public.galaxy VALUES (13, 'Hoags Object', 'Ring', 'Rare type of galaxy.', 600000000, 10000);
INSERT INTO public.galaxy VALUES (14, 'Antennae', 'Interacting', 'Two colliding galaxies.', 45000000, 1200);
INSERT INTO public.galaxy VALUES (15, 'Tadpole', 'Spiral', 'Distorted by a galactic collision.', 420000000, 10000);
INSERT INTO public.galaxy VALUES (16, 'Messier 81', 'Spiral', 'Brightest galaxy in Ursa Major.', 12000000, 11000);
INSERT INTO public.galaxy VALUES (17, 'Messier 82', 'Starburst', 'Undergoing starburst activity.', 12000000, 10000);
INSERT INTO public.galaxy VALUES (18, 'Centaurus A', 'Lenticular', 'C ontains a supermassive black hole.', 12000000, 16000);
INSERT INTO public.galaxy VALUES (19, 'Messier 87', 'Elliptical', 'Home to a supermassive black hole.', 53000000, 15000);
INSERT INTO public.galaxy VALUES (20, 'NGC 1300', 'Barred Spir al', 'Located in Eridanus.', 61000000, 11000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 'Terrestrial', 384400, 4500, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 'Terrestrial', 9376, 4500, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 'Terrestrial', 23463, 4500, 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 'Volcanic', 628, 4500, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 'Icy', 671, 4500, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 'Icy', 1070, 4500, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 'Icy', 1883, 4500, 5);
INSERT INTO public.moon VALUES (8, 'Titan', true, 'Icy', 1222, 4500, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 'Icy', 238, 4500, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, 'Icy', 186, 4500, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', true, 'Icy', 295, 4500, 6);
INSERT INTO public.moon VALUES (12, 'Dione', true, 'Icy', 377, 4500, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', true, 'Icy', 527, 4500, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, 'Icy', 3561, 4500, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', true, 'Icy', 129390, 4500, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', true, 'Icy', 190900, 4500, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', true, 'Icy', 266000, 4500, 7);
INSERT INTO public.moon VALUES (18, 'Moon18', true, 'Icy', 0, 1000, 8);
INSERT INTO public.moon VALUES (19, 'Moon19', true, 'Icy', 0, 1000, 8);
INSERT INTO public.moon VALUES (20, 'Moon20', true, 'Icy', 0, 1000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', true, false, 'Closest planet to the Sun.', 77, 4500, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', true, false, 'Second planet from the Sun.', 261, 4500, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, true, 'Our home planet.', 0, 4500, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', true, false, 'Known as the Red Planet.', 225, 4500, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', true, false, 'Largest planet in our Solar System.', 628, 4500, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', true, false, 'Known for its ring system.', 1275, 4500, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', true, false, 'Has a unique side rotation.', 2724, 4500, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', true, false, 'Furthest planet from the Sun.', 4351, 4500, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Terrestrial', true, false, 'Closest exoplanet to the Solar System.', 4, 4500, 2);
INSERT INTO public.planet VALUES (10, 'Sirius b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Sirius.', 9, 4500, 3);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 'Terrestrial', true, false, 'Exoplanet orbiting Alpha Centauri B.', 4, 4500, 5);
INSERT INTO public.planet VALUES (12, 'Barnards Star b', 'Super-Earth', true, false, 'Exoplanet orbiting Barnards Star.', 6, 7000, 6);
INSERT INTO public.planet VALUES (13, 'Wolf 359 b', 'Super-Earth', true, false, 'Exoplanet orbiting Wolf 359.', 8, 6000, 7);
INSERT INTO public.planet VALUES (14, 'Luyten b', 'Super-Earth', true, false, 'Exoplanet orbiting Luyten 726-8.', 9, 7000, 8);
INSERT INTO public.planet VALUES (15, 'Vega b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Vega.', 25, 4500, 11);
INSERT INTO public.planet VALUES (16, 'Altair b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Altair.', 17, 4500, 12);
INSERT INTO public.planet VALUES (17, 'Betelgeuse b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Betelgeuse.', 643, 4500, 13);
INSERT INTO public.planet VALUES (18, 'Rigel b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Rigel.', 860, 4500, 14);
INSERT INTO public.planet VALUES (19, 'Deneb b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Deneb.', 2615, 4500, 15);
INSERT INTO public.planet VALUES (20, 'Canopus b', 'Gas Giant', true, false, 'Hypothetical exoplanet orbiting Canopus.', 310, 4500, 16);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 'The star at the center of our solar system.', 1.00000, 1.00000, 0, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-Type', 'Closest known star to the Sun.', 0.12000, 0.00170, 4, 4850, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-Type', 'Brightest star in the night sky.', 2.02000, 25.40000, 9, 242, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'G-Type', 'Closest star system to the Solar System.', 1.10000, 1.51900, 4, 4850, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 'K-Type', 'Part of the closest star system to the Solar System.', 0.90700, 0.44500, 4, 4850, 1);
INSERT INTO public.star VALUES (6, 'Barnards Star', 'M-Type', 'Second closest star system.', 0.14400, 0.00350, 6, 10000, 1);
INSERT INTO public.star VALUES (7, 'Wolf 359', 'M-Type', 'One of the faintest stars visible.', 0.09000, 0.00100, 8, 100, 1);
INSERT INTO public.star VALUES (8, 'Luyten 726-8', 'M-Type', 'Binary star system.', 0.10200, 0.00120, 9, 4200, 1);
INSERT INTO public.star VALUES (9, 'Sirius B', 'White Dwarf', 'Companion of Sirius A.', 0.97800, 0.05600, 9, 228, 1);
INSERT INTO public.star VALUES (10, 'Epsilon Eridani', 'K-Type', 'Third closest individual star visible to the naked eye.', 0.82000, 0.34000, 11, 800, 1);
INSERT INTO public.star VALUES (11, 'Vega', 'A-Type', 'One of the most luminous stars in the vicinity of the Sun.', 2.10000, 40.12000, 25, 455, 1);
INSERT INTO public.star VALUES (12, 'Altair', 'A-Type', 'Brightest star in the constellation of Aquila.', 1.79000, 10.60000, 17, 1200, 1);
INSERT INTO public.star VALUES (13, 'Betelgeuse', 'M-Type', 'One of the largest stars visible to the naked eye.', 18.00000, 99999.99999, 643, 8000, 1);
INSERT INTO public.star VALUES (14, 'Rigel', 'B-Type', 'Brightest star in the constellation Orion.', 21.00000, 99999.99999, 860, 8000, 1);
INSERT INTO public.star VALUES (15, 'Deneb', 'A-Type', 'One of the largest white stars known.', 19.00000, 99999.99999, 2615, 10000, 1);
INSERT INTO public.star VALUES (16, 'Canopus', 'A-Type', 'Second brightest star in the night sky.', 8.74000, 99999.99999, 310, 10000, 1);
INSERT INTO public.star VALUES (17, 'Arcturus', 'K-Type', 'Brightest star in the constellation of Bootes.', 1.08000, 170.00000, 37, 7100, 1);
INSERT INTO public.star VALUES (18, 'Capella', 'G-Type', 'Brightest star in the constellation Auriga.', 2.70000, 78.70000, 42, 7000, 1);
INSERT INTO public.star VALUES (19, 'Spica', 'B-Type', 'Brightest star in the constellation Virgo.', 11.43000, 2000.00000, 262, 12500, 1);
INSERT INTO public.star VALUES (20, 'Antares', 'M-Type', 'Heart of the Scorpion.', 15.50000, 99999.99999, 553, 12000, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_2_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_2_name UNIQUE (name);


--
-- Name: comet unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet fk__star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk__star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

