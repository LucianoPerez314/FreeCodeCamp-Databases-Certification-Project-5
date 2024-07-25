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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    num_moves integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (5, 1, 11);
INSERT INTO public.games VALUES (6, 1, 11);
INSERT INTO public.games VALUES (7, 1, 11);
INSERT INTO public.games VALUES (8, 3, 11);
INSERT INTO public.games VALUES (9, 468, 12);
INSERT INTO public.games VALUES (10, 578, 12);
INSERT INTO public.games VALUES (11, 44, 13);
INSERT INTO public.games VALUES (12, 152, 13);
INSERT INTO public.games VALUES (13, 807, 12);
INSERT INTO public.games VALUES (14, 974, 12);
INSERT INTO public.games VALUES (15, 989, 12);
INSERT INTO public.games VALUES (16, 890, 14);
INSERT INTO public.games VALUES (17, 763, 14);
INSERT INTO public.games VALUES (18, 881, 15);
INSERT INTO public.games VALUES (19, 226, 15);
INSERT INTO public.games VALUES (20, 333, 14);
INSERT INTO public.games VALUES (21, 57, 14);
INSERT INTO public.games VALUES (22, 935, 14);
INSERT INTO public.games VALUES (23, 532, 16);
INSERT INTO public.games VALUES (24, 774, 16);
INSERT INTO public.games VALUES (25, 45, 17);
INSERT INTO public.games VALUES (26, 673, 17);
INSERT INTO public.games VALUES (27, 93, 16);
INSERT INTO public.games VALUES (28, 341, 16);
INSERT INTO public.games VALUES (29, 343, 16);
INSERT INTO public.games VALUES (30, 10, 11);
INSERT INTO public.games VALUES (31, 449, 18);
INSERT INTO public.games VALUES (32, 357, 18);
INSERT INTO public.games VALUES (33, 986, 19);
INSERT INTO public.games VALUES (34, 114, 19);
INSERT INTO public.games VALUES (35, 733, 18);
INSERT INTO public.games VALUES (36, 359, 18);
INSERT INTO public.games VALUES (37, 577, 18);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (11, 'Lucky');
INSERT INTO public.users VALUES (12, 'user_1721941266409');
INSERT INTO public.users VALUES (13, 'user_1721941266408');
INSERT INTO public.users VALUES (14, 'user_1721941293437');
INSERT INTO public.users VALUES (15, 'user_1721941293436');
INSERT INTO public.users VALUES (16, 'user_1721941378833');
INSERT INTO public.users VALUES (17, 'user_1721941378832');
INSERT INTO public.users VALUES (18, 'user_1721941498232');
INSERT INTO public.users VALUES (19, 'user_1721941498231');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 37, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

