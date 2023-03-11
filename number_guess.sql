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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(40) NOT NULL,
    count integer NOT NULL,
    best integer DEFAULT 1000
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1678541302509', 2, 31);
INSERT INTO public.users VALUES ('user_1678541302510', 5, 19);
INSERT INTO public.users VALUES ('user_1678541174776', 2, 12);
INSERT INTO public.users VALUES ('user_1678541174777', 5, 34);
INSERT INTO public.users VALUES ('user_1678541322582', 2, 39);
INSERT INTO public.users VALUES ('user_1678541322583', 5, 15);
INSERT INTO public.users VALUES ('user_1678541199184', 2, 61);
INSERT INTO public.users VALUES ('user_1678541199186', 5, 29);
INSERT INTO public.users VALUES ('user_1678541207801', 2, 9);
INSERT INTO public.users VALUES ('user_1678541207802', 5, 8);
INSERT INTO public.users VALUES ('user_1678541234588', 2, 55);
INSERT INTO public.users VALUES ('user_1678541234589', 5, 18);
INSERT INTO public.users VALUES ('user_1678541249015', 2, 41);
INSERT INTO public.users VALUES ('user_1678541249016', 5, 28);
INSERT INTO public.users VALUES ('user_1678541255560', 2, 38);
INSERT INTO public.users VALUES ('user_1678541255561', 5, 30);


--
-- Name: users username_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

