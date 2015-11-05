--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: product_categories; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE product_categories (
    id integer NOT NULL,
    name character varying(255),
    img_file_file_name character varying(255),
    img_file_content_type character varying(255),
    img_file_file_size integer,
    img_file_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_categories OWNER TO ava;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ava
--

CREATE SEQUENCE product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO ava;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ava
--

ALTER SEQUENCE product_categories_id_seq OWNED BY product_categories.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE product_images (
    id integer NOT NULL,
    product_id integer,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_images OWNER TO ava;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: ava
--

CREATE SEQUENCE product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO ava;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ava
--

ALTER SEQUENCE product_images_id_seq OWNED BY product_images.id;


--
-- Name: product_subcategories; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE product_subcategories (
    id integer NOT NULL,
    product_category_id integer,
    name character varying(255),
    img_file_file_name character varying(255),
    img_file_content_type character varying(255),
    img_file_file_size integer,
    img_file_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_subcategories OWNER TO ava;

--
-- Name: product_subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: ava
--

CREATE SEQUENCE product_subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_subcategories_id_seq OWNER TO ava;

--
-- Name: product_subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ava
--

ALTER SEQUENCE product_subcategories_id_seq OWNED BY product_subcategories.id;


--
-- Name: product_subsubcategories; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE product_subsubcategories (
    id integer NOT NULL,
    product_category_id integer,
    product_subcategory_id integer,
    name character varying(255),
    img_file_file_name character varying(255),
    img_file_content_type character varying(255),
    img_file_file_size integer,
    img_file_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_subsubcategories OWNER TO ava;

--
-- Name: product_subsubcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: ava
--

CREATE SEQUENCE product_subsubcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_subsubcategories_id_seq OWNER TO ava;

--
-- Name: product_subsubcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ava
--

ALTER SEQUENCE product_subsubcategories_id_seq OWNED BY product_subsubcategories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    product_category_id integer,
    product_subcategory_id integer,
    product_subsubcategory_id integer,
    product_var_id character varying(255),
    name character varying(255),
    price numeric(15,2),
    description text,
    img_file_file_name character varying(255),
    img_file_content_type character varying(255),
    img_file_file_size integer,
    img_file_updated_at timestamp without time zone,
    status character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO ava;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: ava
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO ava;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ava
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ava; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ava;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ava
--

ALTER TABLE ONLY product_categories ALTER COLUMN id SET DEFAULT nextval('product_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ava
--

ALTER TABLE ONLY product_images ALTER COLUMN id SET DEFAULT nextval('product_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ava
--

ALTER TABLE ONLY product_subcategories ALTER COLUMN id SET DEFAULT nextval('product_subcategories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ava
--

ALTER TABLE ONLY product_subsubcategories ALTER COLUMN id SET DEFAULT nextval('product_subsubcategories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ava
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY product_categories (id, name, img_file_file_name, img_file_content_type, img_file_file_size, img_file_updated_at, description, created_at, updated_at) FROM stdin;
1	Coins	scan0002.jpg	image/jpeg	47372	2015-08-20 06:38:11.822491	Coins	2015-08-20 06:38:11.939862	2015-08-20 06:38:11.939862
2	Currency Notes	Picture_898.jpg	image/jpeg	637406	2015-08-20 06:46:47.711214	Currency Notes	2015-08-20 06:46:48.067222	2015-08-20 06:46:48.067222
4	Crockery	Picture_cam_322.jpg	image/jpeg	1015892	2015-08-20 06:52:22.615003	Crockery	2015-08-20 06:52:22.970233	2015-08-20 06:52:22.970233
5	Paintings	Picture_558.jpg	image/jpeg	801506	2015-08-20 06:53:07.269505	Paintings	2015-08-20 06:53:07.62909	2015-08-20 06:53:07.62909
6	Furniture	sofa.jpg	image/jpeg	12748	2015-08-20 06:55:37.302844	Furniture	2015-08-20 06:55:37.421186	2015-08-20 06:55:37.421186
7	Wooden Craft	Picture_506.jpg	image/jpeg	543354	2015-08-20 06:56:58.304537	Wooden Craft	2015-08-20 06:56:58.624336	2015-08-20 06:56:58.624336
8	LP Records	records.gif	image/gif	42977	2015-08-20 06:58:57.520064	LP Records	2015-08-20 06:58:57.758667	2015-08-20 06:58:57.758667
9	Bond Papers	9.jpg	image/jpeg	20049	2015-08-20 06:59:58.067963	Bond Papers	2015-08-20 06:59:58.182488	2015-08-20 06:59:58.182488
10	Clocks and Watches	Picture_939.jpg	image/jpeg	65710	2015-08-20 07:00:31.133806	Clocks and Watches	2015-08-20 07:00:31.259886	2015-08-20 07:00:31.259886
11	Metallic	Picture_145.jpg	image/jpeg	1103831	2015-08-20 07:00:55.092647	Metallic	2015-08-20 07:00:55.465898	2015-08-20 07:00:55.465898
13	Stationary	ink.jpg	image/jpeg	42281	2015-08-27 10:41:17.12331	<p>Stationary</p>\r\n	2015-08-27 10:41:18.500173	2015-08-27 10:41:18.500173
14	Candle Stands	candle.jpg	image/jpeg	12468	2015-08-27 11:01:59.295568	<p>candle stand</p>\r\n	2015-08-27 11:01:59.994431	2015-08-27 11:01:59.994431
15	Antique Things	things.jpg	image/jpeg	7705	2015-08-27 11:06:31.590083	<p>Antique Things</p>\r\n	2015-08-27 11:06:32.138994	2015-08-27 11:06:32.138994
3	Stamps / Philately	Picture_cam_914.jpg	image/jpeg	425271	2015-08-20 06:47:13.053776	<p>Stamps / &nbsp;Philately</p>\r\n	2015-08-20 06:47:13.278558	2015-09-01 07:15:05.727835
17	MOVIES	movies.jpg	image/jpeg	40062	2015-10-13 05:19:32.085021	<h2 style="font-style:italic;"><span style="font-family:comic sans ms,cursive">Entertainment zone</span></h2>\r\n\r\n<p>&nbsp;</p>\r\n	2015-10-13 05:19:32.182978	2015-10-13 05:19:32.182978
\.


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ava
--

SELECT pg_catalog.setval('product_categories_id_seq', 17, true);


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY product_images (id, product_id, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
28	132	done53..jpg	image/jpeg	2583415	2015-08-25 06:35:46.893359	2015-08-25 06:35:47.040716	2015-08-25 06:35:47.040716
29	244	20150816_131647-1.jpg	image/jpeg	2806658	2015-08-28 06:17:49.503152	2015-08-28 06:17:49.787294	2015-08-28 06:17:49.787294
30	280	2015-08-07_10.54.29.jpg	image/jpeg	153009	2015-08-29 07:43:50.644961	2015-08-29 07:43:50.824447	2015-08-29 07:43:50.824447
31	323	20150806_231236-1.jpg	image/jpeg	4188799	2015-08-31 05:31:42.04932	2015-08-31 05:31:42.218448	2015-08-31 05:31:42.218448
32	977	Chrysanthemum_-_Copy_(2).jpg	image/jpeg	879394	2015-10-13 05:35:07.000044	2015-10-13 05:35:07.012931	2015-10-13 05:35:07.012931
33	977	Jellyfish_-_Copy_(2).jpg	image/jpeg	775702	2015-10-13 05:35:07.043959	2015-10-13 05:35:07.05481	2015-10-13 05:35:07.05481
\.


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ava
--

SELECT pg_catalog.setval('product_images_id_seq', 33, true);


--
-- Data for Name: product_subcategories; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY product_subcategories (id, product_category_id, name, img_file_file_name, img_file_content_type, img_file_file_size, img_file_updated_at, description, created_at, updated_at) FROM stdin;
7	1	Princely States	pricely_states_coin.jpg	image/jpeg	35274	2015-08-20 07:51:26.531108	Princely States	2015-08-20 07:51:26.632724	2015-08-20 07:51:26.632724
8	1	Independent Kingdoms	independent_kingdoms.jpg	image/jpeg	124530	2015-08-20 07:51:42.413926	Independent Kingdoms	2015-08-20 07:51:42.52513	2015-08-20 07:51:42.52513
9	1	Islamic India	islamic_india.jpg	image/jpeg	14630	2015-08-20 07:52:03.003764	Islamic India	2015-08-20 07:52:03.112533	2015-08-20 07:52:03.112533
10	1	Ancient India	Ancient_Indian_coins.jpg	image/jpeg	65045	2015-08-20 07:52:16.789664	Ancient India	2015-08-20 07:52:16.90255	2015-08-20 07:52:16.90255
11	1	Dutch, French and Danish India	Dutch.jpg	image/jpeg	55216	2015-08-20 07:52:46.233225	Dutch, French and Danish India	2015-08-20 07:52:46.348611	2015-08-20 07:52:46.348611
16	3	Stamp Sets	stamp_sets.gif	image/gif	220104	2015-08-20 09:26:23.39733	Stamp Sets	2015-08-20 09:26:23.705225	2015-08-20 09:26:23.705225
17	3	Stamp Sheets	stamp_sheets.jpg	image/jpeg	131677	2015-08-20 09:26:47.203716	Stamp Sheets	2015-08-20 09:26:47.333042	2015-08-20 09:26:47.333042
18	3	Miniature Sheets	miniature_stamp_sheets.jpg	image/jpeg	248835	2015-08-20 09:27:09.896305	Miniature Sheets	2015-08-20 09:27:10.096863	2015-08-20 09:27:10.096863
20	3	Postal Stationary	postalstationery.jpg	image/jpeg	91989	2015-08-20 09:27:51.213303	Postal Stationary	2015-08-20 09:27:51.327273	2015-08-20 09:27:51.327273
21	4	Plates	Picture_433.jpg	image/jpeg	707451	2015-08-20 09:28:36.344352	Plates	2015-08-20 09:28:36.701763	2015-08-20 09:28:36.701763
22	4	Bottles	Picture_456.jpg	image/jpeg	699958	2015-08-20 09:28:59.038104	Bottles	2015-08-20 09:28:59.394782	2015-08-20 09:28:59.394782
23	4	Kettles	Picture_455.jpg	image/jpeg	805191	2015-08-20 09:29:13.475679	Kettles	2015-08-20 09:29:13.846592	2015-08-20 09:29:13.846592
24	4	Soup Bowls	Picture_627.jpg	image/jpeg	644168	2015-08-20 09:29:57.932366	Soup Bowls	2015-08-20 09:29:58.279806	2015-08-20 09:29:58.279806
25	4	Terrin	Picture_cam_322.jpg	image/jpeg	1015892	2015-08-20 09:30:43.155107	Terrin	2015-08-20 09:30:43.546795	2015-08-20 09:30:43.546795
26	4	Wall Hangings	Picture_494.jpg	image/jpeg	661507	2015-08-20 09:31:05.273449	Wall Hangings	2015-08-20 09:31:05.630173	2015-08-20 09:31:05.630173
27	4	Ash Trays	Picture_965.jpg	image/jpeg	36488	2015-08-20 09:31:33.037929	Ash Trays	2015-08-20 09:31:33.174501	2015-08-20 09:31:33.174501
28	4	Flower Pots	flower_pots.JPG	image/jpeg	30166	2015-08-20 09:33:21.232366	Flower Pots	2015-08-20 09:33:21.345898	2015-08-20 09:33:21.345898
29	4	Stoneware and Mudware	Picture_466.jpg	image/jpeg	874839	2015-08-20 09:33:55.020092	Stoneware and Mudware	2015-08-20 09:33:55.365963	2015-08-20 09:33:55.365963
30	4	Statues	statues.png	image/png	453080	2015-08-20 09:35:39.260054	Statues	2015-08-20 09:35:39.552128	2015-08-20 09:35:39.552128
31	4	Vase	Picture_625.jpg	image/jpeg	1060672	2015-08-20 09:36:08.228151	Vase	2015-08-20 09:36:08.604863	2015-08-20 09:36:08.604863
32	4	Glasses	glassware.jpg	image/jpeg	450487	2015-08-20 09:38:52.511933	Glasses	2015-08-20 09:38:53.049169	2015-08-20 09:38:53.049169
1	1	Portuguese Goa-India Coins	scan0004.jpg	image/jpeg	33288	2015-08-20 07:41:30.651023	Portuguese Goa-India	2015-08-20 07:41:30.79291	2015-08-20 07:41:30.79291
2	1	British India Coins	british_india.jpg	image/jpeg	13494	2015-08-20 07:49:37.555415	British India	2015-08-20 07:49:37.649114	2015-08-20 07:49:37.649114
4	1	Republic India Coins	republic_india.jpg	image/jpeg	45284	2015-08-20 07:50:10.926217	Republic India	2015-08-20 07:50:11.041599	2015-08-20 07:50:11.041599
15	2	Foreign Old Notes	foreign_old_note.JPG	image/jpeg	285795	2015-08-20 09:20:30.09227	Foreign Old	2015-08-20 09:20:30.302589	2015-08-20 09:20:30.302589
5	1	Foreign New Coins	foreign_new.jpg	image/jpeg	62499	2015-08-20 07:50:42.542699	Foreign New	2015-08-20 07:50:42.669978	2015-08-20 07:50:42.669978
6	1	Foreign Old Coins	foreign_old.JPG	image/jpeg	79891	2015-08-20 07:50:56.168845	Foreign Old	2015-08-20 07:50:56.29943	2015-08-20 07:50:56.29943
35	4	Cup & Saucer	cup.jpg	image/jpeg	8148	2015-08-27 09:32:18.783869	<p>Cup &amp; Saucer</p>\r\n	2015-08-27 09:32:19.331758	2015-08-27 09:32:19.331758
36	4	Ceramic	cera.jpg	image/jpeg	54670	2015-08-27 09:51:13.813991	<p>Ceramic</p>\r\n	2015-08-27 09:51:14.57918	2015-08-27 09:51:14.57918
38	4	Paper Weights	paper.jpg	image/jpeg	74024	2015-08-27 10:49:19.008287	<p>Paper Weights</p>\r\n	2015-08-27 10:49:20.361913	2015-08-27 10:49:20.361913
39	4	Talc Box	talc.jpg	image/jpeg	55794	2015-08-27 10:52:42.741212	<p>Talc Box</p>\r\n	2015-08-27 10:52:43.26864	2015-08-27 10:52:43.26864
40	4	Branded Porcelain/Ceramic Items	beer1.JPG	image/jpeg	12574	2015-08-27 10:59:39.097913	<p>Branded items</p>\r\n	2015-08-27 10:59:39.558625	2015-08-27 10:59:39.558625
41	4	Wall Hanging Plates	wall.jpg	image/jpeg	15954	2015-08-28 05:12:14.97528	<p>Wall hanging plates</p>\r\n	2015-08-28 05:12:15.708733	2015-08-28 05:12:15.708733
42	4	Ink Pots	ink.jpg	image/jpeg	42281	2015-08-28 05:44:44.755745	<p>ink pots</p>\r\n	2015-08-28 05:44:45.133261	2015-08-28 05:44:45.133261
43	4	Crockery Sets	crock.jpg	image/jpeg	72091	2015-08-28 06:44:13.975518	<p>Crockery Sets</p>\r\n	2015-08-28 06:44:15.055033	2015-08-28 06:44:15.055033
44	4	Candle stands	candle.jpg	image/jpeg	12468	2015-08-28 07:31:52.191031	<p>Candle Stands</p>\r\n	2015-08-28 07:31:52.832378	2015-08-28 07:31:52.832378
45	2	India Republic	currency.JPG	image/jpeg	116586	2015-08-29 06:39:42.814346	<p>India republic</p>\r\n	2015-08-29 06:39:43.501405	2015-08-29 06:39:43.501405
46	2	India Portuguese And British	india.jpg	image/jpeg	76687	2015-08-29 06:45:47.466796	<p>India Portuguese And British</p>\r\n	2015-08-29 06:45:48.114961	2015-08-29 06:45:48.114961
47	2	Foreign Notes	foreign.jpg	image/jpeg	124071	2015-08-29 07:15:42.971872	<p>Foreign Notes</p>\r\n	2015-08-29 07:15:43.473981	2015-08-29 07:15:43.473981
48	3	Foreign Postally used & Slightly Damaged FDC	1.jpg	image/jpeg	1473278	2015-09-03 05:50:37.784225	<p>Foreign postally used &amp; slightly damaged FDC</p>\r\n	2015-09-03 05:50:39.261848	2015-09-03 05:50:39.261848
49	3	Foreign Postally used FDC	1.jpg	image/jpeg	1448186	2015-09-03 07:00:46.042897	<p>Foreign postally used FDC</p>\r\n	2015-09-03 07:00:47.813972	2015-09-03 07:00:47.813972
50	3	FDC - Postally used FDC & Covers	FDC2.jpg	image/jpeg	9179	2015-09-22 00:16:44.215302	<p>Postally used FDC &amp; Cover</p>\r\n	2015-09-22 00:16:44.232085	2015-09-22 00:16:44.232085
51	3	FDC	FDC2.jpg	image/jpeg	9179	2015-09-22 00:24:46.057455	<p>FDC - Postally used FDC &amp; Covers</p>\r\n	2015-09-22 00:24:46.070636	2015-09-22 00:24:46.070636
52	3	Portuguese and Colonies	por.jpg	image/jpeg	79712	2015-09-27 22:13:26.502866	<p>portuguese and colonies</p>\r\n	2015-09-27 22:13:26.51758	2015-09-27 22:13:26.51758
53	3	Angola	angola.png	image/png	2478	2015-10-03 00:07:54.200195	<p>Angola</p>\r\n	2015-10-03 00:07:54.213606	2015-10-03 00:07:54.213606
54	3	Mozambique	mozambique.png	image/png	3153	2015-10-03 00:37:13.405975	<p>Mozambique</p>\r\n	2015-10-03 00:37:13.420177	2015-10-03 00:37:13.420177
55	3	Azores	azores.jpg	image/jpeg	5380	2015-10-03 00:56:38.270199	<p>Azores</p>\r\n	2015-10-03 00:56:38.283791	2015-10-03 00:56:38.283791
56	3	Kenya Uganda Tanganyika	kut.jpg	image/jpeg	11839	2015-10-03 01:14:53.656065	<p>Kenya Uganda Tanganyika</p>\r\n	2015-10-03 01:14:53.670006	2015-10-03 01:14:53.670006
57	3	Kenya	kenya.png	image/png	56509	2015-10-03 01:39:18.103019	<p>Kenya</p>\r\n	2015-10-03 01:39:18.117633	2015-10-03 01:39:18.117633
58	3	Tanganyika	tanza.png	image/png	429	2015-10-03 01:55:28.081969	<p>Tanganyika</p>\r\n	2015-10-03 01:55:28.095759	2015-10-03 01:55:28.095759
59	3	Uganda	uganda.jpg	image/jpeg	5446	2015-10-03 02:06:34.161106	<p>Uganda</p>\r\n	2015-10-03 02:06:34.175616	2015-10-03 02:06:34.175616
60	17	bollywood	bollywood.JPG	image/jpeg	30820	2015-10-13 05:21:19.515564	<p>indian movies</p>\r\n	2015-10-13 05:21:19.526646	2015-10-13 05:21:19.526646
61	17	hollywood	hollywood.jpg	image/jpeg	10633	2015-10-13 05:22:24.443316	<p>western movies</p>\r\n	2015-10-13 05:22:24.451864	2015-10-13 05:22:24.451864
62	17	children	kids_movie_main_pic.JPG	image/jpeg	26396	2015-10-13 05:23:25.875636	<p>movies for children</p>\r\n	2015-10-13 05:23:25.908045	2015-10-13 05:23:25.908045
64	3	Thematic	21.jpg	image/jpeg	3598838	2015-10-19 07:29:14.042044	<p>sub category:Thematic</p>\r\n	2015-10-19 07:29:14.065048	2015-10-19 07:29:14.065048
\.


--
-- Name: product_subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ava
--

SELECT pg_catalog.setval('product_subcategories_id_seq', 64, true);


--
-- Data for Name: product_subsubcategories; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY product_subsubcategories (id, product_category_id, product_subcategory_id, name, img_file_file_name, img_file_content_type, img_file_file_size, img_file_updated_at, description, created_at, updated_at) FROM stdin;
2	3	18	Commonwealth	common.jpg	image/jpeg	89197	2015-09-11 22:59:52.610769	<p>commonwealth</p>\r\n	2015-09-11 22:59:52.623273	2015-09-11 22:59:52.623273
3	3	18	Religious	religious.png	image/png	184568	2015-09-14 23:40:29.142986	<p>*</p>\r\n	2015-09-14 23:40:29.161433	2015-09-14 23:40:29.161433
4	3	18	Foreign	foreign1.jpg	image/jpeg	47191	2015-09-15 21:21:17.599015	<p>foreign</p>\r\n	2015-09-15 21:21:17.61233	2015-09-15 21:21:17.61233
5	3	18	Thematic	thematic.jpg	image/jpeg	314243	2015-09-15 22:35:18.44007	<p>thematic</p>\r\n	2015-09-15 22:35:18.455002	2015-09-15 22:35:18.455002
7	3	50	Commonwealth Postally used FDC	1_FDC.jpg	image/jpeg	100627	2015-09-22 00:25:39.650488	<p>Commonwealth Postally used FDC</p>\r\n	2015-09-22 00:25:39.664244	2015-09-22 00:25:39.664244
9	3	51	Commonwealth Used FDC	used.jpg	image/jpeg	7488	2015-09-22 01:48:08.560983	<p>Commonwealth used FDC</p>\r\n	2015-09-22 01:48:08.573794	2015-09-22 01:48:08.573794
10	3	52	India-Goa-Portuguese	goa.jpg	image/jpeg	9942	2015-09-27 22:15:52.628417	<p>India-Goa-Portuguese</p>\r\n	2015-09-27 22:15:52.642668	2015-09-27 22:15:52.642668
11	3	51	Commonwealth Postally unused FDC	unused.jpg	image/jpeg	29761	2015-10-01 23:05:51.327872	<p>Commonwealth Postally unused FDC</p>\r\n	2015-10-01 23:05:51.343251	2015-10-01 23:05:51.343251
12	3	51	Foreign Unused FDC	foreign_unused.jpg	image/jpeg	5672	2015-10-01 23:46:54.359635	<p>Foreign Unused FDC</p>\r\n	2015-10-01 23:46:54.374668	2015-10-01 23:46:54.374668
13	3	51	Foreign used FDC	FOR.jpg	image/jpeg	176506	2015-10-02 00:00:39.116595	<p>Foreign used FDC</p>\r\n	2015-10-02 00:00:39.131698	2015-10-02 00:00:39.131698
14	17	60	action movies	download.jpg	image/jpeg	10017	2015-10-13 05:25:08.832916	<p>bollywood action movies</p>\r\n	2015-10-13 05:25:08.84363	2015-10-13 05:25:08.84363
15	17	60	love movies	Do-Aur-Do-Paanch_jun28.jpg	image/jpeg	74131	2015-10-13 05:26:41.89835	<p>bollywood love movies</p>\r\n	2015-10-13 05:26:41.908195	2015-10-13 05:26:41.908195
16	17	60	horror movies	images.jpg	image/jpeg	11739	2015-10-13 05:28:24.652402	<p>bollywood horror movies</p>\r\n	2015-10-13 05:28:24.661251	2015-10-13 05:28:24.661251
17	3	17	Portuguese and the Colonies	lourenco_marques_pclmcs_900_ceres_cut_sheet_of_25_stmps_from_1912.jpg	image/jpeg	1062571	2015-10-14 05:08:23.987087	<p>Portuguese and the Colonies</p>\r\n	2015-10-14 05:08:24.000289	2015-10-14 05:08:24.000289
18	3	64	Railways	IMG_20151016_184010_320.jpg	image/jpeg	459690	2015-10-19 07:32:43.221065	<p>Sub category level1:Railways</p>\r\n	2015-10-19 07:32:43.235344	2015-10-19 07:32:43.235344
19	3	64	Fish	IMG_20151017_121716_082.jpg	image/jpeg	457248	2015-10-20 05:51:31.327804	<p>Loose stamps of :&nbsp;Fish</p>\r\n	2015-10-20 05:51:31.341645	2015-10-20 05:51:31.341645
20	3	64	Animals	IMG_20151017_171236_425.jpg	image/jpeg	233454	2015-10-20 11:22:21.481469	<p>Subcategory level 1: Animals</p>\r\n	2015-10-20 11:22:21.494066	2015-10-20 11:22:21.494066
21	3	64	Birds	IMG_20151019_101848_109.jpg	image/jpeg	491453	2015-10-21 11:40:39.814627	<p>Sub category level1:Birds</p>\r\n	2015-10-21 11:40:39.827705	2015-10-21 11:40:39.827705
22	3	64	Ships	IMG_20151014_182547_677.jpg	image/jpeg	417470	2015-10-22 12:13:56.018321	<p>Sub category level 1:ships</p>\r\n	2015-10-22 12:13:56.033665	2015-10-22 12:13:56.033665
23	3	64	Space & Aeroplanes	IMG_20151023_180957_203.jpg	image/jpeg	605595	2015-10-26 05:32:50.47805	<p>Space and Aeroplans</p>\r\n	2015-10-26 05:32:50.494112	2015-10-26 05:32:50.494112
24	3	64	Flowers	IMG_20151024_111859_124.jpg	image/jpeg	221221	2015-10-26 06:28:44.219748	<p>Flowers</p>\r\n	2015-10-26 06:28:44.232668	2015-10-26 06:28:44.232668
25	3	17	Foreign	IMG_20151023_174914_806.jpg	image/jpeg	123651	2015-10-26 07:43:35.638781	<p>Foreign</p>\r\n	2015-10-26 07:43:35.653491	2015-10-26 07:43:35.653491
26	3	64	Vikings	IMG_20151028_103240_370.jpg	image/jpeg	171996	2015-10-29 06:46:04.169995	<p>vikings</p>\r\n	2015-10-29 06:46:04.185425	2015-10-29 06:46:04.185425
27	3	64	MUSHROOMS	IMG_20151026_175058_925.jpg	image/jpeg	293179	2015-10-29 07:40:42.541668	<p>MUSHROOMS</p>\r\n	2015-10-29 07:40:42.554855	2015-10-29 07:40:42.554855
28	3	64	Fruits	IMG_20151026_175938_017.jpg	image/jpeg	278304	2015-10-29 11:30:50.914555	<p>FRUITS</p>\r\n	2015-10-29 11:30:50.928168	2015-10-29 11:30:50.928168
29	3	64	Scouts	IMG_20151031_121756_213.jpg	image/jpeg	165738	2015-10-31 11:07:06.722259	<p>scouts</p>\r\n	2015-10-31 11:07:06.736444	2015-10-31 11:07:06.736444
30	3	18	India	IMG_20151031_115215_926.jpg	image/jpeg	450068	2015-10-31 14:10:17.324989	<p>india</p>\r\n	2015-10-31 14:10:17.338825	2015-10-31 14:10:17.338825
\.


--
-- Name: product_subsubcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ava
--

SELECT pg_catalog.setval('product_subsubcategories_id_seq', 30, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY products (id, product_category_id, product_subcategory_id, product_subsubcategory_id, product_var_id, name, price, description, img_file_file_name, img_file_content_type, img_file_file_size, img_file_updated_at, status, created_at, updated_at) FROM stdin;
39	4	22	\N	\N	Goan Cashew bottle 	700.00	<p>Goan cashew bottle</p>\r\n	20150816_120328.jpg	image/jpeg	4723016	2015-08-21 10:41:22.087494	active	2015-08-21 10:41:22.587369	2015-08-21 10:41:22.587369
40	4	22	\N	\N	Gin bottle 	650.00	<p>Around 100 years old English gin bottle</p>\r\n	20150816_120700.jpg	image/jpeg	3744797	2015-08-21 10:47:28.850986	active	2015-08-21 10:47:29.014746	2015-08-21 10:47:29.014746
10	3	20	\N	\N	postal stamp	400.00	<p>400th centanary Vasco Da Gama</p>\r\n	19.jpg	image/jpeg	1843070	2015-08-21 06:30:01.808154	active	2015-08-21 06:30:02.669471	2015-08-21 06:32:14.060792
8	4	22	\N	\N	Antique bottle- Stark Blue	5653543675.00	<p>adfawefasdfasf</p>\r\n	Picture_454.jpg	image/jpeg	620319	2015-08-21 06:40:30.546033	hidden	2015-08-21 05:40:00.923499	2015-08-21 06:40:30.752915
12	3	20	\N	\N	Post card	390.00	<p>400th Centanary of Portuguese visit to India</p>\r\n	21.jpg	image/jpeg	1631286	2015-08-21 06:51:34.961045	active	2015-08-21 06:51:35.085011	2015-08-21 06:51:35.085011
50	4	22	\N	\N	Whiskey bottle	250.00	<p>New bottle</p>\r\n	20150816_121237.jpg	image/jpeg	4168367	2015-08-22 06:49:23.454	active	2015-08-22 06:49:23.60944	2015-08-22 06:49:23.60944
13	3	20	\N	\N	 Postal Cover	370.00	<p>UPU Postal Cover of Carlos.</p>\r\n\r\n<p>St. Thomas End Principe.&nbsp;</p>\r\n	25.jpg	image/jpeg	1808690	2015-08-21 07:02:39.479083	active	2015-08-21 07:02:39.591045	2015-08-21 07:06:21.385909
41	4	22	\N	\N	Blue bottle	700.00	<p>Around 100 years ld French Wine bottle</p>\r\n	20150816_120727.jpg	image/jpeg	3823764	2015-08-21 10:52:16.687577	active	2015-08-21 10:52:16.941408	2015-08-21 10:52:16.941408
14	4	22	\N	\N	Half Bottle	350.00	<p>Half Bottle</p>\r\n	20150816_113839.jpg	image/jpeg	1764682	2015-08-21 07:23:44.531666	active	2015-08-21 07:19:14.128415	2015-08-21 07:24:26.401938
15	4	22	\N	\N	Brown  bottle	300.00	<p>Brown 750ml Wine bottle</p>\r\n	20150816_114236.jpg	image/jpeg	2028866	2015-08-21 07:52:04.890719	active	2015-08-21 07:52:05.081304	2015-08-21 07:52:05.081304
17	4	22	\N	\N	Blue hand made bottle	400.00	<p>Around 80 years old English hand made bottle</p>\r\n	20150816_114320.jpg	image/jpeg	1710359	2015-08-21 08:01:21.202817	active	2015-08-21 08:01:21.372372	2015-08-21 08:01:21.372372
18	4	22	\N	\N	Gin bottle	350.00	<p>Around 100 years old English Gin bottle</p>\r\n	20150816_114502.jpg	image/jpeg	2031140	2015-08-21 08:11:01.548181	active	2015-08-21 08:05:37.022834	2015-08-21 08:11:01.684708
19	4	22	\N	\N	German Soda bottle	300.00	<p>German hand made soda bottle</p>\r\n	20150816_114548.jpg	image/jpeg	2108302	2015-08-21 08:15:09.522211	active	2015-08-21 08:15:09.662725	2015-08-21 08:15:09.662725
20	4	22	\N	\N	Sauce bottle	250.00	<p>50 years old sauce bottle</p>\r\n	20150816_114607.jpg	image/jpeg	2187813	2015-08-21 08:21:25.266562	active	2015-08-21 08:21:25.390344	2015-08-21 08:21:25.390344
21	4	22	\N	\N	Antique Decanter	1500.00	<p>150 years old hand made Decanter</p>\r\n	20150816_114748.jpg	image/jpeg	1898559	2015-08-21 08:32:18.10773	active	2015-08-21 08:32:18.253801	2015-08-21 09:02:52.079162
22	4	22	\N	\N	Antique Dicanter	1800.00	<p>150 years old crystal dicanter</p>\r\n	20150816_114915.jpg	image/jpeg	1603021	2015-08-21 09:08:32.842488	active	2015-08-21 09:08:33.679627	2015-08-21 09:08:33.679627
23	4	22	\N	\N	Dicanter	900.00	<p>Around 40 years old dicanter</p>\r\n	20150816_115226.jpg	image/jpeg	2342863	2015-08-21 09:12:32.614673	active	2015-08-21 09:12:32.766917	2015-08-21 09:12:32.766917
24	4	22	\N	\N	Three sided bottle	1500.00	<p>100 years old three sided hand made bottle</p>\r\n	20150816_115247.jpg	image/jpeg	2322424	2015-08-21 09:16:27.829346	active	2015-08-21 09:16:27.990244	2015-08-21 09:16:27.990244
25	4	22	\N	\N	Cognac bottle	750.00	<p>Cognac bottle</p>\r\n	20150816_115432.jpg	image/jpeg	2051798	2015-08-21 09:20:47.541773	active	2015-08-21 09:20:47.736907	2015-08-21 09:20:47.736907
26	4	22	\N	\N	Gallon	900.00	<p>One gallon with handle</p>\r\n	20150816_115503.jpg	image/jpeg	2198369	2015-08-21 09:24:51.129963	active	2015-08-21 09:24:51.283883	2015-08-21 09:24:51.283883
27	4	22	\N	\N	Jam bottle	600.00	<p>Around sixty years old jam bottle</p>\r\n	20150816_115605.jpg	image/jpeg	2587709	2015-08-21 09:28:44.111291	active	2015-08-21 09:28:44.273296	2015-08-21 09:28:44.273296
28	4	22	\N	\N	Italian bottle	650.00	<p>Around 80 years old Italian wine bottle</p>\r\n	20150816_115648.jpg	image/jpeg	3924772	2015-08-21 09:33:40.837993	active	2015-08-21 09:33:40.988692	2015-08-21 09:33:40.988692
30	4	22	\N	\N	Five sided bottle	350.00	<p>Five sided French brandy bottle</p>\r\n	20150816_115758.jpg	image/jpeg	3749293	2015-08-21 09:41:04.756909	active	2015-08-21 09:41:04.955264	2015-08-21 09:41:04.955264
31	4	22	\N	\N	Antique Round Bottom  bottle	2500.00	<p>Around 180 years old bottom round bottle</p>\r\n	20150816_115952.jpg	image/jpeg	3846241	2015-08-21 09:45:35.390204	active	2015-08-21 09:45:35.75534	2015-08-21 09:45:35.75534
32	4	22	\N	\N	Half Gallon	750.00	<p>Around 100 years old American gallon</p>\r\n	20150816_120026.jpg	image/jpeg	3867032	2015-08-21 09:49:08.210852	active	2015-08-21 09:49:08.66636	2015-08-21 09:49:08.66636
33	4	22	\N	\N	Porcelain bottle	1500.00	<p>Around 80 years old English porcelain hand painted bottle</p>\r\n	20150816_120122.jpg	image/jpeg	4418418	2015-08-21 09:53:55.700191	active	2015-08-21 09:53:55.95826	2015-08-21 09:53:55.95826
34	4	22	\N	\N	1926 bottle 	900.00	<p>South African bottle from 1926</p>\r\n	20150816_120140.jpg	image/jpeg	3712086	2015-08-21 09:58:47.921658	active	2015-08-21 09:58:48.137573	2015-08-21 09:58:48.137573
16	4	22	\N	\N	B001 Champagne bottle	400.00	<p>French around 100 years old Champagne bottle</p>\r\n	20150816_114305.jpg	image/jpeg	1957642	2015-08-21 07:57:53.657326	active	2015-08-21 07:57:53.804126	2015-08-21 10:00:42.988811
35	4	22	\N	\N	Crystal bottle	800.00	<p>Around 40 years old French cognac bottle</p>\r\n	20150816_120200.jpg	image/jpeg	4507829	2015-08-21 10:06:16.756698	active	2015-08-21 10:06:16.909898	2015-08-21 10:06:16.909898
36	4	22	\N	\N	Moon shape bottle	700.00	<p>Moon shape bottle</p>\r\n	20150816_120226.jpg	image/jpeg	3810361	2015-08-21 10:09:35.193085	active	2015-08-21 10:09:35.584411	2015-08-21 10:09:35.584411
37	4	22	\N	\N	Two litter Blue hand made bottle	2200.00	<p>Around 150 years old hand made two litter blue bottle</p>\r\n	20150816_120245.jpg	image/jpeg	4101985	2015-08-21 10:14:21.338149	active	2015-08-21 10:14:21.559846	2015-08-21 10:14:21.559846
38	4	22	\N	\N	Decanter bottle 	600.00	<p>Around 75 years old decanter bottle</p>\r\n	20150816_120304.jpg	image/jpeg	3918339	2015-08-21 10:27:34.377201	active	2015-08-21 10:27:34.666772	2015-08-21 10:27:34.666772
42	4	22	\N	\N	Tiger bottle	250.00	<p>Tiger mark Whiskey bottle</p>\r\n	20150816_120803.jpg	image/jpeg	3982006	2015-08-21 10:55:16.15948	active	2015-08-21 10:55:16.357563	2015-08-21 10:55:16.357563
43	4	22	\N	\N	French Wine bottle	750.00	<p>Around 80 years old French wine bottle</p>\r\n	20150816_120834.jpg	image/jpeg	3658880	2015-08-21 10:58:20.527186	active	2015-08-21 10:58:20.723497	2015-08-21 10:58:20.723497
44	4	22	\N	\N	Three sided bottle	800.00	<p>Around 70 years old three sided bottle</p>\r\n	20150816_120857.jpg	image/jpeg	4116090	2015-08-21 11:15:53.314175	active	2015-08-21 11:15:53.734852	2015-08-21 11:15:53.734852
45	4	22	\N	\N	Spanish Wine bottle	400.00	<p>Around 80 years old bottle</p>\r\n	20150816_120938.jpg	image/jpeg	4155296	2015-08-21 11:21:12.716974	active	2015-08-21 11:21:14.28062	2015-08-21 11:21:14.28062
29	4	22	\N	\N	Square bottle	400.00	<p>Around 60 years old Whiskey bottle</p>\r\n	20150816_115728.jpg	image/jpeg	4001195	2015-08-21 09:37:14.922906	active	2015-08-21 09:37:15.132949	2015-08-22 05:28:31.802716
11	3	20	\N	\N	Envelope	380.00	<p>Agores postal envelope of Luis.</p>\r\n	20.jpg	image/jpeg	1083518	2015-08-21 06:44:47.604472	active	2015-08-21 06:44:47.725093	2015-08-22 05:53:57.217538
46	4	22	\N	\N	Decanter 	700.00	<p>Around 100 years old decanter</p>\r\n	20150816_121051.jpg	image/jpeg	4320337	2015-08-22 06:31:18.359754	active	2015-08-22 06:31:18.802333	2015-08-22 06:31:18.802333
47	4	22	\N	\N	 Pepperment Small bottle	650.00	<p>Around 80 years old small bottle</p>\r\n	20150816_121112.jpg	image/jpeg	4334265	2015-08-22 06:37:31.212935	active	2015-08-22 06:37:31.371456	2015-08-22 06:37:31.371456
48	4	22	\N	\N	French wine black bottle	400.00	<p>Around 80 years old French wine bottle</p>\r\n	20150816_121143.jpg	image/jpeg	3852360	2015-08-22 06:41:18.045475	active	2015-08-22 06:41:18.286535	2015-08-22 06:41:18.286535
49	4	22	\N	\N	Green wine bottle	250.00	<p>Around 25 years old wine bottle</p>\r\n	20150816_121148.jpg	image/jpeg	4332363	2015-08-22 06:45:00.219189	active	2015-08-22 06:45:00.359697	2015-08-22 06:45:00.359697
51	4	22	\N	\N	Mineral water bottle	350.00	<p>Around 80 years old mineral water bottle</p>\r\n	20150816_121308.jpg	image/jpeg	4035955	2015-08-22 06:55:59.02092	active	2015-08-22 06:55:59.177317	2015-08-22 06:55:59.177317
52	4	22	\N	\N	Quarter Gallon	650.00	<p>Around 80 years old American quater bottle</p>\r\n	20150816_121327.jpg	image/jpeg	4785090	2015-08-22 06:59:27.820448	active	2015-08-22 06:59:27.97344	2015-08-22 06:59:27.97344
53	4	22	\N	\N	Medicine bottle 	350.00	<p>350ml around 75 years old American medicine bottle</p>\r\n	20150816_121430.jpg	image/jpeg	4176241	2015-08-22 07:04:05.985747	active	2015-08-22 07:04:06.35481	2015-08-22 07:04:06.35481
54	4	22	\N	\N	English Scotch bottle	350.00	<p>Around 25 years old English scotch bottle</p>\r\n	20150816_121525.jpg	image/jpeg	4527021	2015-08-22 07:12:58.271725	active	2015-08-22 07:12:58.462085	2015-08-22 07:12:58.462085
55	4	22	\N	\N	Wine bottle	200.00	<p>Sparkling wine bottle</p>\r\n	20150816_121553.jpg	image/jpeg	4408427	2015-08-22 07:15:59.689648	active	2015-08-22 07:16:00.031854	2015-08-22 07:16:00.031854
56	4	22	\N	\N	Quarter Gallon 	450.00	<p>Around 50 years old American quarter gallon</p>\r\n	20150816_121601.jpg	image/jpeg	4204168	2015-08-22 07:19:27.599899	active	2015-08-22 07:19:27.788869	2015-08-22 07:19:27.788869
57	4	22	\N	\N	Brandy bottle	750.00	<p>Around 100 years old French brandy bottle</p>\r\n	20150816_121610.jpg	image/jpeg	4148159	2015-08-22 07:23:11.482793	active	2015-08-22 07:23:11.640897	2015-08-22 07:23:11.640897
58	4	22	\N	\N	Brown bottle	500.00	<p>Around 80 years old Spanish brown bottle</p>\r\n	20150816_121621.jpg	image/jpeg	4495719	2015-08-22 07:26:35.058844	active	2015-08-22 07:26:35.215168	2015-08-22 07:26:35.215168
59	4	22	\N	\N	Whiskey bottle 	750.00	<p>Around 100 years old English hand made bottle</p>\r\n	20150816_121632.jpg	image/jpeg	4666765	2015-08-22 07:29:42.597512	active	2015-08-22 07:29:42.821328	2015-08-22 07:29:42.821328
60	4	22	\N	\N	Whiskey bottle	100.00	<p>Whiskey bottle</p>\r\n	20150816_121659.jpg	image/jpeg	4482614	2015-08-22 07:36:41.884672	active	2015-08-22 07:36:42.209153	2015-08-22 07:36:42.209153
61	4	22	\N	\N	Brandy bottle	800.00	<p>Around 100 years old French hand made bottle</p>\r\n	20150816_121716.jpg	image/jpeg	4432593	2015-08-22 07:40:02.819139	active	2015-08-22 07:40:03.291818	2015-08-22 07:40:03.291818
62	4	22	\N	\N	Hand made wine bottle	700.00	<p>Around 100 years old French wine bottle</p>\r\n	20150816_121823.jpg	image/jpeg	4550393	2015-08-22 07:43:06.824518	active	2015-08-22 07:43:07.03624	2015-08-22 07:43:07.03624
63	4	22	\N	\N	Cylindrical bottle 	500.00	<p>Around 80 years old 200ml Continental cylindrical bottle</p>\r\n	20150816_121855.jpg	image/jpeg	3524603	2015-08-22 07:46:07.175425	active	2015-08-22 07:46:07.363875	2015-08-22 07:46:07.363875
64	4	22	\N	\N	Goan porcelain Fenny bottle 	150.00	<p>Goan porcalain fenny bottle</p>\r\n	20150816_121922.jpg	image/jpeg	4386080	2015-08-22 07:55:54.613143	active	2015-08-22 07:55:54.865333	2015-08-22 07:55:54.865333
65	4	22	\N	\N	Spanish wine bottle	400.00	<p>Around 50 years old Spanish wine bottle</p>\r\n	20150816_121940.jpg	image/jpeg	4378975	2015-08-22 07:58:56.32655	active	2015-08-22 07:58:56.550869	2015-08-22 07:58:56.550869
66	4	22	\N	\N	1800ml Japanese bottle 	900.00	<p>Around 50 years old 1800ml Japanese liquor bottle</p>\r\n	20150816_121955.jpg	image/jpeg	3892819	2015-08-22 08:02:38.739126	active	2015-08-22 08:02:38.968805	2015-08-22 08:02:38.968805
67	4	22	\N	\N	Cremme bottle	400.00	<p>Around 100 years old cremme bottle</p>\r\n	20150816_122009.jpg	image/jpeg	4325647	2015-08-22 08:10:27.457234	active	2015-08-22 08:10:28.728406	2015-08-22 08:10:28.728406
68	4	22	\N	\N	French wine bottle	400.00	<p>Around 50 years old French wine bottle</p>\r\n	20150816_122036.jpg	image/jpeg	3793283	2015-08-22 08:13:20.267349	active	2015-08-22 08:13:20.481411	2015-08-22 08:13:20.481411
69	4	22	\N	\N	Fancy bottle	700.00	<p>Around 80 years old Fancy bottle</p>\r\n	20150816_122055.jpg	image/jpeg	4425011	2015-08-22 08:16:17.228509	active	2015-08-22 08:16:17.424029	2015-08-22 08:16:17.424029
70	4	22	\N	\N	Wine bottle	150.00	<p>Wine bottle</p>\r\n	20150816_122206.jpg	image/jpeg	5488657	2015-08-22 10:51:16.649624	active	2015-08-22 08:19:36.002637	2015-08-22 10:51:16.777632
71	4	22	\N	\N	Quarter Gallon 	550.00	<p>Around 50 years old American gallon</p>\r\n	20150816_122222.jpg	image/jpeg	4739041	2015-08-22 10:54:56.247573	active	2015-08-22 10:54:56.378243	2015-08-22 10:54:56.378243
72	4	22	\N	\N	Porcelain bottle	4000.00	<p>English porcalin bottle around 120 years old</p>\r\n	20150816_122355.jpg	image/jpeg	4264834	2015-08-22 11:02:49.596599	active	2015-08-22 11:02:49.76233	2015-08-22 11:02:49.76233
73	4	22	\N	\N	Jam bottle	850.00	<p>Around 100 years old English ceramic jam bottle</p>\r\n	20150816_131141.jpg	image/jpeg	4098847	2015-08-22 11:06:42.500938	active	2015-08-22 11:06:42.647993	2015-08-22 11:06:42.647993
74	4	22	\N	\N	Small jam bottle	700.00	<p>Around 100 years old English ceramic jam bottle</p>\r\n	20150816_131302.jpg	image/jpeg	4417910	2015-08-22 11:09:50.728619	active	2015-08-22 11:09:50.877964	2015-08-22 11:09:50.877964
75	4	23	\N	\N	English Kettle	750.00	<p>Around 100 years old English kettle</p>\r\n	20150816_131315.jpg	image/jpeg	4415400	2015-08-22 11:14:08.595033	active	2015-08-22 11:14:08.737233	2015-08-22 11:14:08.737233
76	4	22	\N	\N	Ceramic bottle	1300.00	<p>Around 120 years old English ceramic bottle</p>\r\n	20150816_161740.jpg	image/jpeg	2443263	2015-08-22 11:16:31.200553	active	2015-08-22 11:16:31.343578	2015-08-22 11:16:31.343578
77	4	29	\N	\N	Stoneware pot	400.00	<p>Around 152 to 200 years old Chinese stoneware pot with clip</p>\r\n	20150816_120429.jpg	image/jpeg	4032697	2015-08-22 11:26:03.608268	active	2015-08-22 11:26:03.98465	2015-08-22 11:26:03.98465
78	4	22	\N	\N	10 Litters English ceramic bottle	1000.00	<p>10 litters English ceramic bottle in very good condition</p>\r\n	20150816_120516.jpg	image/jpeg	4972800	2015-08-24 05:20:40.138311	active	2015-08-24 05:20:40.280633	2015-08-24 05:20:40.280633
79	4	22	\N	\N	24 litters Carbo/Garafao	1000.00	<p>These are 100 to 250 years old with different colors and their prices are different from how old they are and their condition</p>\r\n	20150816_120618.jpg	image/jpeg	3368046	2015-08-24 05:28:55.678957	active	2015-08-24 05:28:55.81598	2015-08-24 05:28:55.81598
89	4	41	\N	\N	English hand painted  blue and white soup plate	1500.00	<p>Around 170 years old hand made and hand painted plate</p>\r\n	done9.jpg	image/jpeg	3253769	2015-08-24 06:33:26.237397	active	2015-08-24 06:33:27.694754	2015-08-28 05:14:06.588631
83	4	41	\N	\N	English multicolored plate 	750.00	<p>Around 100 years old hand painted English multicolored plate</p>\r\n	done3.jpg	image/jpeg	2941050	2015-08-24 05:56:50.314154	active	2015-08-24 05:56:50.809577	2015-08-28 05:19:50.773093
82	4	41	\N	\N	Hayasi - Kutani Japanese quarter plate 	850.00	<p>Around 100 years old stone and gold painted Japnase quarter plate</p>\r\n	done2.jpg	image/jpeg	2745904	2015-08-24 05:53:33.185715	active	2015-08-24 05:53:33.482069	2015-08-28 05:17:38.809611
92	4	21	\N	\N	Japanese triangular quarter plate	200.00	<p>Around 80 years old Japanese plate</p>\r\n	done12.jpg	image/jpeg	2869983	2015-08-24 06:49:34.576539	active	2015-08-24 06:49:34.801992	2015-08-24 06:49:34.801992
90	4	41	\N	\N	English hand painted  light merun soup plate 	1500.00	<p>Around 170 years old hand painted and hand made plate</p>\r\n	done10.jpg	image/jpeg	3456430	2015-08-24 06:41:51.860119	active	2015-08-24 06:41:52.055615	2015-08-28 05:18:26.273385
86	4	41	\N	\N	Japanese Multicolored plate 	250.00	<p>Around 100 years old Japanese multicolored plate</p>\r\n	done6.jpg	image/jpeg	2755910	2015-08-24 06:14:37.360114	active	2015-08-24 06:14:37.501166	2015-08-28 05:21:42.550074
87	4	41	\N	\N	Multicolored Japanese small plate 	700.00	<p>Hand painted and hand made Japanese plate</p>\r\n	done7.jpg	image/jpeg	2992609	2015-08-24 06:23:52.883391	active	2015-08-24 06:23:53.05249	2015-08-28 05:22:28.862504
88	4	41	\N	\N	J & G Makin multicolored quarter plate 	350.00	<p>Around 80 years old multicolored plate</p>\r\n	done8.jpg	image/jpeg	2615381	2015-08-24 06:30:16.553588	active	2015-08-24 06:30:16.913543	2015-08-28 05:23:11.213169
84	4	41	\N	\N	J & G Makin Quarter plate 	850.00	<p>Around 100 years old blue and white quarter plate</p>\r\n	done4.jpg	image/jpeg	2995743	2015-08-24 06:01:35.197434	active	2015-08-24 06:01:35.533367	2015-08-28 05:23:59.791082
91	4	41	\N	\N	English plate 	1650.00	<p>Around 120 years old blue and white English plate</p>\r\n	done11.jpg	image/jpeg	2853439	2015-08-24 06:46:38.845522	active	2015-08-24 06:46:39.17243	2015-08-28 05:24:47.102037
93	4	41	\N	\N	Ceylon bird soup plate 	900.00	<p>Around 170 years old English made soup plate called ceylon bird which was very popular in Goa</p>\r\n	done13.jpg	image/jpeg	3221878	2015-08-24 06:57:35.85496	active	2015-08-24 06:57:36.016057	2015-08-28 05:26:46.043499
94	4	41	\N	\N	J. Fryer & Son plate	650.00	<p>Around 80 years old gold and multicolored painted plate&nbsp;</p>\r\n	done14.jpg	image/jpeg	2955864	2015-08-24 07:00:49.905671	active	2015-08-24 07:00:50.074318	2015-08-28 09:57:35.152744
95	4	41	\N	\N	Ceylon bird plate 	800.00	<p>Around 170 years old English made plate called ceylon bird which was very popular&nbsp;in Goa</p>\r\n	done15.jpg	image/jpeg	3265562	2015-08-24 07:05:05.09672	active	2015-08-24 07:05:05.255423	2015-08-28 09:58:24.372718
96	4	41	\N	\N	The Iron Stone English plate 	300.00	<p>Around 80 years old plate and their prices are different according to their condition</p>\r\n	done16.jpg	image/jpeg	2788935	2015-08-24 07:09:28.610712	active	2015-08-24 07:09:28.758396	2015-08-28 09:59:12.842985
85	4	41	\N	\N	Y T K Japanese Saucer 	300.00	<p>Multicolored Y T K &nbsp;Japanese plate</p>\r\n	done5.jpg	image/jpeg	2836648	2015-08-24 06:09:24.511291	active	2015-08-24 06:09:24.683581	2015-08-28 05:13:03.324407
80	4	41	\N	\N	Shelley England plate 	650.00	<p>Around 100 years old Shelley England plate</p>\r\n	done.jpg	image/jpeg	3103075	2015-08-24 05:37:16.617406	active	2015-08-24 05:37:16.772189	2015-08-28 10:01:08.460579
104	4	21	\N	\N	Scenery Saucer 	250.00	<p>Around 100 years old Japanese scenery saucer</p>\r\n	done25.jpg	image/jpeg	2772846	2015-08-24 09:25:21.966167	active	2015-08-24 09:25:22.166114	2015-08-28 10:07:35.471573
99	4	41	\N	\N	Double Phoenix N.K.T Iron Stone light  brown soup plate	400.00	<p>Around 100 years old English designed plates made to order in Japan which were popular in Goa</p>\r\n	done20.jpg	image/jpeg	3252732	2015-08-24 08:03:58.561232	active	2015-08-24 08:03:58.72149	2015-08-28 10:10:40.616037
98	4	41	\N	\N	Double Phoenix N.K.T Iron Stone dark  brown soup plate 	400.00	<p>Around 100 years old English designed plates made to order in Japan which were popular in Goa</p>\r\n	done19.jpg	image/jpeg	3067257	2015-08-24 08:00:25.223341	active	2015-08-24 08:00:25.491998	2015-08-28 10:08:50.934291
97	4	41	\N	\N	Double Phoenix N.K.T Iron Stone light green soup plate 	400.00	<p>Around 100 years old English designed plates made to order in Japan which were popular in Goa</p>\r\n	done17.jpg	image/jpeg	3106007	2015-08-24 07:16:20.453197	active	2015-08-24 07:16:20.595103	2015-08-28 10:09:35.303244
100	4	41	\N	\N	Dutch hand painted soup plate	1500.00	<p>Around 125 years old hand painted plate</p>\r\n	done21.jpg	image/jpeg	2846749	2015-08-24 08:07:07.744643	active	2015-08-24 08:07:07.937457	2015-08-28 10:11:33.464439
101	4	41	\N	\N	Gaint Langenthal Swiss plate	3500.00	<p>Around 100 years old gaint swiss plate</p>\r\n	done22.jpg	image/jpeg	2716480	2015-08-24 08:10:32.866255	active	2015-08-24 08:10:33.500006	2015-08-28 10:12:12.83709
105	4	21	\N	\N	Willow quarte plate 	750.00	<p>Around 100 years old Coplaind English quarter plate</p>\r\n	done26.jpg	image/jpeg	3216052	2015-08-24 09:29:56.454902	active	2015-08-24 09:29:56.642579	2015-08-28 10:12:55.553421
106	4	41	\N	\N	Willow plate 	2000.00	<p>Qround 150 years old Coplaind English willow pattern plate</p>\r\n	done27.jpg	image/jpeg	3407190	2015-08-24 09:33:57.872984	active	2015-08-24 09:33:58.030796	2015-08-28 10:13:50.20572
111	4	41	\N	\N	Japanese saucer	300.00	<p>Around 80 years old Japanese saucer</p>\r\n	done32.jpg	image/jpeg	2970769	2015-08-24 10:24:05.06675	active	2015-08-24 10:24:05.223002	2015-08-28 10:14:42.507017
118	4	21	\N	\N	Blue and White English hand painted plate (xyz/abc)	900.00	<p>Around 180 years old hand painted English plate which was popular in Goa too</p>\r\n	done39.jpg	image/jpeg	3683401	2015-08-25 05:06:10.897555	active	2015-08-25 05:06:11.037151	2015-08-25 05:06:11.037151
120	4	21	\N	\N	Double Phoenix N.K.T Iron Stone gray plate	400.00	<p>Around 100 years old English designed plates made to order in Japan which was popular in Goa</p>\r\n	done41.jpg	image/jpeg	2835332	2015-08-25 05:14:30.36671	active	2015-08-25 05:14:30.690548	2015-08-25 05:14:30.690548
121	4	21	\N	\N	Blue and White English quarter plate (xyz/abc)	750.00	<p>W. Adams &amp; Company quarter English hand painted plate made in Sandringhum</p>\r\n	done42.jpg	image/jpeg	2594769	2015-08-25 05:19:04.894307	active	2015-08-25 05:19:05.016641	2015-08-25 05:19:05.016641
122	4	21	\N	\N	Multicolored Japanese quarter plate (xyz/abc)	600.00	<p>Around 80 yeras old Japanese plate</p>\r\n	done43.jpg	image/jpeg	2665892	2015-08-25 05:22:24.565445	active	2015-08-25 05:22:24.698689	2015-08-25 05:22:24.698689
123	4	21	\N	\N	Japanese serving plate (xyz/abc) 	900.00	<p>Around 80 years old Blue and White designed plate which was popular in Goa</p>\r\n	done44.jpg	image/jpeg	2222570	2015-08-25 05:31:53.129297	active	2015-08-25 05:31:53.256219	2015-08-25 05:31:53.256219
124	4	21	\N	\N	Japanese serving plate (xyz/abc) 	1000.00	<p>Around 80 years old Blue and White designed plate which was popular in Goa</p>\r\n	done45.jpg	image/jpeg	2272716	2015-08-25 05:35:18.38444	active	2015-08-25 05:35:18.541713	2015-08-25 05:35:18.541713
125	4	21	\N	\N	English Willow plate (xyz/abc)	400.00	<p>Around 100 years old blue and white pattern plate which was popular in Goa and their prices are according to their condition</p>\r\n	done46.jpg	image/jpeg	2751793	2015-08-25 05:44:49.76824	active	2015-08-25 05:44:49.902478	2015-08-25 05:44:49.902478
126	4	21	\N	\N	Japanese Silver hand painted soup plate (xyz/abc) 	1000.00	<p>Around 80 years old Japanese silver hand painted plate</p>\r\n	done47.jpg	image/jpeg	2373293	2015-08-25 05:47:49.842895	active	2015-08-25 05:47:49.976697	2015-08-25 05:47:49.976697
127	4	21	\N	\N	English hand painted  gray and white soup plate (xyz.abc)	1500.00	<p>Around 170 years old hand made and hand painted plate</p>\r\n	done48.jpg	image/jpeg	2697329	2015-08-25 05:51:17.245908	active	2015-08-25 05:51:17.735994	2015-08-25 05:51:17.735994
128	4	21	\N	\N	Macau hand painted plate (xyz/abc)	2500.00	<p>Around 200 to 250 years old Macau hand painted plate</p>\r\n	done49.jpg	image/jpeg	2577330	2015-08-25 05:54:20.798289	active	2015-08-25 05:54:21.022461	2015-08-25 05:54:21.022461
129	4	21	\N	\N	Macau hand painted plate (xyz/abc)	3000.00	<p>Around 150 years old multicolored Macau plate&nbsp;</p>\r\n	done50.jpg	image/jpeg	3021032	2015-08-25 05:57:11.130992	active	2015-08-25 05:57:11.393578	2015-08-25 05:57:11.393578
130	4	21	\N	\N	Macau stoneware grayish plate (xyz/abc)	1000.00	<p>Around 200 to 350 years old Macau stoneware infrared ceramic plates</p>\r\n	done51.jpg	image/jpeg	2541265	2015-08-25 06:07:51.530297	active	2015-08-25 06:07:51.664673	2015-08-25 06:07:51.664673
131	4	21	\N	\N	Top and Bottom hand painted Macau plate (xyz/abc)	2500.00	<p>Around 152 years old Macau quarter plate</p>\r\n	done52.jpg	image/jpeg	2378733	2015-08-25 06:11:29.865341	active	2015-08-25 06:11:29.997856	2015-08-25 11:18:02.441799
102	4	21	\N	\N	Dragon plate 	1500.00	<p>Around 80 years old hand painted Dragon plate</p>\r\n	done23.jpg	image/jpeg	3225260	2015-08-24 08:13:03.081932	active	2015-08-24 08:13:03.231635	2015-08-28 10:00:12.345017
81	4	41	\N	\N	Multicolored Macau plate	3500.00	<p>Multicolore hand made stone and gold painted Macau quarter plate</p>\r\n	done1.jpg	image/jpeg	3093890	2015-08-24 05:47:23.788853	active	2015-08-24 05:47:23.950684	2015-08-28 10:02:04.290406
107	4	41	\N	\N	Big oval Serving plate 	1200.00	<p>Around 60 years old English plate made to order from China</p>\r\n	done28.jpg	image/jpeg	2463386	2015-08-24 09:42:33.349382	active	2015-08-24 09:42:33.540747	2015-08-28 10:02:57.975027
108	4	41	\N	\N	English quarter plate 	750.00	<p>Around 150 years old hand painted English quarter plate</p>\r\n	done29.jpg	image/jpeg	2432700	2015-08-24 09:45:51.550296	active	2015-08-24 09:45:51.733539	2015-08-28 10:03:51.193212
109	4	41	\N	\N	B & C English serving plate 	2500.00	<p>Around 150 years old English serving plate</p>\r\n	done30.jpg	image/jpeg	3479792	2015-08-24 09:50:20.304746	active	2015-08-24 09:50:20.4772	2015-08-28 10:04:47.623826
110	4	21	\N	\N	Japanese Saucer 	300.00	<p>Around 80 years old Japnase saucer</p>\r\n	done31.jpg	image/jpeg	3114831	2015-08-24 09:53:19.750151	active	2015-08-24 09:53:19.907313	2015-08-28 10:06:17.711248
103	4	21	\N	\N	Gold painted plate 	1800.00	<p>Around 80 years old Japanase gold and stone painted plate</p>\r\n	done24.jpg	image/jpeg	3111481	2015-08-24 09:21:52.921238	active	2015-08-24 09:21:53.251141	2015-08-28 10:07:01.158658
112	4	41	\N	\N	Japanese Small plate	300.00	<p>Around 8 years old Japanese small plate</p>\r\n	done33.jpg	image/jpeg	3101200	2015-08-24 10:27:05.480906	active	2015-08-24 10:27:05.681468	2015-08-28 10:15:41.589167
113	4	41	\N	\N	Cream Petal Saucer 	250.00	<p>Around 80 years old English saucer</p>\r\n	done34.jpg	image/jpeg	2724765	2015-08-24 10:33:12.23576	active	2015-08-24 10:33:12.450707	2015-08-28 10:16:31.789404
114	4	41	\N	\N	Japanese saucer 	400.00	<p>Around 150 years old hand made amd hand painted irregular in shape saucer</p>\r\n	done35.jpg	image/jpeg	2738540	2015-08-24 10:36:48.646924	active	2015-08-24 10:36:48.862299	2015-08-28 10:17:21.695942
115	4	41	\N	\N	Blue and White English soup plate 	400.00	<p>Around 120 years old hand painted plates which were very popular in Goa</p>\r\n	done36.jpg	image/jpeg	3389150	2015-08-24 10:40:35.269405	active	2015-08-24 10:40:35.435469	2015-08-28 10:18:14.30765
116	4	41	\N	\N	Macau stoneware greenish plate 	1000.00	<p>Around 200 to 350 years old Macau infrared ceramic plates and their prices are different according to their condition</p>\r\n	done37.jpg	image/jpeg	3040413	2015-08-24 10:51:22.185861	active	2015-08-24 10:51:22.509633	2015-08-28 10:18:59.909924
117	4	41	\N	\N	Macau stoneware gray plate	1000.00	<p>Around 200 to 350 years old Macau infrared plates and their prices are different according to their condition</p>\r\n	done38.jpg	image/jpeg	2845144	2015-08-24 10:54:33.422798	active	2015-08-24 10:54:33.732193	2015-08-28 10:19:57.215807
135	4	21	\N	\N	Macau hand painted Dragon /Rice design half plate (xyz/abc)	2500.00	<p>Around 70 years old Macau half plate</p>\r\n	done56.jpg	image/jpeg	2713349	2015-08-25 06:52:03.356469	active	2015-08-25 06:52:03.562609	2015-08-25 06:52:03.562609
136	4	21	\N	\N	Macau hand painted half plate (xyz/abc)	2000.00	<p>Around 150 years old Macau hand painted half plate</p>\r\n	done57.jpg	image/jpeg	2582711	2015-08-25 06:54:39.314257	active	2015-08-25 06:54:39.476677	2015-08-25 06:54:39.476677
137	4	21	\N	\N	Macau hand painted half plate (xyz/abc)	2500.00	<p>Around 200 to 300 years old Macau hand painted half plate</p>\r\n	done58.jpg	image/jpeg	2429535	2015-08-25 07:09:09.513034	active	2015-08-25 07:09:09.685237	2015-08-25 07:09:09.685237
210	7	\N	\N	\N	Coconut Shell	250.00	<p>Old Goan Coconut Shell</p>\r\n	20150816_163637-1.jpg	image/jpeg	2915105	2015-08-26 11:09:07.936684	active	2015-08-26 11:09:08.106129	2015-08-26 11:09:08.106129
138	4	21	\N	\N	Double Phoenix N.K.T Iron Stone dark  green soup plate (xyz/abc)	400.00	<p>Around 100 years old English designed plates made to order in Japan which were popular in Goa</p>\r\n	done59.jpg	image/jpeg	2575716	2015-08-25 07:13:56.300526	active	2015-08-25 07:13:56.44714	2015-08-25 07:13:56.44714
139	4	21	\N	\N	English soup plate (xyz.abc)	300.00	<p>Around 80 years old English soup plate and prices are according to their condition</p>\r\n	done60.jpg	image/jpeg	2850242	2015-08-25 07:17:18.957786	active	2015-08-25 07:17:19.128484	2015-08-25 07:17:19.128484
140	4	21	\N	\N	English Willow plate (xyz/abc)	400.00	<p>Around 100 years old blue and white pattern plate which was popular in Goa and their prices are according to their condition</p>\r\n	done61.jpg	image/jpeg	2823212	2015-08-25 07:23:13.088108	active	2015-08-25 07:23:13.351661	2015-08-25 07:23:13.351661
144	4	21	\N	\N	Japanese small soup bowl  (xyz/abc) 	300.00	<p>Around 100 years old Japanese multicolor small soup bowl</p>\r\n	done65.jpg	image/jpeg	2498570	2015-08-25 07:47:42.45355	active	2015-08-25 07:47:42.599507	2015-08-25 07:47:42.599507
145	4	21	\N	\N	English half plate (xyz.abc)	400.00	<p>Around 75 years old English green color half plate&nbsp;</p>\r\n	done66.jpg	image/jpeg	2454166	2015-08-25 07:50:25.68099	active	2015-08-25 07:50:25.839897	2015-08-25 07:50:25.839897
119	4	21	\N	\N	Hayasi - Kutani plate (xyz/abc)	700.00	<p>Gold and hand painted plates made to order by Mr.Perera in Goa</p>\r\n	done40.jpg	image/jpeg	2784782	2015-08-25 05:09:42.379408	active	2015-08-25 05:09:42.50182	2015-08-25 07:53:02.489424
133	4	21	\N	\N	Holland hand painted quarter plate (xyz/abc) 	500.00	<p>Around 100 years old Scoiete Ceramique plate</p>\r\n	done54.jpg	image/jpeg	2626552	2015-08-25 06:39:09.838387	active	2015-08-25 06:39:10.143951	2015-08-25 07:54:34.188994
142	4	21	\N	\N	American plate (xyz/abc)	700.00	<p>Around 100 years old Semi Vitdhous multicolored flowers plate</p>\r\n	done63.jpg	image/jpeg	2425393	2015-08-25 07:41:51.330364	active	2015-08-25 07:41:51.459494	2015-08-25 07:55:47.576053
143	4	21	\N	\N	Indian half plate (xyz/abc)	300.00	<p>Around 50 years old Bengal pottaries Indian plate</p>\r\n	done64.jpg	image/jpeg	2371285	2015-08-25 07:44:31.375788	active	2015-08-25 07:44:31.537475	2015-08-25 07:56:31.626614
146	4	21	\N	\N	English half plate (xyz.abc)	750.00	<p>Around 80 years old Giardiniera English half plate</p>\r\n	done67.jpg	image/jpeg	2558028	2015-08-25 08:13:11.307241	active	2015-08-25 08:13:11.457246	2015-08-25 08:13:11.457246
147	4	21	\N	\N	Japanese soup plate (xyz/abc) 	300.00	<p>Around 50 years old Japanese soup plate</p>\r\n	done68.jpg	image/jpeg	2399868	2015-08-25 08:42:52.826912	active	2015-08-25 08:42:52.966515	2015-08-25 08:42:52.966515
148	4	21	\N	\N	Japanese plate (xyz/abc) 	650.00	<p>Around 60 years old sone multicolor Japanese plate</p>\r\n	done69.jpg	image/jpeg	2374797	2015-08-25 08:46:12.447066	active	2015-08-25 08:46:12.597222	2015-08-25 08:46:12.597222
149	4	21	\N	\N	English blue and white plate	800.00	<p>Around 150 years old English hand painted plate</p>\r\n	done70.jpg	image/jpeg	2587863	2015-08-25 08:49:31.391997	active	2015-08-25 08:49:31.539109	2015-08-25 08:49:31.539109
150	4	21	\N	\N	English soup plate (xyz/abc)	600.00	<p>Around 80 years old English soup plate</p>\r\n	done71.jpg	image/jpeg	2367785	2015-08-25 08:52:17.193601	active	2015-08-25 08:52:17.47372	2015-08-25 08:52:17.47372
151	4	21	\N	\N	English soup plate (xyz/abc)	650.00	<p>Around 100 years old unicorm English soup plate</p>\r\n	done72.jpg	image/jpeg	2439319	2015-08-25 08:55:30.312357	active	2015-08-25 08:55:30.469488	2015-08-25 08:55:30.469488
152	4	21	\N	\N	Japanese half plate (xyz/abc) 	400.00	<p>Around 80 years old Japanese half plate</p>\r\n	done73.jpg	image/jpeg	2282301	2015-08-25 09:26:27.248442	active	2015-08-25 09:26:27.432534	2015-08-25 09:26:27.432534
153	4	21	\N	\N	Japanese hand painted plate (xyz/abc)	700.00	<p>Around 60 years old Japanese plate</p>\r\n	done74.jpg	image/jpeg	2583373	2015-08-25 09:29:00.696118	active	2015-08-25 09:29:01.035415	2015-08-25 09:43:36.329941
154	4	21	\N	\N	English green plate (xyz/abc)	500.00	<p>Around 50 years old English plate</p>\r\n	done75.jpg	image/jpeg	2421796	2015-08-25 09:32:59.103144	active	2015-08-25 09:32:59.269933	2015-08-25 09:45:41.079053
155	4	21	\N	\N	Hand painted Burmese plate (xyz/abc)	500.00	<p>Around 50 years old hand painted plate</p>\r\n	done76.jpg	image/jpeg	2948307	2015-08-25 09:35:43.94043	active	2015-08-25 09:35:44.099208	2015-08-25 09:47:43.349102
156	4	21	\N	\N	Indian plate (xyz/abc) 	400.00	<p>More than 100 years old Bengal pottaries Indian plate</p>\r\n	done77.jpg	image/jpeg	2406423	2015-08-25 09:38:29.467221	active	2015-08-25 09:38:29.638521	2015-08-25 09:50:53.762985
157	4	21	\N	\N	Japanese half plate (xyz/abc) 	500.00	<p>Around 80 years old Japanese multicolor half plate</p>\r\n	done78.jpg	image/jpeg	2885059	2015-08-25 09:55:16.141698	active	2015-08-25 09:55:16.362221	2015-08-25 09:55:16.362221
158	4	21	\N	\N	Burmese hand painted soup plate	400.00	<p>Around 80 years old hand painted plate</p>\r\n	done79.jpg	image/jpeg	2807615	2015-08-25 10:06:38.90933	active	2015-08-25 10:06:39.090227	2015-08-25 10:06:39.090227
159	4	21	\N	\N	English half plate (xyz/abc)	400.00	<p>Around 60 years old English half plate with round stand</p>\r\n	done80.jpg	image/jpeg	2903883	2015-08-25 10:09:17.599522	active	2015-08-25 10:09:17.760392	2015-08-25 10:09:17.760392
160	4	21	\N	\N	English soup plate (xyz/abc)	650.00	<p>Around 80 years old iron stoneware English soup plate</p>\r\n	done81.jpg	image/jpeg	2733197	2015-08-25 10:12:00.74101	active	2015-08-25 10:12:00.913833	2015-08-25 10:12:00.913833
161	4	21	\N	\N	English multicolor plate (xyz/abc)	650.00	<p>Around 80 years old B &amp; H Ribbon English multicolor plate</p>\r\n	done82.jpg	image/jpeg	2916155	2015-08-25 10:15:07.875543	active	2015-08-25 10:15:08.043509	2015-08-25 10:15:08.043509
162	4	21	\N	\N	Multicolored English plate (xyz/abc)	800.00	<p>Around 80 years old Chelsea Jhonson Brothers English multicolor plate</p>\r\n	done83.jpg	image/jpeg	2401276	2015-08-25 10:18:34.002358	active	2015-08-25 10:18:34.198884	2015-08-25 10:18:34.198884
163	4	21	\N	\N	Japanese hand painted multicolored soup plate (xyz/abc) 	750.00	<p>Around 60 years old Japanese hand painted Mutani Chaina soup plate</p>\r\n	done84.jpg	image/jpeg	2481575	2015-08-25 10:32:14.75349	active	2015-08-25 10:32:14.926174	2015-08-25 10:33:21.246894
164	4	21	\N	\N	Dragon hand painted quarter plate (xyz/abc)	650.00	<p>Around 60 years old Dragon blue and white rice plate</p>\r\n	done85.jpg	image/jpeg	2494356	2015-08-25 10:36:54.960827	active	2015-08-25 10:36:55.12697	2015-08-25 10:36:55.12697
166	4	21	\N	\N	Geisha quarter plate (xyz/abc) 	500.00	<p>Around 50 years old Chinese multicolor quarter plate</p>\r\n	done87.jpg	image/jpeg	2473698	2015-08-25 10:42:32.208637	active	2015-08-25 10:42:32.445456	2015-08-25 10:42:32.445456
167	4	21	\N	\N	Hand painted Japanese half plate (xyz/abc)	400.00	<p>Around 100 years old hand painted multicolor Japanese plate</p>\r\n	done88.jpg	image/jpeg	2410323	2015-08-25 10:46:10.509325	active	2015-08-25 10:46:10.770849	2015-08-25 10:46:10.770849
168	4	21	\N	\N	English plate (xyz/abc)	1000.00	<p>Around 60 years old House of Parliement London half English plate</p>\r\n	done90.jpg	image/jpeg	2600400	2015-08-25 11:03:36.668705	active	2015-08-25 11:03:36.840797	2015-08-25 11:03:36.840797
132	4	21	\N	\N	Top and Bottom hand painted Macau plate (xyz/abc)	3500.00	<p>Around 200 to 250 years old Macau hand painted plate</p>\r\n	done53.jpg	image/jpeg	3376588	2015-08-25 06:35:46.040635	active	2015-08-25 06:35:46.185993	2015-08-25 11:16:59.195322
165	4	21	\N	\N	English soup plate (xyz.abc)	800.00	<p>Around 80 years old Crown Devon English soup plate</p>\r\n	done86.jpg	image/jpeg	2427318	2015-08-25 10:39:30.609767	active	2015-08-25 10:39:30.767761	2015-08-26 10:16:10.799146
205	11	\N	\N	\N	Candle Stand 	850.00	<p>Around 50 years old Portuguese candle stand with glass</p>\r\n	20150816_162622-1.jpg	image/jpeg	2638753	2015-08-26 10:44:15.634653	active	2015-08-26 10:44:15.916508	2015-08-26 10:44:15.916508
206	4	25	\N	\N	English colored Terrien	3500.00	<p>Around 125 years old English terrien</p>\r\n	20150816_162921.jpg	image/jpeg	2806272	2015-08-26 10:55:07.389623	active	2015-08-26 10:55:07.577833	2015-08-26 10:55:07.577833
169	4	21	\N	\N	Japanese hand painted half plate (xyz/abc) 	700.00	<p>Around 60 years old Japanese multicolored hand painted half plate</p>\r\n	done91.jpg	image/jpeg	2945918	2015-08-25 11:07:48.615428	active	2015-08-25 11:07:48.781159	2015-08-25 11:07:48.781159
170	\N	\N	\N	\N	English plate (xyz/abc)	400.00	<p>Around 50 years old English multicolored plate</p>\r\n	done92.jpg	image/jpeg	2631329	2015-08-25 11:10:36.336953	active	2015-08-25 11:10:36.506428	2015-08-25 11:10:36.506428
171	4	21	\N	\N	Nagoya China hand painted half plate	400.00	<p>Around 50 years old hand painted plate</p>\r\n	done93.jpg	image/jpeg	2230491	2015-08-25 11:13:11.372808	active	2015-08-25 11:13:11.549202	2015-08-25 11:13:11.549202
141	4	21	\N	\N	English  blue and white plate (xyz.abc)	500.00	<p>Around 100 years old English plate from Bristol this was popular in Goa&nbsp;</p>\r\n	done62.jpg	image/jpeg	2735050	2015-08-25 07:38:44.979124	active	2015-08-25 07:38:45.121782	2015-08-25 11:19:58.115697
172	4	21	\N	\N	English  blue and white quarter plate (xyz.abc)	200.00	<p>Around 80 years old blue and white English quarter and half plates which was popular in Goa</p>\r\n	done89.jpg	image/jpeg	1643723	2015-08-26 05:57:14.372573	active	2015-08-26 05:57:14.598691	2015-08-26 05:57:14.598691
178	4	26	\N	\N	Macau wall hanging with flower and leaf painting	1300.00	<p>Macau made wall hanging with hand painted design (in very good condition)&nbsp;</p>\r\n	20150816_125232-1.jpg	image/jpeg	3001046	2015-08-26 06:48:24.83364	active	2015-08-26 06:48:25.231316	2015-08-26 06:48:25.231316
214	4	23	\N	\N	Japanese Medium Teapot 	950.00	<p>Around 100 years old Japanese multicolored medium teapot</p>\r\n	20150816_124526-1.jpg	image/jpeg	2808033	2015-08-27 05:29:56.612263	active	2015-08-27 05:29:56.735711	2015-08-27 05:29:56.735711
179	4	26	\N	\N	Macau Wall hanging with hand painted boukey design	1400.00	<p>Macau made multicolored wall hanging with hand painted design (in very good condition)</p>\r\n	20150816_125507-1.jpg	image/jpeg	3045726	2015-08-26 06:56:12.068964	active	2015-08-26 06:56:12.290982	2015-08-26 06:56:12.290982
180	4	26	\N	\N	 Tall Macau Wall hanging with hand painted design	600.00	<p>Macau made hand painted design wall hangings (age crack)</p>\r\n	dne3.jpg	image/jpeg	2613020	2015-08-26 07:04:53.675296	active	2015-08-26 07:04:53.981792	2015-08-26 07:04:53.981792
181	\N	26	\N	\N	Himalayan hand painted wall hanging	700.00	<p>Around 100 years old Himalayan wall hanging</p>\r\n	dne4.jpg	image/jpeg	2661482	2015-08-26 07:08:15.410925	active	2015-08-26 07:08:15.642758	2015-08-26 07:08:15.642758
173	4	26	\N	\N	Macau Bird Wall hanging	650.00	<p>Around 300 years old porcalain Macau made hand painted a bird seating on fruits vaz (wings slightly damaged)</p>\r\n	20150816_125153-1.jpg	image/jpeg	3126122	2015-08-26 06:10:42.755025	active	2015-08-26 06:10:43.119088	2015-08-26 07:10:29.234238
174	4	26	\N	\N	Macau Fruits Wall hanging 	400.00	<p>Around 300 years old porcalain Macau made hand painted fruits wall hanging (restored)</p>\r\n	red_fruits.jpg	image/jpeg	2923019	2015-08-26 06:14:56.487234	active	2015-08-26 06:14:56.664864	2015-08-26 07:11:51.564976
175	4	26	\N	\N	Macau Bird Wall hanging	750.00	<p>Around 300 years old porcalain Macau made hand painted a bird seating on fruits vase (restored)</p>\r\n	yello.jpg	image/jpeg	3322440	2015-08-26 06:22:59.918582	active	2015-08-26 06:23:00.093635	2015-08-26 07:12:54.382079
176	4	26	\N	\N	Macau Bird Wall hanging	1500.00	<p>Around 300 years old porcalain Macau made hand painted a bird seating on fruits vase (in very good condition)</p>\r\n	white_green_fruits.jpg	image/jpeg	3341174	2015-08-26 06:27:27.628189	active	2015-08-26 06:27:27.823233	2015-08-26 07:13:51.392699
177	4	26	\N	\N	Macau Bird Wall hanging	1700.00	<p>Around 300 years old porcalain Macau made hand painted a bird seating on fruits vase (in very good condition)</p>\r\n	yello_bananas.jpg	image/jpeg	3306858	2015-08-26 06:30:42.87535	active	2015-08-26 06:30:43.212581	2015-08-26 07:14:46.269996
182	4	31	\N	\N	Indian Small porcelain vase 	350.00	<p>Newly made Indian porcelain vase</p>\r\n	20150816_131106-1.jpg	image/jpeg	2462214	2015-08-26 07:29:24.369832	active	2015-08-26 07:29:25.107052	2015-08-26 07:29:25.107052
183	4	31	\N	\N	Himalayan hand painted ceramic small vase	300.00	<p>Around 50 years old Nepal made vase</p>\r\n	20150816_173523-1.jpg	image/jpeg	2541381	2015-08-26 07:32:58.270538	active	2015-08-26 07:32:58.893465	2015-08-26 07:32:58.893465
184	4	31	\N	\N	Himalayan made small square and hand painted vase 	350.00	<p>Around 50 years old Nepal made vase with shape of house</p>\r\n	20150816_175105-1.jpg	image/jpeg	3105394	2015-08-26 07:37:28.798512	active	2015-08-26 07:37:29.310415	2015-08-26 07:37:29.310415
185	4	28	\N	\N	Small Japanese flower pot 	250.00	<p>Japanese made porcelain and plastic flower pot</p>\r\n	20150816_164604-1.jpg	image/jpeg	3166410	2015-08-26 07:43:09.549897	active	2015-08-26 07:43:09.867011	2015-08-26 07:43:09.867011
186	4	31	\N	\N	Japanese made porcelain vase	750.00	<p>Aund 80 years old Japanese made porcelain basket shape vase</p>\r\n	20150816_163454-1.jpg	image/jpeg	2430352	2015-08-26 07:46:39.718923	active	2015-08-26 07:46:40.135106	2015-08-26 07:46:40.135106
187	4	26	\N	\N	Japanese wall hanger	1200.00	<p>Around 100 years old Japanese wall hanger for cloths with hand painted design</p>\r\n	20150816_162533-1.jpg	image/jpeg	2646837	2015-08-26 08:41:17.378733	active	2015-08-26 08:41:17.506346	2015-08-26 08:41:17.506346
188	10	\N	\N	\N	Eastern Big watch	2000.00	<p>Around 100 years old Bommay wooden Smith 8 day Eastern big station watch (in non working condition)</p>\r\n	20150816_163234-1.jpg	image/jpeg	2686648	2015-08-26 09:13:03.795662	active	2015-08-26 09:13:03.952893	2015-08-26 09:13:03.952893
189	10	\N	\N	\N	Arabic Small colck	400.00	<p>Around 30 years old Arabic small watch with stand (non working)</p>\r\n	20150816_163606-1.jpg	image/jpeg	2818863	2015-08-26 09:16:42.22317	active	2015-08-26 09:16:42.358831	2015-08-26 09:16:42.358831
190	10	\N	\N	\N	Hong Kong made Small clock 	400.00	<p>Around 50 years old Hong Kong made small clock (non working)</p>\r\n	20150816_163716-1.jpg	image/jpeg	3062769	2015-08-26 09:20:55.815952	active	2015-08-26 09:20:56.136253	2015-08-26 09:20:56.136253
191	10	\N	\N	\N	Portuguese Pocket Watch 	800.00	<p>Around 100 years old Portuguese Casa Coinbra pocket watch</p>\r\n	20150816_164016-1.jpg	image/jpeg	2577865	2015-08-26 09:24:13.501238	active	2015-08-26 09:24:13.705107	2015-08-26 09:24:13.705107
192	11	\N	\N	\N	Doctors Plucker	300.00	<p>Around 80 years old doctors plucker which was used for surgery&nbsp;</p>\r\n	20150816_132848-1.jpg	image/jpeg	2957115	2015-08-26 09:27:47.681556	active	2015-08-26 09:27:47.814691	2015-08-26 09:27:47.814691
193	11	23	\N	\N	Indian kettle	400.00	<p>Around 100 years old copper made Indian kettle&nbsp;</p>\r\n	20150816_134240-1.jpg	image/jpeg	3127274	2015-08-26 09:31:26.279935	active	2015-08-26 09:31:26.793584	2015-08-26 09:31:26.793584
194	11	\N	\N	\N	Indian Lamp	1300.00	<p>Around 80 years old Indian made lamp (in working condition)</p>\r\n	20150816_134257-1.jpg	image/jpeg	2776996	2015-08-26 09:38:03.39974	active	2015-08-26 09:38:03.902393	2015-08-26 09:38:03.902393
195	11	\N	\N	\N	Austrian Lamp	1700.00	<p>Around 120 years old R.Titmar .S Favorit Lampe (without glass chimni)</p>\r\n	20150816_131550-1.jpg	image/jpeg	3655738	2015-08-26 09:44:35.983516	active	2015-08-26 09:44:36.246841	2015-08-26 09:44:36.246841
196	4	29	\N	\N	Indian Small Grinder 	200.00	<p>Around 50 years old hand made stoneware Indian grinder</p>\r\n	20150816_131611-1.jpg	image/jpeg	3427926	2015-08-26 09:48:09.156721	active	2015-08-26 09:48:09.310902	2015-08-26 09:48:09.310902
197	4	21	\N	\N	Macau basket plate	1500.00	<p>Around 150 years old Macau basket plate with handle</p>\r\n	20150816_132419-1.jpg	image/jpeg	2832861	2015-08-26 10:02:19.72053	active	2015-08-26 10:02:20.235022	2015-08-26 10:02:20.235022
198	4	21	\N	\N	Japanese saucer (xyz/abc) 	250.00	<p>Around 80 years old Japanese saucer</p>\r\n	20150816_132530-1.jpg	image/jpeg	2832716	2015-08-26 10:05:07.411637	active	2015-08-26 10:05:07.720424	2015-08-26 10:05:07.720424
199	4	21	\N	\N	English Saucer 	250.00	<p>Around 100 years old English thicker saucer</p>\r\n	20150816_132555-1.jpg	image/jpeg	2997361	2015-08-26 10:08:10.184367	active	2015-08-26 10:08:10.675695	2015-08-26 10:08:10.675695
200	4	21	\N	\N	English half soup plate (xyz/abc)	700.00	<p>Around 80 years old Crown Devon English half soup plate</p>\r\n	20150816_134439-1.jpg	image/jpeg	2989818	2015-08-26 10:14:27.199116	active	2015-08-26 10:14:28.573197	2015-08-26 10:14:28.573197
201	4	29	\N	\N	English Stoneware Small container	400.00	<p>Around 120 years old English stoneware container (without lid)</p>\r\n	20150816_134632-1.jpg	image/jpeg	2716262	2015-08-26 10:30:43.7578	active	2015-08-26 10:30:44.180474	2015-08-26 10:30:44.180474
202	4	29	\N	\N	Macau Small Stoneware container	800.00	<p>Around 150 years old Macau small stoneware container</p>\r\n	20150816_134643-1.jpg	image/jpeg	2624709	2015-08-26 10:34:36.241062	active	2015-08-26 10:34:36.396313	2015-08-26 10:34:36.396313
203	4	32	\N	\N	Crystal Big Jar	1800.00	<p>Around 150 years old Belgium Crystal big jar</p>\r\n	20150816_134711-1.jpg	image/jpeg	3039717	2015-08-26 10:37:26.470396	active	2015-08-26 10:37:26.633615	2015-08-26 10:37:26.633615
204	4	31	\N	\N	Swiss Small Vase	1800.00	<p>Around 200 years old Switzerland made vase</p>\r\n	20150816_161646-1.jpg	image/jpeg	2499102	2015-08-26 10:41:15.348309	active	2015-08-26 10:41:15.51588	2015-08-26 10:41:15.51588
207	4	25	\N	\N	English Blue and White terrien	2500.00	<p>Around 180 years old English terrien which was popular in Goa</p>\r\n	20150816_162959-1.jpg	image/jpeg	2501465	2015-08-26 10:58:20.062565	active	2015-08-26 10:58:20.229798	2015-08-26 10:58:20.229798
208	4	25	\N	\N	Willow English terrein 	8500.00	<p>Around 150 years old Wicker J.P &amp; Companies blue and white English terrien</p>\r\n	20150816_163106-1.jpg	image/jpeg	2794482	2015-08-26 11:02:31.487621	active	2015-08-26 11:02:32.089283	2015-08-26 11:02:32.089283
209	4	25	\N	\N	French Black and White Small terrien 	700.00	<p>Around 80 years old French Small terrien</p>\r\n	20150816_163441-1.jpg	image/jpeg	2249996	2015-08-26 11:06:39.131501	active	2015-08-26 11:06:39.291291	2015-08-26 11:06:39.291291
211	4	27	\N	\N	Goan Ash Trey	350.00	<p>Old Goan Pulsner beer ash trey</p>\r\n	20150816_164517-1.jpg	image/jpeg	2319774	2015-08-26 11:19:56.703304	active	2015-08-26 11:19:56.910586	2015-08-26 11:19:56.910586
212	5	\N	\N	\N	Hong Kong Photo Frame	500.00	<p>Around 75 years old Hong Kong made picture frame</p>\r\n	20150816_163029-1.jpg	image/jpeg	3027792	2015-08-26 11:23:39.349632	active	2015-08-26 11:23:39.675314	2015-08-26 11:23:39.675314
213	4	23	\N	\N	English Porcelain jar	950.00	<p>Around 125 years old Semi porcelain Brich Wood &amp; Son Company</p>\r\n	20150816_124452-1.jpg	image/jpeg	2559016	2015-08-27 05:26:09.387301	active	2015-08-27 05:26:09.601473	2015-08-27 05:26:09.601473
508	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	5.jpg	image/jpeg	2480689	2015-09-04 09:05:11.104573	active	2015-09-04 09:05:11.332999	2015-09-04 09:05:11.332999
215	4	23	\N	\N	Small Japanese sugar pot 	750.00	<p>Around 125 years old Japanese multicolored sugar pot</p>\r\n	20150816_124655-1.jpg	image/jpeg	2823491	2015-08-27 05:33:14.624056	active	2015-08-27 05:33:14.815137	2015-08-27 05:33:14.815137
216	4	23	\N	\N	Japanese Multicolored Teapot	1350.00	<p>Around 70 years old Japanese teapot with electricity connection</p>\r\n	20150816_124724-1.jpg	image/jpeg	2775476	2015-08-27 05:36:52.789905	active	2015-08-27 05:36:52.935136	2015-08-27 05:36:52.935136
217	4	23	\N	\N	Gold hand painted teapot	1200.00	<p>Around 70 years old Japanese gold hand painted teapot</p>\r\n	20150816_124811-1.jpg	image/jpeg	2779252	2015-08-27 05:39:45.507698	active	2015-08-27 05:39:45.662078	2015-08-27 05:39:45.662078
218	4	23	\N	\N	English Teapot 	1850.00	<p>Around 200 years old English hand made teapot</p>\r\n	20150816_124923-1.jpg	image/jpeg	2645855	2015-08-27 05:42:56.436358	active	2015-08-27 05:42:56.634444	2015-08-27 05:42:56.634444
219	4	23	\N	\N	Japanese Multicolored Teapot	1400.00	<p>Around 125 years old Japanese hand and stone painted teapot</p>\r\n	20150816_125606-1.jpg	image/jpeg	2770246	2015-08-27 05:49:30.646885	active	2015-08-27 05:49:30.806402	2015-08-27 05:49:30.806402
220	4	23	\N	\N	Ivory Hand painted Small teapot	1200.00	<p>Around 80 years old Ivory Where Hancock&#39;s English hand painted small teapot</p>\r\n	20150816_125622-1.jpg	image/jpeg	2636149	2015-08-27 06:07:56.036909	active	2015-08-27 06:07:56.077629	2015-08-27 06:07:56.077629
221	4	23	\N	\N	Indian Multicolored Teapot	1300.00	<p>Around 100 years old Bengal pottaries small teapot</p>\r\n	20150816_125650-1.jpg	image/jpeg	2912442	2015-08-27 06:12:35.463038	active	2015-08-27 06:12:35.485554	2015-08-27 06:12:35.485554
222	4	23	\N	\N	Hand painted Japanese Sugar pot	850.00	<p>Around 100 years old Multicolored Hand painted Japanese sugar pot</p>\r\n	20150816_125728-1.jpg	image/jpeg	2655468	2015-08-27 06:15:24.125466	active	2015-08-27 06:15:24.164499	2015-08-27 06:15:24.164499
223	4	23	\N	\N	French Coffee Pot	1200.00	<p>Around 100 years old French Small Coffee pot</p>\r\n	20150816_125807-1.jpg	image/jpeg	2724438	2015-08-27 06:17:58.939595	active	2015-08-27 06:17:58.97455	2015-08-27 06:17:58.97455
224	4	23	\N	\N	English Fire proof coffee pot	1300.00	<p>Around 125 years old English fire proof coffee pot</p>\r\n	20150816_125902-1.jpg	image/jpeg	2959117	2015-08-27 06:20:47.981989	active	2015-08-27 06:20:48.008977	2015-08-27 06:20:48.008977
225	4	23	\N	\N	Japanese Coffee pot	900.00	<p>Around 70 years old Japanese coffee pot</p>\r\n	20150816_125951-1.jpg	image/jpeg	2960161	2015-08-27 06:23:16.481938	active	2015-08-27 06:23:16.505739	2015-08-27 06:23:16.505739
227	4	23	\N	\N	Japanese Multicolored Small Milk Pot	750.00	<p>Around 100 years old Japanese small Milk pot</p>\r\n	20150816_130252-1.jpg	image/jpeg	2688023	2015-08-27 07:27:24.347996	active	2015-08-27 07:27:24.569364	2015-08-27 07:27:24.569364
226	4	23	\N	\N	Japanese Small Milk pot	350.00	<p>Around 60 years old Japanese Small milk pot</p>\r\n	20150816_130240-1.jpg	image/jpeg	2583718	2015-08-27 07:24:15.345151	active	2015-08-27 07:24:15.467928	2015-08-27 07:28:19.879931
228	4	23	\N	\N	Indian Teapot	350.00	<p>Around 40 years old Indian teapot</p>\r\n	20150816_130412-1.jpg	image/jpeg	2669597	2015-08-27 07:30:37.514496	active	2015-08-27 07:30:37.76031	2015-08-27 07:30:37.76031
229	4	23	\N	\N	English Coffee Pot	750.00	<p>Around 100 years old English coffee pot made to order in Japan</p>\r\n	20150816_130454-1.jpg	image/jpeg	2549838	2015-08-27 07:33:30.863176	active	2015-08-27 07:33:30.986911	2015-08-27 07:33:30.986911
232	4	23	\N	\N	Japanese Multicolored Sugar pot	850.00	<p>Around 100 years old Japanese multicolored pot</p>\r\n	20150816_130549-1.jpg	image/jpeg	2998765	2015-08-27 09:35:37.305779	active	2015-08-27 09:35:38.473774	2015-08-27 09:35:38.473774
233	4	23	\N	\N	English Sugar Pot	850.00	<p>Around 100 years old multicolored flowers design pot</p>\r\n	20150816_130646-1.jpg	image/jpeg	2813348	2015-08-27 09:39:12.191649	active	2015-08-27 09:39:12.363094	2015-08-27 09:39:12.363094
234	4	23	\N	\N	Chinese Sugar Pot	850.00	<p>Around 100 years old multicolored Tulip design Chinese sugar pot</p>\r\n	20150816_130732-1.jpg	image/jpeg	2857087	2015-08-27 09:41:53.331942	active	2015-08-27 09:41:54.104831	2015-08-27 09:41:54.104831
235	4	23	\N	\N	Chinese Multicolored Sugar Pot	850.00	<p>Around 100 years old Multicolored flowers on Ivory Chinese sugar pot</p>\r\n	20150816_130813-1.jpg	image/jpeg	2935725	2015-08-27 09:45:18.135927	active	2015-08-27 09:45:18.328034	2015-08-27 09:45:18.328034
236	4	35	\N	\N	Chinese Cup & Saucer	300.00	<p>Around 50 years old Chinese cup and saucer</p>\r\n	20150816_131017-1.jpg	image/jpeg	2633039	2015-08-27 09:47:52.227534	active	2015-08-27 09:47:52.485685	2015-08-27 09:47:52.485685
237	4	36	\N	\N	Bhutan Colored Pot	650.00	<p>Bhutani Red color painted on Scottland Ceramic pot</p>\r\n	20150816_131043-1.jpg	image/jpeg	3322246	2015-08-27 09:54:36.444237	active	2015-08-27 09:54:36.790335	2015-08-27 09:54:36.790335
238	4	32	\N	\N	Chocolate Box 	250.00	<p>Around 60 years old English Chocolate box with metal lid</p>\r\n	20150816_131151-1.jpg	image/jpeg	3103372	2015-08-27 09:58:13.310542	active	2015-08-27 09:58:13.49455	2015-08-27 09:58:13.49455
240	12	33	\N	\N	fast and furious	50.00	<p>hollywood action movie</p>\r\n	fast_and_furious.jpg	image/jpeg	11162	2015-08-27 10:28:09.762071	active	2015-08-27 10:28:09.911996	2015-08-27 10:28:09.911996
241	12	33	\N	\N	twlight	26.00	<p>hollywood action movies</p>\r\n	twilight.jpg	image/jpeg	9710	2015-08-27 10:29:13.749919	active	2015-08-27 10:29:13.908217	2015-08-27 10:29:13.908217
242	4	42	\N	\N	Portuguese Ink Pot	350.00	<p>Around 100 years old Portuguese ink pot</p>\r\n	20150816_131425-1.jpg	image/jpeg	3107126	2015-08-28 05:47:53.499833	active	2015-08-28 05:47:53.68501	2015-08-28 05:47:53.68501
243	4	\N	\N	\N	Japanese Multicolored Cup	150.00	<p>Around 70 years old Japanese hand painted multicolored cup</p>\r\n	20150816_131528-1.jpg	image/jpeg	3324345	2015-08-28 05:51:18.768014	active	2015-08-28 05:51:19.208659	2015-08-28 05:51:19.208659
244	4	24	\N	\N	Macau Medium hand painted Soup Bowl	750.00	<p>Around 200 years old Macau made hand painted soup bowl</p>\r\n	20150816_131753-1.jpg	image/jpeg	2924885	2015-08-28 05:55:31.775108	active	2015-08-28 05:55:31.971654	2015-08-28 05:55:31.971654
248	4	24	\N	\N	Chinese Small Soup Bowl	750.00	<p>Around 200 years old Hand painted small Chinese soup bowl</p>\r\n	20150816_132144-1.jpg	image/jpeg	3166428	2015-08-28 06:22:22.033738	active	2015-08-28 06:22:22.198699	2015-08-28 06:22:22.198699
249	4	24	\N	\N	Macau Medium Soup bowl	550.00	<p>Around 250 years old hand painted grayish colore soup bowl (with age crack)</p>\r\n	20150816_132627-1.jpg	image/jpeg	3125273	2015-08-28 06:25:42.499813	active	2015-08-28 06:25:42.659215	2015-08-28 06:25:42.659215
250	4	24	\N	\N	Macau Medium Soup Bowl	300.00	<p>Around 300 years old grayish color soup bowl ( restored and age carack)</p>\r\n	20150816_132638-1.jpg	image/jpeg	3098799	2015-08-28 06:29:12.701399	active	2015-08-28 06:29:12.977877	2015-08-28 06:29:12.977877
251	4	24	\N	\N	Dutch hand painted soup plate	400.00	<p>Around 300 years old multicolored hand painted soup bowl (age crack)</p>\r\n	20150816_132754-1.jpg	image/jpeg	3113453	2015-08-28 06:32:27.419044	active	2015-08-28 06:32:27.582345	2015-08-28 06:32:27.582345
252	4	23	\N	\N	Dragon Blue and White kettle	1850.00	<p>Around 50 years old Chinese made kettle</p>\r\n	20150816_134607-1.jpg	image/jpeg	2671590	2015-08-28 06:35:09.486888	active	2015-08-28 06:35:09.652749	2015-08-28 06:35:09.652749
253	4	23	\N	\N	English Coffee Mug	400.00	<p>Around 60 years old English coffee mug</p>\r\n	20150816_134622-1.jpg	image/jpeg	2211519	2015-08-28 06:37:42.709673	active	2015-08-28 06:37:42.920335	2015-08-28 06:37:42.920335
254	4	24	\N	\N	V. Japanese Soup bowl	900.00	<p>Around 100 years old multicolored Japanese hand painted soup bowl</p>\r\n	20150816_161517-1.jpg	image/jpeg	3255952	2015-08-28 07:03:00.955778	active	2015-08-28 07:03:01.93849	2015-08-28 07:03:01.93849
255	4	43	\N	\N	Japanese Glazed Milk pot	450.00	<p>Around 100 years old multicolored hand painted Japanese milk pot</p>\r\n	20150816_161603-1.jpg	image/jpeg	2830041	2015-08-28 07:07:55.500865	active	2015-08-28 07:07:55.731265	2015-08-28 07:07:55.731265
256	4	43	\N	\N	Macau Big soup bowl 	900.00	<p>Around 100 years old multicolored hand painted Macau soup bowl</p>\r\n	20150816_161753-1.jpg	image/jpeg	3371758	2015-08-28 07:12:01.014117	active	2015-08-28 07:12:01.267022	2015-08-28 07:12:01.267022
257	4	43	\N	\N	Japanese Hand Painted Tea Set	1850.00	<p>Around 100 years old Japanese hand painted set of three that is Tea pot, Sugar pot and Milk pot</p>\r\n	20150816_162111-1.jpg	image/jpeg	2597431	2015-08-28 07:16:12.808865	active	2015-08-28 07:16:13.077189	2015-08-28 07:16:13.077189
258	4	43	\N	\N	Indian Tea Set	750.00	<p>Around 50 years old Indian tea set that is Tea pot, Sugar pot, Milk pot and five Cup and Saucer</p>\r\n	20150816_162348.jpg	image/jpeg	3471119	2015-08-28 07:20:35.790412	active	2015-08-28 07:20:37.321001	2015-08-28 07:20:37.321001
259	4	38	\N	\N	Japanese multi color Paper Weight 	350.00	<p>Around 80 years old Japanese paper weight</p>\r\n	20150816_163316-1.jpg	image/jpeg	2797445	2015-08-28 07:23:59.449455	active	2015-08-28 07:23:59.622537	2015-08-28 07:23:59.622537
260	4	24	\N	\N	Japanese Big Soup Bowl	300.00	<p>Around 100 years old multicolored hand painted bowl</p>\r\n	20150816_163344-1.jpg	image/jpeg	2901120	2015-08-28 07:27:46.368767	active	2015-08-28 07:27:46.582473	2015-08-28 07:27:46.582473
261	4	38	\N	\N	Glass Paper weight	350.00	<p>Around 50 years old Japanese paper weight</p>\r\n	20150816_163425-1.jpg	image/jpeg	1509319	2015-08-28 07:30:03.892604	active	2015-08-28 07:30:04.147411	2015-08-28 07:30:04.147411
262	4	44	\N	\N	Ceramic Candle Stand 	400.00	<p>Around 100 years old Portuguese Ceramic candle stand</p>\r\n	20150816_163653-1.jpg	image/jpeg	1464028	2015-08-28 07:34:37.662326	active	2015-08-28 07:34:37.811111	2015-08-28 07:34:37.811111
263	4	35	\N	\N	Chinese Hand made Cup and saucer	800.00	<p>Around 150 years old hand painted Chinese cup and saucer</p>\r\n	20150816_163732-1.jpg	image/jpeg	2585853	2015-08-28 07:37:40.560326	active	2015-08-28 07:37:40.750873	2015-08-28 07:37:40.750873
264	4	39	\N	\N	Portuguese Talc Box	650.00	<p>Around 100 years old Blue color Portuguese talc box</p>\r\n	20150816_163750-1.jpg	image/jpeg	2753457	2015-08-28 07:41:21.740718	active	2015-08-28 07:41:21.976726	2015-08-28 07:41:21.976726
265	4	39	\N	\N	Portuguese Orange color Talc Box	650.00	<p>Around 100 years old Portuguese Orange color talc box</p>\r\n	20150816_164101-1.jpg	image/jpeg	2054071	2015-08-28 07:44:20.179155	active	2015-08-28 07:44:20.356547	2015-08-28 07:44:20.356547
266	4	39	\N	\N	Portuguese Talc Box	650.00	<p>Around 100 years old Green and White talc box</p>\r\n	20150816_164126-1.jpg	image/jpeg	2191352	2015-08-28 07:47:12.6354	active	2015-08-28 07:47:12.980087	2015-08-28 07:47:12.980087
267	4	39	\N	\N	Portuguese Fiber Talc Box	650.00	<p>Around 60 years old Portuguese &nbsp;hand painted multicolored fiber talc box&nbsp;</p>\r\n	20150816_164041-1.jpg	image/jpeg	2352865	2015-08-28 07:50:32.916736	active	2015-08-28 07:50:33.151892	2015-08-28 07:50:33.151892
268	4	43	\N	\N	Japanese Tea Set	1100.00	<p>Around 70 years old MC Japanese vhand painted set of two that is Milk pot and Sugar pot</p>\r\n	20150816_124755-1.jpg	image/jpeg	3048521	2015-08-28 07:54:15.10085	active	2015-08-28 07:54:15.443362	2015-08-28 07:54:15.443362
269	4	40	\N	\N	Small Mug	350.00	<p>Around 50 years old very small American mug</p>\r\n	20150816_164145-1.jpg	image/jpeg	2202019	2015-08-28 09:24:30.750906	active	2015-08-28 09:24:30.904386	2015-08-28 09:24:30.904386
270	4	25	\N	\N	Small Container	400.00	<p>Belgium made very small glass container</p>\r\n	20150816_164624-1.jpg	image/jpeg	3037163	2015-08-28 09:27:14.98447	active	2015-08-28 09:27:15.104934	2015-08-28 09:27:15.104934
271	4	24	\N	\N	Japanese Multicolored Soup Bowl	650.00	<p>Around 1oo years old multicolored hand painted Japanese bowl</p>\r\n	20150816_164641-1.jpg	image/jpeg	2955718	2015-08-28 09:29:24.734428	active	2015-08-28 09:29:24.883723	2015-08-28 09:29:24.883723
272	4	25	\N	\N	English Container	1200.00	<p>Around 150 years old small English hand painted terrin</p>\r\n	20150816_164711-1.jpg	image/jpeg	2732843	2015-08-28 09:31:27.369872	active	2015-08-28 09:31:27.679762	2015-08-28 09:31:27.679762
273	4	25	\N	\N	English Container 	1350.00	<p>Around 150 years old English container</p>\r\n	20150816_164839-1.jpg	image/jpeg	2444651	2015-08-28 09:33:00.769779	active	2015-08-28 09:33:02.069245	2015-08-28 09:33:02.069245
274	4	40	\N	\N	Frank Coopers Container	650.00	<p>Around 100 years old English container</p>\r\n	20150816_173620-1.jpg	image/jpeg	2217667	2015-08-28 09:34:58.427205	active	2015-08-28 09:34:58.562553	2015-08-28 09:34:58.562553
275	15	\N	\N	\N	Gramophone 	2200.00	<p>Around 80 years old Non working Gramophone</p>\r\n	20150816_174245-1.jpg	image/jpeg	3456756	2015-08-28 09:39:57.334379	active	2015-08-28 09:39:57.477241	2015-08-28 09:39:57.477241
276	4	23	\N	\N	Japanese Milk Pot	650.00	<p>Around 70 years old small hand painted milk pot</p>\r\n	20150816_174924-1.jpg	image/jpeg	2055271	2015-08-28 09:41:35.861429	active	2015-08-28 09:41:36.036805	2015-08-28 09:41:36.036805
277	4	23	\N	\N	Wall hanging Pot	650.00	<p>Around 70 years old Japanese hand painted milk pot</p>\r\n	20150816_175226-1.jpg	image/jpeg	2660292	2015-08-28 09:43:41.989305	active	2015-08-28 09:43:42.225836	2015-08-28 09:43:42.225836
278	4	24	\N	\N	English Soup Bowl	350.00	<p>Around 70 years old English hand painted soup bowl</p>\r\n	20150816_175234-1.jpg	image/jpeg	3304337	2015-08-28 09:47:05.155682	active	2015-08-28 09:47:05.312724	2015-08-28 09:47:05.312724
279	4	42	\N	\N	Easter Ink Pot	550.00	<p>Easter book American ink pot</p>\r\n	20150816_163824-1.jpg	image/jpeg	3048716	2015-08-28 09:51:56.090503	active	2015-08-28 09:51:56.680711	2015-08-28 09:51:56.680711
134	4	41	\N	\N	Macau hand painted  quarter plate	1200.00	<p>Around 150 years old blue and white Macau quarter plate</p>\r\n	done55.jpg	image/jpeg	2258759	2015-08-25 06:48:54.795773	active	2015-08-25 06:48:54.939864	2015-08-28 10:05:32.703783
282	2	47	\N	\N	Cambodia	100.00	<p>500 Riel Big size in UNC condition</p>\r\n	20150806_201133-1.jpg	image/jpeg	4152903	2015-08-29 07:28:23.022266	active	2015-08-29 07:28:23.624909	2015-08-29 07:28:23.624909
283	2	47	\N	\N	Mauritius	70.00	<p>100 Rupees Medium size in good condition</p>\r\n	20150806_202046-1.jpg	image/jpeg	3411794	2015-08-29 07:30:40.294161	active	2015-08-29 07:30:40.480678	2015-08-29 07:30:40.480678
284	2	47	\N	\N	Jamaica	70.00	<p>One Dollar Medium size in good condition</p>\r\n	20150806_202149-1.jpg	image/jpeg	3908337	2015-08-29 07:33:23.865879	active	2015-08-29 07:33:24.027946	2015-08-29 07:33:24.027946
286	2	47	\N	\N	Nigeria	70.00	<p>50 Cobo ,Medium size, in good condition.</p>\r\n	20150806_202242-1.jpg	image/jpeg	3688485	2015-08-29 07:41:58.950592	active	2015-08-29 07:41:59.332544	2015-08-29 07:41:59.332544
280	2	47	\N	\N	Uzbekisthan	80.00	<p>10 Som, Medium size, in very good condition.</p>\r\n	2015-08-07_10.53.46.jpg	image/jpeg	210318	2015-08-29 07:20:05.541512	active	2015-08-29 07:20:05.715862	2015-08-29 07:43:50.596873
287	2	47	\N	\N	Oman 	60.00	<p>200 Baisa, Small size, in good condition.</p>\r\n	20150806_223416-1.jpg	image/jpeg	3755545	2015-08-29 07:51:57.12501	active	2015-08-29 07:51:57.356495	2015-08-29 07:51:57.356495
288	2	47	\N	\N	Harzegovina	60.00	<p>10 Kuna, Small size, in good condition.</p>\r\n	20150806_223554-1.jpg	image/jpeg	3908306	2015-08-29 07:54:49.196491	active	2015-08-29 07:54:49.406349	2015-08-29 07:54:49.406349
281	2	15	\N	\N	Kuwait 1/2 Dinar	40.00	<p>1/2 Dinar, Small size, in good cindition.</p>\r\n	20150806_201028-1.jpg	image/jpeg	4004795	2015-08-29 07:25:37.230555	active	2015-08-29 07:25:37.499332	2015-08-29 08:54:39.268222
285	2	15	\N	\N	Iraq	150.00	<p>250 Dinars, Big size, in good condition.</p>\r\n	20150806_223303-1.jpg	image/jpeg	3601580	2015-08-29 07:41:55.742762	active	2015-08-29 07:41:55.988208	2015-08-29 08:55:43.9046
289	2	15	\N	\N	Burma	150.00	<p>20 Kyats, Big size, in UNC condition.</p>\r\n	20150806_223900-1.jpg	image/jpeg	4272999	2015-08-29 07:57:01.315234	active	2015-08-29 07:57:01.568509	2015-08-29 08:56:39.237667
290	2	47	\N	\N	Trinidad And Tobago	80.00	<p>1 Dollar, Medium size, in good condition</p>\r\n	20150806_224055-1.jpg	image/jpeg	4742261	2015-08-29 09:06:23.123228	active	2015-08-29 09:06:23.28549	2015-08-29 09:06:23.28549
291	\N	\N	\N	\N	India	650.00	<p>From 1951, Big size, in good condition.</p>\r\n	20150806_224003-1.jpg	image/jpeg	4199957	2015-08-29 09:07:50.41233	active	2015-08-29 09:07:50.583667	2015-08-29 09:07:50.583667
292	2	47	\N	\N	Uzbekisthan	90.00	<p>200 Som, Medium size, in good condition.</p>\r\n	20150806_224141-1.jpg	image/jpeg	4415998	2015-08-29 09:11:27.387923	active	2015-08-29 09:11:27.553754	2015-08-29 09:11:27.553754
487	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	33.jpg	image/jpeg	1849135	2015-09-03 08:19:25.965766	active	2015-09-03 08:19:26.222168	2015-09-03 08:19:26.222168
293	2	15	\N	\N	Lebabon	80.00	<p>25 Livers, Medium size, in good condition.</p>\r\n	20150806_224231-1.jpg	image/jpeg	4614311	2015-08-29 09:14:55.229588	active	2015-08-29 09:14:55.412715	2015-08-29 09:14:55.412715
294	2	47	\N	\N	Brasil 	70.00	<p>1000 Cruzeiros, Medium size, in good condition.</p>\r\n	20150806_224404-1.jpg	image/jpeg	4715367	2015-08-29 09:17:34.050816	active	2015-08-29 09:17:34.217081	2015-08-29 09:17:34.217081
295	2	47	\N	\N	Nigeria	40.00	<p>5 Naira, Small Size, in Medium condition.</p>\r\n	20150806_224507-1.jpg	image/jpeg	2787918	2015-08-29 09:19:28.273561	active	2015-08-29 09:19:28.440926	2015-08-29 09:19:28.440926
296	2	15	\N	\N	Norway	70.00	<p>50 Kroner, Medium size, in good condition.</p>\r\n	20150806_224550-1.jpg	image/jpeg	4243139	2015-08-29 09:22:29.269212	active	2015-08-29 09:22:29.548746	2015-08-29 09:22:29.548746
297	2	15	\N	\N	Indonesia	150.00	<p>10 Rupiah, Small size, in medium condition.</p>\r\n	20150806_225750-1.jpg	image/jpeg	4116477	2015-08-29 09:25:21.079095	active	2015-08-29 09:25:21.349815	2015-08-29 09:25:21.349815
298	2	47	\N	\N	Cambodia	150.00	<p>500 Riel, Medium size, in good condition.</p>\r\n	20150806_225822-1.jpg	image/jpeg	4718589	2015-08-29 09:29:12.718491	active	2015-08-29 09:29:12.891029	2015-08-29 09:29:12.891029
299	2	47	\N	\N	Ghana	150.00	<p>200 Cedis, Medium Size, in good condition.</p>\r\n	20150806_225856-1.jpg	image/jpeg	4633046	2015-08-29 09:31:12.682913	active	2015-08-29 09:31:13.044168	2015-08-29 09:31:13.044168
300	2	47	\N	\N	Uruguay	150.00	<p>200 Pesos, Medium size, in medium condition.</p>\r\n	20150806_225932-1.jpg	image/jpeg	4747702	2015-08-29 09:35:39.392126	active	2015-08-29 09:35:39.578102	2015-08-29 09:35:39.578102
301	2	47	\N	\N	Nigeria	70.00	<p>20 Nira, Medium size, in good condition.</p>\r\n	20150806_230215-1.jpg	image/jpeg	4534695	2015-08-29 09:37:57.473713	active	2015-08-29 09:37:58.753258	2015-08-29 09:37:58.753258
302	2	15	\N	\N	Saudi Arabia	170.00	<p>5 Riyals, Medium size, in medium condition.</p>\r\n	20150806_230245-1.jpg	image/jpeg	4535896	2015-08-29 09:40:59.692619	active	2015-08-29 09:41:00.125586	2015-08-29 09:41:00.125586
303	2	47	\N	\N	Srilanka	25.00	<p>10 Rupees, Small size, in good condition.</p>\r\n	20150806_230337-1.jpg	image/jpeg	4022473	2015-08-29 09:43:33.285272	active	2015-08-29 09:43:33.477871	2015-08-29 09:43:33.477871
304	2	47	\N	\N	Nepal	25.00	<p>5 Rupees, Small size, in good condition.</p>\r\n	20150806_230411-1.jpg	image/jpeg	3835417	2015-08-29 09:47:12.586787	active	2015-08-29 09:47:12.803707	2015-08-29 09:47:12.803707
305	2	45	\N	\N	India Republic	650.00	<p>From 1951, Big size, in good condition.</p>\r\n	20150806_224003-1.jpg	image/jpeg	4199957	2015-08-29 09:52:34.855993	active	2015-08-29 09:52:35.266283	2015-08-29 09:52:35.266283
306	2	15	\N	\N	Yugoslavia	150.00	<p>5 Dinara, Medium size, in medium condition.</p>\r\n	20150806_230438-1.jpg	image/jpeg	4658888	2015-08-29 10:21:49.681972	active	2015-08-29 10:21:49.946719	2015-08-29 10:21:49.946719
307	2	47	\N	\N	Jordan	100.00	<p>1 Dinar, Medium size, in good condition.</p>\r\n	20150806_230507-1.jpg	image/jpeg	4155299	2015-08-29 10:38:23.983396	active	2015-08-29 10:38:24.248083	2015-08-29 10:38:24.248083
308	2	15	\N	\N	Portugal	100.00	<p>10 Escudos, Medium size, in good condition.</p>\r\n	20150806_230636-1.jpg	image/jpeg	4617538	2015-08-29 10:49:41.07065	active	2015-08-29 10:49:41.326331	2015-08-29 10:49:41.326331
309	2	47	\N	\N	Ukrain	60.00	<p>1 Hyrvnia, Medium size, in good condition.</p>\r\n	20150806_230544-1.jpg	image/jpeg	3971261	2015-08-29 10:54:21.294279	active	2015-08-29 10:54:21.663653	2015-08-29 10:54:21.663653
310	2	15	\N	\N	Burma	100.00	<p>10 Rupees, Medium size, in good condition.</p>\r\n\r\n<p>Japanese note used in Burma</p>\r\n	20150806_230710-1.jpg	image/jpeg	4158573	2015-08-29 10:57:49.75897	active	2015-08-29 10:57:49.99054	2015-08-29 10:57:49.99054
311	2	47	\N	\N	Somalia	70.00	<p>10 Shilings, Medium size, in good condition.</p>\r\n	20150806_230606-1.jpg	image/jpeg	4445921	2015-08-29 11:00:27.945945	active	2015-08-29 11:00:28.178025	2015-08-29 11:00:28.178025
312	2	47	\N	\N	Oman	60.00	<p>200 Baisa, Small size, in good condition.</p>\r\n	20150806_230753-1.jpg	image/jpeg	4346194	2015-08-29 11:04:38.766766	active	2015-08-29 11:04:39.045065	2015-08-29 11:04:39.045065
313	2	47	\N	\N	Jordan	125.00	<p>1 Dinar, Medium size, in good condition.</p>\r\n	20150806_230855-1.jpg	image/jpeg	4294786	2015-08-29 11:07:24.146882	active	2015-08-29 11:07:24.467581	2015-08-29 11:07:24.467581
314	2	15	\N	\N	Greece	125.00	<p>100 Drachma, Medium size, in good condition.</p>\r\n	20150806_230819-1.jpg	image/jpeg	3960958	2015-08-29 11:08:35.077827	active	2015-08-29 11:08:35.403005	2015-08-29 11:08:35.403005
315	2	47	\N	\N	Ethopia	60.00	<p>1 Birr, Medium size, in medium condition.</p>\r\n	20150806_230923-1.jpg	image/jpeg	3671593	2015-08-29 11:10:57.082113	active	2015-08-29 11:10:57.356398	2015-08-29 11:10:57.356398
316	2	47	\N	\N	Russia	40.00	<p>10 Ruble, Medium size, in good condition.</p>\r\n	20150806_230944-1.jpg	image/jpeg	3722519	2015-08-29 11:15:49.993513	active	2015-08-29 11:15:50.250261	2015-08-29 11:15:50.250261
317	2	47	\N	\N	Brasil	80.00	<p>10 Reais, Medium size, in good condition.</p>\r\n	20150806_231005-1.jpg	image/jpeg	3823488	2015-08-29 11:17:26.607675	active	2015-08-29 11:17:26.869593	2015-08-29 11:17:26.869593
318	2	15	\N	\N	Hungary	80.00	<p>50 Forin. Medium size, in good condition.</p>\r\n	20150806_231035-1.jpg	image/jpeg	3021757	2015-08-29 11:17:31.151222	active	2015-08-29 11:17:31.374402	2015-08-29 11:17:31.374402
319	2	47	\N	\N	Lebabon	200.00	<p>1000 Livers, Medium size, in good condition.</p>\r\n	20150806_231111-1.jpg	image/jpeg	4614312	2015-08-29 11:21:28.752254	active	2015-08-29 11:21:29.007287	2015-08-29 11:21:29.007287
320	2	47	\N	\N	Zambia	80.00	<p>100 Kwacha, Medium size, in good condition.</p>\r\n	20150806_231138-1.jpg	image/jpeg	3952516	2015-08-29 11:26:16.136039	active	2015-08-29 11:26:16.407295	2015-08-29 11:26:16.407295
321	2	47	\N	\N	Morrcco	80.00	<p>10 Dirhams, Medium Size, in good condition.</p>\r\n	20150806_231209-1.jpg	image/jpeg	4076550	2015-08-29 11:27:25.91848	active	2015-08-29 11:27:26.143183	2015-08-29 11:27:26.143183
323	2	45	\N	\N	India Republic	200.00	<p>From 1957, Big size, in Medium condition.</p>\r\n	20150806_231245-1.jpg	image/jpeg	4307086	2015-08-31 05:25:49.059343	active	2015-08-31 05:25:49.239431	2015-08-31 05:25:49.239431
324	2	47	\N	\N	Mauritius	40.00	<p>5 Rupees, Small size, in Medium condition.</p>\r\n	20150806_231313-1.jpg	image/jpeg	4781407	2015-08-31 05:27:21.041602	active	2015-08-31 05:27:21.263216	2015-08-31 05:27:21.263216
325	2	45	\N	\N	India Republic	100.00	<p>From 1957-1962, Big size, in bad condition.</p>\r\n	20150806_231358-1.jpg	image/jpeg	4221820	2015-08-31 05:29:28.351185	active	2015-08-31 05:29:28.640976	2015-08-31 05:29:28.640976
326	2	15	\N	\N	Yogoslavia	125.00	<p>20 Dinara, Medium size, in good condition.</p>\r\n	20150806_231622-1.jpg	image/jpeg	4095840	2015-08-31 05:37:22.928444	active	2015-08-31 05:37:23.406377	2015-08-31 05:37:23.406377
327	2	47	\N	\N	Sweden 	200.00	<p>20 Kronor, Medium size, in good condition.</p>\r\n	20150806_231706-1.jpg	image/jpeg	3849244	2015-08-31 05:41:45.237463	active	2015-08-31 05:41:45.45375	2015-08-31 05:41:45.45375
328	2	47	\N	\N	Vietnam	200.00	<p>500 Dong, Medium size, in good condition.</p>\r\n	20150806_231748-1.jpg	image/jpeg	3957749	2015-08-31 05:42:29.318136	active	2015-08-31 05:42:31.43592	2015-08-31 05:42:31.43592
329	2	15	\N	\N	USSR	175.00	<p>3 Rubles, Small size, in good condition.</p>\r\n	20150807_004915-1.jpg	image/jpeg	4566803	2015-08-31 05:59:04.166619	active	2015-08-31 05:59:04.368703	2015-08-31 05:59:04.368703
330	2	47	\N	\N	Indonesia	80.00	<p>50 Sen, Small size, in very good condition.</p>\r\n	20150807_005040-1.jpg	image/jpeg	3967050	2015-08-31 06:01:31.642942	active	2015-08-31 06:01:32.028562	2015-08-31 06:01:32.028562
331	2	47	\N	\N	Mexico	125.00	<p>100 Pesos, Medium size, in good condition.</p>\r\n	20150807_005105-1.jpg	image/jpeg	3439438	2015-08-31 06:04:03.74646	active	2015-08-31 06:04:04.605822	2015-08-31 06:04:04.605822
332	2	47	\N	\N	Russia	350.00	<p>500 Ruble, Medium size, in good condition.</p>\r\n	20150807_005143-1.jpg	image/jpeg	3192845	2015-08-31 06:06:25.202142	active	2015-08-31 06:06:25.516946	2015-08-31 06:06:25.516946
333	2	47	\N	\N	Indonesia	125.00	<p>100 Rupiah, Medium size, in good condition.</p>\r\n	20150807_005259-1.jpg	image/jpeg	3194922	2015-08-31 06:08:17.072688	active	2015-08-31 06:08:17.581064	2015-08-31 06:08:17.581064
334	2	47	\N	\N	Philipinas	70.00	<p>10 Piso, Medium size, in good condition.</p>\r\n	20150807_005322-1.jpg	image/jpeg	3776305	2015-08-31 06:10:26.042157	active	2015-08-31 06:10:28.004668	2015-08-31 06:10:28.004668
335	2	47	\N	\N	Brasil	80.00	<p>50 Cruzados, Medium size, in good condition.</p>\r\n	20150807_005405-1.jpg	image/jpeg	3693372	2015-08-31 06:12:01.663378	active	2015-08-31 06:12:02.021938	2015-08-31 06:12:02.021938
336	2	47	\N	\N	Venezuela	90.00	<p>5 Bolivares, Medium size, in good condition.</p>\r\n	20150807_005432-1.jpg	image/jpeg	3997575	2015-08-31 06:15:13.132447	active	2015-08-31 06:15:13.943539	2015-08-31 06:15:13.943539
337	2	15	\N	\N	Poland	125.00	<p>100 Zloty, Medium size, in good condition.</p>\r\n	20150807_005806-1.jpg	image/jpeg	3921182	2015-08-31 06:17:53.449887	active	2015-08-31 06:17:53.647885	2015-08-31 06:17:53.647885
338	2	47	\N	\N	Italy	250.00	<p>500 Lira, Small size, in good condition.</p>\r\n	20150807_005838-1.jpg	image/jpeg	3588992	2015-08-31 06:19:55.30616	active	2015-08-31 06:19:55.645473	2015-08-31 06:19:55.645473
339	2	15	\N	\N	USSR	175.00	<p>1 Ruble, Small size, in good condition.</p>\r\n	20150807_005927-1.jpg	image/jpeg	3144438	2015-08-31 06:25:00.512987	active	2015-08-31 06:25:00.726436	2015-08-31 06:25:00.726436
340	2	47	\N	\N	Italy	300.00	<p>1000 Lira, Small size, in good condition.</p>\r\n	20150807_010024-1.jpg	image/jpeg	3197063	2015-08-31 06:28:35.19428	active	2015-08-31 06:28:35.426358	2015-08-31 06:28:35.426358
341	2	47	\N	\N	Colombia	50.00	<p>10 Oro, Medium size,in medium condition.</p>\r\n	20150807_010151-1.jpg	image/jpeg	3814647	2015-08-31 06:38:41.061819	active	2015-08-31 06:38:41.269056	2015-08-31 06:38:41.269056
342	2	47	\N	\N	Mexico	250.00	<p>2000 Pesos, Medium size, in medium condition.</p>\r\n	20150807_010221-1.jpg	image/jpeg	3705297	2015-08-31 06:41:09.763259	active	2015-08-31 06:41:09.996769	2015-08-31 06:41:09.996769
343	2	47	\N	\N	Indonesia	200.00	<p>1000 Rupiah, Medium size, in medium condition.</p>\r\n	20150807_010300-1.jpg	image/jpeg	3936792	2015-08-31 06:43:48.257008	active	2015-08-31 06:43:48.552641	2015-08-31 06:43:48.552641
344	2	15	\N	\N	Estonia	100.00	<p>2 Krooni, Medium size, in medium condition.</p>\r\n	20150807_010334-1.jpg	image/jpeg	3302249	2015-08-31 06:45:47.945664	active	2015-08-31 06:45:48.137557	2015-08-31 06:45:48.137557
345	2	47	\N	\N	Bahrin	200.00	<p>1 Dinar, Medium size, in medium condition.</p>\r\n	20150807_010400-1.jpg	image/jpeg	3717033	2015-08-31 06:48:35.154486	active	2015-08-31 06:48:35.381629	2015-08-31 06:48:35.381629
346	2	15	\N	\N	Saudi Arabia	70.00	<p>1 Riyal, Medium size, in medium condition.</p>\r\n	20150807_010448-1.jpg	image/jpeg	3862923	2015-08-31 06:52:18.910581	active	2015-08-31 06:52:19.625208	2015-08-31 06:52:19.625208
347	2	47	\N	\N	Iraq	90.00	<p>5 Dinars, Medium size, in medium condition.</p>\r\n	20150807_010850-1.jpg	image/jpeg	3932377	2015-08-31 06:55:56.918965	active	2015-08-31 06:55:57.133837	2015-08-31 06:55:57.133837
348	2	15	\N	\N	Bahrin	200.00	<p>1 Dinar, Medium size, in medium condition.</p>\r\n	20150807_010400-1.jpg	image/jpeg	3717033	2015-08-31 06:56:17.616424	active	2015-08-31 06:56:17.838754	2015-08-31 06:56:17.838754
349	2	47	\N	\N	Turkey	200.00	<p>10000 Lira, Medium size,in medium condition.</p>\r\n	20150807_011033-1.jpg	image/jpeg	3876021	2015-08-31 06:58:08.736391	active	2015-08-31 06:58:08.938313	2015-08-31 06:58:08.938313
350	2	15	\N	\N	Pakistan	150.00	<p>10 Rupees, Medium size, torned right side.</p>\r\n	20150807_011205-1.jpg	image/jpeg	3833454	2015-08-31 07:02:29.107705	active	2015-08-31 07:02:30.075956	2015-08-31 07:02:30.075956
351	2	47	\N	\N	Italy	120.00	<p>1000 Lira, Small size, in medium condition.</p>\r\n	20150807_011233-1.jpg	image/jpeg	3548384	2015-08-31 07:04:42.417484	active	2015-08-31 07:04:42.616447	2015-08-31 07:04:42.616447
352	2	47	\N	\N	Indonesia	90.00	<p>100 Rupiah, Medium size, in medium condition.</p>\r\n	20150807_011257-1.jpg	image/jpeg	3483472	2015-08-31 07:06:48.862242	active	2015-08-31 07:06:49.247991	2015-08-31 07:06:49.247991
353	2	47	\N	\N	Iran	150.00	<p>100 Rials, Medium size, in medium condition.</p>\r\n	20150807_011355-1.jpg	image/jpeg	3647394	2015-08-31 07:23:00.050816	active	2015-08-31 07:23:00.594065	2015-08-31 07:23:00.594065
354	2	15	\N	\N	Italy	500.00	<p>1000 Lira, Small size, in good condition.</p>\r\n	20150807_011424-1.jpg	image/jpeg	3323199	2015-08-31 07:25:39.867049	active	2015-08-31 07:25:40.369112	2015-08-31 07:25:40.369112
355	2	47	\N	\N	Ukrain	100.00	<p>2 Hyrvnia, Small Sizem in medium condition.</p>\r\n	20150807_011501-1.jpg	image/jpeg	3116936	2015-08-31 07:27:51.38667	active	2015-08-31 07:27:51.770337	2015-08-31 07:27:51.770337
356	2	47	\N	\N	Russia	100.00	<p>100 Ruble, Small size, in medium condition.</p>\r\n	20150807_011514-1.jpg	image/jpeg	3326935	2015-08-31 07:30:36.082051	active	2015-08-31 07:30:36.326896	2015-08-31 07:30:36.326896
357	2	47	\N	\N	Vietnam	125.00	<p>200 Dong, Medium size, in good condition.</p>\r\n	20150807_114248-1.jpg	image/jpeg	3404612	2015-08-31 07:32:50.747926	active	2015-08-31 07:32:50.979921	2015-08-31 07:32:50.979921
358	2	47	\N	\N	Zaire	70.00	<p>1 Zaire, Medium condition, in good condition.</p>\r\n	20150807_114322-1.jpg	image/jpeg	4095078	2015-08-31 07:35:50.658171	active	2015-08-31 07:35:50.946858	2015-08-31 07:35:50.946858
359	2	47	\N	\N	Egypt	50.00	<p>1 Pound, Medium size, in good condition.</p>\r\n	20150807_114401-1.jpg	image/jpeg	3492133	2015-08-31 07:38:19.764042	active	2015-08-31 07:38:20.117359	2015-08-31 07:38:20.117359
360	2	47	\N	\N	Dominicana	70.00	<p>1 Oro, Medium size, in good condition.</p>\r\n	20150807_114611-1.jpg	image/jpeg	3804268	2015-08-31 07:41:05.623262	active	2015-08-31 07:41:05.855154	2015-08-31 07:41:05.855154
361	2	47	\N	\N	Oman	50.00	<p>100 Baiza, Medium size, in good condition.</p>\r\n	20150807_114651-1.jpg	image/jpeg	2979290	2015-08-31 07:43:17.509098	active	2015-08-31 07:43:17.772507	2015-08-31 07:43:17.772507
362	2	47	\N	\N	Russia	125.00	<p>200 Ruble, Medium size, in good condition.</p>\r\n	20150807_114751-1.jpg	image/jpeg	3021504	2015-08-31 07:44:56.284443	active	2015-08-31 07:44:56.751872	2015-08-31 07:44:56.751872
363	2	47	\N	\N	China 	35.00	<p>1 Yuan, Medium size, in medium condition.</p>\r\n	20150807_114813-1.jpg	image/jpeg	3639423	2015-08-31 07:47:42.523338	active	2015-08-31 07:47:42.741838	2015-08-31 07:47:42.741838
364	2	47	\N	\N	Srilanka	50.00	<p>50 Rupees, Medium size, in medium condition.</p>\r\n	20150807_114847-1.jpg	image/jpeg	4057314	2015-08-31 07:50:31.900931	active	2015-08-31 07:50:32.508254	2015-08-31 07:50:32.508254
365	2	47	\N	\N	Turkey 	250.00	<p>1000 Lira, Medium size, in good condition.</p>\r\n	20150807_115046-1.jpg	image/jpeg	4127671	2015-08-31 07:52:30.798881	active	2015-08-31 07:52:31.124766	2015-08-31 07:52:31.124766
366	2	47	\N	\N	Syria	150.00	<p>200 Dirahms, Medium size, in good condition.</p>\r\n	20150807_115155-1.jpg	image/jpeg	3112136	2015-08-31 09:07:04.442967	active	2015-08-31 09:07:04.574594	2015-08-31 09:07:04.574594
367	2	47	\N	\N	Lebabon	220.00	<p>500 Livers, Medium size,in good condition.</p>\r\n	20150807_115233-1.jpg	image/jpeg	4506489	2015-08-31 09:10:26.323759	active	2015-08-31 09:10:26.552983	2015-08-31 09:10:26.552983
368	2	47	\N	\N	United Arab Emirates	100.00	<p>5 Dirahms, Medium size, in good condition.</p>\r\n	20150807_115312-1.jpg	image/jpeg	3931554	2015-08-31 09:13:15.287999	active	2015-08-31 09:13:15.530671	2015-08-31 09:13:15.530671
369	2	15	\N	\N	Lebabon	150.00	<p>5 Livers, Medium size, in good condition.</p>\r\n	20150807_115411-1.jpg	image/jpeg	3510124	2015-08-31 09:15:36.708245	active	2015-08-31 09:15:36.87425	2015-08-31 09:15:36.87425
370	2	47	\N	\N	Argentina	70.00	<p>2 Pesos, Medium size,in good condition.</p>\r\n	20150807_115509-1.jpg	image/jpeg	3461170	2015-08-31 09:18:33.833881	active	2015-08-31 09:18:34.0299	2015-08-31 09:18:34.0299
371	2	47	\N	\N	South Koria	220.00	<p>1000 Won, Big sizem in good condition.</p>\r\n	20150807_115558-1.jpg	image/jpeg	3672848	2015-08-31 09:21:19.601826	active	2015-08-31 09:21:19.88687	2015-08-31 09:21:19.88687
372	2	47	\N	\N	Eygpt	60.00	<p>50 Piastres, Small size, in good condition.</p>\r\n	20150807_115642-1.jpg	image/jpeg	3819669	2015-08-31 09:23:31.071434	active	2015-08-31 09:23:31.745632	2015-08-31 09:23:31.745632
373	2	47	\N	\N	Lebabon	250.00	<p>5000 Livers, Medium size, in good condition.</p>\r\n	20150807_115716-1.jpg	image/jpeg	3367797	2015-08-31 09:25:49.407251	active	2015-08-31 09:25:49.845988	2015-08-31 09:25:49.845988
374	2	47	\N	\N	Ivory Coast	150.00	<p>500 Francs, Medium size, Slightly torned.</p>\r\n	20150807_115800-1.jpg	image/jpeg	3353291	2015-08-31 09:28:20.243761	active	2015-08-31 09:28:20.452413	2015-08-31 09:28:20.452413
375	2	47	\N	\N	Turkey	80.00	<p>10 Lirasi, Medium size, in good condition.</p>\r\n	20150807_115155-1.jpg	image/jpeg	3112136	2015-08-31 10:26:45.288899	active	2015-08-31 10:26:45.677425	2015-08-31 10:26:45.677425
376	2	47	\N	\N	Jordan	60.00	<p>1/2 Dinar, Medium sizem in me3dium condition.</p>\r\n	20150807_125118-1.jpg	image/jpeg	3713073	2015-08-31 10:29:36.404577	active	2015-08-31 10:29:36.556868	2015-08-31 10:29:36.556868
377	2	47	\N	\N	Lebabon	250.00	<p>1000 Livers, Mrdium size, in good condition.</p>\r\n	20150807_125138-1.jpg	image/jpeg	4017548	2015-08-31 10:32:46.116889	active	2015-08-31 10:32:46.300876	2015-08-31 10:32:46.300876
378	2	47	\N	\N	Indonesia	80.00	<p>100 Rupiah, Medium size, in good condition.</p>\r\n	20150807_125241-1.jpg	image/jpeg	3996970	2015-08-31 10:35:59.327106	active	2015-08-31 10:35:59.596016	2015-08-31 10:35:59.596016
379	2	15	\N	\N	USSR	180.00	<p>5 Rubles, Small size, in good condition.</p>\r\n	20150807_125354-1.jpg	image/jpeg	3614423	2015-08-31 10:37:04.523208	active	2015-08-31 10:37:04.689912	2015-08-31 10:37:04.689912
380	2	15	\N	\N	Italy	180.00	<p>5 Lira, Small size, in medium condition.</p>\r\n	20150807_141611-1.jpg	image/jpeg	3380467	2015-08-31 10:40:12.51405	active	2015-08-31 10:40:12.680633	2015-08-31 10:40:12.680633
381	2	15	\N	\N	France	220.00	<p>20 France, Medium sizem in good condition.</p>\r\n	20150807_141744-1.jpg	image/jpeg	3695715	2015-08-31 10:43:05.077162	active	2015-08-31 10:43:05.304325	2015-08-31 10:43:05.304325
382	2	15	\N	\N	Germany	1500.00	<p>1000 Marks, Big size, in good condition.</p>\r\n	20150807_142221-1.jpg	image/jpeg	3847228	2015-08-31 10:45:01.137193	active	2015-08-31 10:45:01.312413	2015-08-31 10:45:01.312413
383	2	15	\N	\N	Russia	1500.00	<p>5 Rubles, From 1909, Big size, Slightly cut on left corner.</p>\r\n	20150807_142259-1.jpg	image/jpeg	4888066	2015-08-31 10:49:27.086962	active	2015-08-31 10:49:27.312128	2015-08-31 10:49:27.312128
384	2	15	\N	\N	Germany	1850.00	<p>100 Marks, Big sizem in good condition.</p>\r\n	20150807_142409-1.jpg	image/jpeg	4437381	2015-08-31 10:51:44.917437	active	2015-08-31 10:51:45.231973	2015-08-31 10:51:45.231973
385	2	15	\N	\N	Germany	1500.00	<p>1000000 Marks, From 1923m Big size, in good condition.</p>\r\n	20150807_142433-1.jpg	image/jpeg	3827421	2015-08-31 10:52:52.220971	active	2015-08-31 10:52:52.401363	2015-08-31 10:52:52.401363
386	2	15	\N	\N	Germany	1700.00	<p>100 Marks, Big size, in good condition.</p>\r\n	20150807_142614-1.jpg	image/jpeg	4381654	2015-08-31 10:57:38.934993	active	2015-08-31 10:57:39.262491	2015-08-31 10:57:39.262491
387	2	15	\N	\N	Pakistan	300.00	<p>10 Rupees, Medium size, in good condition.</p>\r\n	20150807_142651-1.jpg	image/jpeg	3543441	2015-08-31 11:16:30.906535	active	2015-08-31 11:16:31.196408	2015-08-31 11:16:31.196408
388	2	15	\N	\N	Laos	250.00	<p>1000 Kip, Medium size, in good condition.</p>\r\n	20150807_142744-1.jpg	image/jpeg	3582286	2015-08-31 11:18:27.243779	active	2015-08-31 11:18:27.471323	2015-08-31 11:18:27.471323
389	2	15	\N	\N	Hungary	350.00	<p>1 Forint, From 1945, Medium size, in good condition.</p>\r\n	20150807_142849-1.jpg	image/jpeg	3616075	2015-08-31 11:22:11.044015	active	2015-08-31 11:22:11.942573	2015-08-31 11:22:11.942573
390	2	47	\N	\N	Indonesia	50.00	<p>500 Rupiah, Small size, in bad condition.</p>\r\n	20150807_142922-1.jpg	image/jpeg	3505928	2015-08-31 11:23:55.490431	active	2015-08-31 11:23:55.785017	2015-08-31 11:23:55.785017
391	2	15	\N	\N	Italy	400.00	<p>5 Lira, Small size, in medium condition.</p>\r\n	20150807_142952-1.jpg	image/jpeg	3156223	2015-08-31 11:26:04.685802	active	2015-08-31 11:26:04.933028	2015-08-31 11:26:04.933028
392	2	15	\N	\N	Hong Kong	650.00	<p>5 Dollars, Medium size, in good condition.</p>\r\n	20150807_143014-1.jpg	image/jpeg	3694951	2015-08-31 11:28:59.019708	active	2015-08-31 11:28:59.246586	2015-08-31 11:28:59.246586
393	2	15	\N	\N	France	350.00	<p>50 Francs, Medium size, in good condition.</p>\r\n	20150807_143114-1.jpg	image/jpeg	3757073	2015-08-31 11:31:14.661528	active	2015-08-31 11:31:14.885468	2015-08-31 11:31:14.885468
394	2	47	\N	\N	Brasil	175.00	<p>10000 Cruzados, Medium size, in good condition.</p>\r\n	20150807_143156-1.jpg	image/jpeg	3697348	2015-09-01 05:07:13.575056	active	2015-09-01 05:07:13.749669	2015-09-01 05:07:13.749669
395	2	47	\N	\N	Bulgeria	200.00	<p>500 Lev, Medium size, in good condition.</p>\r\n	20150807_143250-1.jpg	image/jpeg	3573746	2015-09-01 05:12:38.417284	active	2015-09-01 05:12:38.563338	2015-09-01 05:12:38.563338
396	2	47	\N	\N	Srilanka	500.00	<p>1000 Rupees, Medium size, in good condition.</p>\r\n	20150807_143419-1.jpg	image/jpeg	4048448	2015-09-01 05:14:18.928535	active	2015-09-01 05:14:19.094816	2015-09-01 05:14:19.094816
397	2	47	\N	\N	Iraq	275.00	<p>5 Dinars, Medium size, in medium condition.</p>\r\n	20150807_143456-1.jpg	image/jpeg	3486011	2015-09-01 05:27:09.508643	active	2015-09-01 05:27:09.635315	2015-09-01 05:27:09.635315
398	2	47	\N	\N	Zaire	220.00	<p>500 Zaires, Medium size, in medium condition.</p>\r\n	20150807_143543-1.jpg	image/jpeg	4279468	2015-09-01 05:29:29.918567	active	2015-09-01 05:29:30.086345	2015-09-01 05:29:30.086345
399	2	47	\N	\N	Zimbabwe	500.00	<p>One Hundred Thousand Dollars, Medium size,in good condition.</p>\r\n	20150807_143830-1.jpg	image/jpeg	3460245	2015-09-01 05:32:19.386636	active	2015-09-01 05:32:19.538695	2015-09-01 05:32:19.538695
400	2	47	\N	\N	Mongolia	80.00	<p>1 Tugric, Medium size , in good condition.</p>\r\n	20150807_143916-1.jpg	image/jpeg	3572147	2015-09-01 05:34:52.098501	active	2015-09-01 05:34:52.247473	2015-09-01 05:34:52.247473
401	2	47	\N	\N	Iraq	280.00	<p>25 Dinars, Big size, in good condition.</p>\r\n	20150807_144023-1.jpg	image/jpeg	3919819	2015-09-01 05:37:59.34168	active	2015-09-01 05:37:59.50325	2015-09-01 05:37:59.50325
402	2	15	\N	\N	Iraq	180.00	<p>100 dinars, Medium size, in good condition.</p>\r\n	20150807_144107-1.jpg	image/jpeg	3792210	2015-09-01 05:39:50.598437	active	2015-09-01 05:39:50.772183	2015-09-01 05:39:50.772183
403	2	15	\N	\N	Kuwait 	200.00	<p>10 Dinars, Medium size, in good condition.</p>\r\n	20150807_144216-1.jpg	image/jpeg	3691145	2015-09-01 05:42:50.572367	active	2015-09-01 05:42:50.731863	2015-09-01 05:42:50.731863
404	2	15	\N	\N	Romania	700.00	<p>5000 Lei, Small size, in good condition.</p>\r\n	20150807_144304-1.jpg	image/jpeg	3685154	2015-09-01 05:44:46.866565	active	2015-09-01 05:44:47.021152	2015-09-01 05:44:47.021152
405	2	47	\N	\N	Iran	400.00	<p>Twenty Thousand Rials, Medium size, in good condition.</p>\r\n	20150807_144520-1.jpg	image/jpeg	3892686	2015-09-01 05:48:18.542472	active	2015-09-01 05:48:18.787499	2015-09-01 05:48:18.787499
406	2	47	\N	\N	Israel	200.00	<p>100 Shekil, Medium size, in good condition.</p>\r\n	20150807_144631-1.jpg	image/jpeg	3730225	2015-09-01 05:50:23.366919	active	2015-09-01 05:50:23.666173	2015-09-01 05:50:23.666173
407	2	47	\N	\N	Guernsey	120.00	<p>One Pound, Medium size, in good condition.</p>\r\n	20150807_144708-1.jpg	image/jpeg	4556873	2015-09-01 05:53:39.096282	active	2015-09-01 05:53:39.294154	2015-09-01 05:53:39.294154
408	2	47	\N	\N	Venezuela	180.00	<p>500 Bolivares, Medium size, in medium condition.</p>\r\n	20150807_144741-1.jpg	image/jpeg	3694609	2015-09-01 05:55:36.41549	active	2015-09-01 05:55:36.624492	2015-09-01 05:55:36.624492
409	2	47	\N	\N	Zimbabwe	700.00	<p>Two Hundred Thousand Dollars, Medium size, in good condition.</p>\r\n	20150807_144923-1.jpg	image/jpeg	3379129	2015-09-01 05:58:05.535152	active	2015-09-01 05:58:05.726855	2015-09-01 05:58:05.726855
410	2	47	\N	\N	Czeckoslovkia	400.00	<p>10 Korun, Medium size, in good condition.</p>\r\n	20150807_145334-1.jpg	image/jpeg	4074048	2015-09-01 06:00:30.849133	active	2015-09-01 06:00:31.016754	2015-09-01 06:00:31.016754
411	2	47	\N	\N	Iran	250.00	<p>1000 Rials, Medium size, in good condition.</p>\r\n	20150807_145408-1.jpg	image/jpeg	3528308	2015-09-01 06:09:54.817573	active	2015-09-01 06:09:55.182074	2015-09-01 06:09:55.182074
412	2	47	\N	\N	Lebabon	400.00	<p>1000 Livers, Medium size, in good condition.</p>\r\n	20150807_145448-1.jpg	image/jpeg	4090161	2015-09-01 06:12:56.431497	active	2015-09-01 06:12:56.605927	2015-09-01 06:12:56.605927
413	2	47	\N	\N	Burma	180.00	<p>1000 Kyats, Big size, ingood condition.</p>\r\n	20150807_145509-1.jpg	image/jpeg	4260771	2015-09-01 06:14:43.634737	active	2015-09-01 06:14:44.070215	2015-09-01 06:14:44.070215
414	2	47	\N	\N	Spain 	180.00	<p>100 Pesetas, Medium size, in medium condition.</p>\r\n	20150807_145655-1.jpg	image/jpeg	3695455	2015-09-01 06:17:07.211207	active	2015-09-01 06:17:07.380881	2015-09-01 06:17:07.380881
415	2	47	\N	\N	Singapore	180.00	<p>5 Dollars, Medium size, in good condition.</p>\r\n	20150807_145738-1.jpg	image/jpeg	3892288	2015-09-01 06:19:27.955206	active	2015-09-01 06:19:28.116736	2015-09-01 06:19:28.116736
416	2	15	\N	\N	Hong Kong	150.00	<p>10 Dollars, Medium size, in bad condition.</p>\r\n	20150807_145831-1.jpg	image/jpeg	3854062	2015-09-01 06:31:18.43839	active	2015-09-01 06:31:18.727557	2015-09-01 06:31:18.727557
417	2	47	\N	\N	Chile	250.00	<p>10000 Pesos Medium size, in good condition.</p>\r\n	20150807_145907-1.jpg	image/jpeg	4032190	2015-09-01 07:01:59.291291	active	2015-09-01 07:01:59.592662	2015-09-01 07:01:59.592662
418	2	15	\N	\N	France	250.00	<p>10 Francs, Medium size, in good condition.</p>\r\n	20150807_145942(0)-1.jpg	image/jpeg	3452249	2015-09-01 07:04:29.762376	active	2015-09-01 07:04:29.94927	2015-09-01 07:04:29.94927
419	2	47	\N	\N	Zimbabwe	120.00	<p>20 Dollars, Medium size, in good condition.</p>\r\n	20150807_150011-1.jpg	image/jpeg	3668966	2015-09-01 07:06:53.392961	active	2015-09-01 07:06:53.560684	2015-09-01 07:06:53.560684
420	2	47	\N	\N	Zimbabwe	550.00	<p>Seven Hundred And Fifty Dollars, Medium size, in good condition.</p>\r\n	20150807_154718-1.jpg	image/jpeg	3747573	2015-09-01 07:10:29.022281	active	2015-09-01 07:10:29.217905	2015-09-01 07:10:29.217905
421	2	47	\N	\N	North Korea	120.00	<p>200 Won, Medium size, in good condition.&nbsp;</p>\r\n	20150806_224310-1.jpg	image/jpeg	4746586	2015-09-01 07:38:55.092162	active	2015-09-01 07:38:55.395447	2015-09-01 07:38:55.395447
422	2	45	\N	\N	Gandhi Rs 2	800.00	<p>2 Rupees Ghandi note in UNC condition, Small size, Mint condition.</p>\r\n	20150807_142816-1.jpg	image/jpeg	3358357	2015-09-01 07:41:47.779553	active	2015-09-01 07:41:47.959604	2015-09-01 07:41:47.959604
423	2	46	\N	\N	Mozambique	850.00	<p>100 Escudos in UNC condition, Big size, Mint condition.</p>\r\n	20150807_143328-1.jpg	image/jpeg	3392488	2015-09-01 07:45:20.506911	active	2015-09-01 07:45:23.632855	2015-09-01 07:45:23.632855
424	2	45	\N	\N	Gandhi Rs 5	900.00	<p>5 Rupees Gandhi note in UNC condition, Small size, in mint condition.</p>\r\n	20150807_144428-1.jpg	image/jpeg	3651903	2015-09-01 07:48:36.071631	active	2015-09-01 07:48:36.268479	2015-09-01 07:48:36.268479
425	2	45	\N	\N	Gandhi Rs 5	150.00	<p>5 Rupees Gandhi note in bad condition, Small size, bad condition.</p>\r\n	20150807_145757-1.jpg	image/jpeg	3619306	2015-09-01 07:53:21.73958	active	2015-09-01 07:53:22.004453	2015-09-01 07:53:22.004453
426	3	19	\N	\N	Postage due covers	2600.00	<p>Very rare covers.</p>\r\n	1.jpg	image/jpeg	1432937	2015-09-03 05:29:57.948796	active	2015-09-03 05:29:58.124415	2015-09-03 05:29:58.124415
427	3	19	\N	\N	Coins of Goa Cover	2000.00	<p>Very rare cover.</p>\r\n	2.jpg	image/jpeg	1903969	2015-09-03 05:31:28.905866	active	2015-09-03 05:31:29.076736	2015-09-03 05:31:29.076736
428	3	19	\N	\N	Goa Postage due cover	2200.00	<p>Very rare cover.</p>\r\n	3.jpg	image/jpeg	1689046	2015-09-03 05:32:38.818977	active	2015-09-03 05:32:38.977613	2015-09-03 05:32:38.977613
429	3	19	\N	\N	Very Special cover	1500.00	<p>India Portuguese and republic India stamps on Air-Mail cover&nbsp;</p>\r\n	4.jpg	image/jpeg	454808	2015-09-03 05:34:25.955748	active	2015-09-03 05:34:26.089142	2015-09-03 05:34:26.089142
430	3	19	\N	\N	IV Death Centenary of St. Francis Xavier	2000.00	<p>IV Death centenary of St. Francis Xavier, very rare.</p>\r\n	5.jpg	image/jpeg	2646943	2015-09-03 05:38:24.657374	active	2015-09-03 05:38:24.833192	2015-09-03 05:38:24.833192
431	3	48	\N	\N	USA	150.00	<p>Postally used covers.</p>\r\n	1.jpg	image/jpeg	1473278	2015-09-03 05:52:29.248558	active	2015-09-03 05:52:29.430278	2015-09-03 05:52:29.430278
432	3	48	\N	\N	Eygpt	150.00	<p>Postally used cover</p>\r\n	2.jpg	image/jpeg	1579999	2015-09-03 05:53:49.564541	active	2015-09-03 05:53:49.769119	2015-09-03 05:53:49.769119
434	3	48	\N	\N	Pakistan	300.00	<p>Postally used covers with extra seven stamps at the back.</p>\r\n	4.jpg	image/jpeg	1846196	2015-09-03 05:56:52.186102	active	2015-09-03 05:56:52.338165	2015-09-03 05:56:52.338165
435	3	48	\N	\N	Cuba	120.00	<p>FDC</p>\r\n	5.jpg	image/jpeg	1850865	2015-09-03 05:57:34.412483	active	2015-09-03 05:57:34.64481	2015-09-03 05:57:34.64481
437	3	48	\N	\N	Germany	200.00	<p>Se-Tenant postally used covers.</p>\r\n	7.jpg	image/jpeg	2163428	2015-09-03 06:00:44.733803	active	2015-09-03 06:00:44.993218	2015-09-03 06:00:44.993218
439	3	48	\N	\N	Germany	150.00	<p>Postally used cover</p>\r\n	9.jpg	image/jpeg	1676466	2015-09-03 06:03:52.541328	active	2015-09-03 06:03:53.065067	2015-09-03 06:03:53.065067
440	3	48	\N	\N	Kenya, Uganda, Tanganyika	150.00	<p>FDC</p>\r\n	11.jpg	image/jpeg	1361876	2015-09-03 06:05:47.888094	active	2015-09-03 06:05:48.032604	2015-09-03 06:05:48.032604
441	3	48	\N	\N	Tanganiyika	180.00	<p>Postally used cover</p>\r\n	10.jpg	image/jpeg	1735274	2015-09-03 06:07:34.769067	active	2015-09-03 06:07:36.63043	2015-09-03 06:07:36.63043
442	3	48	\N	\N	Kenya, Uganda, Tanganyika	200.00	<p>FDC</p>\r\n	12.jpg	image/jpeg	1664312	2015-09-03 06:08:13.93325	active	2015-09-03 06:08:14.077658	2015-09-03 06:08:14.077658
443	3	48	\N	\N	Tanganiyika	150.00	<p>FDC postally used .</p>\r\n	13.jpg	image/jpeg	1404498	2015-09-03 06:09:05.677828	active	2015-09-03 06:09:05.844488	2015-09-03 06:09:05.844488
444	3	48	\N	\N	Germany	100.00	<p>Postally used covers.</p>\r\n	14.jpg	image/jpeg	1610262	2015-09-03 06:10:08.805485	active	2015-09-03 06:10:08.94878	2015-09-03 06:10:08.94878
445	3	48	\N	\N	Kenya, Uganda, Tanganyika	120.00	<p>Kenya uganda Tanganyika. FDC</p>\r\n	15.jpg	image/jpeg	1800245	2015-09-03 06:11:41.473119	active	2015-09-03 06:11:41.690431	2015-09-03 06:11:41.690431
447	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	18.jpg	image/jpeg	1653798	2015-09-03 06:47:04.399334	active	2015-09-03 06:47:04.614017	2015-09-03 06:47:04.614017
448	3	48	\N	\N	Kenya, Uganda, Tanganyika	120.00	<p>FDC</p>\r\n	17.jpg	image/jpeg	1792444	2015-09-03 06:47:35.239572	active	2015-09-03 06:47:35.514808	2015-09-03 06:47:35.514808
449	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	19.jpg	image/jpeg	1836899	2015-09-03 06:48:37.864347	active	2015-09-03 06:48:38.056363	2015-09-03 06:48:38.056363
450	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	20.jpg	image/jpeg	1830840	2015-09-03 06:49:42.012173	active	2015-09-03 06:49:42.159747	2015-09-03 06:49:42.159747
451	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	21.jpg	image/jpeg	1800603	2015-09-03 06:50:38.124039	active	2015-09-03 06:50:38.334536	2015-09-03 06:50:38.334536
452	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	22.jpg	image/jpeg	1770718	2015-09-03 06:51:29.476232	active	2015-09-03 06:51:29.616217	2015-09-03 06:51:29.616217
453	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	23.jpg	image/jpeg	1731898	2015-09-03 06:52:16.498175	active	2015-09-03 06:52:16.635919	2015-09-03 06:52:16.635919
454	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	24.jpg	image/jpeg	1798150	2015-09-03 06:53:10.265728	active	2015-09-03 06:53:10.481375	2015-09-03 06:53:10.481375
455	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	25.jpg	image/jpeg	1679931	2015-09-03 06:53:59.726677	active	2015-09-03 06:53:59.870656	2015-09-03 06:53:59.870656
456	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	26.jpg	image/jpeg	1690433	2015-09-03 06:54:53.541917	active	2015-09-03 06:54:53.683678	2015-09-03 06:54:53.683678
457	3	49	\N	\N	Iraq	150.00	<p>postally used&nbsp;</p>\r\n	1.jpg	image/jpeg	1448186	2015-09-03 07:03:00.925458	active	2015-09-03 07:03:01.143858	2015-09-03 07:03:01.143858
458	3	49	\N	\N	Eygpt	200.00	<p>postally used</p>\r\n	3.jpg	image/jpeg	1814062	2015-09-03 07:04:11.219189	active	2015-09-03 07:04:11.566253	2015-09-03 07:04:11.566253
459	3	49	\N	\N	Canada	220.00	<p>postally used</p>\r\n	4.jpg	image/jpeg	2291955	2015-09-03 07:05:22.163714	active	2015-09-03 07:05:22.323773	2015-09-03 07:05:22.323773
460	3	49	\N	\N	Germany	280.00	<p>postally used</p>\r\n	5.jpg	image/jpeg	1856934	2015-09-03 07:06:04.48954	active	2015-09-03 07:06:04.645036	2015-09-03 07:06:04.645036
461	3	49	\N	\N	Czeckoslovkia	220.00	<p>postally used</p>\r\n	6.jpg	image/jpeg	1772153	2015-09-03 07:06:54.342152	active	2015-09-03 07:06:54.492486	2015-09-03 07:06:54.492486
462	3	49	\N	\N	Austria	220.00	<p>postally used</p>\r\n	8.jpg	image/jpeg	1659187	2015-09-03 07:07:56.367803	active	2015-09-03 07:07:56.526937	2015-09-03 07:07:56.526937
463	3	49	\N	\N	USA	290.00	<p>postally used</p>\r\n	9.jpg	image/jpeg	1918811	2015-09-03 07:13:14.407966	active	2015-09-03 07:13:14.572749	2015-09-03 07:13:14.572749
464	3	49	\N	\N	Danmark	850.00	<p>postally used</p>\r\n	10.jpg	image/jpeg	1891140	2015-09-03 07:14:22.440373	active	2015-09-03 07:14:22.58817	2015-09-03 07:14:22.58817
465	3	49	\N	\N	Czeckoslovkia	650.00	<p>postally used</p>\r\n	11.jpg	image/jpeg	2124252	2015-09-03 07:15:35.989487	active	2015-09-03 07:15:36.314548	2015-09-03 07:15:36.314548
466	3	49	\N	\N	Cuba	500.00	<p>postally used</p>\r\n	12.jpg	image/jpeg	2152883	2015-09-03 07:24:22.776177	active	2015-09-03 07:24:22.945738	2015-09-03 07:24:22.945738
467	3	49	\N	\N	Jordan	350.00	<p>postally used</p>\r\n	13.jpg	image/jpeg	2115952	2015-09-03 07:26:31.694146	active	2015-09-03 07:26:32.025251	2015-09-03 07:26:32.025251
468	3	49	\N	\N	Burundi	350.00	<p>postally used</p>\r\n	14.jpg	image/jpeg	2209311	2015-09-03 07:27:45.483145	active	2015-09-03 07:27:45.692354	2015-09-03 07:27:45.692354
469	3	49	\N	\N	Tunisia	150.00	<p>postally used</p>\r\n	15.jpg	image/jpeg	1932091	2015-09-03 07:29:40.323477	active	2015-09-03 07:29:40.491284	2015-09-03 07:29:40.491284
470	3	49	\N	\N	Burundi	350.00	<p>postally used</p>\r\n	16.jpg	image/jpeg	2270093	2015-09-03 07:32:45.702602	active	2015-09-03 07:32:46.141757	2015-09-03 07:32:46.141757
471	3	49	\N	\N	Swtizerland	400.00	<p>postally used</p>\r\n	17.jpg	image/jpeg	2295256	2015-09-03 07:34:46.178587	active	2015-09-03 07:34:46.478264	2015-09-03 07:34:46.478264
472	3	49	\N	\N	Iraq	150.00	<p>postally used</p>\r\n	18.jpg	image/jpeg	1804680	2015-09-03 07:36:27.209116	active	2015-09-03 07:36:27.439957	2015-09-03 07:36:27.439957
473	3	49	\N	\N	Tunisia	200.00	<p>postally used</p>\r\n	19.jpg	image/jpeg	1728894	2015-09-03 07:38:12.255935	active	2015-09-03 07:38:12.398122	2015-09-03 07:38:12.398122
474	3	49	\N	\N	Iraq	270.00	<p>postally used</p>\r\n	20.jpg	image/jpeg	1847507	2015-09-03 07:39:48.280071	active	2015-09-03 07:39:48.431196	2015-09-03 07:39:48.431196
475	3	49	\N	\N	USA	350.00	<p>postally used</p>\r\n	21.jpg	image/jpeg	2130259	2015-09-03 07:41:36.801889	active	2015-09-03 07:41:37.120498	2015-09-03 07:41:37.120498
476	3	49	\N	\N	Hungary	250.00	<p>postally used</p>\r\n	22.jpg	image/jpeg	1445754	2015-09-03 07:43:15.612147	active	2015-09-03 07:43:15.767238	2015-09-03 07:43:15.767238
477	3	49	\N	\N	Hungary	250.00	<p>postally used</p>\r\n	23.jpg	image/jpeg	2050827	2015-09-03 07:44:51.941384	active	2015-09-03 07:44:52.128442	2015-09-03 07:44:52.128442
478	3	49	\N	\N	USA	400.00	<p>postally used</p>\r\n	24.jpg	image/jpeg	2061631	2015-09-03 07:46:25.602521	active	2015-09-03 07:46:25.777085	2015-09-03 07:46:25.777085
479	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	25.jpg	image/jpeg	1934062	2015-09-03 07:48:06.585651	active	2015-09-03 07:48:06.747588	2015-09-03 07:48:06.747588
480	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	26.jpg	image/jpeg	1975686	2015-09-03 07:49:33.999305	active	2015-09-03 07:49:34.18853	2015-09-03 07:49:34.18853
481	3	49	\N	\N	USA	400.00	<p>FDC</p>\r\n	27.jpg	image/jpeg	1735195	2015-09-03 08:07:24.656398	active	2015-09-03 08:07:24.88276	2015-09-03 08:07:24.88276
482	3	49	\N	\N	Kenya 	350.00	<p>postally used.</p>\r\n	28.jpg	image/jpeg	2341604	2015-09-03 08:09:24.984718	active	2015-09-03 08:09:25.236896	2015-09-03 08:09:25.236896
483	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	29.jpg	image/jpeg	1930429	2015-09-03 08:11:10.455986	active	2015-09-03 08:11:10.619946	2015-09-03 08:11:10.619946
484	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	30.jpg	image/jpeg	1896356	2015-09-03 08:12:45.487936	active	2015-09-03 08:12:45.877214	2015-09-03 08:12:45.877214
485	3	49	\N	\N	USA	500.00	<p>FDC</p>\r\n	31.jpg	image/jpeg	2313904	2015-09-03 08:16:14.727347	active	2015-09-03 08:16:14.8931	2015-09-03 08:16:14.8931
486	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	32.jpg	image/jpeg	1887991	2015-09-03 08:17:51.518567	active	2015-09-03 08:17:51.803567	2015-09-03 08:17:51.803567
446	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>FDC</p>\r\n	16.jpg	image/jpeg	1650034	2015-09-03 06:12:31.751523	active	2015-09-03 06:12:32.038804	2015-09-03 08:56:59.874946
438	3	48	\N	\N	Kenya Uganda Tanganyika	120.00	<p>Kenya Uganda Tanganyika. FDC</p>\r\n	8.jpg	image/jpeg	1668703	2015-09-03 06:02:58.142086	active	2015-09-03 06:02:58.528211	2015-09-03 08:58:46.868822
488	3	49	\N	\N	Tanganiyika	300.00	<p>postally used</p>\r\n	35.jpg	image/jpeg	1460859	2015-09-03 08:20:52.697383	active	2015-09-03 08:20:52.881793	2015-09-03 08:20:52.881793
489	3	49	\N	\N	Zenzibar	1500.00	<p>postally used</p>\r\n	36.jpg	image/jpeg	1834740	2015-09-03 08:22:39.621585	active	2015-09-03 08:22:39.820636	2015-09-03 08:22:39.820636
490	3	49	\N	\N	USA	800.00	<p>FDC</p>\r\n	37.jpg	image/jpeg	1577585	2015-09-03 08:24:11.493403	active	2015-09-03 08:24:11.777162	2015-09-03 08:24:11.777162
491	3	49	\N	\N	USA	400.00	<p>FDC</p>\r\n	38.jpg	image/jpeg	1439400	2015-09-03 08:25:41.44957	active	2015-09-03 08:25:41.677412	2015-09-03 08:25:41.677412
492	3	49	\N	\N	USA	400.00	<p>FDC</p>\r\n	39.jpg	image/jpeg	1582511	2015-09-03 08:27:07.920017	active	2015-09-03 08:27:08.095142	2015-09-03 08:27:08.095142
493	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	40.jpg	image/jpeg	1479001	2015-09-03 08:28:41.213706	active	2015-09-03 08:28:41.387744	2015-09-03 08:28:41.387744
494	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	41.jpg	image/jpeg	1545533	2015-09-03 08:30:07.861887	active	2015-09-03 08:30:08.041205	2015-09-03 08:30:08.041205
495	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	42.jpg	image/jpeg	1420330	2015-09-03 08:31:34.393419	active	2015-09-03 08:31:34.601353	2015-09-03 08:31:34.601353
496	3	49	\N	\N	Indian Cover	120.00	<p>postally used</p>\r\n	43.jpg	image/jpeg	1379838	2015-09-03 08:33:33.539089	active	2015-09-03 08:33:33.745076	2015-09-03 08:33:33.745076
497	3	49	\N	\N	USA	300.00	<p>FDC</p>\r\n	44.jpg	image/jpeg	1512750	2015-09-03 08:34:57.882182	active	2015-09-03 08:34:58.063009	2015-09-03 08:34:58.063009
498	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	45.jpg	image/jpeg	1443496	2015-09-03 08:36:17.175787	active	2015-09-03 08:36:17.351345	2015-09-03 08:36:17.351345
499	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	46.jpg	image/jpeg	1238820	2015-09-03 08:37:32.940605	active	2015-09-03 08:37:33.162092	2015-09-03 08:37:33.162092
500	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	47.jpg	image/jpeg	1524300	2015-09-03 08:39:04.162416	active	2015-09-03 08:39:04.325041	2015-09-03 08:39:04.325041
501	3	49	\N	\N	USA	500.00	<p>FDC</p>\r\n	48.jpg	image/jpeg	1623053	2015-09-03 08:40:43.353131	active	2015-09-03 08:40:43.524942	2015-09-03 08:40:43.524942
502	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	49.jpg	image/jpeg	1541964	2015-09-03 08:42:13.106923	active	2015-09-03 08:42:13.691884	2015-09-03 08:42:13.691884
503	3	49	\N	\N	USA	350.00	<p>FDC</p>\r\n	50.jpg	image/jpeg	1465045	2015-09-03 08:43:29.261861	active	2015-09-03 08:43:29.864078	2015-09-03 08:43:29.864078
504	3	49	\N	\N	France	300.00	<p>postally used</p>\r\n	51.jpg	image/jpeg	1449540	2015-09-03 08:44:59.430134	active	2015-09-03 08:44:59.875139	2015-09-03 08:44:59.875139
433	3	48	\N	\N	Kenya Uganda Tanganyika	150.00	<p>FDC</p>\r\n	3.jpg	image/jpeg	1285781	2015-09-03 05:55:18.161539	active	2015-09-03 05:55:18.397065	2015-09-03 08:53:35.850732
436	3	48	\N	\N	Kenya Uganda Tanganyika	250.00	<p>Kenya Uganda Tanganyika, FDC.</p>\r\n	6.jpg	image/jpeg	1347955	2015-09-03 05:58:58.596846	active	2015-09-03 05:58:58.876088	2015-09-03 08:54:47.310883
505	3	20	\N	\N	India Republic	17.00	<p>Post card</p>\r\n	1.jpg	image/jpeg	2997658	2015-09-04 08:57:44.141097	active	2015-09-04 08:57:44.321122	2015-09-04 08:57:44.321122
506	3	20	\N	\N	Brochure Lable	50.00	<p>lable</p>\r\n	3.jpg	image/jpeg	1852978	2015-09-04 09:01:13.412593	active	2015-09-04 09:01:13.545323	2015-09-04 09:01:13.545323
507	3	20	\N	\N	India Republic	17.00	<p>Post card</p>\r\n	4.jpg	image/jpeg	2209717	2015-09-04 09:03:26.732274	active	2015-09-04 09:03:26.967538	2015-09-04 09:03:26.967538
509	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	6.jpg	image/jpeg	2457151	2015-09-04 09:06:56.377663	active	2015-09-04 09:06:56.564949	2015-09-04 09:06:56.564949
510	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	7.jpg	image/jpeg	2517712	2015-09-04 09:09:55.642557	active	2015-09-04 09:09:55.922899	2015-09-04 09:09:55.922899
511	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	8.jpg	image/jpeg	2483251	2015-09-04 09:14:07.424655	active	2015-09-04 09:14:07.695472	2015-09-04 09:14:07.695472
512	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	9.jpg	image/jpeg	2360757	2015-09-04 09:16:06.957473	active	2015-09-04 09:16:07.267403	2015-09-04 09:16:07.267403
513	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	10.jpg	image/jpeg	2666493	2015-09-04 09:18:01.992065	active	2015-09-04 09:18:02.189248	2015-09-04 09:18:02.189248
514	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	11.jpg	image/jpeg	2680608	2015-09-04 09:19:56.828046	active	2015-09-04 09:19:56.981378	2015-09-04 09:19:56.981378
515	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	12.jpg	image/jpeg	2594046	2015-09-04 09:21:46.029301	active	2015-09-04 09:21:46.402061	2015-09-04 09:21:46.402061
516	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	13.jpg	image/jpeg	1939831	2015-09-04 09:23:17.20962	active	2015-09-04 09:23:17.453677	2015-09-04 09:23:17.453677
517	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	14.jpg	image/jpeg	1952621	2015-09-04 09:25:21.099318	active	2015-09-04 09:25:21.290406	2015-09-04 09:25:21.290406
518	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	15.jpg	image/jpeg	2782611	2015-09-04 09:27:13.903094	active	2015-09-04 09:27:14.358677	2015-09-04 09:27:14.358677
519	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	16.jpg	image/jpeg	2930861	2015-09-04 09:29:16.742012	active	2015-09-04 09:29:16.962865	2015-09-04 09:29:16.962865
520	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	17.jpg	image/jpeg	3216974	2015-09-04 09:31:20.339186	active	2015-09-04 09:31:20.510969	2015-09-04 09:31:20.510969
521	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	18.jpg	image/jpeg	2064857	2015-09-04 09:32:59.213019	active	2015-09-04 09:32:59.381998	2015-09-04 09:32:59.381998
522	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	19.jpg	image/jpeg	1982101	2015-09-04 09:34:35.543732	active	2015-09-04 09:34:35.730927	2015-09-04 09:34:35.730927
523	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	20.jpg	image/jpeg	3141014	2015-09-04 09:36:15.123404	active	2015-09-04 09:36:15.329043	2015-09-04 09:36:15.329043
524	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	21.jpg	image/jpeg	2848157	2015-09-04 09:37:02.76165	active	2015-09-04 09:37:02.932957	2015-09-04 09:37:02.932957
525	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	22.jpg	image/jpeg	1958538	2015-09-04 09:37:53.350888	active	2015-09-04 09:37:53.543595	2015-09-04 09:37:53.543595
526	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	23.jpg	image/jpeg	2401352	2015-09-04 09:39:25.399157	active	2015-09-04 09:39:25.659497	2015-09-04 09:39:25.659497
527	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	24.jpg	image/jpeg	2840834	2015-09-04 09:40:08.996405	active	2015-09-04 09:40:09.313091	2015-09-04 09:40:09.313091
528	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	25.jpg	image/jpeg	2003195	2015-09-04 09:41:02.56745	active	2015-09-04 09:41:02.71961	2015-09-04 09:41:02.71961
529	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	26.jpg	image/jpeg	1954084	2015-09-04 09:41:49.931767	active	2015-09-04 09:41:50.209975	2015-09-04 09:41:50.209975
530	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	27.jpg	image/jpeg	2010418	2015-09-04 09:42:48.536648	active	2015-09-04 09:42:48.788399	2015-09-04 09:42:48.788399
531	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	28.jpg	image/jpeg	2975705	2015-09-04 09:44:15.49623	active	2015-09-04 09:44:15.658461	2015-09-04 09:44:15.658461
532	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	29.jpg	image/jpeg	2872940	2015-09-04 09:44:59.907149	active	2015-09-04 09:45:00.09092	2015-09-04 09:45:00.09092
533	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	30.jpg	image/jpeg	956749	2015-09-04 09:45:26.774763	active	2015-09-04 09:45:26.961771	2015-09-04 09:45:26.961771
534	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	31.jpg	image/jpeg	2920986	2015-09-04 09:47:11.578297	active	2015-09-04 09:47:12.363079	2015-09-04 09:47:12.363079
535	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	32.jpg	image/jpeg	2087421	2015-09-04 09:47:39.770196	active	2015-09-04 09:47:40.058769	2015-09-04 09:47:40.058769
536	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	33.jpg	image/jpeg	3311291	2015-09-04 09:49:26.188395	active	2015-09-04 09:49:26.555299	2015-09-04 09:49:26.555299
537	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	34.jpg	image/jpeg	2904216	2015-09-04 09:50:13.634544	active	2015-09-04 09:50:13.827579	2015-09-04 09:50:13.827579
538	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	35.jpg	image/jpeg	2813567	2015-09-04 09:51:15.408796	active	2015-09-04 09:51:15.968003	2015-09-04 09:51:15.968003
539	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	36.jpg	image/jpeg	3893335	2015-09-04 09:52:45.038379	active	2015-09-04 09:52:45.44023	2015-09-04 09:52:45.44023
540	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	37.jpg	image/jpeg	4637461	2015-09-04 09:55:35.856002	active	2015-09-04 09:55:36.086658	2015-09-04 09:55:36.086658
541	\N	\N	\N	\N	India Republic	17.00	<p>post card</p>\r\n	38.jpg	image/jpeg	2705973	2015-09-04 09:57:49.928372	active	2015-09-04 09:57:50.520577	2015-09-04 09:57:50.520577
542	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	38.jpg	image/jpeg	2705973	2015-09-04 10:02:06.687865	active	2015-09-04 10:02:06.989531	2015-09-04 10:02:06.989531
543	3	7	\N	\N	India Republic	17.00	<p>post card</p>\r\n	39.jpg	image/jpeg	3040598	2015-09-04 10:06:45.204333	active	2015-09-04 10:06:45.415308	2015-09-04 10:06:45.415308
544	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	40.jpg	image/jpeg	4300560	2015-09-04 10:09:19.75078	active	2015-09-04 10:09:20.42766	2015-09-04 10:09:20.42766
545	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	41.jpg	image/jpeg	2964148	2015-09-04 10:11:44.926216	active	2015-09-04 10:11:45.188091	2015-09-04 10:11:45.188091
546	3	20	\N	\N	India Republic	17.00	<p>post card</p>\r\n	42.jpg	image/jpeg	2838919	2015-09-04 10:14:07.083442	active	2015-09-04 10:14:07.439863	2015-09-04 10:14:07.439863
547	3	20	\N	\N	USA	125.00	<p>post card</p>\r\n	22.jpg	image/jpeg	1500138	2015-09-04 10:33:20.499878	active	2015-09-04 10:33:20.689664	2015-09-04 10:33:20.689664
548	3	20	\N	\N	USA	125.00	<p>post card</p>\r\n	25.jpg	image/jpeg	1526809	2015-09-04 10:34:48.560208	active	2015-09-04 10:34:49.346509	2015-09-04 10:34:49.346509
549	3	20	\N	\N	USA	125.00	<p>post card</p>\r\n	26.jpg	image/jpeg	1792873	2015-09-04 10:36:24.269274	active	2015-09-04 10:36:24.477229	2015-09-04 10:36:24.477229
550	3	20	\N	\N	USA	125.00	<p>post card</p>\r\n	24.jpg	image/jpeg	1295090	2015-09-04 10:37:36.083023	active	2015-09-04 10:37:36.512422	2015-09-04 10:37:36.512422
551	3	20	\N	\N	Madagascar - WWF	175.00	<p>post card</p>\r\n	23.jpg	image/jpeg	2811305	2015-09-04 10:41:22.216114	active	2015-09-04 10:41:23.454153	2015-09-04 10:41:23.454153
552	3	20	\N	\N	Madagascar - WWF	175.00	<p>post card</p>\r\n	1.jpg	image/jpeg	4690145	2015-09-04 10:44:00.630299	active	2015-09-04 10:44:00.852488	2015-09-04 10:44:00.852488
553	3	20	\N	\N	Madagascar - WWF	175.00	<p>post card</p>\r\n	2.jpg	image/jpeg	5562995	2015-09-04 10:46:48.121653	active	2015-09-04 10:46:48.34783	2015-09-04 10:46:48.34783
554	3	20	\N	\N	Madagascar - WWF	175.00	<p>post card</p>\r\n	3.jpg	image/jpeg	6005895	2015-09-04 10:49:42.142134	active	2015-09-04 10:49:42.36372	2015-09-04 10:49:42.36372
555	3	20	\N	\N	Bhutan - 3D	250.00	<p>post card</p>\r\n	4.jpg	image/jpeg	3058389	2015-09-04 10:53:04.128175	active	2015-09-04 10:53:04.347336	2015-09-04 10:53:04.347336
556	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	12.jpg	image/jpeg	2364331	2015-09-04 10:57:32.704913	active	2015-09-04 10:57:32.972716	2015-09-04 10:57:32.972716
557	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	27.jpg	image/jpeg	2166875	2015-09-04 11:00:09.039333	active	2015-09-04 11:00:09.31489	2015-09-04 11:00:09.31489
558	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	11.jpg	image/jpeg	2425971	2015-09-04 11:01:48.889466	active	2015-09-04 11:01:49.335471	2015-09-04 11:01:49.335471
559	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	18.jpg	image/jpeg	2468662	2015-09-04 11:03:30.230228	active	2015-09-04 11:03:30.558304	2015-09-04 11:03:30.558304
560	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	19.jpg	image/jpeg	2561330	2015-09-04 11:05:42.485719	active	2015-09-04 11:05:42.683642	2015-09-04 11:05:42.683642
561	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	20.jpg	image/jpeg	2437199	2015-09-04 11:07:07.544266	active	2015-09-04 11:07:08.216195	2015-09-04 11:07:08.216195
562	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	21.jpg	image/jpeg	2574892	2015-09-04 11:07:45.420442	active	2015-09-04 11:07:45.615908	2015-09-04 11:07:45.615908
563	3	20	\N	\N	UK	125.00	<p>post card</p>\r\n	21.jpg	image/jpeg	2574892	2015-09-04 11:12:39.943112	active	2015-09-04 11:12:40.242519	2015-09-04 11:12:40.242519
564	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	5.jpg	image/jpeg	3045316	2015-09-04 11:16:26.370995	active	2015-09-04 11:16:26.566297	2015-09-04 11:16:26.566297
565	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	6.jpg	image/jpeg	3530709	2015-09-04 11:18:43.369509	active	2015-09-04 11:18:43.556261	2015-09-04 11:18:43.556261
566	3	20	\N	\N	UK	200.00	<p>posr card</p>\r\n	7.jpg	image/jpeg	3263407	2015-09-04 11:20:06.751101	active	2015-09-04 11:20:07.145559	2015-09-04 11:20:07.145559
567	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	8.jpg	image/jpeg	3051811	2015-09-04 11:20:45.037559	active	2015-09-04 11:20:45.300176	2015-09-04 11:20:45.300176
568	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	9.jpg	image/jpeg	3127452	2015-09-04 11:22:01.633738	active	2015-09-04 11:22:02.030036	2015-09-04 11:22:02.030036
569	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	10.jpg	image/jpeg	2107749	2015-09-04 11:22:45.365289	active	2015-09-04 11:22:45.601503	2015-09-04 11:22:45.601503
570	3	20	\N	\N	UK	200.00	<p>post card</p>\r\n	13.jpg	image/jpeg	2259151	2015-09-04 11:23:48.984246	active	2015-09-04 11:23:49.251336	2015-09-04 11:23:49.251336
571	3	20	\N	\N	UK	150.00	<p>post card</p>\r\n	14.jpg	image/jpeg	2547412	2015-09-04 11:24:53.724883	active	2015-09-04 11:24:54.415782	2015-09-04 11:24:54.415782
572	3	20	\N	\N	UK	150.00	<p>post card</p>\r\n	15.jpg	image/jpeg	2628790	2015-09-04 11:25:50.789513	active	2015-09-04 11:25:51.291232	2015-09-04 11:25:51.291232
573	3	20	\N	\N	UK	150.00	<p>post card</p>\r\n	16.jpg	image/jpeg	2348759	2015-09-04 11:26:46.847554	active	2015-09-04 11:26:47.054633	2015-09-04 11:26:47.054633
574	3	20	\N	\N	UK	150.00	<p>post card</p>\r\n	17.jpg	image/jpeg	2444083	2015-09-04 11:27:40.729592	active	2015-09-04 11:27:41.12241	2015-09-04 11:27:41.12241
576	3	18	2	MSCW1	Tuvalu	250.00	<p>*</p>\r\n	1.jpg	image/jpeg	4715149	2015-09-11 23:53:59.517329	active	2015-09-11 23:53:59.541687	2015-09-11 23:53:59.541687
577	3	19	\N	MSCW2	St. Vincent	250.00	<p>*</p>\r\n	2.jpg	image/jpeg	3576045	2015-09-11 23:59:35.65813	active	2015-09-11 23:59:35.679319	2015-09-11 23:59:35.679319
579	3	19	\N	MSCW2	Antigua & Barbuda	200.00	<p>*</p>\r\n	2.jpg	image/jpeg	3576045	2015-09-12 00:34:31.18774	active	2015-09-12 00:34:31.210215	2015-09-12 00:34:31.210215
581	3	18	2	MSCW4	Grenada Grenadines	200.00	<p>*</p>\r\n	4.jpg	image/jpeg	3417182	2015-09-12 01:10:12.678135	active	2015-09-12 01:10:12.702165	2015-09-12 01:10:12.702165
583	3	18	2	MSCW5	Solomon Island	250.00	<p>*</p>\r\n	5.jpg	image/jpeg	3270718	2015-09-12 01:17:03.268823	active	2015-09-12 01:17:03.29234	2015-09-12 01:17:03.29234
586	3	19	\N	MSCW6	Solomon Island	350.00	<p>*</p>\r\n	6.jpg	image/jpeg	2741289	2015-09-12 01:30:58.58805	active	2015-09-12 01:30:58.609286	2015-09-12 01:30:58.609286
587	3	18	2	MSCW7	St. Vincent	175.00	<p>*</p>\r\n	7.jpg	image/jpeg	3200840	2015-09-12 01:44:25.962435	active	2015-09-12 01:44:25.985908	2015-09-12 01:44:25.985908
588	3	18	2	MSCW8	Solomon Island	250.00	<p>*</p>\r\n	8.jpg	image/jpeg	2995440	2015-09-12 01:51:19.314549	active	2015-09-12 01:51:19.337933	2015-09-12 01:51:19.337933
589	3	18	2	MSCW9	St. Vincent	250.00	<p>*</p>\r\n	9.jpg	image/jpeg	3163522	2015-09-12 01:58:06.555432	active	2015-09-12 01:58:06.578694	2015-09-12 01:58:06.578694
590	3	18	3	MSRW1	Srilanka	225.00	<p>*</p>\r\n	1.jpg	image/jpeg	3709952	2015-09-14 23:45:25.269613	active	2015-09-14 23:45:25.296371	2015-09-14 23:45:25.296371
592	3	18	3	MSRW2	Thailand	225.00	<p>*</p>\r\n	2.jpg	image/jpeg	3087733	2015-09-14 23:48:57.199378	active	2015-09-14 23:48:57.220804	2015-09-14 23:48:57.220804
594	3	18	3	MSRW3	Bhutan	200.00	<p>*</p>\r\n	3.jpg	image/jpeg	1774665	2015-09-14 23:52:55.880525	active	2015-09-14 23:52:55.898158	2015-09-14 23:52:55.898158
595	3	18	3	MSRW4	Srilanka	350.00	<p>*</p>\r\n	4.jpg	image/jpeg	2779632	2015-09-14 23:56:17.509517	active	2015-09-14 23:56:17.530491	2015-09-14 23:56:17.530491
597	3	18	3	MSRW5	Srilanka	250.00	<p>*</p>\r\n	5.jpg	image/jpeg	3192243	2015-09-14 23:59:38.815856	active	2015-09-14 23:59:38.865889	2015-09-14 23:59:38.865889
598	3	18	3	MSRW6	Srilanka	750.00	<p>*</p>\r\n	6.jpg	image/jpeg	4299118	2015-09-15 00:03:35.199454	active	2015-09-15 00:03:35.225221	2015-09-15 00:03:35.225221
599	3	18	3	MSRW7	Dahomay	850.00	<p>*</p>\r\n	7.jpg	image/jpeg	1872049	2015-09-15 00:07:58.425584	active	2015-09-15 00:07:58.44406	2015-09-15 00:07:58.44406
600	3	18	3	MSRW8	Srilanka	300.00	<p>*</p>\r\n	8.jpg	image/jpeg	3906134	2015-09-15 00:11:35.320184	active	2015-09-15 00:11:35.345334	2015-09-15 00:11:35.345334
601	3	18	3	MSRW9	Zaire	275.00	<p>*</p>\r\n	9.jpg	image/jpeg	4220340	2015-09-15 00:14:45.999826	active	2015-09-15 00:14:46.025919	2015-09-15 00:14:46.025919
602	3	18	3	MSRW10	Zaire	275.00	<p>*</p>\r\n	10.jpg	image/jpeg	4156296	2015-09-15 00:17:50.12959	active	2015-09-15 00:17:50.153568	2015-09-15 00:17:50.153568
603	3	18	3	MSRW11	India	300.00	<p>*</p>\r\n	11.jpg	image/jpeg	3896685	2015-09-15 00:20:48.417834	active	2015-09-15 00:20:48.441761	2015-09-15 00:20:48.441761
604	3	18	3	MSRE12	Zaire	275.00	<p>*</p>\r\n	12.jpg	image/jpeg	2477706	2015-09-15 00:24:44.034181	active	2015-09-15 00:24:44.053914	2015-09-15 00:24:44.053914
605	3	18	3	MSRW13	France	500.00	<p>*</p>\r\n	13.jpg	image/jpeg	5614226	2015-09-15 00:27:32.48921	active	2015-09-15 00:27:32.518358	2015-09-15 00:27:32.518358
606	3	18	3	MSRW14	Srilanka	400.00	<p>*</p>\r\n	14.jpg	image/jpeg	3285256	2015-09-15 00:30:48.632298	active	2015-09-15 00:30:48.654723	2015-09-15 00:30:48.654723
607	3	18	3	MSRW15	Srilanka	200.00	<p>*</p>\r\n	15.jpg	image/jpeg	4534812	2015-09-15 00:33:47.126339	active	2015-09-15 00:33:47.152293	2015-09-15 00:33:47.152293
608	3	18	3	MSRW16	Zaire	300.00	<p>*</p>\r\n	16.jpg	image/jpeg	2640822	2015-09-15 00:37:01.760552	active	2015-09-15 00:37:01.781474	2015-09-15 00:37:01.781474
609	3	18	3	MSRW17	North Korea	300.00	<p>*</p>\r\n	17.jpg	image/jpeg	4298894	2015-09-15 00:40:40.38407	active	2015-09-15 00:40:40.409902	2015-09-15 00:40:40.409902
610	3	18	3	MSRW18	North Korea	300.00	<p>*</p>\r\n	18.jpg	image/jpeg	3353550	2015-09-15 00:44:29.888833	active	2015-09-15 00:44:29.912118	2015-09-15 00:44:29.912118
580	3	18	2	MSCW2	Antigua & Barbuda	200.00	<p>*</p>\r\n	2.jpg	image/jpeg	3576045	2015-09-15 01:57:18.666589	active	2015-09-12 01:03:56.421619	2015-09-15 01:57:18.690662
582	3	18	2	MSCW3	Antigua & Barbuda	175.00	<p>*</p>\r\n	3.jpg	image/jpeg	4812772	2015-09-15 02:00:03.21609	active	2015-09-12 01:14:24.820369	2015-09-15 02:00:03.242926
611	3	18	2	MSCW6	Solomon Island	350.00	<p>*</p>\r\n	6.jpg	image/jpeg	2741289	2015-09-15 02:07:33.145652	active	2015-09-15 02:07:33.167898	2015-09-15 02:07:33.167898
612	3	18	4	MSFW1	Nicaragua	175.00	<p>*</p>\r\n	1.jpg	image/jpeg	2989586	2015-09-15 21:27:32.49715	active	2015-09-15 21:27:32.528979	2015-09-15 21:27:32.528979
613	3	18	4	MSFW2	Mauritania	175.00	<p>*</p>\r\n	2.jpg	image/jpeg	2021063	2015-09-15 21:30:31.670054	active	2015-09-15 21:30:31.690248	2015-09-15 21:30:31.690248
614	3	18	4	MSFW3	Sharza	175.00	<p>UAE</p>\r\n	3.jpg	image/jpeg	2955620	2015-09-15 21:33:02.931649	active	2015-09-15 21:33:02.962368	2015-09-15 21:33:02.962368
615	3	18	4	MSFW4	Sharza	175.00	<p>UAE</p>\r\n	4.jpg	image/jpeg	2559562	2015-09-15 21:35:43.627892	active	2015-09-15 21:35:43.648832	2015-09-15 21:35:43.648832
616	3	18	4	MSFW5	Mauritania	175.00	<p>*</p>\r\n	5.jpg	image/jpeg	4129291	2015-09-15 21:38:36.786872	active	2015-09-15 21:38:36.813485	2015-09-15 21:38:36.813485
617	3	18	4	MSFW6	North Korea	175.00	<p>*</p>\r\n	6.jpg	image/jpeg	3795167	2015-09-15 21:41:12.215821	active	2015-09-15 21:41:12.240175	2015-09-15 21:41:12.240175
618	3	19	\N	MSFW7	Congo	300.00	<p>*</p>\r\n	7.jpg	image/jpeg	3060683	2015-09-15 21:43:52.7911	active	2015-09-15 21:43:52.813694	2015-09-15 21:43:52.813694
619	3	19	\N	MSFW8	North Korea	200.00	<p>*</p>\r\n	8.jpg	image/jpeg	5230697	2015-09-15 21:46:48.765667	active	2015-09-15 21:46:48.794916	2015-09-15 21:46:48.794916
620	3	19	\N	MSFW9	Tanzania	250.00	<p>*</p>\r\n	9.jpg	image/jpeg	2535123	2015-09-15 21:49:28.276065	active	2015-09-15 21:49:28.297033	2015-09-15 21:49:28.297033
621	3	18	4	MSFW10	Nepal	175.00	<p>*</p>\r\n	10.jpg	image/jpeg	3983027	2015-09-15 21:52:38.446829	active	2015-09-15 21:52:38.4734	2015-09-15 21:52:38.4734
622	3	18	4	MSFW11	North Korea	175.00	<p>*</p>\r\n	11.jpg	image/jpeg	3388866	2015-09-15 21:55:43.378935	active	2015-09-15 21:55:43.402415	2015-09-15 21:55:43.402415
624	3	18	4	MSFW13	North Korea	175.00	<p>*</p>\r\n	13.jpg	image/jpeg	4083157	2015-09-15 22:03:02.07288	active	2015-09-15 22:03:02.098306	2015-09-15 22:03:02.098306
625	3	19	\N	MSFW14	Nicaragua	175.00	<p>*</p>\r\n	14.jpg	image/jpeg	3343325	2015-09-15 22:07:08.142435	active	2015-09-15 22:07:08.166871	2015-09-15 22:07:08.166871
626	3	19	\N	MSFW15	North Korea	175.00	<p>*</p>\r\n	15.jpg	image/jpeg	2986537	2015-09-15 22:11:22.055912	active	2015-09-15 22:11:22.078727	2015-09-15 22:11:22.078727
627	3	18	4	MSFW16	Zaire	175.00	<p>*</p>\r\n	16.jpg	image/jpeg	2418370	2015-09-15 22:14:29.689659	active	2015-09-15 22:14:29.710173	2015-09-15 22:14:29.710173
628	3	18	4	MSFW17	North Korea	175.00	<p>*</p>\r\n	17.jpg	image/jpeg	2290533	2015-09-15 22:17:03.3313	active	2015-09-15 22:17:03.351006	2015-09-15 22:17:03.351006
629	3	19	\N	MSFW18	Malawi	300.00	<p>*</p>\r\n	18.jpg	image/jpeg	4235416	2015-09-15 22:31:12.645328	active	2015-09-15 22:31:12.672028	2015-09-15 22:31:12.672028
630	3	18	5	MSTW1	Nicaragua	175.00	<p>*</p>\r\n	1.jpg	image/jpeg	2543375	2015-09-15 22:40:03.268237	active	2015-09-15 22:40:03.289541	2015-09-15 22:40:03.289541
631	3	18	5	MSTW2	Nicaragua	175.00	<p>*</p>\r\n	2.jpg	image/jpeg	3008399	2015-09-15 22:43:09.01126	active	2015-09-15 22:43:09.032949	2015-09-15 22:43:09.032949
623	3	18	4	MSFW12	Tanzania	175.00	<p>*</p>\r\n	12.jpg	image/jpeg	2302229	2015-09-15 22:46:59.781307	active	2015-09-15 21:59:07.361522	2015-09-15 22:46:59.801132
632	3	18	5	MSTW3	Ajman	175.00	<p>UAE</p>\r\n	3.jpg	image/jpeg	3372183	2015-09-15 22:49:47.07182	active	2015-09-15 22:49:47.09529	2015-09-15 22:49:47.09529
633	3	18	4	MSFW7	Congo	300.00	<p>*</p>\r\n	7.jpg	image/jpeg	3060683	2015-09-15 23:05:49.114465	active	2015-09-15 23:05:49.137598	2015-09-15 23:05:49.137598
634	3	18	4	MSFW9	Tanzania	250.00	<p>*</p>\r\n	9.jpg	image/jpeg	2535123	2015-09-15 23:08:13.425101	active	2015-09-15 23:08:13.445607	2015-09-15 23:08:13.445607
635	3	18	4	MSFW14	Nicaragua	175.00	<p>*</p>\r\n	14.jpg	image/jpeg	3343325	2015-09-15 23:10:37.118677	active	2015-09-15 23:10:37.143485	2015-09-15 23:10:37.143485
636	3	18	4	MSFW15	North Korea	175.00	<p>*</p>\r\n	15.jpg	image/jpeg	2986537	2015-09-15 23:13:07.413964	active	2015-09-15 23:13:07.434901	2015-09-15 23:13:07.434901
637	3	18	4	MSFW18	Malawi	300.00	<p>*</p>\r\n	18.jpg	image/jpeg	4235416	2015-09-15 23:15:39.345131	active	2015-09-15 23:15:39.371166	2015-09-15 23:15:39.371166
638	3	18	5	MSTW4	North Korea	175.00	<p>*</p>\r\n	4.jpg	image/jpeg	5005383	2015-09-15 23:18:58.059784	active	2015-09-15 23:18:58.087973	2015-09-15 23:18:58.087973
639	3	18	5	MSTW5	Bhutan 	200.00	<p>*</p>\r\n	5.jpg	image/jpeg	2350437	2015-09-15 23:23:21.680784	active	2015-09-15 23:23:21.70166	2015-09-15 23:23:21.70166
640	3	18	5	MSTW6	Guyana	250.00	<p>*</p>\r\n	6.jpg	image/jpeg	2966098	2015-09-15 23:25:58.801459	active	2015-09-15 23:25:58.82351	2015-09-15 23:25:58.82351
641	3	18	5	MSTW7	Srilanka	200.00	<p>*</p>\r\n	7.jpg	image/jpeg	2769757	2015-09-15 23:29:08.333177	active	2015-09-15 23:29:08.354276	2015-09-15 23:29:08.354276
642	3	18	5	MSTW8	Bangladesh	350.00	<p>*</p>\r\n	8.jpg	image/jpeg	4701788	2015-09-15 23:32:20.909911	active	2015-09-15 23:32:20.970035	2015-09-15 23:32:20.970035
643	3	18	4	MSFW8	North Korea	200.00	<p>*</p>\r\n	8.jpg	image/jpeg	5230697	2015-09-15 23:39:44.317524	active	2015-09-15 23:39:44.34769	2015-09-15 23:39:44.34769
644	3	18	5	MSTW9	Kenya 	225.00	<p>*</p>\r\n	9.jpg	image/jpeg	1591989	2015-09-15 23:43:03.260157	active	2015-09-15 23:43:03.278661	2015-09-15 23:43:03.278661
645	3	18	5	MSTW10	Japan	250.00	<p>*</p>\r\n	10.jpg	image/jpeg	3174705	2015-09-15 23:45:53.306606	active	2015-09-15 23:45:53.329317	2015-09-15 23:45:53.329317
646	3	18	5	MSTW11	Yemen	175.00	<p>*</p>\r\n	11.jpg	image/jpeg	2814044	2015-09-21 23:17:18.408432	active	2015-09-21 23:17:18.436395	2015-09-21 23:17:18.436395
647	3	18	5	MSTW12	Thailand	300.00	<p>*</p>\r\n	12.jpg	image/jpeg	3598838	2015-09-21 23:20:15.016367	active	2015-09-21 23:20:15.041744	2015-09-21 23:20:15.041744
648	3	18	5	MSTW13	Yemen	175.00	<p>*</p>\r\n	13.jpg	image/jpeg	2688334	2015-09-21 23:21:53.821089	active	2015-09-21 23:21:53.841429	2015-09-21 23:21:53.841429
650	3	18	5	MSTW15	Bhutan	200.00	<p>*</p>\r\n	15.jpg	image/jpeg	3477549	2015-09-21 23:24:22.135324	active	2015-09-21 23:24:22.157987	2015-09-21 23:24:22.157987
649	3	18	5	MSTW14	Ajman	175.00	<p>UAE</p>\r\n	14.jpg	image/jpeg	4470361	2015-09-21 23:23:04.215679	active	2015-09-21 23:23:04.243117	2015-09-21 23:26:06.148096
651	3	18	5	MSTW16	Bhutan	200.00	<p>*</p>\r\n	16.jpg	image/jpeg	3294397	2015-09-21 23:27:23.75053	active	2015-09-21 23:27:23.772899	2015-09-21 23:27:23.772899
652	3	18	5	MSTW17	Rasal Khaima	175.00	<p>UAE</p>\r\n	17.jpg	image/jpeg	5556445	2015-09-21 23:28:43.932317	active	2015-09-21 23:28:43.961728	2015-09-21 23:28:43.961728
653	3	18	5	MSTW18	North Korea	175.00	<p>*</p>\r\n	18.jpg	image/jpeg	3637139	2015-09-21 23:29:54.052483	active	2015-09-21 23:29:54.076686	2015-09-21 23:29:54.076686
654	3	18	5	MSTW19	North Korea	175.00	<p>*</p>\r\n	19.jpg	image/jpeg	4354932	2015-09-21 23:31:10.300696	active	2015-09-21 23:31:10.327076	2015-09-21 23:31:10.327076
655	3	18	5	MSTW20	Madagascar	175.00	<p>*</p>\r\n	20.jpg	image/jpeg	3227175	2015-09-21 23:32:32.072711	active	2015-09-21 23:32:32.095192	2015-09-21 23:32:32.095192
656	3	18	5	MSTW21	Central Africa	175.00	<p>*</p>\r\n	21.jpg	image/jpeg	4559915	2015-09-21 23:33:50.420821	active	2015-09-21 23:33:50.447763	2015-09-21 23:33:50.447763
657	3	18	5	MSTW22	Bhutan	200.00	<p>*</p>\r\n	22.jpg	image/jpeg	3541252	2015-09-21 23:34:55.729319	active	2015-09-21 23:34:55.753213	2015-09-21 23:34:55.753213
658	3	18	5	MSTW23	Bhutan	200.00	<p>*</p>\r\n	23.jpg	image/jpeg	3565602	2015-09-21 23:36:10.89773	active	2015-09-21 23:36:10.921739	2015-09-21 23:36:10.921739
659	3	18	5	MSTW24	Bhutan 	200.00	<p>*</p>\r\n	24.jpg	image/jpeg	5558256	2015-09-21 23:37:10.475876	active	2015-09-21 23:37:10.512958	2015-09-21 23:37:10.512958
660	3	18	5	MSTW25	North Korea	175.00	<p>*</p>\r\n	25.jpg	image/jpeg	3423605	2015-09-21 23:38:14.10132	active	2015-09-21 23:38:14.124108	2015-09-21 23:38:14.124108
661	3	18	5	MSTW26	Nicaragua	175.00	<p>*</p>\r\n	26.jpg	image/jpeg	2392573	2015-09-21 23:39:42.907707	active	2015-09-21 23:39:42.928833	2015-09-21 23:39:42.928833
662	3	18	5	MSTW27	UMM - AL - QIWAIN	175.00	<p>UAE</p>\r\n	27.jpg	image/jpeg	4457434	2015-09-21 23:41:29.883714	active	2015-09-21 23:41:29.90997	2015-09-21 23:41:29.90997
663	3	18	5	MSTW28	Zaire	175.00	<p>*</p>\r\n	28.jpg	image/jpeg	3066776	2015-09-21 23:43:37.546666	active	2015-09-21 23:43:37.569601	2015-09-21 23:43:37.569601
664	3	18	5	MSTW29	Bhutan	225.00	<p>*</p>\r\n	29.jpg	image/jpeg	3370561	2015-09-21 23:44:45.698966	active	2015-09-21 23:44:45.722459	2015-09-21 23:44:45.722459
665	3	18	5	MSTW30	Malaysia	275.00	<p>*</p>\r\n	30.jpg	image/jpeg	4378134	2015-09-21 23:45:55.634441	active	2015-09-21 23:45:55.660669	2015-09-21 23:45:55.660669
666	3	18	5	MSTW31	Ajman	175.00	<p>UAE</p>\r\n	31.jpg	image/jpeg	3579636	2015-09-21 23:47:16.486012	active	2015-09-21 23:47:16.510545	2015-09-21 23:47:16.510545
667	3	18	5	MSTW32	Russia	200.00	<p>*</p>\r\n	32.jpg	image/jpeg	5095494	2015-09-21 23:48:25.147124	active	2015-09-21 23:48:25.176307	2015-09-21 23:48:25.176307
668	3	18	5	MSTW33	Russia	200.00	<p>*</p>\r\n	33.jpg	image/jpeg	3430343	2015-09-21 23:49:25.319547	active	2015-09-21 23:49:25.342243	2015-09-21 23:49:25.342243
669	3	18	5	MSTW34	Bhutan	225.00	<p>*</p>\r\n	34.jpg	image/jpeg	2816725	2015-09-21 23:51:07.972996	active	2015-09-21 23:51:07.99457	2015-09-21 23:51:07.99457
670	3	18	5	MSTW35	North Korea	175.00	<p>*</p>\r\n	35.jpg	image/jpeg	3833706	2015-09-21 23:52:37.483046	active	2015-09-21 23:52:37.5077	2015-09-21 23:52:37.5077
671	3	18	5	MSTW36	Niger	175.00	<p>*</p>\r\n	36.jpg	image/jpeg	2493863	2015-09-21 23:53:54.875197	active	2015-09-21 23:53:54.895832	2015-09-21 23:53:54.895832
672	3	18	5	MSTW37	Belagos	450.00	<p>*</p>\r\n	37.jpg	image/jpeg	5243134	2015-09-21 23:55:34.686931	active	2015-09-21 23:55:34.71618	2015-09-21 23:55:34.71618
673	3	18	5	MSTW38	Bhutan	200.00	<p>*</p>\r\n	38.jpg	image/jpeg	3803377	2015-09-21 23:56:35.286332	active	2015-09-21 23:56:35.310687	2015-09-21 23:56:35.310687
674	3	18	5	MSTW39	Nicaragua	200.00	<p>*</p>\r\n	39.jpg	image/jpeg	3689883	2015-09-21 23:57:36.073741	active	2015-09-21 23:57:36.09896	2015-09-21 23:57:36.09896
675	3	18	5	MSTW40	Ajman	175.00	<p>UAE</p>\r\n	40.jpg	image/jpeg	3852188	2015-09-21 23:58:41.041245	active	2015-09-21 23:58:41.066633	2015-09-21 23:58:41.066633
676	3	50	7	CWPU1	UK	250.00	<p>Posted to Iraq</p>\r\n	1.jpg	image/jpeg	1676677	2015-09-22 00:33:19.32299	active	2015-09-22 00:33:19.344127	2015-09-22 00:33:19.344127
677	3	50	7	CWPU2	UK	350.00	<p>Posted to Iraq</p>\r\n	2.jpg	image/jpeg	1691196	2015-09-22 00:37:18.03352	active	2015-09-22 00:37:18.053164	2015-09-22 00:37:18.053164
678	3	50	7	CWPU3	UK	350.00	<p>Posted to Iraq</p>\r\n	3.jpg	image/jpeg	1859671	2015-09-22 00:39:16.148909	active	2015-09-22 00:39:16.168033	2015-09-22 00:39:16.168033
679	3	50	7	CWPU4	UK	350.00	<p>Posted to Iraq</p>\r\n	4.jpg	image/jpeg	3270726	2015-09-22 00:41:19.414522	active	2015-09-22 00:41:19.438464	2015-09-22 00:41:19.438464
680	3	50	7	CWPU5	UK	300.00	<p>Posted to Iraq</p>\r\n	5.jpg	image/jpeg	2666836	2015-09-22 00:42:30.585485	active	2015-09-22 00:42:30.606689	2015-09-22 00:42:30.606689
681	3	50	7	CWPU7	UK	200.00	<p>Posted to Iraq</p>\r\n	7.jpg	image/jpeg	1705370	2015-09-22 00:43:50.175049	active	2015-09-22 00:43:50.194328	2015-09-22 00:43:50.194328
683	3	50	7	CWPU8	Kenya Uganda Tanganyika	600.00	<p>Posted to Mawanza</p>\r\n	8.jpg	image/jpeg	2235763	2015-09-22 00:48:52.545757	active	2015-09-22 00:48:52.568072	2015-09-22 00:48:52.568072
684	3	50	7	CWPU9	New Zealand	500.00	<p>Posted to Bombay - India</p>\r\n	9.jpg	image/jpeg	1946329	2015-09-22 00:51:17.271515	active	2015-09-22 00:51:17.291516	2015-09-22 00:51:17.291516
685	3	50	7	CWPU10	Malta	850.00	<p>Posted in Valata with different cancelation</p>\r\n	10.jpg	image/jpeg	2301273	2015-09-22 00:53:45.484221	active	2015-09-22 00:53:45.504536	2015-09-22 00:53:45.504536
686	3	50	7	CWPU11	South Africa	750.00	<p>Posted in Blourfoutran</p>\r\n	11.jpg	image/jpeg	1365167	2015-09-22 00:55:59.90139	active	2015-09-22 00:55:59.918845	2015-09-22 00:55:59.918845
687	3	50	7	CWPU12	Kenya Uganda Tanganyika	200.00	<p>Posted to Lindi, Kenya</p>\r\n	12.jpg	image/jpeg	1682325	2015-09-22 00:57:43.059424	active	2015-09-22 00:57:43.078475	2015-09-22 00:57:43.078475
688	3	50	7	CWPU13	Ceylon	700.00	<p>Posted in Colombo</p>\r\n	13.jpg	image/jpeg	2246976	2015-09-22 00:59:38.66375	active	2015-09-22 00:59:38.68473	2015-09-22 00:59:38.68473
689	3	50	7	CWPU14	New Zealand	500.00	<p>Posted to Bombay - India</p>\r\n	14.jpg	image/jpeg	1989220	2015-09-22 01:01:16.622197	active	2015-09-22 01:01:16.642274	2015-09-22 01:01:16.642274
690	3	50	7	CWPU15	Niue	650.00	<p>Posted to London, UK</p>\r\n	15.jpg	image/jpeg	3556922	2015-09-22 01:02:51.540604	active	2015-09-22 01:02:51.566407	2015-09-22 01:02:51.566407
691	3	50	7	CWPU16	UK	500.00	<p>Posted to Iraq</p>\r\n	16.jpg	image/jpeg	2070870	2015-09-22 01:04:10.217961	active	2015-09-22 01:04:10.238143	2015-09-22 01:04:10.238143
692	3	50	7	CWPU17	New Zealand	500.00	<p>Posted in Auckhland</p>\r\n	17.jpg	image/jpeg	3101721	2015-09-22 01:06:09.085931	active	2015-09-22 01:06:09.109468	2015-09-22 01:06:09.109468
693	3	50	7	CWPU18	New Zealand	500.00	<p>Posted in Worcestor</p>\r\n	18.jpg	image/jpeg	1808285	2015-09-22 01:07:41.706854	active	2015-09-22 01:07:41.725976	2015-09-22 01:07:41.725976
694	3	50	7	CWPU19	New Zealand	600.00	<p>Posted to Bombay - India</p>\r\n	19.jpg	image/jpeg	1978379	2015-09-22 01:09:14.599454	active	2015-09-22 01:09:14.619775	2015-09-22 01:09:14.619775
695	3	50	7	CWPU20	New Zealand	600.00	<p>Posted to Castlecliff</p>\r\n	20.jpg	image/jpeg	2160252	2015-09-22 01:10:48.046107	active	2015-09-22 01:10:48.066229	2015-09-22 01:10:48.066229
696	3	50	7	CWPU21	UK	400.00	<p>Posted to Iraq</p>\r\n	21.jpg	image/jpeg	2816836	2015-09-22 01:12:07.925607	active	2015-09-22 01:12:07.947141	2015-09-22 01:12:07.947141
697	3	50	7	CWPU22	UK	400.00	<p>Posted to Iraq</p>\r\n	22.jpg	image/jpeg	1859593	2015-09-22 01:13:22.878166	active	2015-09-22 01:13:22.898358	2015-09-22 01:13:22.898358
698	3	50	7	CWPU23	UK	400.00	<p>Posted to Iraq</p>\r\n	23.jpg	image/jpeg	1730541	2015-09-22 01:14:38.227807	active	2015-09-22 01:14:38.246646	2015-09-22 01:14:38.246646
699	3	50	7	CWPU24	Mauritius	950.00	<p>Posted in Port - Louis</p>\r\n	24.jpg	image/jpeg	2743517	2015-09-22 01:16:08.19035	active	2015-09-22 01:16:08.212237	2015-09-22 01:16:08.212237
700	3	50	7	CWPU25	UK	400.00	<p>Posted to Iraq</p>\r\n	25.jpg	image/jpeg	1957959	2015-09-22 01:18:00.777657	active	2015-09-22 01:18:00.796488	2015-09-22 01:18:00.796488
701	3	50	7	CWPU26	Austrailia	500.00	<p>Posted to Bombay - India</p>\r\n	26.jpg	image/jpeg	1871922	2015-09-22 01:19:36.4101	active	2015-09-22 01:19:36.430135	2015-09-22 01:19:36.430135
702	3	50	7	CWPU27	UK	400.00	<p>Posted to Iraq&nbsp;</p>\r\n	27.jpg	image/jpeg	2027702	2015-09-22 01:21:01.865557	active	2015-09-22 01:21:01.885024	2015-09-22 01:21:01.885024
703	3	50	7	CWPU28	UK	400.00	<p>Posted to Iraq</p>\r\n	28.jpg	image/jpeg	1992526	2015-09-22 01:22:09.701944	active	2015-09-22 01:22:09.721889	2015-09-22 01:22:09.721889
704	3	20	\N	CWPU29	UK	400.00	<p>Posted to Iraq</p>\r\n	29.jpg	image/jpeg	1901439	2015-09-22 01:23:34.792881	active	2015-09-22 01:23:34.812955	2015-09-22 01:23:34.812955
705	3	50	7	CWPU30	UK	400.00	<p>Posted to Iraq</p>\r\n	30.jpg	image/jpeg	1757281	2015-09-22 01:24:35.829698	active	2015-09-22 01:24:35.848621	2015-09-22 01:24:35.848621
706	3	50	7	CWPU31	New Zealand	550.00	<p>Posted to Bombay - India</p>\r\n	31.jpg	image/jpeg	2081435	2015-09-22 01:26:17.459197	active	2015-09-22 01:26:17.478838	2015-09-22 01:26:17.478838
707	3	50	7	CWPU32	Austrailia	650.00	<p>Posted in Sidney</p>\r\n	32.jpg	image/jpeg	2867118	2015-09-22 01:27:46.161488	active	2015-09-22 01:27:46.183337	2015-09-22 01:27:46.183337
708	3	50	7	CWPU33	South Africa	750.00	<p>Posted in Britoria</p>\r\n	33.jpg	image/jpeg	4024541	2015-09-22 01:29:28.647599	active	2015-09-22 01:29:28.674401	2015-09-22 01:29:28.674401
709	3	50	7	CWPU34	Austrailia	600.00	<p>Posted to Bombay - India</p>\r\n	34.jpg	image/jpeg	2116751	2015-09-22 01:30:52.925824	active	2015-09-22 01:30:52.947088	2015-09-22 01:30:52.947088
710	3	50	7	CWPU35	Austrailia	550.00	<p>Posted to Bombay - India</p>\r\n	35.jpg	image/jpeg	3231496	2015-09-22 01:32:08.416482	active	2015-09-22 01:32:08.439569	2015-09-22 01:32:08.439569
711	3	50	7	CWPU36	New Zealand	550.00	<p>Posted to Bombay - India</p>\r\n	36.jpg	image/jpeg	2473951	2015-09-22 01:33:34.040638	active	2015-09-22 01:33:34.061858	2015-09-22 01:33:34.061858
712	3	50	7	CWPU37	British India	200.00	<p>(Advert 3) Posted in Bulgana</p>\r\n	37.jpg	image/jpeg	1739301	2015-09-22 01:35:45.338909	active	2015-09-22 01:35:45.358083	2015-09-22 01:35:45.358083
713	3	50	7	CWPU38	New Zealand	850.00	<p>Posted to Kenya</p>\r\n	38.jpg	image/jpeg	3200840	2015-09-22 01:37:42.051042	active	2015-09-22 01:37:42.074241	2015-09-22 01:37:42.074241
714	\N	51	9	CWU1	Kenya Uganda Tanganyika	500.00	<p>Posted to Dar-Es-Salam</p>\r\n	1.jpg	image/jpeg	3641509	2015-09-22 01:50:48.568478	active	2015-09-22 01:50:48.593457	2015-09-22 01:50:48.593457
715	3	51	9	CWU2	Kenya Uganda Tanganyika	500.00	<p>Posted to Mombasa, Kenya</p>\r\n	2.jpg	image/jpeg	2848363	2015-09-22 01:57:26.058521	active	2015-09-22 01:57:26.103871	2015-09-22 01:57:26.103871
716	3	51	9	CWU3	Kenya Uganda Tanganyika	750.00	<p>Posted to Goa - India</p>\r\n	3.jpg	image/jpeg	2213576	2015-09-22 01:58:50.405234	active	2015-09-22 01:58:50.425311	2015-09-22 01:58:50.425311
717	3	51	9	CWU4	Kenya Uganda Tanganyika	750.00	<p>Posted to Kampala, Uganda</p>\r\n	4.jpg	image/jpeg	2673027	2015-09-22 02:00:11.87615	active	2015-09-22 02:00:11.897783	2015-09-22 02:00:11.897783
718	3	51	9	CWU5	Kenya Uganda Tanganyika	950.00	<p>Posted to Dar-Es-Salam</p>\r\n	5.jpg	image/jpeg	3200874	2015-09-22 02:01:28.088987	active	2015-09-22 02:01:28.111503	2015-09-22 02:01:28.111503
719	3	51	9	CWU6	Kenya Uganda Tanganyika	500.00	<p>Posted to Dar-Es-Salam</p>\r\n	6.jpg	image/jpeg	2934393	2015-09-22 02:02:52.982089	active	2015-09-22 02:02:53.005206	2015-09-22 02:02:53.005206
720	3	52	10	GFDC1	Infant De Henriques & Anosanto 	550.00	<p>Church Cancelation</p>\r\n	1.jpg	image/jpeg	1632446	2015-09-27 22:20:26.719718	active	2015-09-27 22:20:26.738974	2015-09-27 22:20:26.738974
721	3	52	10	GFDC4	Manuel Antonio D'souza	450.00	<p>Lighthouse Cancelation</p>\r\n	4.jpg	image/jpeg	1502842	2015-09-27 22:24:10.965515	active	2015-09-27 22:24:10.985408	2015-09-27 22:24:10.985408
722	3	52	10	GFDC5	Brussels Exehibition	600.00	<p>Coat of Arms cancelation</p>\r\n	5.jpg	image/jpeg	1486104	2015-09-27 22:26:16.565548	active	2015-09-27 22:26:16.584727	2015-09-27 22:26:16.584727
723	3	52	10	GFDC6	Gold coins & Coat of Arms	750.00	<p>Sports cancelation</p>\r\n	6.jpg	image/jpeg	1739707	2015-09-27 22:28:09.522349	active	2015-09-27 22:28:09.54288	2015-09-27 22:28:09.54288
724	3	52	10	GFDC7	Anosanto, Padros & Mousinho-de-Albuquerque	750.00	<p>Church cancelation</p>\r\n	7.jpg	image/jpeg	1684890	2015-09-27 22:31:44.055495	active	2015-09-27 22:31:44.077278	2015-09-27 22:31:44.077278
725	3	52	10	GFDC8	Infant de Henriques	600.00	<p>Church cancelation</p>\r\n	8.jpg	image/jpeg	1337757	2015-09-27 22:33:52.57731	active	2015-09-27 22:33:52.595638	2015-09-27 22:33:52.595638
726	3	52	10	GFDC9	Coat of Arms, Infant de Henriques & Anosanto	700.00	<p>Church cancelation</p>\r\n	9.jpg	image/jpeg	1852317	2015-09-27 22:36:21.358157	active	2015-09-27 22:36:21.379162	2015-09-27 22:36:21.379162
727	3	52	10	GFDC10	Gold coins & Coat of Arms 	750.00	<p>Coat of Arms Cancelation</p>\r\n	10.jpg	image/jpeg	1540176	2015-09-27 22:38:17.764473	active	2015-09-27 22:38:17.784114	2015-09-27 22:38:17.784114
728	3	52	10	GFDC11	Anosanto & Infant de Henriques	600.00	<p>Church cancelation</p>\r\n	11.jpg	image/jpeg	1560314	2015-09-27 22:39:56.227584	active	2015-09-27 22:39:56.24734	2015-09-27 22:39:56.24734
729	3	52	10	GFDC12	Coat of Arms	600.00	<p>CTT cancelation</p>\r\n	12.jpg	image/jpeg	1477110	2015-09-27 22:42:06.442001	active	2015-09-27 22:42:06.461229	2015-09-27 22:42:06.461229
730	3	52	10	GFDC13	Infant de Henriques, Padros & Sebastiao Rodolfo Delgado	600.00	<p>Church cancelation</p>\r\n	13.jpg	image/jpeg	1707097	2015-09-27 22:44:49.967566	active	2015-09-27 22:44:49.988425	2015-09-27 22:44:49.988425
731	3	52	10	GFDC14	Anosanto, Coat of Arms & Infant de Henriques	600.00	<p>Church cancelation</p>\r\n	14.jpg	image/jpeg	1712166	2015-09-27 22:46:49.976576	active	2015-09-27 22:46:49.996934	2015-09-27 22:46:49.996934
956	3	57	\N	KENSTMP3	Kenya 	3.00	<p>Postally used &amp; unused stamps</p>\r\n	3.jpg	image/jpeg	3422751	2015-10-03 01:42:48.654556	active	2015-10-03 01:42:48.679634	2015-10-03 01:42:48.679634
732	3	52	10	GFDC15	Anosanto, Coat of Arms & Infant de Henriques	850.00	<p>CHurch cancelation</p>\r\n	15.jpg	image/jpeg	1676217	2015-09-27 22:48:47.483823	active	2015-09-27 22:48:47.503167	2015-09-27 22:48:47.503167
733	3	52	10	GFDC16	Padros, Sebastiao Rodolfo Delgado	700.00	<p>Church cancelation</p>\r\n	16.jpg	image/jpeg	1655926	2015-09-27 22:50:51.144438	active	2015-09-27 22:50:51.164899	2015-09-27 22:50:51.164899
734	3	52	10	GFDC17	Mousinho de Albuquerque over printed 1 Real & 2 Reis	650.00	<p>Church cancelation</p>\r\n	17.jpg	image/jpeg	1761742	2015-09-27 22:53:35.998561	active	2015-09-27 22:53:36.018256	2015-09-27 22:53:36.018256
735	3	52	10	GFDC18	Coat of Arms, Infant de Henriques & Anosanto	650.00	<p>Church cancelation</p>\r\n	18.jpg	image/jpeg	1626210	2015-09-27 22:55:15.265171	active	2015-09-27 22:55:15.285644	2015-09-27 22:55:15.285644
736	3	52	10	GFDC19	Anosanto, Infant de Henriques & Coat of Arms	650.00	<p>Church cancelation</p>\r\n	19.jpg	image/jpeg	1561938	2015-09-27 22:56:59.465006	active	2015-09-27 22:56:59.484108	2015-09-27 22:56:59.484108
737	3	52	10	GFDC20	Anosanto Small FDC	850.00	<p>Mapuca Post cancelation</p>\r\n	20.jpg	image/jpeg	1480943	2015-09-27 22:58:53.354634	active	2015-09-27 22:58:53.375291	2015-09-27 22:58:53.375291
738	3	52	10	GFDC21	Dr. Gama Pinto	650.00	<p>&nbsp;CTT cancelation</p>\r\n	21.jpg	image/jpeg	1785565	2015-09-27 23:00:25.953071	active	2015-09-27 23:00:25.972632	2015-09-27 23:00:25.972632
739	3	52	10	GFDC22	Two Gold coins stamps with corner signal	850.00	<p>Coin cancelation</p>\r\n	22.jpg	image/jpeg	1639620	2015-09-27 23:02:38.986801	active	2015-09-27 23:02:39.006541	2015-09-27 23:02:39.006541
740	3	52	10	GFDC23	Gold & Silver coins stamps	750.00	<p>Church cancelation</p>\r\n	23.jpg	image/jpeg	1573720	2015-09-27 23:04:28.341209	active	2015-09-27 23:04:28.360532	2015-09-27 23:04:28.360532
741	3	52	10	GFDC24	Manuel Antonio D'souza	600.00	<p>Double lighthouse cancelation</p>\r\n	24.jpg	image/jpeg	1337775	2015-09-27 23:07:16.962996	active	2015-09-27 23:07:16.981997	2015-09-27 23:07:16.981997
742	3	52	10	GFDC26	Three Coat of Arms 	700.00	<p>CTT cancelation</p>\r\n	26.jpg	image/jpeg	1278374	2015-09-27 23:09:42.248262	active	2015-09-27 23:09:42.266793	2015-09-27 23:09:42.266793
743	3	52	10	GFDC27	Sebastiao Rodolfo Delgado	700.00	<p>Centenary of 1955 CTT cancelation</p>\r\n	27.jpg	image/jpeg	1167291	2015-09-27 23:11:53.721465	active	2015-09-27 23:11:53.740542	2015-09-27 23:11:53.740542
744	3	52	10	GFDC30	Coat of Arms	600.00	<p>1958 CTT Double cancelation</p>\r\n	30.jpg	image/jpeg	1367216	2015-09-27 23:14:13.54446	active	2015-09-27 23:14:13.563411	2015-09-27 23:14:13.563411
745	3	52	10	GFDC32	Silver & Gold coins Assistencia	750.00	<p>CTT cancelation</p>\r\n	32.jpg	image/jpeg	1645119	2015-09-27 23:16:33.755437	active	2015-09-27 23:16:33.775054	2015-09-27 23:16:33.775054
746	3	52	10	GFDC33	Coat of Arms	650.00	<p>Double Palm Cancelation</p>\r\n	33.jpg	image/jpeg	1519186	2015-09-27 23:18:05.194379	active	2015-09-27 23:18:05.213493	2015-09-27 23:18:05.213493
747	3	52	10	GFDC34	Coat of Arms 	650.00	<p>Double Palm cancelation</p>\r\n	34.jpg	image/jpeg	1284874	2015-09-27 23:19:56.504647	active	2015-09-27 23:19:56.524145	2015-09-27 23:19:56.524145
748	3	52	10	GFDC35	Gold coin & Coat of Arms	700.00	<p>Double Palm cancelation</p>\r\n	35.jpg	image/jpeg	1525374	2015-09-27 23:21:42.391049	active	2015-09-27 23:21:42.412862	2015-09-27 23:21:42.412862
749	3	52	10	GFDC36	Gold coin & Coat of Arms	700.00	<p>Double Palm cancelation</p>\r\n	36.jpg	image/jpeg	1652957	2015-09-27 23:23:31.30592	active	2015-09-27 23:23:31.325428	2015-09-27 23:23:31.325428
750	3	52	10	GFDC37	Coat of Arms	550.00	<p>CTT double cancelation</p>\r\n	37.jpg	image/jpeg	1506146	2015-09-27 23:24:55.643958	active	2015-09-27 23:24:55.663688	2015-09-27 23:24:55.663688
751	3	52	10	GFDC38	Anosanto Small FDC	850.00	<p>Mapuca, GPO cancelation</p>\r\n	38.jpg	image/jpeg	1484111	2015-09-27 23:26:41.525844	active	2015-09-27 23:26:41.545813	2015-09-27 23:26:41.545813
752	3	52	10	GFDC39	Infant de Henriques, Padros & Carlos perforated and over printed small FDC	1000.00	<p>CTT cancelation</p>\r\n	39.jpg	image/jpeg	1258944	2015-09-27 23:29:03.963892	active	2015-09-27 23:29:03.982778	2015-09-27 23:29:03.982778
753	3	52	10	GFDC40	Three Padros stamps on small FDC	1100.00	<p>CTT &nbsp;Mapuca&nbsp;cancelation</p>\r\n	40.jpg	image/jpeg	1453244	2015-09-27 23:31:34.448246	active	2015-09-27 23:31:34.468386	2015-09-27 23:31:34.468386
754	3	52	10	GFDC42	Three Padros stamps	1100.00	<p>With three church cancelation</p>\r\n	42.jpg	image/jpeg	1548581	2015-09-27 23:35:13.763749	active	2015-09-27 23:35:13.78427	2015-09-27 23:35:13.78427
755	3	52	10	GFDC43	Medicinal Plant, Coat of Arms & Gold coins 	1650.00	<p>CTT Mapuca cancelation</p>\r\n	43.jpg	image/jpeg	1684613	2015-09-27 23:37:30.306099	active	2015-09-27 23:37:30.325757	2015-09-27 23:37:30.325757
756	3	52	10	GFDC44	Medicinal Plant 	1100.00	<p>Double CTT cancelation</p>\r\n	44.jpg	image/jpeg	1494405	2015-09-27 23:39:03.651319	active	2015-09-27 23:39:03.670615	2015-09-27 23:39:03.670615
757	3	52	10	GFDC45	Brussels Exhibition 1958 	600.00	<p>Double Coat of Arms cancelation</p>\r\n	45.jpg	image/jpeg	1101273	2015-09-27 23:42:02.172506	active	2015-09-27 23:42:02.191832	2015-09-27 23:42:02.191832
758	3	52	10	GFDC46	Sebastiao Rodolfo Delgado, Two blocks of 4 stamps 	2000.00	<p>CTT cancelation</p>\r\n	46.jpg	image/jpeg	1991506	2015-09-27 23:44:19.991036	active	2015-09-27 23:44:20.012483	2015-09-27 23:44:20.012483
759	3	52	10	GFDC49	Coat of Arms  block of four 	1000.00	<p>CTT cancelation</p>\r\n	49.jpg	image/jpeg	1264283	2015-09-27 23:46:22.494751	active	2015-09-27 23:46:22.513224	2015-09-27 23:46:22.513224
760	3	52	10	GFDC50	Coat of Arms, coins & Postage due due stamps with T cancelation	2800.00	<p>With Coat of Arms, CTT &amp; T cancelation</p>\r\n	1.jpg	image/jpeg	1432937	2015-09-27 23:50:02.161569	active	2015-09-27 23:50:02.180851	2015-09-27 23:50:02.180851
761	3	52	10	GFDC51	Coins on Stamps of 1959	2000.00	<p>With coins cancelation</p>\r\n	2.jpg	image/jpeg	1903969	2015-09-27 23:51:55.803917	active	2015-09-27 23:51:55.824208	2015-09-27 23:51:55.824208
762	3	52	10	GFDC53	Gold coins, Coat of Arms, Map & postage due	2800.00	<p>Coat of Arms, CTT &amp; T cancelation</p>\r\n	3.jpg	image/jpeg	1689046	2015-09-27 23:54:30.584601	active	2015-09-27 23:54:30.603857	2015-09-27 23:54:30.603857
763	3	52	10	GFDC53	Republic India Map stamp FDC with India Portuguese coins stamp	2000.00	<p>With CTT cancelation</p>\r\n	4.jpg	image/jpeg	454808	2015-09-27 23:57:32.852405	active	2015-09-27 23:57:32.868651	2015-09-27 23:57:32.868651
764	3	52	10	GFDC54	St. Francis Xavier centenary of 1952	2000.00	<p>FDC with photo</p>\r\n	5.jpg	image/jpeg	2646943	2015-09-27 23:59:56.848449	active	2015-09-27 23:59:56.872275	2015-09-27 23:59:56.872275
766	3	52	10	GFDC28	Francisco de Almeda	500.00	<p>Double lighthouse cancelation</p>\r\n	28.jpg	image/jpeg	1477229	2015-09-28 01:28:14.309078	active	2015-09-28 01:28:14.328939	2015-09-28 01:28:14.328939
765	3	52	10	GFDC25	Anosanto & Francis de Almeda	850.00	<p>With 3 Church&nbsp;cancelation</p>\r\n	25.jpg	image/jpeg	1787239	2015-09-28 01:20:20.822673	active	2015-09-28 01:20:20.84442	2015-09-28 01:29:40.164147
767	3	52	10	GFDC29	Francisco de Almeda block of 2	750.00	<p>Double church cancelation</p>\r\n	29.jpg	image/jpeg	1547156	2015-09-28 01:31:41.895185	active	2015-09-28 01:31:41.915184	2015-09-28 01:31:41.915184
768	3	52	10	GFDC31	Francisco de Almeda, Padros & Infant de Henriques	850.00	<p>With 4 Church cancelation</p>\r\n	31.jpg	image/jpeg	1759399	2015-09-28 01:33:44.974124	active	2015-09-28 01:33:44.994363	2015-09-28 01:33:44.994363
769	3	52	10	GFDC55	Padre Jose Vaz, Mousinho de Albuques ship series on small FDC	400.00	<p>No cancelation</p>\r\n	1.jpg	image/jpeg	1921055	2015-09-28 01:37:13.812952	active	2015-09-28 01:37:13.834354	2015-09-28 01:37:13.834354
770	3	52	10	GFDC56	Padre Jose Vaz & Sancuale Church on small FDC	1650.00	<p>CTT Mapuca cancelation</p>\r\n	2.jpg	image/jpeg	1918580	2015-09-28 01:39:34.434393	active	2015-09-28 01:39:34.455792	2015-09-28 01:39:34.455792
771	3	52	10	GFDC57	St. Francis Xavier & Hand stamp	1300.00	<p>CTT cancelation</p>\r\n	3.jpg	image/jpeg	1845708	2015-09-28 01:41:28.896167	active	2015-09-28 01:41:28.916359	2015-09-28 01:41:28.916359
772	3	52	10	GFDC58	St. Francis Xavier, Casket & hand  	1850.00	<p>CTT cancelation</p>\r\n	4.jpg	image/jpeg	1977373	2015-09-28 01:43:27.049234	active	2015-09-28 01:43:27.070431	2015-09-28 01:43:27.070431
773	3	52	10	GFDC59	St. Francis Xavier & Hand Stamp	1450.00	<p>CTT with double cancelation</p>\r\n	5.jpg	image/jpeg	1808435	2015-09-28 01:45:44.917827	active	2015-09-28 01:45:44.938469	2015-09-28 01:45:44.938469
774	3	52	10	GFDC60	St. Francis Xavier	1000.00	<p>CTT cancelation</p>\r\n	6.jpg	image/jpeg	1496413	2015-09-28 01:54:03.697846	active	2015-09-28 01:54:03.716906	2015-09-28 01:54:03.716906
775	3	52	10	GFDC61	Padros, Anosanto, Virgem & Francisco de Almeda	1500.00	<p>With 3 Cross cancelation</p>\r\n	7.jpg	image/jpeg	1663518	2015-09-28 01:56:20.300322	active	2015-09-28 01:56:20.320779	2015-09-28 01:56:20.320779
776	3	52	10	GFDC62	St. Francis Xavier & Block of 4 Anosanto with corner serial number	1850.00	<p>With 3&nbsp;Church cancelation</p>\r\n	8.jpg	image/jpeg	1585535	2015-09-28 02:01:24.454155	active	2015-09-28 02:01:24.474762	2015-09-28 02:01:24.474762
777	3	52	10	GFDC63	Beato - Goeo, Padros & Padre Jose Vaz block of 4 with corner serial number	2200.00	<p>With 2 cross cancelation</p>\r\n	9.jpg	image/jpeg	1662934	2015-09-28 02:04:47.09967	active	2015-09-28 02:04:47.119332	2015-09-28 02:04:47.119332
778	3	52	10	GFDC64	Maps, Anosanto & Padre Jose Vazm Block of 4 with corner serial number	2200.00	<p>With 3 Church cancelation</p>\r\n	10.jpg	image/jpeg	1928856	2015-09-28 02:07:44.295982	active	2015-09-28 02:07:44.316888	2015-09-28 02:07:44.316888
779	3	52	10	GFDC65	Garacia de Orta, Pardos & Padre Jose Vaz block of 2 with corner serial number	2200.00	<p>With 3 Cross cancelation</p>\r\n	11.jpg	image/jpeg	1833033	2015-09-28 02:10:18.137725	active	2015-09-28 02:10:18.158533	2015-09-28 02:10:18.158533
780	3	52	10	GFDC66	Infant de Henriques, Padre Jose Vaz  Sancuale Church, Anosanto & Padros	1250.00	<p>With 4 church cancelation</p>\r\n	12.jpg	image/jpeg	1639678	2015-09-28 02:13:07.898061	active	2015-09-28 02:13:07.919633	2015-09-28 02:13:07.919633
781	3	52	10	GFDC67	Padros, Infant de Henriques & Padre Jose Vaz Sancuale church 	1100.00	<p>With 3 church cancelaton</p>\r\n	13.jpg	image/jpeg	1911789	2015-09-28 02:15:24.622584	active	2015-09-28 02:15:24.644308	2015-09-28 02:15:24.644308
782	3	52	10	GFDC68	Anosanto, Padre Jose Vaz & Sebastiao Rodolfo Delgado	1250.00	<p>With 3 Church cancelation</p>\r\n	14.jpg	image/jpeg	1422433	2015-09-28 02:18:25.991478	active	2015-09-28 02:18:26.091205	2015-09-28 02:18:26.091205
783	3	52	10	GFDC69	Padre Jose Vaz & Sancuale Church	1650.00	<p>With 3 Church cancelation</p>\r\n	15.jpg	image/jpeg	1681522	2015-09-28 02:20:16.250101	active	2015-09-28 02:20:16.270169	2015-09-28 02:20:16.270169
784	3	52	10	GFDC70	Mousinho de Albuquerque, Padros & Fatima	1850.00	<p>Double CTT Cancelation</p>\r\n	16.jpg	image/jpeg	1838697	2015-09-28 02:22:37.669096	active	2015-09-28 02:22:37.688983	2015-09-28 02:22:37.688983
785	3	52	10	GFDC71	Padros, St. Francis Xavier, Chathedral & Padre Jose Vaz	1850.00	<p>With double Mapuca CTT Cancelation</p>\r\n	17.jpg	image/jpeg	2070038	2015-09-28 02:24:59.471569	active	2015-09-28 02:24:59.492801	2015-09-28 02:24:59.492801
786	3	52	10	GFDC72	Padre Jose Vaz Church, Sancuale Church , Anosanto & ST. Francis Xavier	2000.00	<p>With 3 Church cancelation</p>\r\n	18.jpg	image/jpeg	1616521	2015-09-28 02:26:55.52892	active	2015-09-28 02:26:55.549544	2015-09-28 02:26:55.549544
787	3	52	10	GFDC73	Padros, St. Francis Xavier, Mousinho de Albuquerque one Real & 2 Ries	2000.00	<p>With 3 Cross Cancelation</p>\r\n	19.jpg	image/jpeg	1650538	2015-09-28 02:29:33.392491	active	2015-09-28 02:29:33.412878	2015-09-28 02:29:33.412878
788	3	52	10	GFDC74	Anosanto & Padre Jose Vaz	1650.00	<p>With 3 Coat of Arms cancelation</p>\r\n	20.jpg	image/jpeg	1566610	2015-09-28 02:31:15.481769	active	2015-09-28 02:31:15.502182	2015-09-28 02:31:15.502182
789	3	52	10	GFDC75	Mousinho de Albuqureque , 1 Real and 2 Ries & Padre Jose Vaz	1250.00	<p>With 3 Church cancelation</p>\r\n	21.jpg	image/jpeg	1418075	2015-09-28 02:33:30.011818	active	2015-09-28 02:33:30.030971	2015-09-28 02:33:30.030971
790	3	52	10	GFDC76	Padre Jose Vaz, Anosanto & St. Francis Xavier	1850.00	<p>With 3 church cancelation</p>\r\n	22.jpg	image/jpeg	1706456	2015-09-28 02:35:30.601582	active	2015-09-28 02:35:30.621513	2015-09-28 02:35:30.621513
791	3	52	10	GFDC77	Anosanto, Padre Jose Vaz & Sebastiao Rodolfo Delgado	1650.00	<p>With 3 Coat of Arms cancelation</p>\r\n	23.jpg	image/jpeg	1684374	2015-09-28 02:37:41.479056	active	2015-09-28 02:37:41.498768	2015-09-28 02:37:41.498768
792	3	52	10	GFDC78	Infant de Henriques, Anosanto, Padre Jose Vaz  Sancuale Church & Sebastiao Rodolfo Delgado	1650.00	<p>With 2 Church cancelation</p>\r\n	24.jpg	image/jpeg	1692454	2015-09-28 02:40:04.098698	active	2015-09-28 02:40:04.118761	2015-09-28 02:40:04.118761
793	3	52	10	GFDC79	Mousinho de Albuquerque, Padre Jose Vaz Sancuale church & Carlos imporforated and over printed on small FDC 	1850.00	<p>With 2 Mapuca CTT cancelation</p>\r\n	25.jpg	image/jpeg	1906482	2015-09-28 02:43:23.463566	active	2015-09-28 02:43:23.484722	2015-09-28 02:43:23.484722
794	3	52	10	GFDC80	Padre Jose Vaz & Sancuale church and Anosanto on small FDC	1850.00	<p>With Mapuca double CTT cancelation</p>\r\n	26.jpg	image/jpeg	1968844	2015-09-28 02:45:25.108363	active	2015-09-28 02:45:25.134797	2015-09-28 02:45:25.134797
795	3	52	10	GFDC81	Anosanto & Padre Jose Vaz  	1650.00	<p>With 3 church cancelation</p>\r\n	27.jpg	image/jpeg	1611767	2015-09-28 02:47:08.631933	active	2015-09-28 02:47:08.651856	2015-09-28 02:47:08.651856
796	3	52	10	GFDC82	Padros, Infant de Henriques, Padre Jose Vaz & Sancaule church	1850.00	<p>With 3 cross cancelation</p>\r\n	28.jpg	image/jpeg	1749927	2015-09-28 02:49:12.952371	active	2015-09-28 02:49:12.972524	2015-09-28 02:49:12.972524
797	3	52	10	GFDC83	Padre Jose Vaz, Anosanto & Carlos, Imporforated over printed 1 Real and Republica on small FDC	2200.00	<p>With double Mapuca CTT cancelation</p>\r\n	29.jpg	image/jpeg	1766638	2015-09-28 02:51:57.088985	active	2015-09-28 02:51:57.109252	2015-09-28 02:51:57.109252
798	3	52	10	GFDC84	Anosanto, Beato Goao & Carlos on small FDC	2000.00	<p>With double Mapuca CTT cancelation</p>\r\n	30.jpg	image/jpeg	1879733	2015-09-28 02:53:44.887782	active	2015-09-28 02:53:44.908073	2015-09-28 02:53:44.908073
799	3	52	10	GFDC85	Fatima & Carlos over printed 3 Ries and Republica and Carlos imporfoeated with over printed one and Half Ries on Small FDC 	2000.00	<p>With double Mapuca cancelation</p>\r\n	31.jpg	image/jpeg	1809342	2015-09-28 02:57:16.314751	active	2015-09-28 02:57:16.335321	2015-09-28 02:57:16.335321
800	3	52	10	GFDC86	Padre Jose Vaz & Sancuale church on small FDC	1650.00	<p>With Mapuca CTT cancelation</p>\r\n	32.jpg	image/jpeg	1868124	2015-09-28 02:58:45.417646	active	2015-09-28 02:58:45.437676	2015-09-28 02:58:45.437676
801	3	52	10	GFDC87	Pare Jose Vaz, Padros , Francis de Almeda & Infant de Henriques	1650.00	<p>With 3 cross cancelation</p>\r\n	33.jpg	image/jpeg	1624552	2015-09-28 03:00:43.592359	active	2015-09-28 03:00:43.611469	2015-09-28 03:00:43.611469
802	3	52	10	GFDC88	Padre Jose Vaz, Sancuale Church & Anosanto on Small FDC	1850.00	<p>With Double Mapuca cancelation</p>\r\n	34.jpg	image/jpeg	1831900	2015-09-28 03:02:33.146815	active	2015-09-28 03:02:33.166574	2015-09-28 03:02:33.166574
803	3	52	10	GFDC89	Padros, Anosanto, Francis de Almeda & Padre Jose Vaz on small FDC	1650.00	<p>With 3 Cross cancelation</p>\r\n	35.jpg	image/jpeg	1537253	2015-09-28 03:04:33.617515	active	2015-09-28 03:04:33.636443	2015-09-28 03:04:33.636443
804	3	52	10	GFDC90	Anosanto, Carlos overprinted Republica & one and Half Ries and Padre Jose Vaz Sancuale church	2000.00	<p>With double Mapuca CTT cancelation</p>\r\n	36.jpg	image/jpeg	1911462	2015-09-28 03:07:08.390422	active	2015-09-28 03:07:08.410933	2015-09-28 03:07:08.410933
805	3	52	10	GFDC91	Sebastiao Rodolfo Delgado, Anosanto, Padre Jose Vaz Sancuale church & Francis de Almeda 	2000.00	<p>With double Coat of Arms cancelation</p>\r\n	37.jpg	image/jpeg	1451751	2015-09-28 03:09:26.777706	active	2015-09-28 03:09:26.796725	2015-09-28 03:09:26.796725
806	3	51	11	CWUFDC1	Cook Island	275.00	<p>WWF</p>\r\n	cook_island_cwufdc_275_wwf.jpg	image/jpeg	3769167	2015-10-01 23:07:33.897296	active	2015-10-01 23:07:33.923437	2015-10-01 23:07:33.923437
807	3	51	11	CWUFDC2	Cook Island	275.00	<p>WWF</p>\r\n	cook_island_cwufdc_275_wwf_(2).jpg	image/jpeg	2809483	2015-10-01 23:09:13.309779	active	2015-10-01 23:09:13.333313	2015-10-01 23:09:13.333313
808	3	51	11	CWUFDC3	Cook Island	275.00	<p>WWF</p>\r\n	cook_island_cwufdc_275_wwf_(3).jpg	image/jpeg	2785349	2015-10-01 23:10:19.96161	active	2015-10-01 23:10:19.984794	2015-10-01 23:10:19.984794
809	3	51	11	CWUFDC4	Cook island	275.00	<p>WWF</p>\r\n	cook_island_cwufdc_275_wwf_(4).jpg	image/jpeg	3366146	2015-10-01 23:11:31.570831	active	2015-10-01 23:11:31.594665	2015-10-01 23:11:31.594665
810	3	51	11	CWUFDC5	Kenya Uganda Tanganyika	900.00	<p>1958</p>\r\n	kenugntanz_cwufdc_900_1958.jpg	image/jpeg	3892032	2015-10-01 23:13:42.468788	active	2015-10-01 23:13:42.494629	2015-10-01 23:13:42.494629
812	3	51	9	CWPUFDC2	Kenya Uganda Tanganyika	650.00	<p>1971</p>\r\n	kut_cwpufdc_650_1971.jpg	image/jpeg	3641509	2015-10-01 23:16:08.138015	active	2015-10-01 23:16:08.163439	2015-10-01 23:16:08.163439
813	3	51	9	CWPUFDC3	Kenya Uganda Tanganyika	650.00	<p>1973</p>\r\n	kut_cwpufdc_650_1973.jpg	image/jpeg	2848363	2015-10-01 23:16:59.60482	active	2015-10-01 23:16:59.636542	2015-10-01 23:16:59.636542
814	3	51	9	CWPUFDC4	Kenya Uganda Tanganyika	850.00	<p>1963</p>\r\n	kut_cwpufdc_850_1963.jpg	image/jpeg	1503940	2015-10-01 23:17:44.911616	active	2015-10-01 23:17:44.951293	2015-10-01 23:17:44.951293
815	3	51	9	CWPUFDC5	Kenya Uganda Tanganyika	850.00	<p>1965</p>\r\n	kut_cwpufdc_850_1965.jpg	image/jpeg	2213576	2015-10-01 23:18:37.558618	active	2015-10-01 23:18:37.579746	2015-10-01 23:18:37.579746
816	3	51	9	CWPUFDC6	Kenya Uganda Tanganyika	1150.00	<p>1954</p>\r\n	kut_cwpufdc_1150_1954.jpg	image/jpeg	3200874	2015-10-01 23:19:31.01929	active	2015-10-01 23:19:31.043049	2015-10-01 23:19:31.043049
817	3	51	11	CWUFDC6	Kenya Uganda Tanganyika	650.00	<p>1972</p>\r\n	kut_cwufdc_650_1972.jpg	image/jpeg	2216581	2015-10-01 23:20:29.529421	active	2015-10-01 23:20:29.555498	2015-10-01 23:29:16.11986
818	3	51	11	CWUFDC7	Kenya Uganda Tanganyika	650.00	<p>1973</p>\r\n	kut_cwufdc_650_1973.jpg	image/jpeg	2363476	2015-10-01 23:21:25.438683	active	2015-10-01 23:21:25.482991	2015-10-01 23:30:18.888365
819	3	51	11	CWUFDC8	Kenya Uganda Tanganyika	650.00	<p>1974</p>\r\n	kut_cwufdc_650_1974.jpg	image/jpeg	2557112	2015-10-01 23:22:13.928957	active	2015-10-01 23:22:13.951463	2015-10-01 23:31:20.976108
820	3	51	11	CWUFDC9	Kenya Uganda Tanganyika	650.00	<p>1974</p>\r\n	kut_cwufdc_650_1974_(2).jpg	image/jpeg	2759850	2015-10-01 23:22:53.677805	active	2015-10-01 23:22:53.700384	2015-10-01 23:32:23.541286
821	3	51	11	CWUFDC10	Kenya Uganda Tanganyika	650.00	<p>1974</p>\r\n	kut_cwufdc_650_1974_(3).jpg	image/jpeg	2599071	2015-10-01 23:24:03.58011	active	2015-10-01 23:24:03.602708	2015-10-01 23:33:26.972626
822	3	51	11	CWUFDC11	Kenya Uganda Tanganyika	650.00	<p>1975</p>\r\n	kut_cwufdc_650_1975.jpg	image/jpeg	3765112	2015-10-01 23:34:59.603713	active	2015-10-01 23:34:59.631728	2015-10-01 23:34:59.631728
823	3	51	11	CWUFDC12	Kenya Uganda Tanganyika	650.00	<p>1975</p>\r\n	kut_cwufdc_650_1975_(2).jpg	image/jpeg	2171308	2015-10-01 23:36:13.028643	active	2015-10-01 23:36:13.049483	2015-10-01 23:36:13.049483
824	3	51	11	CWUFDC13	Kenya Uganda Tanganyika	650.00	<p>1975</p>\r\n	kut_cwufdc_650_1975_(3).jpg	image/jpeg	4242780	2015-10-01 23:37:02.424349	active	2015-10-01 23:37:02.450704	2015-10-01 23:37:02.450704
825	3	51	11	CWUFDC14	Kenya Uganda Tanganyika	750.00	<p>1972</p>\r\n	kut_cwufdc_750_1972.jpg	image/jpeg	2466236	2015-10-01 23:37:56.294023	active	2015-10-01 23:37:56.319297	2015-10-01 23:37:56.319297
826	3	51	11	CWUFDC15	Kenya Uganda Tanganyika	750.00	<p>1974</p>\r\n	kut_cwufdc_750_1974.jpg	image/jpeg	3160889	2015-10-01 23:39:43.487146	active	2015-10-01 23:39:43.511575	2015-10-01 23:39:43.511575
827	3	51	11	CWUFDC16	Kenya Uganda Tanganyika	750.00	<p>1975</p>\r\n	kut_cwufdc_750_1975.jpg	image/jpeg	2815180	2015-10-01 23:40:56.163654	active	2015-10-01 23:40:56.197936	2015-10-01 23:40:56.197936
828	3	51	11	CWUFDC17	Kenya Uganda Tanganyika	950.00	<p>1963</p>\r\n	kut_cwufdc_950_1963.jpg	image/jpeg	2355833	2015-10-01 23:42:40.827247	active	2015-10-01 23:42:40.849504	2015-10-01 23:42:40.849504
829	3	51	11	CWUFDC17	Kenya Uganda Tanganyika	850.00	<p>1976</p>\r\n	kutcwufdc_850_1976.jpg	image/jpeg	3404044	2015-10-01 23:43:29.03748	active	2015-10-01 23:43:29.065554	2015-10-01 23:43:29.065554
830	3	51	12	FUFDC1	Tanzania	270.00	<p>1962</p>\r\n	tanzania_fufdc_270_1962.jpg	image/jpeg	1954951	2015-10-01 23:48:21.818377	active	2015-10-01 23:48:21.840477	2015-10-01 23:48:21.840477
832	3	51	12	FUFDC3	Tanzania	450.00	<p>1962</p>\r\n	tanzania_pufdc_450_1962.jpg	image/jpeg	1811099	2015-10-01 23:50:12.084893	active	2015-10-01 23:50:12.104526	2015-10-01 23:50:12.104526
833	3	51	12	FUFDC4	Thailand	550.00	<p>Religious</p>\r\n	thiland_fufdc_550_religious.jpg	image/jpeg	3053618	2015-10-01 23:51:34.50305	active	2015-10-01 23:51:34.526588	2015-10-01 23:51:34.526588
834	3	51	13	FUPFDC1	Tanzania	450.00	<p>1962</p>\r\n	tanzania_pufdc_450_1962.jpg	image/jpeg	1811099	2015-10-02 00:03:38.811826	active	2015-10-02 00:03:38.833467	2015-10-02 00:03:38.833467
835	3	51	11	CWUFDC20	Australia	550.00	<p>1979</p>\r\n	australia_cwufdc_550_1979.jpg	image/jpeg	1822544	2015-10-02 00:06:26.56539	active	2015-10-02 00:06:26.587155	2015-10-02 00:06:26.587155
836	3	51	11	CWUFDC21	Austrailia	550.00	<p>1980</p>\r\n	australia_cwufdc_550_1980.jpg	image/jpeg	1697442	2015-10-02 00:07:57.01771	active	2015-10-02 00:07:57.03949	2015-10-02 00:07:57.03949
837	3	51	11	CWUFDC23	Kenya Uganda Tanganyika	950.00	<p>1963</p>\r\n	kut_cwufdc_950_1963.jpg	image/jpeg	1891655	2015-10-02 00:08:56.992222	active	2015-10-02 00:08:57.01292	2015-10-02 00:08:57.01292
838	3	51	11	CWUFDC24	UK	750.00	<p>Block of 6</p>\r\n	uk_cwufdc_750_block_of_6.jpg	image/jpeg	1885934	2015-10-02 00:10:13.954922	active	2015-10-02 00:10:13.977463	2015-10-02 00:10:13.977463
839	3	51	11	CWUFDC25	UK	850.00	<p>1963</p>\r\n	uk_cwufdc_850_1963.jpg	image/jpeg	1858557	2015-10-02 00:11:25.967018	active	2015-10-02 00:11:25.989626	2015-10-02 00:11:25.989626
840	3	51	11	CWUFDC26	UK	850.00	<p>1969</p>\r\n	uk_cwufdc_850_1969.jpg	image/jpeg	2301764	2015-10-02 00:12:16.723206	active	2015-10-02 00:12:16.744876	2015-10-02 00:12:16.744876
841	3	51	13	FPUFDC2	Burundi	350.00	<p>Posted to india</p>\r\n	burundi_fpufdc_350_posted_to_india.jpg	image/jpeg	7422468	2015-10-02 00:14:26.687626	active	2015-10-02 00:14:26.740332	2015-10-02 00:14:26.740332
842	3	51	13	FPUFDC3	Iraq	550.00	<p>1978</p>\r\n	iraq_fpufdc_550_1978.jpg	image/jpeg	4169356	2015-10-02 00:15:47.062423	active	2015-10-02 00:15:47.090659	2015-10-02 00:15:47.090659
843	3	51	13	FPUFDC4	Saudi Arabia	550.00	<p>1976</p>\r\n	saudi_arabia_fpufdc_550_1976.jpg	image/jpeg	7764967	2015-10-02 00:20:07.125484	active	2015-10-02 00:20:07.162395	2015-10-02 00:20:07.162395
844	3	51	13	FPUFDC5	Uganda	850.00	<p>1962</p>\r\n	uganda_fpufdc_850_1962.jpg	image/jpeg	6958669	2015-10-02 00:21:13.663575	active	2015-10-02 00:21:13.696457	2015-10-02 00:21:13.696457
845	3	51	13	FPUFDC6	United Nation - USA	500.00	<p>1974</p>\r\n	un-usa_fpufdc_500_1974.jpg	image/jpeg	6727411	2015-10-02 00:22:50.380364	active	2015-10-02 00:22:50.412905	2015-10-02 00:22:50.412905
846	3	51	13	FPUFDC7	United Nation - USA	500.00	<p>1976</p>\r\n	un-usa_fpufdc_500_1976.jpg	image/jpeg	6673092	2015-10-02 00:23:57.282027	active	2015-10-02 00:23:57.320958	2015-10-02 00:23:57.320958
847	3	51	13	FPUFDC8	United Nation - USA	500.00	<p>1981</p>\r\n	un-usa_fpufdc_500_1981.jpg	image/jpeg	5428315	2015-10-02 00:25:20.887086	active	2015-10-02 00:25:20.916389	2015-10-02 00:25:20.916389
848	3	51	12	FUFDC5	Iraq	300.00	<p>1972</p>\r\n	iraq_fufdc_300_1972.jpg	image/jpeg	1802049	2015-10-02 00:28:37.346766	active	2015-10-02 00:28:37.367616	2015-10-02 00:28:37.367616
849	3	51	12	FUFDC6	Iraq	300.00	<p>1972</p>\r\n	iraq_fufdc_300_1972_(2).jpg	image/jpeg	2062246	2015-10-02 00:29:37.72279	active	2015-10-02 00:29:37.74314	2015-10-02 00:29:37.74314
850	3	51	12	FUFDC7	Iraq	400.00	<p>1969</p>\r\n	iraq_fufdc_400_1969.jpg	image/jpeg	1813280	2015-10-02 00:30:52.171985	active	2015-10-02 00:30:52.254098	2015-10-02 00:30:52.254098
851	3	51	12	FUFDC8	Iraq	600.00	<p>1971</p>\r\n	iraq_fufdc_600_1971.jpg	image/jpeg	2259189	2015-10-02 00:31:45.78177	active	2015-10-02 00:31:45.802527	2015-10-02 00:31:45.802527
852	3	51	12	FUFDC9	Iraq	600.00	<p>1972</p>\r\n	iraq_fufdc_600_1972.jpg	image/jpeg	2042565	2015-10-02 00:32:36.09129	active	2015-10-02 00:32:36.11177	2015-10-02 00:32:36.11177
853	3	51	12	FUFDC10	Iraq	600.00	<p>W.H.O</p>\r\n	iraq_fufdc_600_who_1965.jpg	image/jpeg	1955337	2015-10-02 00:33:50.693485	active	2015-10-02 00:33:50.71446	2015-10-02 00:33:50.71446
854	3	51	12	FUFDC11	Iraq	1000.00	<p>Hejra&nbsp;Year</p>\r\n	iraq_fufdc_1000_hejra_year.jpg	image/jpeg	1946518	2015-10-02 00:35:37.423997	active	2015-10-02 00:35:37.443886	2015-10-02 00:35:37.443886
855	3	51	12	FUFDC12	Iraq	1000.00	<p>Hejra Year</p>\r\n	iraq_fufdc_1000_hejra_year_(2).jpg	image/jpeg	1815750	2015-10-02 00:36:38.818381	active	2015-10-02 00:36:38.838178	2015-10-02 00:36:38.838178
856	3	51	12	FUFDC13	Iraq	1000.00	<p>Hejra Year</p>\r\n	iraq_fufdc_1000_hejra_year_(3).jpg	image/jpeg	1777052	2015-10-02 00:37:43.162751	active	2015-10-02 00:37:43.181601	2015-10-02 00:37:43.181601
857	3	51	12	FUFDC14	Iraq	1000.00	<p>Mohammed Paigamber&#39;s Birthday</p>\r\n	iraq_fufdc_1000_mohammad_paigambar's_birthday.jpg	image/jpeg	2032117	2015-10-02 00:39:52.684449	active	2015-10-02 00:39:52.704459	2015-10-02 00:39:52.704459
858	3	51	12	FUFDC15	Iraq	1000.00	<p>Mohammed Paigmbar&#39;s Birthday 1965</p>\r\n	iraq_fufdc_1000_mohammad_paigambar's_birthday_1965.jpg	image/jpeg	2021683	2015-10-02 00:41:25.279437	active	2015-10-02 00:41:25.299322	2015-10-02 00:41:25.299322
859	3	51	12	FUFDC16	Iraq	1000.00	<p>Mohammed Paigmber&#39;s Birthday</p>\r\n	iraq_fufdc_1000_mohammad_paigambar's_birthday_(2).jpg	image/jpeg	1804862	2015-10-02 00:42:38.377736	active	2015-10-02 00:42:38.396801	2015-10-02 00:42:38.396801
860	3	51	12	FUFDC16	Iraq	1000.00	<p>Mohammed Paigmber&#39;s birthday</p>\r\n	iraq_fufdc_1000_mohammad_paigambar's_birthday_(3).jpg	image/jpeg	1780314	2015-10-02 00:43:53.276071	active	2015-10-02 00:43:53.295215	2015-10-02 00:43:53.295215
861	3	51	11	PCUFDC1	Mozambique	400.00	<p>1976</p>\r\n	mozambique_pcufdc_400_1976.jpg	image/jpeg	1662175	2015-10-02 00:54:30.410834	active	2015-10-02 00:54:30.432732	2015-10-02 00:54:30.432732
862	3	51	11	PCUFDC2	Mozambique	400.00	<p>1977</p>\r\n	mozambique_pcufdc_400_1977.jpg	image/jpeg	1888961	2015-10-02 00:55:46.857771	active	2015-10-02 00:55:46.877561	2015-10-02 00:55:46.877561
863	3	51	11	PCUFDC3	Mozambique	400.00	<p>1977</p>\r\n	mozambique_pcufdc_400_1977_(2).jpg	image/jpeg	1886016	2015-10-02 00:56:48.855815	active	2015-10-02 00:56:48.875492	2015-10-02 00:56:48.875492
864	3	51	11	PCUFDC4	Mozambique	400.00	<p>1977</p>\r\n	mozambique_pcufdc_400_1977_(3).jpg	image/jpeg	2064386	2015-10-02 00:57:47.893387	active	2015-10-02 00:57:47.912932	2015-10-02 00:57:47.912932
865	3	51	11	PCUFDC5	Mozambique	400.00	<p>1977</p>\r\n	mozambique_pcufdc_400_1977_(4).jpg	image/jpeg	2087601	2015-10-02 00:58:48.960761	active	2015-10-02 00:58:48.981642	2015-10-02 00:58:48.981642
866	3	51	11	PCUFDC6	Mozambique	400.00	<p>1978</p>\r\n	mozambique_pcufdc_400_1978.jpg	image/jpeg	1971205	2015-10-02 00:59:46.082903	active	2015-10-02 00:59:46.103339	2015-10-02 00:59:46.103339
867	3	51	11	PCUFDC7	Mozambique	400.00	<p>1978</p>\r\n	mozambique_pcufdc_400_1978_(2).jpg	image/jpeg	1821815	2015-10-02 01:00:49.364577	active	2015-10-02 01:00:49.384562	2015-10-02 01:00:49.384562
868	3	51	11	PCUFDC8	Mozambique	400.00	<p>1979</p>\r\n	mozambique_pcufdc_400_1979.jpg	image/jpeg	1855557	2015-10-02 01:01:57.592665	active	2015-10-02 01:01:57.612641	2015-10-02 01:01:57.612641
869	3	51	11	PCUFDC9	Mozambique	400.00	<p>1980</p>\r\n	mozambique_pcufdc_400_1980.jpg	image/jpeg	1816425	2015-10-02 01:03:00.085269	active	2015-10-02 01:03:00.10483	2015-10-02 01:03:00.10483
870	3	51	11	PCUFDC10	Mozambique	550.00	<p>1978</p>\r\n	mozambique_pcufdc_550_1978.jpg	image/jpeg	2143795	2015-10-02 01:03:51.724725	active	2015-10-02 01:03:51.746002	2015-10-02 01:03:51.746002
871	3	51	11	PCUFDC11	Portugal	750.00	<p>1957</p>\r\n	portugal_pcufdc_750_1957.jpg	image/jpeg	1767862	2015-10-02 01:05:04.664254	active	2015-10-02 01:05:04.683859	2015-10-02 01:05:04.683859
872	3	51	12	FUFDC1	Bhutan	300.00	<p>1973</p>\r\n	bhutan_fufdc_300_1973.jpg	image/jpeg	3121739	2015-10-02 22:44:34.647275	active	2015-10-02 22:44:34.671052	2015-10-02 22:44:34.671052
873	3	51	12	FUFDC2	Bhutan	300.00	<p>Rose issue</p>\r\n	bhutan_fufdc_300_rose_issue.jpg	image/jpeg	3256597	2015-10-02 22:45:40.934856	active	2015-10-02 22:45:40.958523	2015-10-02 22:45:40.958523
874	3	51	12	FUFDC3	Bhutan	400.00	<p>3D Stamps</p>\r\n	bhutan_fufdc_400_3d_stamps.jpg	image/jpeg	2326508	2015-10-02 22:46:53.838292	active	2015-10-02 22:46:53.859998	2015-10-02 22:46:53.859998
875	3	51	12	FUFDC4	Bhutan	400.00	<p>1970</p>\r\n	bhutan_fufdc_400_1970.jpg	image/jpeg	2253001	2015-10-02 22:47:51.657773	active	2015-10-02 22:47:51.678323	2015-10-02 22:47:51.678323
876	3	51	12	FUFDC5	Bhutan	400.00	<p>1989</p>\r\n	bhutan_fufdc_400_1989.jpg	image/jpeg	1626769	2015-10-02 22:48:41.409864	active	2015-10-02 22:48:41.428429	2015-10-02 22:48:41.428429
877	3	51	12	FUFDC6	Bhutan	400.00	<p>1989</p>\r\n	bhutan_fufdc_400_1989_(2).jpg	image/jpeg	1762860	2015-10-02 22:49:36.445125	active	2015-10-02 22:49:36.464148	2015-10-02 22:49:36.464148
878	3	51	12	FUFDC7	Bhutan	400.00	<p>1989</p>\r\n	bhutan_fufdc_400_1989_(3).jpg	image/jpeg	1772392	2015-10-02 22:50:35.378387	active	2015-10-02 22:50:35.396844	2015-10-02 22:50:35.396844
879	3	51	12	FUFDC8	Bhutan	400.00	<p>1989</p>\r\n	bhutan_fufdc_400_1989_(4).jpg	image/jpeg	1727686	2015-10-02 22:51:24.78158	active	2015-10-02 22:51:24.800467	2015-10-02 22:51:24.800467
880	3	51	12	FUFDC9	Bhutan	400.00	<p>1989</p>\r\n	bhutan_fufdc_400_1989_(5).jpg	image/jpeg	1513639	2015-10-02 22:52:20.84195	active	2015-10-02 22:52:20.859941	2015-10-02 22:52:20.859941
881	3	51	12	FUFDC10	Cuba	300.00	<p>1976</p>\r\n	cuba_fufdc_300_1976.jpg	image/jpeg	1899091	2015-10-02 22:53:14.449461	active	2015-10-02 22:53:14.468524	2015-10-02 22:53:14.468524
882	3	51	12	FUFDC11	Cuba	300.00	<p>1976</p>\r\n	cuba_fufdc_300_1976_(2).jpg	image/jpeg	1541802	2015-10-02 22:53:58.274508	active	2015-10-02 22:53:58.29196	2015-10-02 22:53:58.29196
883	3	51	12	FUFDC12	Cuba	300.00	<p>1976</p>\r\n	cuba_fufdc_300_1976_(3).jpg	image/jpeg	1697656	2015-10-02 22:54:45.784095	active	2015-10-02 22:54:45.802291	2015-10-02 22:54:45.802291
884	3	51	12	FUFDC13	Cuba	300.00	<p>1978</p>\r\n	cuba_fufdc_300_1978.jpg	image/jpeg	1823854	2015-10-02 22:55:38.885789	active	2015-10-02 22:55:38.904389	2015-10-02 22:55:38.904389
885	3	51	12	FUFDC14	Cuba	300.00	<p>1978</p>\r\n	cuba_fufdc_300_1978_(2).jpg	image/jpeg	1822697	2015-10-02 22:56:23.999471	active	2015-10-02 22:56:24.022716	2015-10-02 22:56:24.022716
886	3	51	12	FUFDC15	Cuba	300.00	<p>1978</p>\r\n	cuba_fufdc_300_1978_(3).jpg	image/jpeg	1844565	2015-10-02 22:57:04.691621	active	2015-10-02 22:57:04.71049	2015-10-02 22:57:04.71049
887	3	51	12	FUFDC16	Eygpt	800.00	<p>1958</p>\r\n	egypt_fufdc_800_1958.jpg	image/jpeg	2818537	2015-10-02 22:57:58.767707	active	2015-10-02 22:57:58.79108	2015-10-02 22:57:58.79108
888	3	51	12	FUFDC17	Hungary	450.00	<p>1965</p>\r\n	hungary_fufdc_450_1965.jpg	image/jpeg	1850070	2015-10-02 22:59:08.86932	active	2015-10-02 22:59:08.889385	2015-10-02 22:59:08.889385
889	3	51	12	FUFDC18	Hungary	450.00	<p>1966</p>\r\n	hungary_fufdc_450_1966.jpg	image/jpeg	1701916	2015-10-02 23:00:16.151714	active	2015-10-02 23:00:16.170326	2015-10-02 23:00:16.170326
890	3	51	12	FUFDC19	Hungary	550.00	<p>1966</p>\r\n	hungary_fufdc_550_1966.jpg	image/jpeg	1793836	2015-10-02 23:01:04.278741	active	2015-10-02 23:01:04.301426	2015-10-02 23:01:04.301426
891	3	51	12	FUFDC20	Iraq	300.00	<p>1971</p>\r\n	iraq_fufdc_300_1971.jpg	image/jpeg	2007938	2015-10-02 23:02:03.384046	active	2015-10-02 23:02:03.40388	2015-10-02 23:02:03.40388
892	3	51	12	FUFDC21	Iraq	300.00	<p>1972</p>\r\n	iraq_fufdc_300_1972.jpg	image/jpeg	1943132	2015-10-02 23:02:56.228811	active	2015-10-02 23:02:56.24749	2015-10-02 23:02:56.24749
893	3	51	12	FUFDC22	Iraq	400.00	<p>1972</p>\r\n	iraq_fufdc_400_1972.jpg	image/jpeg	2165591	2015-10-02 23:03:49.301482	active	2015-10-02 23:03:49.327038	2015-10-02 23:03:49.327038
894	3	51	12	FUFDC23	Iraq	400.00	<p>1972</p>\r\n	iraq_fufdc_400_1972_(2).jpg	image/jpeg	2100137	2015-10-02 23:04:39.561204	active	2015-10-02 23:04:39.581933	2015-10-02 23:04:39.581933
895	3	51	12	FUFDC24	Iraq	450.00	<p>1967</p>\r\n	iraq_fufdc_450_1967.jpg	image/jpeg	1889470	2015-10-02 23:05:39.396955	active	2015-10-02 23:05:39.416543	2015-10-02 23:05:39.416543
896	3	51	12	FUFDC25	Iraq	450.00	<p>1971</p>\r\n	iraq_fufdc_450_1971.jpg	image/jpeg	2077441	2015-10-02 23:06:37.743894	active	2015-10-02 23:06:37.767242	2015-10-02 23:06:37.767242
897	3	51	12	FUFDC26	Iraq	450.00	<p>1972</p>\r\n	iraq_fufdc_450_1972.jpg	image/jpeg	2208157	2015-10-02 23:07:24.444495	active	2015-10-02 23:07:24.465657	2015-10-02 23:07:24.465657
898	3	51	12	FUFDC27	Iraq	500.00	<p>1966</p>\r\n	iraq_fufdc_500_1966.jpg	image/jpeg	2047161	2015-10-02 23:08:17.75977	active	2015-10-02 23:08:17.782403	2015-10-02 23:08:17.782403
899	3	51	12	FUFDC27	Iraq	500.00	<p>Football 1968</p>\r\n	iraq_fufdc_500_football_1968.jpg	image/jpeg	2098169	2015-10-02 23:09:25.106092	active	2015-10-02 23:09:25.127159	2015-10-02 23:09:25.127159
900	3	51	12	FUFDC28	Iraq	650.00	<p>1966</p>\r\n	iraq_fufdc_650_1966.jpg	image/jpeg	1687830	2015-10-02 23:10:17.992576	active	2015-10-02 23:10:18.012347	2015-10-02 23:10:18.012347
901	3	51	12	FUFDC28	Iraq	700.00	<p>1959</p>\r\n	iraq_fufdc_700_1959.jpg	image/jpeg	2724561	2015-10-02 23:11:01.017603	active	2015-10-02 23:11:01.041145	2015-10-02 23:11:01.041145
902	3	51	12	FUFDC29	Iraq	800.00	<p>1965</p>\r\n	iraq_fufdc_800_1965.jpg	image/jpeg	1743634	2015-10-02 23:11:49.096989	active	2015-10-02 23:11:49.117289	2015-10-02 23:11:49.117289
903	3	51	12	FUFDC30	Iraq	800.00	<p>1969</p>\r\n	iraq_fufdc_800_1969.jpg	image/jpeg	1653066	2015-10-02 23:13:04.486868	active	2015-10-02 23:13:04.50674	2015-10-02 23:13:04.50674
904	3	51	12	FUFDC31	Malawi	500.00	<p>1982</p>\r\n	malawi_fufdc_500_1982.jpg	image/jpeg	1790764	2015-10-02 23:14:02.996355	active	2015-10-02 23:14:03.01502	2015-10-02 23:14:03.01502
905	3	51	12	FUFDC32	Monaco	650.00	<p>1962</p>\r\n	monaco_fufdc_650_1962.jpg	image/jpeg	2109627	2015-10-02 23:14:54.909008	active	2015-10-02 23:14:54.930307	2015-10-02 23:14:54.930307
906	3	51	12	FUFDC33	Monaco	650.00	<p>1962</p>\r\n	monaco_fufdc_650_1962_(2).jpg	image/jpeg	2471909	2015-10-02 23:15:46.110727	active	2015-10-02 23:15:46.134845	2015-10-02 23:15:46.134845
907	3	51	13	FPUFDC1	USA	450.00	<p>1995</p>\r\n	usa_fpufdc_450_1995.jpg	image/jpeg	1688955	2015-10-02 23:16:38.624627	active	2015-10-02 23:16:38.644636	2015-10-02 23:16:38.644636
908	3	51	12	FUFDC34	USA	650.00	<p>1966</p>\r\n	usa_fufdc_650_1966.jpg	image/jpeg	1542930	2015-10-02 23:17:33.64893	active	2015-10-02 23:17:33.669874	2015-10-02 23:17:33.669874
910	3	53	\N	ANGSTMP2	Angola	30.00	<p>Postally used and unused stamps</p>\r\n	20151002_143219-2.jpg	image/jpeg	3181558	2015-10-03 00:10:37.135506	active	2015-10-03 00:10:37.159235	2015-10-03 00:14:41.994514
911	3	53	\N	ANGSTMP3	Angola	30.00	<p>Postally used and unused stamps</p>\r\n	20151002_161852-1.jpg	image/jpeg	3013590	2015-10-03 00:11:28.404468	active	2015-10-03 00:11:28.429446	2015-10-03 00:15:02.829277
909	3	53	\N	ANGSTMP1	Angola	30.00	<p>Postally used and unused stamps</p>\r\n	20151002_142919-1.jpg	image/jpeg	2996407	2015-10-03 00:09:32.021997	active	2015-10-03 00:09:32.050146	2015-10-03 00:14:12.898097
913	3	53	\N	ANGSTMP4	Angola	30.00	<p>Postally used and unused stamps</p>\r\n	20151002_175423-1.jpg	image/jpeg	3083033	2015-10-03 00:16:36.183076	active	2015-10-03 00:16:36.208711	2015-10-03 00:16:36.208711
914	3	53	\N	ANGSTMP5	Angola	30.00	<p>Postally used and unused stamps</p>\r\n	20151002_175453-1.jpg	image/jpeg	3244344	2015-10-03 00:18:01.197331	active	2015-10-03 00:18:01.221896	2015-10-03 00:18:01.221896
915	3	53	\N	ANGSTMP6	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_175622-1.jpg	image/jpeg	3023215	2015-10-03 00:19:10.947756	active	2015-10-03 00:19:10.972582	2015-10-03 00:19:10.972582
916	3	53	\N	ANGSTMP7	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_175713-1.jpg	image/jpeg	3003555	2015-10-03 00:20:11.85638	active	2015-10-03 00:20:11.880694	2015-10-03 00:20:11.880694
917	3	53	\N	ANGSTMP8	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_175820(0)-1.jpg	image/jpeg	2822656	2015-10-03 00:21:35.668217	active	2015-10-03 00:21:35.691729	2015-10-03 00:21:35.691729
918	3	53	\N	ANGSTMP9	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191256-1.jpg	image/jpeg	2703452	2015-10-03 00:23:04.954263	active	2015-10-03 00:23:05.056646	2015-10-03 00:23:05.056646
919	3	53	\N	ANGSTMP10	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191414-1.jpg	image/jpeg	3028658	2015-10-03 00:24:11.854318	active	2015-10-03 00:24:11.877458	2015-10-03 00:24:11.877458
920	3	53	\N	ANGSTMP11	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191539-1.jpg	image/jpeg	2976716	2015-10-03 00:25:26.761203	active	2015-10-03 00:25:26.786136	2015-10-03 00:25:26.786136
921	3	53	\N	ANGSTMP12	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191647-1.jpg	image/jpeg	2640170	2015-10-03 00:26:30.038022	active	2015-10-03 00:26:30.061112	2015-10-03 00:26:30.061112
922	3	53	\N	ANGSTMP13	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191751-1.jpg	image/jpeg	3087750	2015-10-03 00:28:15.569669	active	2015-10-03 00:28:15.594682	2015-10-03 00:28:15.594682
923	3	53	\N	ANGSTMP14	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191828-1.jpg	image/jpeg	2579154	2015-10-03 00:29:15.582406	active	2015-10-03 00:29:15.605112	2015-10-03 00:29:15.605112
924	3	53	\N	ANGSTMP15	Angola	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_191933-1.jpg	image/jpeg	859849	2015-10-03 00:30:15.6651	active	2015-10-03 00:30:15.682935	2015-10-03 00:30:15.682935
925	3	54	\N	MOZASTMP1	Mozambique	30.00	<p>Postally used &amp; unused Stamps</p>\r\n	20151002_193930-1.jpg	image/jpeg	3501925	2015-10-03 00:39:05.446562	active	2015-10-03 00:39:05.472768	2015-10-03 00:39:05.472768
926	3	54	\N	MOZASTMP2	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_194108-1.jpg	image/jpeg	3170793	2015-10-03 00:40:06.47754	active	2015-10-03 00:40:06.505495	2015-10-03 00:40:06.505495
927	3	54	\N	MOZASTMP3	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_214300-1.jpg	image/jpeg	3485042	2015-10-03 00:41:41.285482	active	2015-10-03 00:41:41.311125	2015-10-03 00:41:41.311125
928	3	54	\N	MOZASTMP4	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_214442-1.jpg	image/jpeg	3487792	2015-10-03 00:43:00.764577	active	2015-10-03 00:43:00.795263	2015-10-03 00:43:00.795263
929	3	54	\N	MOZASTMP5	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_214617.jpg	image/jpeg	4575012	2015-10-03 00:44:35.461068	active	2015-10-03 00:44:35.490004	2015-10-03 00:44:35.490004
930	3	54	\N	MOZASTMP6	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_214809-1.jpg	image/jpeg	2912688	2015-10-03 00:45:55.242163	active	2015-10-03 00:45:55.265902	2015-10-03 00:45:55.265902
931	3	54	\N	MOZASTMP7	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_215048-1.jpg	image/jpeg	2861670	2015-10-03 00:47:41.303531	active	2015-10-03 00:47:41.327337	2015-10-03 00:47:41.327337
932	3	54	\N	MOZASTMP8	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_215433-1.jpg	image/jpeg	2935626	2015-10-03 00:48:59.942239	active	2015-10-03 00:48:59.964864	2015-10-03 00:48:59.964864
933	3	54	\N	MOZASTMP9	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_215557-1.jpg	image/jpeg	3275892	2015-10-03 00:50:04.925617	active	2015-10-03 00:50:04.950664	2015-10-03 00:50:04.950664
934	3	54	\N	MOZASTMP10	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_220027-1.jpg	image/jpeg	3129100	2015-10-03 00:51:35.059166	active	2015-10-03 00:51:35.083172	2015-10-03 00:51:35.083172
935	3	54	\N	MOZASTMP11	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_220421-1.jpg	image/jpeg	2736446	2015-10-03 00:53:12.144498	active	2015-10-03 00:53:12.16798	2015-10-03 00:53:12.16798
936	3	54	\N	MOZASTMP12	Mozambique	30.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_220652-1.jpg	image/jpeg	2757036	2015-10-03 00:54:36.417057	active	2015-10-03 00:54:36.440414	2015-10-03 00:54:36.440414
937	3	55	\N	AZOSTMP1	Azores	75.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_192030(0)-1.jpg	image/jpeg	3106986	2015-10-03 01:09:05.747199	active	2015-10-03 01:09:05.772633	2015-10-03 01:09:05.772633
938	3	55	\N	AZOSTMP2	Azores	75.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_192239-1.jpg	image/jpeg	2847784	2015-10-03 01:10:27.196621	active	2015-10-03 01:10:27.219754	2015-10-03 01:10:27.219754
939	3	56	\N	KUTSTMP1	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	1.jpg	image/jpeg	2639303	2015-10-03 01:16:25.696287	active	2015-10-03 01:16:25.719607	2015-10-03 01:16:25.719607
940	3	56	\N	KUTSTMP2	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	2.jpg	image/jpeg	3735799	2015-10-03 01:17:59.598386	active	2015-10-03 01:17:59.622946	2015-10-03 01:17:59.622946
941	3	56	\N	KUTSTMP3	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	3.jpg	image/jpeg	3136661	2015-10-03 01:19:28.900519	active	2015-10-03 01:19:28.924158	2015-10-03 01:19:28.924158
942	3	56	\N	KUTSTMP4	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	4.jpg	image/jpeg	3395584	2015-10-03 01:20:31.835966	active	2015-10-03 01:20:31.863923	2015-10-03 01:20:31.863923
943	3	56	\N	KUTSTMP5	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	5.jpg	image/jpeg	3434508	2015-10-03 01:21:46.445877	active	2015-10-03 01:21:46.475159	2015-10-03 01:21:46.475159
944	3	56	\N	KUTSTMP6	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	6.jpg	image/jpeg	3823208	2015-10-03 01:23:21.959399	active	2015-10-03 01:23:21.991909	2015-10-03 01:23:21.991909
945	3	56	\N	KUTSTMP7	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	7.jpg	image/jpeg	3255992	2015-10-03 01:24:58.923145	active	2015-10-03 01:24:58.946959	2015-10-03 01:24:58.946959
946	3	56	\N	KUTSTMP8	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	8.jpg	image/jpeg	3291648	2015-10-03 01:26:11.6419	active	2015-10-03 01:26:11.667248	2015-10-03 01:26:11.667248
947	3	56	\N	KUTSTMP9	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	9.jpg	image/jpeg	3321702	2015-10-03 01:27:54.553759	active	2015-10-03 01:27:54.586343	2015-10-03 01:27:54.586343
948	3	56	\N	KUTSTMP10	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	10.jpg	image/jpeg	3746571	2015-10-03 01:28:57.77825	active	2015-10-03 01:28:57.804273	2015-10-03 01:28:57.804273
949	3	56	\N	KUTSTMP11	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	11.jpg	image/jpeg	3726720	2015-10-03 01:30:18.813787	active	2015-10-03 01:30:18.839153	2015-10-03 01:30:18.839153
950	3	56	\N	KUTSTMP12	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	12.jpg	image/jpeg	3616773	2015-10-03 01:31:52.752136	active	2015-10-03 01:31:52.78082	2015-10-03 01:31:52.78082
951	3	56	\N	KUTSTMP13	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	13.jpg	image/jpeg	3504825	2015-10-03 01:33:21.319366	active	2015-10-03 01:33:21.345672	2015-10-03 01:33:21.345672
952	3	56	\N	KUTSTMP14	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps&nbsp;</p>\r\n	14.jpg	image/jpeg	3281932	2015-10-03 01:34:50.323063	active	2015-10-03 01:34:50.351255	2015-10-03 01:34:50.351255
953	3	56	\N	KUTSTMP15	Kenya Uganda Tanganyika	25.00	<p>Postally used &amp; unused stamps</p>\r\n	15.jpg	image/jpeg	3155686	2015-10-03 01:36:16.320455	active	2015-10-03 01:36:16.344881	2015-10-03 01:36:16.344881
954	3	57	\N	KENSTMP1	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	1.jpg	image/jpeg	4845382	2015-10-03 01:40:27.226695	active	2015-10-03 01:40:27.255792	2015-10-03 01:40:27.255792
955	3	57	\N	KENSTMP2	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	2.jpg	image/jpeg	3304305	2015-10-03 01:41:47.594908	active	2015-10-03 01:41:47.620821	2015-10-03 01:41:47.620821
957	3	57	\N	KENSTMP4	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	4.jpg	image/jpeg	3303350	2015-10-03 01:43:49.118169	active	2015-10-03 01:43:49.142965	2015-10-03 01:43:49.142965
958	3	57	\N	KENSTMP5	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	5.jpg	image/jpeg	3283684	2015-10-03 01:45:26.476445	active	2015-10-03 01:45:26.502038	2015-10-03 01:45:26.502038
959	3	57	\N	KENSTMP6	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	6.jpg	image/jpeg	3310170	2015-10-03 01:46:25.245057	active	2015-10-03 01:46:25.269417	2015-10-03 01:46:25.269417
960	3	57	\N	KENSTMP7	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	7.jpg	image/jpeg	3445323	2015-10-03 01:47:17.737903	active	2015-10-03 01:47:17.762983	2015-10-03 01:47:17.762983
961	3	57	\N	KENSTMP8	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	8.jpg	image/jpeg	3420786	2015-10-03 01:48:28.234966	active	2015-10-03 01:48:28.261199	2015-10-03 01:48:28.261199
962	3	57	\N	KENSTMP9	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	9.jpg	image/jpeg	3257427	2015-10-03 01:49:35.91716	active	2015-10-03 01:49:35.941814	2015-10-03 01:49:35.941814
963	3	57	\N	KENSTMP10	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	10.jpg	image/jpeg	3164494	2015-10-03 01:50:36.168352	active	2015-10-03 01:50:36.191124	2015-10-03 01:50:36.191124
964	3	57	\N	KENSTMP11	Kenya 	15.00	<p>Postally used &amp; unused stamps</p>\r\n	11.jpg	image/jpeg	3222144	2015-10-03 01:51:41.317279	active	2015-10-03 01:51:41.342073	2015-10-03 01:51:41.342073
965	3	58	\N	TANGSTMP1	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	1.jpg	image/jpeg	2996962	2015-10-03 01:56:32.358446	active	2015-10-03 01:56:32.382963	2015-10-03 01:56:32.382963
966	3	58	\N	TANGSTMP2	Tanganiyika	15.00	<p>Postally used &amp; unused Stamps</p>\r\n	2.jpg	image/jpeg	2653228	2015-10-03 01:57:45.017151	active	2015-10-03 01:57:45.040554	2015-10-03 01:57:45.040554
967	3	58	\N	TANGSTMP3	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	3.jpg	image/jpeg	3537427	2015-10-03 01:58:51.057626	active	2015-10-03 01:58:51.084015	2015-10-03 01:58:51.084015
968	3	58	\N	TANGSTMP4	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	4.jpg	image/jpeg	3135167	2015-10-03 02:00:10.620685	active	2015-10-03 02:00:10.646287	2015-10-03 02:00:10.646287
969	3	58	\N	TANGSTMP5	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	5.jpg	image/jpeg	3242825	2015-10-03 02:01:30.333118	active	2015-10-03 02:01:30.356268	2015-10-03 02:01:30.356268
970	3	58	\N	TANGSTMP6	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	6.jpg	image/jpeg	3414375	2015-10-03 02:02:34.87082	active	2015-10-03 02:02:34.940919	2015-10-03 02:02:34.940919
971	3	58	\N	TANGSTMP7	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	7.jpg	image/jpeg	3246440	2015-10-03 02:03:35.176366	active	2015-10-03 02:03:35.201514	2015-10-03 02:03:35.201514
972	3	58	\N	TANGSTMP8	Tanganiyika	15.00	<p>Postally used &amp; unused stamps</p>\r\n	8.jpg	image/jpeg	3292363	2015-10-03 02:04:46.151259	active	2015-10-03 02:04:46.1785	2015-10-03 02:04:46.1785
973	3	59	\N	UGASTMP1	Uganda	15.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_235800.jpg	image/jpeg	4526252	2015-10-03 02:08:05.094414	active	2015-10-03 02:08:05.12292	2015-10-03 02:08:05.12292
974	3	59	\N	UGASTMP2	Uganda	15.00	<p>Postally used &amp; unused stamps</p>\r\n	20151002_235902.jpg	image/jpeg	4705975	2015-10-03 02:09:00.016003	active	2015-10-03 02:09:00.043475	2015-10-03 02:09:00.043475
975	3	59	\N	UGASTMP3	Uganda	15.00	<p>Postally used &amp; unused Stamps</p>\r\n	20151003_000007.jpg	image/jpeg	4791992	2015-10-03 02:09:58.211361	active	2015-10-03 02:09:58.273564	2015-10-03 02:09:58.273564
976	3	59	\N	UGASTMP4	Uganda	15.00	<p>Posteally used &amp; unused stamps</p>\r\n	20151003_000101.jpg	image/jpeg	5166168	2015-10-03 02:11:16.148257	active	2015-10-03 02:11:16.18016	2015-10-03 02:11:16.18016
977	15	\N	\N	123	asd	123.00	<p>asd</p>\r\n	windows_7_v2_by_rehsup.jpg	image/jpeg	790526	2015-10-13 05:35:06.962375	active	2015-10-13 05:35:06.97391	2015-10-13 05:35:06.97391
978	17	60	14	IM001	race	50.00	<p>race movie starring:</p>\r\n\r\n<table border="0" cellpadding="1" cellspacing="1" style="width:500px">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>Sheryn crow</td>\r\n\t\t\t<td>Diesel</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>Rambo</td>\r\n\t\t\t<td>Fant</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>TTT</td>\r\n\t\t\t<td>OPwqww</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p><em><strong>Race</strong></em>&nbsp;is a 2008&nbsp;<a href="https://en.wikipedia.org/wiki/Bollywood" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Bollywood">Bollywood</a>&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Thriller_film" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Thriller film">thriller film</a>&nbsp;directed by&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Abbas-Mustan" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Abbas-Mustan">Abbas-Mustan</a>&nbsp;and produced under the Tips Films banner. Released on 21 March 2008 worldwide, it stars&nbsp;<a href="https://en.wikipedia.org/wiki/Saif_Ali_Khan" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Saif Ali Khan">Saif Ali Khan</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Bipasha_Basu" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Bipasha Basu">Bipasha Basu</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Akshaye_Khanna" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Akshaye Khanna">Akshaye Khanna</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Katrina_Kaif" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Katrina Kaif">Katrina Kaif</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Anil_Kapoor" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Anil Kapoor">Anil Kapoor</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Sameera_Reddy" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Sameera Reddy">Sameera Reddy</a>&nbsp;in pivotal roles. The film also stars&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Dilip_Tahil" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Dilip Tahil">Dilip Tahil</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Johnny_Lever" style="line-height: 1.6em; text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Johnny Lever">Johnny Lever</a>&nbsp;for thriller and comedy sketches. It is the first installment of&nbsp;<em><a href="https://en.wikipedia.org/wiki/Race_(film_series)" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Race (film series)">Race film series</a></em>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	Race_(2008_film)_poster.jpg	image/jpeg	23038	2015-10-13 05:35:52.239466	hidden	2015-10-13 05:35:52.248137	2015-10-13 05:36:52.959674
979	17	60	14	IM0001	RACE	0.00	<p><em><strong>Race</strong></em>&nbsp;is a 2008&nbsp;<a href="https://en.wikipedia.org/wiki/Bollywood" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Bollywood">Bollywood</a>&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Thriller_film" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Thriller film">thriller film</a>&nbsp;directed by&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Abbas-Mustan" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Abbas-Mustan">Abbas-Mustan</a>&nbsp;and produced under the Tips Films banner. Released on 21 March 2008 worldwide, it stars&nbsp;<a href="https://en.wikipedia.org/wiki/Saif_Ali_Khan" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Saif Ali Khan">Saif Ali Khan</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Bipasha_Basu" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Bipasha Basu">Bipasha Basu</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Akshaye_Khanna" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Akshaye Khanna">Akshaye Khanna</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Katrina_Kaif" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Katrina Kaif">Katrina Kaif</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Anil_Kapoor" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Anil Kapoor">Anil Kapoor</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Sameera_Reddy" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Sameera Reddy">Sameera Reddy</a>&nbsp;in pivotal roles. The film also stars&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Dilip_Tahil" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Dilip Tahil">Dilip Tahil</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Johnny_Lever" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Johnny Lever">Johnny Lever</a>&nbsp;for thriller and comedy sketches. It is the first installment of&nbsp;<em><a href="https://en.wikipedia.org/wiki/Race_(film_series)" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Race (film series)">Race film series</a></em>.</p>\r\n\r\n<p>Starring:&nbsp;&nbsp;</p>\r\n\r\n<table border="0" cellpadding="1" cellspacing="1" style="width:1000px">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>Anil Kapoor&nbsp;</td>\r\n\t\t\t<td>Saif Ali Khan</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>Ranvir Singh</td>\r\n\t\t\t<td>Akshaye Khanna</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td>Katrina Kaif</td>\r\n\t\t\t<td>Johnny Lever</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	Race_(2008_film)_poster.jpg	image/jpeg	23038	2015-10-13 12:26:30.424147	active	2015-10-13 12:26:30.433226	2015-10-13 12:29:32.218781
980	3	17	17	PCANCS1	ANGOLA	1150.00	<p>CUT SHEET OF 16 STAMPS</p>\r\n	ANGOLA_PCANCS_1150_CUT_SHEET_OF_16_STAMPS.jpg	image/jpeg	1500898	2015-10-14 05:27:16.944492	active	2015-10-14 05:27:16.958807	2015-10-14 05:27:16.958807
981	3	17	17	PCCVCS2	CABO VERDE(cape verde)	300.00	<p>cut sheet of 4 stamps of cabo verde from 1949</p>\r\n	CABO_VERDE(cape_verde)_pccvcs_300_cut_sheet_of_4_stamps_of_cabo_verde_from_1949.jpg	image/jpeg	659173	2015-10-14 05:30:38.221321	active	2015-10-14 05:30:38.23322	2015-10-14 05:30:38.23322
982	3	17	17	PCGPCS3	GUINE	650.00	<p>cut sheet of crane 10 stamps from 1948</p>\r\n	guine__pcgpcs__650__cut_sheet_of_crane_10_stamps_from_1948.jpg	image/jpeg	417828	2015-10-14 05:33:57.35414	active	2015-10-14 05:33:57.365473	2015-10-14 05:33:57.365473
983	3	17	17	PCGNCS4	GUINE	850.00	<p>12 CUT SHEET OF 12 STAMPS</p>\r\n	GUINE_PCGNCS_850_12_CUT_SHEET_OF_12_STAMPS.jpg	image/jpeg	337572	2015-10-14 05:36:21.029294	active	2015-10-14 05:36:21.039926	2015-10-14 05:36:21.039926
984	3	17	17	PCINCSOP5	INDIA-GOA	1500.00	<p>ceres cut sheet of 10 overprinted 1.50 real on 2 reis from 1919</p>\r\n	india-goa__pcincsop_1500_ceres_cut_sheet_of_10_overprinted_1.50_real_on_2_reis_from_1919.jpg	image/jpeg	785051	2015-10-14 05:39:40.773702	active	2015-10-14 05:39:40.786311	2015-10-14 05:39:40.786311
985	3	17	17	PCLMFSOP6	LORENCO MARQUES	1900.00	<p>full sheet of d. carlos 400 reis overprinted on 50 centavos from 1914</p>\r\n	lorenco_marques_pclmfsop_1900_full_sheet_of_d._carlos_400_reis_overprinted_on_50_centavos_from_1914.jpg	image/jpeg	500727	2015-10-14 05:43:32.773179	active	2015-10-14 05:43:32.784381	2015-10-14 05:43:32.784381
986	3	17	17	PCLMFSOP7	LORENC0 MARQUES	3500.00	<p>lorenco marques</p>\r\n	lorenco_marques_pclmfsop_3500_.jpg	image/jpeg	913987	2015-10-14 05:48:53.00832	active	2015-10-14 05:48:53.020833	2015-10-14 05:48:53.020833
987	3	17	17	PCLMCS8	LOURENCE MARQUE	1200.00	<p>ceres cut sheet of 20 stmpas</p>\r\n	lourence_marque_pclmcs_1200__ceres_cut_sheet_of_20_stmpas.jpg	image/jpeg	937957	2015-10-14 05:52:25.500059	active	2015-10-14 05:52:25.513229	2015-10-14 05:52:25.513229
988	3	17	17	PCLMCS9	LOURENCO MARQUES	900.00	<p>ceres cut sheet of 25 stmps from 1912</p>\r\n	lourenco_marques_pclmcs_900_ceres_cut_sheet_of_25_stmps_from_1912.jpg	image/jpeg	1062571	2015-10-14 05:55:26.828242	active	2015-10-14 05:55:26.84166	2015-10-14 05:55:26.84166
990	3	17	17	PCLMCSOP10	lourenco marques	900.00	<p>cut sheet of ceres overprinted red cross from 8 march 1912</p>\r\n	lourenco_marques_pclmcsop_900_cut_sheet_of_ceres_overprinted_red_cross_from_8_march_1912.jpg	image/jpeg	3435488	2015-10-14 06:12:45.864652	active	2015-10-14 06:12:45.88485	2015-10-14 06:12:45.88485
991	3	17	17	PCLMCSOP11	lourenco marques	1900.00	<p>cut sheet of 29 stamps overprinted red cross from 18 march 1918</p>\r\n	lourenco_marques_pclmcsop_1900_cut_sheet_of_29_stamps_overprinted_red_cross_from_18_march_1918.jpg	image/jpeg	1063275	2015-10-14 06:15:08.220022	active	2015-10-14 06:15:08.232472	2015-10-14 06:15:08.232472
992	3	17	17	PCLMCSOP12	lourenco marques	1950.00	<p>cut sheet of 29 overprinted ceres stamps from 1914</p>\r\n	lourenco_marques_pclmcsop_1950_cut_sheet_of_29_overprinted_ceres_stamps_from_1914.jpg	image/jpeg	939842	2015-10-14 06:18:36.519543	active	2015-10-14 06:18:36.532683	2015-10-14 06:18:36.532683
993	3	17	17	PCLMCSOP13	lourenco marques	2950.00	<p>cut sheet of 44 ceres stamps overprinted red cross from 9 march 1918</p>\r\n	lourenco_marques_pclmcsop_2950_cut_sheet_of_44_ceres_stamps_overprinted_red_cross_from_9_march_1918.jpg	image/jpeg	1140106	2015-10-14 06:21:44.620139	active	2015-10-14 06:21:44.633063	2015-10-14 06:21:44.633063
994	3	17	17	PCLMCSOP14	lourenco marques	3750.00	<p>cut sheet of 50 ceres overprinted stamps sheet from 1912 ad</p>\r\n	lourenco_marques_pclmcsop_3750_cut_sheet_of_50_ceres_overprinted_stamps_sheet_from_1912_ad.jpg	image/jpeg	953196	2015-10-14 06:25:04.243272	active	2015-10-14 06:25:04.255584	2015-10-14 06:25:04.255584
995	3	17	17	PCMCCS15	MACAU	1500.00	<p>CUT SHEET OF MACAU 12 STAMPS</p>\r\n	MACAU_PCMCCS_1500_CUT_SHEET_OF_MACAU_12_STAMPS.jpg	image/jpeg	2984400	2015-10-14 06:29:35.391039	active	2015-10-14 06:29:35.410379	2015-10-14 06:29:35.410379
996	3	17	17	PCMCCS16	MACAU	3300.00	<p>CUT SHEET OF 33 STAMPS</p>\r\n	MACAU_PCMCCS_3300_CUT_SHEET_OF_33_STAMPS.jpg	image/jpeg	2883431	2015-10-14 06:32:33.17092	active	2015-10-14 06:32:33.188041	2015-10-14 06:32:33.188041
997	3	17	17	PCMZCSOP17	MOZAMBIQUE	1000.00	<p>ceres cut sheet overprints 30 centavos on 60 centavoc from 1915</p>\r\n	mozambique__pcmzcsop__1000_ceres_cut_sheet_overprints_30_centavos_on_60_centavoc_from_1915.jpg	image/jpeg	591373	2015-10-14 06:36:58.591677	active	2015-10-14 06:36:58.60354	2015-10-14 06:36:58.60354
998	3	17	17	PCMZCCS18	MOZAMBIQUE	1000.00	<p>cancelled CUT SHEET OF 18 STAMPS OF D. LUIS FROM 1911</p>\r\n	MOZAMBIQUE_PCMZCCS_1000_cancelled_CUT_SHEET_OF_18_STAMPS_OF_D._LUIS_FROM_1911.jpg	image/jpeg	884031	2015-10-14 06:39:40.407116	active	2015-10-14 06:39:40.419501	2015-10-14 06:39:40.419501
999	3	17	17	PCMZCCS19	MOZAMBIQUE	1750.00	<p>CUT SHEET OF 25 CANCELLED STAMPS OF D. LUIS FROM 1911 AD</p>\r\n	MOZAMBIQUE_PCMZCCS_1750_CUT_SHEET_OF_25_CANCELLED_STAMPS_OF_D._LUIS_FROM_1911_AD.jpg	image/jpeg	1325894	2015-10-14 06:42:36.690213	active	2015-10-14 06:42:36.703597	2015-10-14 06:42:36.703597
1000	3	17	17	PCMZCS20	MOZAMBIQUE	750.00	<p>CUT SHEET OF 10 STAMPS</p>\r\n	MOZAMBIQUE_PCMZCS_750_CUT_SHEET_OF_10_STAMPS.jpg	image/jpeg	552041	2015-10-14 06:47:25.998629	active	2015-10-14 06:47:26.010071	2015-10-14 06:47:26.010071
1001	3	17	17	PCMZCS21	MOZAMBIQUE	1500.00	<p>25 zebra stamps CUT SHEET &nbsp;FROM 1940 AD</p>\r\n	MOZAMBIQUE_PCMZCS_1500__25_zebra_stamps_CUT_SHEET__FROM_1940_AD.jpg	image/jpeg	1419210	2015-10-14 06:50:25.110495	active	2015-10-14 06:50:25.124579	2015-10-14 06:50:25.124579
1002	3	17	17	PCMZCSOP22	mozambique	800.00	<p>ceres cut sheet overprinted 10 centavos on 20 real from 1912</p>\r\n	mozambique_pcmzcsop_800_ceres_cut_sheet_overprinted_10_centavos_on20_real_from_1912.jpg	image/jpeg	476373	2015-10-14 06:56:09.609002	active	2015-10-14 06:56:09.620805	2015-10-14 06:56:09.620805
1003	3	17	17	PCMZCSOP23	mozambique	800.00	<p>cut sheet MOZAMBIQUE</p>\r\n	mozambique_pcmzcsop_800_cut_sheet.jpg	image/jpeg	1061329	2015-10-14 06:59:35.223277	active	2015-10-14 06:59:35.284726	2015-10-14 06:59:35.284726
1004	3	17	17	PCMZCSOP24	mozambique	1100.00	<p>cut sheet of 20 stamps overprinted 2.50 centavos on &nbsp;5 centavos</p>\r\n	mozambique_pcmzcsop_1100_cut_sheet_of_20_stamps_overprinted_2.50_centavos_on__5_centavos.jpg	image/jpeg	718751	2015-10-14 07:03:27.490066	active	2015-10-14 07:03:27.502012	2015-10-14 07:03:27.502012
1005	3	17	17	PCMZCSOP25	mozambique	1850.00	<p>25 cancelled stamps of d. luis from 1914</p>\r\n	mozambique_pcmzcsop_1850_25_cancelled_stamps_of_d._luis_from_1914.jpg	image/jpeg	1191632	2015-10-14 07:17:36.09511	active	2015-10-14 07:17:36.10889	2015-10-14 07:17:36.10889
1006	3	17	17	PCPGCS26	PORTUGAL	450.00	<p>cut sheet of 12 stamps</p>\r\n	portugal_pcpgcs_450_cut_sheet_of_12_stamps.jpg	image/jpeg	848842	2015-10-14 07:21:49.075646	active	2015-10-14 07:21:49.08818	2015-10-14 07:21:49.08818
1007	3	17	17	PCPGCS27	portugal	950.00	<p>cut sheet of 19 stamps</p>\r\n	portugal_pcpgcs_950_cut_sheet_of_19_stamps.jpg	image/jpeg	2516758	2015-10-14 07:25:18.525667	active	2015-10-14 07:25:18.544497	2015-10-14 07:25:18.544497
1008	3	17	17	PCTMCS28	TIMOR	650.00	<p>cut sheet of 3 stamps of timor from 1915</p>\r\n	timor_pctmcs_650_cut_sheet_of_3_stamps_of_timor_from_1915.jpg	image/jpeg	2546518	2015-10-14 07:28:52.42278	active	2015-10-14 07:28:52.439759	2015-10-14 07:28:52.439759
1009	3	17	17	PCTMCS29	TIMOR	950.00	<p>CUT SHEET OF 10 fatima stamps</p>\r\n	TIMOR_PCTMCS_950_CUT_SHEET_OF_10_fatima_stamps.jpg	image/jpeg	586408	2015-10-14 07:31:26.51761	active	2015-10-14 07:31:26.530499	2015-10-14 07:31:26.530499
1010	3	17	17	PCTMCS30	TIMOR	1250.00	<p>CUT SHEET OF 25 STAMPS OF UPU FROM 1949</p>\r\n	TIMOR_PCTMCS_1250_CUT_SHEET_OF_25_STAMPS_OF_UPU_FROM_1949.jpg	image/jpeg	877168	2015-10-14 07:33:55.372652	active	2015-10-14 07:33:55.385638	2015-10-14 07:33:55.385638
1011	3	17	17	PCTMCS31	timor	1750.00	<p>Cut sheeet of timor25 stamps</p>\r\n	timor_pctmcs_1750_cut_sheeet_of_timor25_stamps.jpg	image/jpeg	991506	2015-10-14 07:36:31.71201	active	2015-10-14 07:36:31.724258	2015-10-14 07:36:31.724258
1012	3	17	17	PCTMCS32	timor	1400.00	<p>medicinal cut sheet of 30 stamps from 1945</p>\r\n	timor_pctmcs___1400__medicinal_cut_sheet_of_30_stamps_from_1945.jpg	image/jpeg	1142135	2015-10-14 07:39:25.389509	active	2015-10-14 07:39:25.402883	2015-10-14 07:39:25.402883
1013	3	17	17	PCZMCSOP33	ZAMBIA	500.00	<p>CUT SHEET OF 6 STAMPS OF D. CARLOS &nbsp;OVERPRINTED REPUBLICA</p>\r\n	ZAMBIA__PCZMCSOP__500__CUT_SHEET_OF_6_STAMPS_OF_D._CARLOS__OVERPRINTED_REPUBLICA.jpg	image/jpeg	514039	2015-10-14 09:53:07.863531	active	2015-10-14 09:53:07.877367	2015-10-14 09:53:07.877367
1014	3	17	17	PCZMFSOP34	ZAMBIA	2500.00	<p>FULL &nbsp;SHEET OF 28 STAMPS OF D. CARLOS overprinted republica FROM 1899</p>\r\n	ZAMBIA__PCZMFSOP_2500_FULL__SHEET_OF_28_STAMPS_OF_D._CARLOS_overprinted_republica_FROM_1899.jpg	image/jpeg	1006842	2015-10-14 09:55:00.431109	active	2015-10-14 09:55:00.444341	2015-10-14 09:55:00.444341
1015	3	17	17	PCZMCS35	zambia	700.00	<p>12 STAMPS cut sheet &nbsp;of d. carlos from 1910</p>\r\n	zambia_pczmcs_700_12_STAMPS_cut_sheet__of_d._carlos_from_1910.jpg	image/jpeg	706879	2015-10-14 09:57:03.052092	active	2015-10-14 09:57:03.064563	2015-10-14 09:57:03.064563
1016	3	17	17	PCZMCSOP36	ZAMBIA	500.00	<p>CUT SHEET OF D. CARLOS OVERPRINTED REPUBLICA FROM 1911 AD</p>\r\n	ZAMBIA_PCZMCSOP_500_CUT_SHEET_OF_D._CARLOS_OVERPRINTED_REPUBLICA_FROM_1911_AD.jpg	image/jpeg	541681	2015-10-14 09:59:11.937793	active	2015-10-14 09:59:11.949941	2015-10-14 09:59:11.949941
1017	3	17	17	PCZMFSOP37	ZAMBIA,	500.00	<p>FULL SHEET OF D. CARLOS &nbsp;OVERPRINTED republica FROM 1911</p>\r\n	ZAMBIA_PCZMFSOP_500_FULL_SHEET_OF_D._CARLOS__OVERPRINTED_republica_FROM_1911.jpg	image/jpeg	837887	2015-10-14 10:02:52.231883	active	2015-10-14 10:02:52.244483	2015-10-14 10:02:52.244483
1018	3	17	17	PCZMFSOP38	zambia	2100.00	<p>Full sheet of 28 stamps of d. carlos from 1910</p>\r\n	zambia_pczmFSop_2100_full_sheet_of_28_stamps_of_d._carlos_from_1910.jpg	image/jpeg	3008405	2015-10-14 10:07:05.564946	active	2015-10-14 10:07:05.610989	2015-10-14 10:07:05.610989
1019	3	17	17	PCANFS39	ANGOLA	2400.00	<p>full sheet of 50 stamps from 1951</p>\r\n	angola_pcanfs_2450_full_sheet_of_50_stamps_from_1951.jpg	image/jpeg	1118721	2015-10-14 10:10:18.073682	active	2015-10-14 10:10:18.087976	2015-10-14 10:10:18.087976
1020	3	17	17	PCANFS40	angola	2500.00	<p>full sheet of 50 stamps from 1951</p>\r\n	angola_pcanfs_2500_full_sheet_of_50_stamps_from_1951.jpg	image/jpeg	985513	2015-10-14 10:14:14.229517	active	2015-10-14 10:14:14.243777	2015-10-14 10:14:14.243777
1021	3	17	17	PCANFS41	angola	2550.00	<p>full sheet of 50 stamps from 1951</p>\r\n	angola_pcanfs_2550_full_sheet_of_50_stamps_from_1951.jpg	image/jpeg	918425	2015-10-14 10:15:59.693296	active	2015-10-14 10:15:59.705619	2015-10-14 10:15:59.705619
1022	3	17	17	PCCVCS42	cabo verde	700.00	<p>cut sheet of 12 sea route stamp from 1952</p>\r\n	cabo_verde_pccvcs_700_cut_sheet_of_12_sea_route_stamp_from_1952.jpg	image/jpeg	1148187	2015-10-14 10:18:19.332754	active	2015-10-14 10:18:19.347025	2015-10-14 10:18:19.347025
1023	3	17	17	PCCVCS43	cabo verde	750.00	<p>cut sheet of 12 stamps explorers from 1952</p>\r\n	cabo_verde_pccvcs_750__cut_sheet_of_12_stamps_explorers_from_1952.jpg	image/jpeg	3251254	2015-10-14 10:21:01.235441	active	2015-10-14 10:21:01.25732	2015-10-14 10:21:01.25732
1024	3	17	17	PCGNCS44	guine	450.00	<p>cut sheet of 10 stamps from 1948</p>\r\n	guine_pcgncs_450_cut_sheet_of_10_stamps_from_1948.jpg	image/jpeg	717828	2015-10-14 10:22:44.0696	active	2015-10-14 10:22:44.134381	2015-10-14 10:22:44.134381
1025	3	17	17	PCGNCS45	guine	1400.00	<p>Cut sheet of 25 vasco da gama stamps from 1938</p>\r\n	guine_pcgncs_1400_cut_sheet_of_25_vasco_da_gama_stamps_from_1938.jpg	image/jpeg	1097007	2015-10-14 10:25:11.651622	active	2015-10-14 10:25:11.666563	2015-10-14 10:25:11.666563
1026	3	17	17	PCINCSOP46	india(goa)	450.00	<p>cut sheet of 6 stamps 15 centavos overprinted on 6 reis</p>\r\n	india(goa)_pcincsop_450_cut_sheet_of_6_stamps_15_centavos_overprinted_on_6_reis.jpg	image/jpeg	980020	2015-10-14 10:27:09.968046	active	2015-10-14 10:27:09.982325	2015-10-14 10:27:09.982325
1027	3	17	17	PCMZ47	mozambique	2500.00	<p>cut sheet of 50 stamps from 1951</p>\r\n	mozambique_pcmz2500_cut_sheet_of_50_stamps_from_1951.jpg	image/jpeg	1008429	2015-10-14 10:29:35.016497	active	2015-10-14 10:29:35.030849	2015-10-14 10:29:35.030849
1028	3	17	17	PCMZCCS48	mozambique	450.00	<p>cut sheet of 10 stamps 4th centenary of lourenco marques from 1944</p>\r\n	mozambique_pcmzccs_450_cut_sheet_of_10_stamps_4th_centenary_of_lourenco_marques_from_1944.jpg	image/jpeg	1381659	2015-10-14 10:31:56.725074	active	2015-10-14 10:31:56.740027	2015-10-14 10:31:56.740027
1029	3	17	17	PCMZCS49	mozambique	1100.00	<p>cut sheet os 30 stamps from 1951</p>\r\n	mozambique_pcmzcs_1100__cut_sheet_os_30_stamps_from_1951.jpg	image/jpeg	866623	2015-10-14 10:33:57.280788	active	2015-10-14 10:33:57.295092	2015-10-14 10:33:57.295092
1030	3	17	17	PCMZCS50	mozambique	1100.00	<p>cut sheet of 15 ilha d mozambique stamps from 1972</p>\r\n	mozambique_pcmzcs_1100_cut_sheet_of_15_ilha_d_mozambique_stamps_from_1972.jpg	image/jpeg	1072035	2015-10-14 10:35:52.105913	active	2015-10-14 10:35:52.119898	2015-10-14 10:35:52.119898
1031	3	17	17	PCMZCS51	mozambique	1400.00	<p>cut sheet of 25 stamps from 1969</p>\r\n	mozambique_pcmzcs_1400_cut_sheet_of_25_stamps_from_1969.jpg	image/jpeg	1137706	2015-10-14 10:37:34.313729	active	2015-10-14 10:37:34.32836	2015-10-14 10:37:34.32836
1032	3	17	17	PCMZCS52	mozambique	1400.00	<p>cut sheet of 25 stamps naval military club from 1966</p>\r\n	mozambique_pcmzcs_1400_cut_sheet_of_25_stamps_naval_military_club_from_1966.jpg	image/jpeg	3596237	2015-10-14 10:40:13.178846	active	2015-10-14 10:40:13.203266	2015-10-14 10:40:13.203266
1033	3	17	17	PCMZCS53	mozambique	1400.00	<p>cut sheet of 25 stamps of 5th centenary of d. manuel 1 from 1969</p>\r\n	mozambique_pcmzcs_1400_cut_sheet_of_25_stamps_of_5th_centenary_of_d._manuel_1_from_1969.jpg	image/jpeg	4297648	2015-10-14 10:43:16.429174	active	2015-10-14 10:43:16.460621	2015-10-14 10:43:16.460621
1034	3	17	17	PCMZCS54	mozambique	1500.00	<p>cut sheet of 25 air mail stamps from 1949</p>\r\n	mozambique_pcmzcs_1500_cut_sheet_of_25_air_mail_stamps_from_1949.jpg	image/jpeg	868743	2015-10-14 10:45:22.954191	active	2015-10-14 10:45:22.968269	2015-10-14 10:45:22.968269
1035	3	17	17	PCMZCS55	mozambique	1500.00	<p>cut sheet of 25 galiota grande ship stamps from 1964</p>\r\n	mozambique_pcmzcs_1500_cut_sheet_of_25_galiota_grande_ship_stamps_from_1964.jpg	image/jpeg	2584010	2015-10-14 10:48:06.990943	active	2015-10-14 10:48:07.010719	2015-10-14 10:48:07.010719
1036	3	17	17	PCMZCS56	mozambique	2000.00	<p>cut sheet of 25 stamps 4th centenary of camoes &nbsp;from 1966</p>\r\n	mozambique_pcmzcs_2000_cut_sheet_of_25_stamps_4th_centenary_of_camoes__from_1966.jpg	image/jpeg	1270085	2015-10-14 10:50:08.495188	active	2015-10-14 10:50:08.510395	2015-10-14 10:50:08.510395
1037	3	17	17	PCMZCS57	mozambique	2000.00	<p>cut sheet of 40 stamps from 1951</p>\r\n	mozambique_pcmzcs_2000_cut_sheet_of_40_stamps_from_1951.jpg	image/jpeg	941492	2015-10-14 10:52:22.114396	active	2015-10-14 10:52:22.128998	2015-10-14 10:52:22.128998
1038	3	17	17	PCMZCS58	mozambique	2450.00	<p>cut sheet of 50 stamps from 1951</p>\r\n	mozambique_pcmzcs_2450_cut_sheet_of_50_stamps_from_1951.jpg	image/jpeg	888088	2015-10-14 10:54:21.190387	active	2015-10-14 10:54:21.204779	2015-10-14 10:54:21.204779
1039	3	17	17	PCMZCS59	mozambique	2500.00	<p>cut sheet of 50 stamps from 1951</p>\r\n	mozambique_pcmzcs_2500__cut_sheet_of_50_stamps_from_1951.jpg	image/jpeg	2907071	2015-10-14 10:57:32.437652	active	2015-10-14 10:57:32.458923	2015-10-14 10:57:32.458923
1040	3	17	17	PCMZCS60	mozambique	2500.00	<p>cut sheet of 50 stamps from 1951</p>\r\n	mozambique_pcmzcs_2500_cut_sheet_of_50_stamps_from_1951.jpg	image/jpeg	978853	2015-10-14 10:59:03.658076	active	2015-10-14 10:59:03.673069	2015-10-14 10:59:03.673069
1041	3	17	17	PCSTCS61	st. thomas & pricipe	950.00	<p>cut sheet of 25 medicinal stamps from 1952</p>\r\n	st._thomas___pricipe_pcstcs_950_cut_sheet_of_25_medicinal_stamps_from_1952.jpg	image/jpeg	3425345	2015-10-15 10:38:43.571871	active	2015-10-15 10:38:43.593307	2015-10-15 10:38:43.593307
1042	3	17	17	PCSTCS62	st. thomas & principe	2500.00	<p>cut sheet of 50 stamps of joa de santarem from 1952</p>\r\n	st._thomas___principe_pcstcs_2500_cut_sheet_of_50_stamps_of_joa_de_santarem_from_1952.jpg	image/jpeg	4043580	2015-10-15 10:42:26.789942	active	2015-10-15 10:42:26.814779	2015-10-15 10:42:26.814779
1043	3	17	17	PCTMCS63	timor,pctmcs	1300.00	<p>cut sheet of 25 stamps from 1956</p>\r\n	timor_pctmcs_1300_cut_sheet_of_25_stamps_from_1956.jpg	image/jpeg	857225	2015-10-15 10:44:31.766874	active	2015-10-15 10:44:31.780169	2015-10-15 10:44:31.780169
1044	3	17	17	PCTMCS64	timor,	1350.00	<p>cut sheet of 25 stamps from 1961</p>\r\n	timor_pctmcs_1350_cut_sheet_of_25_stamps_from_1961.jpg	image/jpeg	823403	2015-10-15 10:46:43.606841	active	2015-10-15 10:46:43.621416	2015-10-15 10:46:43.621416
1045	3	17	17	PCTMCS65	timor	1400.00	<p>cut sheet of 25 stamps from 1961</p>\r\n	timor_pctmcs_1400_cut_sheet_of_25_stamps_from_1961.jpg	image/jpeg	1056397	2015-10-15 10:48:53.110579	active	2015-10-15 10:48:53.125379	2015-10-15 10:48:53.125379
1046	3	17	17	PCTMCS66	timor	1500.00	<p>cut sheet of 25 stamps from 1961</p>\r\n	timor_pctmcs_1500_cut_sheet_of_25_stamps_from_1961.jpg	image/jpeg	3659385	2015-10-15 10:52:16.699246	active	2015-10-15 10:52:16.720598	2015-10-15 10:52:16.720598
1047	3	17	17	PCTMFS67	timor	2400.00	<p>full sheet of 50 stamps from 1950</p>\r\n	timor_pctmfs_2400_full_sheet_of_50_stamps_from_1950.jpg	image/jpeg	3109145	2015-10-15 10:55:37.597419	active	2015-10-15 10:55:37.617076	2015-10-15 10:55:37.617076
1048	3	17	17	PCTMFS68	timor	2450.00	<p>full sheet of 50 stamps from 1950</p>\r\n	timor_pctmfs_2450_full_sheet_of_50_stamps_from_1950.jpg	image/jpeg	3178671	2015-10-15 10:58:56.309806	active	2015-10-15 10:58:56.382806	2015-10-15 10:58:56.382806
1049	3	17	17	PCTMFS	timor	2500.00	<p>full sheet of 50 stamps from 1950</p>\r\n	timor_pctmfs_2500_full_sheet_of_50_stamps_from_1950.jpg	image/jpeg	3000280	2015-10-15 11:05:30.591224	active	2015-10-15 11:05:30.611067	2015-10-15 11:05:30.611067
1050	3	17	17	PCINMS70	INDIA(GOA)	22000.00	<p>miniature sheet from 1952 of SFX, 10x3=30 stamps</p>\r\n	IMG_20151015_114156.jpg	image/jpeg	2274973	2015-10-15 11:56:51.279119	active	2015-10-15 11:56:51.296652	2015-10-15 11:56:51.296652
1051	3	17	17	PCINCS71	india(goa)	4500.00	<p>ST,FRANCIS Xavier stamps from 1931,cut sheet of 29 stamps</p>\r\n	IMG_20151015_154507_981.jpg	image/jpeg	1120688	2015-10-15 12:01:37.294832	active	2015-10-15 12:01:37.309434	2015-10-15 12:01:37.309434
1052	3	17	17	PCINCS72	INDIA-GOA	6200.00	<p>CASKET OF ST, FRANCIS XAVIER FROM 1931, CUT SHEETT OF 39 STAMPS</p>\r\n	IMG_20151015_154712_522.jpg	image/jpeg	793059	2015-10-15 12:04:54.844018	active	2015-10-15 12:04:54.85805	2015-10-15 12:04:54.85805
1053	3	17	17	PCINFS73	india(goa)	22000.00	<p>full sheet of crown series of 28 stamps from 1877&nbsp;</p>\r\n	IMG_20151015_154759_407.jpg	image/jpeg	1157393	2015-10-19 05:48:06.774122	active	2015-10-19 05:48:06.789704	2015-10-19 05:48:06.789704
1054	3	17	17	PCINCS74	India(goa)	5500.00	<p>cut sheet of St. Francis Xavier Cathedral of 30 stamps from 1931</p>\r\n	IMG_20151015_155134_538.jpg	image/jpeg	1026772	2015-10-19 05:51:28.99216	active	2015-10-19 05:51:29.007098	2015-10-19 05:51:29.007098
1055	3	17	17	PCINFS75	India(goa)	22000.00	<p>full sheet of crown series of 28 stamps from 1882</p>\r\n	IMG_20151015_155258_851.jpg	image/jpeg	930313	2015-10-19 05:56:37.107643	active	2015-10-19 05:56:37.122014	2015-10-19 05:56:37.122014
1056	3	17	17	PCINFS76	India(goa)	22000.00	<p>Full sheet of crown series of 28 stamps from 1882</p>\r\n	IMG_20151015_155325_213.jpg	image/jpeg	825770	2015-10-19 06:00:12.3848	active	2015-10-19 06:00:12.399209	2015-10-19 06:00:12.399209
1057	3	17	17	PCINFS77	India(goa)	22000.00	<p>Full sheet of crown series of 28 stamps from 1882</p>\r\n	IMG_20151015_155411_133.jpg	image/jpeg	819524	2015-10-19 06:01:59.408829	active	2015-10-19 06:01:59.42358	2015-10-19 06:01:59.42358
1058	3	17	17	PCINFSOP78	India(goa)	5000.00	<p>Full sheet of 50 stamps of Brito Joao from 1946</p>\r\n	IMG_20151015_155613_220.jpg	image/jpeg	1155325	2015-10-19 06:04:12.617076	active	2015-10-19 06:04:12.632334	2015-10-19 06:04:12.632334
1059	3	17	17	PCINCS79	India(goa)	5500.00	<p>Cut sheet of 50 stamps of&nbsp;Fatima from 1949</p>\r\n	IMG_20151015_155830_531.jpg	image/jpeg	1094469	2015-10-19 06:06:15.151491	active	2015-10-19 06:06:15.166715	2015-10-19 06:06:15.166715
1060	3	17	17	PCINCS80	India(goa)	5500.00	<p>Cut sheet of 50 stamps of&nbsp;Fatima from 1949</p>\r\n	IMG_20151015_155919_779.jpg	image/jpeg	1190928	2015-10-19 06:09:02.644947	active	2015-10-19 06:09:02.658885	2015-10-19 06:09:02.658885
1061	3	17	17	PCINFSOP81	India(goa)	1850.00	<p>Full sheet of 50 stamps of map overprinted series from 1957</p>\r\n	IMG_20151015_160014_291.jpg	image/jpeg	829715	2015-10-19 06:12:30.662715	active	2015-10-19 06:12:30.676347	2015-10-19 06:12:30.676347
1062	3	17	17	PCINCS82	India(goa)	2600.00	<p>cut sheet of 50 stamps of Ano Santo from 1950</p>\r\n	IMG_20151015_160103_345.jpg	image/jpeg	975557	2015-10-19 06:15:18.288869	active	2015-10-19 06:15:18.303027	2015-10-19 06:15:18.303027
1063	3	17	17	PCINFS83	India(goa)	2800.00	<p>Full sheet of 100 stamps of Ano Santo from 1950</p>\r\n	IMG_20151015_160214_794.jpg	image/jpeg	1015097	2015-10-19 06:17:45.051327	active	2015-10-19 06:17:45.065478	2015-10-19 06:17:45.065478
1064	3	17	17	PCINCS84	India(goa)	1400.00	<p>Cut sheet of 25 stamps of Mons. Sebastiao Rudolpho Dalgado from 1955</p>\r\n	IMG_20151015_163044_562.jpg	image/jpeg	996351	2015-10-19 06:20:01.789837	active	2015-10-19 06:20:01.803339	2015-10-19 06:20:01.803339
1065	3	17	17	PCINFSOP85	India(goa)	1750.00	<p>Full sheet of 50 stamps of coat of arms overprinted from 1958</p>\r\n	IMG_20151015_121352.jpg	image/jpeg	2174365	2015-10-19 06:25:07.652844	active	2015-10-19 06:25:07.672131	2015-10-19 06:25:07.672131
1066	3	17	17	PCINFS86	India(goa)	4000.00	<p>Full sheet of 50 stamps of Padre Juze Vaz from 1951</p>\r\n	IMG_20151015_160810_495.jpg	image/jpeg	822142	2015-10-19 06:27:22.129098	active	2015-10-19 06:27:22.142881	2015-10-19 06:27:22.142881
1067	3	17	17	PCINFS87	India(goa)	4000.00	<p>Full sheet of 50 stamps of Padre Juze Vaz from 1951</p>\r\n	IMG_20151015_163003_608.jpg	image/jpeg	1034337	2015-10-19 06:28:58.682808	active	2015-10-19 06:28:58.696791	2015-10-19 06:28:58.696791
1068	3	17	17	PCINFS88	India(goa)	2000.00	<p>Full sheet of 100 stamps of Mons. Sebastiao Rudolpho Dalgado from 1955</p>\r\n	IMG_20151015_163044_562.jpg	image/jpeg	997455	2015-10-19 06:32:05.491095	active	2015-10-19 06:32:05.506377	2015-10-19 06:32:05.506377
1069	3	17	17	PCINFS89	India(goa)	2800.00	<p>Full sheet of 100 stamps of Ano Santo from 1950</p>\r\n	IMG_20151015_163359_829.jpg	image/jpeg	1096273	2015-10-19 06:34:27.792535	active	2015-10-19 06:34:27.806636	2015-10-19 06:34:27.806636
1070	3	17	17	PCINCS90	India(goa)	2600.00	<p>Cut sheet of 50 stamps of Ano Santo from 1950</p>\r\n	IMG_20151015_163418_411.jpg	image/jpeg	971525	2015-10-19 06:36:27.924483	active	2015-10-19 06:36:27.949679	2015-10-19 06:36:27.949679
1071	3	17	17	PCSTCS92	St. Thomas & Principe	2400.00	<p>Cut sheet of 50 stamps of Joao de Santarem from 1952</p>\r\n	IMG_20151016_122230_637.jpg	image/jpeg	637468	2015-10-19 06:45:23.84471	active	2015-10-19 06:45:23.860528	2015-10-19 06:45:23.860528
1072	3	17	17	PCINCS93	India(goa)	900.00	<p>Cut sheet of 50 pink stamps of Mons. Sebastiao Rudolpho Dalgado from 1955</p>\r\n	IMG_20151016_122323_947.jpg	image/jpeg	678773	2015-10-19 06:47:28.036736	active	2015-10-19 06:47:28.05092	2015-10-19 06:47:28.05092
1073	3	17	17	PCINFSOP94	India(goa)	2400.00	<p>Full sheet of D. Constantino de Braganza overprinted of 50 stamps of 80 centavos on 3 reis from 1959</p>\r\n	IMG_20151016_122414_144.jpg	image/jpeg	663483	2015-10-19 06:50:44.368544	active	2015-10-19 06:50:44.382771	2015-10-19 06:50:44.382771
1074	3	17	17	PCINFSOP95	India(goa)	1900.00	<p>Full sheet of overprinted 50 stamps of map series; 10 centavos on 3 reis from 1957</p>\r\n	IMG_20151016_122501_019.jpg	image/jpeg	772546	2015-10-19 06:53:20.755747	active	2015-10-19 06:53:20.770091	2015-10-19 06:53:20.770091
1075	3	17	17	PCINFS97	India(goa)	2300.00	<p>Full sheet of 50 stamps of D. Francisco De Almeida from 1956</p>\r\n	IMG_20151016_122539_719.jpg	image/jpeg	907322	2015-10-19 06:55:50.938205	active	2015-10-19 06:55:50.953035	2015-10-19 06:55:50.953035
1076	3	17	17	PCINCS97	India(goa)	1000.00	<p>Cut sheet of 50 stamps of Ano Santo from 1950</p>\r\n	IMG_20151016_122558_532.jpg	image/jpeg	838911	2015-10-19 06:57:45.642653	active	2015-10-19 06:57:45.656949	2015-10-19 06:57:45.656949
1077	3	17	17	PCINFSOP98	India(goa)	2000.00	<p>Full sheet of 50 stamps of Port of Arms of 15 centavos on 6 reis overprinted from 1958</p>\r\n	IMG_20151016_122625_962.jpg	image/jpeg	983279	2015-10-19 07:00:32.346986	active	2015-10-19 07:00:32.361969	2015-10-19 07:00:32.361969
1078	3	64	18	RAILBG1	QATAR	13.00	<p>Qatar railway big stamp</p>\r\n	IMG_20151016_184010_320.jpg	image/jpeg	459690	2015-10-19 07:37:26.680728	active	2015-10-19 07:37:26.694404	2015-10-19 07:37:26.694404
1079	3	64	18	RAILBG2	CHINA	13.00	<p>China&nbsp;railway big stamp</p>\r\n	IMG_20151016_184050_845.jpg	image/jpeg	668596	2015-10-19 07:40:02.464854	active	2015-10-19 07:40:02.479182	2015-10-19 07:40:02.479182
1080	3	64	18	RAILBG3	OMAN	13.00	<p>Oman&nbsp;railway big stamp</p>\r\n	IMG_20151016_184136_176.jpg	image/jpeg	643376	2015-10-19 07:41:22.763844	active	2015-10-19 07:41:22.778195	2015-10-19 07:41:22.778195
1081	3	64	18	RAILBG4	GUYANA	13.00	<p>Guyana&nbsp;railway big stamp</p>\r\n	IMG_20151016_184220_446.jpg	image/jpeg	737618	2015-10-19 07:43:55.023416	active	2015-10-19 07:43:55.037659	2015-10-19 07:43:55.037659
1082	3	64	18	RAILBG5	GUYANA	13.00	<p>Guyana&nbsp;railway big stamp</p>\r\n	IMG_20151016_184236_405.jpg	image/jpeg	743989	2015-10-19 07:45:04.153009	active	2015-10-19 07:45:04.16701	2015-10-19 07:45:04.16701
1083	3	64	18	RAILBG6	GUYANA	13.00	<p>Guyana&nbsp;railway big stamp</p>\r\n	IMG_20151016_184255_728.jpg	image/jpeg	533366	2015-10-19 07:46:02.719349	active	2015-10-19 07:46:02.733852	2015-10-19 07:46:02.733852
1084	3	64	18	RAILBG7	GUYANA	13.00	<p>Guyana&nbsp;railway big stamp</p>\r\n	IMG_20151016_184312_683.jpg	image/jpeg	487465	2015-10-19 07:47:12.216436	active	2015-10-19 07:47:12.229559	2015-10-19 07:47:12.229559
1085	3	64	18	RAILSM1	HUNGARY	6.00	<p>Hungary&nbsp;railway small stamp</p>\r\n	IMG_20151016_163647a.jpg	image/jpeg	752240	2015-10-19 07:51:52.373258	active	2015-10-19 07:51:52.387831	2015-10-19 07:51:52.387831
1086	3	64	18	RAILSM2	HUNGARY	6.00	<p>Hungary&nbsp;railway small stamp</p>\r\n	IMG_20151016_163822.jpg	image/jpeg	730808	2015-10-19 07:56:08.741347	active	2015-10-19 07:56:08.75536	2015-10-19 07:56:08.75536
1087	3	64	18	RAILSM3	CHINA	6.00	<p>Small railway stamp of China</p>\r\n	IMG_20151016_184441_532.jpg	image/jpeg	381109	2015-10-20 05:08:39.613006	active	2015-10-20 05:08:39.625998	2015-10-20 05:08:39.625998
1088	3	64	18	RAILSM4	ROMANIA	6.00	<p>Small railway stamp of Romania</p>\r\n	IMG_20151016_184511_866.jpg	image/jpeg	397023	2015-10-20 05:10:08.49127	active	2015-10-20 05:10:08.504608	2015-10-20 05:10:08.504608
1089	3	64	18	RAILSM5	NORWAY	6.00	<p>Small railway stamp of Norway</p>\r\n	IMG_20151016_184531_230.jpg	image/jpeg	525169	2015-10-20 05:17:44.239727	active	2015-10-20 05:17:44.253776	2015-10-20 05:17:44.253776
1090	3	64	18	RAILSM6	CHINA	6.00	<p>Small railway stamp of China</p>\r\n	IMG_20151016_184609_299.jpg	image/jpeg	582607	2015-10-20 05:19:02.006553	active	2015-10-20 05:19:02.020203	2015-10-20 05:19:02.020203
1091	3	64	18	RAILSM7	HUNGARY	6.00	<p>Small railway stamp of Hungary</p>\r\n	IMG_20151016_184632_581.jpg	image/jpeg	717777	2015-10-20 05:20:31.716285	active	2015-10-20 05:20:31.730432	2015-10-20 05:20:31.730432
1092	3	64	18	RAILSM8	SWITZERLAND	6.00	<p>Small railway stamp of Switzerland</p>\r\n	IMG_20151017_101040_175.jpg	image/jpeg	683040	2015-10-20 05:22:09.482216	active	2015-10-20 05:22:09.496519	2015-10-20 05:22:09.496519
1093	3	64	18	RAILSM9	BANGLADESH	6.00	<p>Small railway stamp of Bangladesh</p>\r\n	IMG_20151017_101111_211.jpg	image/jpeg	667501	2015-10-20 05:23:19.466483	active	2015-10-20 05:23:19.480373	2015-10-20 05:23:19.480373
1094	3	64	18	RAILSM10	HUNGARY	6.00	<p>Small railway stamp of Hungary</p>\r\n	IMG_20151017_101138_552.jpg	image/jpeg	535986	2015-10-20 05:24:32.722034	active	2015-10-20 05:24:32.735801	2015-10-20 05:24:32.735801
1095	3	64	18	RAILSM11	AFRICA	6.00	<p>Small railway stamp of Africa</p>\r\n	IMG_20151017_101200_112.jpg	image/jpeg	646260	2015-10-20 05:25:54.45588	active	2015-10-20 05:25:54.469259	2015-10-20 05:25:54.469259
1096	3	64	18	RAILMD1	MADAGASCAR	9.00	<p>Medium railway stamp of Madagascar</p>\r\n	IMG_20151016_163903.jpg	image/jpeg	729406	2015-10-20 05:32:30.990238	active	2015-10-20 05:32:31.00469	2015-10-20 05:32:31.00469
1097	3	64	18	RAILMD2	CHINA	9.00	<p>Medium size railway stamp of China</p>\r\n	IMG_20151017_101323_692.jpg	image/jpeg	532202	2015-10-20 05:34:34.123325	active	2015-10-20 05:34:34.136675	2015-10-20 05:34:34.136675
1098	3	64	18	RAILMD3	MEXICO	9.00	<p>Medium size railway stamp of Mexico</p>\r\n	IMG_20151017_101357_415.jpg	image/jpeg	462423	2015-10-20 05:35:26.165336	active	2015-10-20 05:35:26.178396	2015-10-20 05:35:26.178396
1099	3	64	18	RAILMD4	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101417_244.jpg	image/jpeg	735478	2015-10-20 05:36:55.385403	active	2015-10-20 05:36:55.40075	2015-10-20 05:36:55.40075
1100	3	64	18	RAILMD5	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101430_568.jpg	image/jpeg	589895	2015-10-20 05:38:18.216751	active	2015-10-20 05:38:18.230507	2015-10-20 05:38:18.230507
1101	3	64	18	RAILMD6	CZECHOSLOVAKIA	9.00	<p>Medium size railway stamp of Czechoslovakia</p>\r\n	IMG_20151017_101451_021.jpg	image/jpeg	546942	2015-10-20 05:41:26.700876	active	2015-10-20 05:41:26.714124	2015-10-20 05:41:26.714124
1102	3	64	18	RAILMD7	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101506_381.jpg	image/jpeg	565679	2015-10-20 05:42:32.455826	active	2015-10-20 05:42:32.469528	2015-10-20 05:42:32.469528
1103	3	64	18	RAILMD8	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101522_712.jpg	image/jpeg	525875	2015-10-20 05:43:32.408746	active	2015-10-20 05:43:32.42205	2015-10-20 05:43:32.42205
1104	3	64	18	RAILMD9	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101545_245.jpg	image/jpeg	602623	2015-10-20 05:44:48.987789	active	2015-10-20 05:44:49.000958	2015-10-20 05:44:49.000958
1105	3	64	18	RAILMD10	TANZANIA	9.00	<p>Medium size railway stamp of Tanzania</p>\r\n	IMG_20151017_101602_371.jpg	image/jpeg	654289	2015-10-20 05:45:41.26353	active	2015-10-20 05:45:41.277758	2015-10-20 05:45:41.277758
1106	3	64	19	FISHBG1	CUBA	13.00	<p>Big size fish stamp of Cuba</p>\r\n	IMG_20151017_102437_592.jpg	image/jpeg	618365	2015-10-20 05:56:40.723763	active	2015-10-20 05:56:40.738018	2015-10-20 05:56:40.738018
1107	3	64	19	FISHBG2	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_102516_488.jpg	image/jpeg	440332	2015-10-20 05:57:43.676792	active	2015-10-20 05:57:43.689972	2015-10-20 05:57:43.689972
1108	3	64	19	FISHBG3	CZECHOSLOVAKIA	13.00	<p>Big size fish stamp of Czechoslovakia</p>\r\n	IMG_20151017_102539_804.jpg	image/jpeg	497143	2015-10-20 05:59:24.223001	active	2015-10-20 05:59:24.236774	2015-10-20 05:59:24.236774
1109	3	64	19	FISHBG4	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_102620_742.jpg	image/jpeg	719465	2015-10-20 06:01:46.620908	active	2015-10-20 06:01:46.635196	2015-10-20 06:01:46.635196
1110	3	64	19	FISHBG5	MONGOLIA	13.00	<p>Big size fish stamp of Mongolia</p>\r\n	IMG_20151017_102657_676.jpg	image/jpeg	637484	2015-10-20 06:02:51.418797	active	2015-10-20 06:02:51.433479	2015-10-20 06:02:51.433479
1111	3	64	19	FISHBG6	HUNGARY	13.00	<p>Big size fish stamp of Hungary</p>\r\n	IMG_20151017_102715_765.jpg	image/jpeg	693751	2015-10-20 06:04:33.351312	active	2015-10-20 06:04:33.365024	2015-10-20 06:04:33.365024
1112	3	64	19	FISHBG7	CUBA	13.00	<p>Big size fish stamp of Cuba</p>\r\n	IMG_20151017_102743_642.jpg	image/jpeg	520835	2015-10-20 06:05:44.574733	active	2015-10-20 06:05:44.587726	2015-10-20 06:05:44.587726
1113	3	64	19	FISHBG8	POLAND	13.00	<p>Big size fish stamp of Poland</p>\r\n	IMG_20151017_102825_109.jpg	image/jpeg	526634	2015-10-20 06:06:44.106211	active	2015-10-20 06:06:44.11933	2015-10-20 06:06:44.11933
1114	3	64	19	FISHBG9	VIETNAM	13.00	<p>Big size fish stamp of Vietnam</p>\r\n	IMG_20151017_102845_732.jpg	image/jpeg	664156	2015-10-20 06:07:42.46276	active	2015-10-20 06:07:42.476451	2015-10-20 06:07:42.476451
1115	3	64	19	FISHBG10	CZECHOSLOVAKIA	13.00	<p>Big size fish stamp of Czechoslovakia</p>\r\n	IMG_20151017_102905_345.jpg	image/jpeg	611245	2015-10-20 06:09:08.364136	active	2015-10-20 06:09:08.377378	2015-10-20 06:09:08.377378
1116	3	64	19	FISHBG11	VIETNAM	13.00	<p>Big size fish stamp of Vietnam</p>\r\n	IMG_20151017_102941_967.jpg	image/jpeg	784887	2015-10-20 06:11:13.850908	active	2015-10-20 06:11:13.86561	2015-10-20 06:11:13.86561
1117	3	64	19	FISHBG12	CUBA	13.00	<p>Big size fish stamp of Cuba</p>\r\n	IMG_20151017_102958_676.jpg	image/jpeg	810802	2015-10-20 06:12:26.119951	active	2015-10-20 06:12:26.134091	2015-10-20 06:12:26.134091
1118	3	64	19	FISHBG13	POLAND	13.00	<p>Big size fish stamp of Poland</p>\r\n	IMG_20151017_103022_455.jpg	image/jpeg	568857	2015-10-20 06:13:33.087858	active	2015-10-20 06:13:33.100769	2015-10-20 06:13:33.100769
1119	3	64	19	FISHBG14	HUNGARY	13.00	<p>Big size fish stamp of Hungary</p>\r\n	IMG_20151017_103050_616.jpg	image/jpeg	779675	2015-10-20 06:14:55.741741	active	2015-10-20 06:14:55.756133	2015-10-20 06:14:55.756133
1120	3	64	19	FISHBG15	CUBA	13.00	<p>Big size fish stamp of Cuba</p>\r\n	IMG_20151017_103106_648.jpg	image/jpeg	702336	2015-10-20 06:16:02.679899	active	2015-10-20 06:16:02.694006	2015-10-20 06:16:02.694006
1121	3	64	19	FISHBG16	MONGOLIA	13.00	<p>Big size fish stamp of Mongolia</p>\r\n	IMG_20151017_103150_184.jpg	image/jpeg	671485	2015-10-20 06:17:27.675305	active	2015-10-20 06:17:27.689367	2015-10-20 06:17:27.689367
1122	3	64	19	FISHBG17	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103204_031.jpg	image/jpeg	874680	2015-10-20 06:18:47.844599	active	2015-10-20 06:18:47.859636	2015-10-20 06:18:47.859636
1123	3	64	19	FISHBG18	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103220_766.jpg	image/jpeg	502683	2015-10-20 06:21:07.553073	active	2015-10-20 06:21:07.566366	2015-10-20 06:21:07.566366
1124	3	64	19	FISHBG19	FUJEIRA	13.00	<p>Big size fish stamp of Fujeira</p>\r\n	IMG_20151017_102557_699.jpg	image/jpeg	574033	2015-10-20 06:23:50.623193	active	2015-10-20 06:23:50.637006	2015-10-20 06:23:50.637006
1125	3	64	19	FISHBG20	NICARAGUA	13.00	<p>Big size fish stamp of Nicaragua</p>\r\n	IMG_20151017_102921_138.jpg	image/jpeg	693353	2015-10-20 06:25:02.162745	active	2015-10-20 06:25:02.177194	2015-10-20 06:25:02.177194
1126	3	64	19	FISHBG21	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103233_866.jpg	image/jpeg	756912	2015-10-20 06:26:22.147614	active	2015-10-20 06:26:22.161884	2015-10-20 06:26:22.161884
1127	3	64	19	FISHBG22	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103314_938.jpg	image/jpeg	683025	2015-10-20 06:27:14.209735	active	2015-10-20 06:27:14.223019	2015-10-20 06:27:14.223019
1128	3	64	19	FISHBG23	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103329_398.jpg	image/jpeg	625965	2015-10-20 06:28:13.078806	active	2015-10-20 06:28:13.092324	2015-10-20 06:28:13.092324
1129	3	64	19	FISHBG24	POLAND	13.00	<p>Big size fish stamp of Poland</p>\r\n	IMG_20151017_103404_117.jpg	image/jpeg	462893	2015-10-20 06:29:04.893644	active	2015-10-20 06:29:04.906919	2015-10-20 06:29:04.906919
1130	3	64	19	FISHBG25	CUBA	13.00	<p>Big size fish stamp of Cuba</p>\r\n	IMG_20151017_103609_966.jpg	image/jpeg	629701	2015-10-20 06:30:04.811144	active	2015-10-20 06:30:04.824591	2015-10-20 06:30:04.824591
1131	3	64	19	FISHBG26	COMOROS	13.00	<p>Big size fish stamp of Comoros</p>\r\n	IMG_20151017_103648_168.jpg	image/jpeg	750011	2015-10-20 06:31:53.934548	active	2015-10-20 06:31:53.949763	2015-10-20 06:31:53.949763
1132	3	64	19	FISHBG27	COMOROS	13.00	<p>Big size fish stamp of Comoros</p>\r\n	IMG_20151017_103715_127.jpg	image/jpeg	862515	2015-10-20 06:32:59.473505	active	2015-10-20 06:32:59.487937	2015-10-20 06:32:59.487937
1133	3	64	19	FISHBG28	POLAND	13.00	<p>Big size fish stamp of Poland</p>\r\n	IMG_20151017_103740_108.jpg	image/jpeg	652262	2015-10-20 06:34:50.866855	active	2015-10-20 06:34:50.881101	2015-10-20 06:34:50.881101
1134	3	64	19	FISHBG29	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103804_326.jpg	image/jpeg	455196	2015-10-20 06:36:18.556764	active	2015-10-20 06:36:18.571725	2015-10-20 06:36:18.571725
1135	3	64	19	FISHBG30	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103820_734.jpg	image/jpeg	578653	2015-10-20 06:37:42.695744	active	2015-10-20 06:37:42.709212	2015-10-20 06:37:42.709212
1136	3	64	19	FISHBG31	LAOS	13.00	<p>Big size fish stamp of Laos</p>\r\n	IMG_20151017_103843_993.jpg	image/jpeg	557889	2015-10-20 06:39:02.338034	active	2015-10-20 06:39:02.351524	2015-10-20 06:39:02.351524
1137	3	64	19	FISHBG32	VIETNAM	13.00	<p>Big size fish stamp of Vietnam</p>\r\n	IMG_20151017_103857_924.jpg	image/jpeg	684736	2015-10-20 06:40:28.688137	active	2015-10-20 06:40:28.702124	2015-10-20 06:40:28.702124
1138	3	64	19	FISHBG33	HUNGARY	13.00	<p>Big size fish stamp of Hungary</p>\r\n	IMG_20151017_103923_473.jpg	image/jpeg	622677	2015-10-20 06:42:01.56891	active	2015-10-20 06:42:01.582203	2015-10-20 06:42:01.582203
1139	3	64	19	FISHBG34	SWAZILAND	13.00	<p>Big size fish stamp of Swaziland</p>\r\n	IMG_20151017_104716_553.jpg	image/jpeg	681025	2015-10-20 06:43:43.692438	active	2015-10-20 06:43:43.706559	2015-10-20 06:43:43.706559
1140	3	64	19	FISHBG35	MONGOLIA	13.00	<p>Big size fish stamp of Mongolia</p>\r\n	IMG_20151017_104753_665.jpg	image/jpeg	794967	2015-10-20 06:45:09.777059	active	2015-10-20 06:45:09.791117	2015-10-20 06:45:09.791117
1141	3	64	19	FISHBG36	VIETNAM	13.00	<p>Big size fish stamp of Vietnam</p>\r\n	IMG_20151017_104807_294.jpg	image/jpeg	711808	2015-10-20 06:46:40.296899	active	2015-10-20 06:46:40.310695	2015-10-20 06:46:40.310695
1142	3	64	19	FISHBG37	POLAND	13.00	<p>Big size fish stamp of Poland</p>\r\n	IMG_20151017_104823_410.jpg	image/jpeg	616538	2015-10-20 06:47:55.3364	active	2015-10-20 06:47:55.350809	2015-10-20 06:47:55.350809
1143	3	64	18	RAILMD11	MALAWI	9.00	<p>Medium size railway stamp of Malawi</p>\r\n	IMG_20151016_163446.jpg	image/jpeg	761267	2015-10-20 06:51:33.611246	active	2015-10-20 06:51:33.626255	2015-10-20 06:51:33.626255
1144	3	64	18	RAILMD12	SAN MARINO	9.00	<p>Medium size railway stamp of San Marino</p>\r\n	IMG_20151016_163614.jpg	image/jpeg	854187	2015-10-20 06:53:58.738077	active	2015-10-20 06:53:58.752626	2015-10-20 06:53:58.752626
1145	3	64	19	FISHSM1	SRI LANKA	6.00	<p>Small size fish stamp of Sri Lanka</p>\r\n	IMG_20151017_120903_958.jpg	image/jpeg	457750	2015-10-20 06:58:02.221432	active	2015-10-20 06:58:02.235213	2015-10-20 06:58:02.235213
1146	3	64	19	FISHSM2	SOUTH KOREA	6.00	<p>Small size fish stamp of South Korea</p>\r\n	IMG_20151017_120933_262.jpg	image/jpeg	523775	2015-10-20 06:59:52.594569	active	2015-10-20 06:59:52.608061	2015-10-20 06:59:52.608061
1147	3	64	19	FISHSM3	SOUTH KOREA	6.00	<p>Small size fish stamp of South Korea</p>\r\n	IMG_20151017_121008_845.jpg	image/jpeg	505593	2015-10-20 07:01:45.240894	active	2015-10-20 07:01:45.254069	2015-10-20 07:01:45.254069
1148	3	64	19	FISHSM4	SRI LANKA	6.00	<p>Small size fish stamp of Sri Lanka</p>\r\n	IMG_20151017_121130_313.jpg	image/jpeg	551511	2015-10-20 07:03:29.938925	active	2015-10-20 07:03:29.953086	2015-10-20 07:03:29.953086
1149	3	64	19	FISHSM5	SOUTH KOREA	6.00	<p>Small size fish stamp of South Korea</p>\r\n	IMG_20151017_121150_199.jpg	image/jpeg	247113	2015-10-20 07:04:48.891492	active	2015-10-20 07:04:48.904169	2015-10-20 07:04:48.904169
1150	3	64	19	FISHSM6	CUBA	6.00	<p>Small size fish stamp of Cuba</p>\r\n	IMG_20151017_121238_518.jpg	image/jpeg	474511	2015-10-20 07:05:52.611014	active	2015-10-20 07:05:52.624623	2015-10-20 07:05:52.624623
1151	3	64	19	FISHMD1	NEPAL	9.00	<p>Medium size fish stamp of Nepal</p>\r\n	IMG_20151017_121449_144.jpg	image/jpeg	472466	2015-10-20 07:10:31.85394	active	2015-10-20 07:10:31.943148	2015-10-20 07:10:31.943148
1152	3	64	19	FISHMD2	NICARAGUA	9.00	<p>Medium size fish stamp of Nicaragua</p>\r\n	IMG_20151017_121506_928.jpg	image/jpeg	621754	2015-10-20 07:12:17.987577	active	2015-10-20 07:12:18.001067	2015-10-20 07:12:18.001067
1153	3	64	19	FISHMD3	GRENADA	9.00	<p>Medium size fish stamp of Grenada</p>\r\n	IMG_20151017_121524_965.jpg	image/jpeg	707308	2015-10-20 07:13:43.234389	active	2015-10-20 07:13:43.248011	2015-10-20 07:13:43.248011
1154	3	64	19	FISHMD4	TANZANIA	6.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_121541_540.jpg	image/jpeg	738225	2015-10-20 07:16:12.711267	active	2015-10-20 07:16:12.725556	2015-10-20 07:16:12.725556
1155	3	64	19	FISHMD5	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_121556_697.jpg	image/jpeg	654186	2015-10-20 07:18:55.45367	active	2015-10-20 07:18:55.466569	2015-10-20 07:18:55.466569
1156	3	64	19	FISHMD6	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_121616_607.jpg	image/jpeg	560781	2015-10-20 07:20:01.110109	active	2015-10-20 07:20:01.129496	2015-10-20 07:20:01.129496
1157	3	64	19	FISHMD7	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_121631_958.jpg	image/jpeg	614005	2015-10-20 07:22:15.08156	active	2015-10-20 07:22:15.095658	2015-10-20 07:22:15.095658
1158	3	64	19	FISHMD8	GRENADA	9.00	<p>Medium size fish stamp of Grenada</p>\r\n	IMG_20151017_121643_917.jpg	image/jpeg	715666	2015-10-20 07:24:09.632787	active	2015-10-20 07:24:09.647034	2015-10-20 07:24:09.647034
1159	3	64	19	FISHMD9	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_121702_081.jpg	image/jpeg	564497	2015-10-20 07:26:04.330117	active	2015-10-20 07:26:04.343218	2015-10-20 07:26:04.343218
1160	3	64	19	FISHMD10	GRENADA	9.00	<p>Medium size fish stamp of Grenada</p>\r\n	IMG_20151017_121716_082.jpg	image/jpeg	670053	2015-10-20 07:27:56.656928	active	2015-10-20 07:27:56.670695	2015-10-20 07:27:56.670695
1161	3	64	19	FISHMD11	MALI	9.00	<p>Medium size fish stamp of Mali</p>\r\n	IMG_20151017_121731_819.jpg	image/jpeg	658509	2015-10-20 07:29:04.922363	active	2015-10-20 07:29:04.936006	2015-10-20 07:29:04.936006
1162	3	64	19	FISHMD12	HUNGARY	9.00	<p>Medium size fish stamp of Hungary</p>\r\n	IMG_20151017_121752_766.jpg	image/jpeg	560060	2015-10-20 07:30:22.600112	active	2015-10-20 07:30:22.614048	2015-10-20 07:30:22.614048
1163	3	64	19	FISHMD13	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_121810_695.jpg	image/jpeg	765621	2015-10-20 07:32:00.973583	active	2015-10-20 07:32:00.987667	2015-10-20 07:32:00.987667
1164	3	64	19	FISHMD14	St. VINCENT	9.00	<p>Medium size fish stamp of St. Vincent</p>\r\n	IMG_20151017_121828_835.jpg	image/jpeg	672420	2015-10-20 07:33:22.863845	active	2015-10-20 07:33:22.877553	2015-10-20 07:33:22.877553
1165	3	64	19	FISHMD15	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_121844_204.jpg	image/jpeg	672641	2015-10-20 07:34:39.019214	active	2015-10-20 07:34:39.034248	2015-10-20 07:34:39.034248
1166	3	64	19	FISHMD16	GRENADA	9.00	<p>Medium size fish stamp of Grenada</p>\r\n	IMG_20151017_121858_701.jpg	image/jpeg	611343	2015-10-20 07:36:02.572673	active	2015-10-20 07:36:02.585783	2015-10-20 07:36:02.585783
1167	3	64	19	FISHMD17	MALI	9.00	<p>Medium size fish stamp of Mali</p>\r\n	IMG_20151017_123335_073.jpg	image/jpeg	515975	2015-10-20 07:37:26.595158	active	2015-10-20 07:37:26.608945	2015-10-20 07:37:26.608945
1168	3	64	19	FISHMD18	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_123350_493.jpg	image/jpeg	485408	2015-10-20 07:38:29.615843	active	2015-10-20 07:38:29.630025	2015-10-20 07:38:29.630025
1169	3	64	19	FISHMD19	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123410_227.jpg	image/jpeg	538775	2015-10-20 07:39:22.408783	active	2015-10-20 07:39:22.422881	2015-10-20 07:39:22.422881
1170	3	64	19	FISHMD20	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123427_768.jpg	image/jpeg	581646	2015-10-20 07:40:59.892568	active	2015-10-20 07:40:59.906409	2015-10-20 07:40:59.906409
1171	3	64	19	FISHMD21	HUNGARY	9.00	<p>Medium size fish stamp of Hungary</p>\r\n	IMG_20151017_123445_545.jpg	image/jpeg	704146	2015-10-20 07:42:09.277506	active	2015-10-20 07:42:09.291838	2015-10-20 07:42:09.291838
1172	3	64	19	FISHMD22	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_123514_109.jpg	image/jpeg	646020	2015-10-20 07:43:20.011589	active	2015-10-20 07:43:20.025338	2015-10-20 07:43:20.025338
1173	3	64	19	FISHMD23	NICARAGUA	9.00	<p>Medium size fish stamp of Nicaragua</p>\r\n	IMG_20151017_123529_014.jpg	image/jpeg	752908	2015-10-20 07:44:28.148156	active	2015-10-20 07:44:28.162047	2015-10-20 07:44:28.162047
1174	3	64	19	FISHMD24	VIETNAM	9.00	<p>Medium size fish stamp of Vietnam</p>\r\n	IMG_20151017_123551_148.jpg	image/jpeg	548360	2015-10-20 07:45:29.95898	active	2015-10-20 07:45:29.972764	2015-10-20 07:45:29.972764
1175	3	64	19	FISHMD25	NICARAGUA	9.00	<p>Medium size fish stamp of Nicaragua</p>\r\n	IMG_20151017_123615_700.jpg	image/jpeg	682680	2015-10-20 07:46:30.238256	active	2015-10-20 07:46:30.252646	2015-10-20 07:46:30.252646
1176	3	64	19	FISHMD26	GRENADA	9.00	<p>Medium size fish stamp of Grenada</p>\r\n	IMG_20151017_123642_857.jpg	image/jpeg	748593	2015-10-20 07:47:45.876316	active	2015-10-20 07:47:45.891213	2015-10-20 07:47:45.891213
1177	3	64	19	FISHMD27	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123705_153.jpg	image/jpeg	617158	2015-10-20 07:49:05.052818	active	2015-10-20 07:49:05.066846	2015-10-20 07:49:05.066846
1178	3	64	19	FISHMD28	NICARAGUA	9.00	<p>Medium size fish stamp of Nicaragua</p>\r\n	IMG_20151017_123718_580.jpg	image/jpeg	766676	2015-10-20 07:50:01.401397	active	2015-10-20 07:50:01.415187	2015-10-20 07:50:01.415187
1179	3	64	19	FISHMD29	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123738_507.jpg	image/jpeg	668261	2015-10-20 07:51:09.444741	active	2015-10-20 07:51:09.45808	2015-10-20 07:51:09.45808
1180	3	64	19	FISHMD30	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123823_829.jpg	image/jpeg	626309	2015-10-20 07:53:09.479135	active	2015-10-20 07:53:09.492335	2015-10-20 07:53:09.492335
1181	3	64	19	FISHMD31	MADAGASCAR	9.00	<p>Medium size fish stamp of Madagascar</p>\r\n	IMG_20151017_123841_319.jpg	image/jpeg	474938	2015-10-20 07:54:16.684726	active	2015-10-20 07:54:16.697344	2015-10-20 07:54:16.697344
1182	3	64	19	FISHMD32	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123855_779.jpg	image/jpeg	873376	2015-10-20 07:55:19.878574	active	2015-10-20 07:55:19.893525	2015-10-20 07:55:19.893525
1183	3	64	19	FISHMD33	St. VINCENT	9.00	<p>Medium size fish stamp of St. Vincent</p>\r\n	IMG_20151017_123909_222.jpg	image/jpeg	608976	2015-10-20 07:56:51.375756	active	2015-10-20 07:56:51.389396	2015-10-20 07:56:51.389396
1184	3	64	19	FISHMD34	DOMINICA	9.00	<p>Medium size fish stamp of Dominica</p>\r\n	IMG_20151017_123934_333.jpg	image/jpeg	807505	2015-10-20 07:58:09.530581	active	2015-10-20 07:58:09.54472	2015-10-20 07:58:09.54472
1185	3	64	19	FISHMD35	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_123951_738.jpg	image/jpeg	703243	2015-10-20 07:59:07.006791	active	2015-10-20 07:59:07.020398	2015-10-20 07:59:07.020398
1186	3	64	19	FISHMD36	TANZANIA	9.00	<p>Medium size fish stamp of Tanzania</p>\r\n	IMG_20151017_124008_092.jpg	image/jpeg	655698	2015-10-20 10:57:24.834899	active	2015-10-20 10:57:24.849938	2015-10-20 10:57:24.849938
1187	3	64	19	FISHMD37	TANZANIA	9.00	<p>Medium size Fish stamp of Tanzania</p>\r\n	IMG_20151017_124039_568.jpg	image/jpeg	636388	2015-10-20 10:59:12.021035	active	2015-10-20 10:59:12.043056	2015-10-20 10:59:12.043056
1188	3	64	19	FISHMD38	TUVALU	9.00	<p>Medium size Fish stamp of Tuvalu</p>\r\n	IMG_20151017_124056_732.jpg	image/jpeg	517436	2015-10-20 11:00:20.991129	active	2015-10-20 11:00:21.00402	2015-10-20 11:00:21.00402
1189	3	64	19	FISHMD39	NICARAGUA	9.00	<p>Medium size Fish stamp of Nicaragua</p>\r\n	IMG_20151017_124109_417.jpg	image/jpeg	780198	2015-10-20 11:01:40.830804	active	2015-10-20 11:01:40.845296	2015-10-20 11:01:40.845296
1190	3	64	19	FISHMD40	GERMANY	9.00	<p>Medium size Fish stamp of Germany</p>\r\n	IMG_20151017_124123_132.jpg	image/jpeg	656879	2015-10-20 11:03:12.210073	active	2015-10-20 11:03:12.224037	2015-10-20 11:03:12.224037
1191	3	64	19	FISHMD41	TANZANIA	9.00	<p>Medium size Fish stamp of Tanzania</p>\r\n	IMG_20151017_124136_843.jpg	image/jpeg	774461	2015-10-20 11:04:10.104832	active	2015-10-20 11:04:10.119126	2015-10-20 11:04:10.119126
1192	3	64	19	FISHMD42	NICARAGUA	9.00	<p>Medium size Fish stamp of Nicaragua</p>\r\n	IMG_20151017_124150_506.jpg	image/jpeg	721730	2015-10-20 11:05:10.039765	active	2015-10-20 11:05:10.053442	2015-10-20 11:05:10.053442
1193	3	64	19	FISHMD43	MALI	9.00	<p>Medium size Fish stamp of Mali</p>\r\n	IMG_20151017_124214_990.jpg	image/jpeg	506627	2015-10-20 11:06:21.558079	active	2015-10-20 11:06:21.648022	2015-10-20 11:06:21.648022
1194	3	64	19	FISHMD44	SINGAPORE	9.00	<p>Medium size Fish stamp of Singapore</p>\r\n	IMG_20151017_124229_780.jpg	image/jpeg	735528	2015-10-20 11:07:19.663047	active	2015-10-20 11:07:19.676988	2015-10-20 11:07:19.676988
1195	3	64	19	FISHMD45	BELIZE	9.00	<p>Medium size Fish stamp of Belize</p>\r\n	IMG_20151017_124244_781.jpg	image/jpeg	699375	2015-10-20 11:08:51.890567	active	2015-10-20 11:08:51.904287	2015-10-20 11:08:51.904287
1196	3	64	19	FISHMD46	SRI LANKA	9.00	<p>Medium size Fish stamp of Sri Lanka</p>\r\n	IMG_20151017_124302_660.jpg	image/jpeg	680100	2015-10-20 11:10:04.667838	active	2015-10-20 11:10:04.681753	2015-10-20 11:10:04.681753
1197	3	64	19	FISHMD47	MALI	9.00	<p>Medium size Fish stamp of Mali</p>\r\n	IMG_20151017_124320_718.jpg	image/jpeg	680018	2015-10-20 11:11:09.002622	active	2015-10-20 11:11:09.016488	2015-10-20 11:11:09.016488
1198	3	64	19	FISHMD48	HUNGARY	9.00	<p>Medium size Fish stamp of Hungary</p>\r\n	IMG_20151017_124341_505.jpg	image/jpeg	631824	2015-10-20 11:12:05.398364	active	2015-10-20 11:12:05.411893	2015-10-20 11:12:05.411893
1199	3	64	19	FISHMD49	GRENADA	9.00	<p>Medium size Fish stamp of Grenada</p>\r\n	IMG_20151017_124445_704.jpg	image/jpeg	585213	2015-10-20 11:13:20.290061	active	2015-10-20 11:13:20.303414	2015-10-20 11:13:20.303414
1200	3	64	19	FISHMD50	HUNGARY	9.00	<p>Medium size Fish stamp of Hungary</p>\r\n	IMG_20151017_124501_348.jpg	image/jpeg	864047	2015-10-20 11:14:29.216974	active	2015-10-20 11:14:29.230712	2015-10-20 11:14:29.230712
1201	3	64	19	FISHMD51	MALDIVES	9.00	<p>Medium size Fish stamp of Maldives</p>\r\n	IMG_20151017_124519_887.jpg	image/jpeg	495831	2015-10-20 11:15:57.757063	active	2015-10-20 11:15:57.770338	2015-10-20 11:15:57.770338
1202	3	64	19	FISHMD52	SRI LANKA	9.00	<p>Medium size Fish stamp of Sri Lanka</p>\r\n	IMG_20151017_124537_655.jpg	image/jpeg	790826	2015-10-20 11:17:01.624578	active	2015-10-20 11:17:01.638887	2015-10-20 11:17:01.638887
1203	3	64	20	ANIMBG1	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130333_605.jpg	image/jpeg	517625	2015-10-20 11:25:20.530382	active	2015-10-20 11:25:20.544082	2015-10-20 11:25:20.544082
1204	3	64	20	ANIMBG2	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130349_204.jpg	image/jpeg	550856	2015-10-20 11:26:56.544242	active	2015-10-20 11:26:56.557799	2015-10-20 11:26:56.557799
1206	3	64	20	ANIMBG4	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130428_784.jpg	image/jpeg	731005	2015-10-20 11:29:13.965947	active	2015-10-20 11:29:13.97949	2015-10-20 11:29:13.97949
1205	3	64	20	ANIMBG3	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130415_683.jpg	image/jpeg	548659	2015-10-20 11:28:08.78923	active	2015-10-20 11:28:08.802122	2015-10-20 11:31:04.847416
1207	3	64	20	ANIMBG5	EQUATORIAL GUINEA	13.00	<p>Big size Animals stamp of Equalatorial Guinea</p>\r\n	IMG_20151017_130450_687.jpg	image/jpeg	893610	2015-10-20 11:34:24.097587	active	2015-10-20 11:34:24.112032	2015-10-20 11:34:24.112032
1208	3	64	20	ANIMBG6	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130506_193.jpg	image/jpeg	919749	2015-10-20 11:35:55.889031	active	2015-10-20 11:35:55.903856	2015-10-20 11:35:55.903856
1209	3	64	20	ANIMBG7	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_130529_944.jpg	image/jpeg	519187	2015-10-20 11:37:10.274371	active	2015-10-20 11:37:10.287636	2015-10-20 11:37:10.287636
1210	3	64	20	ANIMBG8	CHINA	13.00	<p>Big size Animals stamp of China</p>\r\n	IMG_20151017_130544_841.jpg	image/jpeg	831684	2015-10-20 11:38:52.351113	active	2015-10-20 11:38:52.365589	2015-10-20 11:38:52.365589
1211	3	64	20	ANIMBG9	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_130556_936.jpg	image/jpeg	694647	2015-10-20 11:40:08.783735	active	2015-10-20 11:40:08.797562	2015-10-20 11:40:08.797562
1212	3	64	20	ANIMBG10	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_130616_069.jpg	image/jpeg	430858	2015-10-20 11:41:50.381083	active	2015-10-20 11:41:50.394231	2015-10-20 11:41:50.394231
1213	3	64	20	ANIMBG11	CUBA	13.00	<p>Big size Animals stamp of Cuba</p>\r\n	IMG_20151017_130642_730.jpg	image/jpeg	708735	2015-10-20 11:42:50.99088	active	2015-10-20 11:42:51.00529	2015-10-20 11:42:51.00529
1214	3	64	20	ANIMBG12	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130659_727.jpg	image/jpeg	552360	2015-10-20 11:43:55.991524	active	2015-10-20 11:43:56.004962	2015-10-20 11:43:56.004962
1215	3	64	20	ANIMBG13	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130714_398.jpg	image/jpeg	499353	2015-10-20 11:45:18.452856	active	2015-10-20 11:45:18.465951	2015-10-20 11:45:18.465951
1216	3	64	20	ANIMBG14	CAMBODIA	13.00	<p>Big size Animals stamp of Cambodia</p>\r\n	IMG_20151017_130732_232.jpg	image/jpeg	492256	2015-10-20 11:46:59.027107	active	2015-10-20 11:46:59.041294	2015-10-20 11:46:59.041294
1217	3	64	20	15	CAMBODIA	13.00	<p>Big size Animals stamp of Cambodia</p>\r\n	IMG_20151017_130745_456.jpg	image/jpeg	690799	2015-10-20 11:48:31.195328	active	2015-10-20 11:48:31.208607	2015-10-20 11:48:31.208607
1218	3	64	20	ANIMBG16	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_130802_494.jpg	image/jpeg	489323	2015-10-20 11:49:42.872212	active	2015-10-20 11:49:42.885682	2015-10-20 11:49:42.885682
1219	3	64	20	ANIMBG17	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_130818_304.jpg	image/jpeg	602174	2015-10-20 11:50:48.391706	active	2015-10-20 11:50:48.405089	2015-10-20 11:50:48.405089
1220	3	64	20	ANIMBG18	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_130832_046.jpg	image/jpeg	653992	2015-10-20 11:52:10.497712	active	2015-10-20 11:52:10.511131	2015-10-20 11:52:10.511131
1221	3	64	20	ANIMBG19	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_130903_828.jpg	image/jpeg	783552	2015-10-20 11:53:25.78432	active	2015-10-20 11:53:25.798215	2015-10-20 11:53:25.798215
1222	3	64	20	ANIMBG20	VIETNAM	13.00	<p>Big size Animals stamp of Vietnam</p>\r\n	IMG_20151017_130917_216.jpg	image/jpeg	530216	2015-10-20 11:54:26.55858	active	2015-10-20 11:54:26.57213	2015-10-20 11:54:26.57213
1223	3	64	20	ANIMBG21	POLAND	13.00	<p>Big size Animals stamp of Poland</p>\r\n	IMG_20151017_130931_653.jpg	image/jpeg	677556	2015-10-20 11:55:28.138386	active	2015-10-20 11:55:28.151923	2015-10-20 11:55:28.151923
1224	3	64	20	ANIMBG22	CONGO	13.00	<p>Big size Animals stamp of Congo</p>\r\n	IMG_20151017_130947_299.jpg	image/jpeg	530139	2015-10-20 11:56:28.750058	active	2015-10-20 11:56:28.763348	2015-10-20 11:56:28.763348
1225	3	64	20	ANIMBG23	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_131008_213.jpg	image/jpeg	893239	2015-10-20 11:57:29.99413	active	2015-10-20 11:57:30.008694	2015-10-20 11:57:30.008694
1226	3	64	20	ANIMBG24	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_131049_174.jpg	image/jpeg	690647	2015-10-20 11:58:36.174017	active	2015-10-20 11:58:36.187596	2015-10-20 11:58:36.187596
1227	3	64	20	ANIMBG25	EQUATORIAL GUINEA	13.00	<p>Big size Animals stamp of Equatorial Guinea</p>\r\n	IMG_20151017_131116_507.jpg	image/jpeg	668029	2015-10-20 12:01:02.002683	active	2015-10-20 12:01:02.016714	2015-10-20 12:01:02.016714
1228	3	64	20	ANIMBG26	TANZANIA	13.00	<p>Big size Animals stamp of Tanzania</p>\r\n	IMG_20151017_131128_314.jpg	image/jpeg	668398	2015-10-20 12:02:17.40301	active	2015-10-20 12:02:17.417185	2015-10-20 12:02:17.417185
1229	3	64	20	ANIMBG27	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_131154_983.jpg	image/jpeg	448513	2015-10-20 12:03:17.876996	active	2015-10-20 12:03:17.890406	2015-10-20 12:03:17.890406
1230	3	64	20	ANIMBG28	CUBA	13.00	<p>Big size Animals stamp of Cuba</p>\r\n	IMG_20151017_131211_244.jpg	image/jpeg	466443	2015-10-20 12:04:29.436675	active	2015-10-20 12:04:29.450104	2015-10-20 12:04:29.450104
1231	3	64	20	ANIMBG29	HUNGARY	13.00	<p>Big size Animals stamp of Hungary</p>\r\n	IMG_20151017_131228_618.jpg	image/jpeg	611993	2015-10-20 12:05:38.871625	active	2015-10-20 12:05:38.885504	2015-10-20 12:05:38.885504
1232	3	64	20	ANIMBG30	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_131248_787.jpg	image/jpeg	529564	2015-10-20 12:06:46.993559	active	2015-10-20 12:06:47.007252	2015-10-20 12:06:47.007252
1233	3	64	20	ANIMBG31	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_131310_101.jpg	image/jpeg	608723	2015-10-20 12:07:57.164407	active	2015-10-20 12:07:57.179173	2015-10-20 12:07:57.179173
1234	3	64	20	ANIMBG32	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_131331_149.jpg	image/jpeg	625441	2015-10-20 12:09:11.422759	active	2015-10-20 12:09:11.436522	2015-10-20 12:09:11.436522
1235	3	64	20	ANIMBG33	CUBA	13.00	<p>Big size Animals stamp of Cuba</p>\r\n	IMG_20151017_131413_188.jpg	image/jpeg	698572	2015-10-20 12:10:21.64608	active	2015-10-20 12:10:21.659967	2015-10-20 12:10:21.659967
1236	3	64	20	ANIMBG34	POLAND	13.00	<p>Big size Animals stamp of Poland</p>\r\n	IMG_20151017_132351_157.jpg	image/jpeg	716419	2015-10-20 12:11:34.88813	active	2015-10-20 12:11:34.902922	2015-10-20 12:11:34.902922
1237	3	64	20	ANIMBG35	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_132408_119.jpg	image/jpeg	674814	2015-10-20 12:12:41.411468	active	2015-10-20 12:12:41.424679	2015-10-20 12:12:41.424679
1238	3	64	20	ANIMBG36	NEPAL	13.00	<p>Big size Animals stamp of Nepal</p>\r\n	IMG_20151017_132433_187.jpg	image/jpeg	693592	2015-10-20 12:13:56.956203	active	2015-10-20 12:13:56.970035	2015-10-20 12:13:56.970035
1239	3	64	20	ANIMBG37	CUBA	13.00	<p>Big size Animals stamp of Cuba</p>\r\n	IMG_20151017_132450_011.jpg	image/jpeg	1125214	2015-10-20 12:15:13.16346	active	2015-10-20 12:15:13.178141	2015-10-20 12:15:13.178141
1240	3	64	20	ANIMBG38	CUBA	13.00	<p>Big size Animals stamp of Cuba</p>\r\n	IMG_20151017_161315_830.jpg	image/jpeg	775315	2015-10-20 12:16:36.398459	active	2015-10-20 12:16:36.4124	2015-10-20 12:16:36.4124
1241	3	64	20	ANIMBG39	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_161336_240.jpg	image/jpeg	641685	2015-10-20 12:17:44.913305	active	2015-10-20 12:17:44.926859	2015-10-20 12:17:44.926859
1242	3	64	20	ANIMBG40	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_161357_714.jpg	image/jpeg	539004	2015-10-20 12:19:00.354686	active	2015-10-20 12:19:00.367908	2015-10-20 12:19:00.367908
1243	3	64	20	ANIMBG41	CUBA	13.00	<p>Big size Animals stamp of CUBA</p>\r\n	IMG_20151017_161417_735.jpg	image/jpeg	613299	2015-10-20 12:20:16.888796	active	2015-10-20 12:20:16.902567	2015-10-20 12:20:16.902567
1244	3	64	20	ANIMBG42	HUNGARY	13.00	<p>Big size Animals stamp of Hungary</p>\r\n	IMG_20151017_161434_592.jpg	image/jpeg	755405	2015-10-20 12:21:22.169436	active	2015-10-20 12:21:22.18314	2015-10-20 12:21:22.18314
1245	3	64	20	ANIMBG43	SAHARAUI	13.00	<p>Big size Animals stamp of Saharaui</p>\r\n	IMG_20151017_161455_484.jpg	image/jpeg	744735	2015-10-20 12:23:23.590035	active	2015-10-20 12:23:23.603953	2015-10-20 12:23:23.603953
1246	3	64	20	ANIMBG44	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_161516_799.jpg	image/jpeg	985022	2015-10-20 12:24:30.449092	active	2015-10-20 12:24:30.46315	2015-10-20 12:24:30.46315
1247	3	64	20	ANIMBG45	POLAND	13.00	<p>Big size Animals stamp of Poland</p>\r\n	IMG_20151017_161533_984.jpg	image/jpeg	637954	2015-10-20 12:25:28.131664	active	2015-10-20 12:25:28.144786	2015-10-20 12:25:28.144786
1248	3	64	20	ANIMBG46	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_161556_072.jpg	image/jpeg	680044	2015-10-20 12:27:33.035119	active	2015-10-20 12:27:33.048965	2015-10-20 12:27:33.048965
1249	3	64	20	ANIMBG47	ROMANIA	13.00	<p>Big size Animals stamp of Romania</p>\r\n	IMG_20151017_161618_551.jpg	image/jpeg	609018	2015-10-20 12:28:41.502656	active	2015-10-20 12:28:41.515676	2015-10-20 12:28:41.515676
1250	3	64	20	ANIMBG48	KENYA	13.00	<p>Big size Animals stamp of Kenya</p>\r\n	IMG_20151017_161640_066.jpg	image/jpeg	515491	2015-10-20 12:29:43.877327	active	2015-10-20 12:29:43.89013	2015-10-20 12:29:43.89013
1251	3	64	20	ANIMBG49	PANAMA	13.00	<p>Big size Animals stamp of Panama</p>\r\n	IMG_20151017_161658_024.jpg	image/jpeg	782393	2015-10-20 12:30:55.96389	active	2015-10-20 12:30:55.978126	2015-10-20 12:30:55.978126
1252	3	64	20	ANIMBG50	CAMBODIA	13.00	<p>Big size Animals stamp of Cambodia</p>\r\n	IMG_20151017_161725_652.jpg	image/jpeg	620138	2015-10-20 12:32:14.011446	active	2015-10-20 12:32:14.025112	2015-10-20 12:32:14.025112
1253	3	64	20	ANIMBG51	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_161746_089.jpg	image/jpeg	821864	2015-10-20 12:33:25.832656	active	2015-10-20 12:33:25.846486	2015-10-20 12:33:25.846486
1254	3	64	20	ANIMBG52	EQUATORIAL GUINEA	13.00	<p>Big size Animals stamp of Equatorial Guinea</p>\r\n	IMG_20151017_161802_973.jpg	image/jpeg	645529	2015-10-20 12:34:47.701455	active	2015-10-20 12:34:47.71647	2015-10-20 12:34:47.71647
1255	3	64	20	ANIMBG53	NICARAGUA	13.00	<p>Big size Animals stamp of Nicaragua</p>\r\n	IMG_20151017_170204_939.jpg	image/jpeg	558336	2015-10-20 12:35:48.439745	active	2015-10-20 12:35:48.45317	2015-10-20 12:35:48.45317
1256	3	64	20	ANIMBG54	MONGOLIA	13.00	<p>Big size Animals stamp of Mongolia</p>\r\n	IMG_20151017_170225_998.jpg	image/jpeg	655993	2015-10-20 12:37:18.677366	active	2015-10-20 12:37:18.690933	2015-10-20 12:37:18.690933
1257	3	64	20	ANIMBG55	LAOS	13.00	<p>Big size Animals stamp of Laos</p>\r\n	IMG_20151017_170246_819.jpg	image/jpeg	666521	2015-10-20 12:38:13.396174	active	2015-10-20 12:38:13.409409	2015-10-20 12:38:13.409409
1258	3	64	20	ANIMBG56	CONGO	13.00	<p>Big size Animals stamp of Congo</p>\r\n	IMG_20151017_170302_112.jpg	image/jpeg	562900	2015-10-20 12:39:24.380012	active	2015-10-20 12:39:24.393108	2015-10-20 12:39:24.393108
1259	3	64	20	ANIMBG57	SOUTH KOREA	13.00	<p>Big size Animals stamp of South Korea</p>\r\n	IMG_20151017_170346_107.jpg	image/jpeg	709108	2015-10-20 12:40:22.094988	active	2015-10-20 12:40:22.108833	2015-10-20 12:40:22.108833
1260	3	64	20	ANIMBG58	SOUTH KOREA	13.00	<p>Big size Animals stamp of South Korea</p>\r\n	IMG_20151017_170458_825.jpg	image/jpeg	970659	2015-10-20 12:41:40.878773	active	2015-10-20 12:41:40.892962	2015-10-20 12:41:40.892962
1261	3	64	20	ANIMBG59	NICARAGUA	13.00	<p>Big size animal stamps of Nicaragua</p>\r\n	IMG_20151017_170531_110.jpg	image/jpeg	693136	2015-10-20 12:44:41.015279	active	2015-10-20 12:44:41.029213	2015-10-20 12:44:41.029213
1262	3	64	20	ANIMBG60	HUNGARY	13.00	<p>Big size animal stamps of Hungary</p>\r\n	IMG_20151017_170549_465.jpg	image/jpeg	743342	2015-10-20 12:45:44.988288	active	2015-10-20 12:45:45.00176	2015-10-20 12:45:45.00176
1263	3	64	20	ANIMBG61	ROMANIA	13.00	<p>Big size animal stamp of Romania</p>\r\n	IMG_20151017_170617_164.jpg	image/jpeg	829849	2015-10-20 12:48:02.245099	active	2015-10-20 12:48:02.259546	2015-10-20 12:48:02.259546
1264	3	64	20	ANIMBG62	CAMBODIA	13.00	<p>Big size animal stamp of Cambodia</p>\r\n	IMG_20151017_170631_182.jpg	image/jpeg	686985	2015-10-20 12:49:03.071366	active	2015-10-20 12:49:03.085105	2015-10-20 12:49:03.085105
1265	3	64	20	ANIMBG63	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_170648_460.jpg	image/jpeg	639885	2015-10-20 12:50:22.234055	active	2015-10-20 12:50:22.247412	2015-10-20 12:50:22.247412
1266	3	64	20	ANIMBG64	POLAND	13.00	<p>Big size animal stamp of Poland</p>\r\n	IMG_20151017_170721_677.jpg	image/jpeg	447064	2015-10-20 12:51:15.865769	active	2015-10-20 12:51:15.879083	2015-10-20 12:51:15.879083
1267	3	64	20	ANIMBG65	HUNGARY	13.00	<p>Big size animal stamp of Hungary</p>\r\n	IMG_20151017_170746_839.jpg	image/jpeg	534057	2015-10-20 12:52:18.271989	active	2015-10-20 12:52:18.285381	2015-10-20 12:52:18.285381
1268	3	64	20	ANIMBG66	LAOS	13.00	<p>Big size animal stamp of Laos</p>\r\n	IMG_20151017_170806_469.jpg	image/jpeg	924809	2015-10-20 12:53:26.626877	active	2015-10-20 12:53:26.641258	2015-10-20 12:53:26.641258
1269	3	64	20	ANIMBG67	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_170833_806.jpg	image/jpeg	615822	2015-10-20 12:54:49.057018	active	2015-10-20 12:54:49.07045	2015-10-20 12:54:49.07045
1270	3	64	20	ANIMBG68	POLAND	13.00	<p>Big size animal stamp of Poland</p>\r\n	IMG_20151017_170848_179.jpg	image/jpeg	562122	2015-10-20 12:56:00.002242	active	2015-10-20 12:56:00.016347	2015-10-20 12:56:00.016347
1271	3	64	20	ANIMBG69	CUBA	13.00	<p>Big size animal stamp of Cuba</p>\r\n	IMG_20151017_170917_563.jpg	image/jpeg	622329	2015-10-20 12:56:52.385062	active	2015-10-20 12:56:52.39841	2015-10-20 12:56:52.39841
1272	3	64	20	ANIMBG70	LAOS	13.00	<p>Big size animal stamp of Laos</p>\r\n	IMG_20151017_170937_106.jpg	image/jpeg	794027	2015-10-20 12:58:04.359663	active	2015-10-20 12:58:04.373784	2015-10-20 12:58:04.373784
1273	3	64	20	ANIMBG71	TANZANIA	13.00	<p>Big size animal stamp of Tanzania</p>\r\n	IMG_20151017_170953_300.jpg	image/jpeg	485249	2015-10-20 12:58:54.611272	active	2015-10-20 12:58:54.624483	2015-10-20 12:58:54.624483
1274	3	64	20	ANIMBG72	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_171008_609.jpg	image/jpeg	954356	2015-10-20 13:00:18.323459	active	2015-10-20 13:00:18.337518	2015-10-20 13:00:18.337518
1275	3	64	20	ANIMBG73	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_171025_725.jpg	image/jpeg	653106	2015-10-20 13:01:32.5133	active	2015-10-20 13:01:32.526849	2015-10-20 13:01:32.526849
1276	3	64	20	ANIMBG74	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_171042_557.jpg	image/jpeg	853843	2015-10-20 13:02:44.225478	active	2015-10-20 13:02:44.239094	2015-10-20 13:02:44.239094
1277	3	64	20	ANIMBG75	EQUATORIAL GUINEA	13.00	<p>Big size animal stamp of Equatorial Guinea</p>\r\n	IMG_20151017_171108_539.jpg	image/jpeg	478419	2015-10-20 13:04:07.389159	active	2015-10-20 13:04:07.404476	2015-10-20 13:04:07.404476
1278	3	64	20	ANIMBG76	CUBA	13.00	<p>Big size animal stamp of Cuba</p>\r\n	IMG_20151017_171127_290.jpg	image/jpeg	616696	2015-10-20 13:05:01.781152	active	2015-10-20 13:05:01.794795	2015-10-20 13:05:01.794795
1279	3	64	20	ANIMBG77	LAOS	13.00	<p>Big size animal stamp of Laos</p>\r\n	IMG_20151017_171209_764.jpg	image/jpeg	371463	2015-10-20 13:06:01.111477	active	2015-10-20 13:06:01.124187	2015-10-20 13:06:01.124187
1280	3	64	20	ANIMBG78	CUBA	13.00	<p>Big size animal stamp of Cuba</p>\r\n	IMG_20151017_171236_425.jpg	image/jpeg	315803	2015-10-20 13:06:49.218078	active	2015-10-20 13:06:49.230328	2015-10-20 13:06:49.230328
1281	3	64	20	ANIMBG79	TANZANIA	13.00	<p>Big size animal stamp of Tanzania</p>\r\n	IMG_20151017_171255_859.jpg	image/jpeg	581559	2015-10-20 13:07:43.833666	active	2015-10-20 13:07:43.847481	2015-10-20 13:07:43.847481
1282	3	64	20	ANIMBG80	CUBA	13.00	<p>Big size animal stamp of Cuba</p>\r\n	IMG_20151017_171310_538.jpg	image/jpeg	464863	2015-10-20 13:08:37.348473	active	2015-10-20 13:08:37.361508	2015-10-20 13:08:37.361508
1283	3	64	20	ANIMBG81	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_171327_003.jpg	image/jpeg	627584	2015-10-20 13:09:57.202845	active	2015-10-20 13:09:57.217324	2015-10-20 13:09:57.217324
1284	3	64	20	ANIMBG82	LAOS	13.00	<p>Big size animal stamp of Laos</p>\r\n	IMG_20151017_171433_852.jpg	image/jpeg	744141	2015-10-20 13:11:03.784406	active	2015-10-20 13:11:03.798514	2015-10-20 13:11:03.798514
1285	3	64	20	ANIMBG83	NICARAGUA	13.00	<p>Big size animal stamp of Nicaragua</p>\r\n	IMG_20151017_171446_689.jpg	image/jpeg	577473	2015-10-20 13:11:56.61044	active	2015-10-20 13:11:56.623875	2015-10-20 13:11:56.623875
1286	3	64	20	ANIMBG84	MONGOLIA	13.00	<p>Big size animal stamp of Mongolia</p>\r\n	IMG_20151017_171503_848.jpg	image/jpeg	545675	2015-10-20 13:13:07.445848	active	2015-10-20 13:13:07.459339	2015-10-20 13:13:07.459339
1287	3	64	20	ANIMBG85	KYRGYZSTAN	13.00	<p>Big size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151017_170601_895.jpg	image/jpeg	781887	2015-10-21 05:29:40.572056	active	2015-10-21 05:29:40.587171	2015-10-21 05:29:40.587171
1288	3	64	20	ANIMSM1	SRI LANKA	6.00	<p>Small size animal stamp of Sri Lanka</p>\r\n	IMG_20151017_174350_442.jpg	image/jpeg	479221	2015-10-21 05:32:45.939155	active	2015-10-21 05:32:45.953612	2015-10-21 05:32:45.953612
1289	3	64	20	ANIMSM2	DENMARK	6.00	<p>Small size animal stamp of Denmark</p>\r\n	IMG_20151017_174454_649.jpg	image/jpeg	402872	2015-10-21 05:34:29.358038	active	2015-10-21 05:34:29.371189	2015-10-21 05:34:29.371189
1290	3	64	20	ANIMSM3	CANADA	6.00	<p>Small size animal stamp of Canada</p>\r\n	IMG_20151017_174510_354.jpg	image/jpeg	453736	2015-10-21 05:35:10.522948	active	2015-10-21 05:35:10.536194	2015-10-21 05:35:10.536194
1291	3	64	20	ANIMSM4	SRI LANKA	6.00	<p>Small size animal stamp of Sri Lanka</p>\r\n	IMG_20151017_175258_089.jpg	image/jpeg	439283	2015-10-21 05:36:09.455626	active	2015-10-21 05:36:09.468911	2015-10-21 05:36:09.468911
1292	3	64	20	ANIMSM5	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_175312_972.jpg	image/jpeg	437724	2015-10-21 05:37:03.093043	active	2015-10-21 05:37:03.106443	2015-10-21 05:37:03.106443
1293	3	64	20	ANIMSM6	CANADA	6.00	<p>Small size animal stamp of Canada</p>\r\n	IMG_20151017_175328_921.jpg	image/jpeg	323933	2015-10-21 05:38:09.031533	active	2015-10-21 05:38:09.045206	2015-10-21 05:38:09.045206
1294	3	64	20	ANIMSM7	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_175353_214.jpg	image/jpeg	352323	2015-10-21 05:39:04.441044	active	2015-10-21 05:39:04.45437	2015-10-21 05:39:04.45437
1295	3	64	20	ANIMSM8	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_175411_211.jpg	image/jpeg	237138	2015-10-21 05:39:50.082165	active	2015-10-21 05:39:50.094824	2015-10-21 05:39:50.094824
1296	3	64	20	ANIMSM9	TANZANIA	6.00	<p>Small size animal stamp of Tanzania</p>\r\n	IMG_20151017_175425_134.jpg	image/jpeg	337676	2015-10-21 05:40:33.23079	active	2015-10-21 05:40:33.243323	2015-10-21 05:40:33.243323
1297	3	64	20	ANIMSM10	DENMARK	6.00	<p>Small size animal stamp of Denmark</p>\r\n	IMG_20151017_175450_452.jpg	image/jpeg	314917	2015-10-21 05:41:53.218085	active	2015-10-21 05:41:53.231267	2015-10-21 05:41:53.231267
1298	3	64	20	ANIMSM11	SRI LANKA	6.00	<p>Small size animal stamp of Sri Lanka</p>\r\n	IMG_20151017_175507_823.jpg	image/jpeg	379364	2015-10-21 05:42:50.34678	active	2015-10-21 05:42:50.359708	2015-10-21 05:42:50.359708
1299	3	64	20	ANIMSM12	NIPPON	6.00	<p>Small size animal stamp of Nippon</p>\r\n	IMG_20151017_175533_760.jpg	image/jpeg	237751	2015-10-21 05:43:51.922388	active	2015-10-21 05:43:51.934744	2015-10-21 05:43:51.934744
1300	3	64	20	ANIMSM13	DENMARK	6.00	<p>Small size animal stamp of Denmark</p>\r\n	IMG_20151017_175557_358.jpg	image/jpeg	375261	2015-10-21 05:45:54.747373	active	2015-10-21 05:45:54.760408	2015-10-21 05:45:54.760408
1301	3	64	20	ANIMSM14	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_175636_233.jpg	image/jpeg	359773	2015-10-21 05:46:47.57072	active	2015-10-21 05:46:47.583407	2015-10-21 05:46:47.583407
1302	3	64	20	ANIMSM15	New Zealand	6.00	<p>Small size animal stamp of New Zealand</p>\r\n	IMG_20151017_175726_394.jpg	image/jpeg	258552	2015-10-21 05:47:37.297893	active	2015-10-21 05:47:37.310273	2015-10-21 05:47:37.310273
1303	3	64	20	ANIMSM16	SRI LANKA	6.00	<p>Small size animal stamp of Sri Lanka</p>\r\n	IMG_20151017_175754_622.jpg	image/jpeg	369694	2015-10-21 05:48:45.793436	active	2015-10-21 05:48:45.80713	2015-10-21 05:48:45.80713
1304	3	64	20	ANIMSM17	DENMARK	6.00	<p>Small size animal stamp of Denmark</p>\r\n	IMG_20151017_175812_747.jpg	image/jpeg	518229	2015-10-21 05:50:09.826803	active	2015-10-21 05:50:09.840234	2015-10-21 05:50:09.840234
1305	3	64	20	ANIMSM18	DENMARK	6.00	<p>Small size animal stamp of Denmark</p>\r\n	IMG_20151017_175832_216.jpg	image/jpeg	376447	2015-10-21 05:51:06.78566	active	2015-10-21 05:51:06.799629	2015-10-21 05:51:06.799629
1306	3	64	20	ANIMSM19	GUYANA	6.00	<p>Small size animal stamp of Guyana</p>\r\n	IMG_20151017_180406.jpg	image/jpeg	2111645	2015-10-21 05:52:28.770584	active	2015-10-21 05:52:28.790194	2015-10-21 05:52:28.790194
1307	3	64	20	ANIMSM20	CANADA	6.00	<p>Small size animal stamp of CANADA</p>\r\n	IMG_20151017_181411_302.jpg	image/jpeg	514250	2015-10-21 05:53:43.760768	active	2015-10-21 05:53:43.775763	2015-10-21 05:53:43.775763
1308	3	64	20	ANIMSM21	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_181433_264.jpg	image/jpeg	528182	2015-10-21 05:54:31.751157	active	2015-10-21 05:54:31.76403	2015-10-21 05:54:31.76403
1309	3	64	20	ANIMSM22	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_181503_372.jpg	image/jpeg	490916	2015-10-21 05:55:33.791168	active	2015-10-21 05:55:33.804662	2015-10-21 05:55:33.804662
1310	3	64	20	ANIMSM23	KENYA	6.00	<p>Small size animal stamp of Kenya</p>\r\n	IMG_20151017_181533_878.jpg	image/jpeg	398199	2015-10-21 05:56:19.939269	active	2015-10-21 05:56:19.951955	2015-10-21 05:56:19.951955
1311	3	64	20	ANIMSM24	TANZANIA	6.00	<p>Small size animal stamp of Tanzania</p>\r\n	IMG_20151017_181556_329.jpg	image/jpeg	526569	2015-10-21 05:57:12.993168	active	2015-10-21 05:57:13.006443	2015-10-21 05:57:13.006443
1312	3	64	20	ANIMMD1	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_181757_415.jpg	image/jpeg	628973	2015-10-21 05:59:03.663997	active	2015-10-21 05:59:03.678503	2015-10-21 05:59:03.678503
1313	3	64	20	ANIMMD2	ROMANIA	9.00	<p>Medium&nbsp;size animal stamp of Romania</p>\r\n	IMG_20151017_181811_710.jpg	image/jpeg	601296	2015-10-21 05:59:58.105561	active	2015-10-21 05:59:58.119584	2015-10-21 05:59:58.119584
1314	3	64	20	ANIMMD3	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_181849_760.jpg	image/jpeg	715008	2015-10-21 06:00:49.032078	active	2015-10-21 06:00:49.045956	2015-10-21 06:00:49.045956
1315	3	64	20	ANIMMD4	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_181908_707.jpg	image/jpeg	683897	2015-10-21 06:01:37.739499	active	2015-10-21 06:01:37.753241	2015-10-21 06:01:37.753241
1316	3	64	20	ANIMMD5	VIETNAM	9.00	<p>Medium&nbsp;size animal stamp of Vietnam</p>\r\n	IMG_20151017_181938_312.jpg	image/jpeg	720320	2015-10-21 06:02:52.423533	active	2015-10-21 06:02:52.437517	2015-10-21 06:02:52.437517
1317	3	64	20	ANIMSM6	TADZIKISTAN	9.00	<p>Medium&nbsp;size animal stamp of Tadzikistan</p>\r\n	IMG_20151017_181958_379.jpg	image/jpeg	632811	2015-10-21 06:04:06.914051	active	2015-10-21 06:04:06.927851	2015-10-21 06:04:06.927851
1318	3	64	20	ANIMMD7	NIGERIA	9.00	<p>Medium&nbsp;size animal stamp of Nigeria</p>\r\n	IMG_20151017_182013_540.jpg	image/jpeg	566177	2015-10-21 06:05:10.019729	active	2015-10-21 06:05:10.033168	2015-10-21 06:05:10.033168
1319	3	64	20	ANIMMD8	USA	9.00	<p>Medium&nbsp;size animal stamp of USA</p>\r\n	IMG_20151017_182028_234.jpg	image/jpeg	573159	2015-10-21 06:06:10.482618	active	2015-10-21 06:06:10.495607	2015-10-21 06:06:10.495607
1320	3	64	20	ANIMMD9	GRENADA	9.00	<p>Medium&nbsp;size animal stamp of Grenada</p>\r\n	IMG_20151017_182119_082.jpg	image/jpeg	673123	2015-10-21 06:07:50.31481	active	2015-10-21 06:07:50.328528	2015-10-21 06:07:50.328528
1321	3	64	20	ANIMMD10	MOZAMBIQUE	9.00	<p>Medium&nbsp;size animal stamp of Mozambique</p>\r\n	IMG_20151017_182141_224.jpg	image/jpeg	550959	2015-10-21 06:08:47.747896	active	2015-10-21 06:08:47.761441	2015-10-21 06:08:47.761441
1322	3	64	20	ANIMMD11	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_182201_152.jpg	image/jpeg	956416	2015-10-21 06:09:55.999686	active	2015-10-21 06:09:56.014587	2015-10-21 06:09:56.014587
1323	3	64	20	ANIMMD12	CZECHOSLOVAKIA	9.00	<p>Medium&nbsp;size animal stamp of Czechoslovakia</p>\r\n	IMG_20151017_182218_625.jpg	image/jpeg	701637	2015-10-21 06:11:18.545609	active	2015-10-21 06:11:18.559589	2015-10-21 06:11:18.559589
1324	3	64	20	ANIMMD13	TADZIKISTAN	9.00	<p>Medium&nbsp;size animal stamp of Tadzikistan</p>\r\n	IMG_20151017_182242_494.jpg	image/jpeg	792814	2015-10-21 06:12:41.774292	active	2015-10-21 06:12:41.78938	2015-10-21 06:12:41.78938
1325	3	64	20	ANIMMD14	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_182257_049.jpg	image/jpeg	651201	2015-10-21 06:13:43.858652	active	2015-10-21 06:13:43.872481	2015-10-21 06:13:43.872481
1326	3	64	20	ANIMMD15	NEW ZEALAND	9.00	<p>Medium&nbsp;size animal stamp of New Zealand</p>\r\n	IMG_20151017_182311_523.jpg	image/jpeg	632723	2015-10-21 06:14:57.620274	active	2015-10-21 06:14:57.63405	2015-10-21 06:14:57.63405
1327	3	64	20	ANIMMD16	MALAYSIA	9.00	<p>Medium&nbsp;size animal stamp of Malaysia</p>\r\n	IMG_20151017_182325_390.jpg	image/jpeg	750781	2015-10-21 06:16:02.485899	active	2015-10-21 06:16:02.499968	2015-10-21 06:16:02.499968
1328	3	64	20	ANIMMD17	ROMANIA	9.00	<p>Medium&nbsp;size animal stamp of Romania</p>\r\n	IMG_20151017_182404_724.jpg	image/jpeg	718556	2015-10-21 06:17:45.389901	active	2015-10-21 06:17:45.404062	2015-10-21 06:17:45.404062
1329	3	64	20	ANIMMD18	KYRGYZSTAN	9.00	<p>Medium&nbsp;size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151017_182418_007.jpg	image/jpeg	694903	2015-10-21 06:19:06.529128	active	2015-10-21 06:19:06.542714	2015-10-21 06:19:06.542714
1330	3	64	20	ANIMMD19	LAOS	9.00	<p>Medium&nbsp;size animal stamp of Laos</p>\r\n	IMG_20151017_182435_940.jpg	image/jpeg	682055	2015-10-21 06:19:55.46742	active	2015-10-21 06:19:55.481453	2015-10-21 06:19:55.481453
1331	3	64	20	ANIMMD20	DOMINICA	9.00	<p>Medium&nbsp;size animal stamp of Dominica</p>\r\n	IMG_20151017_183431_397.jpg	image/jpeg	634664	2015-10-21 06:20:48.439064	active	2015-10-21 06:20:48.452561	2015-10-21 06:20:48.452561
1332	3	64	20	ANIMMD21	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_183447_642.jpg	image/jpeg	542046	2015-10-21 06:21:53.47342	active	2015-10-21 06:21:53.486876	2015-10-21 06:21:53.486876
1333	3	64	20	ANIMMD22	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_183541_563.jpg	image/jpeg	631862	2015-10-21 06:22:48.47822	active	2015-10-21 06:22:48.493151	2015-10-21 06:22:48.493151
1334	3	64	20	ANIMMD23	DAHOMEY	9.00	<p>Medium&nbsp;size animal stamp of Dahomey</p>\r\n	IMG_20151017_183620_678.jpg	image/jpeg	650161	2015-10-21 06:24:11.724058	active	2015-10-21 06:24:11.737656	2015-10-21 06:24:11.737656
1335	3	64	20	ANIMMD24	TANZANIA	9.00	<p>Medium&nbsp;size animal stamp of Tanzania</p>\r\n	IMG_20151017_183656_397.jpg	image/jpeg	520226	2015-10-21 06:25:10.794275	active	2015-10-21 06:25:10.807264	2015-10-21 06:25:10.807264
1336	3	64	20	ANIMMD25	SRI LANKA	9.00	<p>Medium&nbsp;size animal stamp of Sri Lanka</p>\r\n	IMG_20151017_183726_221.jpg	image/jpeg	633718	2015-10-21 06:26:18.839456	active	2015-10-21 06:26:18.852837	2015-10-21 06:26:18.852837
1337	3	64	20	ANIMMD26	UZBEKISTAN	9.00	<p>Medium&nbsp;size animal stamp of Uzbekistan</p>\r\n	IMG_20151017_183802_916.jpg	image/jpeg	1150878	2015-10-21 06:27:51.044126	active	2015-10-21 06:27:51.06104	2015-10-21 06:27:51.06104
1338	3	64	20	ANIMMD27	MAURITANIE	9.00	<p>Medium&nbsp;size animal stamp of Mauritanie</p>\r\n	IMG_20151017_183822_424.jpg	image/jpeg	666701	2015-10-21 06:30:38.343307	active	2015-10-21 06:30:38.356899	2015-10-21 06:30:38.356899
1339	3	64	20	ANIMMD28	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151017_183849_866.jpg	image/jpeg	516112	2015-10-21 06:33:01.867666	active	2015-10-21 06:33:01.881212	2015-10-21 06:33:01.881212
1340	3	64	20	ANIMMD29	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_183903_909.jpg	image/jpeg	573050	2015-10-21 06:34:13.231849	active	2015-10-21 06:34:13.244978	2015-10-21 06:34:13.244978
1341	3	64	20	ANIMMD30	UGANDA TANZANIA KENYA	9.00	<p>Medium size animal stamp of Uganda Tanzania Kenya</p>\r\n	IMG_20151017_183935_933.jpg	image/jpeg	628753	2015-10-21 06:35:48.281677	active	2015-10-21 06:35:48.29583	2015-10-21 06:35:48.29583
1342	3	64	20	ANIMMD31	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184133_278.jpg	image/jpeg	723529	2015-10-21 06:36:53.697993	active	2015-10-21 06:36:53.712522	2015-10-21 06:36:53.712522
1343	3	64	20	ANIMMD32	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151017_184159_361.jpg	image/jpeg	545144	2015-10-21 06:38:03.418022	active	2015-10-21 06:38:03.431682	2015-10-21 06:38:03.431682
1344	3	64	20	ANIMMD33	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151017_184220_782.jpg	image/jpeg	915469	2015-10-21 06:39:12.725934	active	2015-10-21 06:39:12.740479	2015-10-21 06:39:12.740479
1345	3	64	20	ANIMMD34	DAHOMEY	9.00	<p>Medium size animal stamp of Dahomey</p>\r\n	IMG_20151017_184234_075.jpg	image/jpeg	613351	2015-10-21 06:40:53.889439	active	2015-10-21 06:40:53.90475	2015-10-21 06:40:53.90475
1346	3	64	20	ANIMMD35	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151017_184247_441.jpg	image/jpeg	854289	2015-10-21 06:42:13.853149	active	2015-10-21 06:42:13.867128	2015-10-21 06:42:13.867128
1347	3	64	20	ANIMMD36	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184300_282.jpg	image/jpeg	666950	2015-10-21 06:43:42.791435	active	2015-10-21 06:43:42.805712	2015-10-21 06:43:42.805712
1348	3	64	20	ANIMMD37	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151017_184315_567.jpg	image/jpeg	988248	2015-10-21 06:45:18.168407	active	2015-10-21 06:45:18.18323	2015-10-21 06:45:18.18323
1349	3	64	20	ANIMMD38	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151017_184332_406.jpg	image/jpeg	680405	2015-10-21 06:46:51.792153	active	2015-10-21 06:46:51.806347	2015-10-21 06:46:51.806347
1350	3	64	20	ANIMMD39	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184347_616.jpg	image/jpeg	674770	2015-10-21 06:48:16.861789	active	2015-10-21 06:48:16.876997	2015-10-21 06:48:16.876997
1351	3	64	20	ANIMMD40	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151017_184407_261.jpg	image/jpeg	470297	2015-10-21 06:49:18.949904	active	2015-10-21 06:49:18.963097	2015-10-21 06:49:18.963097
1352	3	64	20	ANIMMD41	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151017_184426_179.jpg	image/jpeg	625718	2015-10-21 06:51:16.05926	active	2015-10-21 06:51:16.074227	2015-10-21 06:51:16.074227
1353	3	64	20	ANIMMD42	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184441_799.jpg	image/jpeg	775514	2015-10-21 06:52:17.364443	active	2015-10-21 06:52:17.378569	2015-10-21 06:52:17.378569
1354	3	64	20	ANIMMD43	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151017_184456_863.jpg	image/jpeg	675958	2015-10-21 06:53:13.524301	active	2015-10-21 06:53:13.538245	2015-10-21 06:53:13.538245
1355	3	64	20	ANIMMD44	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184510_432.jpg	image/jpeg	629011	2015-10-21 06:54:14.014514	active	2015-10-21 06:54:14.027904	2015-10-21 06:54:14.027904
1356	3	64	20	ANIMMD45	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184524_485.jpg	image/jpeg	768521	2015-10-21 06:55:09.629691	active	2015-10-21 06:55:09.645724	2015-10-21 06:55:09.645724
1357	3	64	20	ANIMMD46	DOMINICA	9.00	<p>Medium size animal stamp of Dominica</p>\r\n	IMG_20151017_184536_771.jpg	image/jpeg	638393	2015-10-21 06:56:07.103595	active	2015-10-21 06:56:07.117351	2015-10-21 06:56:07.117351
1358	3	64	20	ANIMMD47	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151017_184556_690.jpg	image/jpeg	761615	2015-10-21 06:57:21.073495	active	2015-10-21 06:57:21.087211	2015-10-21 06:57:21.087211
1359	3	64	20	ANIMMD48	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184611_406.jpg	image/jpeg	1008275	2015-10-21 06:58:33.156772	active	2015-10-21 06:58:33.171262	2015-10-21 06:58:33.171262
1360	3	64	20	ANIMMD49	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151017_184630_179.jpg	image/jpeg	717215	2015-10-21 06:59:53.539339	active	2015-10-21 06:59:53.553633	2015-10-21 06:59:53.553633
1361	3	64	20	ANIMMD50	SRI LANKA	9.00	<p>Medium size animal stamp of Sri Lanka</p>\r\n	IMG_20151018_104626_174.jpg	image/jpeg	618260	2015-10-21 07:00:57.464332	active	2015-10-21 07:00:57.477874	2015-10-21 07:00:57.477874
1362	3	64	20	ANIMMD51	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_104643_214.jpg	image/jpeg	733876	2015-10-21 07:01:52.32199	active	2015-10-21 07:01:52.335957	2015-10-21 07:01:52.335957
1363	3	64	20	ANIMMD52	MALI	9.00	<p>Medium size animal stamp of Mali</p>\r\n	IMG_20151018_112322_449.jpg	image/jpeg	477431	2015-10-21 07:03:06.173337	active	2015-10-21 07:03:06.186663	2015-10-21 07:03:06.186663
1364	3	64	20	ANIMMD53	GRENADA	9.00	<p>Medium size animal stamp of Grenada</p>\r\n	IMG_20151018_112335_861.jpg	image/jpeg	891499	2015-10-21 07:04:07.541949	active	2015-10-21 07:04:07.556163	2015-10-21 07:04:07.556163
1365	3	64	20	ANIMMD54	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112357_397.jpg	image/jpeg	912303	2015-10-21 07:05:11.014923	active	2015-10-21 07:05:11.030355	2015-10-21 07:05:11.030355
1366	3	64	20	ANIMMD55	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151018_112418_730.jpg	image/jpeg	753217	2015-10-21 07:06:14.07161	active	2015-10-21 07:06:14.085458	2015-10-21 07:06:14.085458
1367	3	64	20	ANIMMD56	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112437_002.jpg	image/jpeg	574510	2015-10-21 07:07:08.1579	active	2015-10-21 07:07:08.171497	2015-10-21 07:07:08.171497
1368	3	64	20	ANIMMD57	DAHOMEY	9.00	<p>Medium size animal stamp of Dahomey</p>\r\n	IMG_20151018_112452_684.jpg	image/jpeg	556542	2015-10-21 07:08:12.753899	active	2015-10-21 07:08:12.766853	2015-10-21 07:08:12.766853
1369	3	64	20	ANIMMD58	CANADA	9.00	<p>Medium size animal stamp of Canada</p>\r\n	IMG_20151018_112520_544.jpg	image/jpeg	569716	2015-10-21 07:10:48.867875	active	2015-10-21 07:10:48.881576	2015-10-21 07:10:48.881576
1370	3	64	20	ANIMMD59	NICARAGUA	9.00	<p>Medium size animal stamp of Nicaragua</p>\r\n	IMG_20151018_112553_141.jpg	image/jpeg	551665	2015-10-21 07:11:46.874675	active	2015-10-21 07:11:46.887843	2015-10-21 07:11:46.887843
1371	3	64	20	ANIMMD60	DENMARK	9.00	<p>Medium size animal stamp of Denmark</p>\r\n	IMG_20151018_112610_303.jpg	image/jpeg	591619	2015-10-21 07:12:37.941981	active	2015-10-21 07:12:37.95596	2015-10-21 07:12:37.95596
1372	3	64	20	ANIMMD61	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151018_112628_675.jpg	image/jpeg	741576	2015-10-21 07:13:36.831621	active	2015-10-21 07:13:36.845574	2015-10-21 07:13:36.845574
1373	3	64	20	ANIMMD62	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112648_226.jpg	image/jpeg	862176	2015-10-21 07:14:45.209398	active	2015-10-21 07:14:45.223775	2015-10-21 07:14:45.223775
1374	3	64	20	ANIMMD63	TADZIKISTAN	9.00	<p>Medium size animal stamp of Tadzikistan</p>\r\n	IMG_20151018_112713_411.jpg	image/jpeg	789919	2015-10-21 07:15:48.810067	active	2015-10-21 07:15:48.825581	2015-10-21 07:15:48.825581
1375	3	64	20	ANIMMD64	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151018_112743_703.jpg	image/jpeg	888167	2015-10-21 07:16:53.209735	active	2015-10-21 07:16:53.224482	2015-10-21 07:16:53.224482
1376	3	64	20	ANIMMD65	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151018_112804_940.jpg	image/jpeg	570554	2015-10-21 07:18:16.036199	active	2015-10-21 07:18:16.049295	2015-10-21 07:18:16.049295
1377	3	64	20	ANIMMD66	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112820_185.jpg	image/jpeg	667038	2015-10-21 07:19:12.940919	active	2015-10-21 07:19:12.954673	2015-10-21 07:19:12.954673
1378	3	64	20	ANIMMD67	BOTSWANA	9.00	<p>Medium size animal stamp of Botswana</p>\r\n	IMG_20151018_112908_548.jpg	image/jpeg	750335	2015-10-21 07:20:31.007106	active	2015-10-21 07:20:31.094618	2015-10-21 07:20:31.094618
1379	3	64	20	ANIMMD68	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112924_369.jpg	image/jpeg	744121	2015-10-21 07:21:26.98421	active	2015-10-21 07:21:26.997868	2015-10-21 07:21:26.997868
1380	3	64	20	ANIMMD69	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_112956_069.jpg	image/jpeg	696360	2015-10-21 07:22:22.414281	active	2015-10-21 07:22:22.428431	2015-10-21 07:22:22.428431
1381	3	64	20	ANIMMD70	AUSTRALIA	9.00	<p>Medium size animal stamp of Australia</p>\r\n	IMG_20151018_113011_203.jpg	image/jpeg	542866	2015-10-21 07:23:11.936106	active	2015-10-21 07:23:11.949602	2015-10-21 07:23:11.949602
1382	3	64	20	ANIMMD71	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_113033_358.jpg	image/jpeg	479128	2015-10-21 07:24:14.128588	active	2015-10-21 07:24:14.141435	2015-10-21 07:24:14.141435
1383	3	64	20	ANIMMD72	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_121423_360.jpg	image/jpeg	666339	2015-10-21 07:25:32.024725	active	2015-10-21 07:25:32.117554	2015-10-21 07:25:32.117554
1384	3	64	20	ANIMMD73	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151018_121448_201.jpg	image/jpeg	707579	2015-10-21 07:26:33.827367	active	2015-10-21 07:26:33.840707	2015-10-21 07:26:33.840707
1385	3	64	20	ANIMMD74	LAOS	9.00	<p>Medium size animal stamp of Laos</p>\r\n	IMG_20151018_121508_395.jpg	image/jpeg	612997	2015-10-21 07:27:41.544613	active	2015-10-21 07:27:41.558192	2015-10-21 07:27:41.558192
1386	3	64	20	ANIMMD75	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151018_121528_461.jpg	image/jpeg	405405	2015-10-21 07:28:38.310527	active	2015-10-21 07:28:38.323663	2015-10-21 07:28:38.323663
1387	3	64	20	ANIMMD76	MOZAMBIQUE	9.00	<p>Medium size animal stamp of Mozambique</p>\r\n	IMG_20151018_121545_782.jpg	image/jpeg	516555	2015-10-21 07:29:43.145685	active	2015-10-21 07:29:43.159407	2015-10-21 07:29:43.159407
1388	3	64	20	ANIMMD77	TANZANIA	9.00	<p>Medium size animal stamp of&nbsp;TANZANIA</p>\r\n	IMG_20151018_121605_808.jpg	image/jpeg	689269	2015-10-21 07:30:46.902692	active	2015-10-21 07:30:46.916494	2015-10-21 07:30:46.916494
1389	3	64	20	ANIMMD78	USA	9.00	<p>Medium size animal stamp of&nbsp;USA</p>\r\n	IMG_20151018_121622_786.jpg	image/jpeg	743305	2015-10-21 07:31:39.13408	active	2015-10-21 07:31:39.148221	2015-10-21 07:31:39.148221
1390	3	64	20	ANIMMD79	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151018_121642_824.jpg	image/jpeg	576809	2015-10-21 07:32:50.806112	active	2015-10-21 07:32:50.819483	2015-10-21 07:32:50.819483
1391	3	64	20	ANIMMD80	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_121700_038.jpg	image/jpeg	569335	2015-10-21 07:33:51.276689	active	2015-10-21 07:33:51.289845	2015-10-21 07:33:51.289845
1392	3	64	20	ANIMMD81	KINGS CHARLES SPANIEL	9.00	<p>Medium size animal stamp of King Charles Spaniel</p>\r\n	IMG_20151018_121737_426.jpg	image/jpeg	629438	2015-10-21 07:37:11.258667	active	2015-10-21 07:37:11.273372	2015-10-21 07:37:11.273372
1393	3	64	20	ANIMMD82	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151018_121755_689.jpg	image/jpeg	734976	2015-10-21 07:38:18.029903	active	2015-10-21 07:38:18.044004	2015-10-21 07:38:18.044004
1394	3	64	20	ANIMMD83	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_121811_069.jpg	image/jpeg	683053	2015-10-21 07:39:24.881567	active	2015-10-21 07:39:24.896367	2015-10-21 07:39:24.896367
1395	3	64	20	ANIMMD84	DAHOMEY	9.00	<p>Medium size animal stamp of Dahomey</p>\r\n	IMG_20151018_121832_722.jpg	image/jpeg	489973	2015-10-21 07:40:35.338977	active	2015-10-21 07:40:35.351995	2015-10-21 07:40:35.351995
1396	3	64	20	ANIMMD85	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_121850_098.jpg	image/jpeg	538853	2015-10-21 07:41:35.112067	active	2015-10-21 07:41:35.125659	2015-10-21 07:41:35.125659
1397	3	64	20	ANIMMD86	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_121912_671.jpg	image/jpeg	555860	2015-10-21 11:03:12.597696	active	2015-10-21 11:03:12.611614	2015-10-21 11:03:12.611614
1398	3	64	20	ANIMMD87	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151018_121929_018.jpg	image/jpeg	751087	2015-10-21 11:05:02.219941	active	2015-10-21 11:05:02.233646	2015-10-21 11:05:02.233646
1399	3	64	20	ANIMMD88	UNITED KINGDOM	9.00	<p>Medium size animal stamp of United Kingdom</p>\r\n	IMG_20151018_122024_282.jpg	image/jpeg	540129	2015-10-21 11:06:55.040208	active	2015-10-21 11:06:55.053342	2015-10-21 11:06:55.053342
1400	3	64	20	ANIMMD89	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151018_122039_610.jpg	image/jpeg	609242	2015-10-21 11:07:57.578771	active	2015-10-21 11:07:57.591968	2015-10-21 11:07:57.591968
1401	3	64	20	ANIMMD90	MOZAMBIQUE	9.00	<p>Medium size animal stamp of Mozambique</p>\r\n	IMG_20151018_122100_299.jpg	image/jpeg	710107	2015-10-21 11:08:50.21041	active	2015-10-21 11:08:50.224001	2015-10-21 11:08:50.224001
1402	3	64	20	ANIMMD91	LAOS	9.00	<p>Medium size animal stamp of Laos</p>\r\n	IMG_20151018_122114_980.jpg	image/jpeg	491433	2015-10-21 11:09:46.358517	active	2015-10-21 11:09:46.371843	2015-10-21 11:09:46.371843
1403	3	64	20	ANIMMD92	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122131_118.jpg	image/jpeg	987150	2015-10-21 11:10:43.265046	active	2015-10-21 11:10:43.28108	2015-10-21 11:10:43.28108
1404	3	64	20	ANIMMD93	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122147_886.jpg	image/jpeg	453384	2015-10-21 11:11:28.338054	active	2015-10-21 11:11:28.351057	2015-10-21 11:11:28.351057
1405	3	64	20	ANIMMD94	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122223_366.jpg	image/jpeg	515779	2015-10-21 11:13:19.879412	active	2015-10-21 11:13:19.892771	2015-10-21 11:13:19.892771
1406	3	64	20	ANIMMD95	HUNGARY	9.00	<p>Medium size animal stamp of Hungary</p>\r\n	IMG_20151018_122239_615.jpg	image/jpeg	604110	2015-10-21 11:14:12.242015	active	2015-10-21 11:14:12.255736	2015-10-21 11:14:12.255736
1407	3	64	20	ANIMMD96	CZECHOSLOVAKIA	9.00	<p>Medium size animal stamp of Czechoslovakia</p>\r\n	IMG_20151018_122259_109.jpg	image/jpeg	498953	2015-10-21 11:15:15.397588	active	2015-10-21 11:15:15.411137	2015-10-21 11:15:15.411137
1408	3	64	20	ANIMMD97	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122317_864.jpg	image/jpeg	574983	2015-10-21 11:16:18.297584	active	2015-10-21 11:16:18.310795	2015-10-21 11:16:18.310795
1409	3	64	20	ANIMMD98	TANZANIA	9.00	<p>Medium size animal stamp of&nbsp;Tanzania</p>\r\n	IMG_20151018_122334_869.jpg	image/jpeg	531662	2015-10-21 11:17:14.48402	active	2015-10-21 11:17:14.49703	2015-10-21 11:17:14.49703
1410	3	64	20	ANIMMD99	HUNGARY	9.00	<p>Medium size animal stamp of Hungary</p>\r\n	IMG_20151018_122353_025.jpg	image/jpeg	451928	2015-10-21 11:18:18.031272	active	2015-10-21 11:18:18.044606	2015-10-21 11:18:18.044606
1411	3	64	20	ANIMMD100	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122412_537.jpg	image/jpeg	847453	2015-10-21 11:19:21.11298	active	2015-10-21 11:19:21.127533	2015-10-21 11:19:21.127533
1412	3	64	20	ANIMMD101	NICARAGUA	9.00	<p>Medium size animal stamp of Nicaragua</p>\r\n	IMG_20151018_122426_942.jpg	image/jpeg	539996	2015-10-21 11:20:13.382813	active	2015-10-21 11:20:13.396258	2015-10-21 11:20:13.396258
1413	3	64	20	ANIMMD102	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122444_467.jpg	image/jpeg	658134	2015-10-21 11:20:58.139902	active	2015-10-21 11:20:58.153025	2015-10-21 11:20:58.153025
1414	3	64	20	ANIMMD103	ROMANIA	9.00	<p>Medium size animal stamp of Romania</p>\r\n	IMG_20151018_122502_593.jpg	image/jpeg	619412	2015-10-21 11:21:56.316559	active	2015-10-21 11:21:56.329639	2015-10-21 11:21:56.329639
1415	3	64	20	ANIMMD104	NEPAL	9.00	<p>Medium size animal stamp of Nepal</p>\r\n	IMG_20151018_122515_637.jpg	image/jpeg	619162	2015-10-21 11:23:02.720534	active	2015-10-21 11:23:02.734169	2015-10-21 11:23:02.734169
1416	3	64	20	ANIMMD105	GERMANY	9.00	<p>Medium size animal stamp of Germany</p>\r\n	IMG_20151018_122532_771.jpg	image/jpeg	434484	2015-10-21 11:24:20.021125	active	2015-10-21 11:24:20.034553	2015-10-21 11:24:20.034553
1417	3	64	20	ANIMMD106	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151018_122548_556.jpg	image/jpeg	629208	2015-10-21 11:25:43.845346	active	2015-10-21 11:25:43.85867	2015-10-21 11:25:43.85867
1418	3	64	20	ANIMMD107	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151018_122646_435.jpg	image/jpeg	498050	2015-10-21 11:26:38.674888	active	2015-10-21 11:26:38.688244	2015-10-21 11:26:38.688244
1419	3	64	20	ANIMMD108	LAOS	9.00	<p>Medium size animal stamp of Laos</p>\r\n	IMG_20151018_122704_486.jpg	image/jpeg	667601	2015-10-21 11:27:39.635781	active	2015-10-21 11:27:39.649851	2015-10-21 11:27:39.649851
1420	3	64	20	ANIMMD109	UZBEKISTAN	9.00	<p>Medium size animal stamp of Uzbekistan</p>\r\n	IMG_20151018_122722_235.jpg	image/jpeg	830623	2015-10-21 11:28:54.479928	active	2015-10-21 11:28:54.494199	2015-10-21 11:28:54.494199
1421	3	64	20	ANIMMD110	TANZANIA	9.00	<p>Medium size animal stamp of Tanzania</p>\r\n	IMG_20151018_122736_485.jpg	image/jpeg	630579	2015-10-21 11:30:14.95107	active	2015-10-21 11:30:14.964589	2015-10-21 11:30:14.964589
1422	3	64	20	ANIMMD111	SOUTH WEST AFRICA	9.00	<p>Medium size animal stamp of South West Africa</p>\r\n	IMG_20151017_182058_556.jpg	image/jpeg	526334	2015-10-21 11:32:28.673988	active	2015-10-21 11:32:28.687397	2015-10-21 11:32:28.687397
1423	3	64	20	ANIMMD112	KYRGYZSTAN	9.00	<p>Medium size animal stamp of Kyrgyzstan</p>\r\n	IMG_20151017_183836_180.jpg	image/jpeg	744232	2015-10-21 11:33:38.116475	active	2015-10-21 11:33:38.130142	2015-10-21 11:33:38.130142
1424	3	64	20	ANIMMD113	UNITED KINGDOM	9.00	<p>Medium size animal stamp of United Kingdom</p>\r\n	IMG_20151018_121719_209.jpg	image/jpeg	557581	2015-10-21 11:34:29.16655	active	2015-10-21 11:34:29.180316	2015-10-21 11:34:29.180316
1425	3	64	20	ANIMMD114	UNITED KINGDOM	9.00	<p>Medium size animal stamp of United Kingdom</p>\r\n	IMG_20151018_122208_447.jpg	image/jpeg	528913	2015-10-21 11:35:24.636252	active	2015-10-21 11:35:24.650116	2015-10-21 11:35:24.650116
1426	3	64	20	ANIMMD115	TCHAD	9.00	<p>Medium size animal stamp of Tchad</p>\r\n	IMG_20151017_182348_478.jpg	image/jpeg	534590	2015-10-21 11:36:20.519371	active	2015-10-21 11:36:20.53285	2015-10-21 11:36:20.53285
1427	3	64	21	BIRDBG1	VIETNAM	13.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_101608_173.jpg	image/jpeg	773496	2015-10-21 11:42:07.726147	active	2015-10-21 11:42:07.740059	2015-10-21 11:42:07.740059
1428	3	64	21	BIRDBG2	VIETNAM	13.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_101623_694.jpg	image/jpeg	650540	2015-10-21 11:43:43.788061	active	2015-10-21 11:43:43.801796	2015-10-21 11:43:43.801796
1429	3	64	21	BIRDBG3	LESOTHO	13.00	<p>Big size bird stamp of Lesotho</p>\r\n	IMG_20151019_101637_585.jpg	image/jpeg	902491	2015-10-21 11:45:01.284525	active	2015-10-21 11:45:01.298952	2015-10-21 11:45:01.298952
1430	3	64	21	BIRDBG4	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_101652_616.jpg	image/jpeg	900681	2015-10-21 11:45:59.673472	active	2015-10-21 11:45:59.688543	2015-10-21 11:45:59.688543
1431	3	64	21	BIRDBG5	LESOTHO	13.00	<p>Big size bird stamp of Lesotho</p>\r\n	IMG_20151019_101720_780.jpg	image/jpeg	505819	2015-10-21 11:47:09.912939	active	2015-10-21 11:47:09.926448	2015-10-21 11:47:09.926448
1432	3	64	21	BIRDBG6	LESOTHO	13.00	<p>Big size bird stamp of Lesotho</p>\r\n	IMG_20151019_101735_487.jpg	image/jpeg	650755	2015-10-21 11:48:03.152099	active	2015-10-21 11:48:03.165471	2015-10-21 11:48:03.165471
1433	3	64	21	BIRDBG7	CAMBODIA	13.00	<p>Big size bird stamp of Cambodia</p>\r\n	IMG_20151019_101748_932.jpg	image/jpeg	1363797	2015-10-21 11:49:22.253275	active	2015-10-21 11:49:22.349864	2015-10-21 11:49:22.349864
1434	3	64	21	BIRDBG8	VIETNAM	9.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_101802_370.jpg	image/jpeg	883121	2015-10-21 11:50:32.866337	active	2015-10-21 11:50:32.880124	2015-10-21 11:50:32.880124
1435	3	64	21	BIRDBG9	CZECHOSLOVAKIA	13.00	<p>Big size bird stamp of Czechoslovakia</p>\r\n	IMG_20151019_101818_819.jpg	image/jpeg	868253	2015-10-21 11:52:15.547396	active	2015-10-21 11:52:15.561541	2015-10-21 11:52:15.561541
1436	3	64	21	BIRDBG10	POLAND	13.00	<p>Big size bird stamp of Poland</p>\r\n	IMG_20151019_101833_829.jpg	image/jpeg	889873	2015-10-21 11:53:19.618066	active	2015-10-21 11:53:19.63268	2015-10-21 11:53:19.63268
1437	3	64	21	BIRDBG11	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_101848_109.jpg	image/jpeg	649576	2015-10-21 11:54:16.256363	active	2015-10-21 11:54:16.269951	2015-10-21 11:54:16.269951
1438	3	64	21	BIRDBG12	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_101928_417.jpg	image/jpeg	594550	2015-10-21 11:55:10.389979	active	2015-10-21 11:55:10.403734	2015-10-21 11:55:10.403734
1439	3	64	21	BIRDBG13	VIETNAM	13.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_101942_825.jpg	image/jpeg	783973	2015-10-21 11:56:10.940039	active	2015-10-21 11:56:10.954172	2015-10-21 11:56:10.954172
1440	3	64	21	BIRDBG14	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_102017_557.jpg	image/jpeg	824565	2015-10-21 11:57:17.458038	active	2015-10-21 11:57:17.472153	2015-10-21 11:57:17.472153
1441	3	64	21	BIRDBG15	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_102155_278.jpg	image/jpeg	774776	2015-10-21 11:58:20.810491	active	2015-10-21 11:58:20.824452	2015-10-21 11:58:20.824452
1442	3	64	21	BIRDBG16	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_102645_927.jpg	image/jpeg	753393	2015-10-21 11:59:34.075217	active	2015-10-21 11:59:34.089203	2015-10-21 11:59:34.089203
1443	3	64	21	BIRDBG17	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_102717_287.jpg	image/jpeg	609498	2015-10-21 12:01:01.392889	active	2015-10-21 12:01:01.406401	2015-10-21 12:01:01.406401
1444	3	64	21	BIRDBG18	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_102741_621.jpg	image/jpeg	811921	2015-10-21 12:02:34.386668	active	2015-10-21 12:02:34.400786	2015-10-21 12:02:34.400786
1445	3	64	21	BIRDBG19	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_102835_947.jpg	image/jpeg	632248	2015-10-21 12:03:32.789725	active	2015-10-21 12:03:32.803315	2015-10-21 12:03:32.803315
1446	3	64	21	BIRDBG20	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_102919_169.jpg	image/jpeg	674959	2015-10-21 12:04:21.945473	active	2015-10-21 12:04:21.959371	2015-10-21 12:04:21.959371
1447	3	64	21	BIRDBG21	MONGOLIA	13.00	<p>Big size bird stamp of Mongolia</p>\r\n	IMG_20151019_102931_934.jpg	image/jpeg	492932	2015-10-21 12:05:44.739863	active	2015-10-21 12:05:44.753267	2015-10-21 12:05:44.753267
1448	3	64	21	BIRDBG22	VIETNAM	13.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_103450_224.jpg	image/jpeg	536786	2015-10-21 12:07:08.894252	active	2015-10-21 12:07:08.908649	2015-10-21 12:07:08.908649
1449	3	64	21	BIRDBG23	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_103526_130.jpg	image/jpeg	1018256	2015-10-21 12:08:31.830443	active	2015-10-21 12:08:31.845938	2015-10-21 12:08:31.845938
1450	3	64	21	BIRDBG24	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_103549_216.jpg	image/jpeg	649189	2015-10-21 12:09:34.222448	active	2015-10-21 12:09:34.235985	2015-10-21 12:09:34.235985
1451	3	64	21	BIRDBG25	MONGOLIA	13.00	<p>Big size bird stamp of Mongolia</p>\r\n	IMG_20151019_103605_764.jpg	image/jpeg	799075	2015-10-21 12:10:50.994539	active	2015-10-21 12:10:51.008599	2015-10-21 12:10:51.008599
1452	3	64	21	BIRDBG26	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_103658_138.jpg	image/jpeg	744409	2015-10-21 12:12:54.14906	active	2015-10-21 12:12:54.163532	2015-10-21 12:12:54.163532
1453	3	64	21	BIRDBG27	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_103808_176.jpg	image/jpeg	789989	2015-10-21 12:13:59.261095	active	2015-10-21 12:13:59.275545	2015-10-21 12:13:59.275545
1454	3	64	21	BIRDBG28	LESOTHO	13.00	<p>Big size bird stamp of Lesotho</p>\r\n	IMG_20151019_103955_196.jpg	image/jpeg	796696	2015-10-21 12:15:14.642561	active	2015-10-21 12:15:14.657318	2015-10-21 12:15:14.657318
1455	3	64	21	BIRDBG29	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_104010_987.jpg	image/jpeg	1116255	2015-10-21 12:16:18.48743	active	2015-10-21 12:16:18.502718	2015-10-21 12:16:18.502718
1456	3	64	21	BIRDBG30	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_104058_310.jpg	image/jpeg	936455	2015-10-21 12:17:50.708425	active	2015-10-21 12:17:50.722957	2015-10-21 12:17:50.722957
1457	3	64	21	BIRDBG31	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_104112_604.jpg	image/jpeg	574153	2015-10-21 12:19:24.703752	active	2015-10-21 12:19:24.717874	2015-10-21 12:19:24.717874
1458	3	64	21	BIRDBG32	CUBA	13.00	<p>Big size bird stamp of Cuba</p>\r\n	IMG_20151019_104128_873.jpg	image/jpeg	530716	2015-10-21 12:20:19.205198	active	2015-10-21 12:20:19.218591	2015-10-21 12:20:19.218591
1459	3	64	21	BIRDBG33	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_123754_859.jpg	image/jpeg	501307	2015-10-21 12:21:30.636614	active	2015-10-21 12:21:30.64974	2015-10-21 12:21:30.64974
1460	3	64	21	BIRDBG34	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_123810_428.jpg	image/jpeg	539685	2015-10-21 12:22:35.4138	active	2015-10-21 12:22:35.427337	2015-10-21 12:22:35.427337
1461	3	64	21	BIRDBG35	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_123900_173.jpg	image/jpeg	584931	2015-10-21 12:23:33.317359	active	2015-10-21 12:23:33.33105	2015-10-21 12:23:33.33105
1462	3	64	21	BIRDBG36	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_174004_736.jpg	image/jpeg	471730	2015-10-21 12:24:25.581389	active	2015-10-21 12:24:25.594635	2015-10-21 12:24:25.594635
1463	3	64	21	BIRDBG37	NICARAGUA	13.00	<p>Big size bird stamp of Nicaragua</p>\r\n	IMG_20151019_174020_073.jpg	image/jpeg	625613	2015-10-21 12:25:24.500175	active	2015-10-21 12:25:24.514123	2015-10-21 12:25:24.514123
1464	3	64	21	BIRDBG38	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_174038_689.jpg	image/jpeg	702533	2015-10-21 12:26:23.566055	active	2015-10-21 12:26:23.58022	2015-10-21 12:26:23.58022
1465	3	64	21	BIRDBG39	VIETNAM	13.00	<p>Big size bird stamp of Vietnam</p>\r\n	IMG_20151019_174054_299.jpg	image/jpeg	557296	2015-10-21 12:27:24.765377	active	2015-10-21 12:27:24.778889	2015-10-21 12:27:24.778889
1466	3	64	21	BIRDBG40	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_174210_657.jpg	image/jpeg	544861	2015-10-21 12:28:28.89187	active	2015-10-21 12:28:28.905474	2015-10-21 12:28:28.905474
1467	3	64	21	BIRDBG41	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_174241_658.jpg	image/jpeg	704699	2015-10-21 12:29:28.93807	active	2015-10-21 12:29:28.952477	2015-10-21 12:29:28.952477
1468	3	64	21	BIRDBG42	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_174259_747.jpg	image/jpeg	641476	2015-10-21 12:30:29.201073	active	2015-10-21 12:30:29.215611	2015-10-21 12:30:29.215611
1469	3	64	21	BIRDBG43	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_174315_602.jpg	image/jpeg	572192	2015-10-21 12:31:26.677053	active	2015-10-21 12:31:26.690088	2015-10-21 12:31:26.690088
1470	3	64	21	BIRDBG44	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_174333_687.jpg	image/jpeg	795123	2015-10-21 12:32:24.509181	active	2015-10-21 12:32:24.523522	2015-10-21 12:32:24.523522
1471	3	64	21	BIRDBG45	HUNGARY	13.00	<p>Big size bird stamp of Hungary</p>\r\n	IMG_20151019_174406_773.jpg	image/jpeg	712295	2015-10-21 12:34:23.720891	active	2015-10-21 12:34:23.735476	2015-10-21 12:34:23.735476
1472	3	64	21	BIRDBG46	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_174424_981.jpg	image/jpeg	536387	2015-10-21 12:35:24.792709	active	2015-10-21 12:35:24.806595	2015-10-21 12:35:24.806595
1473	3	64	21	BIRDBG47	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_174443_189.jpg	image/jpeg	684526	2015-10-21 12:36:23.738501	active	2015-10-21 12:36:23.752921	2015-10-21 12:36:23.752921
1474	3	64	21	BIRDBG48	CUBA	13.00	<p>Big size bird stamp of Cuba</p>\r\n	IMG_20151019_174458_951.jpg	image/jpeg	494203	2015-10-21 12:37:15.254553	active	2015-10-21 12:37:15.267609	2015-10-21 12:37:15.267609
1475	3	64	21	BIRDBG49	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_174517_827.jpg	image/jpeg	797876	2015-10-21 12:38:16.522593	active	2015-10-21 12:38:16.536905	2015-10-21 12:38:16.536905
1476	3	64	21	BIRDBG50	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_174533_631.jpg	image/jpeg	539622	2015-10-21 12:39:39.380534	active	2015-10-21 12:39:39.394016	2015-10-21 12:39:39.394016
1477	3	64	21	BIRDBG51	LAOS	13.00	<p>Big size bird stamp of Laos</p>\r\n	IMG_20151019_174548_076.jpg	image/jpeg	776325	2015-10-21 12:40:33.229706	active	2015-10-21 12:40:33.244001	2015-10-21 12:40:33.244001
1478	3	64	21	BIRDBG52	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_174603_074.jpg	image/jpeg	725901	2015-10-21 12:41:29.344485	active	2015-10-21 12:41:29.358327	2015-10-21 12:41:29.358327
1479	3	64	21	BIRDBG53	CUBA	13.00	<p>Big size bird stamp of Cuba</p>\r\n	IMG_20151019_174624_937.jpg	image/jpeg	827001	2015-10-21 12:42:32.797233	active	2015-10-21 12:42:32.810796	2015-10-21 12:42:32.810796
1480	3	64	21	BIRDBG54	MADAGASCAR	13.00	<p>Big size bird stamp of Madagascar</p>\r\n	IMG_20151019_174638_969.jpg	image/jpeg	701620	2015-10-21 12:43:45.648372	active	2015-10-21 12:43:45.662254	2015-10-21 12:43:45.662254
1481	3	64	21	BIRDBG55	NICARAGUA	13.00	<p>Big size bird stamp of Nicaragua</p>\r\n	IMG_20151019_174705_052.jpg	image/jpeg	511956	2015-10-21 12:44:50.872939	active	2015-10-21 12:44:50.886038	2015-10-21 12:44:50.886038
1482	3	64	21	BIRDBG56	MONGOLIA	13.00	<p>Big size bird stamp of Mongolia</p>\r\n	IMG_20151019_174722_323.jpg	image/jpeg	914953	2015-10-21 12:45:52.944154	active	2015-10-21 12:45:52.958243	2015-10-21 12:45:52.958243
1483	3	64	21	BIRDBG57	CUBA	13.00	<p>Big size bird stamp of Cuba</p>\r\n	IMG_20151019_174941_035.jpg	image/jpeg	890530	2015-10-21 12:46:54.930207	active	2015-10-21 12:46:54.944596	2015-10-21 12:46:54.944596
1484	3	64	21	BIRDBG58	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_175019_005.jpg	image/jpeg	935638	2015-10-21 12:48:07.01979	active	2015-10-21 12:48:07.034039	2015-10-21 12:48:07.034039
1485	3	64	21	BIRDBG59	LESOTHO	13.00	<p>Big size bird stamp of Lesotho</p>\r\n	IMG_20151019_175123_969.jpg	image/jpeg	661257	2015-10-21 12:49:05.643112	active	2015-10-21 12:49:05.657143	2015-10-21 12:49:05.657143
1486	3	64	21	BIRDBG60	GUYANA	13.00	<p>Big size bird stamp of Guyana</p>\r\n	IMG_20151019_175203_393.jpg	image/jpeg	683411	2015-10-21 12:50:06.146297	active	2015-10-21 12:50:06.160415	2015-10-21 12:50:06.160415
1487	3	64	21	BIRDBG61	MALUKU SELATAN	13.00	<p>Big size bird stamp of Maluku Selatan</p>\r\n	IMG_20151019_175225_071.jpg	image/jpeg	865176	2015-10-21 12:51:47.798959	active	2015-10-21 12:51:47.813326	2015-10-21 12:51:47.813326
1488	3	64	21	BIRDBG62	MALUKU SELATAN	13.00	<p>Big size bird stamp of Maluku Selatan</p>\r\n	IMG_20151019_175243_907.jpg	image/jpeg	676099	2015-10-21 12:54:14.702913	active	2015-10-21 12:54:14.717257	2015-10-21 12:54:14.717257
1489	3	64	21	BIRDBG63	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_175324_364.jpg	image/jpeg	798684	2015-10-21 12:55:12.351874	active	2015-10-21 12:55:12.366314	2015-10-21 12:55:12.366314
1490	3	64	21	BIRDBG64	HAITI	13.00	<p>Big size bird stamp of Haiti</p>\r\n	IMG_20151019_175344_190.jpg	image/jpeg	853606	2015-10-21 12:56:23.60512	active	2015-10-21 12:56:23.619621	2015-10-21 12:56:23.619621
1491	3	64	21	BIRDMD1	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_084037_581.jpg	image/jpeg	781030	2015-10-22 05:20:03.108882	active	2015-10-22 05:20:03.123697	2015-10-22 05:20:03.123697
1492	3	64	21	BIRDMD2	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_084100_390.jpg	image/jpeg	814119	2015-10-22 05:21:10.855609	active	2015-10-22 05:21:10.871213	2015-10-22 05:21:10.871213
1493	3	64	21	BIRDMD3	MADAGASCAR	9.00	<p>Medium size bird stamp of Madagascar</p>\r\n	IMG_20151020_084115_729.jpg	image/jpeg	941834	2015-10-22 05:22:07.855396	active	2015-10-22 05:22:07.897272	2015-10-22 05:22:07.897272
1494	3	64	21	BIRDMD4	GRENADA	9.00	<p>Medium size bird stamp of Grenada</p>\r\n	IMG_20151020_084138_010.jpg	image/jpeg	575755	2015-10-22 05:23:14.68839	active	2015-10-22 05:23:14.702151	2015-10-22 05:23:14.702151
1495	3	64	21	BIRDMD5	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_084150_195.jpg	image/jpeg	1106747	2015-10-22 05:24:30.832982	active	2015-10-22 05:24:30.848063	2015-10-22 05:24:30.848063
1496	3	64	21	BIRDMD6	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_084217_193.jpg	image/jpeg	899125	2015-10-22 05:25:20.700323	active	2015-10-22 05:25:20.715846	2015-10-22 05:25:20.715846
1497	3	64	21	BIRDMD7	UNITED KINGDOM	9.00	<p>Medium size bird stamp of United Kingdom</p>\r\n	IMG_20151020_084240_597.jpg	image/jpeg	748732	2015-10-22 05:26:25.153508	active	2015-10-22 05:26:25.167737	2015-10-22 05:26:25.167737
1498	3	64	21	BIRDMD8	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_084300_663.jpg	image/jpeg	1016386	2015-10-22 05:27:51.919605	active	2015-10-22 05:27:51.934228	2015-10-22 05:27:51.934228
1499	3	64	21	BIRDMD9	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_084318_504.jpg	image/jpeg	918075	2015-10-22 05:28:45.892019	active	2015-10-22 05:28:45.906999	2015-10-22 05:28:45.906999
1500	3	64	21	BIRDMD10	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_084337_986.jpg	image/jpeg	980983	2015-10-22 05:30:16.509834	active	2015-10-22 05:30:16.525163	2015-10-22 05:30:16.525163
1501	3	64	21	BIRDMD11	MADAGASCAR	9.00	<p>Medium size bird stamp of Madagascar</p>\r\n	IMG_20151020_084357_762.jpg	image/jpeg	887695	2015-10-22 05:31:12.164497	active	2015-10-22 05:31:12.179194	2015-10-22 05:31:12.179194
1502	3	64	21	BIRDMD12	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_084426_142.jpg	image/jpeg	515724	2015-10-22 05:32:10.667479	active	2015-10-22 05:32:10.689671	2015-10-22 05:32:10.689671
1503	3	64	21	BIRDMD13	GHANA	9.00	<p>Medium size bird stamp of Ghana</p>\r\n	IMG_20151020_084533_507.jpg	image/jpeg	790673	2015-10-22 05:33:24.788649	active	2015-10-22 05:33:24.802939	2015-10-22 05:33:24.802939
1504	3	64	21	BIRDMD14	CANADA	9.00	<p>Medium size bird stamp of Canada</p>\r\n	IMG_20151020_084551_502.jpg	image/jpeg	733219	2015-10-22 05:34:21.690953	active	2015-10-22 05:34:21.705066	2015-10-22 05:34:21.705066
1505	3	64	21	BIRDMD15	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_084616_981.jpg	image/jpeg	551103	2015-10-22 05:35:19.532068	active	2015-10-22 05:35:19.545916	2015-10-22 05:35:19.545916
1506	3	64	21	BIRDMD16	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_084653_585.jpg	image/jpeg	1361991	2015-10-22 05:36:27.080338	active	2015-10-22 05:36:27.095696	2015-10-22 05:36:27.095696
1507	3	64	21	BIRDMD17	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_084708_867.jpg	image/jpeg	872506	2015-10-22 05:37:26.933625	active	2015-10-22 05:37:26.947182	2015-10-22 05:37:26.947182
1508	3	64	21	BIRDMD18	UNITED KINGDOM	9.00	<p>Medium size bird stamp of United Kingdom</p>\r\n	IMG_20151020_084723_677.jpg	image/jpeg	780207	2015-10-22 05:38:37.88662	active	2015-10-22 05:38:37.900342	2015-10-22 05:38:37.900342
1509	3	64	21	BIRDMD19	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_084741_457.jpg	image/jpeg	930369	2015-10-22 05:39:39.431398	active	2015-10-22 05:39:39.445488	2015-10-22 05:39:39.445488
1510	3	64	21	BIRDMD20	KYRGYZSTAN	9.00	<p>Medium size bird stamp of Kyrgyzstan</p>\r\n	IMG_20151020_084754_678.jpg	image/jpeg	755299	2015-10-22 05:40:43.201092	active	2015-10-22 05:40:43.214999	2015-10-22 05:40:43.214999
1511	3	64	21	BIRDMD21	VIETNAM	9.00	<p>Medium size bird stamp of Vietnam</p>\r\n	IMG_20151020_084814_856.jpg	image/jpeg	816695	2015-10-22 05:41:42.864214	active	2015-10-22 05:41:42.877996	2015-10-22 05:41:42.877996
1512	3	64	21	BIRDMD22	GERMANY	9.00	<p>Medium size bird stamp of Germany</p>\r\n	IMG_20151020_084835_978.jpg	image/jpeg	765275	2015-10-22 05:42:49.880206	active	2015-10-22 05:42:49.894016	2015-10-22 05:42:49.894016
1513	3	64	21	BIRDMD23	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_084913_198.jpg	image/jpeg	671961	2015-10-22 05:43:42.858098	active	2015-10-22 05:43:42.872292	2015-10-22 05:43:42.872292
1514	3	64	21	BIRDMD24	SAHARA	9.00	<p>Medium size bird stamp of Sahara</p>\r\n	IMG_20151020_085217_881.jpg	image/jpeg	762208	2015-10-22 05:45:05.313463	active	2015-10-22 05:45:05.3272	2015-10-22 05:45:05.3272
1515	3	64	21	BIRDMD25	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_085232_791.jpg	image/jpeg	924993	2015-10-22 05:46:48.556918	active	2015-10-22 05:46:48.571036	2015-10-22 05:46:48.571036
1516	3	64	21	BIRDMD26	MALDIVES	9.00	<p>Medium size bird stamp of Maldives</p>\r\n	IMG_20151020_085249_615.jpg	image/jpeg	783902	2015-10-22 05:47:55.435051	active	2015-10-22 05:47:55.448894	2015-10-22 05:47:55.448894
1517	3	64	21	BIRDMD27	KYRGYZSTAN	9.00	<p>Medium size bird stamp of Kyrgyzstan</p>\r\n	IMG_20151020_085306_105.jpg	image/jpeg	1042261	2015-10-22 05:49:24.033924	active	2015-10-22 05:49:24.04876	2015-10-22 05:49:24.04876
1518	3	64	21	BIRDMD28	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_085324_364.jpg	image/jpeg	522359	2015-10-22 05:51:32.79397	active	2015-10-22 05:51:32.807076	2015-10-22 05:51:32.807076
1519	3	64	21	BIRDMD29	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_085340_133.jpg	image/jpeg	1231131	2015-10-22 05:52:35.991157	active	2015-10-22 05:52:36.006334	2015-10-22 05:52:36.006334
1520	3	64	21	BIRDMD30	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_085356_541.jpg	image/jpeg	1131334	2015-10-22 05:54:03.865012	active	2015-10-22 05:54:03.879886	2015-10-22 05:54:03.879886
1521	3	64	21	BIRDMD31	CZECHOSLOVAKIA	9.00	<p>Medium size bird stamp of Czechoslovakia</p>\r\n	IMG_20151020_085410_874.jpg	image/jpeg	725398	2015-10-22 05:55:47.44329	active	2015-10-22 05:55:47.457155	2015-10-22 05:55:47.457155
1522	3	64	21	BIRDMD32	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_085458_977.jpg	image/jpeg	610110	2015-10-22 05:56:48.569059	active	2015-10-22 05:56:48.58272	2015-10-22 05:56:48.58272
1523	3	64	21	BIRDMD34	LESOTHO	9.00	<p>Medium size bird stamp of Lesotho</p>\r\n	IMG_20151020_085536_019.jpg	image/jpeg	651791	2015-10-22 05:58:04.483626	active	2015-10-22 05:58:04.497014	2015-10-22 05:58:04.497014
1524	3	64	21	BIRDMD35	HUNGARY	9.00	<p>Medium size bird stamp of Hungary</p>\r\n	IMG_20151020_085552_297.jpg	image/jpeg	741274	2015-10-22 05:59:35.507889	active	2015-10-22 05:59:35.522211	2015-10-22 05:59:35.522211
1525	3	64	21	BIRDMD36	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_090042_862.jpg	image/jpeg	557446	2015-10-22 06:00:59.989996	active	2015-10-22 06:01:00.003253	2015-10-22 06:01:00.003253
1526	3	64	21	BIRDMD37	MADAGASCAR	9.00	<p>Medium size bird stamp of Madagascar</p>\r\n	IMG_20151020_090058_334.jpg	image/jpeg	679773	2015-10-22 06:02:18.286483	active	2015-10-22 06:02:18.300845	2015-10-22 06:02:18.300845
1527	3	64	21	BIRDMD38	MALDIVES	9.00	<p>Medium size bird stamp of Maldives</p>\r\n	IMG_20151020_090112_923.jpg	image/jpeg	527113	2015-10-22 06:03:11.857013	active	2015-10-22 06:03:11.870094	2015-10-22 06:03:11.870094
1528	3	64	21	BIRDMD39	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_090205_783.jpg	image/jpeg	615168	2015-10-22 06:04:38.671024	active	2015-10-22 06:04:38.684905	2015-10-22 06:04:38.684905
1529	3	64	21	BIRDMD40	HUNGARY	9.00	<p>Medium size bird stamp of Hungary</p>\r\n	IMG_20151020_090221_156.jpg	image/jpeg	779301	2015-10-22 06:05:45.550882	active	2015-10-22 06:05:45.565638	2015-10-22 06:05:45.565638
1530	3	64	21	BIRDMD41	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_090258_570.jpg	image/jpeg	431439	2015-10-22 06:07:03.758293	active	2015-10-22 06:07:03.771663	2015-10-22 06:07:03.771663
1531	3	64	21	BIRDMD42	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_090332_637.jpg	image/jpeg	653386	2015-10-22 06:08:28.976012	active	2015-10-22 06:08:28.990903	2015-10-22 06:08:28.990903
1532	3	64	21	BIRDMD43	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_090345_585.jpg	image/jpeg	573553	2015-10-22 06:09:55.541496	active	2015-10-22 06:09:55.556422	2015-10-22 06:09:55.556422
1533	3	64	21	BIRDMD44	HUNGARY	9.00	<p>Medium size bird stamp of Hungary</p>\r\n	IMG_20151020_090401_023.jpg	image/jpeg	712731	2015-10-22 06:10:56.560879	active	2015-10-22 06:10:56.574702	2015-10-22 06:10:56.574702
1534	3	64	21	BIRDMD45	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_090417_360.jpg	image/jpeg	822443	2015-10-22 06:12:51.960706	active	2015-10-22 06:12:51.974994	2015-10-22 06:12:51.974994
1535	3	64	21	BIRDMD46	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_101634_994.jpg	image/jpeg	959089	2015-10-22 06:14:06.900776	active	2015-10-22 06:14:06.915771	2015-10-22 06:14:06.915771
1536	3	64	21	BIRDMD47	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_101647_126.jpg	image/jpeg	758506	2015-10-22 06:15:16.101307	active	2015-10-22 06:15:16.116215	2015-10-22 06:15:16.116215
1537	3	64	21	BIRDMD48	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_101719_733.jpg	image/jpeg	924939	2015-10-22 06:16:23.926114	active	2015-10-22 06:16:23.941613	2015-10-22 06:16:23.941613
1538	3	64	21	BIRDMD49	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_204539_633.jpg	image/jpeg	676404	2015-10-22 06:17:31.22955	active	2015-10-22 06:17:31.243934	2015-10-22 06:17:31.243934
1539	3	64	21	BIRDMD50	UZBEKISTAN	9.00	<p>Medium size bird stamp of Uzbekistan</p>\r\n	IMG_20151020_204604_385.jpg	image/jpeg	915469	2015-10-22 06:19:06.00226	active	2015-10-22 06:19:06.016729	2015-10-22 06:19:06.016729
1540	3	64	21	BIRDMD51	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_204641_088.jpg	image/jpeg	772519	2015-10-22 06:20:22.504185	active	2015-10-22 06:20:22.519271	2015-10-22 06:20:22.519271
1541	3	64	21	BIRDMD52	BULGARIA	9.00	<p>Medium size bird stamp of Bulgaria</p>\r\n	IMG_20151020_204743_553.jpg	image/jpeg	922576	2015-10-22 06:22:27.129236	active	2015-10-22 06:22:27.144545	2015-10-22 06:22:27.144545
1542	3	64	21	BIRDMD53	HUNGARY	9.00	<p>Medium size bird stamp of Hungary</p>\r\n	IMG_20151020_204808_607.jpg	image/jpeg	818739	2015-10-22 06:23:40.505643	active	2015-10-22 06:23:40.520234	2015-10-22 06:23:40.520234
1543	3	64	21	BIRDMD54	SINGAPORE	9.00	<p>Medium size bird stamp of Singapore</p>\r\n	IMG_20151020_204834_741.jpg	image/jpeg	595846	2015-10-22 06:24:41.500872	active	2015-10-22 06:24:41.517538	2015-10-22 06:24:41.517538
1544	3	64	21	BIRDMD55	NEW ZEALAND	9.00	<p>Medium size bird stamp of New Zealand</p>\r\n	IMG_20151020_204849_718.jpg	image/jpeg	874151	2015-10-22 06:25:52.714953	active	2015-10-22 06:25:52.730035	2015-10-22 06:25:52.730035
1545	3	64	21	BIRDMD56	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_204919_738.jpg	image/jpeg	808840	2015-10-22 06:26:51.882735	active	2015-10-22 06:26:51.897399	2015-10-22 06:26:51.897399
1546	3	64	21	BIRDMD57	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_204949_877.jpg	image/jpeg	768038	2015-10-22 06:27:58.983423	active	2015-10-22 06:27:58.999936	2015-10-22 06:27:58.999936
1547	3	64	21	BIRDMD58	UNITED KINGDOM	9.00	<p>Medium size bird stamp of United Kingdom&nbsp;</p>\r\n	IMG_20151020_205014_141.jpg	image/jpeg	652200	2015-10-22 06:29:21.678494	active	2015-10-22 06:29:21.6926	2015-10-22 06:29:21.6926
1548	3	64	21	BIRDMD59	UNITED KINGDOM	9.00	<p>Medium size bird stamp of United Kingdom</p>\r\n	IMG_20151020_205117_053.jpg	image/jpeg	563388	2015-10-22 06:30:36.021796	active	2015-10-22 06:30:36.035339	2015-10-22 06:30:36.035339
1549	3	64	21	BIRDMD60	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_205151_586.jpg	image/jpeg	760365	2015-10-22 06:32:01.482758	active	2015-10-22 06:32:01.496626	2015-10-22 06:32:01.496626
1550	3	64	21	BIRDMD61	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_205208_095.jpg	image/jpeg	605085	2015-10-22 06:35:14.957719	active	2015-10-22 06:35:14.971354	2015-10-22 06:35:14.971354
1551	3	64	21	BIRDMD62	SWITZERLAND	9.00	<p>Medium size bird stamp of Switzerland</p>\r\n	IMG_20151020_205238_613.jpg	image/jpeg	528447	2015-10-22 06:36:34.452327	active	2015-10-22 06:36:34.466254	2015-10-22 06:36:34.466254
1552	3	64	21	BIRDMD63	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_205258_183.jpg	image/jpeg	512291	2015-10-22 06:37:31.0358	active	2015-10-22 06:37:31.049027	2015-10-22 06:37:31.049027
1553	3	64	21	BIRDMD64	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_213911_673.jpg	image/jpeg	654972	2015-10-22 06:39:55.871431	active	2015-10-22 06:39:55.885868	2015-10-22 06:39:55.885868
1554	3	64	21	BIRDMD65	NEW ZEALAND	9.00	<p>Medium size bird stamp of New Zealand</p>\r\n	IMG_20151020_213930_955.jpg	image/jpeg	808665	2015-10-22 06:40:57.247722	active	2015-10-22 06:40:57.261948	2015-10-22 06:40:57.261948
1555	3	64	21	BIRDMD66	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_213942_878.jpg	image/jpeg	727281	2015-10-22 06:42:07.105266	active	2015-10-22 06:42:07.119251	2015-10-22 06:42:07.119251
1556	3	64	21	BIRDMD67	CZECHOSLOVAKIA	9.00	<p>Medium size bird stamp of Czechoslovakia</p>\r\n	IMG_20151020_214012_205.jpg	image/jpeg	712919	2015-10-22 06:43:54.643629	active	2015-10-22 06:43:54.657237	2015-10-22 06:43:54.657237
1557	3	64	21	BIRDMD68	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_214026_241.jpg	image/jpeg	671867	2015-10-22 06:46:52.451063	active	2015-10-22 06:46:52.465934	2015-10-22 06:46:52.465934
1558	3	64	21	BIRDMD69	UNITED KINGDOM	9.00	<p>Medium size bird stamp of United Kingdom</p>\r\n	IMG_20151020_214042_520.jpg	image/jpeg	582649	2015-10-22 06:48:30.758403	active	2015-10-22 06:48:30.771846	2015-10-22 06:48:30.771846
1559	3	64	21	BIRDMD70	MALI	9.00	<p>Medium size bird stamp of Mali</p>\r\n	IMG_20151020_214104_423.jpg	image/jpeg	671692	2015-10-22 06:49:36.114129	active	2015-10-22 06:49:36.127108	2015-10-22 06:49:36.127108
1560	3	64	21	BIRDMD70	CANADA	9.00	<p>Medium size bird stamp of Canada</p>\r\n	IMG_20151020_214130_079.jpg	image/jpeg	468425	2015-10-22 06:51:05.553567	active	2015-10-22 06:51:05.56753	2015-10-22 06:51:05.56753
1561	3	64	21	BIRDMD71	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151020_214146_134.jpg	image/jpeg	773521	2015-10-22 06:53:02.387573	active	2015-10-22 06:53:02.400961	2015-10-22 06:53:02.400961
1562	3	64	21	BIRDMD72	GRENADA	9.00	<p>Medium size bird stamp of Grenada</p>\r\n	IMG_20151020_214225_173.jpg	image/jpeg	544230	2015-10-22 06:54:03.115305	active	2015-10-22 06:54:03.130752	2015-10-22 06:54:03.130752
1563	3	64	21	BIRDMD74	MADAGASCAR	9.00	<p>Medium size bird stamp of Madagascar</p>\r\n	IMG_20151020_214303_609.jpg	image/jpeg	626326	2015-10-22 06:55:26.969512	active	2015-10-22 06:55:26.983725	2015-10-22 06:55:26.983725
1564	3	64	21	BIRDMD75	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_214321_566.jpg	image/jpeg	610788	2015-10-22 06:57:03.97978	active	2015-10-22 06:57:03.993154	2015-10-22 06:57:03.993154
1565	3	64	21	BIRDMD76	NEW ZEALAND	9.00	<p>Medium size bird stamp of New Zealand</p>\r\n	IMG_20151020_214352_482.jpg	image/jpeg	1146407	2015-10-22 06:58:34.370757	active	2015-10-22 06:58:34.397716	2015-10-22 06:58:34.397716
1566	3	64	21	BIRDMD77	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_214416_746.jpg	image/jpeg	761853	2015-10-22 06:59:31.286372	active	2015-10-22 06:59:31.302787	2015-10-22 06:59:31.302787
1567	3	64	21	BIRDMD78	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_214450_497.jpg	image/jpeg	727635	2015-10-22 07:00:47.104786	active	2015-10-22 07:00:47.120076	2015-10-22 07:00:47.120076
1568	3	64	21	BIRDMD79	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151020_214509_121.jpg	image/jpeg	631417	2015-10-22 07:02:44.758623	active	2015-10-22 07:02:44.773061	2015-10-22 07:02:44.773061
1569	3	64	21	BIRDMD80	MADAGASCAR	9.00	<p>Medium size bird stamp of Madagascar</p>\r\n	IMG_20151020_214524_919.jpg	image/jpeg	579053	2015-10-22 07:04:13.338728	active	2015-10-22 07:04:13.352738	2015-10-22 07:04:13.352738
1570	3	64	21	BIRDMD81	MALDIVES	9.00	<p>Medium size bird stamp of Maldives</p>\r\n	IMG_20151020_214541_984.jpg	image/jpeg	746695	2015-10-22 07:05:37.327942	active	2015-10-22 07:05:37.341845	2015-10-22 07:05:37.341845
1571	3	64	21	BIRDMD82	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151020_214555_338.jpg	image/jpeg	649466	2015-10-22 07:06:35.709495	active	2015-10-22 07:06:35.724072	2015-10-22 07:06:35.724072
1572	3	64	21	BIRDMD83	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151021_084858_866.jpg	image/jpeg	547679	2015-10-22 07:07:34.271154	active	2015-10-22 07:07:34.284644	2015-10-22 07:07:34.284644
1573	3	64	21	BIRDMD84	CUBA	9.00	<p>Medium size bird stamp of Cuba</p>\r\n	IMG_20151021_084919_193.jpg	image/jpeg	827645	2015-10-22 07:08:48.191413	active	2015-10-22 07:08:48.205836	2015-10-22 07:08:48.205836
1574	3	64	21	BIRDMD85	SRI LANKA	9.00	<p>Medium size bird stamp of Sri Lanka</p>\r\n	IMG_20151021_084938_182.jpg	image/jpeg	495877	2015-10-22 07:09:43.007621	active	2015-10-22 07:09:43.021265	2015-10-22 07:09:43.021265
1575	3	64	21	BIRDMD86	GHANA	9.00	<p>Medium size bird stamp of Ghana</p>\r\n	IMG_20151021_084959_588.jpg	image/jpeg	756893	2015-10-22 07:10:38.903811	active	2015-10-22 07:10:38.918548	2015-10-22 07:10:38.918548
1576	3	64	21	BIRDMD87	DENMARK	9.00	<p>Medium size bird stamp of Denmark</p>\r\n	IMG_20151021_085015_921.jpg	image/jpeg	833535	2015-10-22 07:11:41.902237	active	2015-10-22 07:11:41.91696	2015-10-22 07:11:41.91696
1577	3	64	21	BIRDMD88	HUNGARY	9.00	<p>Medium size bird stamp of Hungary</p>\r\n	IMG_20151021_085041_168.jpg	image/jpeg	543002	2015-10-22 07:12:45.987873	active	2015-10-22 07:12:46.094536	2015-10-22 07:12:46.094536
1578	3	64	21	BIRDMD89	ROMANIA	9.00	<p>Medium size bird stamp of Romania</p>\r\n	IMG_20151021_085057_400.jpg	image/jpeg	729254	2015-10-22 07:13:45.714394	active	2015-10-22 07:13:45.728063	2015-10-22 07:13:45.728063
1579	3	64	21	BIRDMD90	TANZANIA	9.00	<p>Medium size bird stamp of Tanzania</p>\r\n	IMG_20151021_085115_207.jpg	image/jpeg	885557	2015-10-22 07:14:49.045764	active	2015-10-22 07:14:49.060939	2015-10-22 07:14:49.060939
1580	3	64	21	BIRDSM1	SOUTH KOREA	6.00	<p>Small size bird stamp of South Korea</p>\r\n	IMG_20151019_163707_791.jpg	image/jpeg	503070	2015-10-22 11:03:28.363527	active	2015-10-22 11:03:28.377684	2015-10-22 11:03:28.377684
1581	3	64	21	BIRDSM2	NORWAY	6.00	<p>Small size bird stamp of Norway</p>\r\n	IMG_20151019_175816_500.jpg	image/jpeg	469274	2015-10-22 11:04:31.312193	active	2015-10-22 11:04:31.3261	2015-10-22 11:04:31.3261
1582	3	64	21	BIRDSM3	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_175853_206.jpg	image/jpeg	491498	2015-10-22 11:05:37.238504	active	2015-10-22 11:05:37.253362	2015-10-22 11:05:37.253362
1583	3	64	21	BIRDSM4	DENMARK	6.00	<p>Small size bird stamp of Denmark</p>\r\n	IMG_20151019_175937_607.jpg	image/jpeg	507602	2015-10-22 11:06:41.896676	active	2015-10-22 11:06:41.910483	2015-10-22 11:06:41.910483
1584	3	64	21	BIRDSM5	AUSTRALIA	6.00	<p>Small size bird stamp of Australia</p>\r\n	IMG_20151019_180008_681.jpg	image/jpeg	412714	2015-10-22 11:07:36.679867	active	2015-10-22 11:07:36.693097	2015-10-22 11:07:36.693097
1585	3	64	21	BIRDSM6	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_180036_924.jpg	image/jpeg	524720	2015-10-22 11:08:40.440004	active	2015-10-22 11:08:40.453675	2015-10-22 11:08:40.453675
1586	3	64	21	BIRDSM7	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_180105_805.jpg	image/jpeg	470811	2015-10-22 11:09:29.169029	active	2015-10-22 11:09:29.181896	2015-10-22 11:09:29.181896
1587	3	64	21	BIRDSM8	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_180142_080.jpg	image/jpeg	411845	2015-10-22 11:10:32.112705	active	2015-10-22 11:10:32.126033	2015-10-22 11:10:32.126033
1588	3	64	21	BIRDSM9	AUSTRALIA	6.00	<p>Small size bird stamp of Australia</p>\r\n	IMG_20151019_180215_557.jpg	image/jpeg	477791	2015-10-22 11:11:27.682617	active	2015-10-22 11:11:27.695746	2015-10-22 11:11:27.695746
1589	3	64	21	BIRDSM10	CUBA	6.00	<p>Small size bird stamp of Cuba</p>\r\n	IMG_20151019_180239_228.jpg	image/jpeg	536949	2015-10-22 11:12:20.988124	active	2015-10-22 11:12:21.001574	2015-10-22 11:12:21.001574
1590	3	64	21	BIRDSM11	SOUTH KOREA	6.00	<p>Small size bird stamp of South Korea</p>\r\n	IMG_20151019_180257_812.jpg	image/jpeg	473568	2015-10-22 11:13:22.608841	active	2015-10-22 11:13:22.622376	2015-10-22 11:13:22.622376
1591	3	64	21	BIRDSM12	SOUTH KOREA	6.00	<p>Small size bird stamp of South Korea</p>\r\n	IMG_20151019_180321_894.jpg	image/jpeg	497962	2015-10-22 11:14:36.108619	active	2015-10-22 11:14:36.122128	2015-10-22 11:14:36.122128
1592	3	64	21	BIRDSM13	NORWAY	6.00	<p>Small size bird stamp of Norway</p>\r\n	IMG_20151019_180343_509.jpg	image/jpeg	831745	2015-10-22 11:15:58.707124	active	2015-10-22 11:15:58.721343	2015-10-22 11:15:58.721343
1593	3	64	21	BIRDSM14	SOUTH KOREA	6.00	<p>Small size bird stamp of South Korea</p>\r\n	IMG_20151019_180901_645.jpg	image/jpeg	522384	2015-10-22 11:17:16.615776	active	2015-10-22 11:17:16.629424	2015-10-22 11:17:16.629424
1594	3	64	21	BIRDSM15	SRI LANKA	6.00	<p>Small size bird stamp of Sri Lanka</p>\r\n	IMG_20151019_180932_497.jpg	image/jpeg	332415	2015-10-22 11:18:22.503135	active	2015-10-22 11:18:22.515749	2015-10-22 11:18:22.515749
1595	3	64	21	BIRDSM16	BELGIUM	6.00	<p>Small size bird stamp of Belgium</p>\r\n	IMG_20151019_181003_864.jpg	image/jpeg	296830	2015-10-22 11:20:08.165367	active	2015-10-22 11:20:08.178678	2015-10-22 11:20:08.178678
1596	3	64	21	BIRDSM17	SOUTH KOREA	6.00	<p>Small size bird stamp of South Korea</p>\r\n	IMG_20151019_181027_998.jpg	image/jpeg	321462	2015-10-22 11:21:02.497118	active	2015-10-22 11:21:02.509982	2015-10-22 11:21:02.509982
1597	3	64	21	BIRDSM18	DENMARK	6.00	<p>Small size bird stamp of Denmark</p>\r\n	IMG_20151019_181041_924.jpg	image/jpeg	472065	2015-10-22 11:21:54.60283	active	2015-10-22 11:21:54.616126	2015-10-22 11:21:54.616126
1598	3	64	21	BIRDSM19	SRI LANKA	6.00	<p>Small size bird stamp of Sri Lanka</p>\r\n	IMG_20151019_181106_070.jpg	image/jpeg	843545	2015-10-22 11:23:10.091799	active	2015-10-22 11:23:10.106226	2015-10-22 11:23:10.106226
1599	3	64	21	BIRDSM20	AUSTRALIA	6.00	<p>Small size bird stamp of Australia</p>\r\n	IMG_20151019_181128_127.jpg	image/jpeg	651368	2015-10-22 11:24:08.025582	active	2015-10-22 11:24:08.039225	2015-10-22 11:24:08.039225
1600	3	64	21	BIRDSM21	DENMARK	6.00	<p>Small size bird stamp of Denmark</p>\r\n	IMG_20151019_181141_698.jpg	image/jpeg	670279	2015-10-22 11:26:36.549412	active	2015-10-22 11:26:36.564091	2015-10-22 11:26:36.564091
1601	3	64	21	BIRDSM22	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_181155_601.jpg	image/jpeg	792830	2015-10-22 11:27:42.358035	active	2015-10-22 11:27:42.372497	2015-10-22 11:27:42.372497
1602	3	64	21	BIRDSM23	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_181224_871.jpg	image/jpeg	415211	2015-10-22 11:28:37.011989	active	2015-10-22 11:28:37.025425	2015-10-22 11:28:37.025425
1603	3	64	21	BIRDSM24	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_181248_927.jpg	image/jpeg	813532	2015-10-22 11:29:37.083716	active	2015-10-22 11:29:37.098119	2015-10-22 11:29:37.098119
1604	3	64	21	BIRDSM25	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_181303_862.jpg	image/jpeg	586382	2015-10-22 11:30:46.545279	active	2015-10-22 11:30:46.558618	2015-10-22 11:30:46.558618
1605	3	64	21	BIRDSM26	AUSTRALIA	6.00	<p>Small size bird stamp of Australia</p>\r\n	IMG_20151019_181318_801.jpg	image/jpeg	714916	2015-10-22 11:31:59.85474	active	2015-10-22 11:31:59.952987	2015-10-22 11:31:59.952987
1606	3	64	21	BIRDSM27	BELGIUM	6.00	<p>Small size bird stamp of Belgium</p>\r\n	IMG_20151019_181333_179.jpg	image/jpeg	727913	2015-10-22 11:32:54.919569	active	2015-10-22 11:32:54.933699	2015-10-22 11:32:54.933699
1607	3	64	21	BIRDSM28	BELGIUM	6.00	<p>Small size bird stamp of Belgium</p>\r\n	IMG_20151019_181659_471.jpg	image/jpeg	620234	2015-10-22 11:33:53.862538	active	2015-10-22 11:33:53.876169	2015-10-22 11:33:53.876169
1608	3	64	21	BIRDSM29	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_181718_713.jpg	image/jpeg	516649	2015-10-22 11:35:12.403023	active	2015-10-22 11:35:12.416792	2015-10-22 11:35:12.416792
1609	3	64	21	BIRDSM30	NIPPON	6.00	<p>Small size bird stamp of Nippon</p>\r\n	IMG_20151019_181734_889.jpg	image/jpeg	494187	2015-10-22 11:36:05.756937	active	2015-10-22 11:36:05.770264	2015-10-22 11:36:05.770264
1610	3	64	21	BIRDSM31	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_182714_271.jpg	image/jpeg	465793	2015-10-22 11:40:00.642136	active	2015-10-22 11:40:00.655769	2015-10-22 11:40:00.655769
1611	3	64	21	BIRDSM32	SRI LANKA	6.00	<p>Small size bird stamp of Sri Lanka</p>\r\n	IMG_20151019_182745_831.jpg	image/jpeg	558598	2015-10-22 11:40:59.394231	active	2015-10-22 11:40:59.407808	2015-10-22 11:40:59.407808
1612	3	64	21	BIRDSM34	NEW ZEALAND	6.00	<p>Small size bird stamp of New Zealand</p>\r\n	IMG_20151019_183108_938.jpg	image/jpeg	646505	2015-10-22 11:42:10.579991	active	2015-10-22 11:42:10.594088	2015-10-22 11:42:10.594088
1613	3	64	21	BIRDSM33	NORWAY	6.00	<p>Small size bird stamp of Norway</p>\r\n	IMG_20151019_183135_473.jpg	image/jpeg	688505	2015-10-22 11:44:04.29959	active	2015-10-22 11:44:04.313462	2015-10-22 11:44:04.313462
1614	3	64	21	BIRDSM35	GHANA	6.00	<p>Small size bird stamp of Ghana</p>\r\n	IMG_20151019_183233_066.jpg	image/jpeg	517871	2015-10-22 11:44:57.215671	active	2015-10-22 11:44:57.2287	2015-10-22 11:44:57.2287
1615	3	64	21	BIRDSM36	CANADA	6.00	<p>Small size bird stamp of Canada</p>\r\n	IMG_20151019_183251_477.jpg	image/jpeg	625932	2015-10-22 11:47:14.25716	active	2015-10-22 11:47:14.270966	2015-10-22 11:47:14.270966
1616	3	64	21	BIRDSM37	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_183337_474.jpg	image/jpeg	460398	2015-10-22 11:48:07.265261	active	2015-10-22 11:48:07.27841	2015-10-22 11:48:07.27841
1617	3	64	21	BIRDSM38	NEW ZEALAND	6.00	<p>Small size bird stamp of New Zealand</p>\r\n	IMG_20151019_183417_174.jpg	image/jpeg	729530	2015-10-22 11:50:52.929339	active	2015-10-22 11:50:52.943609	2015-10-22 11:50:52.943609
1618	3	64	21	BIRDSM39	CUBA	6.00	<p>Small size bird stamp of Cuba</p>\r\n	IMG_20151019_183443_093.jpg	image/jpeg	640166	2015-10-22 11:51:49.624259	active	2015-10-22 11:51:49.638541	2015-10-22 11:51:49.638541
1619	3	64	21	BIRDSM40	SWITZERLAND	6.00	<p>Small size bird stamp of Switzerland</p>\r\n	IMG_20151019_183540_665.jpg	image/jpeg	650006	2015-10-22 11:53:47.143379	active	2015-10-22 11:53:47.157236	2015-10-22 11:53:47.157236
1620	3	64	21	BIRDSM41	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_183706_552.jpg	image/jpeg	528126	2015-10-22 11:54:42.801687	active	2015-10-22 11:54:42.81519	2015-10-22 11:54:42.81519
1621	3	64	21	BIRDSM42	CANADA	6.00	<p>Small size bird stamp of Canada</p>\r\n	IMG_20151019_183728_977.jpg	image/jpeg	494298	2015-10-22 11:55:56.162543	active	2015-10-22 11:55:56.176242	2015-10-22 11:55:56.176242
1622	3	64	21	BIRDSM43	CANADA	6.00	<p>Small size bird stamp of CANADA</p>\r\n	IMG_20151019_183748_571.jpg	image/jpeg	603765	2015-10-22 11:56:57.311294	active	2015-10-22 11:56:57.325166	2015-10-22 11:56:57.325166
1623	3	64	21	BIRDSM44	Israel	6.00	<p>Small size bird stamp of Israel</p>\r\n	IMG_20151019_183813_205.jpg	image/jpeg	576840	2015-10-22 11:58:02.483807	active	2015-10-22 11:58:02.497093	2015-10-22 11:58:02.497093
1624	3	64	21	BIRDSM45	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_183857_429.jpg	image/jpeg	606628	2015-10-22 11:59:06.183955	active	2015-10-22 11:59:06.19858	2015-10-22 11:59:06.19858
1625	3	64	21	BIRDSM46	FRANCE	6.00	<p>Small size bird stamp of France</p>\r\n	IMG_20151019_194139_449.jpg	image/jpeg	493262	2015-10-22 12:00:07.512539	active	2015-10-22 12:00:07.526041	2015-10-22 12:00:07.526041
1626	3	64	21	BIRDSM47	INDIA	6.00	<p>Small size bird stamp of India</p>\r\n	IMG_20151019_194204_857.jpg	image/jpeg	672385	2015-10-22 12:01:41.88949	active	2015-10-22 12:01:41.904377	2015-10-22 12:01:41.904377
1627	3	64	21	BIRDSM48	UGANDA	6.00	<p>Small size bird stamp of Uganda</p>\r\n	IMG_20151019_194230_982.jpg	image/jpeg	588143	2015-10-22 12:02:36.398581	active	2015-10-22 12:02:36.412177	2015-10-22 12:02:36.412177
1628	3	64	21	BIRDSM49	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_194319_607.jpg	image/jpeg	560122	2015-10-22 12:03:34.287018	active	2015-10-22 12:03:34.381438	2015-10-22 12:03:34.381438
1629	3	64	21	BIRDSM50	KENYA	6.00	<p>Small size bird stamp of Kenya</p>\r\n	IMG_20151019_194338_893.jpg	image/jpeg	511854	2015-10-22 12:04:24.279847	active	2015-10-22 12:04:24.293465	2015-10-22 12:04:24.293465
1630	3	64	22	SHIPBG1	GUYANA	13.00	<p>Big size ship stamp of Guyana</p>\r\n	IMG_20151013_175912.jpg	image/jpeg	2182941	2015-10-22 12:16:15.043901	active	2015-10-22 12:16:15.062627	2015-10-22 12:16:15.062627
1631	3	64	22	SHIPBG2	EQUATORIAL GUINEA	13.00	<p>Big size ship stamp of Equatorial Guinea</p>\r\n	IMG_20151013_175944.jpg	image/jpeg	2104989	2015-10-22 12:17:54.684034	active	2015-10-22 12:17:54.702078	2015-10-22 12:17:54.702078
1632	3	64	22	SHIPBG3	BULGARIA	13.00	<p>Big size ship stamp of Bulgaria</p>\r\n	IMG_20151013_181954_471.jpg	image/jpeg	1162704	2015-10-22 12:20:01.159342	active	2015-10-22 12:20:01.175245	2015-10-22 12:20:01.175245
1633	3	64	22	SHIPBG4	BELIZE	13.00	<p>Big size ship stamp of Belize</p>\r\n	IMG_20151013_182047_337.jpg	image/jpeg	860783	2015-10-22 12:21:24.561615	active	2015-10-22 12:21:24.576322	2015-10-22 12:21:24.576322
1634	3	64	22	SHIPBG5	GUINEA BISSAU	13.00	<p>Big size ship stamp of Guinea Bissau</p>\r\n	IMG_20151013_182135_010.jpg	image/jpeg	873621	2015-10-22 12:22:48.916271	active	2015-10-22 12:22:48.932341	2015-10-22 12:22:48.932341
1635	3	64	22	SHIPBG6	GUINEA BISSAU	13.00	<p>Big size ship stamp of Guinea Bissau</p>\r\n	IMG_20151013_182218_753.jpg	image/jpeg	866277	2015-10-22 12:24:03.346606	active	2015-10-22 12:24:03.361278	2015-10-22 12:24:03.361278
1636	3	64	22	SHIPBG7	HUNGARY	13.00	<p>Big size ship stamp of Hungary</p>\r\n	IMG_20151013_182329_652.jpg	image/jpeg	804938	2015-10-22 12:25:12.279639	active	2015-10-22 12:25:12.293962	2015-10-22 12:25:12.293962
1637	3	64	22	SHIPBG8	CHINA	13.00	<p>Big size ship stamp of China</p>\r\n	IMG_20151013_182355_697.jpg	image/jpeg	529641	2015-10-22 12:26:20.296732	active	2015-10-22 12:26:20.310267	2015-10-22 12:26:20.310267
1638	3	64	22	SHIPBG9	HUNGARY	13.00	<p>Big size ship stamp of Hungary</p>\r\n	IMG_20151013_182527_287.jpg	image/jpeg	672819	2015-10-22 12:27:24.4038	active	2015-10-22 12:27:24.417932	2015-10-22 12:27:24.417932
1639	3	64	22	SHIPBG10	POLAND	13.00	<p>Big size ship stamp of Poland</p>\r\n	IMG_20151013_182626_031.jpg	image/jpeg	575660	2015-10-22 12:28:23.341321	active	2015-10-22 12:28:23.355132	2015-10-22 12:28:23.355132
1640	3	64	22	SHIPBG11	CHINA	13.00	<p>Big size ship stamp of China</p>\r\n	IMG_20151013_182717_282.jpg	image/jpeg	459880	2015-10-22 12:29:43.699356	active	2015-10-22 12:29:43.713104	2015-10-22 12:29:43.713104
1641	3	64	22	SHIPBG12	GUINEA BISSAU	13.00	<p>Big size ship stamp of Guinea Bissau</p>\r\n	IMG_20151013_182854_911.jpg	image/jpeg	835986	2015-10-22 12:30:56.35946	active	2015-10-22 12:30:56.373569	2015-10-22 12:30:56.373569
1642	3	64	22	SHIPBG13	CHINA	13.00	<p>Big size ship stamp of China</p>\r\n	IMG_20151013_182919_097.jpg	image/jpeg	551782	2015-10-22 12:32:06.169282	active	2015-10-22 12:32:06.183118	2015-10-22 12:32:06.183118
1643	3	64	22	SHIPBG14	POLAND	13.00	<p>Big size ship stamp of Poland</p>\r\n	IMG_20151013_182956_203.jpg	image/jpeg	707054	2015-10-22 12:33:07.463114	active	2015-10-22 12:33:07.477283	2015-10-22 12:33:07.477283
1644	3	64	22	SHIPBG15	CAMBODIA	13.00	<p>Big size ship stamp of Cambodia</p>\r\n	IMG_20151013_183021_936.jpg	image/jpeg	1388184	2015-10-22 12:34:25.072374	active	2015-10-22 12:34:25.087906	2015-10-22 12:34:25.087906
1645	3	64	22	SHIPBG16	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183147_055.jpg	image/jpeg	1033578	2015-10-22 12:36:38.984426	active	2015-10-22 12:36:38.999483	2015-10-22 12:36:38.999483
1646	3	64	22	SHIPBG17	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183212_353.jpg	image/jpeg	965296	2015-10-22 12:38:21.103038	active	2015-10-22 12:38:21.117571	2015-10-22 12:38:21.117571
1647	3	64	22	SHIPBG18	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183412_640.jpg	image/jpeg	960137	2015-10-22 12:39:48.495463	active	2015-10-22 12:39:48.509994	2015-10-22 12:39:48.509994
1648	3	64	22	SHIPBG19	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183539_519.jpg	image/jpeg	971371	2015-10-22 12:41:10.091074	active	2015-10-22 12:41:10.105853	2015-10-22 12:41:10.105853
1649	3	64	22	SHIPBG20	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183607_113.jpg	image/jpeg	911020	2015-10-22 12:42:35.862569	active	2015-10-22 12:42:35.877508	2015-10-22 12:42:35.877508
1650	3	64	22	SHIPBG21	GUYANA	13.00	<p>Big size ship stamp of Guyana</p>\r\n	IMG_20151013_183929_940.jpg	image/jpeg	937397	2015-10-22 12:44:59.921829	active	2015-10-22 12:44:59.937232	2015-10-22 12:44:59.937232
1651	3	64	22	SHIPBG22	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_183948_939.jpg	image/jpeg	1002419	2015-10-22 12:46:50.146887	active	2015-10-22 12:46:50.162079	2015-10-22 12:46:50.162079
1652	3	64	22	SHIPBG23	GUNIEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_184038_815.jpg	image/jpeg	727974	2015-10-22 12:48:24.343465	active	2015-10-22 12:48:24.357505	2015-10-22 12:48:24.357505
1653	3	64	22	SHIPBG24	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151013_184137_781.jpg	image/jpeg	982574	2015-10-22 12:50:09.888057	active	2015-10-22 12:50:09.903349	2015-10-22 12:50:09.903349
1654	3	64	22	SHIPBG25	GUYANA	13.00	<p>Big size ship stamp of Guyana</p>\r\n	IMG_20151013_184259_813.jpg	image/jpeg	1078743	2015-10-22 12:52:19.407992	active	2015-10-22 12:52:19.423511	2015-10-22 12:52:19.423511
1655	3	64	22	SHIPBG26	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_181632_192.jpg	image/jpeg	901911	2015-10-22 12:53:41.953394	active	2015-10-22 12:53:41.967708	2015-10-22 12:53:41.967708
1656	3	64	22	SHIPBG27	POLAND	13.00	<p>Big size ship stamp of Poland</p>\r\n	IMG_20151014_181757_047.jpg	image/jpeg	454331	2015-10-22 12:54:37.900667	active	2015-10-22 12:54:37.913651	2015-10-22 12:54:37.913651
1657	3	64	22	SHIPBG28	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_181819_506.jpg	image/jpeg	739285	2015-10-22 12:55:36.96166	active	2015-10-22 12:55:36.975836	2015-10-22 12:55:36.975836
1658	3	64	22	SHIPBG29	HUNGARY	13.00	<p>Big size ship stamp of Hungary</p>\r\n	IMG_20151014_181900_771.jpg	image/jpeg	461390	2015-10-22 12:56:39.046021	active	2015-10-22 12:56:39.058966	2015-10-22 12:56:39.058966
1659	3	64	22	SHIPBG30	HUNGARY	13.00	<p>Big size ship stamp of Hungary</p>\r\n	IMG_20151014_182031_226.jpg	image/jpeg	776177	2015-10-22 12:58:06.752413	active	2015-10-22 12:58:06.767253	2015-10-22 12:58:06.767253
1660	3	64	22	SHIPBG31	POLAND	13.00	<p>Big size ship stamp of Poland</p>\r\n	IMG_20151014_182111_996.jpg	image/jpeg	545446	2015-10-22 12:59:00.756304	active	2015-10-22 12:59:00.773011	2015-10-22 12:59:00.773011
1661	3	64	22	SHIPBG32	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_182136_899.jpg	image/jpeg	888128	2015-10-22 13:00:20.686129	active	2015-10-22 13:00:20.700694	2015-10-22 13:00:20.700694
1662	3	64	22	SHIPBG33	BULGARIA	13.00	<p>Big size ship stamp of Bulgaria</p>\r\n	IMG_20151014_182213_566.jpg	image/jpeg	942629	2015-10-22 13:01:51.176851	active	2015-10-22 13:01:51.191928	2015-10-22 13:01:51.191928
1663	3	64	22	SHIPBG34	CAMBODIA	13.00	<p>Big size ship stamp of Cambodia</p>\r\n	IMG_20151014_182344_937.jpg	image/jpeg	927986	2015-10-22 13:03:21.266058	active	2015-10-22 13:03:21.280565	2015-10-22 13:03:21.280565
1664	3	64	22	SHIPBG35	CHINA	13.00	<p>Big size ship stamp of China</p>\r\n	IMG_20151014_182415_106.jpg	image/jpeg	496985	2015-10-22 13:04:15.660696	active	2015-10-22 13:04:15.674156	2015-10-22 13:04:15.674156
1665	3	64	22	SHIPBG36	GUINEA BISSAU	13.00	<p>Big size ship stamp of Guinea Bissau</p>\r\n	IMG_20151014_182440_442.jpg	image/jpeg	705798	2015-10-22 13:05:22.915322	active	2015-10-22 13:05:22.929307	2015-10-22 13:05:22.929307
1666	3	64	22	SHIPBG37	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_182517_811.jpg	image/jpeg	867527	2015-10-22 13:06:41.687372	active	2015-10-22 13:06:41.702426	2015-10-22 13:06:41.702426
1667	3	64	22	SHIPBG38	VIETNAM	13.00	<p>Big size ship stamp of Vietnam</p>\r\n	IMG_20151014_182547_677.jpg	image/jpeg	730510	2015-10-22 13:07:39.919635	active	2015-10-22 13:07:39.933806	2015-10-22 13:07:39.933806
1668	3	64	22	SHIPBG39	GUINEA BISSAU	13.00	<p>Big size ship stamp of Guinea Bissau</p>\r\n	IMG_20151014_182609_056.jpg	image/jpeg	541794	2015-10-22 13:09:10.074541	active	2015-10-22 13:09:10.088526	2015-10-22 13:09:10.088526
1669	3	64	22	SHIPBG40	BULGARIA	13.00	<p>Big size ship stamp of Bulgaria</p>\r\n	IMG_20151014_182632_813.jpg	image/jpeg	961507	2015-10-22 13:10:14.520065	active	2015-10-22 13:10:14.534541	2015-10-22 13:10:14.534541
1670	3	64	22	SHIPBG41	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_182741_883.jpg	image/jpeg	1156971	2015-10-22 13:11:34.848658	active	2015-10-22 13:11:34.863868	2015-10-22 13:11:34.863868
1671	3	64	22	SHIPBG42	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151014_182820_661.jpg	image/jpeg	795054	2015-10-22 13:12:35.577687	active	2015-10-22 13:12:35.591298	2015-10-22 13:12:35.591298
1672	3	64	22	SHIPBG43	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151015_100517_696.jpg	image/jpeg	705606	2015-10-22 13:13:44.947679	active	2015-10-22 13:13:44.961196	2015-10-22 13:13:44.961196
1673	3	64	22	SHIPBG44	CHINA	13.00	<p>Big size ship stamp of China</p>\r\n	IMG_20151015_100729_290.jpg	image/jpeg	314514	2015-10-22 13:14:24.150747	active	2015-10-22 13:14:24.163601	2015-10-22 13:14:24.163601
1674	3	64	22	SHIPBG45	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151015_112457_755.jpg	image/jpeg	791881	2015-10-22 13:15:20.519767	active	2015-10-22 13:15:20.534466	2015-10-22 13:15:20.534466
1675	3	64	22	SHIPBG46	GUINEA EQUATORIAL	13.00	<p>Big size ship stamp of Guinea Equatorial</p>\r\n	IMG_20151015_112556_728.jpg	image/jpeg	864448	2015-10-22 13:16:35.104571	active	2015-10-22 13:16:35.11959	2015-10-22 13:16:35.11959
1676	3	64	22	SHIPMD1	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_112726_108.jpg	image/jpeg	540199	2015-10-23 05:20:49.830793	active	2015-10-23 05:20:49.84584	2015-10-23 05:20:49.84584
1677	3	64	22	SHIPMD2	ROMANIA	9.00	<p>Medium size Ship stamp of Romania</p>\r\n	IMG_20151015_112924_121.jpg	image/jpeg	329152	2015-10-23 05:21:58.396639	active	2015-10-23 05:21:58.409691	2015-10-23 05:21:58.409691
1678	3	64	22	SHIPMD3	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151015_112942_869.jpg	image/jpeg	349715	2015-10-23 05:22:41.566892	active	2015-10-23 05:22:41.579507	2015-10-23 05:22:41.579507
1679	3	64	22	SHIPMD4	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151015_113127_454.jpg	image/jpeg	516736	2015-10-23 05:23:30.779284	active	2015-10-23 05:23:30.792318	2015-10-23 05:23:30.792318
1680	3	64	22	SHIPMD5	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151015_113202_286.jpg	image/jpeg	500326	2015-10-23 05:24:18.08961	active	2015-10-23 05:24:18.102621	2015-10-23 05:24:18.102621
1681	3	64	22	SHIPMD6	DOMINICA	9.00	<p>Medium size Ship stamp of Dominica</p>\r\n	IMG_20151015_113224_569.jpg	image/jpeg	601686	2015-10-23 05:25:01.683281	active	2015-10-23 05:25:01.696693	2015-10-23 05:25:01.696693
1682	3	64	22	SHIPMD7	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113247_666.jpg	image/jpeg	529098	2015-10-23 05:25:53.813621	active	2015-10-23 05:25:53.82679	2015-10-23 05:25:53.82679
1683	3	64	22	SHIPMD8	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113307_870.jpg	image/jpeg	536315	2015-10-23 05:26:37.790184	active	2015-10-23 05:26:37.802953	2015-10-23 05:26:37.802953
1684	3	64	22	SHIPMD9	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151015_113344_534.jpg	image/jpeg	475592	2015-10-23 05:27:20.839884	active	2015-10-23 05:27:20.852897	2015-10-23 05:27:20.852897
1685	3	64	22	SHIPMD10	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113440_431.jpg	image/jpeg	410817	2015-10-23 05:28:24.942531	active	2015-10-23 05:28:24.955286	2015-10-23 05:28:24.955286
1686	3	64	22	SHIPMD11	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113516_793.jpg	image/jpeg	542928	2015-10-23 05:29:11.357804	active	2015-10-23 05:29:11.3714	2015-10-23 05:29:11.3714
1687	3	64	22	SHIPMD12	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151015_113618_214.jpg	image/jpeg	757432	2015-10-23 05:30:03.23099	active	2015-10-23 05:30:03.246163	2015-10-23 05:30:03.246163
1688	3	64	22	SHIPMD13	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151015_113646_029.jpg	image/jpeg	593088	2015-10-23 05:30:56.200955	active	2015-10-23 05:30:56.215811	2015-10-23 05:30:56.215811
1689	3	64	22	SHIPMD14	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113516_793.jpg	image/jpeg	542928	2015-10-23 05:31:49.815272	active	2015-10-23 05:31:49.829223	2015-10-23 05:31:49.829223
1690	3	64	22	SHIPMD15	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151015_113800_964.jpg	image/jpeg	493028	2015-10-23 05:36:10.154069	active	2015-10-23 05:36:10.170977	2015-10-23 05:36:10.170977
1691	3	64	22	SHIPMD16	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113842_400.jpg	image/jpeg	603956	2015-10-23 05:38:41.635358	active	2015-10-23 05:38:41.648909	2015-10-23 05:38:41.648909
1692	3	64	22	SHIPMD17	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_113930_670.jpg	image/jpeg	508845	2015-10-23 05:39:47.681311	active	2015-10-23 05:39:47.695439	2015-10-23 05:39:47.695439
1693	3	64	22	SHIPMD18	BULGARIA	9.00	<p>Medium size Ship stamp of Bulgaria</p>\r\n	IMG_20151015_114036_307.jpg	image/jpeg	455176	2015-10-23 05:40:34.418212	active	2015-10-23 05:40:34.430906	2015-10-23 05:40:34.430906
1694	3	64	22	SHIPMD19	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151015_123706_385.jpg	image/jpeg	451446	2015-10-23 05:41:13.174307	active	2015-10-23 05:41:13.187548	2015-10-23 05:41:13.187548
1695	3	64	22	SHIPMD20	NIGERIA	9.00	<p>Medium size Ship stamp of Nigeria</p>\r\n	IMG_20151015_123731_097.jpg	image/jpeg	388256	2015-10-23 05:42:12.329188	active	2015-10-23 05:42:12.343364	2015-10-23 05:42:12.343364
1696	3	64	22	SHIPMD21	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151015_123800_337.jpg	image/jpeg	520901	2015-10-23 05:43:01.431076	active	2015-10-23 05:43:01.444784	2015-10-23 05:43:01.444784
1697	3	64	22	SHIPMD22	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_112713.jpg	image/jpeg	924423	2015-10-23 05:44:08.870556	active	2015-10-23 05:44:08.885539	2015-10-23 05:44:08.885539
1698	3	64	22	SHIPMD23	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_112816.jpg	image/jpeg	842554	2015-10-23 05:45:06.453809	active	2015-10-23 05:45:06.468302	2015-10-23 05:45:06.468302
1699	3	64	22	SHIPMD24	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_112910.jpg	image/jpeg	810102	2015-10-23 05:46:02.536544	active	2015-10-23 05:46:02.550701	2015-10-23 05:46:02.550701
1700	3	64	22	SHIPMD25	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_112956.jpg	image/jpeg	1018173	2015-10-23 05:46:54.546114	active	2015-10-23 05:46:54.590197	2015-10-23 05:46:54.590197
1701	3	64	22	SHIPMD27	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_113030.jpg	image/jpeg	824094	2015-10-23 05:48:05.948921	active	2015-10-23 05:48:05.962996	2015-10-23 05:48:05.962996
1702	3	64	22	SHIPMD28	GUINEA PAPUA	9.00	<p>Medium size Ship stamp of Guinea Papua</p>\r\n	IMG_20151016_113154.jpg	image/jpeg	851919	2015-10-23 05:49:12.952665	active	2015-10-23 05:49:12.966528	2015-10-23 05:49:12.966528
1703	3	64	22	SHIPMD29	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_113226.jpg	image/jpeg	706032	2015-10-23 05:50:36.051287	active	2015-10-23 05:50:36.064862	2015-10-23 05:50:36.064862
1704	3	64	22	SHIPMD30	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_113303.jpg	image/jpeg	831749	2015-10-23 05:51:32.688986	active	2015-10-23 05:51:32.70317	2015-10-23 05:51:32.70317
1705	3	64	22	SHIPMD31	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_113329.jpg	image/jpeg	948219	2015-10-23 05:52:23.678256	active	2015-10-23 05:52:23.692625	2015-10-23 05:52:23.692625
1706	3	64	22	SHIPMD32	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151016_113551.jpg	image/jpeg	794435	2015-10-23 05:53:32.671608	active	2015-10-23 05:53:32.68609	2015-10-23 05:53:32.68609
1707	3	64	22	SHIPMD33	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_113610.jpg	image/jpeg	756733	2015-10-23 05:54:26.600981	active	2015-10-23 05:54:26.615408	2015-10-23 05:54:26.615408
1708	3	64	22	SHIPMD34	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_113654.jpg	image/jpeg	654695	2015-10-23 05:55:16.515147	active	2015-10-23 05:55:16.528848	2015-10-23 05:55:16.528848
1709	3	64	22	SHIPMD35	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_113751.jpg	image/jpeg	570785	2015-10-23 05:56:12.212524	active	2015-10-23 05:56:12.226093	2015-10-23 05:56:12.226093
1710	3	64	22	SHIPMD36	ROMANIA	9.00	<p>Medium size Ship stamp of Romania</p>\r\n	IMG_20151016_113843.jpg	image/jpeg	854588	2015-10-23 05:57:06.523703	active	2015-10-23 05:57:06.538986	2015-10-23 05:57:06.538986
1711	3	64	22	SHIPMD37	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_113924.jpg	image/jpeg	868996	2015-10-23 05:58:06.386225	active	2015-10-23 05:58:06.400753	2015-10-23 05:58:06.400753
1712	3	64	22	SHIPMD38	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_113937.jpg	image/jpeg	901086	2015-10-23 05:59:03.462516	active	2015-10-23 05:59:03.477447	2015-10-23 05:59:03.477447
1713	3	64	22	SHIPMD39	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_113957.jpg	image/jpeg	873649	2015-10-23 06:00:08.534067	active	2015-10-23 06:00:08.548567	2015-10-23 06:00:08.548567
1714	3	64	22	SHIPMD40	SINGAPORE	9.00	<p>Medium size Ship stamp of Singapore</p>\r\n	IMG_20151016_114028.jpg	image/jpeg	911795	2015-10-23 06:01:07.522618	active	2015-10-23 06:01:07.537464	2015-10-23 06:01:07.537464
1715	3	64	22	SHIPMD41	TOGO	9.00	<p>Medium size Ship stamp of&nbsp;Togo</p>\r\n	IMG_20151016_114047.jpg	image/jpeg	583082	2015-10-23 06:02:07.002937	active	2015-10-23 06:02:07.016569	2015-10-23 06:02:07.016569
1716	3	64	22	SHIPMD42	CZECHOSLOVAKIA	9.00	<p>Medium size Ship stamp of Czechoslovakia</p>\r\n	IMG_20151016_114107.jpg	image/jpeg	780335	2015-10-23 06:03:16.558461	active	2015-10-23 06:03:16.572415	2015-10-23 06:03:16.572415
1717	3	64	22	SHIPMD43	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_114149.jpg	image/jpeg	938368	2015-10-23 06:04:11.868498	active	2015-10-23 06:04:11.882686	2015-10-23 06:04:11.882686
1718	3	64	22	SHIPMD44	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_114223.jpg	image/jpeg	919792	2015-10-23 06:05:06.108503	active	2015-10-23 06:05:06.122529	2015-10-23 06:05:06.122529
1719	3	64	22	SHIPMD45	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_114339.jpg	image/jpeg	870049	2015-10-23 06:06:25.096574	active	2015-10-23 06:06:25.110968	2015-10-23 06:06:25.110968
1720	3	64	22	SHIPMD46	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_114305.jpg	image/jpeg	1132173	2015-10-23 06:07:27.304606	active	2015-10-23 06:07:27.319675	2015-10-23 06:07:27.319675
1721	3	64	22	SHIPMD48	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_114339.jpg	image/jpeg	870049	2015-10-23 06:08:41.642079	active	2015-10-23 06:08:41.656268	2015-10-23 06:08:41.656268
1722	3	64	22	SHIPMD49	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_114401.jpg	image/jpeg	699981	2015-10-23 06:09:30.643465	active	2015-10-23 06:09:30.657407	2015-10-23 06:09:30.657407
1723	3	64	22	SHIPMD50	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_114502.jpg	image/jpeg	779967	2015-10-23 06:10:28.173671	active	2015-10-23 06:10:28.187981	2015-10-23 06:10:28.187981
1724	3	64	22	SHIPMD51	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_114603.jpg	image/jpeg	917105	2015-10-23 06:11:32.00496	active	2015-10-23 06:11:32.019802	2015-10-23 06:11:32.019802
1725	3	64	22	SHIPMD52	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_114619.jpg	image/jpeg	1011610	2015-10-23 06:12:27.330868	active	2015-10-23 06:12:27.345927	2015-10-23 06:12:27.345927
1726	3	64	22	SHIPMD53	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151016_114645.jpg	image/jpeg	780972	2015-10-23 06:13:24.104886	active	2015-10-23 06:13:24.119271	2015-10-23 06:13:24.119271
1727	3	64	22	SHIPMD54	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_114711.jpg	image/jpeg	775924	2015-10-23 06:14:25.322558	active	2015-10-23 06:14:25.336691	2015-10-23 06:14:25.336691
1728	3	64	22	SHIPMD55	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_114725.jpg	image/jpeg	825974	2015-10-23 06:15:23.10712	active	2015-10-23 06:15:23.121596	2015-10-23 06:15:23.121596
1729	3	64	22	SHIPMD56	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_114743.jpg	image/jpeg	828395	2015-10-23 06:16:12.918377	active	2015-10-23 06:16:12.933314	2015-10-23 06:16:12.933314
1730	3	64	22	SHIPMD57	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_114757.jpg	image/jpeg	861821	2015-10-23 06:17:02.582012	active	2015-10-23 06:17:02.596488	2015-10-23 06:17:02.596488
1731	3	64	22	SHIPMD57	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_114825.jpg	image/jpeg	1051024	2015-10-23 06:18:05.475635	active	2015-10-23 06:18:05.491065	2015-10-23 06:18:05.491065
1732	3	64	22	SHIPMD58	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_114855.jpg	image/jpeg	891362	2015-10-23 07:26:25.829773	active	2015-10-23 07:26:25.846371	2015-10-23 07:26:25.846371
1733	3	64	22	SHIPMD59	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_114950.jpg	image/jpeg	989415	2015-10-23 07:27:46.856845	active	2015-10-23 07:27:46.872665	2015-10-23 07:27:46.872665
1734	3	64	22	SHIPMD60	BULGARIA	9.00	<p>Medium size Ship stamp of Bulgaria</p>\r\n	IMG_20151016_115022.jpg	image/jpeg	778618	2015-10-23 07:28:47.811368	active	2015-10-23 07:28:47.825562	2015-10-23 07:28:47.825562
1735	3	64	22	SHIPMD61	COOK ISLANDS	9.00	<p>Medium size Ship stamp of Cook Islands</p>\r\n	IMG_20151016_115046.jpg	image/jpeg	897014	2015-10-23 07:30:23.411801	active	2015-10-23 07:30:23.426745	2015-10-23 07:30:23.426745
1736	3	64	22	SHIPMD62	AUSTRALIA	9.00	<p>Medium size Ship stamp of Australia</p>\r\n	IMG_20151016_115337.jpg	image/jpeg	1068382	2015-10-23 07:31:36.776472	active	2015-10-23 07:31:36.792272	2015-10-23 07:31:36.792272
1737	3	64	22	SHIPMD63	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_115358.jpg	image/jpeg	1397462	2015-10-23 07:32:37.450192	active	2015-10-23 07:32:37.466701	2015-10-23 07:32:37.466701
1738	3	64	22	SHIPMD64	POLAND	9.00	<p>Medium size Ship stamp of Poland</p>\r\n	IMG_20151016_115416.jpg	image/jpeg	1015762	2015-10-23 07:33:37.561115	active	2015-10-23 07:33:37.576919	2015-10-23 07:33:37.576919
1739	3	64	22	SHIPMD63	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_115430.jpg	image/jpeg	872795	2015-10-23 07:35:51.633955	active	2015-10-23 07:35:51.64946	2015-10-23 07:35:51.64946
1740	3	64	22	SHIPMD64	BULGARIA	9.00	<p>Medium size Ship stamp of Bulgaria</p>\r\n	IMG_20151016_115525.jpg	image/jpeg	795119	2015-10-23 07:37:23.011294	active	2015-10-23 07:37:23.026053	2015-10-23 07:37:23.026053
1741	3	64	22	SHIPMD65	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_115546.jpg	image/jpeg	1146353	2015-10-23 07:39:13.592099	active	2015-10-23 07:39:13.607925	2015-10-23 07:39:13.607925
1742	3	64	22	SHIPMD66	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_115630.jpg	image/jpeg	1273601	2015-10-23 07:40:20.535488	active	2015-10-23 07:40:20.55198	2015-10-23 07:40:20.55198
1743	3	64	22	SHIPMD67	CANADA	9.00	<p>Medium size Ship stamp of Canada</p>\r\n	IMG_20151016_115649.jpg	image/jpeg	845216	2015-10-23 07:41:13.947408	active	2015-10-23 07:41:13.964275	2015-10-23 07:41:13.964275
1744	3	64	22	SHIPMD67	POLAND	9.00	<p>Medium size Ship stamp of Poland</p>\r\n	IMG_20151016_115726.jpg	image/jpeg	895289	2015-10-23 07:42:36.76712	active	2015-10-23 07:42:36.783518	2015-10-23 07:42:36.783518
1745	3	64	22	SHIPMD68	SRI LANKA	9.00	<p>Medium size Ship stamp of Sri Lanka</p>\r\n	IMG_20151016_115821.jpg	image/jpeg	1308568	2015-10-23 07:43:43.639266	active	2015-10-23 07:43:43.655723	2015-10-23 07:43:43.655723
1746	3	64	22	SHIPMD69	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_115849.jpg	image/jpeg	1033512	2015-10-23 07:44:36.249341	active	2015-10-23 07:44:36.264971	2015-10-23 07:44:36.264971
1747	3	64	22	SHIPMD70	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_115916.jpg	image/jpeg	930332	2015-10-23 07:45:43.260799	active	2015-10-23 07:45:43.275873	2015-10-23 07:45:43.275873
1748	3	64	22	SHIPMD71	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_115933.jpg	image/jpeg	831941	2015-10-23 07:46:37.974352	active	2015-10-23 07:46:37.988905	2015-10-23 07:46:37.988905
1749	3	64	22	SHIPMD72	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_120028.jpg	image/jpeg	1289835	2015-10-23 07:47:46.198234	active	2015-10-23 07:47:46.213966	2015-10-23 07:47:46.213966
1750	3	64	22	SHIPMD73	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151016_120452.jpg	image/jpeg	585215	2015-10-23 07:48:48.036559	active	2015-10-23 07:48:48.049996	2015-10-23 07:48:48.049996
1751	3	64	22	SHIPMD74	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_120523.jpg	image/jpeg	968217	2015-10-23 07:52:10.988508	active	2015-10-23 07:52:11.004716	2015-10-23 07:52:11.004716
1752	3	64	22	SHIPMD75	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_120535.jpg	image/jpeg	935137	2015-10-23 07:53:15.48557	active	2015-10-23 07:53:15.50084	2015-10-23 07:53:15.50084
1753	3	64	22	SHIPMD76	GERMANY	9.00	<p>Medium size Ship stamp of Germany</p>\r\n	IMG_20151016_120558.jpg	image/jpeg	1164764	2015-10-23 07:54:22.1395	active	2015-10-23 07:54:22.155007	2015-10-23 07:54:22.155007
1754	3	64	22	SHIPMD77	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_120627.jpg	image/jpeg	980258	2015-10-23 07:55:21.456044	active	2015-10-23 07:55:21.470937	2015-10-23 07:55:21.470937
1755	3	64	22	SHIPMD78	AFGHANISTAN	9.00	<p>Medium size Ship stamp of Afghanistan</p>\r\n	IMG_20151016_120702.jpg	image/jpeg	668684	2015-10-23 07:56:16.592991	active	2015-10-23 07:56:16.608592	2015-10-23 07:56:16.608592
1756	3	64	22	SHIPMD79	DOMINICA	9.00	<p>Medium size Ship stamp of Dominica</p>\r\n	IMG_20151016_120729.jpg	image/jpeg	1040801	2015-10-23 07:57:33.868164	active	2015-10-23 07:57:33.883184	2015-10-23 07:57:33.883184
1757	3	64	22	SHIPMD80	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_120820.jpg	image/jpeg	990374	2015-10-23 07:58:47.137803	active	2015-10-23 07:58:47.152864	2015-10-23 07:58:47.152864
1758	3	64	22	SHIPMD81	ANGUILLA	9.00	<p>Medium size Ship stamp of Anguilla</p>\r\n	IMG_20151016_120851.jpg	image/jpeg	792983	2015-10-23 08:00:41.008575	active	2015-10-23 08:00:41.022973	2015-10-23 08:00:41.022973
1759	3	64	22	SHIPMD82	ST. LUCIA	9.00	<p>Medium size Ship stamp of St. Lucia</p>\r\n	IMG_20151016_120928.jpg	image/jpeg	799097	2015-10-23 08:01:43.986443	active	2015-10-23 08:01:44.000554	2015-10-23 08:01:44.000554
1760	3	64	22	SHIPMD83	DOMINICA	9.00	<p>Medium size Ship stamp of Dominica</p>\r\n	IMG_20151016_120950.jpg	image/jpeg	1183626	2015-10-23 08:02:49.180524	active	2015-10-23 08:02:49.196681	2015-10-23 08:02:49.196681
1761	3	64	22	SHIPMD84	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_121019.jpg	image/jpeg	951577	2015-10-23 10:52:14.315184	active	2015-10-23 10:52:14.33118	2015-10-23 10:52:14.33118
1762	3	64	22	SHIPMD85	ANGUILLA	9.00	<p>Medium size Ship stamp of Anguilla</p>\r\n	IMG_20151016_121034.jpg	image/jpeg	924217	2015-10-23 10:53:31.468019	active	2015-10-23 10:53:31.483307	2015-10-23 10:53:31.483307
1763	3	64	22	SHIPMD86	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_121644_614.jpg	image/jpeg	584096	2015-10-23 10:54:31.432851	active	2015-10-23 10:54:31.4462	2015-10-23 10:54:31.4462
1764	3	64	22	SHIPMD87	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_121710_126.jpg	image/jpeg	593668	2015-10-23 10:55:39.781285	active	2015-10-23 10:55:39.795039	2015-10-23 10:55:39.795039
1765	3	64	22	SHIPMD88	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_121806_327.jpg	image/jpeg	500897	2015-10-23 10:56:25.464203	active	2015-10-23 10:56:25.477485	2015-10-23 10:56:25.477485
1766	3	64	22	SHIPMD88	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_121838_841.jpg	image/jpeg	652227	2015-10-23 10:57:21.016215	active	2015-10-23 10:57:21.030412	2015-10-23 10:57:21.030412
1767	3	64	22	SHIPMD89	CAMBODIA	9.00	<p>Medium size Ship stamp of Cambodia</p>\r\n	IMG_20151016_121951_894.jpg	image/jpeg	532765	2015-10-23 10:58:47.09242	active	2015-10-23 10:58:47.107131	2015-10-23 10:58:47.107131
1768	3	64	22	SHIPMD90	GUINEA PAPUA	9.00	<p>Medium size Ship stamp of Guinea Papua</p>\r\n	IMG_20151016_122017_605.jpg	image/jpeg	541220	2015-10-23 11:00:04.458713	active	2015-10-23 11:00:04.472479	2015-10-23 11:00:04.472479
1769	3	64	22	SHIPMD91	HUNGARY	9.00	<p>Medium size Ship stamp of Hungary</p>\r\n	IMG_20151016_122039_408.jpg	image/jpeg	424340	2015-10-23 11:00:49.979574	active	2015-10-23 11:00:49.992635	2015-10-23 11:00:49.992635
1770	3	64	22	SHIPMD92	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_122703.jpg	image/jpeg	860769	2015-10-23 11:01:50.689679	active	2015-10-23 11:01:50.704606	2015-10-23 11:01:50.704606
1771	3	64	22	SHIPMD93	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_122721.jpg	image/jpeg	1020095	2015-10-23 11:03:20.601946	active	2015-10-23 11:03:20.617476	2015-10-23 11:03:20.617476
1772	3	64	22	SHIPMD95	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_122736.jpg	image/jpeg	887097	2015-10-23 11:04:42.812043	active	2015-10-23 11:04:42.827109	2015-10-23 11:04:42.827109
1773	3	64	22	SHIPMD96	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_122846.jpg	image/jpeg	872422	2015-10-23 11:05:33.798329	active	2015-10-23 11:05:33.813559	2015-10-23 11:05:33.813559
1774	3	64	22	SHIPMD97	MALDIVES	9.00	<p>Medium size Ship stamp of Maldives</p>\r\n	IMG_20151016_122903.jpg	image/jpeg	792516	2015-10-23 11:06:40.496487	active	2015-10-23 11:06:40.511061	2015-10-23 11:06:40.511061
1775	3	64	22	SHIPMD98	GERMANY	9.00	<p>Medium size Ship stamp of Germany</p>\r\n	IMG_20151016_122919.jpg	image/jpeg	717162	2015-10-23 11:08:04.661065	active	2015-10-23 11:08:04.675085	2015-10-23 11:08:04.675085
1776	3	64	22	SHIPMD99	VIETNAM	9.00	<p>Medium size Ship stamp of Vietnam</p>\r\n	IMG_20151016_122933.jpg	image/jpeg	738723	2015-10-23 11:09:07.465648	active	2015-10-23 11:09:07.479373	2015-10-23 11:09:07.479373
1777	3	64	22	SHIPMD100	DOMINICA	9.00	<p>Medium size Ship stamp of Dominica</p>\r\n	IMG_20151016_122950.jpg	image/jpeg	917314	2015-10-23 11:10:51.102824	active	2015-10-23 11:10:51.118254	2015-10-23 11:10:51.118254
1778	3	64	22	SHIPMD100	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_123006.jpg	image/jpeg	870961	2015-10-23 11:11:55.259887	active	2015-10-23 11:11:55.274429	2015-10-23 11:11:55.274429
1779	3	64	22	SHIPMD101	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_123101.jpg	image/jpeg	764551	2015-10-23 11:12:56.895112	active	2015-10-23 11:12:56.909205	2015-10-23 11:12:56.909205
1780	3	64	22	SHIPMD102	LAOS	9.00	<p>Medium size Ship stamp of Laos</p>\r\n	IMG_20151016_123132.jpg	image/jpeg	817087	2015-10-23 11:13:46.941583	active	2015-10-23 11:13:46.956047	2015-10-23 11:13:46.956047
1781	3	64	22	SHIPMD104	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_123149.jpg	image/jpeg	1033709	2015-10-23 11:14:43.980219	active	2015-10-23 11:14:43.996747	2015-10-23 11:14:43.996747
1782	3	64	22	SHIPMD105	POLAND	9.00	<p>Medium size Ship stamp of Poland</p>\r\n	IMG_20151016_123213.jpg	image/jpeg	825802	2015-10-23 11:15:34.445347	active	2015-10-23 11:15:34.460001	2015-10-23 11:15:34.460001
1783	3	64	22	SHIPMD106	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_123229.jpg	image/jpeg	923021	2015-10-23 11:16:28.633334	active	2015-10-23 11:16:28.648022	2015-10-23 11:16:28.648022
1784	3	64	22	SHIPMD107	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_123252.jpg	image/jpeg	1111016	2015-10-23 11:17:27.239664	active	2015-10-23 11:17:27.25501	2015-10-23 11:17:27.25501
1785	3	64	22	SHIPMD108	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_123323.jpg	image/jpeg	984593	2015-10-23 11:18:28.546886	active	2015-10-23 11:18:28.561748	2015-10-23 11:18:28.561748
1786	3	64	22	SHIPMD109	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_123342.jpg	image/jpeg	733000	2015-10-23 11:19:16.001558	active	2015-10-23 11:19:16.015545	2015-10-23 11:19:16.015545
1787	3	64	22	SHIPMD110	TANZANIA	9.00	<p>Medium size Ship stamp of Tanzania</p>\r\n	IMG_20151016_123359.jpg	image/jpeg	940758	2015-10-23 11:20:09.402783	active	2015-10-23 11:20:09.417433	2015-10-23 11:20:09.417433
1788	3	64	22	SHIPMD111	St. Lucia	9.00	<p>Medium size Ship stamp of St. Lucia</p>\r\n	IMG_20151016_123422.jpg	image/jpeg	801816	2015-10-23 11:21:05.051074	active	2015-10-23 11:21:05.065202	2015-10-23 11:21:05.065202
1789	3	64	22	SHIPMD112	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_160601_457.jpg	image/jpeg	523928	2015-10-23 11:22:55.857966	active	2015-10-23 11:22:55.871787	2015-10-23 11:22:55.871787
1790	3	64	22	SHIPMD113	CUBA	9.00	<p>Medium size Ship stamp of Cuba</p>\r\n	IMG_20151016_160631_515.jpg	image/jpeg	641968	2015-10-23 11:23:42.873433	active	2015-10-23 11:23:42.887173	2015-10-23 11:23:42.887173
1791	3	64	22	SHIPMD114	NICARAGUA	9.00	<p>Medium size Ship stamp of Nicaragua</p>\r\n	IMG_20151016_160759_239.jpg	image/jpeg	570194	2015-10-23 11:24:36.009625	active	2015-10-23 11:24:36.023602	2015-10-23 11:24:36.023602
1792	3	64	22	SHIPMD115	GRENADA	9.00	<p>Medium size Ship stamp of Grenada</p>\r\n	IMG_20151016_162609_959.jpg	image/jpeg	479218	2015-10-23 11:26:21.527576	active	2015-10-23 11:26:21.54133	2015-10-23 11:26:21.54133
1793	3	64	23	SPACEBG1	OMAN	13.00	<p>Big size Space &amp; Aeroplane stamp of Oman</p>\r\n	IMG_20151023_180641_964.jpg	image/jpeg	357035	2015-10-26 05:35:20.622774	active	2015-10-26 05:35:20.638167	2015-10-26 05:35:20.638167
1794	3	64	23	SPACEBG2	CHINA	13.00	<p>Big size Space &amp; Aeroplane stamp of China</p>\r\n	IMG_20151023_180750_157.jpg	image/jpeg	576845	2015-10-26 05:36:57.719121	active	2015-10-26 05:36:57.735527	2015-10-26 05:36:57.735527
1795	3	64	23	SPACEBG3	HAITI	13.00	<p>Big size Space &amp; Aeroplane stamp of Haiti</p>\r\n	IMG_20151023_180805_473.jpg	image/jpeg	496725	2015-10-26 05:37:38.478408	active	2015-10-26 05:37:38.493209	2015-10-26 05:37:38.493209
1796	3	64	23	SPACEBG4	HAITI	13.00	<p>Big size Space &amp; Aeroplane stamp of Haiti</p>\r\n	IMG_20151023_180823_600.jpg	image/jpeg	514534	2015-10-26 05:38:19.142666	active	2015-10-26 05:38:19.15811	2015-10-26 05:38:19.15811
1797	3	64	23	SPACEBG5	DUBAI	13.00	<p>Big size Space &amp; Aeroplane stamp of Dubai</p>\r\n	IMG_20151023_180840_320.jpg	image/jpeg	677953	2015-10-26 05:39:06.064135	active	2015-10-26 05:39:06.079245	2015-10-26 05:39:06.079245
1798	3	64	23	SPACEBG6	SINGAPORE	13.00	<p>Big size Space &amp; Aeroplane stamp of Singapore</p>\r\n	IMG_20151023_180927_610.jpg	image/jpeg	650134	2015-10-26 05:40:30.970083	active	2015-10-26 05:40:30.985969	2015-10-26 05:40:30.985969
1799	3	64	23	SPACEBG7	ARABIA	13.00	<p>Big size Space &amp; Aeroplane stamp of Arabia</p>\r\n	IMG_20151023_180941_442.jpg	image/jpeg	828278	2015-10-26 05:41:51.545755	active	2015-10-26 05:41:51.562686	2015-10-26 05:41:51.562686
1800	3	64	23	SPACEBG8	CHINA	13.00	<p>Big size Space &amp; Aeroplane stamp of China</p>\r\n	IMG_20151023_180957_203.jpg	image/jpeg	605595	2015-10-26 05:42:45.938406	active	2015-10-26 05:42:45.953541	2015-10-26 05:42:45.953541
1801	3	64	23	SPACEBG9	HAITI	13.00	<p>Big size Space &amp; Aeroplane stamp of Haiti</p>\r\n	IMG_20151023_182151.jpg	image/jpeg	1634077	2015-10-26 05:44:16.298965	active	2015-10-26 05:44:16.317547	2015-10-26 05:44:16.317547
1802	3	64	23	SPACEBG10	NICARAGUA	13.00	<p>Big size Space &amp; Aeroplane stamp of Nicaragua</p>\r\n	IMG_20151023_184422_448.jpg	image/jpeg	597152	2015-10-26 05:44:58.867356	active	2015-10-26 05:44:58.882901	2015-10-26 05:44:58.882901
1803	3	64	23	SPACEBG11	NICARAGUA	13.00	<p>Big size Space &amp; Aeroplane stamp of Nicaragua</p>\r\n	IMG_20151023_184459_734.jpg	image/jpeg	500946	2015-10-26 05:45:58.465608	active	2015-10-26 05:45:58.480081	2015-10-26 05:45:58.480081
1804	3	64	23	SPACEBG13	NICARAGUA	13.00	<p>Big size Space &amp; Aeroplane stamp of Nicaragua</p>\r\n	IMG_20151023_184519_899.jpg	image/jpeg	457839	2015-10-26 05:46:51.54199	active	2015-10-26 05:46:51.560098	2015-10-26 05:46:51.560098
1805	3	64	23	SPACEBG12	POLAND	13.00	<p>Big size Space &amp; Aeroplane stamp of Poland</p>\r\n	IMG_20151023_184917_466.jpg	image/jpeg	581248	2015-10-26 05:47:37.472285	active	2015-10-26 05:47:37.487687	2015-10-26 05:47:37.487687
1806	3	64	23	SPACEBG13	POLAND	13.00	<p>Big size Space &amp; Aeroplane stamp of Poland</p>\r\n	IMG_20151023_185002_871.jpg	image/jpeg	516612	2015-10-26 05:48:29.978142	active	2015-10-26 05:48:29.996436	2015-10-26 05:48:29.996436
1807	3	64	23	SPACEMD1	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_180338_751.jpg	image/jpeg	494834	2015-10-26 05:53:18.413284	active	2015-10-26 05:53:18.428881	2015-10-26 05:53:18.428881
1808	3	64	23	SPACEMD2	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_180355_057.jpg	image/jpeg	534049	2015-10-26 05:54:06.05389	active	2015-10-26 05:54:06.068442	2015-10-26 05:54:06.068442
1809	3	64	23	SPACEMD3	QATAR	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Qatar</p>\r\n	IMG_20151023_180440_916.jpg	image/jpeg	570034	2015-10-26 05:54:58.864545	active	2015-10-26 05:54:58.879946	2015-10-26 05:54:58.879946
1810	3	64	23	SPACEMD4	GRENADA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Grenada</p>\r\n	IMG_20151023_180501_753.jpg	image/jpeg	366258	2015-10-26 05:55:42.078902	active	2015-10-26 05:55:42.093062	2015-10-26 05:55:42.093062
1811	3	64	23	SPACEMD5	MANAMA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Manama</p>\r\n	IMG_20151023_180525_628.jpg	image/jpeg	576051	2015-10-26 05:56:34.511353	active	2015-10-26 05:56:34.526582	2015-10-26 05:56:34.526582
1812	3	64	23	SPACEMD6	DUBAI	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Dubai</p>\r\n	IMG_20151023_180609_428.jpg	image/jpeg	596863	2015-10-26 05:57:24.532087	active	2015-10-26 05:57:24.546205	2015-10-26 05:57:24.546205
1813	3	64	23	SPACEMD7	POLAND	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Poland</p>\r\n	IMG_20151023_181015_253.jpg	image/jpeg	518672	2015-10-26 05:58:07.190029	active	2015-10-26 05:58:07.205252	2015-10-26 05:58:07.205252
1814	3	64	23	SPACEMD8	MONGOLIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Mongolia</p>\r\n	IMG_20151023_182313_494.jpg	image/jpeg	378811	2015-10-26 05:58:55.55559	active	2015-10-26 05:58:55.570202	2015-10-26 05:58:55.570202
1815	3	64	23	SPACEMD9	ITALY	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Italy</p>\r\n	IMG_20151023_182422_177.jpg	image/jpeg	269778	2015-10-26 05:59:52.187476	active	2015-10-26 05:59:52.201781	2015-10-26 05:59:52.201781
1816	3	64	23	SPACEMD10	GRENADA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Grenada</p>\r\n	IMG_20151023_182508_417.jpg	image/jpeg	359798	2015-10-26 06:00:40.886629	active	2015-10-26 06:00:40.900519	2015-10-26 06:00:40.900519
1817	3	64	23	SPACEMD10	GERMANY	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Germany</p>\r\n	IMG_20151023_182525_311.jpg	image/jpeg	392192	2015-10-26 06:01:30.845918	active	2015-10-26 06:01:30.863115	2015-10-26 06:01:30.863115
1818	3	64	23	SPACEMD11	GRENADA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Grenada</p>\r\n	IMG_20151023_182548_267.jpg	image/jpeg	550354	2015-10-26 06:02:21.245063	active	2015-10-26 06:02:21.26033	2015-10-26 06:02:21.26033
1819	3	64	23	SPACEMD12	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_182621_723.jpg	image/jpeg	453232	2015-10-26 06:03:07.296949	active	2015-10-26 06:03:07.311742	2015-10-26 06:03:07.311742
1820	3	64	23	SPACEMD14	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_182639_801.jpg	image/jpeg	469377	2015-10-26 06:04:02.417553	active	2015-10-26 06:04:02.431447	2015-10-26 06:04:02.431447
1821	3	64	23	SPACEMD15	GRENADA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Grenada</p>\r\n	IMG_20151023_182658_517.jpg	image/jpeg	436839	2015-10-26 06:05:09.221992	active	2015-10-26 06:05:09.238082	2015-10-26 06:05:09.238082
1822	3	64	23	SPACEMD16	HUNGARY	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Hungary</p>\r\n	IMG_20151023_182751_440.jpg	image/jpeg	316628	2015-10-26 06:06:08.784221	active	2015-10-26 06:06:08.798397	2015-10-26 06:06:08.798397
1823	3	64	23	SPACEMD17	GERMANY	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Germany</p>\r\n	IMG_20151023_182812_833.jpg	image/jpeg	276271	2015-10-26 06:06:53.869158	active	2015-10-26 06:06:53.883527	2015-10-26 06:06:53.883527
1824	3	64	23	SPACEMD17	SINGAPORE	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Singapore</p>\r\n	IMG_20151023_183001_086.jpg	image/jpeg	327261	2015-10-26 06:07:49.982656	active	2015-10-26 06:07:49.997282	2015-10-26 06:07:49.997282
1825	3	64	23	SPACEMD18	AUSTRALIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Australia</p>\r\n	IMG_20151023_183016_407.jpg	image/jpeg	522040	2015-10-26 06:08:45.126171	active	2015-10-26 06:08:45.14079	2015-10-26 06:08:45.14079
1826	3	64	23	SPACEMD19	COLOMBIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Colombia</p>\r\n	IMG_20151023_183056_303.jpg	image/jpeg	522477	2015-10-26 06:09:38.781533	active	2015-10-26 06:09:38.796735	2015-10-26 06:09:38.796735
1827	3	64	23	SPACEMD20	AUSTRALIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Australia</p>\r\n	IMG_20151023_183854_025.jpg	image/jpeg	588017	2015-10-26 06:10:27.395751	active	2015-10-26 06:10:27.409766	2015-10-26 06:10:27.409766
1828	3	64	23	SPACEMD21	HUNGARY	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Hungary</p>\r\n	IMG_20151023_183914_623.jpg	image/jpeg	436088	2015-10-26 06:11:16.446114	active	2015-10-26 06:11:16.45983	2015-10-26 06:11:16.45983
1829	3	64	23	SPACEMD22	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_184037_054.jpg	image/jpeg	481354	2015-10-26 06:12:03.853901	active	2015-10-26 06:12:03.870547	2015-10-26 06:12:03.870547
1830	3	64	23	SPACEMD23	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_184057_050.jpg	image/jpeg	417486	2015-10-26 06:12:44.992126	active	2015-10-26 06:12:45.007277	2015-10-26 06:12:45.007277
1873	3	64	24	FLWRBG5	POLAND	13.00	<p>Bigger size Flower stamp of Poland</p>\r\n	IMG_20151024_112246_045.jpg	image/jpeg	562980	2015-10-26 07:06:35.985295	active	2015-10-26 07:06:36.001734	2015-10-26 07:06:36.001734
1831	3	64	23	SPACEMD24	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_184241_762.jpg	image/jpeg	363347	2015-10-26 06:13:36.415096	active	2015-10-26 06:13:36.434463	2015-10-26 06:13:36.434463
1832	3	64	23	SPACEMD25	TANZANIA	9.00	<p>Medium size Space &amp; Aeroplane&nbsp;stamp of Tanzania</p>\r\n	IMG_20151023_184316_808.jpg	image/jpeg	519582	2015-10-26 06:14:20.036055	active	2015-10-26 06:14:20.050559	2015-10-26 06:14:20.050559
1833	3	64	23	SPACESM1	ITALY	6.00	<p>Small size Space &amp; Aeroplanes stamp of Italy</p>\r\n	IMG_20151023_183930_771.jpg	image/jpeg	511160	2015-10-26 06:16:25.466822	active	2015-10-26 06:16:25.480742	2015-10-26 06:16:25.480742
1834	3	64	23	SPACEMD2	ROAMNIA	6.00	<p>Small size Space &amp; Aeroplanes stamp of Romania</p>\r\n	IMG_20151023_184004_192.jpg	image/jpeg	437576	2015-10-26 06:17:26.111794	active	2015-10-26 06:17:26.126279	2015-10-26 06:17:26.126279
1835	3	64	23	SPACESM3	ROMANIA	6.00	<p>Small size Space &amp; Aeroplanes stamp of Romania</p>\r\n	IMG_20151023_184022_584.jpg	image/jpeg	435302	2015-10-26 06:18:09.179741	active	2015-10-26 06:18:09.193424	2015-10-26 06:18:09.193424
1836	3	64	23	SPACESM4	ITALY	6.00	<p>Small size Space &amp; Aeroplanes stamp of Italy</p>\r\n	IMG_20151023_184124_845.jpg	image/jpeg	409398	2015-10-26 06:19:11.268269	active	2015-10-26 06:19:11.281515	2015-10-26 06:19:11.281515
1837	3	64	23	SPACESM5	ITALY	6.00	<p>Small size Space &amp; Aeroplanes stamp of Italy</p>\r\n	IMG_20151023_184555_587.jpg	image/jpeg	468119	2015-10-26 06:19:56.358931	active	2015-10-26 06:19:56.376493	2015-10-26 06:19:56.376493
1838	3	64	23	SPACESM6	HONDURAS	6.00	<p>Small size Space &amp; Aeroplanes stamp of Honduras</p>\r\n	IMG_20151023_184632_797.jpg	image/jpeg	384157	2015-10-26 06:21:04.321382	active	2015-10-26 06:21:04.335912	2015-10-26 06:21:04.335912
1839	3	64	23	SPACESM7	YUGOSLOVIA	6.00	<p>Small size Space &amp; Aeroplanes stamp of Yugoslovia</p>\r\n	IMG_20151023_184651_771.jpg	image/jpeg	469468	2015-10-26 06:22:47.821962	active	2015-10-26 06:22:47.836383	2015-10-26 06:22:47.836383
1840	3	64	23	SPACESM8	ROMANIA	6.00	<p>Small size Space &amp; Aeroplanes stamp of Romania</p>\r\n	IMG_20151023_184723_889.jpg	image/jpeg	298141	2015-10-26 06:23:31.433884	active	2015-10-26 06:23:31.446802	2015-10-26 06:23:31.446802
1841	3	64	23	SPACEMD9	CHINA	6.00	<p>Small size Space &amp; Aeroplanes stamp of China</p>\r\n	IMG_20151023_184815_586.jpg	image/jpeg	250176	2015-10-26 06:24:13.992059	active	2015-10-26 06:24:14.006622	2015-10-26 06:24:14.006622
1842	3	64	23	SPACESM9	USA	6.00	<p>Small size Space &amp; Aeroplanes stamp of USA</p>\r\n	IMG_20151023_184940_362.jpg	image/jpeg	372840	2015-10-26 06:25:03.358054	active	2015-10-26 06:25:03.371862	2015-10-26 06:25:03.371862
1843	3	64	23	SPACESM10	TURKEY	6.00	<p>Small size Space &amp; Aeroplanes stamp of Turkey</p>\r\n	IMG_20151023_185305_197.jpg	image/jpeg	284060	2015-10-26 06:25:51.522154	active	2015-10-26 06:25:51.535499	2015-10-26 06:25:51.535499
1844	3	64	24	FLWRVB1	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_104819_266.jpg	image/jpeg	1051578	2015-10-26 06:31:52.703566	active	2015-10-26 06:31:52.719775	2015-10-26 06:31:52.719775
1845	3	64	24	FLWRVB2	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_104841_771.jpg	image/jpeg	1557772	2015-10-26 06:33:11.169432	active	2015-10-26 06:33:11.188468	2015-10-26 06:33:11.188468
1846	3	64	24	FLWRVB3	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_104909_445.jpg	image/jpeg	998708	2015-10-26 06:34:11.075998	active	2015-10-26 06:34:11.092693	2015-10-26 06:34:11.092693
1847	3	64	24	FLWRVB4	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105006_361.jpg	image/jpeg	705419	2015-10-26 06:35:04.629549	active	2015-10-26 06:35:04.645183	2015-10-26 06:35:04.645183
1848	3	64	24	FLWRVB5	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105032_637.jpg	image/jpeg	798016	2015-10-26 06:36:12.388743	active	2015-10-26 06:36:12.404558	2015-10-26 06:36:12.404558
1849	3	64	24	FLWRVB6	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105032_637.jpg	image/jpeg	798016	2015-10-26 06:37:13.757879	active	2015-10-26 06:37:13.774118	2015-10-26 06:37:13.774118
1850	3	64	24	FLWRVB7	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105053_326.jpg	image/jpeg	952774	2015-10-26 06:38:05.186416	active	2015-10-26 06:38:05.202541	2015-10-26 06:38:05.202541
1851	3	64	24	FLWRVB8	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105124_405.jpg	image/jpeg	1041084	2015-10-26 06:39:16.036389	active	2015-10-26 06:39:16.052989	2015-10-26 06:39:16.052989
1852	3	64	24	FLWRVB9	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105150_310.jpg	image/jpeg	947871	2015-10-26 06:40:08.417673	active	2015-10-26 06:40:08.434061	2015-10-26 06:40:08.434061
1853	3	64	24	FLWRVB10	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105207_862.jpg	image/jpeg	1298400	2015-10-26 06:41:08.488095	active	2015-10-26 06:41:08.505653	2015-10-26 06:41:08.505653
1854	3	64	24	FLWRVB11	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105223_038.jpg	image/jpeg	1196598	2015-10-26 06:42:16.545792	active	2015-10-26 06:42:16.563025	2015-10-26 06:42:16.563025
1855	3	64	24	FLWR12	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105500_387.jpg	image/jpeg	895469	2015-10-26 06:43:12.77046	active	2015-10-26 06:43:12.795013	2015-10-26 06:43:12.795013
1856	3	64	24	FLWRVB13	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105630_042.jpg	image/jpeg	632784	2015-10-26 06:44:12.808001	active	2015-10-26 06:44:12.823649	2015-10-26 06:44:12.823649
1857	3	64	24	FLWRVB14	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105726_874.jpg	image/jpeg	968523	2015-10-26 06:45:25.099896	active	2015-10-26 06:45:25.11631	2015-10-26 06:45:25.11631
1858	3	64	24	FLWRVB15	AJMAN	25.00	<p>Bigger size Flower stamp of Ajman</p>\r\n	IMG_20151024_105744_890.jpg	image/jpeg	1016928	2015-10-26 06:46:19.737148	active	2015-10-26 06:46:19.754189	2015-10-26 06:46:19.754189
1859	3	64	24	FLWRVB16	NICARAGUA	25.00	<p>Bigger size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_110018_135.jpg	image/jpeg	750016	2015-10-26 06:47:23.792239	active	2015-10-26 06:47:23.80918	2015-10-26 06:47:23.80918
1860	3	64	24	FLWRVB17	NICARAGUA	25.00	<p>Bigger size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_110043_619.jpg	image/jpeg	564789	2015-10-26 06:49:35.90847	active	2015-10-26 06:49:35.924082	2015-10-26 06:49:35.924082
1861	3	64	24	FLWRVB18	HUNGARY	25.00	<p>Bigger size Flower stamp of Hungary</p>\r\n	IMG_20151024_110112_142.jpg	image/jpeg	624689	2015-10-26 06:50:39.021305	active	2015-10-26 06:50:39.036875	2015-10-26 06:50:39.036875
1862	3	64	24	FLWRVB19	BENIN	25.00	<p>Bigger size Flower stamp of Benin</p>\r\n	IMG_20151024_110130_215.jpg	image/jpeg	722119	2015-10-26 06:52:38.165128	active	2015-10-26 06:52:38.181168	2015-10-26 06:52:38.181168
1863	3	64	24	FLWRVB20	NICARAGUA	25.00	<p>Bigger size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_110154_073.jpg	image/jpeg	592391	2015-10-26 06:53:46.893748	active	2015-10-26 06:53:46.909248	2015-10-26 06:53:46.909248
1864	3	64	24	FLWRVB21	NICARAGUA	25.00	<p>Bigger size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_110248_673.jpg	image/jpeg	797764	2015-10-26 06:54:43.299443	active	2015-10-26 06:54:43.31518	2015-10-26 06:54:43.31518
1865	3	64	24	FLWRVB22	MONGOLIA	25.00	<p>Bigger size Flower stamp of Mongolia</p>\r\n	IMG_20151024_111835_152.jpg	image/jpeg	821454	2015-10-26 06:56:20.225241	active	2015-10-26 06:56:20.241378	2015-10-26 06:56:20.241378
1866	3	64	24	FLWRVB23	NICARAGUA	25.00	<p>Bigger size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_111927_904.jpg	image/jpeg	549585	2015-10-26 06:57:21.399477	active	2015-10-26 06:57:21.414835	2015-10-26 06:57:21.414835
1867	3	64	24	FLWRVB24	MONGOLIA	25.00	<p>Bigger size Flower stamp of Mongolia</p>\r\n	IMG_20151024_111958_323.jpg	image/jpeg	432010	2015-10-26 06:58:25.330072	active	2015-10-26 06:58:25.344604	2015-10-26 06:58:25.344604
1868	3	64	24	FLWRVB25	MONGOLIA	25.00	<p>Bigger size Flower stamp of Mongolia</p>\r\n	IMG_20151024_125159_714.jpg	image/jpeg	415763	2015-10-26 06:59:25.195535	active	2015-10-26 06:59:25.210013	2015-10-26 06:59:25.210013
1869	3	64	24	FLWRBG1	UMM-AL-QIWAIN	13.00	<p>Big&nbsp;size Flower stamp of Qiwain</p>\r\n	IMG_20151024_105947_692.jpg	image/jpeg	785340	2015-10-26 07:02:25.263208	active	2015-10-26 07:02:25.279215	2015-10-26 07:02:25.279215
1870	3	64	24	FLWRBG2	LAOS	13.00	<p>Bigger size Flower stamp of Laos</p>\r\n	IMG_20151024_112048_387.jpg	image/jpeg	820154	2015-10-26 07:03:27.293812	active	2015-10-26 07:03:27.309889	2015-10-26 07:03:27.309889
1871	3	64	24	FLWRBG3	ROMANIA	13.00	<p>Bigger size Flower stamp of Romania</p>\r\n	IMG_20151024_112117_072.jpg	image/jpeg	734316	2015-10-26 07:04:22.937515	active	2015-10-26 07:04:22.96146	2015-10-26 07:04:22.96146
1872	3	64	24	FLWRBG4	CZECHOSLOVAKIA	13.00	<p>Bigger size Flower stamp of Czechoslovakia</p>\r\n	IMG_20151024_112230_381.jpg	image/jpeg	892248	2015-10-26 07:05:43.277996	active	2015-10-26 07:05:43.294297	2015-10-26 07:05:43.294297
1874	3	64	24	FLWRBG6	UGANDA	13.00	<p>Bigger size Flower stamp of Uganda</p>\r\n	IMG_20151024_112300_761.jpg	image/jpeg	698373	2015-10-26 07:07:49.546608	active	2015-10-26 07:07:49.562234	2015-10-26 07:07:49.562234
1875	3	64	24	FLWRBG7	KENYA	13.00	<p>Big&nbsp;size Flower stamp of Kenya</p>\r\n	IMG_20151024_112431_358.jpg	image/jpeg	480791	2015-10-26 07:11:16.250975	active	2015-10-26 07:11:16.26746	2015-10-26 07:11:16.26746
1876	3	64	24	FLWRBG8	CAMBODIA	13.00	<p>Big&nbsp;size Flower stamp of Cambodia</p>\r\n	IMG_20151024_112505_483.jpg	image/jpeg	934695	2015-10-26 07:12:26.229833	active	2015-10-26 07:12:26.246553	2015-10-26 07:12:26.246553
1877	3	64	24	FLWRBG9	LAOS	13.00	<p>Big&nbsp;size Flower stamp of Laos</p>\r\n	IMG_20151024_112522_402.jpg	image/jpeg	838217	2015-10-26 07:14:15.069807	active	2015-10-26 07:14:15.086552	2015-10-26 07:14:15.086552
1878	3	64	24	FLWRBG10	CAMBODIA	13.00	<p>Big&nbsp;size Flower stamp of Cambodia</p>\r\n	IMG_20151024_112540_528.jpg	image/jpeg	910826	2015-10-26 07:15:35.750983	active	2015-10-26 07:15:35.7676	2015-10-26 07:15:35.7676
1879	3	64	24	FLWRBG11	CAMBODIA	13.00	<p>Big&nbsp;size Flower stamp of Cambodia</p>\r\n	IMG_20151024_112606_188.jpg	image/jpeg	700151	2015-10-26 07:18:11.128208	active	2015-10-26 07:18:11.1443	2015-10-26 07:18:11.1443
1880	3	64	24	FLWRBG12	LAOS	13.00	<p>Big&nbsp;size Flower stamp of Laos</p>\r\n	IMG_20151024_113135.jpg	image/jpeg	2163613	2015-10-26 07:20:31.331852	active	2015-10-26 07:20:31.352306	2015-10-26 07:20:31.352306
1881	3	64	24	FLWRBG13	CONGO	13.00	<p>Big&nbsp;size Flower stamp of Congo</p>\r\n	IMG_20151024_113406.jpg	image/jpeg	2258205	2015-10-26 07:21:55.974072	active	2015-10-26 07:21:55.996062	2015-10-26 07:21:55.996062
1882	3	64	24	FLWRBG14	CUBA	13.00	<p>Big&nbsp;size Flower stamp of Cuba</p>\r\n	IMG_20151024_113653_414.jpg	image/jpeg	863355	2015-10-26 07:23:01.553939	active	2015-10-26 07:23:01.570236	2015-10-26 07:23:01.570236
1883	3	64	24	FLWRBG16	TCHAD	13.00	<p>Big&nbsp;size Flower stamp of Tchad</p>\r\n	IMG_20151024_113818_187.jpg	image/jpeg	910873	2015-10-26 07:24:56.442079	active	2015-10-26 07:24:56.458783	2015-10-26 07:24:56.458783
1884	3	64	24	FLWRBG17	MONGOLIA	13.00	<p>Big&nbsp;size Flower stamp of Mongolia</p>\r\n	IMG_20151024_113839_986.jpg	image/jpeg	750341	2015-10-26 07:26:05.165214	active	2015-10-26 07:26:05.180803	2015-10-26 07:26:05.180803
1885	3	64	24	FLWRBG18	LAOS	13.00	<p>Big&nbsp;size Flower stamp of Laos</p>\r\n	IMG_20151024_113855_762.jpg	image/jpeg	737669	2015-10-26 07:27:58.171913	active	2015-10-26 07:27:58.188411	2015-10-26 07:27:58.188411
1886	3	64	24	FLWRBG19	LAOS	13.00	<p>Big&nbsp;size Flower stamp of Laos</p>\r\n	IMG_20151024_113909_796.jpg	image/jpeg	1070855	2015-10-26 07:29:10.345143	active	2015-10-26 07:29:10.363255	2015-10-26 07:29:10.363255
1887	3	64	24	FLWRBG20	MONGOLIA	13.00	<p>Big&nbsp;size Flower stamp of Mongolia</p>\r\n	IMG_20151024_113924_671.jpg	image/jpeg	963291	2015-10-26 07:30:17.341115	active	2015-10-26 07:30:17.357603	2015-10-26 07:30:17.357603
1888	3	64	24	FLWRBG21	MONGOLIA	13.00	<p>Big&nbsp;size Flower stamp of Mongolia</p>\r\n	IMG_20151024_113945_039.jpg	image/jpeg	996610	2015-10-26 07:31:17.498623	active	2015-10-26 07:31:17.514843	2015-10-26 07:31:17.514843
1889	3	64	24	FLWRBG22	MONGOLIA	13.00	<p>Big&nbsp;size Flower stamp of Mongolia</p>\r\n	IMG_20151024_114040_801.jpg	image/jpeg	764602	2015-10-26 07:32:18.271028	active	2015-10-26 07:32:18.287317	2015-10-26 07:32:18.287317
1890	3	64	24	FLWRBG23	SOUTH KOREA	13.00	<p>Big&nbsp;size Flower stamp of South Korea</p>\r\n	IMG_20151024_114055_441.jpg	image/jpeg	886994	2015-10-26 07:33:23.615377	active	2015-10-26 07:33:23.631169	2015-10-26 07:33:23.631169
1891	3	64	24	FLWRBG24	CUBA	13.00	<p>Big&nbsp;size Flower stamp of Cuba</p>\r\n	IMG_20151024_114142_081.jpg	image/jpeg	905099	2015-10-26 07:34:21.500666	active	2015-10-26 07:34:21.51652	2015-10-26 07:34:21.51652
1892	3	64	24	FLWRBG25	VIETNAM	13.00	<p>Big&nbsp;size Flower stamp of Vietnam</p>\r\n	IMG_20151024_114155_303.jpg	image/jpeg	679597	2015-10-26 07:35:33.235498	active	2015-10-26 07:35:33.251377	2015-10-26 07:35:33.251377
1893	3	64	24	FLWRSM1	NORWAY	6.00	<p>Small size Flower stamp of Norway</p>\r\n	IMG_20151024_164221_511.jpg	image/jpeg	321203	2015-10-26 07:51:58.739638	active	2015-10-26 07:51:58.754485	2015-10-26 07:51:58.754485
1894	3	64	24	FLWRSM2	USA	6.00	<p>Small size Flower stamp of USA</p>\r\n	IMG_20151024_164238_804.jpg	image/jpeg	339023	2015-10-26 07:52:53.332576	active	2015-10-26 07:52:53.346562	2015-10-26 07:52:53.346562
1895	3	64	24	FLWRSM3	NEW ZEALAND	6.00	<p>Small&nbsp;size Flower stamp of New Zealand</p>\r\n	IMG_20151024_164717_688.jpg	image/jpeg	467730	2015-10-26 07:54:33.817812	active	2015-10-26 07:54:33.832901	2015-10-26 07:54:33.832901
1896	3	64	24	FLWRSM4	NORWAY	6.00	<p>Small size Flower stamp of Norway</p>\r\n	IMG_20151024_164802_535.jpg	image/jpeg	561279	2015-10-26 10:54:03.550728	active	2015-10-26 10:54:03.566426	2015-10-26 10:54:03.566426
1897	3	64	24	FLWRSM5	NORWAY	6.00	<p>Small size Flower stamp of Norway</p>\r\n	IMG_20151024_164817_705.jpg	image/jpeg	548461	2015-10-26 10:54:58.150119	active	2015-10-26 10:54:58.165432	2015-10-26 10:54:58.165432
1898	3	64	24	FLWRSM6	SWITZERLAND	6.00	<p>Small size Flower stamp of Switzerland</p>\r\n	IMG_20151024_164837_933.jpg	image/jpeg	647175	2015-10-26 10:55:58.565349	active	2015-10-26 10:55:58.581166	2015-10-26 10:55:58.581166
1899	3	64	24	FLWRSM7	GERMANY	6.00	<p>Small size Flower stamp of Germany</p>\r\n	IMG_20151024_173856_688.jpg	image/jpeg	466026	2015-10-26 10:57:03.597106	active	2015-10-26 10:57:03.611979	2015-10-26 10:57:03.611979
1900	3	64	24	FLWRSM8	SWITZERLAND	6.00	<p>Small size Flower stamp of Switzerland</p>\r\n	IMG_20151024_173910_658.jpg	image/jpeg	508514	2015-10-26 10:57:58.504647	active	2015-10-26 10:57:58.520888	2015-10-26 10:57:58.520888
1901	3	64	24	FLWRSM9	NEW ZEALAND	6.00	<p>Small size Flower stamp of New Zealand</p>\r\n	IMG_20151024_173925_428.jpg	image/jpeg	453479	2015-10-26 10:59:03.576459	active	2015-10-26 10:59:03.591034	2015-10-26 10:59:03.591034
1902	3	64	24	FLWRSM10	SRI LANKA	6.00	<p>Small size Flower stamp of Sri Lanka</p>\r\n	IMG_20151024_174006_712.jpg	image/jpeg	602790	2015-10-26 11:00:23.894389	active	2015-10-26 11:00:23.90976	2015-10-26 11:00:23.90976
1903	3	64	24	FLWRSM11	SWITZERLAND	6.00	<p>Small size Flower stamp of Switzerland</p>\r\n	IMG_20151024_174027_034.jpg	image/jpeg	532538	2015-10-26 11:01:28.623957	active	2015-10-26 11:01:28.638497	2015-10-26 11:01:28.638497
1904	3	64	24	FLWRSM12	NIPPON	6.00	<p>Small size Flower stamp of Nippon</p>\r\n	IMG_20151024_182707_080.jpg	image/jpeg	348641	2015-10-26 11:02:33.702207	active	2015-10-26 11:02:33.716674	2015-10-26 11:02:33.716674
1905	3	64	24	FLWRSM13	POLAND	6.00	<p>Small size Flower stamp of Poland</p>\r\n	IMG_20151024_182725_656.jpg	image/jpeg	325871	2015-10-26 11:03:50.869895	active	2015-10-26 11:03:50.884769	2015-10-26 11:03:50.884769
1906	3	64	24	FLWRSM14	NORWAY	6.00	<p>Small size Flower stamp of Norway</p>\r\n	IMG_20151024_182744_788.jpg	image/jpeg	290668	2015-10-26 11:05:24.431901	active	2015-10-26 11:05:24.446053	2015-10-26 11:05:24.446053
1907	3	64	24	FLWRSM15	NORWAY	6.00	<p>Small size Flower stamp of Norway</p>\r\n	IMG_20151024_182838_675.jpg	image/jpeg	271351	2015-10-26 11:06:40.963538	active	2015-10-26 11:06:40.977464	2015-10-26 11:06:40.977464
1908	3	64	24	FLWRSM16	CANADA	6.00	<p>Small size Flower stamp of Canada</p>\r\n	IMG_20151024_182943_567.jpg	image/jpeg	267201	2015-10-26 11:07:32.765548	active	2015-10-26 11:07:32.77946	2015-10-26 11:07:32.77946
1909	3	64	24	FLWRSM17	USA	6.00	<p>Small size Flower stamp of USA</p>\r\n	IMG_20151024_183000_056.jpg	image/jpeg	353626	2015-10-26 11:08:17.910033	active	2015-10-26 11:08:17.924582	2015-10-26 11:08:17.924582
1910	3	64	24	FLWRSM18	CANADA	6.00	<p>Small size Flower stamp of Canada</p>\r\n	IMG_20151024_183024_572.jpg	image/jpeg	365884	2015-10-26 11:09:07.496238	active	2015-10-26 11:09:07.510656	2015-10-26 11:09:07.510656
1911	3	64	24	FLWRSM19	CANADA	6.00	<p>Small size Flower stamp of Canada</p>\r\n	IMG_20151024_183045_487.jpg	image/jpeg	309668	2015-10-26 11:09:56.94902	active	2015-10-26 11:09:56.962532	2015-10-26 11:09:56.962532
1912	3	64	24	FLWRMD1	HUNGARY	9.00	<p>Medium size Flower stamp of Hungary</p>\r\n	IMG_20151024_124449_049.jpg	image/jpeg	935120	2015-10-26 11:12:39.77111	active	2015-10-26 11:12:39.788747	2015-10-26 11:12:39.788747
1913	3	64	24	FLWRSM2	DAHOMEY	9.00	<p>Medium size Flower stamp of Dahomey</p>\r\n	IMG_20151024_124503_186.jpg	image/jpeg	674217	2015-10-26 11:14:13.000024	active	2015-10-26 11:14:13.015454	2015-10-26 11:14:13.015454
1914	3	64	24	FLWRMD3	CHINA	9.00	<p>Medium size Flower stamp of China</p>\r\n	IMG_20151024_164048_026.jpg	image/jpeg	677627	2015-10-26 11:15:03.791389	active	2015-10-26 11:15:03.806263	2015-10-26 11:15:03.806263
1915	3	64	24	FLWRMD4	PERU	9.00	<p>Medium size Flower stamp of Peru</p>\r\n	IMG_20151024_164104_415.jpg	image/jpeg	610269	2015-10-26 11:15:47.525892	active	2015-10-26 11:15:47.541457	2015-10-26 11:15:47.541457
1916	3	64	24	FLWRMD5	AUSTRALIA	9.00	<p>Medium size Flower stamp of Australia</p>\r\n	IMG_20151024_164135_935.jpg	image/jpeg	538057	2015-10-26 11:16:58.163349	active	2015-10-26 11:16:58.178493	2015-10-26 11:16:58.178493
1917	3	64	24	FLWRSM6	GERMANY	9.00	<p>Medium size Flower stamp of Germany</p>\r\n	IMG_20151024_164154_279.jpg	image/jpeg	470646	2015-10-26 11:18:22.393882	active	2015-10-26 11:18:22.408934	2015-10-26 11:18:22.408934
1918	3	64	24	FLWRMD7	AUSTRALIA	9.00	<p>Medium size Flower stamp of Australia</p>\r\n	IMG_20151024_164253_383.jpg	image/jpeg	570044	2015-10-26 11:19:14.509942	active	2015-10-26 11:19:14.52506	2015-10-26 11:19:14.52506
1919	3	64	24	FLWRMD8	LAOS	9.00	<p>Medium size Flower stamp of Laos</p>\r\n	IMG_20151024_164334_355.jpg	image/jpeg	570158	2015-10-26 11:20:14.793832	active	2015-10-26 11:20:14.808716	2015-10-26 11:20:14.808716
1920	3	64	24	FLWRSM9	DHUFAR	9.00	<p>Medium size Flower stamp of Dhufar</p>\r\n	IMG_20151024_164347_850.jpg	image/jpeg	736680	2015-10-26 11:21:41.903923	active	2015-10-26 11:21:41.919766	2015-10-26 11:21:41.919766
1921	3	64	24	FLWRSM10	AUSTRALIA	9.00	<p>Medium size Flower stamp of Australia</p>\r\n	IMG_20151024_164411_534.jpg	image/jpeg	337103	2015-10-26 11:22:42.739365	active	2015-10-26 11:22:42.753481	2015-10-26 11:22:42.753481
1922	3	64	24	FLWRSM12	BELGIUM	9.00	<p>Medium size Flower stamp of Belgium</p>\r\n	IMG_20151024_164515_694.jpg	image/jpeg	384090	2015-10-26 11:24:13.353783	active	2015-10-26 11:24:13.368861	2015-10-26 11:24:13.368861
1923	3	64	24	FLWRSM13	DHUFAR	9.00	<p>Medium size Flower stamp of Dhufar</p>\r\n	IMG_20151024_164550_234.jpg	image/jpeg	472330	2015-10-26 11:25:14.782179	active	2015-10-26 11:25:14.796822	2015-10-26 11:25:14.796822
1924	3	64	24	FLWRSM14	DHUFAR	9.00	<p>Medium size Flower stamp of Dhufar</p>\r\n	IMG_20151024_164620_537.jpg	image/jpeg	547366	2015-10-26 11:26:37.700671	active	2015-10-26 11:26:37.715396	2015-10-26 11:26:37.715396
1925	3	64	24	FLWRSM15	MALAYSIA	9.00	<p>Medium size Flower stamp of Malaysia</p>\r\n	IMG_20151024_164635_802.jpg	image/jpeg	459954	2015-10-26 11:27:59.803918	active	2015-10-26 11:27:59.818531	2015-10-26 11:27:59.818531
1926	3	64	24	FLWRSM16	NORWAY	9.00	<p>Medium size Flower stamp of Norway</p>\r\n	IMG_20151024_164748_903.jpg	image/jpeg	478226	2015-10-26 11:29:06.947056	active	2015-10-26 11:29:06.961759	2015-10-26 11:29:06.961759
1927	3	64	24	FLWRSM17	CANADA	9.00	<p>Medium size Flower stamp of Canada</p>\r\n	IMG_20151024_164854_111.jpg	image/jpeg	870338	2015-10-26 11:30:36.053415	active	2015-10-26 11:30:36.070978	2015-10-26 11:30:36.070978
1928	3	64	24	FLWRSM18	SWITZERLAND	9.00	<p>Medium size Flower stamp of Switzerland</p>\r\n	IMG_20151024_164908_713.jpg	image/jpeg	715783	2015-10-26 11:32:15.866983	active	2015-10-26 11:32:15.883045	2015-10-26 11:32:15.883045
1929	3	64	24	FLWRSM19	NICARAGUA	9.00	<p>Medium size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_164927_794.jpg	image/jpeg	571823	2015-10-26 11:33:20.110231	active	2015-10-26 11:33:20.125535	2015-10-26 11:33:20.125535
1930	3	64	24	FLWRSM21	NICARAGUA	9.00	<p>Medium size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_164946_178.jpg	image/jpeg	461107	2015-10-26 11:34:30.257149	active	2015-10-26 11:34:30.272425	2015-10-26 11:34:30.272425
1931	3	64	24	FLWRSM22	NICARAGUA	9.00	<p>Medium size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_165009_198.jpg	image/jpeg	581151	2015-10-26 11:35:54.095347	active	2015-10-26 11:35:54.110411	2015-10-26 11:35:54.110411
1932	3	64	24	FLWRSM23	NICARAGUA	9.00	<p>Medium size Flower stamp of Nicaragua</p>\r\n	IMG_20151024_165121_666.jpg	image/jpeg	642060	2015-10-26 11:37:26.809717	active	2015-10-26 11:37:26.825208	2015-10-26 11:37:26.825208
1933	3	64	24	FLWRSM24	NORWAY	9.00	<p>Medium size Flower stamp of Norway</p>\r\n	IMG_20151024_165200_717.jpg	image/jpeg	418822	2015-10-26 11:39:04.978542	active	2015-10-26 11:39:04.992841	2015-10-26 11:39:04.992841
1934	3	64	24	FLWRSM25	POLAND	9.00	<p>Medium size Flower stamp of Poland</p>\r\n	IMG_20151024_165239_262.jpg	image/jpeg	572296	2015-10-26 11:40:02.257248	active	2015-10-26 11:40:02.271823	2015-10-26 11:40:02.271823
1935	3	18	5	MSTF1	SWEDEN	80.00	<p>Sheet of 8 Flowers&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_110010_401.jpg	image/jpeg	1070417	2015-10-28 11:29:02.466025	active	2015-10-28 11:29:02.484394	2015-10-28 11:29:02.484394
1936	3	18	5	MSTF2	OMAN	80.00	<p>Sheet of 8 Flowers&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_110350_952.jpg	image/jpeg	1001900	2015-10-28 11:30:52.760819	active	2015-10-28 11:30:52.833835	2015-10-28 11:30:52.833835
1937	3	18	5	MSTF3	SCOTLAND	90.00	<p>Sheet of 8 Flowers&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_113202_782.jpg	image/jpeg	961410	2015-10-28 11:34:59.380024	active	2015-10-28 11:34:59.397128	2015-10-28 11:34:59.397128
1938	3	18	5	MSTF4	EQUATORIAL GUINEA	100.00	<p>Sheet of 8 Flowers&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_110658_127.jpg	image/jpeg	985723	2015-10-28 11:36:20.107582	active	2015-10-28 11:36:20.124028	2015-10-28 11:36:20.124028
1939	3	18	5	MSTF5	SCOTLAND	80.00	<p>Sheet of 8 fish stamps&nbsp;</p>\r\n	IMG_20151028_113235_285.jpg	image/jpeg	970057	2015-10-28 11:37:54.12147	active	2015-10-28 11:37:54.137897	2015-10-28 11:37:54.137897
1940	3	18	5	MSTF6	SCOTLAND	100.00	<p>Sheet of 8 Fish stamps&nbsp;</p>\r\n	IMG_20151028_110555_622.jpg	image/jpeg	792166	2015-10-28 11:42:17.643427	active	2015-10-28 11:42:17.660376	2015-10-28 11:42:17.660376
1941	3	18	5	MSTB7	OMAN	80.00	<p>Sheet of 8 butterfly&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_110049_611.jpg	image/jpeg	821057	2015-10-28 11:45:23.685665	active	2015-10-28 11:45:23.702101	2015-10-28 11:45:23.702101
1942	3	18	5	MSTSF8	SCOTLAND	90.00	<p>Sheet of 8 shell Fish&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_105734.jpg	image/jpeg	2302757	2015-10-28 11:50:11.709527	active	2015-10-28 11:50:11.729489	2015-10-28 11:50:11.729489
1943	3	18	5	MSTS9	SCOTLAND	70.00	<p>Sheet of 8 cycle&nbsp;stamps</p>\r\n	IMG_20151028_113029_801.jpg	image/jpeg	1062397	2015-10-28 11:52:17.070805	active	2015-10-28 11:52:17.087863	2015-10-28 11:52:17.087863
1944	3	18	5	MSTS10	SCOTLAND	120.00	<p>Sheet of 8 types of chess stamps&nbsp;</p>\r\n	IMG_20151028_110516_579.jpg	image/jpeg	929006	2015-10-28 11:54:09.444401	active	2015-10-28 11:54:09.46137	2015-10-28 11:54:09.46137
1945	3	18	5	MSTS11	OMAN	90.00	<p>Sheet of 8 sports stamps&nbsp;</p>\r\n	IMG_20151028_110226_468.jpg	image/jpeg	716677	2015-10-28 11:56:01.204632	active	2015-10-28 11:56:01.221583	2015-10-28 11:56:01.221583
1946	3	18	5	MSTS12	SCOTLAND	180.00	<p>Sheet of 8 football&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_113137_250.jpg	image/jpeg	1205009	2015-10-28 11:58:16.796245	active	2015-10-28 11:58:16.813473	2015-10-28 11:58:16.813473
1947	3	18	5	MSTS13	SCOTLAND	70.00	<p>Sheet of 8 sports stamps&nbsp;</p>\r\n	IMG_20151028_110626_043.jpg	image/jpeg	876168	2015-10-28 12:00:33.799408	active	2015-10-28 12:00:33.81521	2015-10-28 12:00:33.81521
1948	3	18	5	MSTC14	SCOTLAND	70.00	<p>Sheet of 8 castle stamps&nbsp;</p>\r\n	IMG_20151028_105734.jpg	image/jpeg	2302757	2015-10-28 12:04:26.492875	active	2015-10-28 12:04:26.513651	2015-10-28 12:04:26.513651
1949	3	18	5	MSTC15	SWEDEN	60.00	<p>Sheet of 8 castle stamps&nbsp;</p>\r\n	IMG_20151028_110434_400.jpg	image/jpeg	1031964	2015-10-28 12:06:13.312186	active	2015-10-28 12:06:13.329121	2015-10-28 12:06:13.329121
1950	3	18	5	MSTP16	SCOTLAND	100.00	<p>Sheet of 8 Egyptian spinx stamps&nbsp;</p>\r\n	IMG_20151028_110140_077.jpg	image/jpeg	1108802	2015-10-28 12:09:38.713789	active	2015-10-28 12:09:38.731564	2015-10-28 12:09:38.731564
1951	3	18	5	MSTG17	SCOTLAND	60.00	<p>Sheet of 8 Royal guards stamps&nbsp;</p>\r\n	IMG_20151028_110259_621.jpg	image/jpeg	903649	2015-10-28 12:11:04.735774	active	2015-10-28 12:11:04.75221	2015-10-28 12:11:04.75221
1952	3	18	5	MSCELEB18	COMORES	190.00	<p>Sheet of 9 celebrity&nbsp;stamps</p>\r\n	IMG_20151028_113313_780.jpg	image/jpeg	1229097	2015-10-28 12:20:38.908737	active	2015-10-28 12:20:39.040189	2015-10-28 12:20:39.040189
1953	3	18	5	MSCELEB19	COMORES	190.00	<p>Sheet of 6 celebrity stamps</p>\r\n	IMG_20151028_113346_910.jpg	image/jpeg	787668	2015-10-28 12:23:12.86287	active	2015-10-28 12:23:12.879603	2015-10-28 12:23:12.879603
1954	3	18	5	MSCELEB20	COMORES	150.00	<p>Sheet of 6 celebrity stamps</p>\r\n	IMG_20151028_113403_821.jpg	image/jpeg	1084280	2015-10-28 12:24:35.4688	active	2015-10-28 12:24:35.485717	2015-10-28 12:24:35.485717
1955	3	18	5	MSCELEB21	COMORES	170.00	<p>Sheet of 6 Celebrity stamps</p>\r\n	IMG_20151028_113424_904.jpg	image/jpeg	840345	2015-10-28 12:25:57.798188	active	2015-10-28 12:25:57.814351	2015-10-28 12:25:57.814351
1956	3	18	5	MSMEDIC22	COMORES	230.00	<p>Sheet of 4 Medicine&nbsp;stamps</p>\r\n	IMG_20151028_113452_981.jpg	image/jpeg	530754	2015-10-28 12:28:53.96181	active	2015-10-28 12:28:53.97704	2015-10-28 12:28:53.97704
1957	3	18	5	MSMIN23	COMORES	250.00	<p>Sheet of 4 mineralogists&nbsp;stamps</p>\r\n	IMG_20151028_113515_082.jpg	image/jpeg	590923	2015-10-28 12:30:32.353034	active	2015-10-28 12:30:32.36857	2015-10-28 12:30:32.36857
1958	3	18	5	MSCHESS24	COMORES	230.00	<p>Sheet of 4 Chess&nbsp;stamps</p>\r\n	IMG_20151028_113558_952.jpg	image/jpeg	755101	2015-10-28 12:31:50.160425	active	2015-10-28 12:31:50.175836	2015-10-28 12:31:50.175836
1959	3	18	5	MSBSKT25	COMORES	100.00	<p>&nbsp;stamps of 2 basketball players</p>\r\n	IMG_20151028_113625_078.jpg	image/jpeg	657135	2015-10-28 12:34:25.86205	active	2015-10-28 12:34:25.877484	2015-10-28 12:34:25.877484
1960	3	18	5	MSWLD26	COMORES	250.00	<p>Sheet of 4 Wild life discoveres&nbsp;stamps</p>\r\n	IMG_20151028_113701_807.jpg	image/jpeg	652053	2015-10-28 12:39:16.868041	active	2015-10-28 12:39:16.883782	2015-10-28 12:39:16.883782
1961	3	18	5	MSWLD27	COMORES	200.00	<p>Sheet of 4 Wild life discoverers stamps</p>\r\n	IMG_20151028_113727_952.jpg	image/jpeg	550004	2015-10-28 12:40:50.620129	active	2015-10-28 12:40:50.634723	2015-10-28 12:40:50.634723
1962	3	18	5	MSPER28	GUINIE	120.00	<p>Sheet of 4 personality stamps</p>\r\n	IMG_20151028_113801_677.jpg	image/jpeg	564265	2015-10-28 12:43:25.294875	active	2015-10-28 12:43:25.310477	2015-10-28 12:43:25.310477
1963	3	18	5	MSBASE29	COMORES	130.00	<p>Sheet of 4 baseball player&nbsp;stamps</p>\r\n	IMG_20151028_113839_950.jpg	image/jpeg	661343	2015-10-28 12:45:20.67223	active	2015-10-28 12:45:20.68807	2015-10-28 12:45:20.68807
1964	3	18	5	MSPING30	COMORES	120.00	<p>Sheet of 4 table tennis player stamps</p>\r\n	IMG_20151028_113903_102.jpg	image/jpeg	715343	2015-10-28 12:46:58.504245	active	2015-10-28 12:46:58.520468	2015-10-28 12:46:58.520468
1965	3	18	5	MSXIA31	COMORES	120.00	<p>Sheet of 4 Xiangqi player<span style="line-height:1.6em">&nbsp;stamps</span></p>\r\n	IMG_20151028_113939_722.jpg	image/jpeg	567442	2015-10-28 12:48:26.438623	active	2015-10-28 12:48:26.453794	2015-10-28 12:48:26.453794
1966	3	18	5	MSPER31	GUINIE	130.00	<p>Sheet of 4 personality stamps</p>\r\n	IMG_20151028_114010_084.jpg	image/jpeg	599311	2015-10-28 12:50:41.803025	active	2015-10-28 12:50:41.818509	2015-10-28 12:50:41.818509
1967	3	18	5	MSSPORT32	COMORES	130.00	<p>Sheet of 4 sports stamps</p>\r\n	IMG_20151028_114028_079.jpg	image/jpeg	575009	2015-10-28 12:52:02.306135	active	2015-10-28 12:52:02.321464	2015-10-28 12:52:02.321464
1968	3	18	5	MSCHESS34	COMORES	150.00	<p>Sheet of 4 chess players&nbsp;stamps</p>\r\n	IMG_20151028_114047_485.jpg	image/jpeg	582263	2015-10-28 12:53:31.059011	active	2015-10-28 12:53:31.073636	2015-10-28 12:53:31.073636
1969	3	18	5	MSSPORT35	COMORES	120.00	<p>Sheet of 4 sports player&nbsp;stamps</p>\r\n	IMG_20151028_114116_738.jpg	image/jpeg	555502	2015-10-28 12:54:39.105611	active	2015-10-28 12:54:39.120441	2015-10-28 12:54:39.120441
1970	3	18	5	MSSPORT36	COMORES	120.00	<p>Sheet of4 sports player stamps</p>\r\n	IMG_20151028_114145_509.jpg	image/jpeg	572073	2015-10-28 12:55:44.998079	active	2015-10-28 12:55:45.013148	2015-10-28 12:55:45.013148
1971	3	18	5	MSSPORT37	COMORES	150.00	<p>Sheet of 4 sports player stamps</p>\r\n	IMG_20151028_114212_102.jpg	image/jpeg	590979	2015-10-28 12:56:58.010397	active	2015-10-28 12:56:58.024793	2015-10-28 12:56:58.024793
1972	3	18	5	MSTENNIS38	COMORES	200.00	<p>Sheet of 4 tennis player stamps</p>\r\n	IMG_20151028_114401_858.jpg	image/jpeg	612484	2015-10-28 12:58:21.150877	active	2015-10-28 12:58:21.174197	2015-10-28 12:58:21.174197
1973	3	18	5	MSSUMO39	COMORES	150.00	<p>Sheet of 4 sumo players stamps</p>\r\n	IMG_20151028_114419_519.jpg	image/jpeg	614165	2015-10-28 12:59:27.562136	active	2015-10-28 12:59:27.577371	2015-10-28 12:59:27.577371
1974	3	18	5	MSATHLT40	COMORES	150.00	<p>Sheet of 4 Athletic player stamps</p>\r\n	IMG_20151028_114440_746.jpg	image/jpeg	683353	2015-10-28 13:00:55.742595	active	2015-10-28 13:00:55.758199	2015-10-28 13:00:55.758199
1975	3	18	5	MSRATS41	GUINIE	150.00	<p>Sheet of 4 rat stamps</p>\r\n	IMG_20151028_114520_249.jpg	image/jpeg	537571	2015-10-28 13:02:41.496316	active	2015-10-28 13:02:41.511388	2015-10-28 13:02:41.511388
1976	3	18	5	MSBUFFLO42	GUINIE	150.00	<p>Sheet of 4 buffalo stamps</p>\r\n	IMG_20151028_114546_472.jpg	image/jpeg	627169	2015-10-28 13:04:20.37402	active	2015-10-28 13:04:20.390653	2015-10-28 13:04:20.390653
1977	3	18	5	MSSHELL43	COMORES	220.00	<p>Sheet of 4 light house &amp; shells stamps</p>\r\n	IMG_20151028_114608_875.jpg	image/jpeg	854836	2015-10-28 13:06:42.838026	active	2015-10-28 13:06:42.853594	2015-10-28 13:06:42.853594
1978	3	18	5	MSFROG44	COMORES	220.00	<p>Sheet of 4 frog stamps</p>\r\n	IMG_20151028_114637_139.jpg	image/jpeg	558249	2015-10-28 13:07:46.390507	active	2015-10-28 13:07:46.405048	2015-10-28 13:07:46.405048
1979	3	18	5	MSF&B45	TOGO	170.00	<p>Sheet of 2 fish and 2 butterfly&nbsp;stamps</p>\r\n	IMG_20151028_114655_854.jpg	image/jpeg	720115	2015-10-28 13:09:41.617437	active	2015-10-28 13:09:41.633777	2015-10-28 13:09:41.633777
1980	3	18	5	MSDOL46	COMORES	220.00	<p>Sheet of 4 Dolphin stamps</p>\r\n	IMG_20151028_114719_740.jpg	image/jpeg	607503	2015-10-28 13:11:52.706362	active	2015-10-28 13:11:52.721171	2015-10-28 13:11:52.721171
1981	3	18	5	MSSHARK47	COMORES	220.00	<p>Sheet of 4 shark&nbsp;stamps</p>\r\n	IMG_20151028_114739_969.jpg	image/jpeg	461556	2015-10-28 13:13:07.551701	active	2015-10-28 13:13:07.567326	2015-10-28 13:13:07.567326
1982	3	18	5	MSSHARK48	COMORES	220.00	<p>Sheet of 4 shark stamps</p>\r\n	IMG_20151028_114759_124.jpg	image/jpeg	436194	2015-10-28 13:14:05.323396	active	2015-10-28 13:14:05.338405	2015-10-28 13:14:05.338405
1983	3	18	5	MSDOL49	COMORES	220.00	<p>Sheet of 4 dolphin stamps</p>\r\n	IMG_20151028_114821_026.jpg	image/jpeg	636630	2015-10-28 13:15:18.08551	active	2015-10-28 13:15:18.100691	2015-10-28 13:15:18.100691
1984	3	18	5	MSFISH50	COMORES	220.00	<p>Sheet of 4 fish stamps</p>\r\n	IMG_20151028_114849_584.jpg	image/jpeg	564078	2015-10-28 13:21:26.813407	active	2015-10-28 13:21:26.828972	2015-10-28 13:21:26.828972
1985	3	18	5	MSTURTLE51	COMORES	220.00	<p>Sheet of 4 turtle stamps</p>\r\n	IMG_20151028_114916_278.jpg	image/jpeg	602669	2015-10-28 13:22:52.020501	active	2015-10-28 13:22:52.035542	2015-10-28 13:22:52.035542
1986	3	18	5	MSWHALE52	COMORES	220.00	<p>Sheet of 4 whale stamps</p>\r\n	IMG_20151028_114946_194.jpg	image/jpeg	571607	2015-10-28 13:24:46.087974	active	2015-10-28 13:24:46.102328	2015-10-28 13:24:46.102328
1987	3	18	5	MSSEAL53	COMORES	220.00	<p>Sheet of 4 Sea Liions&nbsp;stamps</p>\r\n	IMG_20151028_115002_887.jpg	image/jpeg	575017	2015-10-28 13:26:07.634737	active	2015-10-28 13:26:07.649619	2015-10-28 13:26:07.649619
1988	3	18	5	MSINSECT54	COMORES	220.00	<p>Sheet of 4 insect&nbsp;stamps</p>\r\n	IMG_20151028_115022_475.jpg	image/jpeg	734800	2015-10-28 13:29:07.258301	active	2015-10-28 13:29:07.277141	2015-10-28 13:29:07.277141
1989	3	18	5	MSOWL55	TOGO	180.00	<p>Sheet of 2 owl &amp; 2 butterfly stamps</p>\r\n	IMG_20151028_115045_422.jpg	image/jpeg	782505	2015-10-28 13:32:39.036859	active	2015-10-28 13:32:39.052694	2015-10-28 13:32:39.052694
1990	3	18	5	MSSEAL56	COMORES	220.00	<p>Sheet of 4 seal stamps</p>\r\n	IMG_20151028_115107_638.jpg	image/jpeg	805974	2015-10-28 13:34:18.180621	active	2015-10-28 13:34:18.197016	2015-10-28 13:34:18.197016
1991	3	18	5	MSBUT57	COMORES	220.00	<p>Sheet of 4 butterfly&nbsp;stamps</p>\r\n	IMG_20151028_115127_105.jpg	image/jpeg	584037	2015-10-28 13:35:46.807505	active	2015-10-28 13:35:46.82127	2015-10-28 13:35:46.82127
1992	3	18	5	MSBUG58	COMORES	220.00	<p>Sheet of 4 bugs&nbsp;stamps</p>\r\n	IMG_20151028_115147_664.jpg	image/jpeg	495064	2015-10-28 13:37:59.938866	active	2015-10-28 13:37:59.953504	2015-10-28 13:37:59.953504
1993	3	18	5	MSFLIES59	COMORES	220.00	<p>Sheet of 4 flies stamps</p>\r\n	IMG_20151028_115221_309.jpg	image/jpeg	536549	2015-10-28 13:38:53.809057	active	2015-10-28 13:38:53.822916	2015-10-28 13:38:53.822916
1994	3	18	5	MSLIZ60	COMORES	220.00	<p>Sheet of 4 lizzard stamps</p>\r\n	IMG_20151028_115240_378.jpg	image/jpeg	611871	2015-10-28 13:40:01.477677	active	2015-10-28 13:40:01.492421	2015-10-28 13:40:01.492421
1995	3	18	5	MSBIRD61	COMORES	300.00	<p>Sheet of 4 birds stamps</p>\r\n	IMG_20151028_115300_576.jpg	image/jpeg	709637	2015-10-28 13:40:57.745638	active	2015-10-28 13:40:57.760989	2015-10-28 13:40:57.760989
1996	3	18	5	MSBIRDS62	COMORES	300.00	<p>Sheet of 4 piegons stamps</p>\r\n	IMG_20151028_115319_298.jpg	image/jpeg	734084	2015-10-28 13:42:20.433692	active	2015-10-28 13:42:20.448606	2015-10-28 13:42:20.448606
1997	3	18	5	MSOWL63	COMORES	300.00	<p>Sheet of 4 owl&nbsp;stamps</p>\r\n	IMG_20151028_115343_328.jpg	image/jpeg	632836	2015-10-28 13:43:39.155489	active	2015-10-28 13:43:39.169214	2015-10-28 13:43:39.169214
1998	3	18	5	MSSEA64	TOGO	250.00	<p>Sheet of 2&nbsp;prawns &amp; 2 seagull&nbsp;stamps</p>\r\n	IMG_20151028_115404_079.jpg	image/jpeg	593418	2015-10-28 13:45:27.458994	active	2015-10-28 13:45:27.474996	2015-10-28 13:45:27.474996
1999	3	18	5	MSBIRDS65	COMORES	300.00	<p>Sheet of 4 seagull stamps</p>\r\n	IMG_20151028_115422_234.jpg	image/jpeg	681121	2015-10-28 13:47:03.828581	active	2015-10-28 13:47:03.845064	2015-10-28 13:47:03.845064
2000	3	18	5	MSBIRDS66	COMORES	300.00	<p>Sheet of 4 birds stamps</p>\r\n	IMG_20151028_120245_198.jpg	image/jpeg	782451	2015-10-28 13:49:03.483099	active	2015-10-28 13:49:03.497577	2015-10-28 13:49:03.497577
2001	3	18	5	MSTRAIN67	COMORES	180.00	<p>Sheet of 4 train stamps</p>\r\n	IMG_20151028_115621_212.jpg	image/jpeg	586245	2015-10-28 13:51:54.953652	active	2015-10-28 13:51:54.972098	2015-10-28 13:51:54.972098
2002	3	18	5	MSTRAIN68	COMORES	180.00	<p>Sheet of 4 train stamps</p>\r\n	IMG_20151028_120200_326.jpg	image/jpeg	444900	2015-10-28 13:52:55.038042	active	2015-10-28 13:52:55.052638	2015-10-28 13:52:55.052638
2003	3	18	5	MSTRAIN69	COMORES	180.00	<p>Sheet of 4 train stamps</p>\r\n	IMG_20151028_120220_840.jpg	image/jpeg	493967	2015-10-28 13:53:48.422479	active	2015-10-28 13:53:48.437808	2015-10-28 13:53:48.437808
2004	3	18	5	MSWILD70	SRI LANKA	250.00	<p>Sheet of 2 animals&nbsp;stamps</p>\r\n	IMG_20151028_120309_411.jpg	image/jpeg	581771	2015-10-28 13:55:49.37038	active	2015-10-28 13:55:49.385384	2015-10-28 13:55:49.385384
2005	3	18	5	MSWILD71	SRI LANKA	250.00	<p>Sheet of 2 animals stamps</p>\r\n	IMG_20151028_120338_253.jpg	image/jpeg	501190	2015-10-28 13:56:50.414527	active	2015-10-28 13:56:50.428135	2015-10-28 13:56:50.428135
2006	3	18	5	MSWILD72	SRI LANKA	250.00	<p>Sheet of 2 animals stamps</p>\r\n	IMG_20151028_120403_354.jpg	image/jpeg	461816	2015-10-28 13:57:46.801394	active	2015-10-28 13:57:46.816163	2015-10-28 13:57:46.816163
2007	3	18	5	MSFISH73	COMORES	220.00	<p>Sheet of 4 fish stamps&nbsp;</p>\r\n	IMG_20151029_104507_199.jpg	image/jpeg	731621	2015-10-29 05:47:27.695744	active	2015-10-29 05:47:27.767324	2015-10-29 05:47:27.767324
2008	3	18	5	MSBIRDS74	COMORES	300.00	<p>Sheet of 4 bird stamps&nbsp;</p>\r\n	IMG_20151029_104550_745.jpg	image/jpeg	791467	2015-10-29 05:48:40.963449	active	2015-10-29 05:48:40.981652	2015-10-29 05:48:40.981652
2009	3	18	5	MSRUGBY75	COMORES	180.00	<p>Sheet of 4 rugby palyer stamps&nbsp;</p>\r\n	IMG_20151029_104642_380.jpg	image/jpeg	507547	2015-10-29 05:50:03.673122	active	2015-10-29 05:50:03.687223	2015-10-29 05:50:03.687223
2010	3	18	5	MSWLD76	COMORES	200.00	<p>Sheet of 4 wild life discoverer&nbsp;stamps&nbsp;</p>\r\n	IMG_20151029_104700_309.jpg	image/jpeg	505235	2015-10-29 05:51:27.383424	active	2015-10-29 05:51:27.401423	2015-10-29 05:51:27.401423
2011	3	18	5	MSWLD77	COMORES	200.00	<p>Sheet of 4 wild life discoveres stamps&nbsp;</p>\r\n	IMG_20151029_104722_041.jpg	image/jpeg	618675	2015-10-29 05:54:20.948695	active	2015-10-29 05:54:20.964577	2015-10-29 05:54:20.964577
2012	3	18	5	MSPILOT78	COMORES	200.00	<p>Sheet of 4 pilot stamps&nbsp;</p>\r\n	IMG_20151029_104740_902.jpg	image/jpeg	674936	2015-10-29 05:55:06.798813	active	2015-10-29 05:55:06.814288	2015-10-29 05:55:06.814288
2013	3	18	5	MSBSKT79	COMORES	200.00	<p>Sheet of 4 basketball player stamps&nbsp;</p>\r\n	IMG_20151029_104756_430.jpg	image/jpeg	722178	2015-10-29 05:57:05.266244	active	2015-10-29 05:57:05.282009	2015-10-29 05:57:05.282009
2014	3	18	5	MSFOOT80	COMORES	300.00	<p>Sheet of 4 football players stamps&nbsp;</p>\r\n	IMG_20151029_104813_455.jpg	image/jpeg	624186	2015-10-29 05:58:27.716157	active	2015-10-29 05:58:27.731478	2015-10-29 05:59:40.145913
2015	3	18	5	MSFOOT81	COMORES	300.00	<p>Sheet of 4 football player stamps&nbsp;</p>\r\n	IMG_20151029_104831_713.jpg	image/jpeg	623534	2015-10-29 06:01:42.591642	active	2015-10-29 06:01:42.607815	2015-10-29 06:01:42.607815
2016	3	18	5	MSFOOT82	COMORES	300.00	<p>Sheet of 4 football player stamps&nbsp;</p>\r\n	IMG_20151029_104848_682.jpg	image/jpeg	706881	2015-10-29 06:03:21.762938	active	2015-10-29 06:03:21.778281	2015-10-29 06:03:21.778281
2017	3	18	5	MSPER83	GUINIE	120.00	<p>Sheet of 4 personality stamps&nbsp;</p>\r\n	IMG_20151029_104906_455.jpg	image/jpeg	754927	2015-10-29 06:04:52.189883	active	2015-10-29 06:04:52.206705	2015-10-29 06:04:52.206705
2018	3	18	5	MSHEALTH84	MACEPOTANIA	200.00	<p>Sheet of 4 health stamps&nbsp;</p>\r\n	IMG_20151029_110808_751.jpg	image/jpeg	744355	2015-10-29 06:07:55.870185	active	2015-10-29 06:07:55.886625	2015-10-29 06:07:55.886625
2019	3	18	5	MSHEALTH85	MACEPOTANIA	160.00	<p>Sheet of 4 health&nbsp;stamps&nbsp;</p>\r\n	IMG_20151029_110706_526.jpg	image/jpeg	1022733	2015-10-29 06:09:35.279199	active	2015-10-29 06:09:35.295622	2015-10-29 06:09:35.295622
2020	3	18	5	MSHEALTH86	MACEPOTANIA	180.00	<p>Sheet of 4 health stamps&nbsp;</p>\r\n	IMG_20151029_110625_611.jpg	image/jpeg	1031387	2015-10-29 06:10:45.491543	active	2015-10-29 06:10:45.507896	2015-10-29 06:10:45.507896
2024	3	18	2	MSCW7	SOUTH AFRICA	120.00	<p>single block south africa&nbsp; stamp&nbsp;</p>\r\n	IMG_20151028_163517.jpg	image/jpeg	663536	2015-10-29 06:23:37.879138	active	2015-10-29 06:23:37.897737	2015-10-29 06:23:37.897737
2021	3	18	2	MSCW8	BARBUDA	300.00	<p>Sheet of 6 bicentenary&nbsp;stamps&nbsp;</p>\r\n	IMG_20151028_163336.jpg	image/jpeg	1200167	2015-10-29 06:16:04.202769	active	2015-10-29 06:16:04.220947	2015-10-29 06:24:49.20938
2022	3	18	2	MSCW9	BARBUDA	300.00	<p>Sheet of 6 bicentenary stamps&nbsp;</p>\r\n	IMG_20151028_163449.jpg	image/jpeg	1429686	2015-10-29 06:17:21.125263	active	2015-10-29 06:17:21.141165	2015-10-29 06:25:34.950822
2023	3	18	5	MSICE87	ICELAND	300.00	<p>Sheet of 3 university stamps&nbsp;</p>\r\n	IMG_20151028_163414.jpg	image/jpeg	889536	2015-10-29 06:19:02.851421	active	2015-10-29 06:19:02.869855	2015-10-29 06:27:19.545157
2025	3	64	26	VKGBG1	HUNGARY	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151026_184742_962.jpg	image/jpeg	516255	2015-10-29 06:47:27.823893	active	2015-10-29 06:47:27.840527	2015-10-29 06:47:27.840527
2026	3	64	26	VKGBG2	HUNGARY	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151026_184759_686.jpg	image/jpeg	530899	2015-10-29 06:48:21.30526	active	2015-10-29 06:48:21.320603	2015-10-29 06:48:21.320603
2027	3	64	26	VKGBG3	FUJEIRA	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151028_103029_263.jpg	image/jpeg	599100	2015-10-29 06:49:26.934667	active	2015-10-29 06:49:26.94906	2015-10-29 06:49:26.94906
2028	3	64	26	VKGBG4	MAURITANIA	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151028_103240_370.jpg	image/jpeg	656131	2015-10-29 06:51:17.609122	active	2015-10-29 06:51:17.625074	2015-10-29 06:51:17.625074
2029	3	64	26	VKGBG5	MAURITANIA	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151028_103253_191.jpg	image/jpeg	614049	2015-10-29 06:52:31.572914	active	2015-10-29 06:52:31.588391	2015-10-29 06:52:31.588391
2030	3	64	26	VKGBG6	MAURITANIA	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151028_103306_017.jpg	image/jpeg	733135	2015-10-29 06:53:31.023044	active	2015-10-29 06:53:31.038996	2015-10-29 06:53:31.038996
2031	3	64	26	VKGBG7	GUINIE	13.00	<p>Big size viking stamp</p>\r\n	IMG_20151028_103514_192.jpg	image/jpeg	601754	2015-10-29 06:54:24.104547	active	2015-10-29 06:54:24.119363	2015-10-29 06:54:24.119363
2032	3	64	26	VKGMD1	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151026_184815_274.jpg	image/jpeg	511056	2015-10-29 06:55:46.51761	active	2015-10-29 06:55:46.53255	2015-10-29 06:55:46.53255
2033	3	64	26	VKGMD2	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151026_184831_908.jpg	image/jpeg	395193	2015-10-29 06:56:45.508158	active	2015-10-29 06:56:45.522636	2015-10-29 06:56:45.522636
2034	3	64	26	VKGMD3	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151026_184850_165.jpg	image/jpeg	574078	2015-10-29 06:57:59.050617	active	2015-10-29 06:57:59.06796	2015-10-29 06:57:59.06796
2035	3	64	26	VKGMD4	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151026_184911_219.jpg	image/jpeg	520385	2015-10-29 06:58:57.259595	active	2015-10-29 06:58:57.274921	2015-10-29 06:58:57.274921
2036	3	64	26	VKGMD5	GREADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151026_184941_501.jpg	image/jpeg	429401	2015-10-29 07:00:00.961931	active	2015-10-29 07:00:00.976554	2015-10-29 07:00:00.976554
2037	3	64	26	VKGMD6	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151027_140636_316.jpg	image/jpeg	263527	2015-10-29 07:01:11.311292	active	2015-10-29 07:01:11.325262	2015-10-29 07:01:11.325262
2038	3	64	26	VKGMD7	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151027_140652_137.jpg	image/jpeg	541161	2015-10-29 07:02:06.372432	active	2015-10-29 07:02:06.387543	2015-10-29 07:02:06.387543
2039	3	64	26	VKGMD8	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151027_140720_236.jpg	image/jpeg	691801	2015-10-29 07:03:12.025742	active	2015-10-29 07:03:12.041467	2015-10-29 07:03:12.041467
2040	3	64	26	VKGMD9	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151027_140752_096.jpg	image/jpeg	468255	2015-10-29 07:04:29.543532	active	2015-10-29 07:04:29.558567	2015-10-29 07:04:29.558567
2041	3	64	26	VKGMD10	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_102909_989.jpg	image/jpeg	539930	2015-10-29 07:05:36.553864	active	2015-10-29 07:05:36.689726	2015-10-29 07:05:36.689726
2042	3	64	26	VKGMD11	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_102925_894.jpg	image/jpeg	320069	2015-10-29 07:06:24.476556	active	2015-10-29 07:06:24.49083	2015-10-29 07:06:24.49083
2043	3	64	26	VKGMD12	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103008_891.jpg	image/jpeg	441602	2015-10-29 07:07:48.29047	active	2015-10-29 07:07:48.305225	2015-10-29 07:07:48.305225
2044	3	64	26	VKGMD13	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103046_895.jpg	image/jpeg	616828	2015-10-29 07:09:10.510301	active	2015-10-29 07:09:10.526388	2015-10-29 07:09:10.526388
2045	3	64	26	VKGMD14	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103106_756.jpg	image/jpeg	337916	2015-10-29 07:10:01.710701	active	2015-10-29 07:10:01.724997	2015-10-29 07:10:01.724997
2046	3	64	26	VKGMD15	UNITED KINGDOM	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103119_786.jpg	image/jpeg	453705	2015-10-29 07:11:48.311905	active	2015-10-29 07:11:48.326899	2015-10-29 07:11:48.326899
2047	3	64	26	VKGMD16	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103137_930.jpg	image/jpeg	338864	2015-10-29 07:13:17.599914	active	2015-10-29 07:13:17.615677	2015-10-29 07:13:17.615677
2048	3	64	26	VKGMD17	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103155_224.jpg	image/jpeg	359336	2015-10-29 07:14:25.875379	active	2015-10-29 07:14:25.889706	2015-10-29 07:14:25.889706
2049	3	64	26	VKGMD18	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103224_782.jpg	image/jpeg	327861	2015-10-29 07:15:19.82948	active	2015-10-29 07:15:19.843537	2015-10-29 07:15:19.843537
2050	3	64	26	VKG19	POLAND	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103320_423.jpg	image/jpeg	527830	2015-10-29 07:16:59.150093	active	2015-10-29 07:16:59.164328	2015-10-29 07:16:59.164328
2051	3	64	26	VKGMD20	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103352_052.jpg	image/jpeg	884715	2015-10-29 07:19:40.925215	active	2015-10-29 07:19:40.941742	2015-10-29 07:19:40.941742
2052	3	64	26	VKGMD21	UNITED KINGDOM	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103423_394.jpg	image/jpeg	505999	2015-10-29 07:21:00.472333	active	2015-10-29 07:21:00.487412	2015-10-29 07:21:00.487412
2053	3	64	26	VKGMD22	GRENADA	9.00	<p>Medium size viking stamp</p>\r\n	IMG_20151028_103441_223.jpg	image/jpeg	394659	2015-10-29 07:22:03.233711	active	2015-10-29 07:22:03.247491	2015-10-29 07:22:03.247491
2054	3	64	27	MUSHBG1	guyana	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174527_005.jpg	image/jpeg	911408	2015-10-29 07:42:33.790472	active	2015-10-29 07:42:33.806933	2015-10-29 07:42:33.806933
2055	3	64	27	MUSHBG2	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174548_350.jpg	image/jpeg	914278	2015-10-29 07:44:07.273424	active	2015-10-29 07:44:07.289709	2015-10-29 07:44:07.289709
2056	3	64	27	MUSHBG3	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174605_350.jpg	image/jpeg	699797	2015-10-29 07:45:15.107071	active	2015-10-29 07:45:15.121267	2015-10-29 07:45:15.121267
2057	3	64	27	MUSHBG4	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174657_595.jpg	image/jpeg	634824	2015-10-29 07:46:32.983184	active	2015-10-29 07:46:32.99689	2015-10-29 07:46:32.99689
2058	3	64	26	MUSHBG6	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174742_616.jpg	image/jpeg	634031	2015-10-29 07:48:51.558402	active	2015-10-29 07:48:51.573729	2015-10-29 07:48:51.573729
2059	3	64	27	MUSHBG7	CAMBODIA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174755_155.jpg	image/jpeg	564593	2015-10-29 10:57:53.438251	active	2015-10-29 10:57:53.458954	2015-10-29 10:57:53.458954
2060	3	64	27	MUSHBG8	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174819_832.jpg	image/jpeg	599380	2015-10-29 10:58:46.322217	active	2015-10-29 10:58:46.336041	2015-10-29 10:58:46.336041
2061	3	64	27	MUSHBG9	VIETNAM	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_174912_683.jpg	image/jpeg	567419	2015-10-29 10:59:29.040144	active	2015-10-29 10:59:29.054512	2015-10-29 10:59:29.054512
2062	3	64	27	MUSHBG10	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175058_925.jpg	image/jpeg	460401	2015-10-29 11:00:21.243075	active	2015-10-29 11:00:21.258149	2015-10-29 11:00:21.258149
2063	3	64	27	MUSHBG11	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175146_494.jpg	image/jpeg	1083564	2015-10-29 11:01:15.330443	active	2015-10-29 11:01:15.345631	2015-10-29 11:01:15.345631
2064	3	64	27	MUSHBG12	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175206_262.jpg	image/jpeg	802181	2015-10-29 11:02:16.011647	active	2015-10-29 11:02:16.025954	2015-10-29 11:02:16.025954
2065	3	64	26	MUSHBG13	CAMBODIA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175220_052.jpg	image/jpeg	698542	2015-10-29 11:03:21.527159	active	2015-10-29 11:03:21.552629	2015-10-29 11:03:21.552629
2066	3	64	27	MUSHBG14	CAMBODIA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175232_565.jpg	image/jpeg	640790	2015-10-29 11:05:15.514656	active	2015-10-29 11:05:15.531521	2015-10-29 11:05:15.531521
2067	3	64	27	MUSHBG15	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175253_666.jpg	image/jpeg	726877	2015-10-29 11:06:08.94472	active	2015-10-29 11:06:08.958757	2015-10-29 11:06:08.958757
2068	3	64	27	MUSHBG16	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175308_434.jpg	image/jpeg	518099	2015-10-29 11:07:17.08351	active	2015-10-29 11:07:17.097561	2015-10-29 11:07:17.097561
2069	3	64	27	MUSHBG17	VIETNAM	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175329_182.jpg	image/jpeg	635127	2015-10-29 11:08:14.249884	active	2015-10-29 11:08:14.264079	2015-10-29 11:08:14.264079
2070	3	64	27	MUSHBG18	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175354_961.jpg	image/jpeg	667821	2015-10-29 11:10:26.494159	active	2015-10-29 11:10:26.509706	2015-10-29 11:10:26.509706
2071	3	64	27	MUSHBG19	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175412_500.jpg	image/jpeg	516775	2015-10-29 11:11:16.120855	active	2015-10-29 11:11:16.13489	2015-10-29 11:11:16.13489
2072	3	64	27	MUSHBG19	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175412_500.jpg	image/jpeg	516775	2015-10-29 11:12:17.644199	active	2015-10-29 11:12:17.65832	2015-10-29 11:12:17.65832
2073	3	64	27	MUSHBG20	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175433_942.jpg	image/jpeg	642886	2015-10-29 11:13:05.657957	active	2015-10-29 11:13:05.67122	2015-10-29 11:13:05.67122
2074	3	64	27	MUSHBG21	GUYANA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_175450_204.jpg	image/jpeg	598369	2015-10-29 11:14:10.476781	active	2015-10-29 11:14:10.491533	2015-10-29 11:14:10.491533
2075	3	64	27	MUSHBG22	CAMBODIA	13.00	<p>Big size mushroom stamp</p>\r\n	IMG_20151026_180116_430.jpg	image/jpeg	695751	2015-10-29 11:15:40.250411	active	2015-10-29 11:15:40.265078	2015-10-29 11:15:40.265078
2076	3	64	27	MUSHMD1	NORWAY	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_174834_002.jpg	image/jpeg	500591	2015-10-29 11:18:37.466138	active	2015-10-29 11:18:37.479856	2015-10-29 11:18:37.479856
2077	3	64	27	MUSHMD2	NORWAY	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_174856_794.jpg	image/jpeg	299200	2015-10-29 11:19:17.437198	active	2015-10-29 11:19:17.450485	2015-10-29 11:19:17.450485
2078	3	64	27	MUSHMD3	VIETNAM	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_175132_167.jpg	image/jpeg	703609	2015-10-29 11:20:08.764949	active	2015-10-29 11:20:08.778609	2015-10-29 11:20:08.778609
2079	3	64	27	MUSHMD4	UNITED KINGDOM	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_175700_424.jpg	image/jpeg	578347	2015-10-29 11:20:59.060556	active	2015-10-29 11:20:59.074243	2015-10-29 11:20:59.074243
2080	3	64	27	MUSHMD5	NORWAY	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_181228_889.jpg	image/jpeg	625115	2015-10-29 11:22:13.971882	active	2015-10-29 11:22:13.986472	2015-10-29 11:22:13.986472
2081	3	64	27	MUSHMD6	POLAND	25.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_181335_420.jpg	image/jpeg	454354	2015-10-29 11:23:50.262402	active	2015-10-29 11:23:50.275796	2015-10-29 11:23:50.275796
2082	3	64	27	MUSHMD7	POLAND	9.00	<p>Medium size mushroom stamp</p>\r\n	IMG_20151026_181335_420.jpg	image/jpeg	454354	2015-10-29 11:25:57.649799	active	2015-10-29 11:25:57.664782	2015-10-29 11:25:57.664782
2083	3	64	28	FRUITBG1	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_175810_545.jpg	image/jpeg	577348	2015-10-29 11:32:46.211421	active	2015-10-29 11:32:46.225431	2015-10-29 11:32:46.225431
2086	3	64	28	FRUITBG4	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_175938_017.jpg	image/jpeg	628815	2015-10-29 11:37:04.156454	active	2015-10-29 11:37:04.170129	2015-10-29 11:37:04.170129
2085	3	64	28	FRUITBG3	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_175925_471.jpg	image/jpeg	654851	2015-10-29 11:36:06.178562	active	2015-10-29 11:36:06.192876	2015-10-29 11:40:53.48713
2084	3	64	28	FRUITBG2	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_175832_318.jpg	image/jpeg	557088	2015-10-29 11:34:46.190428	active	2015-10-29 11:34:46.204602	2015-10-29 11:41:43.974024
2087	3	64	27	FRUITBG5	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_175958_443.jpg	image/jpeg	437448	2015-10-29 11:43:15.508761	active	2015-10-29 11:43:15.523586	2015-10-29 11:43:15.523586
2088	3	64	27	FRUITBG6	MADAGASCAR	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_180022_251.jpg	image/jpeg	698849	2015-10-29 11:44:39.100417	active	2015-10-29 11:44:39.116224	2015-10-29 11:44:39.116224
2089	3	64	27	FRUITBG8	laos	13.00	<p>Big size Fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_180134_356.jpg	image/jpeg	300239	2015-10-29 11:46:14.15788	active	2015-10-29 11:46:14.170881	2015-10-29 11:46:14.170881
2090	3	64	28	FRUITMD1	MALAYSIA	9.00	<p>Medium size fruit&nbsp;stamp&nbsp;</p>\r\n	IMG_20151026_180635_235.jpg	image/jpeg	422391	2015-10-29 11:48:26.034225	active	2015-10-29 11:48:26.049239	2015-10-29 11:48:26.049239
2091	3	64	28	FRUITMD2	YUGOSLAVIA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180653_185.jpg	image/jpeg	475169	2015-10-29 11:51:12.398369	active	2015-10-29 11:51:12.412595	2015-10-29 11:51:12.412595
2092	3	64	28	FRUITMD3	NORWAY	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180728_817.jpg	image/jpeg	469219	2015-10-29 11:53:43.732469	active	2015-10-29 11:53:43.746577	2015-10-29 11:53:43.746577
2093	3	64	27	FRUITMD5	CHINA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180747_868.jpg	image/jpeg	533567	2015-10-29 11:58:56.486077	active	2015-10-29 11:58:56.501573	2015-10-29 11:58:56.501573
2094	3	64	28	FRUITMD6	KENYA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180802_058.jpg	image/jpeg	612888	2015-10-29 11:59:49.181225	active	2015-10-29 11:59:49.19496	2015-10-29 11:59:49.19496
2095	3	64	28	FRUITMD7	UGANDA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180823_729.jpg	image/jpeg	455638	2015-10-29 12:01:09.017809	active	2015-10-29 12:01:09.032012	2015-10-29 12:01:09.032012
2096	3	64	28	FRUITMD9	YEMEN	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180934_315.jpg	image/jpeg	577634	2015-10-29 12:02:08.471407	active	2015-10-29 12:02:08.490602	2015-10-29 12:02:08.490602
2097	3	64	28	FRUITMD10	POLAND	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_180957_634.jpg	image/jpeg	351963	2015-10-29 12:03:26.483497	active	2015-10-29 12:03:26.497745	2015-10-29 12:03:26.497745
2098	3	64	28	FRUITMD11	NORWAY	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181108_486.jpg	image/jpeg	459251	2015-10-29 12:05:21.726833	active	2015-10-29 12:05:21.742258	2015-10-29 12:05:21.742258
2099	3	64	28	FRUITMD12	NORWAY	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181139_320.jpg	image/jpeg	711389	2015-10-29 12:06:31.672074	active	2015-10-29 12:06:31.686199	2015-10-29 12:06:31.686199
2100	3	64	28	FRUITMD13	SRI LANKA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181506_654.jpg	image/jpeg	353552	2015-10-29 12:07:29.177285	active	2015-10-29 12:07:29.190503	2015-10-29 12:07:29.190503
2101	3	64	28	FRUITMD13	NORWAY	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181553_624.jpg	image/jpeg	505566	2015-10-29 12:08:32.27786	active	2015-10-29 12:08:32.291206	2015-10-29 12:08:32.291206
2102	3	64	28	FRUITMD14	NORWAY	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181654_767.jpg	image/jpeg	464892	2015-10-29 12:09:18.541148	active	2015-10-29 12:09:18.555039	2015-10-29 12:09:18.555039
2103	3	64	28	FRUITMD15	SWEDEN	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181711_258.jpg	image/jpeg	538287	2015-10-29 12:11:05.10894	active	2015-10-29 12:11:05.122781	2015-10-29 12:11:05.122781
2104	3	64	28	FRUITMD16	MALAYSIA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181727_834.jpg	image/jpeg	465094	2015-10-29 12:11:50.017944	active	2015-10-29 12:11:50.031201	2015-10-29 12:11:50.031201
2105	3	64	28	FRUITMD17	CANADA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181747_722.jpg	image/jpeg	380051	2015-10-29 12:12:38.352738	active	2015-10-29 12:12:38.365579	2015-10-29 12:12:38.365579
2106	3	64	28	FRUITMD18	CHINA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181803_046.jpg	image/jpeg	362809	2015-10-29 12:13:24.533654	active	2015-10-29 12:13:24.546883	2015-10-29 12:13:24.546883
2107	3	64	28	FRUITMD19	CANADA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_181818_250.jpg	image/jpeg	382656	2015-10-29 12:14:09.262387	active	2015-10-29 12:14:09.276222	2015-10-29 12:14:09.276222
2108	3	64	28	FRUITMD20	SWITZERLAND	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182217_853.jpg	image/jpeg	363077	2015-10-29 12:15:11.197233	active	2015-10-29 12:15:11.219134	2015-10-29 12:15:11.219134
2109	3	64	28	FRUITMD21	SOUTH AFRICA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182237_751.jpg	image/jpeg	491914	2015-10-29 12:16:14.661142	active	2015-10-29 12:16:14.674219	2015-10-29 12:16:14.674219
2110	3	64	28	FRUITMD22	CANADA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182256_777.jpg	image/jpeg	468653	2015-10-29 12:16:56.824903	active	2015-10-29 12:16:56.83806	2015-10-29 12:16:56.83806
2111	3	64	28	FRUITMD23	MALAYSIA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182313_918.jpg	image/jpeg	410551	2015-10-29 12:17:50.127378	active	2015-10-29 12:17:50.141052	2015-10-29 12:17:50.141052
2112	3	64	28	FRUITMD23	BANGLADESH	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182355_495.jpg	image/jpeg	424833	2015-10-29 12:18:46.880481	active	2015-10-29 12:18:46.894288	2015-10-29 12:18:46.894288
2113	3	64	28	FRUITMD24	INDIA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182432_083.jpg	image/jpeg	680188	2015-10-29 12:20:31.619669	active	2015-10-29 12:20:31.633821	2015-10-29 12:20:31.633821
2114	3	64	28	FRUITMD25	SWITZERLAND	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182451_138.jpg	image/jpeg	472153	2015-10-29 12:21:51.987719	active	2015-10-29 12:21:52.001443	2015-10-29 12:21:52.001443
2115	3	64	28	FRUITMD26	UNITED KINGDOM	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_182953_694.jpg	image/jpeg	360516	2015-10-29 12:23:07.482899	active	2015-10-29 12:23:07.499148	2015-10-29 12:23:07.499148
2116	3	64	28	FRUITMD27	UGANDA	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_183021_248.jpg	image/jpeg	280969	2015-10-29 12:24:53.404915	active	2015-10-29 12:24:53.432444	2015-10-29 12:24:53.432444
2117	3	64	28	FRUITMD28	NEW ZEALAND	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_183051_918.jpg	image/jpeg	243769	2015-10-29 12:27:39.584335	active	2015-10-29 12:27:39.598762	2015-10-29 12:27:39.598762
2118	3	64	28	FRUITMD29	SWEDEN	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_183117_159.jpg	image/jpeg	258269	2015-10-29 12:28:26.575101	active	2015-10-29 12:28:26.588841	2015-10-29 12:28:26.588841
2119	3	64	28	FRUITMD30	FINLAND	9.00	<p>Medium size Fruit stamp&nbsp;</p>\r\n	IMG_20151026_183202_403.jpg	image/jpeg	315380	2015-10-29 12:29:31.74398	active	2015-10-29 12:29:31.756881	2015-10-29 12:29:31.756881
2120	3	64	29	SCOUTVB1	MANAMA BAHRAIN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_113505_081.jpg	image/jpeg	625279	2015-10-31 11:09:21.228869	active	2015-10-31 11:09:21.243976	2015-10-31 11:09:21.243976
2121	3	64	29	SCOUTVB2	MANAMA BAHRAIN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_115652_038.jpg	image/jpeg	706304	2015-10-31 11:10:26.806628	active	2015-10-31 11:10:26.821141	2015-10-31 11:10:26.821141
2122	3	64	29	SCOUTVB3	MANAMA BAHRAIN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_115715_688.jpg	image/jpeg	452916	2015-10-31 11:11:17.749486	active	2015-10-31 11:11:17.762954	2015-10-31 11:11:17.762954
2123	3	64	29	SCOUTVB4	UPPER VOLTA	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_120100_787.jpg	image/jpeg	1013234	2015-10-31 11:13:21.742661	active	2015-10-31 11:13:21.75793	2015-10-31 11:13:21.75793
2124	3	64	29	SCOUTVB5	BHUTAN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_120217_650.jpg	image/jpeg	552186	2015-10-31 11:14:19.476693	active	2015-10-31 11:14:19.491039	2015-10-31 11:14:19.491039
2125	3	64	29	SCOUTVB6	BHUTAN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_120241_661.jpg	image/jpeg	615457	2015-10-31 11:15:08.273465	active	2015-10-31 11:15:08.286666	2015-10-31 11:15:08.286666
2126	3	64	29	SCOUTVB7	TCHAD	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121038_998.jpg	image/jpeg	576200	2015-10-31 11:16:08.197234	active	2015-10-31 11:16:08.210669	2015-10-31 11:16:08.210669
2127	3	64	29	SCOUTVB8	TCHAD	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121136_366.jpg	image/jpeg	560671	2015-10-31 11:17:07.999288	active	2015-10-31 11:17:08.013501	2015-10-31 11:17:08.013501
2128	3	64	29	SCOUTVB9	TCHAD	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121157_313.jpg	image/jpeg	621805	2015-10-31 11:18:02.93267	active	2015-10-31 11:18:02.947292	2015-10-31 11:18:02.947292
2129	3	64	29	SCOUTVB10	FUJEIRA	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121237_527.jpg	image/jpeg	457282	2015-10-31 11:18:50.676993	active	2015-10-31 11:18:50.690517	2015-10-31 11:18:50.690517
2130	3	64	29	SCOUTVB12	FUJEIRA	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121340_453.jpg	image/jpeg	357675	2015-10-31 11:19:37.574199	active	2015-10-31 11:19:37.587317	2015-10-31 11:19:37.587317
2131	3	64	29	SCOUTVB13	TCHAD	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121438_096.jpg	image/jpeg	483708	2015-10-31 11:20:36.056892	active	2015-10-31 11:20:36.07041	2015-10-31 11:20:36.07041
2132	3	64	29	SCOUTVB14	BHUTAN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121505_463.jpg	image/jpeg	591010	2015-10-31 11:21:22.686391	active	2015-10-31 11:21:22.701126	2015-10-31 11:21:22.701126
2133	3	64	29	SCOUTVB15	BHUTAN	25.00	<p>very big size scout stamp&nbsp;</p>\r\n	IMG_20151031_121647_063.jpg	image/jpeg	625728	2015-10-31 11:22:32.452718	active	2015-10-31 11:22:32.467101	2015-10-31 11:22:32.467101
2134	3	64	29	SCOUTBG1	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_113540_406.jpg	image/jpeg	473214	2015-10-31 11:46:42.714064	active	2015-10-31 11:46:42.729384	2015-10-31 11:46:42.729384
2135	3	64	29	SCOUTBG2	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_113606_863.jpg	image/jpeg	492139	2015-10-31 11:47:26.129309	active	2015-10-31 11:47:26.143457	2015-10-31 11:47:26.143457
2136	3	64	29	SCOUTBG3	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_115745_725.jpg	image/jpeg	599191	2015-10-31 11:48:19.336734	active	2015-10-31 11:48:19.350222	2015-10-31 11:48:19.350222
2137	3	64	29	SOUTBG4	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_115804_897.jpg	image/jpeg	850874	2015-10-31 11:49:09.129317	active	2015-10-31 11:49:09.143772	2015-10-31 11:49:09.143772
2138	3	64	29	SCOUTBG5	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_115920_114.jpg	image/jpeg	579271	2015-10-31 11:49:52.985054	active	2015-10-31 11:49:53.001362	2015-10-31 11:49:53.001362
2139	3	64	29	SCOUTBG6	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120030_149.jpg	image/jpeg	798928	2015-10-31 11:50:40.671618	active	2015-10-31 11:50:40.686268	2015-10-31 11:50:40.686268
2140	3	64	29	SCOUTBG7	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120120_554.jpg	image/jpeg	869673	2015-10-31 11:51:40.760295	active	2015-10-31 11:51:40.774701	2015-10-31 11:51:40.774701
2141	3	64	29	SCOUTBG8	UPPER VOLTA	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120303_216.jpg	image/jpeg	1208079	2015-10-31 11:52:58.234616	active	2015-10-31 11:52:58.252936	2015-10-31 11:52:58.252936
2142	3	64	29	SCOUTBG9	UPPER VOLTA	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120412_814.jpg	image/jpeg	575571	2015-10-31 11:54:12.600133	active	2015-10-31 11:54:12.614276	2015-10-31 11:54:12.614276
2143	3	64	29	SCOUTBG10	GUINIE	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120501_306.jpg	image/jpeg	543620	2015-10-31 11:54:58.195518	active	2015-10-31 11:54:58.20944	2015-10-31 11:54:58.20944
2144	3	64	29	SCOUTBG11	LAOS	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120556_977.jpg	image/jpeg	412803	2015-10-31 11:55:41.457235	active	2015-10-31 11:55:41.470758	2015-10-31 11:55:41.470758
2145	3	64	29	SCOUTBG12	GUINIE	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120825_141.jpg	image/jpeg	383694	2015-10-31 11:56:25.185153	active	2015-10-31 11:56:25.198857	2015-10-31 11:56:25.198857
2146	3	64	29	SCOUTBG13	AJMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_121618_014.jpg	image/jpeg	426009	2015-10-31 11:57:17.60923	active	2015-10-31 11:57:17.622508	2015-10-31 11:57:17.622508
2147	3	64	29	SCOUTBG14	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_121726_447.jpg	image/jpeg	713396	2015-10-31 11:58:26.687315	active	2015-10-31 11:58:26.703356	2015-10-31 11:58:26.703356
2148	3	64	29	SCOUTBG15	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_121756_213.jpg	image/jpeg	585432	2015-10-31 11:59:18.664068	active	2015-10-31 11:59:18.677539	2015-10-31 11:59:18.677539
2149	3	64	29	SCOUTBG16	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_121822_876.jpg	image/jpeg	516178	2015-10-31 12:00:12.184007	active	2015-10-31 12:00:12.197633	2015-10-31 12:00:12.197633
2150	3	64	29	SCOUTBG17	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_121924_122.jpg	image/jpeg	539916	2015-10-31 12:00:55.380212	active	2015-10-31 12:00:55.39786	2015-10-31 12:00:55.39786
2151	3	64	29	SCOUTBG18	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122000_836.jpg	image/jpeg	678406	2015-10-31 12:01:45.658146	active	2015-10-31 12:01:45.672909	2015-10-31 12:01:45.672909
2152	3	64	29	SCOUTBG19	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122026_215.jpg	image/jpeg	610215	2015-10-31 12:02:35.487302	active	2015-10-31 12:02:35.501705	2015-10-31 12:02:35.501705
2153	3	64	29	SCOUTBG20	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122043_499.jpg	image/jpeg	692382	2015-10-31 12:03:25.883127	active	2015-10-31 12:03:25.897581	2015-10-31 12:03:25.897581
2154	3	64	29	SCOUTBG21	SCOTLAND	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122128_587.jpg	image/jpeg	518046	2015-10-31 12:04:09.188811	active	2015-10-31 12:04:09.205069	2015-10-31 12:04:09.205069
2155	3	64	29	SCOUTBG22	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122604_460.jpg	image/jpeg	458645	2015-10-31 12:05:29.204167	active	2015-10-31 12:05:29.219776	2015-10-31 12:05:29.219776
2156	3	64	29	SCOUTBG23	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122655_485.jpg	image/jpeg	447627	2015-10-31 12:06:23.016688	active	2015-10-31 12:06:23.03069	2015-10-31 12:06:23.03069
2157	3	64	29	SCOUTBG24	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122723_107.jpg	image/jpeg	956535	2015-10-31 12:07:45.072069	active	2015-10-31 12:07:45.087635	2015-10-31 12:07:45.087635
2158	3	64	29	SCOUTBG25	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122747_417.jpg	image/jpeg	681590	2015-10-31 12:08:39.376775	active	2015-10-31 12:08:39.392601	2015-10-31 12:08:39.392601
2159	3	64	29	SCOUTBG26	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122951_137.jpg	image/jpeg	875389	2015-10-31 12:10:03.183818	active	2015-10-31 12:10:03.198935	2015-10-31 12:10:03.198935
2160	3	64	29	SCOUTBG27	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123020_929.jpg	image/jpeg	899841	2015-10-31 12:11:37.982451	active	2015-10-31 12:11:37.997876	2015-10-31 12:11:37.997876
2161	3	64	29	SCOUTBG28	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123040_841.jpg	image/jpeg	1036278	2015-10-31 12:12:54.64714	active	2015-10-31 12:12:54.663404	2015-10-31 12:12:54.663404
2162	3	64	29	SCOUTBG29	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123059_660.jpg	image/jpeg	878952	2015-10-31 12:13:58.934864	active	2015-10-31 12:13:58.950919	2015-10-31 12:13:58.950919
2163	3	64	29	SCOUTBG30	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123127_982.jpg	image/jpeg	782918	2015-10-31 12:15:08.780583	active	2015-10-31 12:15:08.795533	2015-10-31 12:15:08.795533
2164	3	64	29	SCOUTBG31	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123213_529.jpg	image/jpeg	1211228	2015-10-31 12:16:41.147562	active	2015-10-31 12:16:41.166995	2015-10-31 12:16:41.166995
2165	3	64	29	SCOUTBG32	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123240_070.jpg	image/jpeg	1041534	2015-10-31 12:19:37.791517	active	2015-10-31 12:19:37.811226	2015-10-31 12:19:37.811226
2166	3	64	29	SCOUTBG33	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123259_654.jpg	image/jpeg	987927	2015-10-31 12:20:34.116574	active	2015-10-31 12:20:34.133314	2015-10-31 12:20:34.133314
2167	3	64	29	SCOUTBG34	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123336_428.jpg	image/jpeg	900885	2015-10-31 12:21:29.323668	active	2015-10-31 12:21:29.339111	2015-10-31 12:21:29.339111
2168	3	64	29	SCOUTBG35	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123353_042.jpg	image/jpeg	837403	2015-10-31 12:23:30.263517	active	2015-10-31 12:23:30.278697	2015-10-31 12:23:30.278697
2169	3	64	29	SCOUTBG36	OMAN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123428_209.jpg	image/jpeg	406470	2015-10-31 12:24:35.504755	active	2015-10-31 12:24:35.518269	2015-10-31 12:24:35.518269
2170	3	64	29	SCOUTBG37	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123500_222.jpg	image/jpeg	351954	2015-10-31 12:25:20.655791	active	2015-10-31 12:25:20.670071	2015-10-31 12:25:20.670071
2171	3	64	29	SCOUTMD1	SWITZERLAND	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_122324_526.jpg	image/jpeg	537955	2015-10-31 12:34:23.356098	active	2015-10-31 12:34:23.371879	2015-10-31 12:34:23.371879
2172	3	64	29	SCOUTMD2	ST. LUCIA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123630_285.jpg	image/jpeg	400527	2015-10-31 12:35:40.754127	active	2015-10-31 12:35:40.769159	2015-10-31 12:35:40.769159
2173	3	64	29	SCOUTMD3	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123651_345.jpg	image/jpeg	580656	2015-10-31 12:36:32.579091	active	2015-10-31 12:36:32.595347	2015-10-31 12:36:32.595347
2174	3	64	29	SCOUTMD4	RWANDA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123724_972.jpg	image/jpeg	482738	2015-10-31 12:37:23.525116	active	2015-10-31 12:37:23.538693	2015-10-31 12:37:23.538693
2175	3	64	29	SCOUTMD5	UNITED KINGDOM	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123903_935.jpg	image/jpeg	433037	2015-10-31 12:38:26.916845	active	2015-10-31 12:38:26.930527	2015-10-31 12:38:26.930527
2176	3	64	29	SCOUTMD6	NICARAGUA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_123937_328.jpg	image/jpeg	377203	2015-10-31 12:39:17.516866	active	2015-10-31 12:39:17.529771	2015-10-31 12:39:17.529771
2177	3	64	29	SCOUTMD7	TANZANIA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124003_411.jpg	image/jpeg	372580	2015-10-31 12:39:58.22871	active	2015-10-31 12:39:58.244305	2015-10-31 12:39:58.244305
2178	3	64	29	SCOUTMD8	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124101_109.jpg	image/jpeg	696163	2015-10-31 12:40:40.445582	active	2015-10-31 12:40:40.461275	2015-10-31 12:40:40.461275
2179	3	64	29	SCOUTMD9	ANTIGUA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124144_023.jpg	image/jpeg	600298	2015-10-31 12:41:42.668976	active	2015-10-31 12:41:42.683367	2015-10-31 12:41:42.683367
2180	3	64	29	SCOUTMD10	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124222_773.jpg	image/jpeg	522044	2015-10-31 12:42:25.804646	active	2015-10-31 12:42:25.818212	2015-10-31 12:42:25.818212
2181	3	64	29	SCOUTMD11	ANTIGUA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124255_772.jpg	image/jpeg	475581	2015-10-31 12:43:17.061763	active	2015-10-31 12:43:17.076651	2015-10-31 12:43:17.076651
2182	3	64	29	SCOUTMD12	DOMINICA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124347_960.jpg	image/jpeg	398574	2015-10-31 12:44:16.44303	active	2015-10-31 12:44:16.456474	2015-10-31 12:44:16.456474
2183	3	64	29	SCOUTMD13	DOMINICA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124415_408.jpg	image/jpeg	760852	2015-10-31 12:45:18.014441	active	2015-10-31 12:45:18.028606	2015-10-31 12:45:18.028606
2184	3	64	29	SCOUTMD14	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124454_936.jpg	image/jpeg	541150	2015-10-31 12:47:05.12574	active	2015-10-31 12:47:05.142534	2015-10-31 12:47:05.142534
2185	3	64	29	SCOUTMD15	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_124527_342.jpg	image/jpeg	437416	2015-10-31 12:48:09.284775	active	2015-10-31 12:48:09.299503	2015-10-31 12:48:09.299503
2186	3	64	29	SCOUTMD16	RWANDA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125406_804.jpg	image/jpeg	345599	2015-10-31 12:48:51.548708	active	2015-10-31 12:48:51.563008	2015-10-31 12:48:51.563008
2187	3	64	29	SCOUTMD17	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125431_281.jpg	image/jpeg	446905	2015-10-31 12:49:46.032577	active	2015-10-31 12:49:46.046559	2015-10-31 12:49:46.046559
2188	3	64	29	SCOUTMD18	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125449_892.jpg	image/jpeg	753596	2015-10-31 12:50:35.31421	active	2015-10-31 12:50:35.328455	2015-10-31 12:50:35.328455
2189	3	64	29	SCOUTMD19	NICARAGUA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125515_793.jpg	image/jpeg	699217	2015-10-31 12:52:57.749652	active	2015-10-31 12:52:57.767537	2015-10-31 12:52:57.767537
2190	3	64	29	SCOUTMD20	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125615_482.jpg	image/jpeg	902613	2015-10-31 12:54:08.931287	active	2015-10-31 12:54:08.948027	2015-10-31 12:54:08.948027
2191	3	64	29	SCOUTMD21	NICARAGUA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125643_091.jpg	image/jpeg	716022	2015-10-31 12:55:36.370418	active	2015-10-31 12:55:36.385365	2015-10-31 12:55:36.385365
2192	3	64	29	SCOUTMD22	BANGLADESH	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125748_620.jpg	image/jpeg	249253	2015-10-31 12:57:32.94314	active	2015-10-31 12:57:32.95703	2015-10-31 12:57:32.95703
2193	3	64	29	SCOUTMD23	GHANA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125838_062.jpg	image/jpeg	254168	2015-10-31 12:58:38.128036	active	2015-10-31 12:58:38.141256	2015-10-31 12:58:38.141256
2194	3	64	29	SCOUTMD24	MALDIVES	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125914_263.jpg	image/jpeg	260491	2015-10-31 12:59:26.583998	active	2015-10-31 12:59:26.598543	2015-10-31 12:59:26.598543
2195	3	64	29	SCOUTMD24	GRENADA	9.00	<p>Medium size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_125937_458.jpg	image/jpeg	513705	2015-10-31 13:00:30.33528	active	2015-10-31 13:00:30.350179	2015-10-31 13:00:30.350179
2196	3	64	29	SCOUTBG39	MANAMA BAHRAIN	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120351_721.jpg	image/jpeg	494565	2015-10-31 13:03:36.627807	active	2015-10-31 13:03:36.643034	2015-10-31 13:03:36.643034
2197	3	64	29	SCOUTBG40	SOUTH ARABIA	13.00	<p>Big size Scout&nbsp;stamp&nbsp;</p>\r\n	IMG_20151031_120144_659.jpg	image/jpeg	1092272	2015-10-31 13:04:59.294805	active	2015-10-31 13:04:59.31411	2015-10-31 13:04:59.31411
2198	3	18	5	MSCELEB88	COMORES	250.00	<p>Sheet of 6 Celebraties&nbsp;stamps</p>\r\n	IMG_20151031_113708_296.jpg	image/jpeg	1148263	2015-10-31 13:16:36.519416	active	2015-10-31 13:16:36.537705	2015-10-31 13:16:36.537705
2199	3	18	5	MSSCIENC89	COMORES	350.00	<p>Sheet of 6 scientist stamps</p>\r\n	IMG_20151031_113806_467.jpg	image/jpeg	1076091	2015-10-31 13:18:53.511605	active	2015-10-31 13:18:53.527338	2015-10-31 13:18:53.527338
2200	3	18	5	MSSCIENC90	COMORES	250.00	<p>Sheet of 6 scientist stamps</p>\r\n	IMG_20151031_113858_999.jpg	image/jpeg	806229	2015-10-31 13:20:50.830487	active	2015-10-31 13:20:50.848928	2015-10-31 13:20:50.848928
2201	3	18	5	MSMUSIC91	COMORES	300.00	<p>Sheet of 4 music personality stamps</p>\r\n	IMG_20151031_113948_181.jpg	image/jpeg	734239	2015-10-31 13:22:00.424092	active	2015-10-31 13:22:00.440219	2015-10-31 13:22:00.440219
2202	3	18	5	MSAUTO92	TANZANIA	300.00	<p>Sheet of 4 automobile stamps</p>\r\n	IMG_20151031_114020_058.jpg	image/jpeg	803372	2015-10-31 13:23:13.938885	active	2015-10-31 13:23:13.954845	2015-10-31 13:23:13.954845
2203	3	18	5	MSFOOT93	COMORES	300.00	<p>Sheet of 4 footbal player stamps</p>\r\n	IMG_20151031_114045_845.jpg	image/jpeg	916366	2015-10-31 13:24:49.217195	active	2015-10-31 13:24:49.232907	2015-10-31 13:24:49.232907
2204	3	18	5	MSASTRO94	COMORES	300.00	<p>Sheet of 4 astronaut stamps</p>\r\n	IMG_20151031_114112_001.jpg	image/jpeg	584148	2015-10-31 13:25:55.813105	active	2015-10-31 13:25:55.827158	2015-10-31 13:25:55.827158
2205	3	18	5	MSFOOT95	COMORES	300.00	<p>Sheet of 4 football player&nbsp;stamps</p>\r\n	IMG_20151031_114159_644.jpg	image/jpeg	831563	2015-10-31 13:26:56.539567	active	2015-10-31 13:26:56.555578	2015-10-31 13:26:56.555578
2206	3	18	2	MSCW10	SOOLOMAN ISLANDS	250.00	<p>single stamp miniature sheet</p>\r\n	IMG_20151031_114305_118.jpg	image/jpeg	677116	2015-10-31 13:29:37.184811	active	2015-10-31 13:29:37.201031	2015-10-31 13:29:37.201031
2207	3	18	2	MSCW11	ST. VINCENT	300.00	<p>Sheet of 2 cricket &nbsp;stamps</p>\r\n	IMG_20151031_114343_850.jpg	image/jpeg	588369	2015-10-31 13:30:46.62023	active	2015-10-31 13:30:46.634746	2015-10-31 13:30:46.634746
2208	3	18	2	MSCW12	ST.  VINCENT	250.00	<p>Sheet of 2 sports player&nbsp;stamps</p>\r\n	IMG_20151031_114416_009.jpg	image/jpeg	437891	2015-10-31 13:32:08.965787	active	2015-10-31 13:32:08.983025	2015-10-31 13:32:08.983025
2209	3	18	2	MSCW13	ST. VINCENT	250.00	<p>single stamp on&nbsp;miniature sheet</p>\r\n	IMG_20151031_114452_571.jpg	image/jpeg	412488	2015-10-31 13:33:21.749502	active	2015-10-31 13:33:21.765958	2015-10-31 13:33:21.765958
2210	3	18	5	MSFOOT96	GUINIE	300.00	<p>Sheet of 6 football player stamps</p>\r\n	IMG_20151031_114540_245.jpg	image/jpeg	775555	2015-10-31 13:36:18.496452	active	2015-10-31 13:36:18.512145	2015-10-31 13:36:18.512145
2211	3	18	5	MSFOOT97	GUINIE	300.00	<p>Sheet of 6 football player stamps</p>\r\n	IMG_20151031_114625_466.jpg	image/jpeg	802864	2015-10-31 13:38:54.1761	active	2015-10-31 13:38:54.193065	2015-10-31 13:38:54.193065
2212	3	18	5	MSCELEB98	COMORES	300.00	<p>Sheet of 6 asian celebrity stamps</p>\r\n	IMG_20151031_114710_025.jpg	image/jpeg	915481	2015-10-31 13:46:17.784809	active	2015-10-31 13:46:17.801939	2015-10-31 13:46:17.801939
2213	3	18	5	MSSPORT99	COMORES	200.00	<p>Sheet of 6 table tennis player&nbsp;stamps</p>\r\n	IMG_20151031_114739_086.jpg	image/jpeg	794786	2015-10-31 13:47:37.790918	active	2015-10-31 13:47:37.807083	2015-10-31 13:47:37.807083
2214	3	18	5	MSCELEB100	COMORES	500.00	<p>Sheet of 6 actress&nbsp;stamps</p>\r\n	IMG_20151031_114829_751.jpg	image/jpeg	675552	2015-10-31 13:51:39.28534	active	2015-10-31 13:51:39.302142	2015-10-31 13:51:39.302142
2215	3	18	5	MSMUSIC101	COMORES	500.00	<p>Sheet of 6 musician stamps</p>\r\n	IMG_20151031_114900_986.jpg	image/jpeg	778112	2015-10-31 13:53:29.651602	active	2015-10-31 13:53:29.667125	2015-10-31 13:53:29.667125
2216	3	18	5	MSSHIP102	COMORES	700.00	<p>Sheet of 6 ship&nbsp;stamps</p>\r\n	IMG_20151031_114944_171.jpg	image/jpeg	838465	2015-10-31 13:56:13.944037	active	2015-10-31 13:56:13.959571	2015-10-31 13:56:13.959571
2217	3	18	5	MSFIRE103	COMORES	500.00	<p>Sheet of 6 firemen&nbsp;stamps</p>\r\n	IMG_20151031_115049_153.jpg	image/jpeg	807417	2015-10-31 13:57:48.328197	active	2015-10-31 13:57:48.344424	2015-10-31 13:57:48.344424
2218	3	18	5	MSTRAIN104	COMORES	400.00	<p>Sheet of 6 train stamps</p>\r\n	IMG_20151031_115117_225.jpg	image/jpeg	763502	2015-10-31 14:00:21.436891	active	2015-10-31 14:00:21.454641	2015-10-31 14:00:21.454641
2219	3	18	5	MSDRWIN104	COMORES	400.00	<p>Sheet of 6 Charles Darwin stamps</p>\r\n	IMG_20151031_115249_621.jpg	image/jpeg	862667	2015-10-31 14:02:03.563067	active	2015-10-31 14:02:03.579968	2015-10-31 14:02:03.579968
2220	3	18	5	MSSPORT105	SRI LANKA	400.00	<p>Sheet of 12 muralitharan&nbsp;stamps</p>\r\n	IMG_20151031_115333_973.jpg	image/jpeg	531246	2015-10-31 14:04:02.159812	active	2015-10-31 14:04:02.173736	2015-10-31 14:04:02.173736
2221	3	18	5	MSGOLF106	COMES	150.00	<p>Sheet of 2 golf player stamps</p>\r\n	IMG_20151031_115402_087.jpg	image/jpeg	667213	2015-10-31 14:05:28.64295	active	2015-10-31 14:05:28.66204	2015-10-31 14:05:28.66204
2222	3	18	5	MSSKI107	COMORES	150.00	<p>Sheet of 2 ski players stamps</p>\r\n	IMG_20151031_115430_310.jpg	image/jpeg	488903	2015-10-31 14:06:32.332374	active	2015-10-31 14:06:32.347313	2015-10-31 14:06:32.347313
2223	3	18	5	MSF1108	COMORES	150.00	<p>Sheet of 2 Formula 1 player stamps</p>\r\n	IMG_20151031_115500_456.jpg	image/jpeg	476776	2015-10-31 14:08:22.660074	active	2015-10-31 14:08:22.674601	2015-10-31 14:08:22.674601
2224	3	18	5	MSSNOW109	COMORES	150.00	<p>Sheet of 2 snow game player stamps</p>\r\n	IMG_20151031_115523_471.jpg	image/jpeg	501013	2015-10-31 14:09:23.739192	active	2015-10-31 14:09:23.753274	2015-10-31 14:09:23.753274
2225	3	18	30	MSIND1	INDIA	200.00	<p>miniature sheet of single stamp</p>\r\n	IMG_20151031_115215_926.jpg	image/jpeg	450068	2015-10-31 14:12:00.673204	active	2015-10-31 14:12:00.689009	2015-10-31 14:12:00.689009
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ava
--

SELECT pg_catalog.setval('products_id_seq', 2225, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ava
--

COPY schema_migrations (version) FROM stdin;
20150911005424
20150911005434
20150911005449
20150911005455
20150911005502
20150820011413
20150820011429
20150820011442
20150820011653
\.


--
-- Name: product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ava; Tablespace: 
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: ava; Tablespace: 
--

ALTER TABLE ONLY product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: product_subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: ava; Tablespace: 
--

ALTER TABLE ONLY product_subcategories
    ADD CONSTRAINT product_subcategories_pkey PRIMARY KEY (id);


--
-- Name: product_subsubcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: ava; Tablespace: 
--

ALTER TABLE ONLY product_subsubcategories
    ADD CONSTRAINT product_subsubcategories_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: ava; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: ava; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

