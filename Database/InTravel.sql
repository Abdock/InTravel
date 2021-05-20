--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

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

DROP DATABASE "InTravel";
--
-- Name: InTravel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "InTravel" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Kazakhstan.1251' LC_CTYPE = 'Russian_Kazakhstan.1251';


ALTER DATABASE "InTravel" OWNER TO postgres;

\connect "InTravel"

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    city_id integer NOT NULL,
    street character varying(100) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.address ALTER COLUMN address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    customer_id integer NOT NULL,
    guide_id integer NOT NULL,
    text text NOT NULL,
    date date DEFAULT CURRENT_DATE NOT NULL,
    files bytea
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(50) NOT NULL,
    icon_url character varying(150)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.city ALTER COLUMN city_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    name character varying NOT NULL,
    icon_url character varying(150)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.country ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.country_id_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    history_id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    date date DEFAULT CURRENT_DATE NOT NULL,
    data bytea
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.history ALTER COLUMN history_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.history_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: memories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memories (
    history_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.memories OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    review_id integer NOT NULL,
    customer_id integer NOT NULL,
    guide_id integer NOT NULL,
    grade real NOT NULL,
    comment text NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.review ALTER COLUMN review_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.review_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sight (
    sight_id integer NOT NULL,
    city_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    icon_url character varying(150) NOT NULL
);


ALTER TABLE public.sight OWNER TO postgres;

--
-- Name: sight_sight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sight ALTER COLUMN sight_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sight_sight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    registered_date date DEFAULT CURRENT_DATE NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    address_id integer,
    icon_url character varying(150),
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    phone character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (address_id, city_id, street) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'unknown');


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.city (city_id, country_id, name, icon_url) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'unknown', NULL);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.country (country_id, name, icon_url) OVERRIDING SYSTEM VALUE VALUES (1, 'unknown', NULL);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: memories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sight; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (1, '2021-05-21', 'abdog@gmail.com', 'sasung24', 1, NULL, 'Abdussattar', 'Kassymbekov', '8 707 898 98 32');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (2, '2021-05-21', 'sasung294@gmail.com', 'pass123', 1, NULL, 'Абдусаттар', 'Касымбеков', '8 776 227 7680');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (3, '2021-05-21', 'tima@gmail.com', 'pass123', 1, NULL, 'Temirlan', 'Orazkulov', '8 777 776 22 79');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (4, '2021-05-21', 'mirasS@mail.ru', 'pass123', 1, NULL, 'Miras', 'Sagatov', '8 778 245 68 77');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (5, '2021-05-21', 'esstosh@gmail.com', 'pass123', 1, NULL, 'Yestay', 'Tastanov', '8 707 575 50 70');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (6, '2021-05-21', 'Timur@gmail.com', 'pass123', 1, NULL, 'Timur', 'Merekeyev', '8 776 774 21 54');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (7, '2021-05-21', 'TimaOrazkulov@gmail.com', 'pass123', 1, NULL, 'Temirlan', 'Orazkulov', '8 747 445 12 22');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (8, '2021-05-21', 'MirasS@gmail.com', 'pass123', 1, NULL, 'Мирас', 'Сагатов', '8 702 244 54 11');
INSERT INTO public."user" (user_id, registered_date, email, password, address_id, icon_url, name, surname, phone) OVERRIDING SYSTEM VALUE VALUES (10, '0001-01-01', 'temirMuslimov@gmail.com', 'pass123', 1, NULL, 'Temirlan', 'Muslimov', '8 708 453 11 15');


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 1, true);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 1, true);


--
-- Name: country_id_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_country_id_seq', 1, true);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_history_id_seq', 1, false);


--
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_review_id_seq', 1, false);


--
-- Name: sight_sight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sight_sight_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 10, true);


--
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (address_id);


--
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (customer_id, guide_id);


--
-- Name: city city_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pk PRIMARY KEY (city_id);


--
-- Name: country country_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_id_pk PRIMARY KEY (country_id);


--
-- Name: history history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pk PRIMARY KEY (history_id);


--
-- Name: memories memories_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memories
    ADD CONSTRAINT memories_pk PRIMARY KEY (history_id, user_id);


--
-- Name: review review_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pk PRIMARY KEY (review_id);


--
-- Name: sight sight_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sight
    ADD CONSTRAINT sight_pk PRIMARY KEY (sight_id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (user_id);


--
-- Name: address_address_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX address_address_id_idx ON public.address USING btree (address_id);


--
-- Name: chat_customer_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX chat_customer_id_idx ON public.chat USING btree (customer_id, guide_id);


--
-- Name: city_city_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX city_city_id_idx ON public.city USING btree (city_id);


--
-- Name: country_id_country_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX country_id_country_id_idx ON public.country USING btree (country_id);


--
-- Name: history_history_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX history_history_id_idx ON public.history USING btree (history_id);


--
-- Name: memories_history_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX memories_history_id_idx ON public.memories USING btree (history_id, user_id);


--
-- Name: review_review_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX review_review_id_idx ON public.review USING btree (review_id, customer_id, guide_id);


--
-- Name: sight_sight_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sight_sight_id_idx ON public.sight USING btree (sight_id);


--
-- Name: user_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_email_idx ON public."user" USING btree (email);


--
-- Name: user_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_user_id_idx ON public."user" USING btree (user_id);


--
-- Name: address address_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_fk FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: chat chat_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk FOREIGN KEY (customer_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: chat chat_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk_1 FOREIGN KEY (guide_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: city city_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_fk FOREIGN KEY (country_id) REFERENCES public.country(country_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: memories memories_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memories
    ADD CONSTRAINT memories_fk FOREIGN KEY (history_id) REFERENCES public.history(history_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: memories memories_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memories
    ADD CONSTRAINT memories_fk_1 FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: review review_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_fk FOREIGN KEY (customer_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: review review_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_fk_1 FOREIGN KEY (guide_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sight sight_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sight
    ADD CONSTRAINT sight_fk FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_fk FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

