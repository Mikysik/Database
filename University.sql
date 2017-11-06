--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-06 17:21:08 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13241)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16400)
-- Name: facultiets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE facultiets (
    id_faculty integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    dean character varying NOT NULL,
    year integer NOT NULL
);


ALTER TABLE facultiets OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16437)
-- Name: lecturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lecturers (
    id_lecturer integer NOT NULL,
    name character varying NOT NULL,
    date_of_birth date NOT NULL,
    degree character varying NOT NULL,
    "position" character varying NOT NULL,
    id_faculty integer NOT NULL
);


ALTER TABLE lecturers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16435)
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lecturers_lecturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lecturers_lecturer_id_seq OWNER TO postgres;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 198
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lecturers_lecturer_id_seq OWNED BY lecturers.id_lecturer;


--
-- TOC entry 196 (class 1259 OID 16397)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE subjects (
    name character varying(30) NOT NULL,
    semester integer NOT NULL,
    hours integer,
    controltype character varying(15),
    id_subject integer NOT NULL,
    id_faculty integer NOT NULL,
    id_lecturer integer NOT NULL
);


ALTER TABLE subjects OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16499)
-- Name: subjects_id_subject_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subjects_id_subject_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_id_subject_seq OWNER TO postgres;

--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 200
-- Name: subjects_id_subject_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subjects_id_subject_seq OWNED BY subjects.id_subject;


--
-- TOC entry 3000 (class 2604 OID 16448)
-- Name: lecturers id_lecturer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lecturers ALTER COLUMN id_lecturer SET DEFAULT nextval('lecturers_lecturer_id_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 16505)
-- Name: subjects id_subject; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects ALTER COLUMN id_subject SET DEFAULT nextval('subjects_id_subject_seq'::regclass);


--
-- TOC entry 3132 (class 0 OID 16400)
-- Dependencies: 197
-- Data for Name: facultiets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facultiets (id_faculty, name, address, dean, year) FROM stdin;
2	Економічний факультет	03022, м. Київ, вул. Васильківська, 90а	Базилевич	1842
1	Географічний факультет	03127, м. Київ, просп. Академіка Глушкова, 2а	Олійник	1933
4	Механіко-математичний факультет	03127, м. Київ, просп. Академіка Глушкова, 4е	Городнiй	1834
3	Історичний факультет	01601, м. Київ, вул. Володимирська, 60	Патриляк	1947
6	Факультет комп'ютерних наук та кібернетики	03680, м. Київ, просп. Академіка Глушкова, 4д	Анісімов	1969
5	Факультет інформаційних технологій	03680, м. Київ, просп. Академіка Глушкова, 4д	Анісімов	1969
8	Факультет соціології	03127, м. Київ, просп. Академіка Глушкова, 4д	Горбачик	2007
7	Факультет психології	03680, м. Київ, просп. Академіка Глушкова, 2а	Данилюк	1971
10	Філософський факультет	01033 м. Київ, вул. Володимирська, 60	Конверський	1834
9	Фізичний факультет	03127, м. Київ, просп. Академіка Глушкова, 4	Макарець	1834
11	Геологічний факультет	03127, м. Київ, просп. Академіка Глушкова, 3е	Проценко	1989
12	Геологічний факультет	03127, м. Київ, просп. Академіка Глушкова, 3е	Проценко	1989
\.


--
-- TOC entry 3134 (class 0 OID 16437)
-- Dependencies: 199
-- Data for Name: lecturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lecturers (id_lecturer, name, date_of_birth, degree, "position", id_faculty) FROM stdin;
2	Капустян Олена	1976-01-09	кандидат наук	старший науковий співробітник	9
1	Кашпур Олена 	1976-12-09	кандидат наук	доцент\n	10
4	Запотоцький Сергій	1969-09-12	доктор наук	професор	7
3	Пасько Володимир	1986-01-01	кандидат наук	доцент	9
5	Ніконова Вікторія	1978-10-10	кандидат наук	старший викладач\n	1
8	Жуков Віктор	1990-03-03	кандидат наук	асистент	6
7	Борецький В'ячеслав	1950-12-08	доктор наук	професор	4
10	Кузьменко Тетяна 	1960-12-12	доктор наук 	професор	5
9	Нетреба Андрій	1978-10-11	доктор наук	професор 	2
6	Нечипорук Олексій	1955-12-10	кандидат наук	доцент 	3
\.


--
-- TOC entry 3131 (class 0 OID 16397)
-- Dependencies: 196
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subjects (name, semester, hours, controltype, id_subject, id_faculty, id_lecturer) FROM stdin;
міжнародна економіка	4	400	іспит	2	2	9
географія	1	156	залік\n	1	1	5
алгоритмізація	3	670	іспит	4	4	7
історія України	2	230	залік	3	3	8
системний аналіз	7	360	іспит	6	6	10
інформаційні технології\n	6	190	залік	5	5	4
психологічні захворювання\n	1	190	залік	8	7	3
психосоматика	2	280	залік	7	7	3
філософія	7	785	іспит	10	10	1
гімнастика\n	5	545	іспит	9	9	2
\.


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 198
-- Name: lecturers_lecturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lecturers_lecturer_id_seq', 1, false);


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 200
-- Name: subjects_id_subject_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subjects_id_subject_seq', 1, false);


--
-- TOC entry 3004 (class 2606 OID 16457)
-- Name: facultiets facultiets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facultiets
    ADD CONSTRAINT facultiets_pkey PRIMARY KEY (id_faculty);


--
-- TOC entry 3006 (class 2606 OID 16450)
-- Name: lecturers lecturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lecturers
    ADD CONSTRAINT lecturers_pkey PRIMARY KEY (id_lecturer);


--
-- TOC entry 3002 (class 2606 OID 16507)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id_subject);


--
-- TOC entry 3009 (class 2606 OID 16458)
-- Name: lecturers id_faculty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lecturers
    ADD CONSTRAINT id_faculty FOREIGN KEY (id_faculty) REFERENCES facultiets(id_faculty);


--
-- TOC entry 3007 (class 2606 OID 16508)
-- Name: subjects id_faculty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT id_faculty FOREIGN KEY (id_faculty) REFERENCES facultiets(id_faculty);


--
-- TOC entry 3008 (class 2606 OID 16513)
-- Name: subjects id_lecturer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT id_lecturer FOREIGN KEY (id_lecturer) REFERENCES lecturers(id_lecturer);


-- Completed on 2017-11-06 17:21:11 EET

--
-- PostgreSQL database dump complete
--

