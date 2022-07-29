--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP INDEX public.ts_idx;
ALTER TABLE ONLY public.pictures DROP CONSTRAINT pictures_url_key;
ALTER TABLE ONLY public.pictures DROP CONSTRAINT pictures_pkey;
ALTER TABLE public.pictures ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.pictures_id_seq;
DROP TABLE public.pictures;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pictures (
    id integer NOT NULL,
    name text NOT NULL,
    url text,
    exif text,
    obj_name text,
    ts tsvector GENERATED ALWAYS AS (to_tsvector('english'::regconfig, exif)) STORED
);


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: pictures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pictures (id, name, url, exif, obj_name) FROM stdin;
13	dog5	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/237-536x354.jpeg	{"ResolutionUnit": "2", "ExifOffset": "102", "Orientation": "1", "YCbCrPositioning": "1", "XResolution": "25.4", "YResolution": "25.4"}	237-536x354.jpeg
14	dog6	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/1025-4951x3301.jpeg	{"ResolutionUnit": "2", "ExifOffset": "102", "Orientation": "1", "YCbCrPositioning": "1", "XResolution": "72.0", "YResolution": "72.0"}	1025-4951x3301.jpeg
16	dog7	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/iu.jpg	{"ResolutionUnit": "2", "ExifOffset": "90", "Orientation": "1", "XResolution": "300.0", "YResolution": "300.0"}	iu.jpg
19	crane	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/52242734519_06a390900b_c.jpg	{"Copyright": "@Lynne J. Falterbauer", "ExifOffset": "60"}	52242734519_06a390900b_c.jpg
20	lama	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/lama2.jpg	{"ResolutionUnit": "2", "ExifOffset": "260", "Make": "Canon", "Model": "Canon EOS 7D", "Software": "Aperture 3.4.1", "Orientation": "1", "DateTime": "2012:10:27 16:07:38", "YResolution": "72.0", "Copyright": "Copyright 2011 by Joel Burton", "XResolution": "72.0", "Artist": "Joel Burton"}	lama2.jpg
21	soda	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/Bolognese-Dog-18-644620426.jpeg	{}	Bolognese-Dog-18-644620426.jpeg
22	fluffy	https://my-bucket-laithabdz.s3.us-east-1.amazonaws.com/dog.jpg	{"ResolutionUnit": "2", "ExifOffset": "90", "Orientation": "1", "XResolution": "300.0", "YResolution": "300.0"}	dog.jpg
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pictures_id_seq', 22, true);


--
-- Name: pictures pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: pictures pictures_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_url_key UNIQUE (url);


--
-- Name: ts_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ts_idx ON public.pictures USING gin (ts);


--
-- PostgreSQL database dump complete
--

