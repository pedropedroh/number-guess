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
    user_id integer,
    secret_number integer DEFAULT 0 NOT NULL,
    number_of_guesses integer DEFAULT 0 NOT NULL
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

INSERT INTO public.games VALUES (1, 9, 469, 9);
INSERT INTO public.games VALUES (2, 10, 167, 168);
INSERT INTO public.games VALUES (3, 10, 799, 800);
INSERT INTO public.games VALUES (4, 11, 64, 65);
INSERT INTO public.games VALUES (5, 11, 504, 505);
INSERT INTO public.games VALUES (6, 10, 951, 954);
INSERT INTO public.games VALUES (7, 10, 790, 792);
INSERT INTO public.games VALUES (8, 10, 894, 895);
INSERT INTO public.games VALUES (9, 12, 820, 821);
INSERT INTO public.games VALUES (10, 12, 60, 61);
INSERT INTO public.games VALUES (11, 13, 620, 621);
INSERT INTO public.games VALUES (12, 13, 189, 190);
INSERT INTO public.games VALUES (13, 12, 79, 82);
INSERT INTO public.games VALUES (14, 12, 442, 444);
INSERT INTO public.games VALUES (15, 12, 594, 595);
INSERT INTO public.games VALUES (16, 14, 699, 700);
INSERT INTO public.games VALUES (17, 14, 605, 606);
INSERT INTO public.games VALUES (18, 15, 350, 351);
INSERT INTO public.games VALUES (19, 15, 699, 700);
INSERT INTO public.games VALUES (20, 14, 27, 30);
INSERT INTO public.games VALUES (21, 14, 139, 141);
INSERT INTO public.games VALUES (22, 14, 212, 213);
INSERT INTO public.games VALUES (23, 16, 705, 706);
INSERT INTO public.games VALUES (24, 16, 80, 81);
INSERT INTO public.games VALUES (25, 17, 840, 841);
INSERT INTO public.games VALUES (26, 17, 107, 108);
INSERT INTO public.games VALUES (27, 16, 494, 497);
INSERT INTO public.games VALUES (28, 16, 56, 58);
INSERT INTO public.games VALUES (29, 16, 338, 339);
INSERT INTO public.games VALUES (30, 18, 827, 828);
INSERT INTO public.games VALUES (31, 18, 522, 523);
INSERT INTO public.games VALUES (32, 19, 659, 660);
INSERT INTO public.games VALUES (33, 19, 673, 674);
INSERT INTO public.games VALUES (34, 18, 625, 628);
INSERT INTO public.games VALUES (35, 18, 925, 927);
INSERT INTO public.games VALUES (36, 18, 764, 765);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Pedroca');
INSERT INTO public.users VALUES (2, 'Miriam');
INSERT INTO public.users VALUES (3, 'Maiara');
INSERT INTO public.users VALUES (4, 'Antonio');
INSERT INTO public.users VALUES (5, 'Maria');
INSERT INTO public.users VALUES (6, 'Beatriz');
INSERT INTO public.users VALUES (7, 'Teste');
INSERT INTO public.users VALUES (8, 'Moroam');
INSERT INTO public.users VALUES (9, 'Popo');
INSERT INTO public.users VALUES (10, 'user_1726672332687');
INSERT INTO public.users VALUES (11, 'user_1726672332686');
INSERT INTO public.users VALUES (12, 'user_1726672339744');
INSERT INTO public.users VALUES (13, 'user_1726672339743');
INSERT INTO public.users VALUES (14, 'user_1726672341873');
INSERT INTO public.users VALUES (15, 'user_1726672341872');
INSERT INTO public.users VALUES (16, 'user_1726673120061');
INSERT INTO public.users VALUES (17, 'user_1726673120060');
INSERT INTO public.users VALUES (18, 'user_1726673389798');
INSERT INTO public.users VALUES (19, 'user_1726673389797');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

