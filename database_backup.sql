--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO maggie;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE brands (
    id bigint NOT NULL,
    brand_name character varying,
    price integer
);


ALTER TABLE brands OWNER TO maggie;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: maggie
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO maggie;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maggie
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: brands_stores; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE brands_stores (
    id bigint NOT NULL,
    brand_id integer,
    store_id integer
);


ALTER TABLE brands_stores OWNER TO maggie;

--
-- Name: brands_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: maggie
--

CREATE SEQUENCE brands_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_stores_id_seq OWNER TO maggie;

--
-- Name: brands_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maggie
--

ALTER SEQUENCE brands_stores_id_seq OWNED BY brands_stores.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO maggie;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: maggie
--

CREATE TABLE stores (
    id bigint NOT NULL,
    store_name character varying,
    location character varying
);


ALTER TABLE stores OWNER TO maggie;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: maggie
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO maggie;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maggie
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: brands_stores id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY brands_stores ALTER COLUMN id SET DEFAULT nextval('brands_stores_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2018-03-02 16:45:36.901715	2018-03-02 16:45:36.901715
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY brands (id, brand_name, price) FROM stdin;
5	Lucky	50
8	Nike	45
11	Toms	30
12	Converse	15
14	Doc Marten	100
16	Shoe	45
\.


--
-- Data for Name: brands_stores; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY brands_stores (id, brand_id, store_id) FROM stdin;
1	3	1
2	4	1
3	6	1
4	6	1
5	7	1
6	5	2
7	3	2
8	3	2
9	1	2
10	5	1
11	8	1
12	2	1
13	1	1
14	1	1
15	5	3
16	8	3
17	8	3
18	8	4
19	8	7
20	5	7
21	12	7
22	5	4
23	11	10
24	8	10
25	12	10
26	14	10
27	11	12
28	12	12
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY schema_migrations (version) FROM stdin;
20180302164238
20180302164546
20180302164804
20180302172519
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: maggie
--

COPY stores (id, store_name, location) FROM stdin;
3	Nordstrom 	Portland
4	Seven Sisters	Portland
8	Glossier	Tacoma
7	Guess	Portland
9	Seven Sisters 	Portland
11	Store	Portland
12	Target	Nashville
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('brands_id_seq', 16, true);


--
-- Name: brands_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('brands_stores_id_seq', 28, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maggie
--

SELECT pg_catalog.setval('stores_id_seq', 12, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: brands_stores brands_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY brands_stores
    ADD CONSTRAINT brands_stores_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: maggie
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

