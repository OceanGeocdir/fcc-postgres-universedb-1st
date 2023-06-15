--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth numeric NOT NULL,
    description text,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    distance_from_planet numeric NOT NULL,
    is_inhabited boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    distance_from_star numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 'Orion', 'Prominent', 2, 2, 3, 5);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Northern', 4, 3, 2, 5);
INSERT INTO public.constellation VALUES (4, 'Pegasus', 'Winged', 3, 4, 6, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2.537, 'Nearest major galaxy to Milky Way.', true);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Spiral', 31.13, 'Interacting spiral galaxy.', false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Elliptical', 29.32, 'Notable for dust land and bright nucleus.', true);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Spiral', 21.38, 'Face-on spiral galaxy in Ursa Major.', true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 11.06, 'Prominent galaxy in Centaurus.', false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Ring', 24.5, 'Characterized by a dark band of dust.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 2, 384.4, false, 4500, 'Satellite', true);
INSERT INTO public.moon VALUES (5, 'Phobos', 2, 9.377, false, 4500, 'Irregular', false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 1.070, false, 4500, 'Largest', true);
INSERT INTO public.moon VALUES (7, 'Titan', 5, 1.221, false, 4500, 'Largest', true);
INSERT INTO public.moon VALUES (8, 'Triton', 6, 354.8, false, 4500, 'Retrograde', true);
INSERT INTO public.moon VALUES (9, 'Mir', 5, 129.9, false, 4500, 'Sub', true);
INSERT INTO public.moon VALUES (10, 'Cal', 3, 1.882, false, 4500, 'Cre', true);
INSERT INTO public.moon VALUES (11, 'Eur', 3, 670, false, 4500, 'Subsur', true);
INSERT INTO public.moon VALUES (12, 'Io', 3, 421, false, 4500, 'Vol', true);
INSERT INTO public.moon VALUES (13, 'End', 4, 238, false, 4500, 'Active', true);
INSERT INTO public.moon VALUES (14, 'Rhea', 4, 527, false, 4500, 'Create', true);
INSERT INTO public.moon VALUES (15, 'Charon', 8, 17.333, false, 4500, 'Largest', true);
INSERT INTO public.moon VALUES (22, 'Nereid', 7, 5.5513, false, 4500, 'Third-largest', true);
INSERT INTO public.moon VALUES (23, 'Obe', 9, 584.9, false, 4500, 'Out', true);
INSERT INTO public.moon VALUES (24, 'Titn', 9, 435.9, false, 4500, 'Largest', true);
INSERT INTO public.moon VALUES (25, 'Ariel', 9, 584.9, false, 4500, 'Major', true);
INSERT INTO public.moon VALUES (26, 'Dione', 4, 377.4, false, 4500, 'Fourth-largest', true);
INSERT INTO public.moon VALUES (27, 'Hyperion', 4, 1.481, false, 4500, 'Irregular', true);
INSERT INTO public.moon VALUES (28, 'Proteus', 7, 117.6, false, 4500, 'Second-largest', true);
INSERT INTO public.moon VALUES (29, 'Tethys', 4, 294.7, false, 4500, 'Fifth', true);
INSERT INTO public.moon VALUES (30, 'Toii', 5, 298, false, 4500, 'Mekni', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1, 'Terrestrial', 149.6, true, 'Home to life forms.', true);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 'Terrestrial', 227.9, true, 'Red planet for exploration.', true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 'Gas Giant', 1.429, true, 'Largest gas giant planet.', false);
INSERT INTO public.planet VALUES (5, 'Saturn', 4, 'Gas Giant', 1.429, true, 'Ringed gas giant planet.', false);
INSERT INTO public.planet VALUES (6, 'Neptune', 6, 'Ice Giant', 4.4498, true, 'Distant Ice Planet.', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 'Ice Giant', 2.871, true, 'Tilted ice giant planet.', false);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 'Terrestrial', 57.9, true, 'Closest to Sun.', true);
INSERT INTO public.planet VALUES (9, 'Venus', 1, 'Terrestrial', 108.2, true, 'Hot dense planet.', true);
INSERT INTO public.planet VALUES (10, 'Pluto', 3, 'Dwarf', 5.906, true, 'Outer dwarf planet.', true);
INSERT INTO public.planet VALUES (11, 'Eris', 3, 'Dwarf', 67.7, true, 'Large dwarf planet.', true);
INSERT INTO public.planet VALUES (12, 'Makemake', 3, 'Dwarf', 45.8, true, 'Kuiper Belt dwarf.', true);
INSERT INTO public.planet VALUES (13, 'Haumea', 3, 'Dwarf', 43.3, true, 'Elongated dwarf.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 'Star at the center of the Solar System.', false, true);
INSERT INTO public.star VALUES (2, 'Polaris', 1, 70, 'Brightest star in Ursa Minor.', false, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 200, 'Brightest star in Canis Major.', false, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 5, 6000, 'Closest star system to the Solar System.', false, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 800, 'Red supergiant star in Orion.', false, false);
INSERT INTO public.star VALUES (6, 'Antares', 6, 600, 'Red supergiant star in Scorpius.', false, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 61, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy pk_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pk_galaxy PRIMARY KEY (galaxy_id);


--
-- Name: moon pk_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon PRIMARY KEY (moon_id);


--
-- Name: planet pk_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pk_planet PRIMARY KEY (planet_id);


--
-- Name: star pk_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pk_star PRIMARY KEY (star_id);


--
-- Name: constellation uq_constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT uq_constellation_name UNIQUE (name);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: constellation fk_constellaion_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_constellaion_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation fk_constellation_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_constellation_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: constellation fk_constellation_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_constellation_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: constellation fk_constellation_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_constellation_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

