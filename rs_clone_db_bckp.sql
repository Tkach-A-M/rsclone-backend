--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

--
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities_info (
    city_id integer NOT NULL,
    city_name character varying(255)
);


ALTER TABLE public.cities_info OWNER TO postgres;

--
-- Name: cities_info_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_info_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_info_city_id_seq OWNER TO postgres;

--
-- Name: cities_info_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_info_city_id_seq OWNED BY public.cities_info.city_id;


--
-- Name: city_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_info (
    city_id integer NOT NULL,
    city_name character varying(255)
);


ALTER TABLE public.city_info OWNER TO postgres;

--
-- Name: city_info_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_info_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_info_city_id_seq OWNER TO postgres;

--
-- Name: city_info_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_info_city_id_seq OWNED BY public.city_info.city_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id_customer smallint NOT NULL,
    customer_phone_number "char",
    customer_name "char",
    customer_login "char",
    customer_picture "char",
    customer_city "char",
    customer_addres text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id_feedback smallint NOT NULL,
    id_meal smallint NOT NULL,
    id_customer smallint NOT NULL,
    feedback_text text NOT NULL,
    rating numeric NOT NULL
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu smallint NOT NULL,
    id_meal smallint NOT NULL,
    meal_name "char" NOT NULL,
    picture "char",
    description text,
    price numeric NOT NULL,
    additional_info "char",
    rating smallint,
    order_count smallint NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id_order smallint NOT NULL,
    id_customer smallint NOT NULL,
    order_list text NOT NULL,
    order_time time with time zone NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: shop_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_info (
    id_shop smallint NOT NULL,
    shop_name "char" NOT NULL,
    ctiy_name "char" NOT NULL,
    waiting_time "char",
    weekend "char",
    shop_rating real,
    shop_description text,
    open_time time without time zone NOT NULL,
    close_time time without time zone NOT NULL
);


ALTER TABLE public.shop_info OWNER TO postgres;

--
-- Name: shops_to_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops_to_menu (
    id_shop smallint NOT NULL,
    id_menu smallint NOT NULL
);


ALTER TABLE public.shops_to_menu OWNER TO postgres;

--
-- Name: calendar; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.calendar (
    id_calendar integer NOT NULL,
    day_of_week character varying(16),
    number_of_day smallint,
    time_start time without time zone,
    time_end time without time zone
);


ALTER TABLE test.calendar OWNER TO postgres;

--
-- Name: calendar_id_calendar_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.calendar_id_calendar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.calendar_id_calendar_seq OWNER TO postgres;

--
-- Name: calendar_id_calendar_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.calendar_id_calendar_seq OWNED BY test.calendar.id_calendar;


--
-- Name: calendar_to_shop; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.calendar_to_shop (
    id_shop integer,
    id_calendar integer
);


ALTER TABLE test.calendar_to_shop OWNER TO postgres;

--
-- Name: city_info; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.city_info (
    city_id integer NOT NULL,
    city_name character varying(255)
);


ALTER TABLE test.city_info OWNER TO postgres;

--
-- Name: city_info_city_id_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.city_info_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.city_info_city_id_seq OWNER TO postgres;

--
-- Name: city_info_city_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.city_info_city_id_seq OWNED BY test.city_info.city_id;


--
-- Name: customers; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.customers (
    id_customer integer NOT NULL,
    user_phone character varying(25) NOT NULL,
    user_password character varying(255) NOT NULL,
    username character varying(25)
);


ALTER TABLE test.customers OWNER TO postgres;

--
-- Name: customers_id_customer_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.customers_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.customers_id_customer_seq OWNER TO postgres;

--
-- Name: customers_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.customers_id_customer_seq OWNED BY test.customers.id_customer;


--
-- Name: feedbacks; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.feedbacks (
    id_feedback integer NOT NULL,
    id_meal smallint,
    id_shop smallint,
    id_customer smallint,
    description text,
    rating smallint
);


ALTER TABLE test.feedbacks OWNER TO postgres;

--
-- Name: feedbacks_id_feedback_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.feedbacks_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.feedbacks_id_feedback_seq OWNER TO postgres;

--
-- Name: feedbacks_id_feedback_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.feedbacks_id_feedback_seq OWNED BY test.feedbacks.id_feedback;


--
-- Name: lang_settings; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.lang_settings (
    id_language integer,
    lang_name character varying(20)
);


ALTER TABLE test.lang_settings OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.menu (
    id_menu integer,
    id_meal integer NOT NULL,
    meal_name character varying(255),
    meal_type character varying(50),
    meal_ingrids text,
    meal_desc character varying(20),
    image text,
    price real,
    in_menu boolean
);


ALTER TABLE test.menu OWNER TO postgres;

--
-- Name: menu_id_meal_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.menu_id_meal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.menu_id_meal_seq OWNER TO postgres;

--
-- Name: menu_id_meal_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.menu_id_meal_seq OWNED BY test.menu.id_meal;


--
-- Name: orders; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.orders (
    order_id integer NOT NULL,
    id_customer smallint,
    order_list character varying(255),
    status boolean,
    price real
);


ALTER TABLE test.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.orders_order_id_seq OWNED BY test.orders.order_id;


--
-- Name: orders_to_meal; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.orders_to_meal (
    order_id integer,
    meal_id integer
);


ALTER TABLE test.orders_to_meal OWNER TO postgres;

--
-- Name: shop_info; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.shop_info (
    id_shop integer NOT NULL,
    shop_name character varying(255),
    city_id smallint,
    waiting_time smallint,
    shop_description text,
    shop_logo character varying(255)
);


ALTER TABLE test.shop_info OWNER TO postgres;

--
-- Name: shop_info_id_shop_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.shop_info_id_shop_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.shop_info_id_shop_seq OWNER TO postgres;

--
-- Name: shop_info_id_shop_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.shop_info_id_shop_seq OWNED BY test.shop_info.id_shop;


--
-- Name: shop_to_menu; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.shop_to_menu (
    id_shop integer,
    id_menu integer
);


ALTER TABLE test.shop_to_menu OWNER TO postgres;

--
-- Name: test; Type: TABLE; Schema: test; Owner: postgres
--

CREATE TABLE test.test (
    my_id integer NOT NULL,
    my_name character varying(100)
);


ALTER TABLE test.test OWNER TO postgres;

--
-- Name: test_my_id_seq; Type: SEQUENCE; Schema: test; Owner: postgres
--

CREATE SEQUENCE test.test_my_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.test_my_id_seq OWNER TO postgres;

--
-- Name: test_my_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: postgres
--

ALTER SEQUENCE test.test_my_id_seq OWNED BY test.test.my_id;


--
-- Name: cities_info city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities_info ALTER COLUMN city_id SET DEFAULT nextval('public.cities_info_city_id_seq'::regclass);


--
-- Name: city_info city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_info ALTER COLUMN city_id SET DEFAULT nextval('public.city_info_city_id_seq'::regclass);


--
-- Name: calendar id_calendar; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.calendar ALTER COLUMN id_calendar SET DEFAULT nextval('test.calendar_id_calendar_seq'::regclass);


--
-- Name: city_info city_id; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.city_info ALTER COLUMN city_id SET DEFAULT nextval('test.city_info_city_id_seq'::regclass);


--
-- Name: customers id_customer; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.customers ALTER COLUMN id_customer SET DEFAULT nextval('test.customers_id_customer_seq'::regclass);


--
-- Name: feedbacks id_feedback; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.feedbacks ALTER COLUMN id_feedback SET DEFAULT nextval('test.feedbacks_id_feedback_seq'::regclass);


--
-- Name: menu id_meal; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.menu ALTER COLUMN id_meal SET DEFAULT nextval('test.menu_id_meal_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.orders ALTER COLUMN order_id SET DEFAULT nextval('test.orders_order_id_seq'::regclass);


--
-- Name: shop_info id_shop; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.shop_info ALTER COLUMN id_shop SET DEFAULT nextval('test.shop_info_id_shop_seq'::regclass);


--
-- Name: test my_id; Type: DEFAULT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.test ALTER COLUMN my_id SET DEFAULT nextval('test.test_my_id_seq'::regclass);


--
-- Data for Name: cities_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities_info (city_id, city_name) FROM stdin;
2	Витебск
1	Брест
3	Гомель
4	Гродно
5	Минск
6	Могилёв
7	Брест
\.


--
-- Data for Name: city_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_info (city_id, city_name) FROM stdin;
1	Брест
2	Витебск
3	Гомель
4	Гродно
5	Минск
6	Могилёв
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id_customer, customer_phone_number, customer_name, customer_login, customer_picture, customer_city, customer_addres) FROM stdin;
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id_feedback, id_meal, id_customer, feedback_text, rating) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, id_meal, meal_name, picture, description, price, additional_info, rating, order_count) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id_order, id_customer, order_list, order_time, price) FROM stdin;
\.


--
-- Data for Name: shop_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_info (id_shop, shop_name, ctiy_name, waiting_time, weekend, shop_rating, shop_description, open_time, close_time) FROM stdin;
1	S	�	~	v	2.3	Описание	07:37:16	10:37:16
\.


--
-- Data for Name: shops_to_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shops_to_menu (id_shop, id_menu) FROM stdin;
\.


--
-- Data for Name: calendar; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.calendar (id_calendar, day_of_week, number_of_day, time_start, time_end) FROM stdin;
1	Понедельник	1	10:00:00	22:30:00
1	Вторник	2	10:00:00	22:30:00
1	Среда	3	10:00:00	22:30:00
1	Четверг	4	10:00:00	22:30:00
1	Пятница	5	10:00:00	22:30:00
1	Суббота	6	10:00:00	22:30:00
1	Воскресенье	0	10:00:00	22:30:00
2	Понедельник	1	10:00:00	24:00:00
2	Вторник	2	10:00:00	24:00:00
2	Среда	3	10:00:00	24:00:00
2	Четверг	4	10:00:00	24:00:00
2	Пятница	5	10:00:00	02:00:00
2	Суббота	6	10:00:00	02:00:00
2	Воскресенье	0	10:00:00	24:00:00
3	Понедельник	1	12:00:00	23:00:00
3	Вторник	2	12:00:00	23:00:00
3	Среда	3	12:00:00	23:00:00
3	Четверг	4	12:00:00	23:00:00
3	Пятница	5	12:00:00	01:00:00
3	Суббота	6	12:00:00	01:00:00
3	Воскресенье	0	12:00:00	23:00:00
4	Понедельник	1	10:00:00	22:45:00
4	Вторник	2	10:00:00	22:45:00
4	Среда	3	10:00:00	22:45:00
4	Четверг	4	10:00:00	22:45:00
4	Пятница	5	10:00:00	22:45:00
4	Суббота	6	10:00:00	22:45:00
4	Воскресенье	0	10:00:00	22:45:00
5	Понедельник	1	12:00:00	23:00:00
5	Вторник	2	12:00:00	23:00:00
5	Среда	3	12:00:00	23:00:00
5	Четверг	4	12:00:00	23:00:00
5	Пятница	5	12:00:00	23:00:00
5	Суббота	6	12:00:00	23:00:00
5	Воскресенье	0	12:00:00	23:00:00
6	Понедельник	1	11:00:00	22:30:00
6	Вторник	2	11:00:00	22:30:00
6	Среда	3	11:00:00	22:30:00
6	Четверг	4	11:00:00	22:30:00
6	Пятница	5	11:00:00	22:30:00
6	Суббота	6	11:00:00	22:30:00
6	Воскресенье	0	11:00:00	22:30:00
7	Понедельник	1	11:00:00	23:00:00
7	Вторник	2	11:00:00	23:00:00
7	Среда	3	11:00:00	23:00:00
7	Четверг	4	11:00:00	23:00:00
7	Пятница	5	11:00:00	23:00:00
7	Суббота	6	11:00:00	23:00:00
7	Воскресенье	0	11:00:00	23:00:00
8	Понедельник	1	09:00:00	24:00:00
8	Вторник	2	09:00:00	24:00:00
8	Среда	3	09:00:00	24:00:00
8	Четверг	4	09:00:00	24:00:00
8	Пятница	5	09:00:00	24:00:00
8	Суббота	6	09:00:00	24:00:00
8	Воскресенье	0	09:00:00	24:00:00
9	Понедельник	1	11:00:00	22:50:00
9	Вторник	2	11:00:00	22:50:00
9	Среда	3	11:00:00	22:50:00
9	Четверг	4	11:00:00	22:50:00
9	Пятница	5	11:00:00	22:50:00
9	Суббота	6	11:00:00	22:50:00
9	Воскресенье	0	11:00:00	22:50:00
10	Понедельник	1	09:00:00	23:00:00
10	Вторник	2	09:00:00	23:00:00
10	Среда	3	09:00:00	23:00:00
10	Четверг	4	09:00:00	23:00:00
10	Пятница	5	09:00:00	23:00:00
10	Суббота	6	09:00:00	23:00:00
10	Воскресенье	0	09:00:00	23:00:00
11	Понедельник	1	07:00:00	24:00:00
11	Вторник	2	07:00:00	24:00:00
11	Среда	3	07:00:00	24:00:00
11	Четверг	4	07:00:00	24:00:00
11	Пятница	5	07:00:00	24:00:00
11	Суббота	6	07:00:00	24:00:00
11	Воскресенье	0	07:00:00	24:00:00
12	Понедельник	1	11:00:00	23:00:00
12	Вторник	2	11:00:00	23:00:00
12	Среда	3	11:00:00	23:00:00
12	Четверг	4	11:00:00	23:00:00
12	Пятница	5	11:00:00	23:00:00
12	Суббота	6	11:00:00	23:00:00
12	Воскресенье	0	11:00:00	23:00:00
13	Понедельник	1	11:00:00	23:00:00
13	Вторник	2	11:00:01	23:00:00
13	Среда	3	11:00:02	23:00:00
13	Четверг	4	11:00:03	23:00:00
13	Пятница	5	11:00:04	23:00:00
13	Суббота	6	11:00:05	23:00:00
13	Воскресенье	0	11:00:06	23:00:00
14	Понедельник	1	11:00:00	22:00:00
14	Вторник	2	11:00:00	22:00:00
14	Среда	3	11:00:00	22:00:00
14	Четверг	4	11:00:00	22:00:00
14	Пятница	5	11:00:00	22:00:00
14	Суббота	6	11:00:00	22:00:00
14	Воскресенье	0	11:00:00	22:00:00
15	Понедельник	1	08:00:00	23:00:00
15	Вторник	2	08:00:00	23:00:00
15	Среда	3	08:00:00	23:00:00
15	Четверг	4	08:00:00	23:00:00
15	Пятница	5	08:00:00	23:00:00
15	Суббота	6	08:00:00	23:00:00
15	Воскресенье	0	08:00:00	23:00:00
16	Понедельник	1	12:00:00	21:00:00
16	Вторник	2	12:00:00	21:00:00
16	Среда	3	12:00:00	21:00:00
16	Четверг	4	12:00:00	21:00:00
16	Пятница	5	12:00:00	21:00:00
16	Суббота	6	12:00:00	21:00:00
16	Воскресенье	0	12:00:00	21:00:00
17	Понедельник	1	11:00:00	23:00:00
17	Вторник	2	11:00:00	23:00:00
17	Среда	3	11:00:00	23:00:00
17	Четверг	4	11:00:00	23:00:00
17	Пятница	5	11:00:00	23:00:00
17	Суббота	6	11:00:00	23:00:00
17	Воскресенье	0	11:00:00	23:00:00
18	Понедельник	1	11:00:00	23:00:00
18	Вторник	2	11:00:00	23:00:00
18	Среда	3	11:00:00	23:00:00
18	Четверг	4	11:00:00	23:00:00
18	Пятница	5	11:00:00	23:00:00
18	Суббота	6	11:00:00	23:00:00
18	Воскресенье	0	11:00:00	23:00:00
19	Понедельник	1	08:00:00	14:00:00
19	Вторник	2	08:00:00	14:00:00
19	Среда	3	08:00:00	14:00:00
19	Четверг	4	08:00:00	14:00:00
19	Пятница	5	08:00:00	14:00:00
19	Суббота	6	08:00:00	14:00:00
19	Воскресенье	0	08:00:00	14:00:00
20	Понедельник	1	09:00:00	23:00:00
20	Вторник	2	09:00:00	23:00:00
20	Среда	3	09:00:00	23:00:00
20	Четверг	4	09:00:00	23:00:00
20	Пятница	5	09:00:00	23:00:00
20	Суббота	6	09:00:00	23:00:00
20	Воскресенье	0	09:00:00	23:00:00
21	Понедельник	1	10:00:00	22:30:00
21	Вторник	2	10:00:00	22:30:00
21	Среда	3	10:00:00	22:30:00
21	Четверг	4	10:00:00	22:30:00
21	Пятница	5	10:00:00	22:30:00
21	Суббота	6	10:00:00	22:30:00
21	Воскресенье	0	10:00:00	22:30:00
22	Понедельник	1	12:00:00	23:00:00
22	Вторник	2	12:00:00	23:00:00
22	Среда	3	12:00:00	23:00:00
22	Четверг	4	12:00:00	23:00:00
22	Пятница	5	12:00:00	01:00:00
22	Суббота	6	12:00:00	01:00:00
22	Воскресенье	0	12:00:00	23:00:00
23	Понедельник	1	11:00:00	23:00:00
23	Вторник	2	11:00:00	23:00:00
23	Среда	3	11:00:00	23:00:00
23	Четверг	4	11:00:00	23:00:00
23	Пятница	5	11:00:00	23:00:00
23	Суббота	6	11:00:00	23:00:00
23	Воскресенье	0	11:00:00	23:00:00
24	Понедельник	1	11:00:00	22:30:00
24	Вторник	2	11:00:00	22:30:00
24	Среда	3	11:00:00	22:30:00
24	Четверг	4	11:00:00	22:30:00
24	Пятница	5	11:00:00	22:30:00
24	Суббота	6	11:00:00	22:30:00
24	Воскресенье	0	11:00:00	22:30:00
25	Понедельник	1	10:00:00	22:30:00
25	Вторник	2	10:00:00	22:30:00
25	Среда	3	10:00:00	22:30:00
25	Четверг	4	10:00:00	22:30:00
25	Пятница	5	10:00:00	22:30:00
25	Суббота	6	10:00:00	22:30:00
25	Воскресенье	0	10:00:00	22:30:00
26	Понедельник	1	10:00:00	22:00:00
26	Вторник	2	10:00:00	22:00:00
26	Среда	3	10:00:00	22:00:00
26	Четверг	4	10:00:00	22:00:00
26	Пятница	5	10:00:00	22:00:00
26	Суббота	6	10:00:00	22:00:00
26	Воскресенье	0	10:00:00	22:00:00
27	Понедельник	1	09:00:00	22:30:00
27	Вторник	2	09:00:00	22:30:00
27	Среда	3	09:00:00	22:30:00
27	Четверг	4	09:00:00	22:30:00
27	Пятница	5	09:00:00	22:30:00
27	Суббота	6	09:00:00	22:30:00
27	Воскресенье	0	09:00:00	22:30:00
28	Понедельник	1	11:00:00	22:30:00
28	Вторник	2	11:00:00	22:30:00
28	Среда	3	11:00:00	22:30:00
28	Четверг	4	11:00:00	22:30:00
28	Пятница	5	11:00:00	22:30:00
28	Суббота	6	11:00:00	22:30:00
28	Воскресенье	0	11:00:00	22:30:00
29	Понедельник	1	10:00:00	22:00:00
29	Вторник	2	10:00:00	22:00:00
29	Среда	3	10:00:00	22:00:00
29	Четверг	4	10:00:00	22:00:00
29	Пятница	5	10:00:00	22:00:00
29	Суббота	6	10:00:00	22:00:00
29	Воскресенье	0	10:00:00	22:00:00
30	Понедельник	1	09:00:00	22:00:00
30	Вторник	2	09:00:00	22:00:00
30	Среда	3	09:00:00	22:00:00
30	Четверг	4	09:00:00	22:00:00
30	Пятница	5	09:00:00	22:00:00
30	Суббота	6	09:00:00	22:00:00
30	Воскресенье	0	09:00:00	22:00:00
31	Понедельник	1	10:00:00	22:00:00
31	Вторник	2	10:00:00	22:00:00
31	Среда	3	10:00:00	22:00:00
31	Четверг	4	10:00:00	22:00:00
31	Пятница	5	10:00:00	22:00:00
31	Суббота	6	10:00:00	22:00:00
31	Воскресенье	0	10:00:00	22:00:00
32	Понедельник	1	10:00:00	23:00:00
32	Вторник	2	10:00:00	23:00:00
32	Среда	3	10:00:00	23:00:00
32	Четверг	4	10:00:00	23:00:00
32	Пятница	5	10:00:00	23:00:00
32	Суббота	6	10:00:00	23:00:00
32	Воскресенье	0	10:00:00	23:00:00
33	Понедельник	1	12:00:00	22:00:00
33	Вторник	2	12:00:00	22:00:00
33	Среда	3	12:00:00	22:00:00
33	Четверг	4	12:00:00	22:00:00
33	Пятница	5	12:00:00	22:00:00
33	Суббота	6	12:00:00	22:00:00
33	Воскресенье	0	12:00:00	22:00:00
34	Понедельник	1	09:00:00	23:00:00
34	Вторник	2	09:00:00	23:00:00
34	Среда	3	09:00:00	23:00:00
34	Четверг	4	09:00:00	23:00:00
34	Пятница	5	09:00:00	23:00:00
34	Суббота	6	09:00:00	23:00:00
34	Воскресенье	0	09:00:00	23:00:00
35	Понедельник	1	12:00:00	22:00:00
35	Вторник	2	12:00:00	22:00:00
35	Среда	3	12:00:00	22:00:00
35	Четверг	4	12:00:00	22:00:00
35	Пятница	5	12:00:00	22:00:00
35	Суббота	6	12:00:00	22:00:00
35	Воскресенье	0	12:00:00	22:00:00
36	Понедельник	1	12:00:00	22:00:00
36	Вторник	2	12:00:00	22:00:00
36	Среда	3	12:00:00	22:00:00
36	Четверг	4	12:00:00	22:00:00
36	Пятница	5	12:00:00	22:00:00
36	Суббота	6	12:00:00	22:00:00
36	Воскресенье	0	12:00:00	22:00:00
37	Понедельник	1	12:00:00	19:00:00
37	Вторник	2	12:00:00	19:00:00
37	Среда	3	12:00:00	19:00:00
37	Четверг	4	12:00:00	19:00:00
37	Пятница	5	12:00:00	19:00:00
37	Суббота	6	12:00:00	19:00:00
37	Воскресенье	0	12:00:00	19:00:00
38	Понедельник	1	12:00:00	23:00:00
38	Вторник	2	12:00:00	23:00:00
38	Среда	3	12:00:00	23:00:00
38	Четверг	4	12:00:00	23:00:00
38	Пятница	5	12:00:00	23:00:00
38	Суббота	6	12:00:00	23:00:00
38	Воскресенье	0	12:00:00	23:00:00
39	Понедельник	1	11:00:00	22:30:00
39	Вторник	2	11:00:00	22:30:00
39	Среда	3	11:00:00	22:30:00
39	Четверг	4	11:00:00	22:30:00
39	Пятница	5	11:00:00	22:30:00
39	Суббота	6	11:00:00	22:30:00
39	Воскресенье	0	11:00:00	22:30:00
40	Понедельник	1	10:00:00	22:00:00
40	Вторник	2	10:00:00	22:00:00
40	Среда	3	10:00:00	22:00:00
40	Четверг	4	10:00:00	22:00:00
40	Пятница	5	10:00:00	22:00:00
40	Суббота	6	10:00:00	22:00:00
40	Воскресенье	0	10:00:00	22:00:00
41	Понедельник	1	11:00:00	22:45:00
41	Вторник	2	11:00:00	22:45:00
41	Среда	3	11:00:00	22:45:00
41	Четверг	4	11:00:00	22:45:00
41	Пятница	5	11:00:00	22:45:00
41	Суббота	6	11:00:00	22:45:00
41	Воскресенье	0	11:00:00	22:45:00
42	Понедельник	1	10:00:00	20:30:00
42	Вторник	2	10:00:00	20:30:00
42	Среда	3	10:00:00	20:30:00
42	Четверг	4	10:00:00	20:30:00
42	Пятница	5	10:00:00	20:30:00
42	Суббота	6	10:00:00	20:30:00
42	Воскресенье	0	10:00:00	20:30:00
43	Понедельник	1	09:00:00	23:00:00
43	Вторник	2	09:00:00	23:00:00
43	Среда	3	09:00:00	23:00:00
43	Четверг	4	09:00:00	23:00:00
43	Пятница	5	09:00:00	23:00:00
43	Суббота	6	09:00:00	23:00:00
43	Воскресенье	0	09:00:00	23:00:00
44	Понедельник	1	10:00:00	23:00:00
44	Вторник	2	10:00:00	23:00:00
44	Среда	3	10:00:00	23:00:00
44	Четверг	4	10:00:00	23:00:00
44	Пятница	5	10:00:00	00:30:00
44	Суббота	6	10:00:00	00:30:00
44	Воскресенье	0	10:00:00	23:00:00
45	Понедельник	1	10:00:00	21:00:00
45	Вторник	2	10:00:00	21:00:00
45	Среда	3	10:00:00	21:00:00
45	Четверг	4	10:00:00	21:00:00
45	Пятница	5	10:00:00	21:00:00
45	Суббота	6	10:00:00	21:00:00
45	Воскресенье	0	10:00:00	21:00:00
46	Понедельник	1	11:00:00	22:00:00
46	Вторник	2	11:00:00	22:00:00
46	Среда	3	11:00:00	22:00:00
46	Четверг	4	11:00:00	22:00:00
46	Пятница	5	11:00:00	22:00:00
46	Суббота	6	11:00:00	22:00:00
46	Воскресенье	0	11:00:00	22:00:00
47	Понедельник	1	11:00:00	23:00:00
47	Вторник	2	11:00:00	23:00:00
47	Среда	3	11:00:00	23:00:00
47	Четверг	4	11:00:00	23:00:00
47	Пятница	5	11:00:00	02:00:00
47	Суббота	6	11:00:00	02:00:00
47	Воскресенье	0	11:00:00	23:00:00
48	Понедельник	1	11:00:00	22:00:00
48	Вторник	2	11:00:00	22:00:00
48	Среда	3	11:00:00	22:00:00
48	Четверг	4	11:00:00	22:00:00
48	Пятница	5	11:00:00	22:00:00
48	Суббота	6	11:00:00	22:00:00
48	Воскресенье	0	11:00:00	22:00:00
49	Понедельник	1	12:00:00	24:00:00
49	Вторник	2	12:00:00	24:00:00
49	Среда	3	12:00:00	24:00:00
49	Четверг	4	12:00:00	24:00:00
49	Пятница	5	12:00:00	24:00:00
49	Суббота	6	12:00:00	24:00:00
49	Воскресенье	0	12:00:00	24:00:00
50	Понедельник	1	11:00:00	23:00:00
50	Вторник	2	11:00:00	23:00:00
50	Среда	3	11:00:00	23:00:00
50	Четверг	4	11:00:00	23:00:00
50	Пятница	5	11:00:00	23:00:00
50	Суббота	6	11:00:00	23:00:00
50	Воскресенье	0	11:00:00	23:00:00
51	Понедельник	1	11:00:00	20:40:00
51	Вторник	2	11:00:00	20:40:00
51	Среда	3	11:00:00	20:40:00
51	Четверг	4	11:00:00	20:40:00
51	Пятница	5	11:00:00	20:40:00
51	Суббота	6	11:00:00	20:40:00
51	Воскресенье	0	11:00:00	20:40:00
52	Понедельник	1	11:00:00	23:00:00
52	Вторник	2	11:00:00	23:00:00
52	Среда	3	11:00:00	23:00:00
52	Четверг	4	11:00:00	23:00:00
52	Пятница	5	11:00:00	23:00:00
52	Суббота	6	11:00:00	23:00:00
52	Воскресенье	0	11:00:00	23:00:00
53	Понедельник	1	11:00:00	21:00:00
53	Вторник	2	11:00:00	21:00:00
53	Среда	3	11:00:00	21:00:00
53	Четверг	4	11:00:00	21:00:00
53	Пятница	5	11:00:00	21:00:00
53	Суббота	6	11:00:00	21:00:00
53	Воскресенье	0	11:00:00	21:00:00
54	Понедельник	1	11:00:00	23:00:00
54	Вторник	2	11:00:00	23:00:00
54	Среда	3	11:00:00	23:00:00
54	Четверг	4	11:00:00	23:00:00
54	Пятница	5	11:00:00	23:00:00
54	Суббота	6	11:00:00	23:00:00
54	Воскресенье	0	11:00:00	23:00:00
55	Понедельник	1	11:00:00	21:30:00
55	Вторник	2	11:00:00	21:30:00
55	Среда	3	11:00:00	21:30:00
55	Четверг	4	11:00:00	21:30:00
55	Пятница	5	11:00:00	21:30:00
55	Суббота	6	11:00:00	21:30:00
55	Воскресенье	0	11:00:00	21:30:00
56	Понедельник	1	10:00:00	22:30:00
56	Вторник	2	10:00:00	22:30:00
56	Среда	3	10:00:00	22:30:00
56	Четверг	4	10:00:00	22:30:00
56	Пятница	5	10:00:00	22:30:00
56	Суббота	6	10:00:00	22:30:00
56	Воскресенье	0	10:00:00	22:30:00
57	Понедельник	1	10:00:00	24:00:00
57	Вторник	2	10:00:00	24:00:00
57	Среда	3	10:00:00	24:00:00
57	Четверг	4	10:00:00	24:00:00
57	Пятница	5	10:00:00	24:00:00
57	Суббота	6	10:00:00	24:00:00
57	Воскресенье	0	10:00:00	24:00:00
58	Понедельник	1	11:00:00	23:00:00
58	Вторник	2	11:00:00	23:00:00
58	Среда	3	11:00:00	23:00:00
58	Четверг	4	11:00:00	23:00:00
58	Пятница	5	11:00:00	23:00:00
58	Суббота	6	11:00:00	23:00:00
58	Воскресенье	0	11:00:00	23:00:00
59	Понедельник	1	11:00:00	22:30:00
59	Вторник	2	11:00:00	22:30:00
59	Среда	3	11:00:00	22:30:00
59	Четверг	4	11:00:00	22:30:00
59	Пятница	5	11:00:00	22:30:00
59	Суббота	6	11:00:00	22:30:00
59	Воскресенье	0	11:00:00	22:30:00
60	Понедельник	1	11:00:00	21:30:00
60	Вторник	2	11:00:00	21:30:00
60	Среда	3	11:00:00	21:30:00
60	Четверг	4	11:00:00	21:30:00
60	Пятница	5	11:00:00	21:30:00
60	Суббота	6	11:00:00	21:30:00
60	Воскресенье	0	11:00:00	21:30:00
61	Понедельник	1	12:00:00	24:00:00
61	Вторник	2	12:00:00	24:00:00
61	Среда	3	12:00:00	24:00:00
61	Четверг	4	12:00:00	24:00:00
61	Пятница	5	12:00:00	24:00:00
61	Суббота	6	12:00:00	24:00:00
61	Воскресенье	0	12:00:00	24:00:00
62	Понедельник	1	11:00:00	24:00:00
62	Вторник	2	11:00:00	24:00:00
62	Среда	3	11:00:00	24:00:00
62	Четверг	4	11:00:00	24:00:00
62	Пятница	5	11:00:00	24:00:00
62	Суббота	6	11:00:00	24:00:00
62	Воскресенье	0	11:00:00	24:00:00
63	Понедельник	1	11:00:00	24:00:00
63	Вторник	2	11:00:00	24:00:00
63	Среда	3	11:00:00	24:00:00
63	Четверг	4	11:00:00	24:00:00
63	Пятница	5	11:00:00	01:00:00
63	Суббота	6	11:00:00	01:00:00
63	Воскресенье	0	11:00:00	24:00:00
64	Понедельник	1	11:00:00	24:00:00
64	Вторник	2	11:00:00	24:00:00
64	Среда	3	11:00:00	24:00:00
64	Четверг	4	11:00:00	24:00:00
64	Пятница	5	11:00:00	24:00:00
64	Суббота	6	11:00:00	24:00:00
64	Воскресенье	0	11:00:00	24:00:00
65	Понедельник	1	11:00:00	23:00:00
65	Вторник	2	11:00:00	23:00:00
65	Среда	3	11:00:00	23:00:00
65	Четверг	4	11:00:00	23:00:00
65	Пятница	5	11:00:00	23:00:00
65	Суббота	6	11:00:00	23:00:00
65	Воскресенье	0	11:00:00	23:00:00
66	Понедельник	1	12:00:00	21:45:00
66	Вторник	2	12:00:00	21:45:00
66	Среда	3	12:00:00	21:45:00
66	Четверг	4	12:00:00	21:45:00
66	Пятница	5	12:00:00	21:45:00
66	Суббота	6	12:00:00	21:45:00
66	Воскресенье	0	12:00:00	21:45:00
67	Понедельник	1	12:00:00	22:00:00
67	Вторник	2	12:00:00	22:00:00
67	Среда	3	12:00:00	22:00:00
67	Четверг	4	12:00:00	22:00:00
67	Пятница	5	12:00:00	22:00:00
67	Суббота	6	11:00:00	22:00:00
67	Воскресенье	0	11:00:00	22:00:00
68	Понедельник	1	11:00:00	22:00:00
68	Вторник	2	11:00:00	22:00:00
68	Среда	3	11:00:00	22:00:00
68	Четверг	4	11:00:00	22:00:00
68	Пятница	5	11:00:00	22:00:00
68	Суббота	6	11:00:00	22:00:00
68	Воскресенье	0	11:00:00	22:00:00
69	Понедельник	1	12:00:00	21:00:00
69	Вторник	2	12:00:00	21:00:00
69	Среда	3	12:00:00	21:00:00
69	Четверг	4	12:00:00	21:00:00
69	Пятница	5	12:00:00	21:00:00
69	Суббота	6	12:00:00	21:00:00
69	Воскресенье	0	12:00:00	21:00:00
70	Понедельник	1	11:00:00	23:00:00
70	Вторник	2	11:00:00	23:00:00
70	Среда	3	11:00:00	23:00:00
70	Четверг	4	11:00:00	23:00:00
70	Пятница	5	11:00:00	23:00:00
70	Суббота	6	11:00:00	23:00:00
70	Воскресенье	0	11:00:00	23:00:00
71	Понедельник	1	11:00:00	21:00:00
71	Вторник	2	11:00:00	21:00:00
71	Среда	3	11:00:00	21:00:00
71	Четверг	4	11:00:00	21:00:00
71	Пятница	5	11:00:00	21:00:00
71	Суббота	6	11:00:00	21:00:00
71	Воскресенье	0	11:00:00	21:00:00
72	Понедельник	1	11:00:00	22:30:00
72	Вторник	2	11:00:00	22:30:00
72	Среда	3	11:00:00	22:30:00
72	Четверг	4	11:00:00	22:30:00
72	Пятница	5	11:00:00	22:30:00
72	Суббота	6	11:00:00	22:30:00
72	Воскресенье	0	11:00:00	22:30:00
73	Понедельник	1	11:00:00	22:00:00
73	Вторник	2	11:00:00	22:00:00
73	Среда	3	11:00:00	22:00:00
73	Четверг	4	11:00:00	22:00:00
73	Пятница	5	11:00:00	22:00:00
73	Суббота	6	11:00:00	22:00:00
73	Воскресенье	0	11:00:00	22:00:00
74	Понедельник	1	13:00:00	22:30:00
74	Вторник	2	11:00:00	22:30:00
74	Среда	3	11:00:00	22:30:00
74	Четверг	4	11:00:00	22:30:00
74	Пятница	5	11:00:00	22:30:00
74	Суббота	6	11:00:00	22:30:00
74	Воскресенье	0	11:00:00	22:30:00
75	Понедельник	1	09:00:00	23:00:00
75	Вторник	2	09:00:00	23:00:00
75	Среда	3	09:00:00	23:00:00
75	Четверг	4	09:00:00	23:00:00
75	Пятница	5	09:00:00	23:00:00
75	Суббота	6	09:00:00	23:00:00
75	Воскресенье	0	09:00:00	23:00:00
76	Понедельник	1	11:00:00	23:00:00
76	Вторник	2	11:00:00	23:00:00
76	Среда	3	11:00:00	23:00:00
76	Четверг	4	11:00:00	23:00:00
76	Пятница	5	11:00:00	23:00:00
76	Суббота	6	11:00:00	23:00:00
76	Воскресенье	0	11:00:00	23:00:00
77	Понедельник	1	11:00:00	21:30:00
77	Вторник	2	11:00:00	21:30:00
77	Среда	3	11:00:00	21:30:00
77	Четверг	4	11:00:00	21:30:00
77	Пятница	5	11:00:00	21:30:00
77	Суббота	6	11:00:00	21:30:00
77	Воскресенье	0	11:00:00	21:30:00
78	Понедельник	1	11:00:00	22:30:00
78	Вторник	2	11:00:00	22:30:00
78	Среда	3	11:00:00	22:30:00
78	Четверг	4	11:00:00	22:30:00
78	Пятница	5	11:00:00	22:30:00
78	Суббота	6	11:00:00	22:30:00
78	Воскресенье	0	11:00:00	22:30:00
79	Понедельник	1	12:00:00	22:00:00
79	Вторник	2	12:00:00	22:00:00
79	Среда	3	12:00:00	22:00:00
79	Четверг	4	12:00:00	22:00:00
79	Пятница	5	12:00:00	22:00:00
79	Суббота	6	12:00:00	22:00:00
79	Воскресенье	0	12:00:00	22:00:00
80	Понедельник	1	10:00:00	23:00:00
80	Вторник	2	11:00:00	23:00:00
80	Среда	3	11:00:00	23:00:00
80	Четверг	4	11:00:00	23:00:00
80	Пятница	5	11:00:00	23:00:00
80	Суббота	6	11:00:00	23:00:00
80	Воскресенье	0	11:00:00	23:00:00
81	Понедельник	1	00:00:00	24:00:00
81	Вторник	2	00:00:00	24:00:00
81	Среда	3	00:00:00	24:00:00
81	Четверг	4	00:00:00	24:00:00
81	Пятница	5	00:00:00	24:00:00
81	Суббота	6	00:00:00	24:00:00
81	Воскресенье	0	00:00:00	24:00:00
82	Понедельник	1	09:00:00	23:00:00
82	Вторник	2	09:00:00	23:00:00
82	Среда	3	09:00:00	23:00:00
82	Четверг	4	09:00:00	23:00:00
82	Пятница	5	09:00:00	23:00:00
82	Суббота	6	09:00:00	23:00:00
82	Воскресенье	0	09:00:00	23:00:00
83	Понедельник	1	11:00:00	22:30:00
83	Вторник	2	11:00:00	22:30:00
83	Среда	3	11:00:00	22:30:00
83	Четверг	4	11:00:00	22:30:00
83	Пятница	5	11:00:00	22:30:00
83	Суббота	6	11:00:00	22:30:00
83	Воскресенье	0	11:00:00	22:30:00
84	Понедельник	1	10:00:00	22:30:00
84	Вторник	2	10:00:00	22:30:00
84	Среда	3	10:00:00	22:30:00
84	Четверг	4	10:00:00	22:30:00
84	Пятница	5	10:00:00	22:30:00
84	Суббота	6	10:00:00	22:30:00
84	Воскресенье	0	10:00:00	22:30:00
85	Понедельник	1	12:00:00	22:00:00
85	Вторник	2	12:00:00	22:00:00
85	Среда	3	12:00:00	22:00:00
85	Четверг	4	12:00:00	22:00:00
85	Пятница	5	12:00:00	22:00:00
85	Суббота	6	12:00:00	22:00:00
85	Воскресенье	0	12:00:00	22:00:00
86	Понедельник	1	11:00:00	23:00:00
86	Вторник	2	11:00:00	23:00:00
86	Среда	3	11:00:00	23:00:00
86	Четверг	4	11:00:00	23:00:00
86	Пятница	5	11:00:00	23:00:00
86	Суббота	6	11:00:00	23:00:00
86	Воскресенье	0	11:00:00	23:00:00
87	Понедельник	1	09:00:00	23:00:00
87	Вторник	2	09:00:00	23:00:00
87	Среда	3	09:00:00	23:00:00
87	Четверг	4	09:00:00	23:00:00
87	Пятница	5	09:00:00	01:00:00
87	Суббота	6	09:00:00	01:00:00
87	Воскресенье	0	09:00:00	23:00:00
88	Понедельник	1	11:00:00	21:00:00
88	Вторник	2	11:00:00	21:00:00
88	Среда	3	11:00:00	21:00:00
88	Четверг	4	11:00:00	21:00:00
88	Пятница	5	11:00:00	22:00:00
88	Суббота	6	11:00:00	22:00:00
88	Воскресенье	0	11:00:00	21:00:00
89	Понедельник	1	11:20:00	22:30:00
89	Вторник	2	11:20:00	22:30:00
89	Среда	3	11:20:00	22:30:00
89	Четверг	4	11:20:00	22:30:00
89	Пятница	5	11:20:00	22:30:00
89	Суббота	6	11:20:00	22:30:00
89	Воскресенье	0	11:20:00	22:30:00
90	Понедельник	1	09:00:00	23:00:00
90	Вторник	2	09:00:00	23:00:00
90	Среда	3	09:00:00	23:00:00
90	Четверг	4	09:00:00	23:00:00
90	Пятница	5	09:00:00	23:00:00
90	Суббота	6	09:00:00	23:00:00
90	Воскресенье	0	09:00:00	23:00:00
91	Понедельник	1	10:00:00	22:00:00
91	Вторник	2	10:00:00	22:00:00
91	Среда	3	10:00:00	22:00:00
91	Четверг	4	10:00:00	22:00:00
91	Пятница	5	10:00:00	01:00:00
91	Суббота	6	10:00:00	01:00:00
91	Воскресенье	0	10:00:00	22:00:00
92	Понедельник	1	09:00:00	23:00:00
92	Вторник	2	09:00:00	23:00:00
92	Среда	3	09:00:00	23:00:00
92	Четверг	4	09:00:00	23:00:00
92	Пятница	5	09:00:00	23:00:00
92	Суббота	6	09:00:00	23:00:00
92	Воскресенье	0	09:00:00	23:00:00
93	Понедельник	1	11:30:00	22:30:00
93	Вторник	2	11:30:00	22:30:00
93	Среда	3	11:30:00	22:30:00
93	Четверг	4	11:30:00	22:30:00
93	Пятница	5	11:30:00	22:30:00
93	Суббота	6	11:30:00	22:30:00
93	Воскресенье	0	11:30:00	22:30:00
94	Понедельник	1	11:00:00	22:30:00
94	Вторник	2	10:00:00	22:30:00
94	Среда	3	10:00:00	22:30:00
94	Четверг	4	10:00:00	22:30:00
94	Пятница	5	10:00:00	22:30:00
94	Суббота	6	10:00:00	22:30:00
94	Воскресенье	0	10:00:00	22:30:00
95	Понедельник	1	12:00:00	21:00:00
95	Вторник	2	12:00:00	22:00:00
95	Среда	3	12:00:00	22:00:00
95	Четверг	4	12:00:00	22:00:00
95	Пятница	5	12:00:00	22:00:00
95	Суббота	6	12:00:00	22:00:00
95	Воскресенье	0	12:00:00	22:00:00
96	Понедельник	1	10:00:00	22:00:00
96	Вторник	2	10:00:00	22:00:00
96	Среда	3	10:00:00	22:00:00
96	Четверг	4	10:00:00	22:00:00
96	Пятница	5	10:00:00	22:00:00
96	Суббота	6	10:00:00	22:00:00
96	Воскресенье	0	10:00:00	22:00:00
97	Понедельник	1	11:30:00	15:00:00
97	Вторник	2	11:30:00	15:00:00
97	Среда	3	11:30:00	15:00:00
97	Четверг	4	11:30:00	15:00:00
97	Пятница	5	11:30:00	15:00:00
97	Суббота	6	11:30:00	15:00:00
97	Воскресенье	0	11:30:00	15:00:00
98	Понедельник	1	10:00:00	21:00:00
98	Вторник	2	10:00:00	21:00:00
98	Среда	3	10:00:00	21:00:00
98	Четверг	4	10:00:00	21:00:00
98	Пятница	5	10:00:00	21:00:00
98	Суббота	6	10:00:00	21:00:00
98	Воскресенье	0	10:00:00	21:00:00
99	Понедельник	1	10:00:00	22:00:00
99	Вторник	2	10:00:00	22:00:00
99	Среда	3	10:00:00	22:00:00
99	Четверг	4	10:00:00	22:00:00
99	Пятница	5	10:00:00	22:00:00
99	Суббота	6	10:00:00	22:00:00
99	Воскресенье	0	10:00:00	22:00:00
100	Понедельник	1	10:00:00	19:00:00
100	Вторник	2	10:00:00	19:00:00
100	Среда	3	10:00:00	19:00:00
100	Четверг	4	10:00:00	19:00:00
100	Пятница	5	10:00:00	19:00:00
100	Суббота	6	10:00:00	19:00:00
100	Воскресенье	0	10:00:00	19:00:00
101	Понедельник	1	10:00:00	22:00:00
101	Вторник	2	10:00:00	22:00:00
101	Среда	3	10:00:00	22:00:00
101	Четверг	4	10:00:00	22:00:00
101	Пятница	5	10:00:00	22:00:00
101	Суббота	6	10:00:00	22:00:00
101	Воскресенье	0	10:00:00	22:00:00
102	Понедельник	1	10:00:00	23:00:00
102	Вторник	2	10:00:00	23:00:00
102	Среда	3	10:00:00	23:00:00
102	Четверг	4	10:00:00	23:00:00
102	Пятница	5	10:00:00	23:00:00
102	Суббота	6	10:00:00	23:00:00
102	Воскресенье	0	10:00:00	23:00:00
103	Понедельник	1	10:00:00	22:00:00
103	Вторник	2	10:00:00	22:00:00
103	Среда	3	10:00:00	22:00:00
103	Четверг	4	10:00:00	22:00:00
103	Пятница	5	10:00:00	22:00:00
103	Суббота	6	10:00:00	22:00:00
103	Воскресенье	0	10:00:00	22:00:00
104	Понедельник	1	12:00:00	21:00:00
104	Вторник	2	12:00:00	21:00:00
104	Среда	3	12:00:00	21:00:00
104	Четверг	4	12:00:00	21:00:00
104	Пятница	5	12:00:00	21:00:00
104	Суббота	6	12:00:00	21:00:00
104	Воскресенье	0	12:00:00	21:00:00
105	Понедельник	1	10:00:00	21:30:00
105	Вторник	2	10:00:00	21:30:00
105	Среда	3	10:00:00	21:30:00
105	Четверг	4	10:00:00	21:30:00
105	Пятница	5	10:00:00	21:30:00
105	Суббота	6	10:00:00	21:30:00
105	Воскресенье	0	10:00:00	21:30:00
106	Понедельник	1	10:00:00	21:40:00
106	Вторник	2	10:00:00	21:40:00
106	Среда	3	10:00:00	21:40:00
106	Четверг	4	10:00:00	21:40:00
106	Пятница	5	10:00:00	21:40:00
106	Суббота	6	10:00:00	21:40:00
106	Воскресенье	0	10:00:00	21:40:00
107	Понедельник	1	11:00:00	23:00:00
107	Вторник	2	11:00:00	23:00:00
107	Среда	3	11:00:00	23:00:00
107	Четверг	4	11:00:00	23:00:00
107	Пятница	5	11:00:00	23:00:00
107	Суббота	6	11:00:00	23:00:00
107	Воскресенье	0	11:00:00	23:00:00
108	Понедельник	1	12:00:00	21:30:00
108	Вторник	2	12:00:00	21:30:00
108	Среда	3	12:00:00	21:30:00
108	Четверг	4	12:00:00	21:30:00
108	Пятница	5	12:00:00	21:30:00
108	Суббота	6	12:00:00	21:30:00
108	Воскресенье	0	12:00:00	21:30:00
109	Понедельник	1	11:00:00	20:30:00
109	Вторник	2	11:00:00	20:30:00
109	Среда	3	11:00:00	20:30:00
109	Четверг	4	11:00:00	20:30:00
109	Пятница	5	11:00:00	20:30:00
109	Суббота	6	11:00:00	20:30:00
109	Воскресенье	0	11:00:00	20:30:00
110	Понедельник	1	11:00:00	22:00:00
110	Вторник	2	10:00:00	22:00:00
110	Среда	3	10:00:00	22:00:00
110	Четверг	4	10:00:00	22:00:00
110	Пятница	5	10:00:00	22:00:00
110	Суббота	6	10:00:00	22:00:00
110	Воскресенье	0	10:00:00	22:00:00
111	Понедельник	1	11:00:00	19:30:00
111	Вторник	2	11:00:00	19:30:00
111	Среда	3	11:00:00	19:30:00
111	Четверг	4	11:00:00	19:30:00
111	Пятница	5	11:00:00	19:30:00
111	Суббота	6	11:00:00	19:30:00
111	Воскресенье	0	11:00:00	19:30:00
112	Понедельник	1	11:00:00	21:40:00
112	Вторник	2	11:00:00	21:40:00
112	Среда	3	11:00:00	21:40:00
112	Четверг	4	11:00:00	21:40:00
112	Пятница	5	11:00:00	21:40:00
112	Суббота	6	11:00:00	21:40:00
112	Воскресенье	0	11:00:00	21:40:00
113	Понедельник	1	11:00:00	19:30:00
113	Вторник	2	11:00:00	19:30:00
113	Среда	3	11:00:00	19:30:00
113	Четверг	4	11:00:00	19:30:00
113	Пятница	5	11:00:00	19:30:00
113	Суббота	6	11:00:00	19:30:00
113	Воскресенье	0	11:00:00	19:30:00
114	Понедельник	1	11:00:00	22:30:00
114	Вторник	2	11:00:00	22:30:00
114	Среда	3	11:00:00	22:30:00
114	Четверг	4	11:00:00	22:30:00
114	Пятница	5	11:00:00	22:30:00
114	Суббота	6	11:00:00	22:30:00
114	Воскресенье	0	11:00:00	22:30:00
115	Понедельник	1	16:00:00	23:00:00
115	Вторник	2	16:00:00	23:00:00
115	Среда	3	16:00:00	23:00:00
115	Четверг	4	16:00:00	23:00:00
115	Пятница	5	16:00:00	23:00:00
115	Суббота	6	16:00:00	23:00:00
115	Воскресенье	0	16:00:00	23:00:00
116	Понедельник	1	10:30:00	22:00:00
116	Вторник	2	10:30:00	22:00:00
116	Среда	3	10:30:00	22:00:00
116	Четверг	4	10:30:00	22:00:00
116	Пятница	5	10:30:00	22:00:00
116	Суббота	6	10:30:00	22:00:00
116	Воскресенье	0	10:30:00	22:00:00
117	Понедельник	1	11:00:00	21:30:00
117	Вторник	2	11:00:00	21:30:00
117	Среда	3	11:00:00	21:30:00
117	Четверг	4	11:00:00	21:30:00
117	Пятница	5	11:00:00	21:30:00
117	Суббота	6	11:00:00	21:30:00
117	Воскресенье	0	11:00:00	21:30:00
118	Понедельник	1	12:00:00	23:00:00
118	Вторник	2	12:00:00	23:00:00
118	Среда	3	12:00:00	23:00:00
118	Четверг	4	12:00:00	23:00:00
118	Пятница	5	12:00:00	23:00:00
118	Суббота	6	12:00:00	23:00:00
118	Воскресенье	0	12:00:00	23:00:00
119	Понедельник	1	12:00:00	22:00:00
119	Вторник	2	12:00:00	22:00:00
119	Среда	3	12:00:00	22:00:00
119	Четверг	4	12:00:00	22:00:00
119	Пятница	5	12:00:00	22:00:00
119	Суббота	6	12:00:00	22:00:00
119	Воскресенье	0	12:00:00	22:00:00
120	Понедельник	1	11:00:00	21:40:00
120	Вторник	2	11:00:00	21:40:00
120	Среда	3	11:00:00	21:40:00
120	Четверг	4	11:00:00	21:40:00
120	Пятница	5	11:00:00	21:40:00
120	Суббота	6	11:00:00	21:40:00
120	Воскресенье	0	11:00:00	21:40:00
\.


--
-- Data for Name: calendar_to_shop; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.calendar_to_shop (id_shop, id_calendar) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
16	16
17	17
18	18
19	19
20	20
21	21
22	22
23	23
24	24
25	25
26	26
27	27
28	28
29	29
30	30
31	31
32	32
33	33
34	34
35	35
36	36
37	37
38	38
39	39
40	40
41	41
42	42
43	43
44	44
45	45
46	46
47	47
48	48
49	49
50	50
51	51
52	52
53	53
54	54
55	55
56	56
57	57
58	58
59	59
60	60
61	61
62	62
63	63
64	64
65	65
66	66
67	67
68	68
69	69
70	70
71	71
72	72
73	73
74	74
75	75
76	76
77	77
78	78
79	79
80	80
81	81
82	82
83	83
84	84
85	85
86	86
87	87
88	88
89	89
90	90
91	91
92	92
93	93
94	94
95	95
96	96
97	97
98	98
99	99
100	100
101	101
102	102
103	103
104	104
105	105
106	106
107	107
108	108
109	109
110	110
111	111
112	112
113	113
114	114
115	115
116	116
117	117
118	118
119	119
120	120
\.


--
-- Data for Name: city_info; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.city_info (city_id, city_name) FROM stdin;
1	Брест
2	Витебск
3	Гомель
4	Гродно
5	Минск
6	Могилёв
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.customers (id_customer, user_phone, user_password, username) FROM stdin;
1	+375 29 323 13 46	fgqmt245ubv12342352354kjbqertwertwet	user1
2	+375 29 325 17 36	fgqmt245ubv123kmnyert724etydher562gv234t	user2
3	+375 25 112 55 22	sefefafq524356hdwert52346rgs	user3
4	+375 29 345 67 32	154jnguytb34l21509tbeqr134141234vsfhhjy	user4
5	+375 29 345 67 35	154jnguytb34l2sdgbfdn34141234vsfhhjy	user5
6	+375 29 311 67 35	154jngwqgweg34523tsrghbstrhtywq141234vsfhhjy	user6
7	+375 25 311 67 35	jg34523tsrghwh32srtu35u6ehntrjuybstrhtywq141234vsfhhjy	user7
8	+375 33 311 67 35	jg34523tsrghwh32srtu35u6ehngwegwgtrwtywq141234vsfhhjy	user8
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.feedbacks (id_feedback, id_meal, id_shop, id_customer, description, rating) FROM stdin;
1	1	\N	1	Вкусно	5
2	1	\N	2	Не вкусно	2
3	\N	1	1	Хороший магазин	5
4	\N	1	2	Средний магазин	4
5	\N	1	1	Плохой магазин	1
6	\N	1	1	Плохой магазин магазин	2
7	1	\N	3	Средне	3
\.


--
-- Data for Name: lang_settings; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.lang_settings (id_language, lang_name) FROM stdin;
1	Рус
2	Eng
3	Бел
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.menu (id_menu, id_meal, meal_name, meal_type, meal_ingrids, meal_desc, image, price, in_menu) FROM stdin;
1	1	Ролл «Бонито» с лососем	Роллы	Рис, нори, сыр сливочный, лосось, огурец, стружка тунца и стружка нори	225 г	\N	9	t
1	2	Ролл «Бонито»	Роллы	Рис, нори, помидоры, курица «Терияки», огурец, икра масаго, зелёный лук, соус «Спайси», салат «Рамэн», стружка тунца	215 г	\N	7.6	t
1	3	Ролл «Вегетарианский»	Роллы	Рис, нори, огурец, перец, помидоры, сыр «Тофу», зелёный лук, салат «Рамэн», кунжут	230 г	\N	7.2	t
1	4	Ролл «Витамин»	Роллы	Рис, нори, помидоры, сливочный сыр, китайская капуста, паприка, зелёный лук, кунжут	220 г	\N	5.2	t
1	5	Ролл «Калифорния»	Роллы	Рис, нори, снежный краб, икра масаго, сливочный сыр, огурец, кунжут	240 г	\N	7.5	t
1	6	Ролл с королевской креветкой и соусом из цедры цитруса	Роллы	Рис, сыр сливочный, креветка королевская, лепестки миндаля, соус из цедры	260 г	\N	11.65	t
1	7	Ролл с лососем и омлетом тамаго	Роллы	Рис, нори, сыр сливочный, лосось, омлет тамаго, икра масаго	260 г	\N	11.9	t
1	8	Ролл «Саншайн»	Роллы	Рис, сыр сливочный, лосось, креветка тигровая, тунец, авокадо	300 г	\N	11	t
1	9	Ролл «Сливочная креветка»	Роллы	Рис, нори, сливочный сыр, снежный краб, икра масаго, огурец, креветка	260 г	\N	9.6	t
1	10	Ролл «Сливочный лосось»	Роллы	Рис, нори, сливочный сыр, лосось, китайская капуста, огурец, икра масаго	240 г	\N	10.4	t
1	11	Ролл «Снэк»	Роллы	Рис, нори, курица «Терияки», огурец, сливочный сыр, чипсы крошка	230 г	\N	6.9	t
1	12	Ролл «Тайфун»	Роллы	Рис, нори, снежный краб, креветки королевские обжаренные в тесте кляр, икра масаго, соус «Спайси»	265 г	\N	9	t
1	13	Ролл «Техас»	Роллы	Рис, сыр сливочный, омлет тамаго, перец сладкий, огурец, бекон, соус «Спайси», лук Криспи	275 г	\N	8.2	t
1	14	Ролл с угрём	Роллы	Рис, нори, сыр сливочный, угорь, огурец, кунжут микс, соус «Унаги»	240 г	\N	10.9	t
1	15	Ролл «Филадельфия» в рисовой бумаге	Роллы	Рис, бумага рисовая, сыр сливочный, лосось, авокадо	250 г	\N	12.9	t
1	16	Ролл «Филадельфия» в угре с бананом	Роллы	Рис, нори, сыр сливочный, банан, угорь, соус «Унаги», лепестки миндаля	300 г	\N	13.6	t
1	17	Ролл «Филадельфия» в угре с такуаном	Роллы	Рис, сыр сливочный, редиска такуан, угорь, соус «Терияки», кунжут микс	280 г	\N	11.9	t
1	18	Ролл «Филадельфия в угре»	Роллы	Рис, нори, сыр сливочный, огурец, угорь, соус «Унаги», кунжут‑микс	255 г	\N	13.6	t
1	19	Ролл «Филадельфия макси и манго»	Роллы	Рис, нори, сыр сливочный, манго, лосось	305 г	\N	13	t
1	20	Ролл «Филадельфия макси»	Роллы	Рис, нори, сыр сливочный, лосось, авокадо	300 г	\N	13.5	t
1	21	Ролл «Филадельфия микс»	Роллы	Рис, нори, лосось, угорь, сливочный сыр, огурец, соус «Унаги», кунжут	255 г	\N	12.9	t
1	22	Ролл «Филадельфия роял»	Роллы	Рис, нори, лосось, огурец, снежный краб, сливочный сыр	270 г	\N	12.9	t
1	23	Ролл «Филадельфия» с королевской креветкой	Роллы	Рис, нори, сыр сливочный, королевская креветка, лосось	315 г	\N	15	t
1	24	Ролл «Филадельфия» с тунцом	Роллы	Рис, нори, сыр сливочный, тунец, огурец	275 г	\N	10.5	t
1	25	Ролл «Филадельфия» с чукой	Роллы	Рис, нори, сыр сливочный, салат чука, лосось	270 г	\N	9.9	t
1	26	Ролл «Филадельфия»	Роллы	Рис, нори, сыр сливочный, огурец, лосось	250 г	\N	9.4	t
1	27	Ролл «Хияши классический»	Роллы	Рис, нори, сыр сливочный, лосось, салат чука, кунжут‑микс	290 г	\N	10.7	t
1	28	Ролл «Чикен спайси» 	Роллы	Рис, нори, курица «Терияки», сливочный сыр, соус «Спайси», паприка, китайская капуста, зелёный лук	240 г	\N	7.6	t
1	29	Мини-ролл с авокадо	Мини-роллы	Рис, нори, авокадо	115 г	\N	3.5	t
1	30	Мини-ролл с икрой тобико	Мини-роллы	Рис, нори, икра тобико	115 г	\N	4	t
1	31	Мини-ролл с копчёным окунем	Мини-роллы	Рис, нори, копчённый окунь со специями	115 г	\N	4.5	t
1	32	Мини-ролл с лососем	Мини-роллы	Рис, нори, лосось	115 г	\N	5.9	t
1	33	Мини-ролл с мидиями	Мини-роллы	Рис, нори, мидии, соус «Спайси»	115 г	\N	4	t
1	34	Мини-ролл с огурцом	Мини-роллы	Рис, нори, огурец, кунжут	115 г	\N	2.7	t
1	35	Мини-ролл с перцем	Мини-роллы	Рис, нори, перец сладкий	115 г	\N	3	t
1	36	Мини-ролл с такуаном	Мини-роллы			\N	2.7	t
1	37	Мини-ролл с тунцом	Мини-роллы	Рис, нори, тунец		\N	5.5	t
1	38	Мини-ролл с крабом	Мини-роллы	Рис, нори, снежный краб	121 г	\N	3	t
1	39	Мини-ролл с чукой	Мини-роллы	Рис, нори, чука-салат, кунжут‑микс	115 г	\N	3	t
1	40	Суши-сет «Большой запечённый»	Суши-сеты	Запечённые роллы: с окунем, с лососем, с мидиями, запечённые суши с мидиями, запечённые суши с крабом, запечённые суши с окунем	1072 г	\N	29.5	t
1	41	Суши-сет «Джентльменский»	Суши-сеты	Ролл «Калифорния», Снэк-ролл, ролл «Витамин», ролл «Сливочный лосось», ролл «Чикен спайси», ролл «Тори»	1408 г	\N	28.9	t
1	42	Суши-сет «Кинг Сайз с угрём»	Суши-сеты	Ролл «Филадельфия» в масаго, суши со сливочным сыром и креветкой, ролл «Филадельфия Микс», ролл «Филадельфия Роял Микс», ролл «Филадельфия Микс Лайт» в кунжуте, мини‑ролл «Фишкейк»	1356 г	\N	41	t
1	43	Мини-сет «Суши»	Суши-сеты			\N	13.5	t
1	44	Суши-сет XXL	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния», ролл «Сливочный лосось», ролл «Чикен Спайси», ролл «Бонито»	1185 г	\N	28.9	t
1	45	Набор «Классический»	Суши-сеты	Мини-ролл с огурцом, мини-ролл с крабом, мини-ролл с тунцом, мини-ролл с лососем, мини-ролл с тобико, мини‑ролл с окунем	660 г	\N	20	t
1	46	Набор «Нори маки»	Суши-сеты	Ролл с тунцом и огурцом, ролл с угрем и огурцом, ролл с лососем и огурцом, ролл с тигровой креветкой и тобико	900 г	\N	27	t
1	47	Суши-сет «Острый»	Суши-сеты	Роллы Острый лосось», ролл «Острый угорь», ролл с курицей	780 г	\N	26.9	t
1	48	Суши-сет «Подарочный»	Суши-сеты	Мини-роллы запечённые: с лососем, с мидиями, с окунем, с грибами шиитаке, с копчёной курицей	660 г	\N	20	t
1	49	Набор «Сливочный»	Суши-сеты	Ролл «Сливочная креветка», ролл «Сливочный лосось», гунканы с креветкой и сливочным сыром 4 шт	650 г	\N	22.5	t
1	50	Суши-сет «Набор темпура»	Суши-сеты	Ролл «Креветка темпура», ролл «Лосось темпура», ролл «Угорь темпура»	570 г	\N	25.9	t
1	51	Суши-вет «Вегетарианский»	Суши-сеты	Ролл «Вегетарианский», мини-ролл с огурцом, мини-ролл с перцем, мини-ролл с такуаном, гунканы с чукой 4 шт	690 г	\N	15	t
1	52	Суши-сет «Хит»	Суши-сеты	Ролл «Хияши классический», ролл «Филадельфия макси», ролл «Филадельфия в угре», ролл «Калифорния»	1195 г	\N	35.5	t
1	53	Суши-сет «Суши шок „Классик“»	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния», ролл «Сливочный лосось», мини‑ролл с огурцом	823 г	\N	22.5	t
1	54	Суши-сет «Суши шок „Премиум“»	Суши-сеты	Ролл «Филадельфия», ролл с копчёной курицей, ролл «Калифорния», мини-ролл «Чикен Спайси»	810 г	\N	22.5	t
1	55	Суши-сет «Суши шок»	Суши-сеты	Ролл «Сливочный лосось», ролл «Калифорния», ролл «Бонито», мини‑ролл с огурцом	788 г	\N	21	t
1	56	Суши-сет «Унаги мания» 	Суши-сеты	Ролл «Филадельфия в угре», ролл «Острый угорь», мини-ролл с угрём, нигири с угрём, гунканы с угрём	755 г	\N	36	t
1	57	Суши-сет «Филадельфия „Кинг сайз“»	Суши-сеты	Ролл «Филадельфия», ролл «Филадельфия Роял», ролл «Филадельфия в масаго», ролл «Филадельфия Лайт в кунжуте», ролл «Филадельфия мини», мини-ролл «Фишкейк», суши с креветкой и сливочным сыром	1351 г	\N	37.5	t
1	58	Суши-сет «Филадельфия люкс»	Суши-сеты	Ролл «Филадельфия» 3 шт, суши с лососем 6 шт	930 г	\N	36.9	t
1	59	Суши-сет «Филадельфия мания»	Суши-сеты	Ролл «Филадельфия» в масаго, ролл «Филадельфия лайт», ролл «Филадельфия роял», «Филадельфия‑мини»	932 г	\N	25	t
1	60	Суши-сет «Четыре сезона»	Суши-сеты	Запечённые роллы: с лососем, с крабом, с окунем, с креветкой	1000 г	\N	24	t
1	61	Ролл «Угорь в темпуре»	Темпура	Рис, нори, копчёный угорь, сливочный сыр, авокадо, темпура, сухари «Панко»	190 г	\N	12.8	t
1	62	Ролл «Фудзияма»	Темпура	Рис, нори, сыр сливочный, авокадо, огурец, лосось в замесе с соусом «Терияки», кунжут микс, кляр тесто, сухари панко	290 г	\N	15	t
1	63	Ролл «Морской микс»	Темпура	Рис, соус «Спайси», салат латук, огурец, королевская креветка, тунец, лосось, тесто кляр, сухари панировочные	300 г	\N	14.5	t
1	125	Соус кисло-сладкий «Чили»	Японский гарнир		30 г	\N	1.5	t
1	64	Ролл «Запечённая Калифорния»	Запечённые роллы	Рис, нори, сыр сливочный, снежный краб, огурец, соус розовый, сыр «Маасдам», икра масаго	195 г	\N	9.9	t
1	65	Ролл «Запечённый с грибами и омлетом тамаго»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, шиитаке, соус розовый	270 г	\N	8	t
1	66	Ролл «Запечённый с креветкой и авокадо»	Запечённые роллы	Рис, нори, сыр сливочный, огурец, авокадо, креветка салатная, икра масаго, соус розовый, соус «Унаги»	280 г	\N	11.15	t
1	67	Ролл «Запечённый с курицей»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, курица «Терияки», соус розовый	245 г	\N	7.5	t
1	68	Ролл «Запечённый с лососем»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, лосось, икра масаго, соус розовый	280 г	\N	10.95	t
1	69	Ролл «Запечённый с мидиями»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, мидии салатные, икра масаго, соус розовый	290 г	\N	11.2	t
1	70	Ролл «Запечённый с окунем»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, окунь копчённый, соус розовый, икра масаго	280 г	\N	9.9	t
1	71	Ролл «Запечённый с тунцом»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, икра масаго, тунец, соус розовый	280 г	\N	10.9	t
1	72	Ролл «Запечённый с угрём»	Запечённые роллы	Рис, нори, сыр сливочный, омлет тамаго, огурец, икра масаго, угорь, соус розовый	280 г	\N	14	t
1	73	Запечённые суши с лососем	Запечённые гунканы		60 г	\N	3.3	t
1	74	Запечённые суши с угрём	Запечённые гунканы	Рис, нори, лосось, соус «Розовый»	60 г	\N	3.5	t
1	75	Запечённые суши с окунем	Запечённые гунканы	Рис, нори, угорь, соус «Розовый»	60 г	\N	2.5	t
1	76	Запечённые суши с тигровой креветкой	Запечённые гунканы	Рис, нори, тигровая креветка, соус «Розовый»	60 г	\N	3.5	t
1	77	Запечённые суши с креветками	Запечённые гунканы	Рис, нори, креветки, соус «Розовый»	60 г	\N	2.5	t
1	78	Запечённые суши с мидиями	Запечённые гунканы	Рис, норм, идии салатные, соус «Розовый»	60 г	\N	2.5	t
1	79	Запечённые суши с крабом	Запечённые гунканы	Рис, нори, краб, соус «Розовый»	60 г	\N	2.5	t
1	80	Гункан острый с окунем	Острые гунканы	Рис, нори, копчённый окунь, соус «Спайси», икра масаго, лук зелёный	45 г	\N	2.5	t
1	81	Острые суши с креветкой	Острые гунканы	Рис, нори, креветка салатная, соус «Спайси»	37 г	\N	2.7	t
1	82	Острые суши с лососем	Острые гунканы	Рис, нори, лосось, соус «Спайси»	37 г	\N	2.7	t
1	83	Острые суши с угрём	Острые гунканы	Рис, нори, угорь, соус «Спайси»	37 г	\N	3.2	t
1	84	Суши с копчёным окунем	Нигири	Рис, нори, окунь копчённый, соус «Спайси», лук зелёный	40 г	\N	2.2	t
1	85	Суши с королевской креветкой	Нигири	Рис, нори, королевская креветка, икра масаго	40 г	\N	3	t
1	86	Суши с лососем	Нигири	Рис, нори, лосось	40 г	\N	2.5	t
1	87	Суши с угрём	Нигири	Рис, нори, угорь, соус «Унаги», кунжут‑микс	40 г	\N	3	t
1	88	Суши с креветкой и сливочным сыром	Гунканы	Рис, нори, сливочный сыр, креветка	37 г	\N	2.5	t
1	89	Суши с мидиями	Гунканы	Рис, нори, мидии	32 г	\N	2	t
1	90	Суши с чука‑салатом	Гунканы	Рис, нори, чукка‑салат	32 г	\N	2	t
1	91	Суши с крабом	Гунканы	Рис, нори, краб	32 г	\N	2	t
1	92	Фаст-ролл «Креветка „Терияки“»	Фаст-роллы	Рис, нори, огурец, грибы шиитаке, креветки, соус «Терияки», паприка	175 г	\N	5.8	t
1	93	Фаст-ролл «Лосось „Терияки“»	Фаст-роллы	Рис, нори, лосось «Терияки», сливочный сыр, китайская капуста	160 г	\N	5.95	t
1	94	Фаст-ролл «Нежный краб»	Фаст-роллы	Рис, нори, снежный краб, огурец	155 г	\N	5	t
1	95	Фаст-ролл «Филадельфия»	Фаст-роллы	Рис, нори, сливочный сыр, лосось, огурец	160 г	\N	6.4	t
1	96	Фаст-ролл «Фитнес»	Фаст-роллы	Рис, нори, огурец, китайская капуста, паприка, соус «Розовый», кунжут	147 г	\N	4	t
1	97	Фаст-ролл «Чикен спайси» 	Фаст-роллы	Рис, нори, курица «Терияки», сливочный сыр, паприка, китайская капуста, соус «Спайси», зелёный лук	170 г	\N	4.6	t
1	126	Соус соевый	Японский гарнир		40 г	\N	1.2	t
1	98	Морской микс с яблоком и личи	Салаты	Лосось, тунец, креветка, салат чука, яблоко свежее, Личи Мари, перец Чили стручковый, соус соевый, корица, кунжут‑микс	290 г	\N	15	t
1	99	Салат из королевских креветок с манго	Салаты	Королевские креветки, манго свежий, руккола, имбирь, масло оливковое, соус Табаско, орехи кешью, арахис, перец Чили стручковый, семечки ядро, специи, долька лайма	330 г	\N	15.5	t
1	100	Салат с тунцом и стручковой фасолью	Салаты	Латук, тунец, фасоль стручковая обжаренная, соус соевый, масло кунжутное, помидоры черри, горчица «Французская», долька лайма, хондаши, специи, кунжут микс	335 г	\N	15	t
1	101	Салат с угрём и чукой	Салаты	Рукола, ростки соевые Пак-Чой, перец сладкий, салат чука, угорь, перец Чили, лайм, кунжут микс, горчица «Французская», хондаши, соус соевый	325 г	\N	16.5	t
1	102	Салат «Цезарь» с королевской креветкой	Салаты	Королевская креветка, салат латук, соус «Цезарь», помидоры черри, крутоны в чесночном масле, сыр «Пармезан»	340 г	\N	14.9	t
1	103	Салат «Цезарь» с курицей	Салаты	Курица обжаренная со специями, салат латук, соус «Цезарь», помидоры черри, крутоны в чесночном масле, сыр «Пармезан»	340 г	\N	11.9	t
1	104	Салат «Цезарь» с норвежской форелью	Салаты	Форель норвежская подсоленная, салат латук, соус «Цезарь», помидоры черри, крутоны в чесночном масле, сыр «Пармезан»	340 г	\N	14.5	t
1	105	Тёплый салат «Тайский» с говядиной	Салаты	Говядина в соевом соусе, салат латук, огурец, перец сладкий, паста Кимчи, масло кунжутное, паприка сладкая, долька лайма, перец Чили стручковый, кунжут микс, чеснок	350 г	\N	15	t
1	106	Цитрусовый салат с королевскими креветками и кальмаром	Салаты	Латук, рукола, заправка цитрусовая с мёдом, королевская креветка, кальмар обжаренный, ананас консервированный, апельсин, оливки, орехи кешью, корица	350 г	\N	14.9	t
1	107	WOK с говядиной	WOK	Удон, говяжье филе вырезка, овощи микс, соус соевый, соус «Унаги», кунжут-микс, лук зелёный	400 г	\N	12	t
1	108	WOK с курицей	WOK	Удон, овощи-микс, филе куриное, соус, соус «Унаги», кунжут-микс, лук зелёный	400 г	\N	9	t
1	109	WOK с морепродуктами	WOK	Удон, морской микс, овощи-микс, соус, соус «Унаги», кунжут-микс, лук зелёный	400 г	\N	12	t
1	110	Запечённые мидии «Гигант» в кокосовом молоке	Закуски	Мидии «Гигант», соус «Розовый», лимон, соус «Унаги», кунжут	170 г	\N	14	t
1	111	Крем-суп с копчёным кальмаром	Супы	Кальмар, лук репчатый, морковь, помидоры, сметана, специи, укроп	340 г	\N	9.5	t
1	112	Сливочный суп с лососем	Супы	Сливки, лосось, кукуруза, хондаши, соевые ростки Пак-Чой, укроп, специи	350 г	\N	10.5	t
1	113	Суп «Кимчи»	Супы	Мисо паста, соус соевый, хондаши, водоросли вакаме, грибы Шиитаке, сыр соевый тофу, лук зелёный, кунжут микс, яйцо, паста Кимчи	350 г	\N	5	t
1	114	Суп «Мисо» 	Супы	Мисо паста, соус соевый, хондаши, водоросли вакаме, грибы Шиитаке, сыр соевый тофу, лук зелёный, кунжут‑микс	320 г	\N	4	t
1	115	Тайский куриный суп «Том‑кха»	Супы	Паста Том-Кха, филе куриное, Шрирача, масло кунжутное, молоко кокосовое, имбирь, грибы Шиитаке, хондаши, перец Чили стручковый, лемонграсс, укроп, лук‑порей, специи	350 г	\N	10.2	t
1	116	Суп «Том Ям Кунг»	Супы	Креветки королевские, мидии «Гигант», цыпленок филе, хондаши, грибы Шиитаке, молоко кокосовое, лемонграсс, паста Том Ям Кунг, куриный бульон, лайм долька, помидоры черри, лук‑порей, специи	375 г	\N	15	t
1	117	Томатный суп с карри и пастой «Кимчи»	Супы	Помидоры, карри, молоко кокосовое, морковь, лук зелёный, перец Чили стручковый, имбирь, паста Кимчи, специи	330 г	\N	7.5	t
1	118	Суп «Фо Бо» с говядиной	Супы	Говядина, лапша пшеничная, хондаши, лайм сок, перец Чили стручковый, лемонграсс, специи, кунжут микс, лук зелёный	350 г	\N	11.5	t
1	119	Крем-суп из цукини с беконом	Супы			\N	8.5	t
1	120	Васаби 	Японский гарнир		25 г	\N	1	t
1	121	Имбирь маринованный	Японский гарнир		50 г	\N	1	t
1	122	Соус «Кимчи»	Японский гарнир		20 г	\N	1.1	t
1	123	Ореховый соус	Японский гарнир		30 г	\N	1.5	t
1	124	Соус «Розовый»	Японский гарнир		30 г	\N	1.5	t
11	973	Соус сырный	Топинг			\N	0.5	t
1	127	Соус «Спайси» 	Японский гарнир		30 г	\N	1.5	t
1	128	Соус «Ширачи»	Японский гарнир		30 г	\N	1.1	t
2	129	Комбо «Четыре прошутто»	Комбо			\N	32	t
2	130	Комбо «Сицилийская + Сытная + Цыплёнок барбекю»	Комбо			\N	34	t
2	131	Kebab box	Комбо	Курица, салат, помидоры, огурцы, картофель фри, соус чесночный	400 г	\N	7.9	t
2	132	Kebab box + Coca‑Cola	Комбо			\N	17.5	t
2	133	Шаурма	Шаурма		400 г	\N	6.9	t
2	134	Шаурма в лаваше без дрожжей	Лаваш		400 г	\N	6.9	t
2	135	Пицца «От шефа»	Пиццы	Тесто, сыр «Моцарелла», соус «Барбекю», бекон, лук, ветчина, горчичный соус, мюнхенские колбаски, салями, орегано	595 г 32 см	\N	13	t
2	136	Пицца 2 KG «MEGA OLD»	Пиццы	Соус томатный, сыр «Моцарелла», ветчина, чесночный соус, филе куриное, орегано		\N	35.9	t
2	137	Пицца 2 KG «MEGA NEW»	Пиццы	Соус томатный, сыр «Моцарелла», макароны, чесночный соус, филе куриное, орегано		\N	30.99	t
2	138	Пицца «Сицилийская»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», филе цыплёнка, шампиньоны, соус чесночный, перец, орегано	480 г 32 см	\N	13.9	t
2	139	Пицца «Деревенская»	Пиццы	Сыр, фарш говяжий, ветчина, грудинка, маринованный огурец, лук красный, соус томатный, соус чесночный, орегано	520 г 32 см	\N	13.9	t
2	140	Пицца «Сытная»	Пиццы	Тесто, соус для пиццы, смесь двух сыров, грудинка, колбаса, соус из сметаны и чеснока, помидоры, орегано	480 г 32 см	\N	12.5	t
2	141	Пицца «Капричиоза»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», ветчина, шампиньоны, маслины, орегано	450 г 32 см	\N	12.5	t
2	142	Пицца «Карбонара»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», каперсы, грудинка, сыр «Пармезан», орегано	440 г 32 см	\N	12.5	t
2	143	Пицца «Маргарита»	Пиццы	Тесто, соус для пиццы, смесь двух сыров, помидоры, масло оливковое, орегано	420 г 32 см	\N	8.5	t
2	144	Пицца «Четыре сыра»	Пиццы	Тесто, соус для пиццы, сыр твёрдый, сыр «Дорблю», сыр «Пармезан», сыр «Моцарелла», орегано	340 г 32 см	\N	12	t
2	145	Пицца «Четыре сезона»	Пиццы	Тесто, соус для пиццы, сыр, маслины, салями, ветчина, шампиньоны, лук, руккола, орегано	380 г 32 см	\N	12.9	t
2	146	Пицца «Барбекю» острая	Пиццы	Тесто, соус для пиццы, сыр, салями, корнишоны, перец чили, специи	400 г 32 см	\N	12.5	t
2	147	Пицца «Голоза»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», сыр творожный, шампиньоны, ветчина, сливки, руккола, орегано	520 г 32 см	\N	12.5	t
2	148	Пицца «Гавайская»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», филе куриное, ананасы консервированные	450 г 32 см	\N	11	t
2	149	Пицца «Вегетарианская»	Пиццы	Тесто, соус для пиццы, смесь двух сыров, помидоры, перец, шампиньоны, кукуруза, маслины, лук, руккола, орегано	480 г 32 см	\N	13	t
2	150	Пицца «Прошутто»	Пиццы	Тесто, соус для пиццы, смесь двух сыров, ветчина, орегано	400 г 32 см	\N	10	t
2	151	Пицца с грибами	Пиццы	Тесто, соус для пиццы, смесь двух сыров, шампиньоны, орегано	330 г 32 см	\N	9	t
2	152	Пицца с салями	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», салями, орегано	370 г 32 см	\N	10	t
2	153	Пицца с креветками	Пиццы	Соус для пиццы, сыр «Моцарелла», креветки, перец, маслины, лук, орегано	540 г 32 см	\N	12.9	t
2	154	Пицца с брокколи	Пиццы	Соус для пиццы, сыр «Моцарелла», брокколи, ветчина, помидоры, соус чесночный, орегано	560 г 32 см	\N	12	t
2	155	Пицца PIZZAOK фирменная	Пиццы	Соус для пиццы, сыр «Моцарелла», бекон, ветчина, фарш говяжий, курица, шампиньоны, перец, соус, лук, орегано	590 г 32 см	\N	13.9	t
2	156	Пицца «Цыплёнок барбекю»	Пиццы	Соус для пиццы, смесь двух сыров, филе цыплёнка, лук, помидоры, соус «Барбекю», орегано	480 г 32 см	\N	12.9	t
2	157	Пицца «Сырный цыплёнок»	Пиццы	Тесто, филе цыплёнка, три порции сыра «Моцарелла», специи	490 г 32 см	\N	12.5	t
2	158	Пицца «Цыплёнок карри»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», филе цыплёнка, соус «Карри», специи	460 г 32 см	\N	11.69	t
2	159	Пицца «Пеперони»	Пиццы	Тесто, соус для пиццы, сыр «Моцарелла», перец острый сушёный, орегано	370 г 32 см	\N	11	t
3	215	Пицца «Сытная»	Пицца		290 г	\N	12	t
3	216	Пицца «Куриная»	Пицца		320 г	\N	12	t
2	160	Пицца  «Карри»	Пиццы	Тесто, соус для пиццы, смесь двух сыров, куриное филе, фирменный медовый соус, масло оливковое, орегано.	32 г	\N	11.9	t
2	161	Картофель фри	Закуски		180 г	\N	3.9	t
2	162	Наггетсы 	Закуски		9 шт	\N	8.5	t
2	163	Ветчина	Топинг		50 г	\N	1.8	t
2	164	Грудинка	Топинг		50 г	\N	1.7	t
2	165	Сыр «Моцарелла»	Топинг		50 г	\N	1.7	t
2	166	Сыр «Фета»	Топинг		50 г	\N	1.5	t
2	167	Сыр «Пармезан»	Топинг		30 г	\N	1.7	t
2	168	Корнишоны	Топинг		50 г	\N	1.5	t
2	169	Филе цыплёнка	Топинг		50 г	\N	1.5	t
2	170	Пеперони	Топинг		50 г	\N	1.5	t
2	171	Перец сладкий	Топинг		30 г	\N	1.5	t
2	172	Перец острый	Топинг		10 г	\N	1.5	t
2	173	Маслины	Топинг		30 г	\N	1.8	t
2	174	Шампиньоны	Топинг		50 г	\N	1	t
2	175	Помидоры	Топинг		50 г	\N	1	t
2	176	Огурец консервированный	Топинг		50 г	\N	1.5	t
2	177	Ананас консервированный	Топинг		50 г	\N	1.5	t
2	178	Соус Heinz чесночный	Топинг		25 г	\N	1	t
2	179	Соус Heinz «Барбекю»	Топинг		25 г	\N	1	t
2	180	Соус Heinz сырный	Топинг		25 г	\N	1	t
2	181	Соус Heinz кисло‑сладкий	Топинг		25 г	\N	1	t
2	182	Напиток газированный «Кока‑кола»	Холодные напитки		1000 г	\N	3.5	t
2	183	Милк-шейк	Горячие напитки и коктейли		450 мл	\N	4	t
2	184	Какао	Горячие напитки и коктейли		350 мл	\N	3.9	t
2	185	Кофе «Капучино»	Горячие напитки и коктейли		350 мл	\N	3.4	t
2	186	Кофе «Флэт‑уайт»	Горячие напитки и коктейли		250 мл	\N	3.9	t
2	187	Кофе «Латте»	Горячие напитки и коктейли		350 мл	\N	4	t
2	188	Кофе «Мокачино»	Горячие напитки и коктейли		350 мл	\N	4.3	t
2	189	Раф-кофе	Горячие напитки и коктейли		350 мл	\N	4.3	t
2	190	Кофе «Американо»	Горячие напитки и коктейли		160 мл	\N	2.9	t
2	191	Чай	Горячие напитки и коктейли		350 мл	\N	3.1	t
2	192	Молоко	Горячие напитки и коктейли			\N	0.6	t
2	193	Сливки	Горячие напитки и коктейли			\N	0.6	t
2	194	Сироп	Горячие напитки и коктейли			\N	1	t
2	195	Топпинг	Горячие напитки и коктейли			\N	1	t
2	196	Мёд	Горячие напитки и коктейли			\N	1	t
2	197	Сливки взбитые	Горячие напитки и коктейли			\N	1	t
2	198	Маршмеллоу	Горячие напитки и коктейли			\N	1	t
2	199	Лимон	Горячие напитки и коктейли			\N	1.3	t
2	200	Апельсин	Горячие напитки и коктейли			\N	1.3	t
2	201	Лайм	Горячие напитки и коктейли			\N	1.3	t
3	202	Пицца «Кавказская»	Пицца	Салями, ветчина, лук красный, помидор, соус горчичный, аджика, сыр «Моцарелла», соус, специи	330 г	\N	12	t
3	203	Пицца-бургер	Пицца	Грудинка, говядина, огурцы маринованные, лук маринованный, помидор, салат, сыр «Чеддер», соус горчичный, сыр «Моцарелла», соус, специи	395 г	\N	12	t
3	204	Пицца «Пеперони»	Пицца	Салями, сыр «Моцарелла», соус, специи	260 г	\N	11.5	t
3	205	Пицца «Мясная NEW»	Пицца	Свинина, говядина, курица запечённая, курица копчёная, лук карамельный, помидор, бастурма, сыр «Моцарелла», соус	380 г	\N	14	t
3	206	Пицца «Овощная»	Пицца	Баклажан, цукини, перец, лук красный, шампиньоны, руккола, соус «Терияки», сыр «Моцарелла», специи	320 г	\N	10.5	t
3	207	Пицца «Пикантная NEW»	Пицца	Ветчина, салями, шампиньоны маринованные, огурцы маринованные, лук маринованный, маслины, сыр «Моцарелла», соус	310 г	\N	12	t
3	208	Пицца «Жюльен» 	Пицца	Филе куриное запечённое, шампиньоны, лук, сливки, соус сметанный, сыр «Моцарелла», специи, зелень	340 г	\N	12	t
3	209	Пицца «Маринара»	Пицца	Сёмга, кальмар, мидии, креветки, лимон, зелень, оливки, сыр «Моцарелла», соус	330 г	\N	14	t
3	210	Пицца с ветчиной и грибами	Пицца		330 г	\N	12	t
3	211	Пицца «Охотничья NEW»	Пицца		315 г	\N	11.5	t
3	212	Пицца с вяленой говядиной и грудинкой	Пицца		320 г	\N	14	t
3	213	Пицца «Динамо»	Пицца		370 г	\N	12	t
3	214	Пицца «Сочная»	Пицца		395 г	\N	12	t
3	217	Пицца «Капричоза»	Пицца		315 г	\N	10	t
3	218	Пицца со сметанным соусом	Пицца		305 г	\N	11.5	t
3	219	Пицца «Сицилийская»	Пицца		330 г	\N	12.6	t
3	220	Пицца «Четыре сыра»	Пицца		270 г	\N	12.6	t
3	221	Пицца «Нежная»	Пицца		310 г	\N	11.5	t
3	222	Пицца «Маргарита»	Пицца		255 г	\N	7.3	t
3	223	Пицца «Фирменная»	Пицца		305 г	\N	12.6	t
3	224	Пицца «Мексиканская» острая	Пицца		355 г	\N	12.6	t
3	225	Пицца «Мюнхенская»	Пицца		360 г	\N	12.1	t
3	226	Пицца с маринованными опятами	Пицца		330 г	\N	12.1	t
3	227	Пицца «Кавказская» на пышном тесте	Пиццы на пышном тесте		530 г	\N	14.2	t
3	228	Пицца-бургер на пышном тесте	Пиццы на пышном тесте		665 г	\N	14.2	t
3	229	Пицца «Пеперони» на пышном тесте	Пиццы на пышном тесте		470 г	\N	13.1	t
3	230	Пицца «Мясная NEW» на пышном тесте	Пиццы на пышном тесте		650 г	\N	17.3	t
3	231	Пицца «Овощная» на пышном тесте	Пиццы на пышном тесте		660 г	\N	12.2	t
3	232	Пицца «Пикантная NEW» на пышном тесте	Пиццы на пышном тесте		650 г	\N	14.2	t
3	233	Пицца «Жюльен» на пышном тесте 	Пиццы на пышном тесте		650 г	\N	14.5	t
3	234	Пицца «Маринаре» на пышном тесте	Пиццы на пышном тесте		655 г	\N	17.3	t
3	235	Пицца с ветчиной и грибами на пышном тесте	Пиццы на пышном тесте		560 г	\N	12.2	t
3	236	Пицца «Охотничья NEW» на пышном тесте	Пиццы на пышном тесте		630 г	\N	13.1	t
3	237	Пицца с вяленой говядиной и грудинкой на пышном тесте	Пиццы на пышном тесте		640 г	\N	17.3	t
3	238	Пицца «Динамо» на пышном тесте	Пиццы на пышном тесте		720 г	\N	14.2	t
3	239	Пицца «Сочная» на пышном тесте	Пиццы на пышном тесте		665 г	\N	14.5	t
3	240	Пицца «Сытная» на пышном тесте	Пиццы на пышном тесте		580 г	\N	14.2	t
3	241	Пицца «Куриная» на пышном тесте	Пиццы на пышном тесте		600 г	\N	14.2	t
3	242	Пицца «Капричоза» на пышном тесте	Пиццы на пышном тесте		610 г	\N	11.2	t
3	243	Пицца со сметанным соусом на пышном тесте	Пиццы на пышном тесте		615 г	\N	13.1	t
3	244	Пицца «Сицилийская» на пышном тесте	Пиццы на пышном тесте		580 г	\N	14.8	t
3	245	Пицца «Четыре сыра» на пышном тесте	Пиццы на пышном тесте		500 г	\N	14.8	t
3	246	Пицца «Нежная» на пышном тесте	Пиццы на пышном тесте		575 г	\N	13.1	t
3	247	Пицца «Маргарита» на пышном тесте	Пиццы на пышном тесте		530 г	\N	8.7	t
3	248	Пицца «Фирменная» на пышном тесте	Пиццы на пышном тесте		570 г	\N	14.8	t
3	249	Пицца «Мексиканская» (острая) на пышном тесте	Пиццы на пышном тесте		615 г	\N	13.1	t
3	250	Пицца «Мюнхенская»	Пиццы на пышном тесте		650 г	\N	14.5	t
3	251	Пицца с курицей под соусом «Барбекю»	Пиццы на пышном тесте		570 г	\N	12.5	t
3	252	Пицца с маринованными опятами	Пиццы на пышном тесте		590 г	\N	13.5	t
3	253	Обеденный комплекс (понедельник)	Обеденное меню		650 г	\N	5	t
3	254	Ролл «Сяке темпура маки»	Роллы		187 г	\N	11	t
3	255	Ролл «Хакусан спайси темпура маки» (острый) 	Роллы		250 г	\N	7.9	t
3	256	Ролл «Эби темпура маки»	Роллы		330 г	\N	11	t
3	257	Ролл с жареным морским окунем	Роллы		8 шт	\N	7.5	t
3	258	Ролл «Овощной» со сливочным сыром	Роллы		8 шт	\N	4.9	t
3	259	Ролл с тигровой креветкой в чуке	Роллы		8 шт	\N	9.9	t
3	260	Ролл с копчёным лососем и соусом «Терияки» 	Роллы		8 шт	\N	8.9	t
3	261	Ролл с жареным лососем и авокадо	Роллы		8 шт	\N	9.9	t
3	262	Запечённый ролл с лососем и морским окунем	Роллы		8 шт	\N	8.9	t
3	263	Запечённый ролл с лососем и снежным крабом	Роллы		8 шт	\N	7.9	t
3	264	Ролл с тунцом и острым соусом	Роллы		8 шт	\N	7.9	t
3	265	Ролл с копчёным лососем и салатом «Айсберг»	Роллы		8 шт	\N	8.9	t
3	266	Ролл с опалённым лососем и орехами кешью	Роллы		8 шт	\N	12.9	t
3	267	Ролл с опалённым морским окунем	Роллы		8 шт	\N	7.9	t
3	268	Ролл с опалённым тунцом и морским окунем	Роллы		8 шт	\N	10.9	t
3	269	Филадельфия фреш	Роллы		8 шт	\N	11.9	t
3	270	Ролл с тигровой креветкой в икре летучей рыбы	Роллы		8 шт	\N	10.9	t
3	271	Ролл с лососем в икре летучей рыбы	Роллы		8 шт	\N	11.9	t
3	272	Суши-сет «Тай»	Суши-сеты		24 шт	\N	21.9	t
3	273	Суши-сет «Микадо»	Суши-сеты		24 шт	\N	23.9	t
3	274	Суши-сет «Саппоро»	Суши-сеты		32 шт	\N	27.9	t
3	275	Суши-сет «Токио»	Суши-сеты		32 шт	\N	29.9	t
3	276	Суши-сет «Императорский»	Суши-сеты		40 шт	\N	34.9	t
3	277	Суши-сет «Кани»	Суши-сеты		32 шт	\N	29.9	t
3	278	Филадельфия сет	Суши-сеты		32 шт	\N	33	t
3	279	Закуска «Для друзей»	Закуски		730 г	\N	19.5	t
3	280	Закуска «По‑деревенски»	Закуски		365 г	\N	9.7	t
3	281	Сельдь с картофелем	Закуски		262 г	\N	6.7	t
3	282	Мя��ная тарелка	Закуски		250 г	\N	11.5	t
3	283	Наггетсы куриные 	Закуски		100 г	\N	8.9	t
3	284	Гренки с сырным соусом	Закуски		250 г	\N	4.9	t
3	285	Сырная тарелка	Закуски		140 г	\N	12.3	t
3	286	Овощная тарелка	Закуски		180 г	\N	7.9	t
3	287	Карпаччо из говядины 	Закуски		210 г	\N	12.6	t
3	288	Смаженый сыр	Закуски		210 г	\N	8.5	t
3	289	Колбаски «По-баварски» к пиву	Закуски		210 г	\N	8.9	t
3	290	Крылья «Пикантные» в аджике	Закуски		300 г	\N	8	t
3	291	Рёбра «Под пиво»	Закуски		300 г	\N	16	t
3	292	Пивной сет «На компанию»	Закуски		250 г	\N	24	t
3	293	Салат «Цезарь» с сёмгой	Салаты		230 г	\N	11.8	t
3	294	Салат «Цезарь» с цыплёнком	Салаты		230 г	\N	9.4	t
3	295	Салат «Поло»	Салаты		225 г	\N	7.9	t
3	296	Салат «Греческий»	Салаты		230 г	\N	8.5	t
3	297	Салат «Итальянский» с вяленой говядиной и сыром	Салаты		170 г	\N	11.8	t
3	298	Микс-салат с ростбифом и помидорами черри 	Салаты		150 г	\N	10.5	t
3	299	Микс-салат с тигровыми креветками	Салаты		140 г	\N	11.8	t
3	300	Микс-салат с цыплёнком	Салаты		140 г	\N	7.9	t
3	301	Салат с говядиной, чукка-салатом и сладким перцем	Салаты		170 г	\N	10.5	t
3	302	Мясной салат с хрустящим беконом и цыпленком	Салаты		220 г	\N	11.7	t
3	303	Крем-суп из шампиньонов	Супы		250 г	\N	5.9	t
3	304	Суп-пюре из брокколи	Супы		250 г	\N	6.1	t
3	305	Солянка мясная	Супы		271 г	\N	5.9	t
3	306	Борщ «По‑деревенски»	Супы		321 г	\N	5.9	t
3	307	Суп «Харчо» с «Баварскими» колбасками	Супы		250 г	\N	4.9	t
3	308	Крем-суп «По‑французски»	Супы		220 г	\N	6.5	t
3	309	Жаркое «По‑домашнему»	Горячие блюда		295 г	\N	9.9	t
3	310	Горячая сковородка	Горячие блюда		360 г	\N	9.9	t
3	311	Блинчики с ветчиной и сыром	Горячие блюда		381 г	\N	8.9	t
3	312	Блинчики с курицей и грибами	Горячие блюда		316 г	\N	8.9	t
3	313	Драники с мачанкой	Горячие блюда		304 г	\N	9.3	t
3	314	Драники с курицей	Горячие блюда		331 г	\N	8.9	t
3	315	Мясная запеканка со сметанным соусом	Горячие блюда		370 г	\N	9.7	t
3	316	Картофельно-грибная запеканка с курицей	Горячие блюда		352 г	\N	9.3	t
3	317	Драники со сливочно-грибным соусом	Горячие блюда		226 г	\N	9.1	t
3	318	Биф-бургер	Бургеры		370 г	\N	11.9	t
3	319	Чизбургер	Бургеры		430 г	\N	11.9	t
3	320	Чикенбургер	Бургеры		400 г	\N	11.9	t
3	321	Паста «Карбонара»	Паста		232 г	\N	10.6	t
3	322	Паста с цыплёнком и грибами	Паста		282 г	\N	12.2	t
3	323	Паста с морепродуктами	Паста		270 г	\N	15.9	t
3	324	Паста с ветчиной в сливочном соусе	Паста		282 г	\N	10.4	t
3	325	Сёмга со сливочным соусом	Гриль		360 г	\N	22.5	t
3	326	Филе цыплёнка-гриль на подушке из овощей	Гриль		270 г	\N	9.4	t
3	327	Цыплёнок с беконом в глазури	Гриль		321 г	\N	11.1	t
3	328	Рубленый бифштекс из говядины	Гриль		356 г	\N	14.5	t
3	329	Шашлычный микс	Гриль		490 г	\N	19.5	t
3	330	Шашлык из свинины	Гриль		340 г	\N	13.5	t
3	331	Шашлык из курицы	Гриль		340 г	\N	11.5	t
11	974	Соус томатный	Топинг			\N	0.5	t
3	332	Свинина-гриль с картофелем по‑деревенски	Гриль		300 г	\N	15.5	t
3	333	Рёбра в медовом соусе с картофелем «По‑деревенски»	Гриль		300 г	\N	17.9	t
3	334	Картофан «Сытный»	Картофаны		400 г	\N	15	t
3	335	Картофан с беконом	Картофаны		390 г	\N	11	t
3	336	Картофан с сёмгой	Картофаны		350 г	\N	15	t
3	337	Картофан с опятами и «Охотничьими» колбасками	Картофаны		355 г	\N	11	t
3	338	Овощи-гриль с соусом «Барбекю»	Гарниры		180 г	\N	6.5	t
3	339	Шампиньоны-гриль	Гарниры		160 г	\N	5.5	t
3	340	Картофель «По‑деревенски»	Гарниры		150 г	\N	3	t
3	341	Картофель фри	Гарниры		100 г	\N	3.5	t
3	342	Теппаньяки рис с говядиной	Блюда японской кухни		360 г	\N	11	t
3	343	Теппаньяки рис с овощами	Блюда японской кухни		290 г	\N	8.8	t
3	344	Лапша с говядиной в соусе «Терияки» 	Блюда японской кухни		340 г	\N	10.4	t
3	345	Лапша с цыплёнком в соусе «Карри»	Блюда японской кухни		340 г	\N	10.4	t
3	346	Лапша со свининой в соусе «Терияки» и с перцем халапеньо 	Блюда японской кухни		330 г	\N	10.4	t
3	347	Японский гарнир	Японский гарнир		53 г	\N	2	t
3	348	Имбирь маринованный	Японский гарнир		30 г	\N	1	t
3	349	Соус соевый	Японский гарнир		30 г	\N	1	t
3	350	Соус соевый «Лайт»	Японский гарнир		30 г	\N	1	t
3	351	Соус ореховый	Японский гарнир		30 г	\N	2	t
3	352	Десерт пряный	Десерты		132 г	\N	4.5	t
3	353	Чизкейк 	Десерты		151 г	\N	4.8	t
3	354	Торт «Нежность»	Десерты		141 г	\N	4.5	t
3	355	Тирамису 	Десерты		131 г	\N	5.1	t
3	356	Штрудель яблочный	Десерты		202 г	\N	5.9	t
3	357	Пирог вишнёвый	Десерты		201 г	\N	4.5	t
3	358	Газированный напиток Pepsi‑Cola	Напитки		500 мл	\N	2.6	t
3	359	Газированный напиток Mirinda	Напитки		500 мл	\N	2.6	t
3	360	Газированный напиток 7Up	Напитки		500 мл	\N	2.6	t
3	361	Питьевая вода «Аква минирале»	Напитки			\N	2.2	t
3	362	Шампиньоны маринованные	Топинг		20 г	\N	0.8	t
3	363	Помидоры	Топинг		20 г	\N	1	t
3	364	Огурцы маринованные	Топинг		20 г	\N	0.7	t
3	365	Перец халапеньо маринованный	Топинг		20 г	\N	1.1	t
3	366	Ветчина	Топинг		20 г	\N	1.1	t
3	367	Салями	Топинг		20 г	\N	1.1	t
3	368	Грудинка	Топинг		20 г	\N	1.1	t
3	369	Перец сладкий	Топинг		20 г	\N	0.9	t
3	370	Сыр «Моцарелла»	Топинг		40 г	\N	1.5	t
3	371	Сыр твёрдый итальянский	Топинг		20 г	\N	1.5	t
3	372	Маслины	Топинг		20 г	\N	0.9	t
3	373	Оливки	Топинг		20 г	\N	0.9	t
3	374	Лук маринованный	Топинг		20 г	\N	0.6	t
3	375	Шампиньоны	Топинг		20 г	\N	0.8	t
3	376	Соус «Барбекю»	Топинг		50 г	\N	1.5	t
3	377	Соус «Песто»	Топинг		50 г	\N	2.8	t
3	378	Соус «Сальса»	Топинг		50 г	\N	1.1	t
3	379	Соус «Тар‑тар»	Топинг		50 г	\N	1.5	t
3	380	Соус острый для пиццы	Топинг		50 г	\N	1.5	t
3	381	Соус сметанный с чесноком	Топинг		50 г	\N	1.5	t
3	382	Соус пикантный	Топинг		50 г	\N	1.5	t
3	383	Соус «Табаско»	Топинг		5 г	\N	1.9	t
3	384	Майонез	Топинг		50 г	\N	1	t
3	385	Кетчуп	Топинг		50 г	\N	1.5	t
3	386	Сметана	Топинг		50 г	\N	1	t
4	387	Ролл «Филадельфия классик маки»	Урамаки	Рис, сыр, нори, лосось	300 г	\N	14.9	t
4	388	Ролл «Осака маки»	Урамаки	Рис, нори, сыр, лосось, авокадо, кунжут	210 г	\N	9.9	t
4	389	Ролл «Филадельфия с авокадо»	Урамаки	Рис, нори, сыр, авокадо, лосось	300 г	\N	14.9	t
4	390	Красный дракон маки	Урамаки	Икра тобико, Лосось, Перец болгарский, Соус «Терияки», Сыр спайси	240 г	\N	11.9	t
4	391	Ролл «Киноко маки»	Урамаки	Рис, Лосось, Салат, Кунжут, соус «Спайси», сыр «Тофу»	200 г	\N	11.9	t
4	392	Ролл «Якудза маки»	Урамаки	Рис, Лосось, Огурец, Салат, Сыр, спайси	270 г	\N	13	t
4	393	Ролл «Маланга маки»	Урамаки	Рис, Икра тобико, Креветка, Сыр творожный, ананас консервированный	220 г	\N	11.9	t
4	394	Ролл «Амай маки»	Урамаки	Рис, сыр, нори, лосось, манго, лайм, кунжут	265 г	\N	11.4	t
4	395	Ролл «Магуро бонито маки»	Урамаки	Рис, соус «Спайси», тунец, авокадо, салат, стружка тунца, нори	210 г	\N	10.9	t
4	396	Ролл «Бонито маки»	Урамаки	Рис, сыр, лосось, авокадо, стружка тунца, нори	215 г	\N	10.9	t
4	397	Ролл «Бонито терияки маки» 	Урамаки	Рис, сыр, нори, стружка тунца, авокадо, лосось «Терияки»	215 г	\N	10.9	t
4	398	Ролл «Веган маки»	Урамаки	Рис, огурец, перец, капуста красная, кунжут, нори	190 г	\N	6.1	t
4	399	Ролл «Зелёный дракон маки»	Урамаки	Рис, сыр, лосось холодного копчения, огурец, салат, авокадо, нори	255 г	\N	10.9	t
4	400	Ролл «Каиша маки»	Урамаки	Рис, сыр, нори, тунец, груша, креветка	250 г	\N	12.9	t
4	401	Ролл «Калифорния маки»	Урамаки	Рис, нори, икра тобико, креветка, огурец, авокадо, майонез	250 г	\N	12.9	t
4	402	Ролл «Катана маки»	Урамаки	Рис, сыр, нори, лук зелёный, салат, кунжут	200 г	\N	8.9	t
4	403	Ролл «Кенсин маки»	Урамаки	Рис, сыр, апельсин, угорь, креветка, нори	250 г	\N	12.9	t
4	404	Ролл «Киото маки»	Урамаки	Рис, сыр, нори, угорь, огурец, кунжут, соус «Терияки»	220 г	\N	10.9	t
4	405	Ролл «Коко банго маки»	Урамаки	Икра тобико, креветка, молоко кокосовое, стружка кокоса, стружка миндаля, сыр творожный	240 г	\N	12.9	t
4	406	Ролл «Филадельфия фреш маки»	Урамаки	Лосось, огурец, сыр творожный	220 г	\N	9.9	t
4	407	Ролл «Мурамаса маки»	Урамаки	Рис, нори, сыр, грейпфрут, тунец, лайм	280 г	\N	12.9	t
4	408	Ролл «Тайфун маки»	Урамаки	Рис, нори, соус «Спайси», лук зелёный, тунец, огурец	205 г	\N	9.4	t
4	409	Ролл «Тан‑юн маки »	Урамаки	Рис, нори, лосось, авокадо, огурец, салат	230 г	\N	10.9	t
4	410	Ролл «Фудзин маки»	Урамаки	Креветка, лосось, соус «Терияки», кунжут, сыр творожный, киви	250 г	\N	11.9	t
4	411	Ролл «Хияши маки»	Урамаки	Нори, рис, сыр, лосось, чукка‑салат	290 г	\N	10.9	t
4	412	Ролл «Чёрный дракон маки»	Урамаки	Нори, рис, угорь, сыр, огурец, соус «Терияки», кунжут	260 г	\N	14.4	t
4	413	Ролл «Чизер маки»	Урамаки	Креветка, салат, помидор, сыр творожный, сыр «Чеддер»	240 г	\N	9.2	t
4	414	Ролл «Чикен блэк маки»	Урамаки	Рис, сыр, нори, филе куриное, перец, огурец, кунжут чёрный	230 г	\N	7.9	t
4	415	Ролл «Чикен вайт маки»	Урамаки	Рис, сыр, нори, филе куриное, ананан консервированный, кунжут	220 г	\N	7.9	t
4	416	Ролл «Эбби маки»	Урамаки	Икра тобико, креветка, перец, бумага рисовая, сыр творожный	190 г	\N	9.9	t
4	417	Ролл «Эбигадо маки»	Урамаки	Рис, нори, соус «Спайси», креветка, огурец, авокадо	250 г	\N	11.9	t
4	418	Ролл «Эквадор маки»	Урамаки	Нори, рис, сыр, банан, угорь, соус «Терияки», кунжут	260 г	\N	14.4	t
4	419	Ролл «Фудзияма маки»	Урамаки	Рис, нори, огурец, икра, кунжут, сыр	230 г	\N	14.9	t
4	420	Харакири маки	Маки	Тунец, Перец Халапеньо, Соус Шрирача, Васаби, Сыр творожный	190 г	\N	11.2	t
4	421	Чёрный самурай маки	Маки	Бумага рисовая, Сыр творожный, Банан, Киви	220 г	\N	5.4	t
4	422	Ролл «Кудамоно маки»	Маки	Рис, сыр, нори, тунец, груша	180 г	\N	8.9	t
4	423	Ролл «Магуро маки»	Маки	Тунец, огурец	160 г	\N	8.9	t
4	424	Ролл «Планета маки»	Маки	Рис, сыр, нори, лосось, салат, такуан	160 г	\N	8.9	t
4	425	Ролл «Сяке маки»	Маки	Рис, нори, лосось, огурец	160 г	\N	8.6	t
4	426	Ролл «Унаги маки» 	Маки	Рис, нори, угорь, огурец, кунжут	160 г	\N	10.4	t
4	427	Ролл «Фурутсу маки»	Маки	Рис, нори, сыр, лосось, манго	180 г	\N	9.2	t
4	428	Ролл «Чикен маки»	Маки	Рис, сыр, нори, филе куриное, чукка‑салат	230 г	\N	7.9	t
4	429	Хот ролл с лососем и манго	Маки	Нори, рис, лосось, сыр, икра тобико, манго, кляр, сухари «Панко»	270 г	\N	10.5	t
4	430	Горячий ролл «Филадельфия маки»	Маки	Нори, рис, сыр, огурец, сахари «Панко», кляр, лосось	350 г	\N	14.9	t
4	431	Хот ролл с лососем	Горячие роллы	Лосось, огурец, сыр творожный	270 г	\N	10.9	t
4	432	Хот ролл с креветками и чукка‑салатом	Горячие роллы	Нори, рис, сыр, чукка-салат, креветка, сухари «Панко», кляр	280 г	\N	10.2	t
8	764	Лимон	Японский гарнир		15 г	\N	0.7	t
4	433	Хот ролл с лососем и авокадо	Горячие роллы	Нори, рис, лосось, авокадо, кляр, сухари «Панко»	240 г	\N	10.5	t
4	434	Хот ролл с тунцом	Горячие роллы	Тунец, огурец, сыр творожный	250 г	\N	10.2	t
4	435	Хот ролл с угрём и креветками	Горячие роллы	Нори, рис, угорь, креветка, сыр, такуан	290 г	\N	13.9	t
4	436	Хот ролл «Чикен классик»	Горячие роллы	Рис, сыр, нори, филе куриное, огурец, сухари панко, кляр	270 г	\N	8.9	t
4	437	Ролл «Банан темпура»	Горячие роллы	Топинг «Карамель», стружка кокоса, топинг «Шоколад», банан	320 г	\N	5.2	t
4	438	Нигири «Кунсей»	Нигири	Рис, лосось холодного копчения	40 г	\N	2.1	t
4	439	Нигири «Магуро»	Нигири	Рис, тунец	40 г	\N	2	t
4	440	Нигири «Авокадо»	Нигири	Рис, нори, авокадо	40 г	\N	1	t
4	441	Нигири «Сяке»	Нигири	Рис, лосось	40 г	\N	2	t
4	442	Нигири «Унаги» 	Нигири	Рис, угорь, нори, соус «Терияки», кунжут	40 г	\N	2.5	t
4	443	Нигири «Эби Чеддер»	Нигири	Креветка, икра тобико, сыр «Чеддер»	55 г	\N	4.5	t
4	444	Нигири «Эби»	Нигири	Рис, креветки тигровая	35 г	\N	2	t
4	445	Нигири «Эби Карай»	Нигири	Креветка, лосось, соус «Ким‑Чи»	100 г	\N	9.3	t
4	446	Спринг-ролл с лососем и тунцом	Спринг-роллы	Рис, угорь, соус «Терияки», такуан, огурец, кунжут, бумага рисовая	160 г	\N	12.3	t
4	447	Спринг-ролл «Фитнес»	Спринг-роллы	Бумага рисовая, салат, огурец, морковь, такуан	160 г	\N	7.1	t
4	448	Суши-сет «Филадельфия»	Суши-сеты	Ролл «Филадельфия с авокадо», ролл «Тан-юн», ролл «Бонито терияки», соус соевый, имбирь, васаби	830 г	\N	29.9	t
4	449	Сет «Филадельфия Макси»	Суши-сеты	Филадельфия Фреш маки, Красный дракон маки, Филадельфия классик маки, Фирменный ролл Маццу маки, 2 х Соус соевый, 2 х Имбирь, 2 х Васаби	1200 г	\N	43.9	t
4	450	Суши-сет «Якудза»	Суши-сеты	Рис, креветка, сыр, тунец, лосось, ананас, кунжут, стружка миндаля, стружка кокоса, икра тобико, чукка-салат, перец, соус «Спайси», соус соевый, васаби, имбирь	850 г	\N	29.9	t
4	451	Суши-сет «Экзотик»	Суши-сеты	Ролл «Амай», ролл «Эквадор», ролл «Мурамасса», соус соевый, имбирь, васаби	800 г	\N	29.9	t
4	452	Суши-сет «Корпоративный»	Суши-сеты	Ролл «Филадельфия классик», ролл «Чёрный дракон», ролл «Тан-юн», ролл «Тайфун», ролл «Бонито магуро», ролл «Хияши», ролл «Осака», запечённый ролл «Дракон», ролл «Каиша», нигири «Эби» 2 шт., нигири «Магуро» 2 шт., нигири «Унаги» 2 шт., соус соевый, имбирь, васаби	2990 г	\N	99.9	t
4	453	Сет Веган 'Ясай'	Суши-сеты	Авокадо, Имбирь, Перец болгарский, Ростки бамбука, Помидоры, Соус соевый, Васаби, Тофу	750 г	\N	18.2	t
4	454	Сет Black	Суши-сеты	Маланга маки, Киноко маки, Фудзин маки, Бонито Терияки маки, Чёрный дракон маки, Соус соевый, Имбирь, Васаби	1200 г	\N	49.9	t
4	455	Сет Маки	Суши-сеты	Унаги маки, Фурутсу маки, Планета маки, Кудамоно маки, Соус соевый, Имбирь, Васаби	680 г	\N	29.9	t
4	456	Суши-сет «Бониму»	Суши-сеты	Ролл «Эквадор маки», ролл «Бонито Терияки маки», ролл «Мурамаса маки», соус соевый, имбирь, васаби	830 г	\N	29.9	t
4	457	Суши-сет «Вегетарианский»	Суши-сеты	Рис, чукка-салат, авокадо, соус ореховый, салат, огурец, морковь, такуан, бумага рисовая, нори, соус «Сэнсэй», соус соевый	545 г	\N	16.5	t
4	458	Суши-сет «Дракон»	Суши-сеты	Зелёный Дракон маки, Чёрный дракон маки, Каиша маки, Киото маки, Соус соевый, Имбирь, Васаби	985 г	\N	39.9	t
4	459	Суши-сет «Хот‑хот»	Суши-сеты	Хот ролл лосось и манго, Хот ролл креветка и угорь, Хот ролл с лососем, Соус соевый, Имбирь, Васаби	930 г	\N	29.9	t
4	460	Васаби 	Японский гарнир		10 г	\N	0.6	t
4	461	Имбирь	Японский гарнир		30 г	\N	0.7	t
4	462	Соус соевый	Японский гарнир		50 г	\N	0.9	t
4	463	Соус ореховый	Японский гарнир		50 г	\N	1.7	t
4	464	Соус «Чили» сладкий	Японский гарнир		50 г	\N	1.5	t
4	465	Соус «Терияки» 	Японский гарнир		50 г	\N	1.7	t
4	466	Соус «Шрирача»	Японский гарнир		20 г	\N	1.1	t
4	467	Соус «Спайси» 	Японский гарнир		30 г	\N	1.2	t
4	468	Суп «Том‑ям» 	Супы	Кальмар, креветка, мидии, шампиньоны, лук, перец халапеньо, молоко кокосовое, паста фирменная «Том‑ям», лайм	400 г	\N	10.2	t
4	469	Суп «Суимоно»	Супы	Яичная лапша, лосось, вакаме, лук зелёный, хандаши, кунжут	400 г	\N	7.2	t
4	470	Лапша гречневая WOK «Морской коктейль»	WOK	Лапша гречневая, перец, цукини, сельдерей, горошек, соус устричный, соус соевый, кунжут, морковь	500 г	\N	13.9	t
4	471	Лапша пшеничная WOK «Морской коктейль»	WOK	Лапша пшеничная, перец, цукини, сельдерей, горошек, соус устричный, соус соевый, кунжут, морковь	500 г	\N	13.9	t
4	472	Рис белый WOK «Морской коктейль»	WOK	Перец, цукини, сельдерей, горошек, соус устричный, соус соевый, кунжут, морковь	500 г	\N	13.9	t
4	473	Рис с чернилами WOK «Морской коктейль»	WOK	Перец, цукини, сельдерей, горошек, соус устричный, соус соевый, кунжут, морковь	500 г	\N	13.9	t
4	474	Лапша гречневая WOK со свининой	WOK	Лапша гречневая, свинина, перец, морковь, сельдерей, цукини, фасоль стручковая, соус соевый, кунжут, соус сладкий «Чили», соус устричный	500 г	\N	9.9	t
4	475	Лапша пшеничная WOK со свининой	WOK	Лапша пшеничная, свинина, перец, морковь, сельдерей, цукини, фасоль стручковая, соус соевый, кунжут, соус сладкий «Чили», соус устричный	500 г	\N	9.9	t
4	476	Рис белый WOK со свининой	WOK	Свинина, перец, морковь, сельдерей, цукини, фасоль стручковая, соус соевый, кунжут, соус сладкий «Чили», соус устричный	500 г	\N	9.9	t
4	477	Рис с чернилами WOK со свининой	WOK	Свинина, перец, морковь, сельдерей, цукини, фасоль стручковая, соус соевый, кунжут, соус сладкий «Чили», соус устричный	500 г	\N	9.9	t
4	478	Лапша гречневая WOK овощная	WOK	Лашпа гречневая, перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь	500 г	\N	7.9	t
4	479	Лапша пшеничная WOK овощная	WOK	Лашпа пшеничная, перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь	500 г	\N	7.9	t
4	480	Рис белый WOK овощная	WOK	Перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь	500 г	\N	7.9	t
4	481	Рис с чернилами WOK овощная	WOK	Перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь	500 г	\N	7.9	t
4	482	Лапша гречневая WOK с курицей	WOK	Лапша гречневая, курица, перец, морковь, сельдерей, цукини, горошек, соус соевый, кунжут, соус «Чили» сладкий, соус устричный	500 г	\N	9.5	t
4	483	Лапша пшеничная WOK с курицей	WOK	Лапша пшеничная, курица, перец, морковь, сельдерей, цукини, горошек, соус соевый, кунжут, соус «Чили» сладкий, соус устричный	500 г	\N	9.5	t
4	484	Рис белый с курицей	WOK	Рис белый, курица, перец, морковь, сельдерей, цукини, горошек, соус соевый, кунжут, соус «Чили» сладкий, соус устричный	500 г	\N	9.5	t
4	485	Рис с чернилами и курицей	WOK	Рис с чернилами, курица, перец, морковь, сельдерей, цукини, горошек, соус соевый, кунжут, соус «Чили» сладкий, соус устричный	500 г	\N	9.5	t
4	486	Лапша гречневая WOK с лососем	WOK	Лапша гречневая, лосось, морковь, перец болгарский, сельдерей, фасоль стручковая, цукини, фирменный соус, кунжут	500 г	\N	12.9	t
4	487	Лапша пшеничная WOK с лососем	WOK	Лапша пшеничная, лосось, морковь, перец болгарский, сельдерей, фасоль стручковая, цукини, фирменный соус, кунжут	500 г	\N	12.9	t
4	488	Рис белый WOK с лососем	WOK	Лосось, морковь, перец болгарский, сельдерей, фасоль стручковая, цукини, фирменный соус, кунжут	500 г	\N	12.9	t
4	489	Рис с чернилами WOK с лососем	WOK	Лосось, морковь, перец болгарский, сельдерей, фасоль стручковая, цукини, фирменный соус, кунжут	500 г	\N	12.9	t
4	490	Лапша гречневая WOK с креветкой	WOK	Лапша гречневая, перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь, креветка коктейльная	500 г	\N	12.9	t
4	491	Лапша пшеничная WOK с креветкой	WOK	Лапша пшеничная, перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь, креветка коктейльная	500 г	\N	12.9	t
4	492	Рис белый WOK с креветкой	WOK	Перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь, креветка коктейльная	500 г	\N	12.9	t
4	493	Рис с чернилами WOK с креветкой	WOK	Перец, цукини, сельдерей, фасоль стручковая, соус устричный, соус соевый, кунжут, морковь, креветка коктейльная	500 г	\N	12.9	t
4	494	Салат «Сакана Ясай»	Салаты	Лосось, морковь, перец болгарский, салат, такуан, кунжут, лимон	160 г	\N	6.9	t
4	495	Салат «Чукка» с креветками 	Салаты	Креветка, чукка-салат, ореховый соус, кунжут, лимон	165 г	\N	7.2	t
4	496	Тори Кацу Фрай	Горячие блюда	Курица, сухари «Панко»	280 г	\N	8.9	t
4	497	Ика Рингу Фрай	Горячие блюда	Кальмар, сухари «Панко»	230 г	\N	10.9	t
4	498	Тай Кацу Фрай	Горячие блюда	Морской окунь, Сухари панко, Сладкий чили соус, Лимон	200 г	\N	8.9	t
4	499	Эбби Темпура	Горячие блюда	Креветка, Сухари панко, Лимон	100 г	\N	9.9	t
4	500	Поке с курицей 	Поке	Рис, чернила каракатицы, курица, бобы консервированные, кинза, лук, лук зелёный, мята, огурец, такуан, соус устричный, фирменный соус, кунжут	350 г	\N	9.9	t
4	501	Поке с лососем 	Поке	Рис, икра тобико, лосось, чернила каракатицы, авокадо, кинза, оурец, чукка-салат, фирменный соус, кунжут	350 г	\N	11.9	t
4	502	Поке с тунцом 	Поке	Рис, икра тобико, тунец, чернила каракатицы, авокадо, лук зелёный, огурец, такуан, соус «Кимчи», соус «Шрирача», кунжут	350 г	\N	11.9	t
4	503	Поке с креветкой 	Поке	Рис, икра тобико, креветка, чернила каракатицы, кинза, кукуруза консервированная, лук зелёный, морковь, соус «Чили» сладкий, соус соевый, кунжут, ананас консервированный	350 г	\N	11.9	t
4	504	Напиток газированные Coca‑Cola	Напитки		500 мл	\N	2	t
4	505	Напиток газированный Fanta	Напитки		500 мл	\N	2	t
4	506	Напиток газированынй Sprite	Напитки		500 мл	\N	2	t
4	507	Вода BonAqua негазированная	Напитки		500 мл	\N	1.5	t
4	508	Вода BonAqua среднегазированная	Напитки		500 мл	\N	1.5	t
4	509	Сок Rich мультифрукт	Напитки		1000 мл	\N	4.5	t
4	510	Сок Rich яблочный	Напитки		1000 мл	\N	4.5	t
4	511	Сок Rich апельсиновый	Напитки		1000 мл	\N	4.5	t
4	512	Комбо-Фреш	Комбо	Суп Том-Ям 350гр, Филадельфия Фреш маки 220гр, Кола 0, 5л, Чизкейк Нью-Йорк 100гр или шоколадный на выбор	670 г	\N	19.9	t
4	513	Комбо-Чикен	Комбо	Чикен вайт маки 220гр, ВОК лапша пшеничная + курица 320гр, Кола 0, 5л, Чизкейк Нью-Йорк 100гр или шоколадный на выбор.	640 гр	\N	13.9	t
5	514	Салат с печёной тыквой и сыром «Рикотта»	Салаты	Тыква, листья салата, рукола, сыр «Рикотта», соус из чёрной смородины, заправка оливково‑медовая	190 г	\N	8	t
5	515	Салат с хамоном и грушей	Салаты	Окорок свиной, груша, листья салата, руккола, томатны, сыр твёрдый, заправка на основе оливкового масла	190 г	\N	8	t
5	516	Салат «Цезарь» с куриной грудкой	Салаты	Филе птицы, помидоры, салат листовой, гренки, сыр твёрдый, соус на основе майонеза, каперсов и горчицы	210 г	\N	8	t
5	517	Салат «Греческий»	Салаты	Помидоры, огурцы, перец, маслины, лук красный, сыр «Фета», заправка на основе масла оливкового	245 г	\N	7	t
5	518	Бургер с курицей и картофелем фри	Закуски и бургеры	Булочка с кунжутом, филе куриное в панировке, помидоры, огурцы, листья салата, лук жареный в панировке, соус «Барбекю», соус сырный	368 г	\N	10	t
5	519	Врап с беконом и омлетом	Закуски и бургеры	Лаваш, бекон, омлет, листья салата, сыр «Чеддер», соус сливочно‑чесночный	205 г	\N	6.5	t
5	520	Врап «Цезарь»	Закуски и бургеры	Лаваш, филе куриное, соус сливочно-чесночный, салат, помидоры, гренки, сыр твёрдый	188 г	\N	6.5	t
5	521	Пицца «Крема ди зукка» с кальмаром	Неополитанская пицца	Соус тыквенный, сыр «Моцарелла», кальмар, рукола, помидоры, масло чесночное	470 г	\N	10	t
5	522	Пицца «Крема ди зукка» с салями	Неополитанская пицца	Соус тыквенный, сыр «Моцарелла», салями, шампиньоны	400 г	\N	10	t
5	523	Пицца «Маргарита»	Неополитанская пицца	Соус томатный, сыр «Моцарелла», сыр твёрдый, масло оливковое, перец чёрный молотый, базилик	380 г	\N	7	t
5	524	Пицца с салями	Неополитанская пицца	Соус томатный, сыр «Моцарелла», салями, ветчина, маслины, орегано	415 г	\N	10	t
5	525	Пицца «Карбонара»	Неополитанская пицца	Сыр «Моцарелла», масло оливковое, ветчина, соус сливочный, лук маринованный, сыр твёрдый, орегано, соль	440 г	\N	10	t
8	765	Соус «Терияки» 	Японский гарнир		40 г	\N	1.5	t
8	766	Имбирь	Японский гарнир			\N	0.5	t
5	526	Пицца «Цезарь»	Неополитанская пицца	Соус сливочно-чесночный, курица-гриль, салат-микс, помидоры, соус «Цезарь, сыр твёрдый	470 г	\N	10	t
5	527	Пицца «Прошутто»	Неополитанская пицца	Соус томатный, сыр «Маскарпоне», руккола, помидоры, окорок сыровяленый, масло оливковое, перец чёрный молотый	465 г	\N	13	t
5	528	Пицца «Контандина»	Неополитанская пицца	Соус томатный, сыр «Моцарелла», ветчина, шампиньоны, лук маринованный, орегано	440 г	\N	10	t
5	529	Пицца с беконом и сыром «Дорблю»	Неополитанская пицца	Соус сливочно-чесночный, бекон, голубой сыр с благородной плесенью, груша, орегано	400 г	\N	12	t
5	530	Пицца «Болоньезе»	Неополитанская пицца	Соус томатный, соус «Барбекю», сыр «Моцарелла», рагу «Болоньезе», лук маринованный, орегано	440 г	\N	10	t
5	531	Пицца «Четыре сыра»	Неополитанская пицца	Соус томатный, сыр «Чеддер», сыр «Моцарелла», сыр «Маскарпоне», сыр с голубой плесенью, масло оливковое, перец чёрный молотый, орегано	450 г	\N	14	t
5	532	Капуста цветная кляр	Гарниры		195 г	\N	3	t
5	533	Картофельные дольки	Гарниры		130 г	\N	3	t
5	534	Картофель фри	Гарниры		125 г	\N	3	t
5	535	Соус сырный	Соусы		30 г	\N	0.8	t
5	536	Соус «Барбекю»	Соусы		30 г	\N	0.8	t
5	537	Кетчуп	Соусы		30 г	\N	0.5	t
5	538	Соус «Цезарь»	Соусы		30 г	\N	0.5	t
5	539	Соус сливочно-чесночный	Соусы		30 г	\N	0.7	t
5	540	Соус «Шрирача» острый	Соусы		30 г	\N	1.5	t
5	541	Чиабатта тёмная/светлая 	Хлеб		50 г	\N	1	t
5	542	Фокачча с маринованным луком 	Хлеб	Тесто, лук маринованный, соль, масло оливковое	230 г	\N	2.5	t
5	543	Фокачча с помидорами 	Хлеб	Тесто, помидоры, соль, масло чесночное, перец чёрный	260 г	\N	2.5	t
5	544	Фокачча с чесноком 	Хлеб	Тесто, масло чесночное, соль	215 г	\N	2.5	t
5	545	Фокачча с сыром «Моцарелла» 	Хлеб	Тесто, сыр «Моцарелла», соль, масло оливковое	260 г	\N	4	t
5	546	Десерт «Тирамису» с клубникой 	Десерты	Печенье «Савоярди», крем на основе сливок и сыра «Маскарпоне», клубника	180 г	\N	5	t
5	547	Десерт «PaPi»	Десерты	Фрукты, безе, крем из сыра и сливок	121 г	\N	3	t
5	548	Эклер со сливочным кремом	Десерты	Пирожные со сливочно-масляным кремом и шоколадом	129 г	\N	4	t
5	549	Сливочный пирог	Десерты		168 г	\N	4.5	t
5	550	Пицца «Салями»	Наборы для приготовления неаполитанской пиццы	Тесто, соус томатный, салями, ветчина, маслины, сыр «Моцарелла»	470 г	\N	8	f
5	551	Пицца «Бекон Дорблю»	Наборы для приготовления неаполитанской пиццы	Тесто, соус сливочно-чесночный, бекон, сыр «Дорблю», груша	480 г	\N	8	f
5	552	Пицца «Болоньезе»	Наборы для приготовления неаполитанской пиццы	Тесто, соус томатный, соус «Барбекю», рагу «Болоньезе», лук маринованный, маслины, сыр «Моцарелла»	505 г	\N	8	f
5	553	Пицца «Прошутто»	Наборы для приготовления неаполитанской пиццы	Тесто, соус томатный, сыровяленый окорок, сыр «Маскарпоне», масло оливковое	485 г	\N	10	f
5	554	Напиток газированный Coca‑Cola	Холодные напитки		500 мл	\N	2.3	t
5	555	Напиток газированный Fanta	Холодные напитки		500 мл	\N	2.3	t
5	556	Напиток газированный Sprite	Холодные напитки		500 мл	\N	2.3	t
5	557	Сок «Настоящий» яблочный	Холодные напитки		1000 мл	\N	5.4	t
5	558	Сок Rich	Холодные напитки		1000 мл	\N	5.4	t
5	559	Морс клюквенный «Настоящий»	Холодные напитки		1000 мл	\N	5.4	t
5	560	Вода BonAqua среднегазированная	Холодные напитки		500 мл	\N	1.6	t
5	561	Минеральная вода «Боржоми»	Холодные напитки		500 мл	\N	4	t
6	562	Бульон из курицы	Комплексные обеды	Куриный бульон, курица, яйцо, зелень	300 г	\N	3	t
6	563	Солянка из курицы	Комплексные обеды	Куриный бульон, курица, лук, огурцы маринованные, маслины, лимон, сметана	300 г	\N	4.5	t
6	564	Борщ красный со свёклой	Комплексные обеды	Куриный бульон, курица, картофель, сметана, лук, морковь, специи, сметана	300 г	\N	4.5	t
6	565	Крем-суп из шампиньонов	Комплексные обеды	Шампиньоны, картофель, лук, сливки, куриный бульон, масло сливочное	300 г	\N	6.5	t
6	566	Паста «Карбонара»	Комплексные обеды	Макароны, грудинка свиная, сливки, желток, сыр твёрдый Gran Moravia, зелень	300 г	\N	8.5	t
6	567	Паста «По‑римски»	Комплексные обеды	Макароны, курица, помидоры, шампиньоны, сливки, сыр «Данишь блю», сыр твёрдый Gran Moravia, зелень	370 г	\N	10	t
6	568	Паста с белыми грибами в сливочном соусе	Комплексные обеды	Макароны, шампиньонов, лук, сливки, сыр твёрдый Gran Moravia	300 г	\N	8.5	t
6	569	Паста «Хабанеро» острая	Комплексные обеды	Макароны, грудинка свиная, перец сладкий, острый перец, помидоры черри	320 г	\N	8.5	t
6	570	Паста с морепродуктами	Комплексные обеды	Макароны, кальмары, креветки, мидии, шпинат, лимон, лук со сливками, сыр твёрдый Gran Moravia	330 г	\N	12.5	t
6	571	Пицца «Маргарита»	Пицца	Тесто, соус, сыр «Моцарелла», сыр «Джюгас», помидоры, орегано	440 г	\N	8.5	t
6	572	Пицца с грибами	Пицца	Тесто, сыр «Моцарелла», шампиньоны, соус, масло оливковое, орегано	400 г	\N	9	t
6	573	Пицца «Контандина» с луком и помидорами	Пицца	Тесто, соус, сыр «Моцарелла», лук маринованный, помидоры, маслины, орегано, масло оливковое	500 г	\N	9.5	t
6	574	Пицца с салями	Пицца	Тесто, соус, сыр «Моцарелла», салями, масло оливковое, орегано	380 г	\N	10	t
6	575	Пицца «Прошутто»	Пицца	Тесто, соус, сыр «Моцарелла», ветчина, масло оливковое, орегано	380 г	\N	10	t
6	576	Пицца «Тропиканка»	Пицца	Тесто, сыр «Моцарелла», ветчина, ананасы консервированные, соус, масло оливковое, орегано	450 г	\N	11	t
6	577	Пицца «Авай»	Пицца	Тесто, сыр «Моцарелла», ветчина, маслины, ананас консервированный, соус, масло оливковое, орегано	460 г	\N	11	t
6	578	Пицца  «Бонгуста»	Пицца	Тесто, сыр «Моцарелла», ветчина, соус сметанный с чесноком, маринованный огурец, пицца‑соус, орегано	450 г	\N	11.5	t
6	579	Пицца с тунцом и луком	Пицца	Тесто, соус, сыр «Моцарелла», тунец консервированный, лук маринованный, орегано, масло оливковое	460 г	\N	12	t
6	580	Пицца «Капри»	Пицца	Тесто, сыр «Моцарелла», соус, грудинка копчёно-вареная, кукуруза консервированная, шампиньоны, перец сладкий, орегано	460 г	\N	12.5	t
6	581	Пицца «Классическая»	Пицца	Тесто, сыр «Моцарелла», ветчина, шампиньоны, помидоры, соус, орегано	460 г	\N	12.5	t
6	582	Пицца «Карбонара»	Пицца	Тесто, сыр «Моцарелла», ветчина, маслины, каперы, помидоры, брокколи, соус, масло оливковое, яйцо, орегано	460 г	\N	12.5	t
6	583	Пицца «Капричиоза»	Пицца	Тесто, сыр «Моцарелла», ветчина, шампиньоны, маслины, соус, масло оливковое, орегано	460 г	\N	12.5	t
6	584	Пицца «Кальцоне» закрытая	Пицца	Тесто, сыр «Моцарелла», сыр «Джюгас», шампиньоны, соус, масло оливковое, орегано	460 г	\N	12.5	t
6	585	Пицца «Микс»	Пицца	Тесто, соус, сыр «Моцарелла», салями, ветчина, помидоры, масло оливковое, орегано	460 г	\N	12.5	t
6	586	Пицца «Миланио»	Пицца	Тесто, соус, сыр «Моцарелла», ветчина, шампиньоны, кукуруза консервированная, помидоры﻿﻿﻿, орегано, масло оливковое	460 г	\N	12.5	t
6	587	Пицца «Пикантная»	Пицца	Сыр «Моцарелла», ветчина, лук маринованный, перец сладкий, соус, орегано, масло оливковое	530 г	\N	12.5	t
6	588	Пицца «Тоскана» с курицей	Пицца	Тесто, соус, сыр «Моцарелла», яйцо, филе куриное, помидоры, майонез, орегано, масло чесночное, маслины	520 г	\N	12.5	t
6	589	Пицца «Греческая»	Пицца	Тесто, сыр «Моцарелла», ветчина, сыр «Фета», маслины, лук-порей, соус-пицца, масло оливковое, орегано	460 г	\N	12.5	t
6	590	Пицца «Пеперони» острая	Пицца	Тесто, соус, сыр «Моцарелла», салями, перец острый, орегано, брокколи	450 г	\N	12.5	t
6	591	Пицца «Четыре сыра»	Пицца	Тесто, сыр «Моцарелла», сыр «Джюгас», сыр Danish Blue с плесенью, сыр твёрдый, пицца‑соус, орегано	380 г	\N	13	t
6	592	Пицца «Ралли»	Пицца	Тесто, сыр «Моцарелла», сыр «Джюгас», салями, ветчина, помидоры, шампиньоны, маслины, соус, масло оливковое, орегано	600 г	\N	14	t
6	593	Пицца «Неаполитана»	Пицца	Тесто, сыр «Моцарелла», сыр «Джюгас», ветчина, грудинка свиная копчёно-варёная, маслины, шампиньоны, перец сладкий, пицца-соус, масло оливковое, орегано	550 г	\N	14	t
8	767	Соус соевый	Японский гарнир		40 г	\N	0.7	t
6	594	Пицца «Джорджия» с курицей и ветчиной	Пицца	Тесто, соус, сыр «Моцарелла», ветчина, филе куриное, кукуруза, перец сладкий, шампиньоны, сыр «Джюгас», масло оливковое, орегано, маслины	550 г	\N	14	t
6	595	Пицца «Сицилийская» острая	Пицца	Тесто, соус, сыр «Моцарелла», свинина грудинка, салями, помидоры, перец острый, огурцы маринованные, масло оливковое, орегано	550 г	\N	14	t
6	596	Пицца «Портабелла» с курицей	Пицца	Тесто, соус, сыр «Моцарелла», филе куриное, копчёности, помидоры, майонез, каперсы, орегано, масло чесночное	600 г	\N	14	t
6	597	Пицца «Парма»	Пицца	Тесто, соус, сыр «Моцарелла», грудинка, ветчина, помидоры, каперсы, соус сметанный с чесноком, орегано, масло оливковое	550 г	\N	14	t
6	598	Пицца «Моритини» с морепродуктами	Пицца	Тесто, пицца соус, сыр «Моцарелла» креветки, кальмары, мидии, лимон, масло оливковое, орегано	430 г	\N	15	t
6	599	Сыр «Моцарелла»	Добавки к пицце		50 г	\N	1.7	f
6	600	Ветчина	Добавки к пицце		50 г	\N	1.8	f
6	601	Грудинка	Добавки к пицце		50 г	\N	1.7	f
6	602	Курица	Добавки к пицце		50 г	\N	1.7	f
6	603	Каперсы консервированные	Добавки к пицце		15 г	\N	1.5	f
6	604	Ананас консервированный	Добавки к пицце		50 г	\N	1.5	f
6	605	Огурец консервированный	Добавки к пицце		50 г	\N	1.5	f
6	606	Помидор	Добавки к пицце		50 г	\N	1	f
6	607	Шампиньоны	Добавки к пицце		50 г	\N	1	f
6	608	Маслины	Добавки к пицце		30 г	\N	1.8	f
6	609	Перец	Добавки к пицце		30 г	\N	1.5	f
6	610	Перец острый	Добавки к пицце		10 г	\N	1.5	f
6	611	Кукуруза консервированная	Добавки к пицце		20 г	\N	1	f
6	612	Брокколи	Добавки к пицце		50 г	\N	1	f
6	613	Майонез	Добавки к пицце		50 г	\N	1	f
6	614	Кетчуп	Добавки к пицце		50 г	\N	1	f
6	615	Кетчуп	Соусы		50 г	\N	1	t
6	616	Соус «Сметанный» с чесноком и базиликом	Соусы		50 г	\N	1.8	t
6	617	Соус «Пикантный» с чесноком	Соусы		50 г	\N	1.8	t
6	618	Сметана	Соусы		50 г	\N	0.7	t
6	619	Лепёшка «Горячий песок» с чесноком	Хлебобулочные изделия		150 г	\N	2	t
6	620	Фокачча 	Хлебобулочные изделия		150 г	\N	2	t
6	621	Лепёшка с сыром «Моцарелла»	Хлебобулочные изделия		200 г	\N	3.3	t
6	622	Хлеб	Хлебобулочные изделия		40 г	\N	0.2	t
6	623	Салат «Овощной с лососем»	Салаты	Лосось слабосолёный, салат «Айсберг», огурец, перец сладкий, помидор, сыр твёрдый Gran Moravia, сыр «Фета», лук, масло, соус соевый	200 г	\N	9.5	t
6	624	Салат «Цезарь» классический	Салаты	Филе птицы, салат «Айсберг», помидоры, чеснок, сухарики, соус «Цезарь», сыр твёрдый Gran Moravia, зелень	210 г	\N	8.5	t
6	625	Салат «Хуторок»	Салаты	Курица, салат, огурец, помидор, перец сладкий, маслины, сыр, чеснок, хлебцы, майонез, зелень	200 г	\N	7.5	t
6	626	Салат из овощей с ветчиной	Салаты	Помидор, перец сладкий, горошек консервированный, ветчина, яйцо, сыр, майонез, зелень	200 г	\N	7.5	t
6	627	Салат «Итальянский»	Салаты	Ветчина, салат, помидор, свежий перец, сыр, ананас консервированный, соус сырный с укропом, зелень	200 г	\N	8.5	t
6	628	Салат «Греческий»	Салаты	Помидоры, огурцы, перец, лук, сыр «Фета», маслины, орехи, заправка, зелень	200 г	\N	8	t
6	629	Салат «Рандеву»	Салаты	Язык, курица, грибы, лук, огурцы маринованные, кукуруза, майонез, зелень	200 г	\N	8.5	t
6	630	Салат «Каталонский» тёплый	Салаты	Салат «Айсберг», курица, ветчина, спаржевая фаслоль, перец сладкий, лук-порей, помидоры черри, соус соевый, соус из кетчупа и сметаны, зелень	200 г	\N	9.4	t
6	631	Салат «Фелиция»	Салаты	Салат «Айсберг», помидоры, лосось слабосолёный, сыр «Рикотта», заправка	220 г	\N	8.5	t
6	632	Салат «Боваджо»	Салаты	Говядина, руккола, помидоры черри, сыр «Моцарелла», соус «Брусничный», соус «Сладкий-чили», орехи кедровые	220 г	\N	9	t
6	633	Блинчик (основа)	Блинчики		130 г	\N	2.3	t
6	634	Блинчик с сыром	Блинчики	Блинчик, сыр, майонез	180 г	\N	3	t
6	635	Блинчик с сыром и ветчиной	Блинчики	Блинчик, сыр, ветчина, кетчуп, майонез	200 г	\N	4.5	t
6	636	Блинчик с сыром и ветчиной острый	Блинчики	Блинчик, сыр, ветчина, кетчуп, майонез, перце халапеньо, перец сладкий	250 г	\N	5	t
6	637	Блинчик с джемом	Блинчики		180 г	\N	3.5	t
6	638	Блинчик с варёной сгущёнкой	Блинчики		180 г	\N	3.5	t
6	639	Блинчик с курицей	Блинчики	Блинчик, , курица, сыр, кетчуп, майонез	200 г	\N	4.5	t
6	640	Напиток газированный Mirinda	Напитки		500 мл	\N	1.5	t
6	641	Напиток газированный 7 Up	Напитки		500 мл	\N	1.5	t
6	642	Сок «Я» мультифруктовый и яблочный	Напитки	В ассортименте	1000 мл	\N	4	t
7	643	Ролл «Хитоми»	Новинки	Сёмга, сыр сливочный, дайкон	190 г 8 шт	\N	5.99	t
7	644	Ролл «Яттай»	Новинки	Угорь Clarias, сливочный сыр, дайкон	190 г 8 шт	\N	5.99	t
7	645	Ролл «Шкура дракона»	Новинки	Фри pelt: обжаренная шкурка лосося; имбирь, сливочный сыр	200 г 8 шт	\N	5.99	t
7	646	Ролл «Киото»	Новинки	Фри pelt: обжаренная шкурка лосося; дайкон, сливочный сыр, стружка тунца	205 г 8 шт	\N	5.99	t
7	647	Ролл «Киото‑гриль»	Новинки	Фри pelt: обжаренная шкурка лосося; дайкон, сливочный сыр, икра тобико, сырная шапочка	225 г 8 шт	\N	5.99	t
7	648	Ролл «Киото‑краб»	Новинки	Фри pelt: обжаренная шкурка лосося; снежный краб, сливочный сыр, икра тобико	205 г 8 шт	\N	5.99	t
7	649	Ролл «Татаки» 	Новинки	Фри pelt: обжаренная шкурка лосося; сливочный сыр, огурец, кунжут	205 г 8 шт	\N	5.99	t
7	650	Ролл «Асаха»	Классические роллы	Снежный краб, сыр сливочный, огурец, кунжут белый	200 г 8 шт	\N	5.99	t
7	651	Ролл «Асуролл»	Классические роллы	Тунец копчёный, сыр сливочный, огурец, икра масаго чёрная	200 г 8 шт	\N	5.99	t
7	652	Ролл «Бонито»	Классические роллы	Снежный краб, сыр сливочный, икра масаго красная, стружка тунца	210 г 8 шт	\N	5.99	t
7	653	Ролл «Бостон»	Классические роллы	Лосось, сыр сливочный, огурец, кунжут белый	200 г 8 шт	\N	5.99	t
7	654	Ролл «Гейша»	Классические роллы	Лосось, сыр сливочный	180 г 8 шт	\N	5.99	t
7	655	Ролл «Калифорния»	Классические роллы	Снежный краб, сыр сливочный, огурец, икра масаго красная	220 г 8 шт	\N	5.99	t
7	656	Ролл «Канада‑гриль»	Классические роллы	Грибы шиитаке, курица копчёная, сыр сливочный, фирменная сырная шапка	230 г 8 шт	\N	5.99	t
7	657	Ролл «Кани»	Классические роллы	Бекон, помидор, сыр сливочный	225 г 8 шт	\N	5.99	t
7	658	Ролл «Крабофила»	Классические роллы	Сёмга, сыр сливочный, снежный краб	210 г 8 шт	\N	5.99	t
7	659	Роллы «Кунсей»	Классические роллы	Мидии, сыр сливочный, грибы шиитаке, икра масаго красная	210 г 8 шт	\N	5.99	t
7	660	Ролл «Ламбада»	Классические роллы	Помидор, сыр сливочный, огурец, салат, кунжут белый и чёрный	200 г 8 шт	\N	5.99	t
7	661	Мидия криль ролл	Классические роллы	Мидия, сливочный сыр, криль с чесноком, огурец, икра масаго черная	210 г 8 шт	\N	5.99	t
7	662	Ролл «Мурукай»	Классические роллы	Мидии, сыр сливочный, огурец, стружка тунца	195 г 8 шт	\N	5.99	t
7	663	Ролл «Патайя»	Классические роллы	Омлет японский, сыр сливочный, огурец, икра масаго чёрная	240 г 8 шт	\N	5.99	t
7	664	Томаго криль ролл	Классические роллы	Омлет японский, сливочный сыр, криль с чесноком	210 г 8 шт	\N	5.99	t
7	665	Ролл «Томаго»	Классические роллы	Омлет японский, сыр сливочный, стружка тунца	200 г 8 шт	\N	5.99	t
7	666	Ролл «Унаги каппа» 	Классические роллы	Угорь Clarias, сыр сливочный, огурец, кунжут	225 г 8 шт	\N	5.99	t
7	667	Ролл «Унаги терияки» 	Классические роллы	Угорь Clarias, сыр сливочный, соус «Терияки»	200 г 8 шт	\N	5.99	t
7	668	Ролл «Унаги томаго» 	Классические роллы	Угорь Clarias, сыр сливочный, омлет японский, икра масаго	210 г 8 шт	\N	5.99	t
7	669	Ролл «Филадельфия»	Классические роллы	Сёмга, сыр сливочный, огурец	210 г 8 шт	\N	5.99	t
7	670	Ролл «Цезарь»	Классические роллы	Курица копчёная, сыр сливочный, помидор, салат, кунжут белый	230 г 8 шт	\N	5.99	t
7	671	Ролл «Шиитаке»	Классические роллы	Грибы шиитаке, сыр сливочный	180 г 8 шт	\N	5.99	t
7	672	Темпура «Мид‑ролл»	Темпура	Мидии, сыр сливочный, темпура	230 г 8 шт	\N	5.99	t
8	768	Васаби 	Японский гарнир		10 г	\N	0.7	t
7	673	Темпура «Фьюжн‑ролл»	Темпура	Курица копчёная, сыр сливочный, салат «Айсберг», темпура	230 г 8 шт	\N	5.99	t
7	674	Темпура «Шиитаке‑ролл»	Темпура	Грибы шиитаке, омлет японский, сыр сливочный, темпура	240 г 8 шт	\N	5.99	t
7	675	Запечённый ролл «Бекон‑гриль»	Запечённые роллы	Бекон, омлет японский, сыр сливочный, кунжут чёрный, фирменная сырная шапка	230 г 8 шт	\N	5.99	t
7	676	Запечённый ролл «Калифорния-гриль»	Запечённые роллы	Снежный краб, сыр сливочный, огурец, икра масаго красная, фирменная сырная шапка	240 г 8 шт	\N	5.99	t
7	677	Запечённый ролл «Мидия‑гриль»	Запечённые роллы	Мидии, сыр сливочный, салат «Айсберг», икра масаго чёрная, фирменная сырная шапка	230 г 8 шт	\N	5.99	t
7	678	Запечённый ролл «Тэка‑гриль»	Запечённые роллы	Тунец копчёный, сыр сливочный, огурец, фирменная сырная шапка	230 г 8 шт	\N	5.99	t
7	679	Острый ролл «Спайси Гейша» 	Острые роллы	Лосось, огурец, соус «Спайси»	170 г 8 шт	\N	5.99	t
7	680	Острый ролл «Спайси томато» 	Острые роллы	Помидор, сыр сливочный, соус «Спайси»	210 г 8 шт	\N	5.99	t
7	681	Острый ролл «Спайси фьюжн» 	Острые роллы	Омлет японский, сыр сливочный, курица копчёная, соус «Спайси»	210 г 8 шт	\N	5.99	t
7	682	Острый ролл «Темпура спайси краб» 	Острые роллы	Снежный краб, сыр сливочный, темпура, соус «Спайси»	240 г 8 шт	\N	5.99	t
7	683	Васаби 	Японские гарниры		30 г	\N	0.5	t
7	684	Имбирь	Японские гарниры		30 г	\N	0.5	t
7	685	Соус соевый	Японские гарниры		30 г	\N	0.5	t
7	686	Соус «Терияки» 	Японские гарниры		30 г	\N	0.5	t
7	687	Соус «Спайси» 	Японские гарниры		30 г	\N	0.5	t
8	688	Суши-сет #сидидома	Акция	Ролл с лососем терияки в стружке тунца, ролл с тунцом и сливочным сыром, ролл в пикантном сыре с лососем, горячий ролл с лососем и томаго	950 г	\N	23.3	t
8	689	Суши-сет #неболей	Акция	Горячий ролл с крабмикс, ролл с креветкой спайси, ролл в чукка-салате с лососем, «Калифорния» с лососем	900 г	\N	23.9	t
8	690	Суши-сет «Посейдон» от Carte.by	Акция	Ролл «Филадельфия», ролл «Калифорния» с креветкой, ролл в чукка-салате с лососем, ролл с тунцом и чукка‑салатом 	1005 г	\N	29.9	t
8	691	Суши-сет «Японский городовой»	Акция	Ролл в пикантном сыре с лососем, ролл с тунцом, ролл со слабосоленым лососем, ролл с лососем и авокадо 	860 г	\N	23.9	t
8	692	Пицца «Маргарита»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», помидоры	260 г	\N	6.9	t
8	693	Пицца «Четыре сыра»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», сыр «Провола», сыр с голубой плесенью, сыр «Пармезан»	245 г	\N	10.9	t
8	694	Пицца «Пеперони»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», салями, помидоры	355 г	\N	12.5	t
8	695	Пицца «Тайская»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», соус «Ким-чи», ветчина куриная, грудинка, грудка куриная копчёная, кунжут, перец халапеньо	425 г	\N	12.5	t
8	696	Пицца «Романа»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», лук репчатый красный, салями, полендвица, перец сладкий	430 г	\N	12.5	t
8	697	Пицца «Маринара»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», форель слабосоленая, креветка, кальмар, осьминог, помидоры	465 г	\N	17.5	t
8	698	Пицца «Кемпинг»	Пиццы	Соус томатный, соус «Сметанный», орегано, сыр «Моцарелла», помидоры, салями, бекон	450 г	\N	13.5	t
8	699	Пицца «Охотничья»	Пиццы	Соус томатный, соус «Барбекю», орегано, сыр «Моцарелла», бекон, колбаски «Охотничьи», огурцы маринованные, помидоры, лук репчатый, шампиньоны	510 г	\N	12.5	t
8	700	Пицца «Гавайская»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», ветчина куриная, грудка куриная копчёная, ананасы консервированные, перец халапеньо	505 г	\N	12.5	t
8	701	Пицца «Деревенская»	Пиццы	Соус томатный, соус «Кимчи», орегано, сыр «Моцарелла», полендвица, лук репчатый, шампиньоны, огурцы маринованные	485 г	\N	12.5	t
8	702	Пицца «Грибная»	Пиццы	Соус томатный, соус «Сметанный», орегано, сыр «Моцарелла», шампиньоны, лисички отварные	385 г	\N	10.5	t
8	703	Пицца «Четыре сезона»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», шампиньоны, креветка, кальмар, осьминог, салями, помидоры	435 г	\N	15.5	t
8	704	Пицца «Каприччиоза»	Пиццы	Соус томатный, орегано, сыр «Моцарелла», ветчина куриная, маслины, шампиньоны	430 г	\N	11	t
8	705	Бокс «АнтиСУШИ 1»	АнтиСУШИ БОКС	Бургер с куриным бедром, WOK с цыпленком терияки, WOK с цыпленком в кисло-сладком соусе, картошка фри	1000 г	\N	29.9	t
8	706	Бокс «АнтиСУШИ 2»	АнтиСУШИ БОКС	Бургер с говядиной, Крылья в кисло-сладком соусе, наггетсы куриные, картошка фри	850 г	\N	27.7	t
8	707	Суши-сет «Маки»	Суши-сеты	Ролл с лососем, ролл с креветкой спайси, ролл с тунцом спайси, ролл с угрём 	530 г	\N	22.5	t
8	708	Суши-сет «Филадельфия люкс»	Суши-сеты	Ролл «Филадельфия» с угрём копчёным, ролл «Филадельфия», ролл «Филадельфия» со слабосолёным лососем 	772 г	\N	36.9	t
8	709	Суши-сет «Филадельфия»	Суши-сеты	Ролл «Филадельфия» 3 порции 	750 г	\N	32.9	t
8	710	Суши-сет «Балансиага»	Суши-сеты	Ролл с лососем тартар, ролл в чукка-салате с лососем, ролл с креветкой спайси, ролл в пикантном сыре с лососем 	960 г	\N	29.9	t
8	711	Суши-сет из горячих роллов	Суши-сеты	Ролл горячий с краб-микс, ролл горячий с лососем и томаго, горячий ролл с тунцом сыром и чукка, ролл горячий с угрём, сыром сливочным и авокадо 	1005 г	\N	29.9	t
8	712	Суши-сет Carte.by 2.0	Суши-сеты	Ролл в пикантном сыре с лососем, ролл «Филадельфия» в кунжуте, ролл с тунцом и сливочным сыром, ролл «Крабмикс» 	945 г	\N	21.9	t
8	713	Суши-сет «Fastgood» #1	Суши-сеты	Сливочный ролл с крабмиксом, ролл «Филадельфия» с сыром, ролл «Филадельфия сезам», Ролл «ЛасВегас» с тунцом, ролл «Мак» с лососем 	770 г	\N	23.3	t
8	714	Суши-сет «Fastgood» #2	Суши-сеты	Ролл со слабосоленым лососем и крабмиксом, ролл «Бонито терияки», ролл в пикантном сыре с лососем 	760 г	\N	24.4	t
8	715	Суши-сет «Fastgood» #3	Суши-сеты	Запечённый ролл с лососем, ролл «Сливочный тунец», ролл «Филадельфия классическая», гункан «Чука» 	730 г	\N	24.4	t
8	716	Суши-сет «Fastgood» #4	Суши-сеты	Ролл «Эволюшн», ролл «Филадельфия татаки», , ролл «Калифорния» с крабмиксом, Ролл «Спайси кунсей» 	920 г	\N	24.9	t
8	717	Суши-сет «Fastgood» #5	Суши-сеты	Ролл «Цунами», , ролл «Бонито кунсей», ролл с креветкой и соусом «Песто» 	790 г	\N	25.5	t
8	718	Шаурма «Вегетарианская»	Шаурма	Капуста, соус чесночный, огурцы маринованные, морковь, огурцы, помидор	370 г	\N	4.2	t
8	719	Шаурма стандартная	Шаурма	Капуста, соус чесночный, огурцы маринованные, морковь, огурцы, помидор, филе куриное	370 г	\N	5.9	t
8	720	Шаурма большая	Шаурма	Капуста, соус чесночный, огурцы маринованные, морковь, огурцы, помидор, филе куриное	480 г	\N	8.5	t
8	721	Шаурма фирменная «FastGood»	Шаурма	Лаваш армянский, капуста пекинская, соус чесночный, курица, помидор, огурец свежий и маринованный	405 г	\N	6.9	t
8	722	Шаурма «Мини»	Шаурма	Капуста, соус чесночный, огурцы маринованные, морковь, огурцы, помидор, филе куриное	230 г	\N	4.2	t
8	723	Шаурма «Королевская»	Шаурма	Капуста, соус чесночный, огурцы маринованные, морковь, огурцы, помидор, филе куриное	700 г	\N	10.3	t
8	724	Шаурма острая с перцем халапеньо	Шаурма	Лаваш армянский, мякоть бедра куриного маринованная запечённая, капуста, соус чесночный, огурцы маринованные, морковь пряная, помидор, перец халапеньо, лук красный, соус «Чили» сладкий	400 г	\N	7.3	t
8	725	Лапша с говядиной в томатном чили	Лапша WOK	Лапша пшеничная, говядина, яйцо куриное, морковь, перец, цукини, лук красный, соус «Чили», масло кунжутное	310 г	\N	11.5	t
8	726	Лапша с цыплёнком в кисло-сладком соусе	Лапша WOK	Лапша пшеничная, бедро куриное, яйцо, морковь, перец, цукини, лук красный, ананас, арахис, соус «Терияки», масло кунжутное	310 г	\N	10.5	t
8	727	Лапша с цыплёнком в соусе «Терияки» 	Лапша WOK	Лапша пшеничная, бедро куриное, яйцо, морковь, перец, цукини, лук красный, арахис, соус, масло кунжутное	310 г	\N	10.5	t
8	728	Лапша с морепродуктами в устричном соусе	Лапша WOK	Лапша фунчоза, креветка, кальмар, осьминог, яйцо куриное, морковь, перец, цукини, лук, арахис, соус устричный, чеснок, масло кунжутное	310 г	\N	11.5	t
8	729	Поке с лососем 	Поке	Лосось, рис «Шинаке», огурец, авокадо, арахис, имбирь маринованный	235 г	\N	10.9	t
8	730	Поке с лососем «Терияки» 	Поке	Лосось «Терияки», рис, авокадо, огурец, арахис, имбирь маринованный	235 г	\N	10.5	t
8	731	Поке с тунцом 	Поке	Тунец, авокадо, огурец, имбирь маринованный, рис, арахис, заправка	235 г	\N	11.7	t
8	732	Поке с крабом 	Поке	Снежный краб, рис, авокадо, имбирь маринованный, кукуруза, арахис, заправка	245 г	\N	9.9	t
8	733	Ролл «Филадельфия»	Урамаки	Нори, рис, авокадо, лосось, сыр сливочный	250 г	\N	13.9	t
8	734	Ролл «Филадельфия» с копчёным угрём	Урамаки	Нори, рис, сыр сливочный, угорь копчёный, огурец	240 г	\N	15.9	t
8	735	Ролл «Филадельфия» со слабосоленым лососем	Урамаки	Нори, рис, дайкон маринованный, зелень, икра тобико, лосось слабосоленый, огурцы, сыр сливочный	280 г	\N	13.9	t
8	736	Ролл с лососем тартар 	Урамаки	Рис, нори, лосось, микс-салат, огурец, сыр сливочный, омлет томаго, икра тобико	275 г	\N	11.9	t
8	737	Ролл с лососем татаки 	Урамаки	Рис, нори, лосось, манго, авокадо, майонез японский, шпинат	310 г	\N	14.5	t
8	738	Ролл в чукка-салате с лососем	Урамаки	Рис, нори, лосось, чукка-салат, сыр сливочный, соус ореховый	270 г	\N	11.9	t
8	739	Ролл в пикантном сыре с креветкой	Урамаки	Рис, нори, креветка, микс-салат, авокадо, сыр «Чеддер», майонез японский, соус «Спайси»	255 г	\N	11.9	t
8	740	Ролл в пикантном сыре с лососем	Урамаки	Рис, нори, лосось, огурец, сыр «Чеддер», омлет томаго, сыр сливочный, помидоры вяленые	280 г	\N	10.9	t
8	741	Ролл с лососем «Терияки» в стружке тунца 	Урамаки	Рис, нори, соус «Терияки», огурец, стружка тунца	220 г	\N	9.5	t
8	742	Ролл с лососем и авокадо в стружке тунца	Урамаки	Рис, нори, лосось, сыр сливочный, авокадо, стружка тунца	220 г	\N	10.9	t
8	743	Ролл «Калифорния» с лососем	Урамаки	Рис, нори, лосось, авокадо, огурец, перец, майонез японский, икра тобико	245 г	\N	11.9	t
8	744	Ролл «Калифорния крабмикс»	Урамаки	Рис, нори, крабмикс, авокадо, огурец	220 г	\N	10.5	t
8	745	Ролл «Калифорния» с креветкой	Урамаки	Рис, нори, креветка королевская, авокадо, огурец, майонез японский, икра тобико	240 г	\N	12.5	t
8	746	Ролл «Калифорния» с тунцом «Спайси» 	Урамаки	Рис, нори, тунец, огурец, икра тобико, кунжут	225 г	\N	11.9	t
8	747	Ролл Picasso	Урамаки	Рис, нори, сыр сливочный, лосось, огурец, креветка, тунец, авокадо	295 г	\N	14.8	t
8	748	Ролл с лососем тамаго	Урамаки	Рис, нори, лосось слабосолёный, огурец, авокадо, салат-микс, омлет тамаго, кунжут	185 г	\N	8.9	t
8	749	Ролл с угрём и чукка‑салатом	Урамаки	Рис, нори, сыр сливочный, угорь, чукка‑салат, кунжут	215 г	\N	10.5	t
8	750	Ролл «Филадельфия» в кунжуте	Урамаки	Рис, нори, сыр сливочный, лосось, огурец, авокадо	230 г	\N	9.9	t
8	751	Ролл с угрём	Роллы	Рис, нори, угорь, огурец, кунжут, соус «Унаги»	130 г	\N	7.9	t
8	752	Ролл с креветкой «Спайси» 	Роллы	Рис, нори, креветка тигровая, соус «Спайси»	135 г	\N	6.9	t
8	753	Ролл с тунцом «Спайси» 	Роллы	Рис, нори, тунец, соус «Спайси»	135 г	\N	6.9	t
8	754	Ролл со слабосоленым лососем «Спайси» 	Роллы	Рис, нори, лосось слабосоленый, лук зелёный, соус «Спайси»	140 г	\N	6.4	t
8	755	Ролл с лососем и авокадо	Роллы	Рис, нори, лосось, авокадо	180 г	\N	7.9	t
8	756	Ролл с тунцом и сливочным сыром	Роллы	Рис, нори, тунец, огурец, сыр сливочный	135 г	\N	8.9	t
8	757	Ролл с лососем, сливочным сыром и авокадо	Роллы	Рис, нори, лосось, сыр сливочный, авокадо, икра тобико	205 г	\N	8.9	t
8	758	Ролл запечённый с лососем	Горячие роллы	Рис, нори, сыр сливочный, лосось, огурец, салат-микс, икра тобико	205 г	\N	7.5	t
8	759	Ролл с лососем и томаго	Горячие роллы	Рис, нори, лосось, омлет томаго, огурец, соус «Спайси», соус «Унаги»	255 г	\N	10.5	t
8	760	Ролл «Крабмикс»	Горячие роллы	Рис, нори, краб-микс, огурец, соус «Унаги»	250 г	\N	9.5	t
8	761	Ролл с угрём, сливочным сыром и авокадо	Горячие роллы	Рис, нори, угорь, сыр сливочный, авокадо, соус «Спайси», соус «Унаги»	250 г	\N	13.9	t
8	762	Ролл с тунцом и чукка‑салатом	Горячие роллы	Рис, нори, тунец, сыр сливочный, чукка-салат, пюре манго	250 г	\N	12.9	t
8	763	Чукка-салат 	Японский гарнир		50 г	\N	1.5	t
8	769	Соус «Спайси» 	Японский гарнир		40 г	\N	1.5	t
8	770	Соус ореховый	Японский гарнир		40 г	\N	3	t
8	771	Соус «Чили» сладкий	Японский гарнир		40 г	\N	1.5	t
8	772	Соус «Унаги» 	Японский гарнир			\N	1.5	t
8	773	Тайский острый	Японский гарнир		40 г	\N	1.6	t
8	774	Соус сырный	Японский гарнир			\N	1.5	t
8	775	Наггетсы из цыплёнка 	Аперитивы	Филе куриное, сухари «Панко»	130 г	\N	7.9	t
8	776	Сало домашнего посола с хреном	Аперитивы	Сало, огурцы малосольные, лук красный, соус из хрена	180 г	\N	5.9	t
8	777	Малосольные огурцы с зелёным перцем	Аперитивы	Огурец, маринад, зелень	150 г	\N	5.7	t
8	778	Карпаччо из говядины с трюфелем 	Закуски	Вырезка говяжья, сыр «Пармезан», соус трюфельный, масло оливковое, горчица «Французская»	130 г	\N	13.9	t
8	779	Норвежская сельдь с печёным картофелем	Закуски	Сельдь, картофель в мундире, лук красный, яблоко, сметана, горчица, уксус винный	230 г	\N	8.9	t
8	780	Сыр «Сулугуни» в лаваше с домашней аджикой	Закуски	Лаваш, шампиньоны, сыр «Сулугуни», соус томатный, соус «Песто»	170 г	\N	7.9	t
8	781	Тартар из говядины с трюфелем 	Закуски	Вырезка говяжья, лук красный, огурцы маринованные, сельдерей, сыр «Пармезан», шампиньоны, соус трюфельный, масло оливковое, горчица «Французская»	140 г	\N	13.5	t
8	782	Тартар из говядины классический 	Закуски	Вырезка говяжья, лук красный, огурцы маринованные, сельдерей, шампиньоны, сыр «Пармезан», стружка тунца, масло оливковое, горчица «Французская», соус «Чили», желток	160 г	\N	14.7	t
8	783	Тартар из лосося с кремом из васаби и грушей 	Закуски	Лосось, соус соевый, лук красный, лук зелёный, авокадо, соус «Спайси», икра тобико, малина, васаби	180 г	\N	15.3	t
8	784	Креветки темпура с соусом «Спайси» 	Закуски	Креветки тигровые, сухари «Панко», соус грушевый	130 г	\N	17.9	t
8	785	Салат «Греческий» с сыром «Фета»	Салаты	Огурец, редис, помидор, перец, маслины, сыр «Фета», лук красный, соус «Песто», зелень, масло оливковое	180 г	\N	9.5	t
8	786	Салат «Цезарь» с цыплёнком	Салаты	Микс-салат, помидоры, филе куриное, сыр «Пармезан», гренки, яйцо-пашот, соус «Цезарь»	280 г	\N	11.5	t
8	787	Салат «Цезарь» с креветками	Салаты	Микс-салат, помидоры, креветки королевские, сыр «Пармезан», гренки, яйцо-пашот, соус «Цезарь»	265 г	\N	16.9	t
8	788	Салат «Ш.У.Б.А» с сельдью	Салаты	Сельдь, картофель, свёкла, морковь, яйцо, икра мойвы, икра красная, майонез, васаби	260 г	\N	8.9	t
8	789	Салат «Оливье» с языком, креветками и икрой	Салаты	Бедро-гриль куриное, язык говяжий, креветки королевские, картофель, морковь, огурцы маринованные, огурец свежий, горошек зелёный, яйцо, лук зелёный, икра красная, каперсы	240 г	\N	12.7	t
8	790	Борщ с бужениной	Супы	Буженина, сметана, зелень	320 г	\N	8.9	t
8	791	Солянка рыбная	Супы	Лосось, лук, огурцы маринованные, каперсы, маслины, бульон	330 г	\N	8.9	t
8	792	Солянка на домашних копчёностях	Супы	Бедро куриное, бекон, язык говяжий, салями, балерон, зелень	380 г	\N	9.9	t
8	793	Бульон из цыплёнка с лапшой и яйцом‑пашот	Супы		310 г	\N	6.9	t
8	794	Холодник на кефире с печёным картофелем	Супы		480 г	\N	5	t
8	795	Суп грибной	Супы	Лисички, шампиньоны, крупа перловая, сметана, зелень	350 г	\N	7.9	t
8	796	Треска с картофелем и черемшой	Рыба	Филе трески, пюре картофельное, черемша, соус сливочный, чеснок, лук зелёный	270 г	\N	16.5	t
8	797	Форель со шпинатом и сыром «Пармезан»	Рыба	Филе форели, шпинат, сыр «Пармезан», соус на белом вине и сливках, самбука, рис «Басмати», яйцо‑пашот	275 г	\N	21.5	t
8	798	Котлета из щуки с овощами и картофелем	Рыба	Котлета из филе щуки в сухарях «Панко» и тыквенных семечках, пюре картофельное, соус сливочный, кукуруза, огурец, зелень	390 г	\N	13.5	t
8	799	Шницель из свинины	Птица и мясо		200 г	\N	12.9	t
8	800	Шницель из курицы	Птица и мясо		200 г	\N	11.7	t
8	801	Перлотто с бужениной и белыми грибами 	Птица и мясо	Крупа перловая, буженина, грибы белые, лук, сыр «Пармезан», сливки, масло трюфельное	300 г	\N	13.9	t
8	802	Говяжий язык с картофельным пюре и грибным соусом	Птица и мясо	Язык говяжий, пюре картофельное, соус грибной, сливки, масло зелёное	300 г	\N	19.7	t
8	803	Буженина с запечённым картофелем и грибным соусом	Птица и мясо	Буженина, картофельные дольки, соус грибной, зелень	300 г	\N	18.9	t
8	804	Бургер с говяжьей котлетой, беконом и сыром «Чеддер»	Блюда на берёзовых углях	Булочка домашняя, котлета говяжья, сыр «Чеддер», лук красный, огурцы маринованные, салат-микс, помидоры, соус медово-горчичный, масло трюфельное	380 г	\N	11.9	t
8	805	Стейк из говяжьей вырезки	Блюда на берёзовых углях	Вырезка говяжья, соус грибной, огурцы малосольные	250 г	\N	21.9	t
8	806	Крылышки в кисло-сладком соусе	Блюда на берёзовых углях	Куриные крылья, чеснок, карри, соус сладкий чили	350 г	\N	9.9	t
8	807	Бургер с куриным бедром гриль	Блюда на берёзовых углях	Бургер с куриным бедром гриль	430 г	\N	10.9	t
8	808	Драники классические со сметаной	Драники		300 г	\N	8.9	t
8	809	Драники с бужениной и вешенками	Драники	Драники картофельные, буженина, лук, соус сливочный, вешенки, сметана	380 г	\N	11.9	t
8	810	Драники с лососем и кремом из сыра и хрена	Драники	Драники картофельные, лосось слабосолёный, соус «Крем‑чиз», шпинат	265 г	\N	12.9	t
8	811	Драники с мачанкой в горшочке	Драники	Драники картофельные, буженина, бекон, колбаски домашние, лук, соус грибной, мука, сметана	330 г	\N	12.7	t
8	812	Печёный картофель	Гарниры		100 г	\N	3.5	t
8	813	Картофель фри	Гарниры		100 г	\N	3.5	t
8	814	Картофельные дольки	Гарниры		100 г	\N	3.5	t
8	815	Пюре картофельное	Гарниры		100 г	\N	3.5	t
8	816	Рис «Басмати»	Гарниры		100 г	\N	3.5	t
8	817	Соус трюфельный	Соус		40 г	\N	1.5	t
8	818	Соус грибной	Соус		40 г	\N	1.5	t
8	819	Соус «Чили сладкий»	Соус		40 г	\N	1.5	t
8	820	Соус сливочный с хреном	Соус		40 г	\N	1.5	t
8	821	Аджика домашняя	Соус		40 г	\N	1.5	t
8	822	Соус сырный к шаурме	Соус		35 г	\N	0.8	t
8	823	Соус «Чесночный» к шаурме	Соус		35 г	\N	0.7	t
8	824	Соус «Пикантный» к шаурме	Соус		35 г	\N	0.7	t
8	825	Соус «Тайский» острый к шаурме	Соус			\N	1.6	t
8	826	Хлеб бородинский по рецепту 1912 г	Хлеб		50 г	\N	1.5	t
8	827	Чиабатта домашняя 	Хлеб		50 г	\N	1.5	t
8	828	Вода питьевая «Аура» газированная	Напитки		500 мл	\N	1.4	t
8	829	Вода питьевая «Аура» негазированная	Напитки		500 мл	\N	1.4	t
9	830	Пицца «Чизбургер»	Пиццы	Тесто, сыр «Моцарелла», бекон, лук красный, помидоры, огурцы солёные, соус сырный, говядина	650 г 30 см	\N	17.5	t
9	831	Пицца «Пеперони»	Пиццы	Тесто, пеперони, сыр «Моцарелла», соус томатный	530 г 30 см	\N	15.5	t
9	832	Пицца «Плэнет»	Пиццы	Тесто, ветчина, «Салями», помидоры, перец, шампиньоны, сыр «Моцарелла», соус томатный	640 г 30см	\N	15.5	t
9	833	Пицца «Мясная»	Пиццы	Тесто, ветчина, бекон, «Салями», колбаски «Охотничьи», сыр «Моцарелла», соус томатный	590 г 30 см	\N	15.5	t
9	834	Пицца «Четыре сезона»	Пиццы	Тесто, пеперони, соус томатный, сыр «Моцарелла», орегано, ветчина, сыр «Брынза», шампиньоны	610 г 30 см	\N	17.5	t
9	835	Пицца «Маргарита»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», помидоры, орегано	585 г 30 см	\N	13.5	t
9	836	Ранч-пицца	Пиццы	Тесто, помидоры, сыр «Моцарелла», ветчина, филе куриное, соус «Ранч», чеснок	630 г 30 см	\N	17.5	t
9	837	Пицца «Мексиканская»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», перец, шампиньоны, красный лук, филе куриное, перец халапеньо	655 г 30 см	\N	17.5	t
9	838	Пицца «Дон Бекон»	Пиццы	Тесто, салями, соус томатный, сыр «Моцарелла», бекон, лук красный, филе куриное	610 г 30 см	\N	17.5	t
9	839	Пицца «Цыплёнок барбекю»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», бекон, лук красный, филе куриное, соус «Барбекю»	630 г 30 см	\N	17.5	t
9	840	Пицца «Гавайская»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», ананасы, филе куриное	640 г 30 см	\N	17.5	t
10	928	Руккола	Топинг		15 г	\N	1	t
10	929	Тунец	Топинг		30 г	\N	1.5	t
9	841	Пицца «Овощи и грибы»	Пиццы	Тесто, помидоры, соус томатный, сыр «Моцарелла», сыр «Брынза», маслины, перец, шампиньоны, лук красный, базилик	715 г 30 см	\N	21.5	t
9	842	Пицца «Сырный цыплёнок»	Пиццы	Тесто, помидоры, сыр «Моцарелла», филе куриное, соус сырный	640 г 30 см	\N	17.5	t
9	843	Пицца-пирог	Пиццы	Молоко сгущённое, смородина, ананасы	460 г 30 см	\N	13.5	t
9	844	Пицца «Мега мясная»	Пиццы	Тесто, салями, соус томатный, сыр «Моцарелла», колбаски «Охотничьи», бекон, филе цыплёнка	640 г 30 см	\N	21.5	t
9	845	Пицца «Морская»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», маслины, перец, лук красный, креветки	600 г 30 см	\N	21.5	t
9	846	Пицца «Четыре сыра»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», сыр «Пармезан», сыр «Блю Чиз», сыр «Чеддер»	555 г 30 см	\N	21.5	t
9	847	Пицца «Итальянская»	Пиццы	Тесто, пеперони, сыр «Моцарелла», орегано, маслины, шампиньоны, соус томатный	580 г 30 см	\N	17.5	t
9	848	Пицца «Пеперони двойная»	Пиццы	Тесто, пеперони, соус томатный, сыр «Моцарелла»	580 г 30 см	\N	17.5	t
9	849	Пицца «Грибы и ветчина»	Пиццы	Соус томатный, сыр «Моцарелла», ветчина, шампиньоны	640 г 30 см	\N	17.5	t
9	850	Пицца «Двойной чизбургер»	Пиццы	Тесто, сыр «Моцарелла», лук красный, филе цыплёнка, соус сырный, говядина, салат «Айсберг», кунжут	610 г 30 см	\N	21.5	t
9	851	Пицца «Сальса»	Пиццы	Пеперони, соус томатный, сыр «Моцарелла», шампиньоны, соус «Сальса»	585 г 30 см	\N	17.5	t
9	852	Пицца «Цыплёнок карри»	Пиццы	Соус томатный, сыр «Моцарелла», бекон, филе цыплёнка, соус «Карри»	625 г 30 см	\N	21.5	t
9	853	Пицца «Азиатская»	Пиццы	Соус томатный, сыр «Моцарелла», шампиньоны, креветки, соус кисло-сладкий, кунжут чёрный	645 г 30 см	\N	21.5	t
9	854	Пицца «Чикен пеперони»	Пиццы	Соус томатный, сыр «Моцарелла», филе цыплёнка, пеперони, соус кисло‑сладкий	575 г 30 см 	\N	17.5	t
9	855	Комбо 1	Комбо	Пицца «Гавайская», пицца «Цыплёнок барбекю», напиток газированный Pepsi		\N	30.15	t
9	856	Комбо 2	Комбо	Пицца «Мясная», пицца «Плэнет», пицца «Чизбургер», напиток газированный Pepsi		\N	42.75	t
9	857	Мега-комбо	Комбо	Пицца «Четыре сезона», пицца «Пеперони», пицца «Ранч», пицца «Дон бекон», пицца «Чизбургер», пицца «Гавайская», напиток газированный Pepsi		\N	90.9	t
9	858	Паста «Барбекю»	Паста	Соус томатный, сыр «Моцарелла», бекон, филе цыплёнка, соус «Барбекю»	290 г	\N	8.5	t
9	859	Паста «Цыплёнок и грибы»	Паста	Сыр «Моцарелла», шампиньоны, филе цыплёнка, соус «Ранч», орегано	270 г	\N	8.5	t
9	860	Паста «Четыре сыра»	Паста	Соус томатный, сыр «Моцарелла», сыр «Пармезан», сыр «Чеддер», сыр «Блю Чиз»	250 г	\N	9.5	t
9	861	Паста «Томатная с орегано»	Паста		310 г	\N	7.5	t
9	862	Палочки с колбасками «Охотничьими»	Закуски	Сыр «Моцарелла», колбаски «Охотничьи», соус «Барбекю»	300 г	\N	6.5	t
9	863	Острые палочки с колбасками «Пеперони»	Закуски	Колбаски «Пеперони», сыр «Моцарелла», соус «Ранч», перец халапеньо	300 г	\N	6.5	t
9	864	Палочки с говядиной	Закуски	Сыр «Моцарелла», говядина, соус «Ранч»	300 г	\N	6.5	t
9	865	Палочки с сыром	Закуски	Сыр «Моцарелла», сыр «Пармезан», соус сырный	275 г	\N	6.5	t
9	866	Рулетики с сыром	Закуски	Сыр «Моцарелла», сыр «Пармезан», соус «Сырный»	215 г	\N	5.5	t
9	867	Рулетики с пепперони	Закуски	Колбаски «Пепперони», сыр «Моцарелла», соус «Ранч», перец халапеньо	245 г	\N	6.5	t
9	868	Салат «Цезарь»	Салаты	Помидоры, базилик, филе куриное, сыр «Пармезан», соус «Цезарь», салат «Айсберг», сухарики	250 г	\N	7.5	t
9	869	Салат «Греческий»	Салаты	Помидоры, орегано, сыр «Брынза», маслины, перец, огурцы, масло оливковое, салат «Айсберг»	250 г	\N	6	t
9	870	Соус кисло‑сладкий	Топинг		25 г	\N	0.7	t
9	871	Соус «Барбекю»	Топинг		25 г	\N	0.7	t
9	872	Соус сырный	Топинг		25 г	\N	0.7	t
9	873	Соус чесночный	Топинг		0,70 г	\N	0.7	t
9	874	Чизкейк классический 	Десерты		100 г	\N	4	t
9	875	Шоколадный маффин	Десерты		85 г	\N	2.8	t
10	930	Сырный соус	Топинг		50 г	\N	1	t
10	931	Соус «Барбекю»	Топинг		50 г	\N	1	t
9	876	Сладкие рулетики с корицей и ананасом	Десерты	сладкие рулетики с пряной корицей, сахаром и кусочками ананаса, политые сгущенным молоком	220 г	\N	5	t
9	877	Напиток газированный Pepsi	Напитки		330 мл	\N	1.8	t
9	878	Напиток газированный Mirinda	Напитки		330 мл	\N	1.8	t
9	879	Напиток газированный 7Up	Напитки		330 мл	\N	1.8	t
9	880	Напиток газированный Pepsi «Манго»	Напитки		1000 мл	\N	3	t
9	881	Сок «Я» яблочный	Напитки		1000 мл	\N	4	t
9	882	Сок «Я» вишнёвый	Напитки		1000 мл	\N	4	t
9	883	Сок «Я» мультифрукт	Напитки		1000 мл	\N	4	t
9	884	Сок «Я» апельсиновый	Напитки		1000 мл	\N	4	t
9	885	Вода питьевая Aura негазированная	Напитки		500 мл	\N	1.8	t
9	886	Вода питьевая Aura газированная	Напитки		500 мл	\N	1.8	t
10	887	Комбо 1	Комбо	Пицца «Хорватский омлет» + пицца «Мексиканская» + пицца «Оливье» + пицца «Четыре сыра»	2910 г	\N	47.5	t
10	888	Комбо 2	Комбо	Пицца «Пеперони» + пицца «Маргарита» + пицца «От шефа» + пицца «Фирменная»	2825 г	\N	47.5	t
10	889	Мясное комбо	Комбо	Пицца «Хорватский омлет» + пицца «Много мяса» + пицца «Пеперони» + пицца «Фирменная»	3020 г	\N	52.5	t
10	890	Мега-комбо	Комбо	Пицца с грушей и голубым сыром + пицца «Хорватский омлет» + пицца «Мексиканская» + пицца «Пеперони» + пицца «Маргарита» + пицца «Много мяса» + пицца Tonno + пицца «Фирменная»	5980 г	\N	99.5	t
10	891	Пицца «Маргарита»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», сыр «Голландский», орегано, помидоры	370 г	\N	9.5	t
10	892	Пицца «Фирменная»	Пиццы	Тесто, соус томатный, , сыр «Моцарелла», сыр «Голландский», орегано свинина, руккола, помидоры черри	470 г	\N	12.5	t
10	893	Пицца «Пеперони»	Пиццы	Тесто, соус томатный, сыр «Моцарелла», сыр «Голландский», перерони, сметана, перчики острые, орегано	410 г	\N	11.5	t
10	894	Пицца «Мидии с креветками»	Пиццы		435 г	\N	12.5	t
10	895	Пицца «Капрезе»	Пиццы		365 г	\N	12.5	t
10	896	Пицца «Грибная»	Пиццы		390 г	\N	11.5	t
10	897	Пицца «Гавайская»	Пиццы		400 г	\N	12.5	t
10	898	Пицца «Карбонара»	Пиццы		340 г	\N	12.5	t
10	899	Пицца «Хорватский омлет»	Пиццы		440 г	\N	12.5	t
10	900	Пицца «Четыре сыра»	Пиццы		370 г	\N	11.5	t
10	901	Пицца «От Шефа»	Пиццы		440 г	\N	12.5	t
10	902	Пицца Tonno	Пиццы		400 г	\N	11.5	t
10	903	Пицца «Вегетарианская»	Пиццы		460 г	\N	10.5	t
10	904	Пицца «Много мяса»	Пиццы		430 г	\N	12.5	t
10	905	Пицца «Мексиканская»	Пиццы		450 г	\N	12.5	t
10	906	Пицца с грушей и голубым сыром	Пиццы		390 г	\N	11.5	t
10	907	Пицца «Филадельфия»	Пиццы		355 г	\N	12.5	t
10	908	Пицца «Домашняя»	Пиццы		435 г	\N	12.5	t
10	909	Пицца «Оливье»	Пиццы		425 г	\N	11.5	t
10	910	Пицца «Императорская»	Пиццы		450 г	\N	12.5	t
10	911	Пицца «Кальцоне» грибная	Пицца «Кальцоне»	Соус грибной, смесь сыров, шампиньоны, петрушка, маслины	365 г	\N	9	t
10	912	Пицца «Кальцоне» Vege	Пицца «Кальцоне»	Соус томатный, смесь сыров, шампиньоны, перец, лук, маслины, помидоры	375 г	\N	9	t
10	913	Пицца «Кальцоне „Четыре сыра“»	Пицца «Кальцоне»	Соус томатный, смесь сыров, сыр «Дорблю», сыр «Рикотта», маслины	335 г	\N	9	t
10	914	Пицца «Кальцоне „Италия“»	Пицца «Кальцоне»	Соус «Барбекю», смесь сыров, пеперони, шампиньоны, бекон, маслины	365 г	\N	9	t
10	915	Пицца «Кальцоне „Mama Mia“»	Пицца «Кальцоне»	Соус томатный, смесь сыров, ветчина, помидоры, перец халапеньо, лук	380 г	\N	9	t
10	916	Сыр	Топинг		75 г	\N	2	t
10	917	Ветчина	Топинг		60 г	\N	2	t
10	918	Пеперони	Топинг		40 г	\N	2	t
10	919	Шампиньоны	Топинг		50 г	\N	1	t
10	920	Оливки	Топинг		10 г	\N	1	t
10	921	Лук	Топинг		30 г	\N	1	t
10	922	Помидоры	Топинг		40 г	\N	1	t
10	923	Перец	Топинг		50 г	\N	1	t
10	924	Перец халапеньо	Топинг		10 г	\N	1	t
10	925	Перец чили	Топинг		10 г	\N	1	t
10	926	Курица копчёная	Топинг		40 г	\N	2	t
10	927	Яйцо	Топинг		1 шт	\N	1	t
10	932	Соус «Тар‑тар»	Топинг		50 г	\N	1	t
10	933	Соус горчичный	Топинг		50 г	\N	1	t
10	934	Соус чесночный	Топинг		50 г	\N	1	t
10	935	Минельная вода «Дарида» газированная	Напитки		500 мл	\N	1.5	t
10	936	Your water	Напитки		500 мл	\N	1.5	t
10	937	Напиток «Вита микс» черешня	Напитки		500 мл	\N	1.9	t
10	938	Напиток «Вита микс»ромашка	Напитки		500 мл	\N	1.9	t
10	939	Напиток «Вита микс» чёрная смородина	Напитки		500 мл	\N	1.9	t
10	940	Напиток «Вита микс»лимон‑мята	Напитки		500 мл	\N	1.9	t
10	941	Напиток «Вита микс» мультифрукт	Напитки		500 мл	\N	1.9	t
11	942	Шаверма фирменная	Шаурма	Курица-гриль, помидоры, огурцы солёные, капуста маринованная, лук маринованный, сыр «Адыгейский», фасолевая паста, соус классический, лаваш	470 г	\N	7	t
11	943	Шаверма классическая	Шаурма	Курица-гриль, помидоры, огурцы солёные, капуста маринованная, соус классический, лаваш	400 г	\N	6	t
11	944	Шаверма острая	Шаурма	Курица-гриль, помидоры, огурцы солёные, капуста маринованная, перец халапеньо, лук маринованный, соус классический, соус томатный, лаваш	450 г	\N	6.5	t
11	945	Гирос	Шаурма	Курица, картофель фри, помидоры, огурцы солёные, соус классический, лаваш		\N	6.5	t
11	946	Шаверма с креветками	Шаурма	Тигровые креветки в панировке, помидоры, капуста пекинская, огурцы солёные, лук маринованный, соус «Тар‑тар», лаваш	350 г	\N	9.5	t
11	947	Шаверма «FRESH»	Шаурма	Курица, капуста пекинская, огурцы, помидоры, соус клюквенный, соус классический, лаваш		\N	7	t
11	948	Криспи фиш	Шаурма	Треска в панировке, помидоры, соус «Тар-тар», огурцы солёные, капуста пекинская, лук маринованный, соус классический, лаваш		\N	7.5	t
11	949	Хот-дог в лаваше	Шаурма	Колбаска «Охотничья», бекон, помидоры, огурцы солёные, лук маринованный, соус томатный, соус горчичный, лаваш	400 г	\N	7.5	t
11	950	Шаверма с говядиной	Шаурма	Фарш из говядины, помидоры, лук, огурцы солёные, капуста маринованная, соус томатный, лаваш		\N	9	t
11	951	Шаверма на тарелке	Шаурма	Курица-гриль, соус классический, картофель фри, соус сырный, помидоры, огурцы солёные, капуста маринованная, лаваш		\N	8.5	t
11	952	Шаверма вегетарианская	Шаурма	Помидоры, огурцы солёные, капуста маринованная, лук маринованный, сыр «Адыгейский», фасолевая паста, соус классический, лаваш		\N	6	t
11	953	Шаверма с фалафелем	Шаурма	Фалафель, помидоры, фасолевая паста, огурцы солёные, сыр «Адыгейский», соус классический, лаваш		\N	7	t
11	954	Суперкомбо	Комбо	Шаверма классическая + хрустящие крылья + картофель фри + сырный и горчичный соусы		\N	12.12	t
11	955	Комбо	Комбо	Хрустящие крылья + картофель фри + сырный и горчичный соусы		\N	6	t
11	956	Пита с курицей	Пита	Курица-гриль, помидоры, огурцы-микс, салат капустный, лук-микс, соус «Классический»		\N	5.5	t
11	957	Пита «Вегетарианская»	Пита	Помидоры, огурцы-микс, салат капустный, лук маринованный, сыр «Адыгейский», паста фасолевая, соус «Классический»		\N	5	t
11	958	Пита с креветками	Пита	Креветки тигровые в панировке, помидоры, огурцы-микс, салат капустный, соус «Классический», соус «Тар‑тар»		\N	8	t
11	959	Пита с треской	Пита	Треска в панировке, помидоры, огурцы-микс, салат капустный, соус «Классический», соус «Тар‑тар»		\N	7	t
11	960	Картофель фри	Горячие блюда		100 г	\N	2.5	t
11	961	Фалафель с йогуртовым соусом 	Горячие блюда		10 шт	\N	8	t
11	962	Драники	Горячие блюда	4, 6, 8 штук	4 шт	\N	4	t
11	963	Хрустящие крылья	Горячие блюда		4 шт	\N	4	t
11	964	Морс облепиховый	Напитки		500 мл	\N	4	t
11	965	Морс клюквенный	Напитки		500 мл	\N	4	t
11	966	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2	t
11	967	Двойная курица	Топинг			\N	2	t
11	968	Двойной сыр	Топинг			\N	1	t
11	969	Перец сладкий	Топинг			\N	0.5	t
11	970	Огурцы солёные	Топинг			\N	0.5	t
11	971	Соус классический	Топинг			\N	0.5	t
11	972	Соус фасолевый	Топинг			\N	0.5	t
11	975	Соус горчичный	Топинг			\N	0.5	t
11	976	Соус «Тар‑тар»	Топинг			\N	0.5	t
11	977	Перец халапеньо	Топинг			\N	0.5	t
12	978	Котлеты куриные с пюре «Французским»	Горячие блюда	Котлеты куриные, картофельное пюре, микс-салат, помидор черри, лимонная заправка	440 г	\N	12.7	t
12	979	Запеканка с филе судака и овощами	Горячие блюда	Филе судака, картофель, брокколи, соус «Белый», помидор, сыр «Моцарелла», сыр «Дорблю», лук красный, укроп	400 г	\N	14.9	t
12	980	Филе куриное с ростис и грибным соусом	Горячие блюда	Филе куриное, картофельные крокеты, соус сливочный с грибами и луком, укроп	380 г	\N	12.9	t
12	981	Рулька с картофелем и яйцом	Горячие блюда	Рулька, картофель, яйцо, соус из хрена, петрушка	400 г	\N	9.9	t
12	982	Бифштекс с яйцом и картофельным пюре	Горячие блюда	Котлета из говядины, яйцо жареное, картофельное пюре, соус «Демиглас», микс‑салат	345 г	\N	9.9	t
12	983	Драники с мачанкой	Горячие блюда	Драники картофельные, мачанка из свинины и шампиньонов, лук, зелень	370 г	\N	12.9	t
12	984	Драники с копчёным лососем	Горячие блюда	Драники картофельные, творожный соус, лосось горячего копчения	290 г	\N	13.4	t
12	985	Блинчики с мачанкой	Горячие блюда	Блинчики, мачанка из свинины и шампиньонов, соус «Бешамель», сыр «Моцарелла», зелень	330 г	\N	9.4	t
12	986	Блинчики с курицей, грибами и соусом «Бешамель»	Горячие блюда	Блинчики, филе куриное, шампиньоны, лук, соус «Бешамель», сыр «Моцарелла», зелень	300 г	\N	6.5	t
12	987	Запечённые крокеты с курицей и шампиньонами	Горячие блюда	Картофельные крокеты, филе куриное, лук, шампиньоны, соус «Бешамель», сыр «Моцарелла»	380 г	\N	9.9	t
12	988	Говядина с картофельными крокетами и овощами‑гриль	Горячие блюда	Филе говядины, картофельные крокеты, овощи на гриле: цукини, шампиньоны, микс перцев, лук красный, помидор черри, масло «Базилик»	325 г	\N	19.5	t
12	989	Щёчки говяжьи с соусом «Демиглас»	Горячие блюда		321 г	\N	13.4	t
12	990	Рёбра свиные с запечённым картофелем и сыром	Горячие блюда		500 г	\N	18.5	t
12	991	Окорочок куриный с салатом	Горячие блюда		325 г	\N	12.4	t
12	992	Ножка утиная с картофелем и овощами	Горячие блюда	Утиная ножка, картофель, карамельный лук, цукини, помидор, масло «Базилик», яблочный уксус	380 г	\N	17.3	t
12	993	Блюдо «Мак-н-чиз болоньезе»	Горячие блюда	Макароны, сырный соус, томатный фарш, сыр «Моцарелла», панировочные сухари, масло сливочное	460 г	\N	10.5	t
12	994	Салат «Цезарь» с курицей	Салаты	Филе куриное, микс-салат, сыр «Пармезан», соус «Цезарь», гренки, помидоры черри, масло «Базилик»	230 г	\N	8.9	t
12	995	Салат с индейкой и соусом из вяленых помидоров	Салаты	Индейка «Хойсин», микс-салат, сыр «Пармезан», гренки, соус «Песто» красный, помидоры вяленые	240 г	\N	12.9	t
12	996	Салат «Цезарь» с копчёным лососем	Салаты	Лосось копчёный, чипсы из бекона, микс-салат, сыр «Пармезан», соус «Цезарь», гренки	220 г	\N	12.9	t
12	997	Овощной салат с грушей и сыром «Дорблю»	Салаты	Микс-салат, свёкла, авокадо, сыр «Дорблю», батат печёный, груша запечённая	260 г	\N	12.4	t
12	998	Салат «Греческий» с рулетиками из цукини и сливочного крема	Салаты	Микс-салат, помидоры черри, перец сладкий, огурцы, маслины, красный лук, цукини, сливочный крем, заправка «Греческая»	270 г	\N	9.3	t
12	999	Салат «Оливье»	Салаты	Свинина, горошек консервированный, картофель, морковь, огурцы маринованные, огурец, яйцо, сыр «Пармезан», соус «Травы Прованса»	310 г	\N	6.9	t
12	1000	Пицца «Жульен с грибами»	Пицца	Филе куриное, шампиньоны, лук, соус сливочный, огурцы маринованные, опята маринованные, яйцо, горчица, сыр «Моцарелла», орегано	660 г	\N	13.6	t
12	1001	Пицца «Tasty»	Пицца	Фарш говяжий, сыр «Чеддер», помидоры, лук красный, сыр «Моцарелла», соус томатный, соус Гриль, орегано	615 г	\N	17.9	t
12	1002	Пицца «Греческая»	Пицца	Сыр «Дорблю», Сыр «Рикотта», сыр «Пармезан», сыр «Моцарелла», шпинат, помидоры вяленый, лук, соус томатный, соус Рэнч, орегано	605 г	\N	14.9	t
12	1032	Ролл с форелью и сливочным сыром	Роллы	Форель копченая, огурец, сливочный сыр, рис, нори	225 г	\N	13.4	t
12	1003	Пицца «Баварская»	Пицца	Колбаски «Охотничьи», бекон, огурцы маринованные, лук красный, соус Рэнч, соус горчичный, сыр «Моцарелла», луковые чипсы, орегано	585 г	\N	15.9	t
12	1004	Пицца «Дьябло»	Пицца	Колбаса пеперони, ветчина, помидоры, лук красный, халапеньо, сыр «Моцарелла», соус «Барбекю», орегано	560 г	\N	13.6	t
12	1005	Пицца «Калифорния» с копчёным лососем и креветками	Пицца	Лосось копченый, креветка салатная, помидоры черри, каперсы, сыр «Моцарелла», соус белый, орегано	550 г	\N	19.7	t
12	1006	Пицца «Свинина спайси & терияки» 	Пицца	Свинина, колбаса пеперони, перец свежий, сыр «Моцарелла», соус «Спайси», соус «Терияки», кунжут, орегано	545 г	\N	15.9	t
12	1007	Шеф-пицца	Пицца	Ветчина, бекон, колбаса сырокопчёная, шампиньоны, помидор, сыр «Моцарелла», соус томатный, орегано	630 г	\N	14.9	t
12	1008	Пицца «Барбекю»	Пицца	Свинина барбекю, бекон, шампиньоны, карамельный лук, соус «Барбекю», сыр «Моцарелла», орегано	590 г	\N	16.3	t
12	1009	Пицца «Жульен с грибами»	Пицца	Филе куриное, шампиньоны, лук, соус сливочный, огурцы маринованные, яйцо, горчица, сыр «Моцарелла», орегано	660 г	\N	21.4	t
12	1010	Пицца «Пеперони»	Пицца	Колбаски пеперони, сыр «Моцарелла», соус томатный, орегано	460 г	\N	9.9	t
12	1011	Пицца «Четыре сезона»	Пицца	Ветчина, шампиньоны, креветка салатная, перец консервированный, сыр «Моцарелла», паста томатная, орегано	540 г	\N	17.9	t
12	1012	Пицца «Пять сыров»	Пицца	Сыры: Моцарелла, сыр «Дорблю», Проволоне, Фета, Чеддер; сырный соус, орегано	520 г	\N	15.9	t
12	1013	Пицца «Карбонара»	Пицца	Бекон, красный лук, яйцо, сыр «Моцарелла», сыр «Пармезан», соус белый, орегано	480 г	\N	12.7	t
12	1014	Пицца «Гавайская»	Пицца	Ветчина, ананасы консервированные, сыр «Моцарелла», соус «Роуз Мэри», орегано	520 г	\N	12.3	t
12	1015	Пицца «Боскайолло»	Пицца	Сосиски, колбаски «Охотничьи», огурец консервированный, лук красный, маслины, сыр «Моцарелла», соус томатный, орегано	580 г	\N	12.7	t
12	1016	Пицца «Дорблю пеперони»	Пицца	Колбаса пеперони, сыр «Дорблю», сыр «Моцарелла», груша, соус белый, орегано	500 г	\N	14.9	t
12	1017	Пицца «Ветчина и грибы»	Пицца	Ветчина, шампиньоны, сыр «Моцарелла», соус томатный, орегано	460 г	\N	9.9	t
12	1018	Пицца «Рустика»	Пицца	Бекон, лук карамельный, огурцы консервированные, шампиньоны, сыр «Дорблю», сыр «Моцарелла», соус белый, орегано	540 г	\N	15.9	t
12	1019	Пицца «Маргарита»	Пицца	Сыр «Моцарелла», масло «Базилик», соус томатный, орегано	410 г	\N	8.4	t
12	1020	Ролл «Когета маки»	Роллы	Опалённый лосось и тунец, огурец, сливочный сыр, рис, нори, соус «Терияки», икра тобико	235 г	\N	13.7	t
12	1021	Ролл «Лава маки»	Роллы	Огурец, сливочный сыр, соус «Лава», рис, нори, соус «Терияки»	270 г	\N	12.7	t
12	1022	Ролл «Йоган маки»	Роллы	Помидор, салат ромен, сливочный сыр, соус «Чизукани», рис, нори, ореховый соус	275 г	\N	9.3	t
12	1023	Ролл «Юки маки» с тунцом	Роллы	Тунец, огурец, опалённый сливочный сыр, рис, нори, соус «Терияки»	215 г	\N	11.9	t
12	1024	Ролл «Филадельфия унаги маки» 	Роллы	Угорь копчёный, сливочный сыр, такуан, соус «Терияки», кунжут, рис, нори	206 г	\N	14.4	t
12	1025	Ролл «Филадельфия классическая»	Роллы	Лосось, авокадо, огурец, сливочный сыр, рис, нори	255 г	\N	16.9	t
12	1026	Ролл с острым лососем, тунцом и омлетом «Тамаго»	Роллы	Лосось, тунец, сливочный сыр, омлет «Тамаго», огурец, соус «Спайси», рис, нори	260 г	\N	15.4	t
12	1027	Ролл «Бонито» с лососем и авокадо	Роллы	Лосось, авокадо, сливочный сыр, стружка тунца, рис, нори	205 г	\N	10.9	t
12	1028	Ролл «Чука сяке маки» с ореховым соусом 	Роллы	Лосось, чука, сливочный сыр, ореховый соус, рис, нори	225 г	\N	11.9	t
12	1029	Ролл с угрём, лососем и омлетом	Роллы	Угорь, лосось, омлет «Тамаго», огурец, сливочный сыр, соус «Спайси», соус «Терияки», рис, нори	250 г	\N	15.9	t
12	1030	Ролл «Ясай маки»	Роллы	Перец сладкий, огурец, авокадо, салат, кунжут, рис, нори	205 г	\N	6.4	t
12	1031	Ролл «Калифорния маки»	Роллы	Креветка тигровая, авокадо, огурец, икра тобико, майонез, рис, нори	205 г	\N	13.4	t
28	2588	Тосты	Хлеб		60 г	\N	1.5	t
12	1033	Ролл «Сяке авокадо маки»	Роллы	Лосось, авокадо, рис, нори	170 г	\N	9.3	t
12	1034	Суши-сет «Ниёдогава»	Суши-сеты	Ролл «Чука сяке маки с ореховым соусом», ролл «Йоган маки», ролл с форелью и сливочным сыром, ролл «Бонито» с копчёным лососем, 2 японских гарнира	1085 г	\N	39.9	t
12	1035	Суши-сет «Сёкоцу»	Суши-сеты	Ролл «Лава маки», ролл с угрём, лососем и омлетом, ролл с острым тунцом, сливочным сыром и огурцом, ½ ролла «Филадельфия классическая», ½ ролла с форелью и сыром «Чеддер», 2 японских гарнира	1132 г	\N	46.7	t
12	1036	Суши-сет «Тадами»	Суши-сеты	Ролл с тигровой креветкой и икрой тобико, ролл с острым лососем, тунцом и омлетом «Тамаго», ролл «Бонито» с лососем и авокадо, ролл «Филадельфия унаги маки», 2 японских гарнира	1015 г	\N	41.9	t
12	1037	Бургер «Jack Daniel`s»	Бургеры	Котлета из говядины, булочка бриошь, бекон, сыр Проволоне, помидоры вяленые, шампиньоны, соус «Джек Дэниелс», руккола, майонез	320 г	\N	14.9	t
12	1038	Бугер «Чеддер&Бекон»	Бургеры	Котлета из говядины, булочка бриошь, помидор, сыр «Чеддер», бекон, лук маринованный, руккола, майонез	300 г	\N	13.4	t
12	1039	Бургер «Garage»	Бургеры	Котлета из говядины, булочка бриошь, бекон, сыр с голубой плесенью, груша, брусничный джем, руккола, майонез	280 г	\N	14.9	t
12	1040	Салат «Коул‑слоу» 	Бургеры	Капуста белокочанная, капуста краснокочанная, морковь, соус «Рэнч»	150 г	\N	1.5	t
12	1041	Картофель «Бельгийский»	Бургеры		150 г	\N	3.9	t
12	1042	Тостада с курицей	Бургеры	Филе куриное, соус «Барбекю», карамельный лук, тортилья, сыр «Чеддер», картофель «Бельгийский», салат «Коул-слоу», соус «Рэнч»	430 г	\N	12.5	t
12	1043	Тостада с говядиной	Бургеры	Котлета из говядины, тортилья, сыр «Чеддер», «Бельгийский» картофель, салат «Коул-слоу», соус «Рэнч»	460 г	\N	14.4	t
12	1044	Кесадилья с курицей и овощами 	Закуски	Тортилья, цукини, филе куриное, лайм, лук, паста томатная, соус сырный, чили перец, масло оливковое, кинза свежая, перец чёрный	230 г	\N	7.9	t
12	1045	Карпаччо из говядины 	Закуски	Маринованная говядина, помидор черри, руккола, сыр «Пармезан», луковые чипсы, медовая заправка	170 г	\N	13.4	t
12	1046	Сельдь с картофелем	Закуски		370 г	\N	8.4	t
12	1047	Крылышки куриные	Закуски		430 г	\N	9	t
12	1048	Наггетсы куриные 	Закуски		170 г	\N	6.9	t
12	1049	Пальчики «Моцарелла»	Закуски		210 г	\N	6.9	t
12	1050	Кольца луковые	Закуски		200 г	\N	6.7	t
12	1051	Картофель «Бельгийский»	Закуски		200 г	\N	4.7	t
12	1052	Хлеб «Чесночный»	Закуски	Маринованная говядина, помидоры черри, руккола, сыр «Пармезан», луковые чипсы, медовая заправка	140 г	\N	3.9	t
12	1053	Сырная закуска	Закуски		270 г	\N	14.5	t
12	1054	Пивной набор	Закуски	Куриные крылышки, грудинка свиная, колбаски из баранины-говядины, колбаски «Охотничьи», пеперони, колбаса сырокопчёная, сальса /лук красный, перец сладкий, перец зелёный, огурец, помидоры, фасоль красная, кукуруза, авокадо, маринованный редис, перец халапеньо, майонез, паприка кусочками/, фокачча, кольца луковые, соус сырный, соус «Гуакамоле», руккола	800 г	\N	34	t
12	1055	Солянка «Garage»	Супы	Филе куриное, бекон, ветчина, огурцы маринованные, лук, каперсы, маслины, лимон, сметана	280 г	\N	6.5	t
12	1056	Суп «Том-кха» с курицей	Супы	Филе куриное, молоко кокосовое, бульон, тайский красный карри, лук, капуста, цукини, перец сладкий, чили, кинза, имбирно-чесночная паста	250 г	\N	6.9	t
12	1057	Холодник с картофельными крокетами	Супы	Свёкла, огурец, яйцо, кефир, лук зелёный, картофельные крокеты, укроп	415 г	\N	5.9	t
12	1058	Борщ с ребром	Супы	Свиное рёбрышко, свёкла, картофель, паста томатная, бульон, морковь, лук, чеснок, сметана, укроп	305 г	\N	6.9	t
12	1059	Бульон с чесночным хлебом	Супы	Бульон куриный, курица, яйцо, чесночный хлеб, укроп	372 г	\N	5.4	t
12	1060	Картофель «Бельгийский»	Гарниры		150 г	\N	3.9	t
12	1061	Крокеты картофельные	Гарниры		150 г	\N	3.9	t
12	1062	Драники	Гарниры		100 г	\N	3.9	t
12	1063	Овощи-гриль	Гарниры		75 г	\N	3.9	t
12	1064	Пюре «Французское»	Гарниры		150 г	\N	3.9	t
12	1065	Сырники со сметаной и кули из клубники	Десерты	Сырники, пудра сахарная, соус клубничный, сметана, мята	220 г	\N	5.5	t
12	1066	Чизкейк «Классический» 	Десерты	Сыр творожный, крахмал кукурузный, меланж, сахар, крем на растительных маслах, сливки животного происхождения, бисквит	120 г	\N	5.3	t
12	1067	Сэндвич «Чили» с ветчиной	Сэндвичи	Пшеничный хлеб, ветчина, помидоры, сыр «Чеддер», салат «Айсберг», соус «Чили», майонез	200 г	\N	4.3	t
12	1068	Сэндвич с курицей и беконом хрустящим	Сэндвичи	Пшеничный хлеб, филе куриное, помидоры, бекон, микс-салат, огурец консервированный, соус «Бургер», майонез	210 г	\N	4.3	t
12	1069	Сэндвич с курицей, луковыми кольцами и соусом «Ореховым»	Сэндвичи	Пшеничный хлеб, филе куриное, бекон, кольца луковые, помидоры, салат «Айсберг», соус «Ореховый», луковые чипсы	195 г	\N	4.3	t
12	1070	Сэндвич-ролл со свининой и соусом BBQ 	Сэндвичи	Пшеничный хлеб, свинина, бекон, сыр «Моцарелла», лук карамелизированный, помидоры, салат «Айсбеог», соус «Барбекю» с майонезом	240 г	\N	4.9	t
12	1071	Сэндвич с ветчиной, курицей и соусом «Спайси» 	Сэндвичи	Пшеничный хлеб, филе куриное, ветчина, помидоры, огурцы маринованные, салат «Айсберг», соус «Спайси»	215 г	\N	4.3	t
12	1072	Бульон с курицей	Детское меню	Бульон, филе куриное, укроп	320 г	\N	3.4	t
12	1073	Пицца «Котик»	Детское меню	Колбаса сырокопчёная, сосиски, помидор, сыр «Моцарелла», укроп, майонез, маслины, соус томатный	300 г	\N	6.9	t
12	1074	Чизбургер «Лягушка»	Детское меню	Котлета из говядины, булочка бриошь, сыр «Чеддер», огурец, маслины, майонез, кетчуп	190 г	\N	6.9	t
12	1075	Мини-салат «Цезарь» с курицей	Детское меню	Филе куриное, микс из салатов, сыр «Пармезан», крутоны, соус «Цезарь», масло с базиликом	120 г	\N	4.9	t
12	1076	Наггетсы куриные с картофелем «Бельгийский» 	Детское меню	Куриные наггетсы, «Бельгийский» картофель фри, кетчуп	250 г	\N	7.5	t
12	1077	Картофель «Бельгийский» с кетчупом	Детское меню		150 г	\N	3.9	t
12	1078	Печёная сосиска с пюре «Бабочка»	Детское меню	Сосиска, картофельное пюре, огурцы, помидор, кетчуп, майонез	250 г	\N	4.5	t
12	1079	Сырники со сметаной и клубничным кули	Детское меню	Сырники, пудра сахарная, соус «Клубничный», сметана, мята	220 г	\N	5.5	t
12	1080	Котлета куриная с картофельным пюре и кукурузой	Детское меню		311 г	\N	6.5	t
12	1081	Ролл с огурцом	Детское меню	Огурец, рис, нори, кунжут	110 г	\N	3.4	t
12	1082	Торт «Морковный»	Детское меню		140 г	\N	5.3	t
12	1083	Сырники	Детское меню	Сырники, пудра сахарная, соус «Клубничный», сметана, мята	220 г	\N	5.5	t
12	1084	Напиток энергетический «Burn»	Напитки		250 мл	\N	4	t
12	1085	Вода «Бон-Аква» негазированная	Напитки		500 мл	\N	2.2	t
12	1086	Вода «Бон-Аква» сильногазированная	Напитки		500 мл	\N	2.2	t
12	1087	Вода «Бон-Аква» среднегазированная	Напитки		500 мл	\N	2.2	t
12	1088	Напиток газированный «Кока‑кола»	Напитки		500 мл	\N	2.2	t
12	1089	Напиток газированный «Кока-кола ZERO»	Напитки		500 мл	\N	2.2	t
12	1090	Напиток газированный «Спрайт»	Напитки		500 мл	\N	2.2	t
12	1091	Напиток газированный «Фанта»	Напитки		500 мл	\N	2.2	t
12	1092	Сок «Добрый» томатный	Напитки		1000 мл	\N	5.9	t
12	1093	Сок «Добрый» яблочный	Напитки		1000 мл	\N	5.9	t
12	1094	Сок «Rich» ананасовый	Напитки		1000 мл	\N	5.9	t
12	1095	Сок «Rich» апельсиновый	Напитки		1000 мл	\N	5.9	t
12	1096	Сок «Rich» вишнёвый	Напитки		1000 мл	\N	5.9	t
12	1097	Сок «Rich» грейпфрутовый	Напитки		1000 мл	\N	5.9	t
12	1098	Напиток «Фьюз ти» малина‑клубника	Напитки		500 мл	\N	2.2	t
12	1099	Напиток газированный «Швепс Индиан Тоник»	Напитки		500 мл	\N	2.2	t
13	1100	Шаурма «Классическая»	Шаурма	Лаваш тонкий, мясо-гриль, огурцы, помидор, капуста, соус фирменный, соус томатный, восточные специи	300 г	\N	5	t
13	1101	Шаурма «Фирменная»	Шаурма	Лаваш тонкий сырный, мясо-гриль, огурцы, помидор, соус фирменный, соус томатный, восточные специи, сыр «Чеддер», лук красный маринованный	300 г	\N	6	t
28	2589	Пикантная лепёшка с кунжутом	Хлеб		50 г	\N	1.9	t
13	1102	Шаурма «Вегетарианская»	Шаурма	Лаваш тонкий, огурцы, кукуруза итальянская, шампиньоны, перец, помидор, капуста, соус натуральный без майонеза	300 г	\N	5	t
13	1103	Шаурма «Деревенская»	Шаурма	Лаваш тандырный, свинина, капуста, огурец свежий/маринованный, помидор, соус фирменный, специи	400 г	\N	7	t
13	1104	Шаурма «Острая»	Шаурма	Лаваш тандырный, мясо-гриль, капуста, огурец свежий/маринованный, помидор, соус фирменный, специи, соус «Острый», халапеньо	400 г	\N	6	t
13	1105	Шаурма «Тропическая»	Шаурма	Лаваш тандырный, мясо-гриль, капуста, огурец свежий/маринованный, помидор, соус фирменный, специи, ананас, кукуруза	400 г	\N	7	t
13	1106	Хот-дог «Датский»	Хот-доги	Булочка датская, сосиска «Кабанос», горчица домашняя, помидор, огурцы маринованные, соус фирменный	230 г	\N	4.5	t
13	1107	Хот-дог в лаваше	Хот-доги	Лаваш тонкий, огурцы, помидор, капуста, соус фирменный, соус томатный, восточные специи	300 г	\N	5	t
13	1108	Сыр «Чеддер»	Топинг		30 г	\N	1.5	t
13	1109	Шампиньоны	Топинг		30 г	\N	0.8	t
13	1110	Кукуруза	Топинг		30 г	\N	0.8	t
13	1111	Маринованный красный лук	Топинг		30 г	\N	0.5	t
13	1112	Соус острый	Топинг		30 г	\N	0.5	t
13	1113	Курица-гриль	Топинг		60 г	\N	1.4	t
13	1114	Морковь «По‑корейски»	Топинг		50 г	\N	0.5	t
13	1115	Вырезка-гриль говяжья	Топинг		60 г	\N	2.5	t
13	1116	Копчёная паприка	Топинг			\N	0.5	t
13	1117	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.3	t
13	1118	Напиток газированный Coca‑Cola Zero	Напитки		500 мл	\N	2.3	t
13	1119	Напиток газированный Fanta	Напитки		500 мл	\N	2.3	t
13	1120	Вода питьевая BonAqua	Напитки		500 мл	\N	2	t
13	1121	Сок «Добрый»	Напитки		200 мл	\N	2	t
14	1122	Пицца «Фирменная»	Пицца	Ветчина, карборнат, сосиски, шампиньоны, помидоры, перец, сыр «Моцарелла», соус «Барбекю»	1300 г 40 см	\N	20.9	t
14	1123	Пицца «Буржуй»	Пицца	Сервелат, салями, шампиньоны, сыр «Моцарелла», помидоры, перец, брокколи, маслины, соус томатный, бортик с ветчиной и сыром	1200 г 40 см	\N	22.9	t
14	1124	Пицца «Охотничья»	Пицца	Мини-борт с сыром, борт с колбаской «Охотничьей», сервелат, салями, колбаски «Охотничьи», помидоры, шампиньоны, соус чесночный	1300 г 40 см	\N	23.5	t
14	1125	Пицца «Фэмили»	Пицца	Из четырёх частей: мясная, морская, колбасная, овощная	2300 г 60 см	\N	35	t
14	1126	Пицца «Пеперони»	Пицца	Помидоры, пеперони, сыр «Моцарелла», соус томатный	30 см	\N	12.5	t
14	1127	Пицца «Четыре мяса»	Пицца	Ветчина, салями, сервелат, карбонад, шампиньоны, помидоры, перец болгарский, корнишоны, сыр «Моцарелла», соус «Барбекю»	30 см	\N	13.9	t
14	1128	Пицца «Милано»	Пицца	Ветчина, карбонад, оливки, ананас, шампиньоны, лук, помидоры, сыр «Моцарелла», соус томатный	30 см	\N	13.5	t
14	1129	Пицца «Студенческая»	Пицца	Ветчина, сосиски, помидоры, сыр «Моцарелла», соус томатный	30 см	\N	11.5	t
14	1130	Пицца «Гриль»	Пицца	Сервелат, бекон, карбонад, сыр «Моцарелла», шампиньоны, маслины, перец, лук, соус «Барбекю»	30 см	\N	13.5	t
14	1131	Пицца «Род Айленд»	Пицца	Бекон, ветчина, карбонад, маслины, помидоры, сыр «Моцарелла», соус томатный	30 см	\N	12.5	t
14	1132	Пицца «Аляска»	Пицца	Бекон, лук, колбаски «Охотничьи», шампиньоны, сыр «Моцарелла», огурцы маринованные, оливки, соус чесночный фирменный	30 см	\N	13.5	t
14	1133	Пицца «Маргарита»	Пицца	Помидоры, сыр «Моцарелла», орегано, соус томатный	30 см	\N	9.9	t
14	1134	Пицца «Ривьера»	Пицца	Креветки, лосось, мясо краба, каперсы, помидоры, сыр «Голландский», сыр «Моцарелла», соус чесночный фирменный	30 см	\N	19	t
14	1135	Пицца «Овощная»	Пицца	Шампиньоны, перец, брокколи, помидоры, маслины, лук, орегано, сыр «Голландский», сыр «Моцарелла», соус томатный	30 см	\N	11.5	t
14	1136	Пицца «Белиссимо»	Пицца	Ветчина, колбаски «Охотничьи», помидоры, огурцы маринованные, сыр «Голландский», сыр «Моцарелла», соус чесночный фирменный, орегано	30 см	\N	12.5	t
14	1137	Пицца «Мексиканская»	Пицца	Салями, шампиньоны, помидоры, каперсы, перец халапеньо, сыр «Голландский», сыр «Моцарелла», соус томатный	30 см	\N	14.8	t
14	1138	Пицца «Баварская»	Пицца	Колбаски «Охотничьи», сервелат, шампиньоны, кукуруза, помидоры, соус «Барбекю»	30 см	\N	12.5	t
14	1139	Пицца «Барбекю»	Пицца	Бекон, колбаски «Охотничьи», помидоры, перец, сыр «Моцарелла», орегано, соус «Барбекю»	30 см	\N	12.5	t
14	1140	Пицца «Де люкс»	Пицца	Ветчина, салями, колбаски «Охотничьи», лук, помидоры, сыр «Моцарелла», соус «Барбекю»	30 см	\N	12.5	t
14	1141	Пицца «Палермо»	Пицца	Ветчина, карбонад, огурцы маринованные, шампиньоны, помидоры, сыр «Моцарелла», соус чесночный фирменный	30 см	\N	13.5	t
14	1142	Ролл «Бонито» с тунцом	Сложные роллы	Сливочный сыр, нори, рис, огурец, тунец, стружка тунца, соус «Унаги»	8 шт	\N	9.2	t
14	1143	Ролл «Филадельфия премиум»	Сложные роллы	Сливочный сыр, нори, рис, лосось, огурец	8 шт	\N	13.5	t
14	1144	Ролл «Шанхай»	Сложные роллы	Нори, рис, огурец, лосось, икра масаго	8 шт	\N	9.3	t
14	1145	Ролл «Чикен»	Сложные роллы	Сыр сливочный, нори, рис, огурец, курица копчёная, кунжут	8 шт	\N	6.7	t
14	1146	Ролл «Филадельфия унаги тори» 	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, соус «Унаги»	8 шт	\N	8.9	t
14	1147	Ролл «Чиз Филадельфия»	Сложные роллы	Сыр сливочный, нори, рис, лосось	8 шт	\N	9.2	t
14	1148	Ролл «Филадельфия» с масаго	Сложные роллы	Сыр сливочный, нори, рис, лосось, авокадо, икра масаго	8 шт	\N	9.6	t
14	1149	Ролл «Филадельфия» с креветкой	Сложные роллы	Сыр сливочный, нори, рис, лосось, огурец, креветка	8 шт	\N	10.5	t
14	1150	Ролл «Филадельфия» с икрой	Сложные роллы	Сыр сливочный, нори, рис, лосось, икра	8 шт	\N	10.9	t
14	1151	Ролл «Филадельфия»	Сложные роллы	Сыр сливочный, нори, рис, огурец, лосось	8 шт	\N	9.3	t
14	1152	Ролл «Финляндия»	Сложные роллы	Сыр сливочный, нори, рис, огурец, икра масаго, лосось	8 шт	\N	8.2	t
14	1153	Ролл «Сидней»	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, икра масаго	8 шт	\N	9	t
14	1154	Ролл «Тибет»	Сложные роллы	Сыр сливочный, нори, рис, курица копчёная, помидор, перец	8 шт	\N	6.5	t
14	1155	Ролл «Сегун»	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, соус «Унаги», кунжут	8 шт	\N	9.2	t
14	1156	Ролл «Спайси самурай» 	Сложные роллы	Соус «Спайси», нори, рис, огурец, лосось, кунжут	8 шт	\N	8.7	t
14	1157	Ролл «Престиж»	Сложные роллы	Сыр сливочный, нори, рис, икра масаго, огурец, перец, креветка	8 шт	\N	9.7	t
14	1158	Ролл «Самурай»	Сложные роллы	Сыр сливочный, нори, рис, огурец, лосось, кунжут	8 шт	\N	8.5	t
14	1159	Ролл «Овощной»	Сложные роллы	Нори, рис, перец, помидор, авокадо, огурец, кунжут	8 шт	\N	6.5	t
14	1160	Ролл «Невада»	Сложные роллы	Сыр сливочный, нори, рис, огурец, креветка, икра масаго	8 шт	\N	7.4	t
14	1161	Ролл «Монреаль»	Сложные роллы	Сыр сливочный, нори, рис, икра масаго, огурец, креветка, кунжут	8 шт	\N	8.9	t
14	1162	Ролл «Калифорнийская Филадельфия унаги» 	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, кунжут	8 шт	\N	9.2	t
14	1163	Ролл «Калифорния плюс»	Сложные роллы	Сыр сливочный, нори, рис, огурец, мясо крабовое, лосось, икра масаго	8 шт	\N	8.9	t
14	1164	Ролл «Калифорния» с креветкой	Сложные роллы	Сыр сливочный, нори, рис, огурец, мясо крабовое, креветка, икра масаго	8 шт	\N	8.9	t
14	1165	Ролл «Калифорния» с кунжутом	Сложные роллы	Сыр сливочный, нори, рис, огурец, мясо крабовое, кунжут	8 шт	\N	6.5	t
14	1166	Ролл «Калифорния»	Сложные роллы	Сыр сливочный, нори, рис, огурец, мясо крабовое, икра масаго	8 шт	\N	7.5	t
14	1167	Ролл «Сырная Дакота»	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, соус «Унаги», кунжут	8 шт	\N	11.4	t
14	1168	Ролл «Дакота»	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, соус «Унаги», кунжут	8 шт	\N	10.9	t
14	1169	Ролл «Дакота» с лососем	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, лосось, соус «Унаги», кунжут	8 шт	\N	12.5	t
14	1170	Ролл «Дабл чиз»	Сложные роллы	Сыр сливочный, нори, рис, сыр плавленый, курица копчёная, сыр твёрдый	8 шт	\N	6.7	t
14	1171	Ролл «Грин фиш»	Сложные роллы	Сыр сливочный, нори, рис, огурец, рыба масляная, укроп	8 шт	\N	7.5	t
28	2590	Чесночный хлеб	Хлеб		50 г	\N	2.5	t
14	1172	Ролл «Вегас»	Сложные роллы	Сыр сливочный, нори, рис, огурец, креветка, икра масаго, сыр плавленый	8 шт	\N	7.5	t
14	1173	Ролл «Весенний»	Сложные роллы	Сыр сливочный, нори, рис, огурец, лосось, укроп	8 шт	\N	7.5	t
14	1174	Ролл «Бонито» с угрём	Сложные роллы	Сыр сливочный, нори, рис, огурец, угорь, стружка тунца	8 шт	\N	9.7	t
14	1175	Ролл «Бонито»	Сложные роллы	Сыр сливочный, нори, рис, огурец, лосось, стружка тунца	8 шт	\N	8.9	t
14	1176	Ролл «Спринг ролл с лососем»	Сложные роллы	Сливочный сыр, рис, огурец, лосось, бумага рисовая	8 шт	\N	8.3	t
14	1177	Тёплый ролл «Хот с тунцом»	Тёплые роллы	Рис, нори, тунец, огурец, крем сырный	8 шт	\N	6.9	t
14	1178	Тёплый ролл «Хот с лососем»	Тёплые роллы	Рис, нори, лосось, огурец, крем сырный	8 шт	\N	6.9	t
14	1179	Тёплый ролл «Чикен хот»	Тёплые роллы	Рис, нори, помидор, курица копчёная, крем сырный, кунжут	8 шт	\N	7.9	t
14	1180	Тёплый ролл «Флорида»	Тёплые роллы	Рис, нори, лосось, помидоры, огурец, икра масаго, крем сырный	8 шт	\N	9.9	t
14	1181	Тёплый ролл «Хот угорь»	Тёплые роллы	Рис, нори, угорь, огурец, крем сырный, соус «Унаги», кунжут	8 шт	\N	9.9	t
14	1182	Тёплый ролл «Хот с сыром»	Тёплые роллы	Рис, нори, сыр сливочный, крем сырный	8 шт	\N	6.5	t
14	1183	Тёплый ролл «Хот крабс»	Тёплые роллы	Рис, нори, огурец, перец, мясо крабовое, крем сырный	8 шт	\N	6.5	t
14	1184	Тёплый ролл «Спайси хот» с мидиями 	Тёплые роллы	Рис, нори, огурец, мидии, соус «Спайси»	8 шт	\N	6.5	t
14	1185	Тёплый ролл «Везувий»	Тёплые роллы	Рис, нори, креветка, угорь, огурец, кунжут, соус «Спайси», сыр, соус «Унаги»	8 шт	\N	9.9	t
14	1186	Тёплый ролл «Канзас»	Тёплые роллы	Рис, нори, креветка, лосось, огурец, икра масаго, соус« Спайси», сыр	8 шт	\N	9.9	t
14	1187	Тёплый ролл «Амазонка»	Тёплые роллы	Рис, нори, креветка, огурец, икра масаго, крем сырный	8 шт	\N	9.9	t
14	1188	Ролл «Маки с тунцом»	Хосомаки	Рис, нори, тунец	6 шт.	\N	4.8	t
14	1189	Ролл «Хате маки»	Хосомаки	Рис, нори, лосось, огурец	6 шт	\N	4.7	t
14	1190	Ролл «Унаги маки» с угрем 	Хосомаки	Рис, нори, угорь, кунжут, соус «Унаги»	6 шт	\N	6	t
14	1191	Ролл «Сырный лосось маки»	Хосомаки	Рис, нори, лосось, сыр сливочный	6 шт	\N	5	t
14	1192	Ролл «Сырная креветка маки»	Хосомаки	Рис, нори, креветка, сыр сливочный	6 шт	\N	5.2	t
14	1193	Ролл «Эби маки» с креветкой	Хосомаки	Рис, нори, креветка	6 шт	\N	4.8	t
14	1194	Ролл «Масаго маки»	Хосомаки	Рис, нори, икра масаго	6 шт	\N	3.9	t
14	1195	Ролл «Маки с чукой»	Хосомаки	Рис, нори, чукка‑салат	6 шт	\N	3.1	t
14	1196	Ролл «Маки мидии»	Хосомаки	Рис, нори, мидии, соус «Спайси»	6 шт	\N	3.1	t
14	1197	Ролл «Маки лосось»	Хосомаки	Рис, нори, лосось	6 шт	\N	4.7	t
14	1198	Ролл «Маки огурец»	Хосомаки	Рис, нори, огурец	6 шт	\N	2.4	t
14	1199	Гункан «Чукка» 	Гунканы	Рис, нори, чукка‑салат	1 шт	\N	1.6	t
14	1200	Гункан «Чиз угорь»	Гунканы	Рис, нори, угорь, сыр сливочный	1 шт	\N	2.2	t
14	1201	Гункан «Чиз лосось»	Гунканы	Рис, нори, лосось, сыр сливочный	1 шт	\N	1.7	t
14	1202	Гункан «Чиз креветка»	Гунканы	Рис, нори, креветка, сыр сливочный	1 шт	\N	1.9	t
14	1203	Гункан «Чиз икра»	Гунканы	Рис, нори, икра, сыр сливочный	1 шт	\N	2.3	t
14	1204	Гункан «Хот мидии»	Гунканы	Рис, нори, мидии, соус, сыр	1 шт	\N	1.8	t
14	1205	Гункан «Хот креветка»	Гунканы	Рис, нори, креветка, соус, сыр	1 шт	\N	2.1	t
14	1206	Гункан с масаго	Гунканы		1 шт	\N	1.7	t
14	1207	Гункан «Острый угорь»	Гунканы	Рис, нори, угорь, соус «Спайси»	1 шт	\N	2.2	t
14	1208	Гункан «Острый лосось»	Гунканы	Рис, нори, лосось, соус «Спайси»	1 шт	\N	1.7	t
14	1209	Гункан «Острый краб»	Гунканы	Рис, нори, мясо крабовое, соус «Спайси»	1 шт	\N	1.4	t
14	1210	Гункан «Острая креветка»	Гунканы	Рис, нори, креветка, соус «Спайси»	1 шт	\N	1.9	t
14	1211	Нигири «Угорь»	Нигири		1 шт	\N	2.4	t
14	1212	Нигири «Лосось»	Нигири		1 шт	\N	2	t
14	1213	Нигири «Креветка»	Нигири		1 шт	\N	2.2	t
14	1214	Суши-сет «Амур»	Суши-сеты	Ролл «Бонито» с тунцом, ролл «Хате маки», нигири «Лосось» 2 шт	16 шт	\N	16.5	t
14	1215	Суши-сет «Один дома»	Суши-сеты	1/2 ролла «Бонито», 1/2 ролла «Самурай», 1/2 ролла «Маки с тунцом», гункан «Острый краб», гункан «Острый лосось»	16 шт	\N	14.9	t
14	1216	Суши-сет «Сакура»	Суши-сеты	Ролл «Бонито» 1/2 ролла, ролл «Самурай» 1/2 ролла, ролл «Филадельфия» 1/2 ролла, ролл «Спайси хот с креветкой», 1/2 ролла «Филадельфия хот»	24 шт	\N	23.9	t
14	1217	Суши-сет «Искушение»	Суши-сеты	Ролл «Филадельфия», ролл «Дакота», ролл «Калифорния» с креветкой, ролл «Маки лосось»	30 шт	\N	30.9	t
14	1218	Суши-сет «Бостон»	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния» с кунжутом, ролл «Финляндия», нигири «Лосось» 2 шт	26 шт	\N	25.5	t
14	1219	Суши-сет «Азия»	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния», ролл «Хот Филадельфия», ролл «Канзас»	32 шт	\N	32.9	t
14	1220	Суши-сет «Жара»	Суши-сеты	Ролл «Эби хот», гункан «Хот лосось», гункан «Хот креветка»	20 шт	\N	23.9	t
14	1221	Суши-сет «Для двоих»	Суши-сеты	Ролл «Чиз Филадельфия», ролл «Маки лосось», ролл «Хате маки», ролл «Сырная креветка»	26 шт	\N	22	t
14	1222	Суши-сет «Хэппи»	Суши-сеты	Ролл «Чиз Филадельфия», ролл «Филадельфия», ролл «Филадельфия» с креветкой, ролл «Финляндия», ролл «Бонито»	48 шт	\N	51.5	t
14	1223	Суши-сет «Бонифаций»	Суши-сеты	Ролл «Филадельфия», ролл «Филадельфия» с масаго, ролл «Маки огурец», ролл «Калифорния плюс»	30 шт	\N	28.5	t
14	1224	Суши-сет «Мадагаскар»	Суши-сеты	Ролл «Монреаль», ролл «Чиз Филадельфия», ролл «Калифорния» с креветкой, ролл «Сёгун»	32 шт	\N	33.5	t
14	1225	Суши-сет «Запечённый» мини	Суши-сеты	Ролл «Феникс», гункан «Хот креветка», гункан «Хот угорь», гункан «Хот лосось», гункан «Хот мидии»	12 шт	\N	14.5	t
14	1226	Суши-сет «Бенефит»	Суши-сеты	Ролл «Монреаль», ролл «Хот с сыром», ролл «Хот крабс», ролл «Самурай», ролл «Филадельфия» с масаго, ролл «Дакота» с лососем	48 шт	\N	48.8	t
14	1227	Суши-сет «Касатка»	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния» с кунжутом, ролл «Калифорния плюс», ролл «Грин фиш»	32 шт	\N	29.9	t
14	1228	Суши-сет «Канада»	Суши-сеты	Ролл «Спайси хот с мидиями», ролл «Калифорния», ролл «Калифорния» с кунжутом, ролл «Амазонка»	32 шт	\N	29.9	t
14	1229	Суши-сет «Круиз»	Суши-сеты	Ролл «Монреаль», ролл «Маки огурец», ролл «Сырная креветка», ролл «Дакота» с лососем	28 шт	\N	26.3	t
14	1230	Суши-сет «Акита»	Суши-сеты	Ролл «Калифорния», ролл «Самурай», ролл «Монреаль»	24 шт	\N	23.9	t
14	1231	Суши-сет «Калифорнийский»	Суши-сеты	Ролл «Калифорния», ролл «Калифорния плюс», ролл «Калифорния» с кунжутом	24 шт	\N	22.5	t
14	1232	Суши-сет №1 мини	Суши-сеты	Ролл «Чиз Филадельфия», нигири «Креветка», гункан «Острый лосось»	10 шт	\N	11.9	t
14	1233	Суши-сет №2 мини	Суши-сеты	Ролл «Калифорния» с креветкой, ролл «Сырный лосось», гункан «Острый краб»	15 шт	\N	14.8	t
14	1234	Суши-сет №3 мини	Суши-сеты	Ролл «Филадельфия», нигири «Лосось», гункан «Острый лосось»	12 шт	\N	14.9	t
14	1235	Суши-сет №4 мини	Суши-сеты	Ролл «Калифорния», ролл «Канзас», гункан «Острый краб»	17 шт	\N	18.4	t
14	1236	Суши-сет №5 мини	Суши-сеты	Ролл «Филадельфия», ролл «Дакота», нигири «Лосось», нигири «Угорь»	12 шт	\N	16.8	t
14	1237	Суши-сет №6 мини	Суши-сеты	Ролл «Канзас», ролл «Амазонка»	16 шт	\N	17.9	t
14	1238	Суши-сет «Лава»	Суши-сеты	Хот с лососем, кампай, гункан хот креветка, гункан хот лосось		\N	23	t
14	1239	Суши-сет «Касуми»	Суши-сеты	Филадельфия, калифорния плюс, тибет, маки огурец		\N	33.6	t
14	1240	Суши-сет «Камчатка»	Суши-сеты	Филадельфия с тунцом, бонито ½, самурай ½, хате маки, маки с тунцом	28 г	\N	33	t
14	1241	Васаби 	Японский гарнир и соусы		10 г	\N	0.3	t
14	1242	Имбирь	Японский гарнир и соусы		30 г	\N	0.6	t
14	1243	Соус кунжутный	Японский гарнир и соусы		50 г	\N	1.5	t
14	1244	Соус соевый	Японский гарнир и соусы		50 г	\N	0.6	t
14	1245	Соус «Спайси» 	Японский гарнир и соусы		50 г	\N	1.2	t
14	1246	Соус «Унаги» 	Японский гарнир и соусы		50 г	\N	1.2	t
14	1247	Соус фирменный чесночный	Японский гарнир и соусы		60 мл	\N	1.2	t
14	1248	Соус Heinz «Барбекю»	Японский гарнир и соусы		25 мл	\N	0.6	t
14	1249	Соус Heinz кисло‑сладкий	Японский гарнир и соусы		25 мл	\N	0.6	t
14	1250	Соус Астория сырный	Японский гарнир и соусы		25 мл	\N	0.6	t
14	1251	Ролл «Банановый маки»	Десерты	Сыр сливочный, банан, стружка кокосовая, топинг шоколадный	8 шт	\N	6.5	t
14	1252	Ролл «Яблочный маки»	Десерты	Сыр сливочный, яблоко, стружка кокосовая, джем ягодный	8 шт	\N	5.9	t
14	1253	Газированный напиток Coca‑Cola	Напитки		1000 мл	\N	2.2	t
14	1254	Газированный напиток Fanta	Напитки		1000 мл	\N	2.2	t
14	1255	Газированный напиток Sprite	Напитки		1000 мл	\N	2.2	t
15	1256	Комбо №2	Комбо	Три любые пиццы 33 см /укажите в комментарии/ + напиток Coca Cola 1500 мл в подарок	3шт.	\N	40.9	t
15	1257	Комбо №3	Комбо	Пять любых пицц 33 см /укажите в комментарии/ + напиток Coca Cola 2000 мл в подарок	5шт.	\N	60.9	t
15	1258	Пицца «Греческая»	Пиццы	Паста томатная, сыр «Моцарелла», помидоры, ветчина, перец сладкий, лук красный, сыр «Фета», маслины	25см	\N	10	t
15	1259	Пицца «Фаст»	Пиццы	Соус томатный, помидоры, сыр «Моцарелла», корнишоны, шампиньоны, филе куриное, бекон, соус сырный	25см	\N	10.4	t
15	1260	Пицца «Мясная»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, грудинка, салями, ветчина, колбаски имбирные, маслины	25см	\N	11.4	t
15	1261	Пицца «Мексиканская»	Пиццы	Соус томатный, соус «Халапеньо», сыр «Моцарелла», помидоры, лук, шампиньоны, ветчина, филе курииное	25см	\N	9.4	t
15	1262	Пицца «Четыре сезона»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, шампиньоны, лук красный, перец сладкий, салями, бекон, маслины	25см	\N	10.4	t
15	1263	Пицца «Американская»	Пиццы	Соус томатный, сыр «Моцарелла», оливки, перец, филе куриное, соус кисло‑сладкий, бекон	25см	\N	10.4	t
15	1264	Пицца «Ветчина и грибы»	Пиццы	Соус томатный, сыр «Моцарелла», ветчина, шампиньоны, фасоль стручковая	25см	\N	9.4	t
15	1265	Пицца «Овощная»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, перец сладкий, шампиньоны, маслины, оливки, фасоль спаржевая	25см	\N	8.4	t
15	1266	Пицца «Барбекю»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, грудинка, шампиньоны, перец сладкий, лук красный, соус «Барбекю»	25см	\N	10.4	t
15	1267	Пицца «Маргарита»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, орегано	25см	\N	7	t
15	1268	Пицца «Гавайская»	Пиццы	Соус томатный, сыр «Моцарелла», помидоры, филе куриное, ветчина, ананас	25см	\N	10.4	t
15	1269	Пицца «Пеперони»	Пиццы	Соус томатный, сыр «Моцарелла», пеперони	25см	\N	8.4	t
15	1270	Пицца «Цезарь»	Пиццы	Соус томатный, сыр «Моцарелла», филе куриное, салат «Айсберг», сыр «Пармезан», помидоры, соус «Цезарь»	25см	\N	9.4	t
15	1271	Пицца «Чикен Блю»	Пиццы	Соус томатный, сыр «Моцарелла», филе куриное, шампиньоны, бекон, помидоры, сыр «Дорблю»	25см	\N	10.4	t
15	1272	Пицца «Четыре сыра»	Пиццы	Соус томатный, сыр «Моцарелла», сыр «Чеддер», сыр «Дорблю», сыр «Джюгас»	25см	\N	11.4	t
15	1273	Ролл «Фаст»	Ролл	Помидоры, ветчина, филе куриное, огурец солёный, бекон, соус сырный, соус чесночный, сыр «Чеддер», капуста, тортилья	280 г	\N	6.9	t
15	1274	Ролл «Греческий»	Ролл	Капуста, помидоры, перец, маслины, огурец, масло оливковое, сыр «Фета», тортилья	210 г	\N	5.9	t
15	1275	Ролл «Мексиканский»	Ролл	Соус томатный, капуста, помидоры, сыр «Чеддер», филе куриное, лук красный, перец халапеньо, ветчина, тортилья	230 г	\N	6.9	t
15	1276	Ролл «Цезарь»	Ролл	Капуста, помидоры, филе куриное, оливки, сыр «Джюгас», соус «Цезарь», тортилья	230 г	\N	5.9	t
15	1277	Ролл «Баварский»	Ролл	Капуста, перец, филе куриное, сыр «Моцарелла», колбаски, соус «Цезарь», горчица, тортилья	220 г	\N	5.9	t
15	1278	Ролл «Барбекю»	Ролл	Капуста, помидоры, бекон, лук красный, ветчина, соус «Барбекю», тортилья	240 г	\N	6.9	t
15	1279	Сэндвич «Мясной»	Сэндвичи	Булка тостовая, сыр «Моцарелла», ветчина, колбаса ветчинная, огурцы маринованные, бекон, соус «Барбекю»	130 г	\N	2.9	t
15	1280	Сэндвич «Чеддер»	Сэндвичи	Булка тостовая, сыр «Чеддер», колбаски «Охотничьи», салями, огурцы маринованные, соус «Цезарь»	120 г	\N	2.9	t
15	1281	Сэндвич «Деревенский»	Сэндвичи	Булка тостовая, филе куриное, огурец, соус горчичный, соус сырный	100 г	\N	2.9	t
15	1282	Салат «Греческий»	Салаты	Салат, помидоры, огурец, перец, лук красный, маслины, сыр «Фета», заправка	260 г	\N	6.5	t
15	1283	Салат «Цезарь»	Салаты	Салат, помидоры, копчено-вареное филе куриное, сыр «Джюгас», гренки, соус «Цезарь»	180 г	\N	6.2	t
15	1284	Картофель фри	Закуски		стандарт	\N	2.5	t
15	1285	Картофель «По‑деревенски»	Закуски		150 г	\N	3.2	t
15	1286	Наггетсы 	Закуски		6 шт	\N	5	t
15	1287	Соус Heinz «Барбекю»	Топинг			\N	1	t
15	1288	Соус Heinz горчичный	Топинг			\N	1	t
15	1289	Соус Heinz сырный	Топинг			\N	1	t
15	1290	Соус Heinz томатный	Топинг			\N	1	t
15	1291	Соус Heinz чесночный	Топинг			\N	1	t
15	1292	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.5	t
15	1293	Напиток газированный Fanta	Напитки		500 мл	\N	2.5	t
15	1294	Напиток газированный Sprite	Напитки		500 мл	\N	2.5	t
15	1295	Вода питьевая BonAqua	Напитки		500 мл	\N	1.8	t
15	1296	Сок «Добрый»	Напитки		200 мл	\N	2	t
16	1297	Попкорн	Попкорн			\N	8	t
16	1298	Just-бургер	Бургеры	Булочка, соус «Терияки», ананас, котлета говяжья, сыр «Чеддер», помидоры, лук		\N	4.6	t
16	1299	Бургер «Макси чикен»	Бургеры	Булочка, котлета куриная, лук сушёный жареный, салат «Айсберг», помидоры, сыр «Чеддер», соус «Барбекю»	mini	\N	4.5	t
16	1300	Бургер «Чикен тайм»	Бургеры	Булочка, салат «Айсберг», помидоры, огурцы маринованные, соус «Цезарь», соус сырный, котлета куриная		\N	3.2	t
16	1301	Бургер «Чикен хит»	Бургеры	Булочка, лук сушёный жареный, салат «Айсберг», помидоры, майонез, котлета куриная		\N	3.2	t
16	1302	Фиш-бургер	Бургеры	Булочка, огурцы маринованные, сыр «Чеддер», салат «Айсберг», соус «Тар-тар», котлета рыбная		\N	5.8	t
16	1303	Чикенбургер	Бургеры	Булочка, салат «Айсберг», соус чесночный, котлета куриная		\N	2.2	t
16	1304	Двойной чизбургер	Бургеры	Булочка, соус горчичный, кетчуп, огурцы маринованные, сыр «Чеддер», котлета говяжья, сыр «Чеддер», котлета говяжья		\N	4	t
16	1305	Биф-бургер	Бургеры с говядиной	Булочка, сыр «Чеддер», помидоры, салат «Айсберг», майонез, котлета говяжья		\N	3.9	t
16	1306	Гамбургер	Бургеры с говядиной	Булочка, соус горчичный, кетчуп, огурцы маринованные, котлета говяжья		\N	2	t
16	1307	Чизбургер	Бургеры с говядиной	Булочка, соус горчичный, кетчуп, огурцы маринованные, сыр «Чеддер», котлета говяжья		\N	2.2	t
16	1308	Бургер «Атлет»	Бургеры с говядиной	Булочка, сыр «Чеддер», соус горчичный, яйца, огурцы маринованные, котлета говяжья, кетчуп	mini	\N	3.9	t
16	1309	Бургер «Грибной»	Бургеры с говядиной	Булочка, соус грибной, шампиньоны, огурец, помидоры, котлета говяжья, салат «Айсберг»	mini	\N	3.7	t
16	1310	Бургер «Шеф‑гриль»	Бургеры с говядиной	Булочка, сыр «Чеддер», помидоры, кетчуп, салат «Айсберг», огурцы маринованные, лук красный, соус чесночный, котлета говяжья	mini	\N	4.3	t
16	1311	Пицца «Бабулина»	Пиццы	Томатная основа, соус чесночный, сыр «Моцарелла», охотничьи колбаски, сервелат, красный лук, огурцы маринованные, специи и картофельные дольки	24 см	\N	10.1	t
16	1312	Пицца «Гавайская»	Пиццы	Сливочная основа, сыр «Моцарелла», сыр дорблю, маринованное куриное бедро, свежая груша, ананас, руккола	24 см	\N	9.1	t
16	1313	Пицца «Бавария»	Пиццы	Основа томатная, сыр «Моцарелла», колбаски «Охотничьи», сервилат «Пражский», шампиньоны, перец, вырезка свиная, помидоры, оливки/маслины	24 см	\N	10.3	t
16	1314	Пицца «Четыре вкуса»	Пиццы	Основа томатная, сыр «Моцарелла», креветки, мидии, шампиньоны, ветчина	24 см	\N	9.2	t
16	1315	Пицца «Гавайская»	Пиццы		24 см	\N	9.1	t
16	1316	Пицца «Барбекю»	Пиццы	Основа томатная, сыр «Моцарелла», вырезка свиная, бекон, соус «Барбекю», шампиньоны, помидоры	24 см	\N	8.5	t
16	1317	Пицца «Ветчина и грибы»	Пиццы	Основа томатная, соус сливочно-грибной, сыр «Моцарелла», шампиньоны, ветчина, базилик	24 см	\N	6.4	t
16	1318	Пицца «Нова»	Пиццы	Основа томатная, сыр «Моцарелла», курица жареная, шампиньоны, бекон, руккола, помидоры черри	24 см	\N	7.8	t
16	1319	Пицца «Пеперони»	Пиццы	Тесто, основа томатная, сыр «Моцарелла», помидоры, салями острая	24 см	\N	8.1	t
16	1320	Пицца «Пять сыров»	Пиццы	Основа томатная, сыр «Моцарелла», сыр «Пармезан», сыр «Дорблю», сыт творожный, сыр «Чеддер»	24 см	\N	6.9	t
16	1321	Пицца «Маргарита»	Пиццы		24 см	\N	6.1	t
16	1322	Биф-ролл	Шаурма	Тортьлья, котлета говяжья, майонез, салат «Айсберг», соус «Барбекю», помидоры		\N	6	t
16	1323	Фиш-ролл	Шаурма	Тортьлья, соус чесночный, котлета рыбная, огурцы маринованные, сыр «Чеддер», салат «Айсьерг», соус «Терияки»		\N	5.8	t
16	1324	Чикен-ролл	Шаурма	Тортьлья, котлета куриная, салат «Айсберг», сыр «Пармезан», помидоры, соус «Цезарь»		\N	6	t
16	1325	Чиз-ролл	Шаурма	Тортилья, майонез, кетчуп, салат «Айсберг», ветчина, котлета куриная, помидоры, соус сырный	245 г	\N	6	t
16	1326	Картофель фри	Закуски		средняя	\N	2.3	t
16	1327	Картофель «По‑деревенски»	Закуски			\N	2.6	t
16	1328	Наггетсы 	Закуски		4 шт	\N	3.1	t
16	1329	Крылышки «Баффало»	Закуски		3 шт	\N	4.2	t
16	1330	Креветки	Закуски		7 шт	\N	6.3	t
16	1331	Кольца луковые	Закуски		6шт	\N	3.2	t
16	1332	Сырные палочки	Закуски		5 шт	\N	4.9	t
16	1333	Салат «Летний»	Салаты	Салат «Айсберг», ветчина, огурец, кукуруза, перец, майонез, зелень		\N	4.9	t
16	1334	Салат «Сытный»	Салаты	Салат «Айсберг», огурец, помидоры черри, ветчина, салями сырокопчёная, соус чесночный		\N	5.9	t
16	1335	Салат «Греческий»	Салаты	Салат «Айсберг», огурец, перец, помидоры черри, маслины, оливки, лук, сыр «Фета», масло оливковое		\N	5.6	t
16	1336	Салат «Цезарь»	Салаты	Салат «Айсберг», филе куриное, сухарики, помидоры черри, сыр «Пармезан», соус «Цезарь»		\N	6	t
16	1337	Салат «Каприз»	Салаты	Руккола, сыр «Моцарелла», помидоры черри, заправка со специями		\N	6.1	t
16	1338	Торт «Ягодный микс» (один кусочек)	Десерты			\N	3.5	t
16	1339	Торт «Нежность» (один кусочек)	Десерты			\N	3.5	t
16	1340	Торт «Морковный» (один кусочек)	Десерты			\N	3.5	t
16	1341	Торт «Графские развалины» (один кусочек)	Десерты			\N	3.5	t
16	1342	Вишнёвый пирог (один кусочек)	Десерты			\N	3	t
16	1343	Круассан	Десерты			\N	2.5	t
16	1344	Торт «Ягодный микс»	Торты и пироги	Вы можете приобрести целый пирог по предварительному заказу за день		\N	25	t
16	1345	Торт «Нежность»	Торты и пироги	Вы можете приобрести целый пирог по предварительному заказу за день		\N	30	t
16	1346	Торт «Морковный»	Торты и пироги	Вы можете приобрести целый пирог по предварительному заказу за день		\N	22	t
16	1347	Торт «Графские развалины»	Торты и пироги	Вы можете приобрести целый пирог по предварительному заказу за день		\N	25	t
16	1348	Вишнёвый пирог	Торты и пироги	Вы можете приобрести целый пирог по предварительному заказу за день		\N	20	t
16	1349	Соус Heinz «Барбекю»	Топинг			\N	0.7	t
16	1350	Соус Heinz горчичный	Топинг			\N	0.7	t
16	1351	Соус Heinz «Карри»	Топинг			\N	0.7	t
16	1352	Соус Heinz кисло‑сладкий	Топинг			\N	0.7	t
16	1353	Соус Heinz «Сальса»	Топинг			\N	0.7	t
16	1354	Соус Heinz «Терияки» 	Топинг			\N	0.7	t
16	1355	Соус Heinz томатный	Топинг			\N	0.7	t
16	1356	Соус Heinz «Цезарь»	Топинг			\N	0.7	t
17	1357	Сет «Новогодний-мини»	Акция	Пицца «Мандаринка» 40 см + напиток «Кока-кола» 1 л в подарок	1100 г	\N	22.9	t
17	1358	Сет «Новогодний»	Акция	Пицца «Мандаринка» 50 см + напиток «Кока-кола» 1 л в подарок	1800 г	\N	32.9	t
17	1359	Сет «Пиццатый»	Акция	Пицца «Новогодняя» 40 см + пицца «Ёлки-палки» 25 см + напиток «Кока-кола» 1 л в подарок	2200 г	\N	30.9	t
17	1420	Ролл «Омура»	Сложные роллы	Мидии, огурец, сыр «Филадельфия», рис, нори	250 г 8 шт	\N	6.9	t
17	1360	Суши-сет «Огонёк»	Акция	Ролл «Кокс», ролл «Чико» с лососем, запечённый ролл с мидией «Макси», запечённый ролл с курицей «Макси»	1220 г	\N	33.9	t
17	1361	Суши-сет «Огонёк 2.0»	Акция	Ролл «Кокс», ролл «Чико» с лососем, запечённый ролл с мидией «Биг», запечённый ролл с курицей «Биг» + напиток «Кока-кола» 1л в подарок	1220 г	\N	35.9	t
17	1362	Пицца «Мандаринка»	Пиццы	Карбонад, сыр «Моцарелла», филе куриное копчёнка, мандарины, петрушка	40 см 1100	\N	20.9	t
17	1363	Пицца «Аль‑Каппоне»	Пиццы	Салями, сервелат, колбаски «Охотничьи», помидор, шампиньоны, перец болгарский, соленый огурец, петрушка, сыр «Моцарелла», тесто, паста томатная	30 см 687	\N	13.9	t
17	1364	Пицца «Аргентинская»	Пиццы	Креветка, ветчина, сервелат, помидоры, шампиньоны, маслины, сыр «Моцарелла», тесто, паста томатная	30 см 690	\N	15.9	t
17	1365	Пицца «Баварская»	Пиццы	Салями, бекон, сервелат, колбаски «Охотничьи», грибы, сыр, огурец солёный, помидоры	30 см 680	\N	13.9	t
17	1366	Пицца «Барбекю»	Пиццы	Ветчина, салями, карбонад, колбаски «Охотничьи», помидор, перец болгарский, сыр «Моцарелла», тесто, паста томатная	30 см 760 	\N	13.9	t
17	1367	Пицца «Барселона»	Пиццы	Бекон, сервелат, помидор, шампиньоны, кукуруза, брокколи, маслины, сыр «Креметте», сыр «Моцарелла», тесто, паста томатная	30 см 680	\N	13.9	t
17	1368	Пицца «Вегетарианская»	Пиццы	Помидор, шампиньоны, кукуруза, брокколи, спаржа, перец болгарский, маслины, сыр «Моцарелла», тесто, паста томатная	30 см 680	\N	13.4	t
17	1369	Пицца «Ветчина и грибы»	Пиццы	Ветчина, шампиньоны, соус томатный фирменный, сыр «Моцарелла»	30 см 675	\N	13.4	t
17	1370	Пицца «Гавайская»	Пиццы	Ветчина, филе цыплёнка, ананас, помидоры, сыр «Моцарелла»	30 см 680	\N	13.9	t
17	1371	Пицца «Гриль»	Пиццы	Ветчина, сервелат, бекон, колбаски «Охотничьи», помидор, шампиньоны, маслины, сыр «Моцарелла», тесто, паста томатная	30 см 712	\N	13.9	t
17	1372	Пицца «Деревенская»	Пиццы	Сервелат, бекон, карбонад, шампиньоны, соленые огурцы, лук зелёный перо, лук красный, базилик, сыр «Моцарелла», тесто, паста томатная	30 см 678	\N	14.4	t
17	1373	Пицца «Дьябло»	Пиццы	Бекон, салями, ветчина, халапеньо, сыр «Моцарелла», перец красныйострый, тесто, паста томатная	30 см 681	\N	14.9	t
17	1374	Пицца «Казацкая»	Пиццы	Ветчина, салями, филе куриное, колбаски «Охотничьи», шампиньоны, оливки, петрушка, сыр «Моцарелла», тесто, паста томатная	30 см 700	\N	14.4	t
17	1375	Пицца «Кантри»	Пиццы	Ветчина, салями, карбонад, шампиньоны, сыр «Моцарелла», тесто, паста томатная	30 см 686	\N	14.4	t
17	1376	Пицца «Маргарита»	Пиццы	Помидоры, сыр «Пармезан», сыр «Моцарелла», соус томатный фирменный	30 см 620	\N	13.4	t
17	1377	Пицца «Морская»	Пиццы	Креветка, мидии, кальмар, лосось, снежный краб имитация, помидоры, маслины, лимон, укроп, сыр «Моцарелла», тесто, паста томатная	30 см 683	\N	17.9	t
17	1378	Пицца «Пеперони»	Пиццы	Салями, сыр «Моцарелла», тесто, паста томатная	30 см 620	\N	14.4	t
17	1379	Пицца «Семейная»	Пиццы	Ветчина, бекон, колбаски «Охотничьи», помидоры, шампиньоны, каперсы, сыр «Моцарелла», сыр «Фета», тесто, паста томатная	30 см 686	\N	14.4	t
17	1380	Пицца «Студенческая»	Пиццы	Ветчина, сервелат, помидоры, шампиньоны, перец болгарский, сыр «Моцарелла», тесто, паста томатная	30 см 695	\N	13.4	t
17	1381	Пицца «Суприм»	Пиццы	Салями, карбонад, филе куриное, шампиньоны, перец болгарский, лук красный, сыр «Моцарелла», сыр «Пармезан», чеснок сушеный, петрушка, тесто, паста томатная	30 см 695	\N	14.9	t
17	1382	Пицца «Фирменная»	Пиццы	Ветчина, бекон, карбонад, шампиньоны, помидоры, перец болгарский, маслины, сыр «Моцарелла», сыр «Фета», тесто, паста томатная	30см г 705	\N	14.9	t
17	1383	Пицца «Цезарь»	Пиццы	Филе куриное, помидоры, салат, помидоры черри, сыр «Моцарелла», сыр «Пармезан», сыр «Фета», тесто, паста томатная	30 см 700	\N	14.4	t
17	1384	Пицца «Цыплёнок цыпа»	Пиццы	Ветчина, филе куриное, помидор, перец болгарский, халапеньо, сыр «Моцарелла», сыр «Пармезан», сыр «Креметте», тесто, паста томатная	30 см 700	\N	13.9	t
17	1419	Ролл «Кайган»	Сложные роллы	Лосось, снежный краб /имитация/, помидоры, сыр «Филадельфия», рис, нори	255 г 8 шт	\N	7.9	t
17	1385	Пицца «Четыре сезона»	Пиццы	Ветчина, салями, филе куриное, шампиньоны, помидоры черри, ананасы, маслины, сыр «Моцарелла», сыр «Фета», тесто, паста томатная	30 см 665	\N	14.4	t
17	1386	Пицца «Четыре сыра»	Пиццы	Сыр «Моцарелла», сыр «Пармезан», сыр «Креметте», сыр «Фета», тесто, паста томатная	30 см 585	\N	13.4	t
17	1387	Пицца «Чили»	Пиццы	Бекон, салями, филе куриное, колбаски «Охотничьи», халапеньо, лук красный, помидоры черри, сыр «Моцарелла», тесто, паста томатная	30 см 690	\N	14.9	t
17	1388	Маки с огурцом	Простые роллы	Огурец, кунжут, рис, нори	145 г 6 шт	\N	2.7	t
17	1389	Маки с авокадо	Простые роллы	Авокадо, рис, нори	145 г 8 шт	\N	3.7	t
17	1390	Маки с лососем	Простые роллы	Лосось, рис, нори	145 г 6 шт	\N	6.4	t
17	1391	Маки с тунцом	Простые роллы	Тунец, рис, нори	145 г 8 шт	\N	6.4	t
17	1392	Маки с креветкой «Спайси» 	Простые роллы	Креветка, соус «Спайси», рис, нори	150 г 8 шт	\N	6.4	t
17	1393	Маки «Филадельфия»	Простые роллы	Лосось, сыр «Филадельфия», рис, нори	150 г 8 шт	\N	6.4	t
17	1394	Маки с масляной рыбой	Простые роллы	Масляная рыба, сыр «Филадельфия», рис, нори	145 г 8 шт	\N	6.4	t
17	1395	Маки с сыром	Простые роллы	Сыр «Филадельфия», икра масаго, салат «Чукка», рис, нори	145 г 8 шт	\N	5.9	t
17	1396	Маки с курицей	Простые роллы	Копченая курица, рис, нори	145 г 8 шт	\N	5.4	t
17	1397	Маки с мидией	Простые роллы	Мидии, рис, нори	145 г 8 шт	\N	5.4	t
17	1398	Ролл «Аляска»	Сложные роллы	Лосось, креветка, сыр «Филадельфия», огурец, рис, нори	265 г 8 шт	\N	10.9	t
17	1399	Ролл «Black Star»	Сложные роллы	Угорь, сыр «Филадельфия», огурец, икра масаго, рис, нори	265 г 8 шт	\N	13.9	t
17	1400	Ролл «Бонито»	Сложные роллы	Лосось, сыр «Филадельфия», огурец, икра масаго, стружка тунца, рис, нори	260 г 8 шт	\N	10.9	t
17	1401	Ролл «Бонито магуро»	Сложные роллы	Тунец, сыр «Филадельфия», огурец, лук зелёный перо, соус «Спайси», икра масаго, лук стружка тунца, рис, нори	270 г 8 шт	\N	10.9	t
17	1402	Ролл «Калифорния»	Сложные роллы	Снежный краб /имитация/, сыр «Филадельфия», огурец, икра масаго, рис, нори	275 г 8 шт	\N	8.9	t
17	1403	Ролл «Калифорния эби»	Сложные роллы	Креветка, сыр «Филадельфия», авокадо, икра масаго, рис, нори	275 г 8 шт	\N	12.4	t
17	1404	Ролл «Калифорния» с лососем	Сложные роллы	Лосось, сыр «Филадельфия», огурец, икра масаго, рис, нори	275 г 8 шт	\N	12.4	t
17	1405	Ролл «Канада чиз»	Сложные роллы	Угорь, сыр «Филадельфия», огурец, соус «Унаги», кунжут, рис, нори	270 г 8 шт	\N	12.4	t
17	1406	Ролл «Канада» с лососем	Сложные роллы	Угорь, лосось, сыр «Филадельфия», огурец, соус «Унаги», кунжут, рис, нори	270 г 8 шт	\N	13.9	t
17	1407	Ролл «Сёгун»	Сложные роллы	Лосось, сыр «Филадельфия», огурец, кунжут, рис, нори	260 г 8 шт	\N	9.4	t
17	1408	Ролл «Филадельфия»	Сложные роллы	Лосось, сыр «Филадельфия», огурец, рис, нори	285 г 8 шт	\N	10.9	t
17	1409	Ролл «Филадельфия классик»	Сложные роллы	Лосось, сыр «Филадельфия», рис, нори	285 г 8 шт	\N	10.9	t
17	1410	Ролл «Филадельфия эби»	Сложные роллы	Лосось, креветка, огурец, сыр «Филадельфия», рис, нори	285 г 8 шт	\N	12.9	t
17	1411	Ролл «Филадельфия VIP»	Сложные роллы	Лосось, авокадо, сыр «Филадельфия», икра масаго, рис, нори	285 г 8 шт	\N	12.9	t
17	1412	Ролл «Филадельфия грин»	Сложные роллы	Копченая курица, огурец, сыр «Филадельфия», укроп, рис, нори	265 г 8 шт	\N	6.9	t
17	1413	Ролл «Фирменный»	Сложные роллы	Лосось, креветка, огурец, сыр «Филадельфия», икра масаго, рис, нори	275 г 8 шт	\N	11.4	t
17	1414	Ролл «Техас»	Сложные роллы	Бекон, помидоры, огурец, перец болгарский, сыр «Филадельфия», соус «Терияки», рис, нори	290 г 8 шт	\N	7.4	t
17	1415	Ролл «Фьюжн» 	Сложные роллы	Курица копченая, огурец, сыр «Филадельфия», икра масаго, кунжут, рис, нори	280 г 8 шт	\N	7.9	t
17	1416	Ролл «Ямамото»	Сложные роллы	Лосось, чукка-салат, апельсин, сыр «Филадельфия», рис, нори	260 г 8 шт	\N	7.9	t
17	1417	Ролл «Нобутада»	Сложные роллы	Лосось, огурец, сыр «Филадельфия», икра масаго, рис, нори	250 г 8 шт	\N	8.4	t
17	1418	Ролл «Туна»	Сложные роллы	Тунец, авокадо, сыр «Филадельфия», рис, нори	255 г 8 шт	\N	7.9	t
17	1421	Ролл «Весенний»	Сложные роллы	Лосось, помидоры, сыр «Филадельфия», икра масаго, рис, нори	275 г 8 шт	\N	10.9	t
17	1422	Ролл «Чизик»	Сложные роллы	Курица копченая, перец, сыр «Чеддер», сыр «Филадельфия», икра масаго, рис, нори	290 г 8 шт	\N	8.4	t
17	1423	Ролл «Снежный»	Сложные роллы	Масляная рыба, авокадо, сыр «Филадельфия», икра масаго, рис, нори	290 г 8 шт	\N	12.4	t
17	1424	Ролл «Королевский»	Сложные роллы	Креветка королевская, лосось опаленный, авокадо, сыр «Филадельфия», рис, нори	310 г 8 шт	\N	14.9	t
17	1425	Ролл «Филадельфия Hot»	Сложные роллы	Лосось опаленный, огурец, сыр «Филадельфия», икра масаго, соус «Ким-чи», лук перо, рис, нори	300 г 8 шт	\N	12.4	t
17	1426	Ролл «Вулкан Hot»	Сложные роллы	Тунец опаленный, карбонад, лук перо, сыр «Филадельфия», икра масаго, рис, нори	285 г 8 шт	\N	10.9	t
17	1427	Ролл «Техас Hot»	Сложные роллы	Бекон опаленный, курица копченая, перец болгарский, лук перо, сыр «Филадельфия», соус «Ким‑Чи», рис, нори	295 г 8 шт	\N	7.9	t
17	1428	Ролл «Акари»	Сложные роллы	Креветка королевская, огурец, сыр «Филадельфия», икра масаго, соус «Терияки», рис, нори	300 г 8 шт	\N	12.9	t
17	1429	Ролл «Чико»	Сложные роллы	Креветка королевская, чукка-салат, сыр «Филадельфия», кунжут, соус «Кунжутный», рис, нори	290 г 8 шт	\N	11.9	t
17	1430	Ролл «Асахи»	Сложные роллы	Угорь, огурец, сыр «Филадельфия», кунжут, соус «Унаги», рис, нори	260 г 8 шт	\N	12.4	t
17	1431	Ролл «Калифорния магуро»	Сложные роллы	Тунец, огурец, авокадо, сыр «Филадельфия», икра масаго, рис, нори	275 г 8 шт	\N	11.9	t
17	1432	Запечённый ролл «Тайский»	Запечённые роллы	Лосось, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	350 г 8 шт	\N	10.9	t
17	1433	Запечённый ролл «Нихонго»	Запечённые роллы	Мидии, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	350 г 8 шт	\N	9.4	t
17	1434	Запечённый ролл «Бостон»	Запечённые роллы	Тунец, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	350 г 8 шт	\N	10.9	t
17	1435	Запечённый ролл «Тори»	Запечённые роллы	Креветка, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	350 г 8 шт	\N	11.4	t
17	1436	Запечённый ролл «Киото»	Запечённые роллы	Курица копченая, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	350 г 8 шт	\N	8.9	t
17	1437	Запечённый ролл «Атлантида»	Запечённые роллы	Угорь, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	13.9	t
17	1438	Запечённый ролл «Ханаки»	Запечённые роллы	Лосось, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	11.4	t
17	1439	Запечённый ролл «Касси»	Запечённые роллы	Снежный краб /имитация/, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	9.4	t
17	1440	Запечённый ролл «Неги Торо»	Запечённые роллы	Лосось, креветка, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	11.4	t
17	1441	Запечённый ролл «Харичи»	Запечённые роллы	Лосось, тунец, огурец, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	11.4	t
17	1442	Запечённый ролл «Самурай»	Запечённые роллы	Тунец, авокадо, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	11.4	t
17	1443	Запечённый ролл «Америка»	Запечённые роллы	Креветка, авокадо, сыр «Филадельфия», фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	355 г 8 шт	\N	11.9	t
17	1444	Запечённый ролл «Сливочный»	Запечённые роллы	Лосось, огурец, сыр «Филадельфия», фирменная сырная шапка, икра масаго, соус «Унаги», кунжут, рис, нори	365 г 8 шт	\N	12.4	t
17	1445	Запечённый ролл «Окинава»	Запечённые роллы	Креветка, огурец, сыр «Филадельфия», фирменная сырная шапка, икра масаго, соус «Унаги», кунжут, рис, нори	365 г 8 шт	\N	12.9	t
17	1446	Запечённый ролл «Катана»	Запечённые роллы	Угорь, огурец, сыр «Филадельфия», фирменная сырная шапка, икра масаго, соус «Унаги», кунжут, рис, нори	365 г 8 шт	\N	14.9	t
17	1447	Запечённый ролл «Шанхай»	Запечённые роллы	Тунец, авокадо, сыр «Филадельфия», фирменная сырная шапка, икра масаго, соус «Унаги», кунжут, рис, нори	365 г 8 шт	\N	12.4	t
17	1448	Запечённый ролл с лососем	Запечённые роллы	Лосось, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.9	t
17	1449	Запечённый ролл с тунцом	Запечённые роллы	Тунец, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.9	t
17	1450	Запечённый ролл с креветкой	Запечённые роллы	Креветка, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.9	t
17	1451	Запечённый ролл с кальмаром	Запечённые роллы	Кальмар, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.9	t
17	1452	Запечённый с курицей	Запечённые роллы	Кальмар, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.4	t
17	1453	Запечённые с мидией	Запечённые роллы	Мидии, фирменная сырная шапка, соус «Унаги», кунжут, рис, нори	250 г 8 шт	\N	7.4	t
17	1454	Суши-сет «Ассорти»	Суши-сеты	Ролл «Фирменный», ролл «Сёгун», ролл «Филадельфия Грин», ролл «Калифорния», Маки с креветкой «Спайси», Маки с лососем, Маки с огурцом	1490 г 50 шт	\N	45.9	t
17	1455	Суши-сет «Большой запечённый»	Суши-сеты	Ролл «Шанхай», ролл «Касси», ролл «Атлантида», ролл «Тайский», ролл «Тори», ролл «Нихонго»	2130 г 64 шт	\N	61.9	t
17	1456	Суши-сет «Гурман»	Суши-сеты	Ролл «Филадельфия», ролл «Калифорния», ролл «Тайский», ролл «Тори»	1250 г 32 шт	\N	37.9	t
17	1457	Суши-сет «Затойчи»	Суши-сеты	Ролл «Филадельфия», ролл «Весенний», ролл «Ямамото», ролл «Сёгун»	1080 г 32 шт	\N	35.9	t
17	1458	Суши-сет «Калифорния»	Суши-сеты	Ролл «Калифорния», ролл «Сёгун», ролл «Тайский», ролл «Тори»	1230 г 32 шт	\N	36.9	t
17	1459	Суши-сет «Микс»	Суши-сеты	Ролл «Бонито», ролл «Филадельфия», ролл «Канада чиз»	820 г 24 шт	\N	33.9	t
17	1460	Суши-сет «Филадельфия»	Суши-сеты	Ролл «Филадельфия», ролл «Филадельфия Классик», ролл «Филадельфия Эби»	845 г 24 шт	\N	32.9	t
17	1461	Суши-сет «Летний хит»	Суши-сеты	Ролл «Калифорния», ролл «Филадельфия грин», ролл «Весенний»	810 г 24 шт	\N	24.9	t
17	1462	Суши-сет «Мацукэ»	Суши-сеты	Ролл «Бонито», ролл «Весенний», ролл «Бостон», ролл «Касси»	1240 г 32 шт	\N	37.9	t
17	1463	Суши-сет «Микс»	Суши-сеты	Бонито, Филадельфия, Канада Чиз	820 г 24 шт	\N	33.9	t
17	1464	Суши-сет «Фирменный»	Суши-сеты	Ролл «Фирменный», ролл «Филадельфия», ролл «Бонито», ролл «Сёгун», ролл «Тори», ролл «Нихонго», ролл «Самурай», ролл «Сливочный»	2480 г 64 шт	\N	77.9	t
17	1465	Суши-сет «32 Самурая»	Суши-сеты	Тайский, Бостон, Тори, Нихонго	1400 г 32 шт	\N	37.9	t
17	1466	Суши-сет «Для особого случая»	Суши-сеты	Филадельфия VIP, Канада Чиз, Акари, Калифорния Магуро	1130 г 32 шт	\N	46.9	t
17	1467	Суши-сет «Донателло»	Суши-сеты	Акари, Чико, Калифорния Эби, Аляска		\N	29.9	t
17	1468	Суши-сет «За Эбись»	Суши-сеты	Ханаки, Самурай	1130 г 32 шт	\N	43.9	t
17	1469	Суши-сет «Запечённый-мини»	Суши-сеты	Маки с авокадо, Маки с лососем, Маки с тунцом, Маки с креветкой спайси, Маки с сыром, Маки с масляной рыбой	710 г 16 шт	\N	21.9	t
17	1470	Суши-сет «Классик»	Суши-сеты	Чико, Филадельфия, Бонито, Калифорния	730 г 36 шт	\N	30.9	t
17	1471	Суши-сет «Наоми»	Суши-сеты	Снежный, Туна, Чизик, Нобутада	1110 г 32 шт	\N	37.9	t
17	1472	Суши-сет «Нью‑Йорк»	Суши-сеты	Филадельфия Hot, Вулкан, Техас Hot	1060 г 32 шт	\N	34.9	t
17	1473	Суши-сет «Огненный»	Суши-сеты	Филадельфия, Филадельфия Грин, Нобутада, Маки с лососем, нигири Сяке, гункан Сяке Чиз, имбирь	880 г 24 шт	\N	29.9	t
17	1474	Суши-сет «Омачи»	Суши-сеты	Запечённый с лососем, запечённый с тунцом, запечённый с креветкой, запечённый с мидиями, запечённый с кальмаром, запечённый с курицей	1040 г 32 шт	\N	32.9	t
17	1475	Суши-сет «Осенний»	Суши-сеты	Филадельфия, Калифорния Магуро, Асахи, Бонито	1380 г 36 шт	\N	37.9	t
17	1476	Суши-сет «Такита»	Суши-сеты	Лосось, авокадо, рис, нори	1090 г 32 шт	\N	39.9	t
17	1477	Гункан «Авокадный»	Гунканы и нигири	Лосось, сыр «Филадельфия», рис, нори	37 г 1 шт	\N	2.7	t
17	1478	Гункан «Сяке чиз»	Гунканы и нигири	Тунец, сыр «Филадельфия», рис, нори	37 г 1 шт	\N	2.7	t
17	1479	Гункан «Магуро»	Гунканы и нигири	Чукка-салат, соус «Кунжутный», рис, нори	37 г 1 шт	\N	2.7	t
17	1480	Гункан «Хияши»	Гунканы и нигири	Икра масаго, рис, нори	37 г 1 шт	\N	2.4	t
17	1481	Гункан «Масаго»	Гунканы и нигири	Креветка, соус «Спайси», рис, нори	37 г 1 шт	\N	3.4	t
17	1482	Гункан «Эби спайси» 	Гунканы и нигири	Угорь, кунжут, соус «Унаги», рис, нори	38 г 1 шт	\N	2.7	t
17	1483	Гункан «Унаги» 	Гунканы и нигири	Лосось, рис	38 г 1 шт	\N	3.7	t
17	1484	Нигири «Сяке»	Гунканы и нигири	Угорь, кунжут, соус «Унаги», рис	32 г 1 шт	\N	2.7	t
17	1485	Нигири «Унаги» 	Гунканы и нигири	Креветка королевская, рис	35 г 1 шт	\N	3.7	t
17	1486	Нигири «Эби»	Гунканы и нигири	Масляная рыба, рис	32 г 1 шт	\N	3.7	t
17	1487	Нигири «Масляная рыба»	Гунканы и нигири	Чукка-салат, соус кунжутный, кунжут	32 г 1 шт	\N	2.7	t
17	1488	Соус соевый	Японский гарнир	В ассортименте	40 мл	\N	0.6	t
17	1489	Имбирь	Японский гарнир	В ассортименте	30 г	\N	0.6	t
17	1490	Васаби 	Японский гарнир		2.50 г	\N	0.6	t
17	1491	Соус кунжутный	Японский гарнир		40 мл	\N	1.5	t
17	1492	Соус «Унаги» 	Японский гарнир		40 мл	\N	1.5	t
17	1493	Соус «Терияки» 	Японский гарнир		40 мл	\N	1.5	t
17	1494	Соус «Спайси» (острый) 	Японский гарнир		40 мл	\N	1.5	t
17	1495	Соус «Ким‑чи»	Японский гарнир		40 мл	\N	1.5	t
17	1496	Чукка-салат 	Японский гарнир		125 г	\N	3.4	t
17	1497	Газированный напиток Coca‑Cola	Напитки		500 мл	\N	2	t
17	1498	Газированный напиток Fanta	Напитки		500 мл	\N	2	t
17	1499	Газированный напиток Sprite	Напитки		500 мл	\N	2	t
17	1500	Вода питьевая BonAqua	Напитки		1000 мл	\N	2.5	t
17	1501	Сок Rich	Напитки		1000 мл	\N	3.9	t
17	1502	Сок «Добрый»	Напитки		1000 мл	\N	3.5	t
17	1503	Газированный напиток Schweppes «Пряная клюква»	Напитки		1000мл	\N	2.9	t
17	1504	Газированный напиток Pepsi‑Cola	Напитки		500 мл	\N	2	t
17	1505	Соус Карри	Соусы			\N	0.6	t
17	1506	Соус «Барбекю»	Соусы			\N	0.6	t
17	1507	Соус кисло‑сладкий	Соусы			\N	0.6	t
17	1508	Соус «Сальса»	Соусы			\N	0.6	t
17	1509	Соус сырный	Соусы			\N	0.6	t
17	1510	Соус «Терияки» 	Соусы			\N	0.6	t
17	1511	Соус «Цезарь»	Соусы			\N	0.6	t
17	1512	Соус Чесночный	Соусы			\N	0.6	t
17	1513	Сырный борт	Борт в пиццу		30см	\N	2.9	f
17	1514	Сосиска в борт	Борт в пиццу		30см	\N	2.9	f
17	1515	Двойной сыр	Дополнительно		0см	\N	2.9	f
18	1516	Чили-сэндвич с ветчиной	Сэндвичи	Пшеничный хлеб, ветчина, помидоры, сыр «Чеддер», салат «Айсберг», соус «Чили», майонез	200 г	\N	4.3	t
18	1517	Сэндвич с курицей и хрустящим беконом	Сэндвичи	Пшеничный хлеб, филе куриное, помидоры, бекон, микс-салат, огурец консервированный, соус «Бургер», майонез	210 г	\N	4.3	t
18	1518	Сэндвич с курицей, луковыми кольцами и соусом «Ореховым»	Сэндвичи	Пшеничный хлеб, филе куриное, бекон, кольца луковые, помидоры, салат «Айсберг», соус «Ореховый», луковые чипсы	195 г	\N	4.3	t
18	1519	Сэндвич-ролл со свининой и соусом BBQ 	Сэндвичи	Пшеничный хлеб, свинина, бекон, сыр «Моцарелла», лук карамелизированный, помидоры, салат «Айсбеог», соус «Барбекю» с майонезом	240 г	\N	4.9	t
18	1520	Сэндвич с ветчиной, курицей и соусом «Спайси» 	Сэндвичи	Пшеничный хлеб, филе куриное, ветчина, помидоры, огурцы маринованные, салат «Айсберг», соус «Спайси»	215 г	\N	4.3	t
18	1521	Бифштекс с яйцом и картофельным пюре	Горячие блюда	Котлета говяжья, яйцо жареное, пюре картофельное, соус «Демиглас», микс‑салат	80 г	\N	12.7	t
18	1522	Говядина с картофельными крокетами и овощами‑гриль	Горячие блюда	Филе говядины, крокеты картофельные, цукини, шампиньоны, микс перцев, лук красный, помидоры черри, масло «Базилик»	140 г	\N	19.5	t
18	1523	Куриные котлеты с французским пюре	Горячие блюда	Котлеты куриные, французское пюре, микс-салат, помидоры черри, заправка лимонная	180 г	\N	12.7	t
18	1524	Свиные рёбра чили с запечённным картофелем и сыром	Горячие блюда	Рёбра свиные, картофель, сметана, майонез, сыр «Моцарелла», соус «Чили»	250 г	\N	18.5	t
18	1525	Стейк из лосося с кокосовым рисом и кунжутом	Горячие блюда	Стейк из лосося, соус «Хойсин», рис кокосовый, чукка‑салат, кунжут	120 г	\N	22	t
18	1526	Утиная ножка с картофелем и овощами	Горячие блюда	Ножка утиная, картофель, лук карамельный, цукини, помидор, масло «Базилик»	150 г	\N	17.3	t
18	1527	Филе куриное с ростис и грибным соусом	Горячие блюда	Филе куриное, крокеты картофельные, соус сливочный с грибами и луком, укроп	110 г	\N	12.9	t
18	1528	Грудинка свиная «Хойсин»	Горячие блюда	Грудинка, картофельные крокеты, огурцы маринованные, соус «Хойсин», укроп	180 г	\N	16	t
18	1529	Колбаски из баранины-говядины	Горячие блюда	Колбаски из баранины и говядины, пюре картофельное, помидоры вяленые, паста томатная, руккола	130 г	\N	16.5	t
18	1530	Куриные бёдрышки «Терияки» 	Горячие блюда	Куриные бедрышки, соус «Терияки», свёкла, брокколи, батат /батат, сок апельсиновый, розмарин, перец чёрный/, лук-шалот, фасоль стручковая, заправка медовая, салат мангольд, кунжут, кинза, чеснок	400 г	\N	14.9	t
18	1531	Рулька с картофелем и яйцом	Горячие блюда	Рулька, картофель, яйцо, соус из хрена, петрушка	400 г	\N	12.9	t
18	1532	Запеканка с филе судака и овощами	Горячие блюда	Филе судака, картофель, брокколи, соус белый, помидоры, сыр «Моцарелла», сыр «Дорблю», лук красный, укроп	400 г	\N	14.9	t
18	1533	Рыбные котлетки с рисом и овощами	Горячие блюда	Котлеты из минтая и лосося, рис, фасоль стручковая, помидоры, чеснок, сливки, соус «Неополитанский», салат мангольд	140 г	\N	14.7	t
18	1534	Салат «Греческий» с рулетиками из цукини и сливочного крема	Салаты	Микс-салат, помидоры черри, перец сладкий, огурцы, маслины, красный лук, цукини, сливочный крем, заправка «Греческая»	270 г	\N	9.3	t
18	1535	Салат с индейкой и соусом из вяленых помидоров	Салаты	Индейка «Хойсин», микс-салат, сыр «Пармезн», гренки, соус «Песто» красный, помидоры вяленые	240 г	\N	12.9	t
18	1536	Салат «Цезарь» с копчёным лососем	Салаты	Лосось копчёный, чипсы из бекона, микс-салат, сыр «Пармезан», соус «Цезарь», гренки	220 г	\N	12.9	t
18	1537	Салат «Цезарь» с курицей	Салаты	Филе куриное, микс-салат, сыр «Пармезан», соус «Цезарь», гренки, помидоры черри, масло «Базилик»	230 г	\N	11.3	t
18	1538	Овощной салат с грушей и сыром «Дорблю»	Салаты	Груша запечённая, микс-салат, свёкла, авокадо, сыр «Дорблю», батат печёный /батат, сок апельсиновый, розмарин, перец чёрный/, заправка медовая, миндаль	290 г	\N	12.4	t
18	1539	Ростбиф с «Мюнхенским» салатом 	Салаты	Ростбиф, картофель отварной, маслины, каперсы, помидоры вяленый, огурцы маринованные, майонез, сыр «Пармезан», петрушка, руккола, базилик, перец чёрный	210 г	\N	11.9	t
18	1540	Пицца «Пять сыров»	Пицца	Сыр «Моцарелла», сыр «Дорблю», сыр «Фета», сыр «Чеддер», сыр «Проволоне», соус сырный, орегано	520 г 32 см	\N	17.9	t
18	1541	Пицца «Барбекю»	Пицца	Свинина «Барбекю», шампиньоны, бекон, лук карамельный, сыр «Моцарелла», соус «Барбекю», орегано	590 г 32 см	\N	16.3	t
18	1542	Пицца «Карбонара»	Пицца	Бекон, красный лук, яйцо, сыр «Моцарелла», сыр «Пармезан», соус белый, орегано	480 г 32 см	\N	14.7	t
18	1543	Пицца «Маргарита»	Пицца	Сыр «Моцарелла», масло «Базилик», соус томатный, орегано	410 г 32 см	\N	8.4	t
18	1544	Пицца «Пеперони»	Пицца	Пеперони, сыр «Моцарелла», соус томатный, орегано	460 г 32 см	\N	12.3	t
18	1545	Пицца «Ветчина и грибы»	Пицца	Ветчина, шампиньоны, сыр «Моцарелла», соус томатный, орегано	460 г 32 см	\N	12.3	t
18	1546	Пицца «Шеф‑пицца»	Пицца	Ветчина, бекон, колбаса сырокопчёная, шампиньоны, помидор, сыр «Моцарелла», соус томатный, орегано	630 г 32 см	\N	16.3	t
18	1547	Пицца «Гавайская»	Пицца	Ветчина, ананасы консервированные, сыр «Моцарелла», соус «Роуз Мэри», орегано	520 г 32 см	\N	12.3	t
18	1548	Пицца «Рустика»	Пицца	Филе куриное, лук карамельный, огурцы консервированные, шампиньоны, сыр «Дорблю», сыр «Моцарелла», соус белый, масло базилик, орегано	540 г 32 см	\N	17.9	t
18	1549	Пицца «Дорблю пеперони»	Пицца	Пеперони, сыр «Дорблю», сыр «Моцарелла», груша, соус белый, орегано	500 г 32 см	\N	16.3	t
18	1656	Вода BonAqua сильногазированная	Напитки		500 мл	\N	2.2	t
18	1550	Пицца «Четыре сезона»	Пицца	Ветчина варёная, шампиньоны, креветка салатная, перец консервированный, паста томатная, орегано	540 г 32 см	\N	17.9	t
18	1551	Пицца «Боскайола»	Пицца	Сосиски, колбаски «Охотничьи», бекон копчёно-варёный, лук красный, маслины, сыр «Моцарелла», соус томатный, орегано	580 г 32 см	\N	14.7	t
18	1552	Пицца «Жульен с грибами»	Пицца	Филе куриное, шампиньоны, лук, соус сливочный, огурцы маринованные, опята маринованные, яйцо, горчица, сыр «Моцарелла», орегано	660 г 32 см	\N	15.6	t
18	1553	Пицца «Tasty»	Пицца	Фарш говяжий, сыр «Чеддер», помидоры, лук красный, сыр «Моцарелла», соус томатный, соус Гриль, орегано	615 г 32 см	\N	17.9	t
18	1554	Пицца «Греческая»	Пицца	Сыр «Дорблю», Сыр «Рикотта», сыр «Пармезан», сыр «Моцарелла», шпинат, помидоры вяленый, лук, соус томатный, соус Рэнч, орегано	605 г 32 см	\N	15.6	t
18	1555	Пицца «Баварская»	Пицца	Колбаски «Охотничьи», бекон, огурцы маринованные, лук красный, соус Рэнч, соус горчичный, сыр «Моцарелла», луковые чипсы, орегано	585 г 32 см	\N	16.3	t
18	1556	Пицца «Дьябло»	Пицца	Колбаса пеперони, ветчина, помидоры, лук красный, халапеньо, сыр «Моцарелла», соус «Барбекю», орегано	560 г 32 см	\N	14.7	t
18	1557	Пицца «Калифорния» с копчёным лососем и креветками	Пицца	Лосось копчёный, креветка салатная, помидоры черри, каперсы, сыр «Моцарелла», соус белый, орегано	550 г 32 см	\N	19.7	t
18	1558	Пицца «Свинина спайси & терияки» 	Пицца	Свинина, колбаса пеперони, перец свежий, сыр «Моцарелла», соус «Спайси», соус «Терияки», кунжут, орегано	545 г 32 см	\N	16.3	t
18	1559	Бургер Chicken	Бургеры	Котлета куриная, булочка «Бриошь», помидоры вяленые, лук красный, руккола, соус сырный, майонез, соус «Гуакамоле»	300 г	\N	11.9	t
18	1560	Бургер GARAGE	Бургеры	Котлета из говядины, бекон, сыр с голубой плесенью, груша, джем брусничный, руккола, майонез	300 г	\N	14.9	t
18	1561	Бургер Jack Daniel`s	Бургеры	Котлета из говядины, бекон, сыр «Проволоне», помидоры вяленые, шампиньоны, соус «Джек Дениелс», руккола, майонез	320 г	\N	14.9	t
18	1562	Бургер «Чеддер & бекон»	Бургеры	Котлета из говядины, помидоры, сыр «Чеддер», бекон, лук маринованный, майонез, руккола	280 г	\N	13.4	t
18	1563	Бургер-сет	Выгодные сеты	Бургер «Чеддер &amp; Бекон», бельгийский картофель, соус «Рэнч», 1 «Кока‑кола»	300 г	\N	18.2	t
18	1564	Пивной сет для компании	Выгодные сеты	Бельгийский картофель, наггетсы, кольца луковые, пальчики «Моцарелла», картофельные крокеты, соус «Барбекю», соус «Бургер», соус «Рэнч»	150 г	\N	24.4	t
18	1565	Сет для двоих (пицца)	Выгодные сеты	Пицца «Карбонара» 32 см, Шеф-пицца 32 см, 1 «Кока‑кола»	480 г	\N	24.9	t
18	1566	Сет для компании	Выгодные сеты	Шеф-пицца 32 см, пицца «Пять сыров» 32 см, пицца «Дорблю Пеперони» 32 см, пицца «Четыре сезона» 32 см, пицца «Гавайская» 32 см, 3 «Кока‑колы» 500 мл	630 г	\N	60	t
18	1567	Суши-сет «Дары моря»	Выгодные сеты	Ролл с угрём, авокадо, сливочным сыром и омлетом тамаго, ролл с креветкой, чукка и лососем, ролл «Бонито» с лососем и авокадо, 1/2 ролла с форелью, огурцом, сливочным сыром в кунжуте, 2 японских гарнира	910 г	\N	33.7	t
18	1568	Суши-сет «Хит»	Выгодные сеты	Ролл с угрём, лососем, авокадо и сливочным сыром, ролл с форелью и сливочным сыром, ролл с креветкой, помидором, авокадо и икрой масаго, 1/2 ролла «Филадельфия классическая», 2 японских гарнира	920 г	\N	38.9	t
18	1569	Суши-сет «Сытый самурай»	Выгодные сеты	Ролл с угрём, тунцом, сливочным сыром и такуаном, ролл «Пикантный» с форелью, помидором, сливочным сыром и омлетом тамаго, ролл «Чукка сяке маки» с ореховым соусом, ролл с лососем, тунцом и тигровой креветкой, 2 японских гарнира	1070 г	\N	41.2	t
18	1570	Винный сет	Выгодные сеты	Сырная закуска: сыр Проволоне, сыр «Моцарелла», сыр «Дорблю», мёд, пикантные оливки и маслины, мёд, руккола Карпаччо: маринованная говядина, помидоры черри, руккола, сыр «Пармезан», луковые чипсы, медовая заправка	445 г	\N	23	t
18	1571	Суши-сет «Ниёдогава»	Выгодные сеты	Ролл «Чука сяке маки с ореховым соусом», ролл «Йоган маки», ролл с форелью и сливочным сыром, ролл «Бонито» с копчёным лососем, 2 японских гарнира	1085 г	\N	39.9	t
19	1764	Паста «А-ля Карбонара»	Горячие блюда		490 г	\N	14.1	t
18	1572	Суши-сет «Сёкоцу»	Выгодные сеты	Ролл «Лава маки», ролл с угрём, лососем и омлетом, ролл с острым тунцом, сливочным сыром и огурцом, ½ ролла «Филадельфия классическая», ½ ролла с форелью и сыром «Чеддер», 2 японских гарнира	1132 г	\N	46.7	t
18	1573	Бельгийский картофель с соусом «Бургер»	Закуски		150 г	\N	4.7	t
18	1574	Наггетсы куриные с кетчупом 	Закуски		120 г	\N	6.9	t
18	1575	Кольца луковые с соусом «Барбекю» с майонезом	Закуски		160 г	\N	6.7	t
18	1576	Карпаччо из говядины 	Закуски	Говядина маринованная, сыр «Пармезан», помидоры черри, руккола, чипсы луковые, заправка медовая	175 г	\N	13.4	t
18	1577	Пальчики «Моцарелла» с соусом «Барбекю» с майонезом	Закуски		160 г	\N	6.9	t
18	1578	Закуска «Сельдь с картофелем»	Закуски	Филе сельди, лук маринованный, помидоры, картофель отварной, сметана, зелень	120 г	\N	8.4	t
18	1579	Закуска «Сырная»	Закуски	Сыр «Проволоне», сыр «Моцарелла», сыр «Дорблю», мёд, оливки, маслины, лепёшка сырная, руккола	40 г	\N	14.5	t
18	1580	Хлеб чесночный	Закуски	Мини-багет «Шведский», топинг чесночный	140 г	\N	3.9	t
18	1581	Кесадия с курицей и овощами	Закуски	Тортилья, цукини, филе куриное, лайм, лук, паста томатная, соус сырный, чили перец, масло оливковое, кинза, перец чёрный	180 г	\N	7.9	t
18	1582	Куриные крылышки	Закуски	Куриные крылышки, сырный соус, соус «Чили»	350 г	\N	9	t
18	1583	Пивной набор	Закуски	Куриные крылышки, грудинка свиная, колбаски из баранины-говядины, колбаски «Охотничьи», пеперони, колбаса сырокопчёная, сальса /лук красный, перец сладкий, перец зелёный, огурец, помидоры, фасоль красная, кукуруза, авокадо, маринованный редис, перец халапеньо, майонез, паприка кусочками/, фокачча, кольца луковые, соус сырный, соус «Гуакамоле», руккола	800 г	\N	35	t
18	1584	Крем-чиз борт (стандарт)	Сырный борт для пиццы		140 г	\N	2.9	f
18	1585	Крем-чиз борт (мега)	Сырный борт для пиццы		240 г	\N	4.9	f
18	1586	Ролл «Филадельфия унаги маки» 	Роллы	Угорь копчёный, редис такуан, сыр сливочный, кунжут, соус «Терияки», рис, нори	195 г	\N	14.4	t
18	1587	Ролл с форелью и сливочным сыром	Роллы	Форель копчёная, сыр сливочный, огурцы, рис, нори	210 г	\N	13.4	t
18	1588	Ролл «Калифорния маки»	Роллы	Креветка, авокадо, огурцы, майонез, икра тобико, рис, нори	205 г	\N	13.4	t
18	1589	Ролл «Сяке авокадо маки»	Роллы	Лосось, авокадо, рис, нори	170 г	\N	9.3	t
18	1590	Ролл «Бонито» с лососем и авокадо	Роллы	Лосось, авокадо, сыр сливочный, стружка тунца, рис, нори	205 г	\N	10.9	t
18	1591	Ролл «Чукка сяке маки» 	Роллы	Лосось, чукка-салат, сыр сливочный, ореховый соус, рис, нори	225 г	\N	11.9	t
18	1592	Ролл «Ясай маки»	Роллы	Перец, огурцы, авокадо, салат, кунжут, рис, нори	205 г	\N	6.4	t
18	1593	Ролл «Филадельфия классическая»	Роллы	Лосось, авокадо, огурец, сыр сливочный, рис, нори	255 г	\N	16.9	t
18	1594	Ролл «Бонито» с тунцом	Роллы	Филе тунца, огурец, сливочный сыр, стружка тунца, рис, нори	200 г	\N	8.7	t
18	1595	Ролл с форелью и омлетом тамаго	Роллы		200 г	\N	8.3	t
18	1596	Ролл «Когета маки»	Роллы	Опалённый лосось и тунец, огурец, сливочный сыр, рис, нори, соус «Терияки», икра тобико	235 г	\N	13.7	t
18	1597	Ролл «Лава маки»	Роллы	Огурец, сливочный сыр, соус «Лава», рис, нори, соус «Терияки»	270 г	\N	12.7	t
18	1598	Ролл «Йоган маки»	Роллы	Помидор, салат ромен, сливочный сыр, соус «Чизукани», рис, нори, ореховый соус	275 г	\N	9.3	t
18	1599	Ролл «Юки маки» с тунцом	Роллы	Тунец, огурец, опалённый сливочный сыр, рис, нори, соус «Терияки»	215 г	\N	11.9	t
18	1600	Васаби с лимоном 	Японский гарнир		5 г	\N	1	t
18	1601	Имбирь маринованный	Японский гарнир		25 г	\N	1	t
18	1602	Соус соевый	Японский гарнир		40 г	\N	1	t
18	1603	Соус ореховый	Японский гарнир		40 г	\N	2.2	t
18	1604	Соус «Терияки» 	Японский гарнир		40 г	\N	2	t
18	1605	Японский гарнир	Японский гарнир	Соус соевый, имбирь, васаби, лимон	40 г	\N	2.9	t
18	1606	Бульон с чесночным хлебом	Супы	Бульон куриный, курица, яйцо, хлеб чесночный, укроп	295 г	\N	5.4	t
22	1951	Кетчуп	Топинг			\N	0.7	t
22	1952	Соус сырный	Топинг			\N	0.7	t
18	1607	Суп «Том кха» с курицей	Супы	Филе куриное, молоко кокосовое, бульон, соус «Карри» красный тайский, лук, капуста, цукини, перец чили сладкий, кинза, паста имбирно-чесночная, сливки	300 г	\N	6.9	t
18	1608	Солянка Garage	Супы	Филе куриное, бекон, ветчина, огурцы маринованные, лук, каперсы, маслины, лимон, сметана, паста томатная, колбаса, укроп	280 г	\N	6.5	t
18	1609	Борщ с ребром	Супы	Свиное рёбрышко, свёкла, картофель, паста томатная, бульон, морковь, лук, чеснок, сметана, укроп	200 г	\N	6.9	t
18	1610	Блинчики с курицей, грибами и соусом «Бешамель»	Драники и блины	Блинчики, филе куриное, шампиньоны, лук, соус «Бешамель», сыр «Моцарелла», зелень	300 г	\N	8.9	t
18	1611	Драники с копчёным лососем	Драники и блины	Драники, соус творожный, лосось копчёный	150 г	\N	13.4	t
18	1612	Драники с мачанкой	Драники и блины	Драники, свинина, шампиньоны, лук, зелень	150 г	\N	12.9	t
18	1613	Запечённые крокеты с курицей и шампиньонами	Драники и блины	Крокеты картофельные, филе куриное, шампиньоны, лук, соус «Бешамель», сыр «Моцарелла»	380 г	\N	9.9	t
18	1614	Тостада с курицей	Пита и тостада	Филе куриное, тортилья, сыр «Чеддер», картофель «Бельгийский», салат «Коул слоу», соус «Ранч»	180 г	\N	12.5	t
18	1615	Тостада с говядиной	Пита и тостада	Котлета говяжья, тортилья, сыр «Чеддер», картофель «Бельгийский», салат «Коул слоу», соус «Ранч»	210 г	\N	14.4	t
18	1616	Мак-н-чиз «Болоньезе»	Паста	Фарш томатный с соусом «Болоньезе», макароны, сыр «Моцарелла», соус сырный, сухари панировочные, масло сливочное	460 г	\N	10.5	t
18	1617	Мак-н-чиз с курицей и овощами	Паста	Макароны, филе куриное, цукини, помидоры, шампиньоны, масло сливочное, соус «Морне»	370 г	\N	8.9	t
18	1618	Бельгийский картофель	Гарниры		150 г	\N	3.9	t
18	1619	Драники	Гарниры		100 г	\N	3.9	t
18	1620	Овощи-гриль	Гарниры		75 г	\N	3.9	t
18	1621	Кокосовый рис	Гарниры		180 г	\N	3.9	t
18	1622	Картофельные крокеты	Гарниры		150 г	\N	3.89	t
18	1623	Французское пюре	Гарниры		150 г	\N	3.9	t
18	1624	Хлеб	Хлеб		50 г	\N	0.5	t
18	1625	Фокачча 	Хлеб		100 г	\N	1.9	t
18	1626	Тосты	Хлеб		60 г	\N	1.5	t
18	1627	Пикантная лепёшка с кунжутом	Хлеб		50 г	\N	1.9	t
18	1628	Чесночный хлеб	Хлеб		50 г	\N	2.5	t
18	1629	Торт морковный	Десерты		160 г	\N	5.3	t
18	1630	Чизкейк мраморный 	Десерты		130 г	\N	5.3	t
18	1631	Пирог яблочный	Десерты		150 г	\N	5.3	t
18	1632	Круассан с карамелью	Десерты		80 г	\N	2.7	t
18	1633	Круассан с шоколадом	Десерты		90 г	\N	2.7	t
18	1634	Маффин с курагой	Десерты		100 г	\N	2.3	t
18	1635	Маффин с шоколадными каплями	Десерты		100 г	\N	2.3	t
18	1636	Сырники со сметаной и кули из клубники	Десерты	Сырники, пудра сахарная, соус клубничный, сметана, мята	140 г	\N	5.5	t
18	1637	Шоколадный фондан	Десерты	Шоколадный фондан, соус клубничный, пудра сахарная, мята	80 г	\N	6.9	t
18	1638	Сок Rich апельсиновый	Напитки		1000 мл	\N	5.9	t
18	1639	Сок Rich грейпфрутовый	Напитки		1000 мл	\N	5.9	t
18	1640	Сок Rich виноградный	Напитки		1000 мл	\N	5.9	t
18	1641	Сок Rich вишнёвый	Напитки		1000 мл	\N	5.9	t
18	1642	Сок Rich ананасовый	Напитки		1000 мл	\N	5.9	t
18	1643	Сок «Добрый» яблочный	Напитки		1000 мл	\N	5.9	t
18	1644	Сок «Добрый» томатный	Напитки		1000 мл	\N	5.9	t
18	1645	Клюквенный морс	Напитки		200 мл	\N	2.2	t
18	1646	Морс черносмородиновый	Напитки		200 мл	\N	2.2	t
18	1647	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.2	t
18	1648	Напиток газированный Coca‑cola Zero	Напитки		500 мл	\N	2.2	t
18	1649	Напиток газированный Fanta	Напитки		500 мл	\N	2.2	t
18	1650	Напиток газированный Sprite	Напитки		500 мл	\N	2.2	t
18	1651	Напиток газированный Schweppes	Напитки		500 мл	\N	2.2	t
18	1652	Энергетический напиток Burn	Напитки		250 мл	\N	4	t
18	1653	Напиток чайный FuzeTea	Напитки		500 мл	\N	2.2	t
18	1654	Вода BonAqua негазированная	Напитки		500 мл	\N	2.2	t
18	1655	Вода BonAqua среднегазированная	Напитки		500 мл	\N	2.2	t
19	1657	Пицца «Веганская»	Пицца	Соус для пиццы, помидоры, перец, шампиньоны, лук, маслины, фасоль стручковая, оливки	500 г 32 см	\N	14.1	t
19	1658	Пицца «Везувио»	Пицца	Соус для пиццы, сыр «Моцарелла», помидоры, ветчина, грудинка, перец	500 г 32 см	\N	14.6	t
19	1659	Пицца «Гавайская»	Пицца	Соус для пиццы, сыр «Моцарелла», ананас, курица, оливки	600 г 32 см	\N	14.6	t
19	1660	Пицца «Домашняя»	Пицца	Соус для пиццы, сыр «Моцарелла», колбаски «Домашние», лук зелёный, горчица, перец	670 г 32 см	\N	17.6	t
19	1661	Пицца «Кальцоне»	Пицца	Соус для пиццы, сыр «Моцарелла», ветчина, шампиньоны, огурцы, курица	520 г 32 см	\N	15.1	t
19	1662	Пицца «Кампаньола»	Пицца	Соус для пиццы, сыр «Моцарелла», грудинка, курица, лук, помидоры	490 г 32 см	\N	15.1	t
19	1663	Пицца «Карбонара»	Пицца	Соус для пиццы, сыр «Моцарелла», сливки, яйцо, сыр «Джюгас», грудинка	540 г 32 см	\N	17.1	t
19	1664	Пицца «Маринара»	Пицца	Соус для пиццы, сыр «Моцарелла», лук, помидоры, коктейль морской	510 г 32 см	\N	17.1	t
19	1665	Пицца «Милано»	Пицца	Соус для пиццы, сыр «Моцарелла», шампиньоны, ветчина, маслины, лук, перец	580 г 32 см	\N	14.6	t
19	1666	Пицца «Пепино»	Пицца	Соус для пиццы, сыр «Моцарелла», шампиньоны, креветки, ветчина, перец, лук, майонез	540 г 32 см	\N	17.1	t
19	1667	Пицца «Пеперони»	Пицца	Соус для пиццы, сыр «Моцарелла», помидоры, перец маринованный острый, лук, ветчина, салями	580 г 32 см	\N	15.6	t
19	1668	Пицца «Салями»	Пицца	Соус для пиццы, сыр «Моцарелла», помидоры, салями, лук, маслины	580 г 32 см	\N	16.6	t
19	1669	Пицца «Сицилиано»	Пицца	Соус для пиццы, сыр «Моцарелла», помидоры, лосось, креветки, оливки, лук	580 г 32 см	\N	26.1	t
19	1670	Пицца «Фирменная»	Пицца	Соус для пиццы, сыр «Моцарелла», перец, колбаса, лук, ветчина, грудинка, шампиньоны	650 г 32 см	\N	15.6	t
19	1671	Пицца «Четыре мяса»	Пицца	Соус для пиццы, сыр «Моцарелла», помидоры, грудинка, ветчина, салями	580 г 32 см	\N	15.6	t
19	1672	Пицца «Четыре сыра»	Пицца	Соус для пиццы, сыр «Моцарелла», сыр «Джюгас», сыр «Дорблю», сыр «Фетаки», груша	600 г 32 см	\N	26.1	t
19	1673	Пицца «Чикен»	Пицца	Соус для пиццы, сыр «Моцарелла», шампиньоны, курица, огурцы, лук	540 г 32 см	\N	14.6	t
19	1674	Пицца маленькая	Собери свою пиццу		290 г 32 см	\N	5.5	f
19	1675	Пицца большая	Собери свою пиццу		470 г 42 см	\N	8.5	f
19	1676	Соус томатный	Топинг		50 мл	\N	1.3	t
19	1677	Соус томатный острый	Топинг		50 мл	\N	1.3	t
19	1678	Соус томатный со специями	Топинг		50 мл	\N	1.3	t
19	1679	Соус чесночный	Топинг		50 мл	\N	0.8	t
19	1680	Салями	Топинг			\N	2.5	t
19	1681	Колбаса варёно‑копчёная	Топинг			\N	2	t
19	1682	Ветчина рубленая	Топинг			\N	1.5	t
19	1683	Ветчина натуральная	Топинг			\N	2	t
19	1684	Грудинка	Топинг			\N	1.5	t
19	1685	Колбаса сырокопчёная	Топинг			\N	1.5	t
19	1686	Лосось	Топинг			\N	2.5	t
19	1687	Огурцы	Топинг			\N	1.5	t
19	1688	Помидоры	Топинг			\N	1	t
19	1689	Перец	Топинг			\N	1.8	t
19	1690	Маслины	Топинг			\N	0.8	t
19	1691	Оливки	Топинг			\N	0.8	t
19	1692	Ананас консервированный	Топинг			\N	1.7	t
19	1693	Фасоль	Топинг			\N	0.5	t
19	1694	Лук	Топинг			\N	0.5	t
19	1695	Сыр «Моцарелла»	Топинг			\N	1.8	t
19	1696	Сыр «Дорблю»	Топинг			\N	7	t
19	1697	Сыр «Джюгас»	Топинг			\N	7	t
19	1698	Сыр «Фетаки»	Топинг			\N	3	t
19	1699	Шампиньоны	Топинг			\N	1	t
19	1700	Яйцо	Топинг			\N	0.5	t
19	1701	Биг-бургер с говядиной	Бургеры	Булочка с кунжутом, говядина, салат, соус «Гамбургер», специи, сыр «Хохланд», лук, помидоры	340 г	\N	16.6	t
19	1702	Биг-бургер с курицей	Бургеры	Булочка с кунжутом, филе птицы, салат, соус «Гамбургер», лук, шампиньоны, специи, огурцы	300 г	\N	12.6	t
19	1703	Бургер с говядиной	Бургеры	Булочка с кунжутом, говядина, салат, соус «Гамбургер», соус горчичный, специи	230 г	\N	12.6	t
22	1953	Изюм к каше	Топинг		20 г	\N	0.4	t
19	1704	Гамбургер куриный	Бургеры	Булочка с кунжутом, филе птицы, салат, лук, сметана, зелень, специи	230 г	\N	10.1	t
19	1705	Мини-бургер с говядиной	Бургеры	Булочка с кунжутом, говядина, салат, соус «Гамбургер», лук, помидоры, сыр «Хохланд», специи	180 г	\N	9.6	t
19	1706	Мини-бургер с курицей	Бургеры	Булочка с кунжутом, филе птицы, салат, соус «Гамбургер», лук, фасоль стручковая, специи	180 г	\N	6.6	t
19	1707	Мини-бургер со свининой	Бургеры	Булочка с кунжутом, свинина, огурцы, салат, соус «Гамбургер», специи, сыр «Хохланд», лук, помидоры	190 г	\N	8.6	t
19	1708	Гамбургер «Румяный»	Бургеры	Булочка с кунжутом, говядина, салат, соус, грудинка, лук, помидоры, огурцы, сыр «Хохланд», зелень, специи	300 г	\N	14.6	t
19	1709	Гамбургер «Рыбный»	Бургеры	Булочка с кунжутом, филе хека, лимон, салат, яйцо, соус «Айоли», специи	230 г	\N	12.6	t
19	1710	Чизбургер со свининой	Бургеры	Булочка с кунжутом, свинина, салат, соус «Гамбургер», лук, помидоры, сыр «Хохланд», специи, огурцы	280 г	\N	12.6	t
19	1711	Ассорти мясное	Холодные закуски	Колбаса сырокопчёная, ветчина, грудинка, колбаса варёно-копчёная, колбаса полукопчёная, салат, маслины	250 г	\N	13.1	t
19	1712	Ассорти овощное	Холодные закуски	Помидоры, перец, огурцы, салат, капуста «По-слуцки», морковь «По-корейски», маслины, зелень	270 г	\N	9.1	t
19	1713	Бутерброд с сёмгой	Холодные закуски	Сёмга подкопчённая, хлеб, масло сливочное, лимон, зелень	55 г	\N	5.1	t
19	1714	Закуска «Дон Помидор»	Холодные закуски	Помидоры, чеснок, майонез, сыр, салат	300 г	\N	9.6	t
19	1715	Закуска «Под водочку»	Холодные закуски	Помидоры черри маринованные, перец маринованный, огурцы маринованные, грибы маринованные, капуста «По-слуцки», оливки, маслины, салат, зелень	260 г	\N	11.6	t
19	1716	Закуска рыбная	Холодные закуски	Сёмга подкопчённая, икра лососевая, масло сливочное, маслины, лимон, салат, зелень	110 г	\N	14.6	t
19	1717	Канапе с икрой	Холодные закуски	Икра лососевая, хлеб, масло сливочное, зелень	35 г	\N	7.1	t
19	1718	Карпаччо 	Холодные закуски	Вырезка говяжья, сыр «Джюгас», соус	200 г	\N	14.6	t
19	1719	Карпаччо из сёмги 	Холодные закуски	Филе сёмги, уксус бальзамический, сыр «Джюгас», зелень, оливки	155 г	\N	15.6	t
19	1720	Закуска «Пикантная»	Холодные закуски	Язык, чеснок, сыр	180 г	\N	10.6	t
19	1721	Тартар из говядины 	Холодные закуски	Вырезка говяжья, огурцы маринованные, лук, желток яичный, горчица	440 г	\N	15.6	t
19	1722	Салат «Греческий»	Салаты	Салат, огурцы, помидоры, перец сладкий, сыр «Фетаки», маслины, масло оливковое, уксус бальзамический, зелень	200 г	\N	10.1	t
19	1723	Салат «Морская жемчужина»	Салаты	Авокадо, сёмга, сыр «Фета», огурцы, оливки, икра лососевая, салат, масло оливковое, зелень	180 г	\N	17.1	t
19	1724	Салат «Оливье»	Салаты	Говядина, картофель, морковь, яйцо, горошек, огурцы маринованные, майонез, оливки, салат, зелень	220 г	\N	9.1	t
19	1725	Салат «Бриз»	Салаты	Форель подкопчённая, капуста пекинская, авокадо, лимон, оливки, майонез, салат, зелень	170 г	\N	11.6	t
19	1726	Салат «Гнездо глухаря»	Салаты	Язык, грибы, овощи, шарики сырные острые, картофель, майонез	260 г	\N	12.1	t
19	1727	Салата «Папараць-кветка»	Салаты	Говядина, ветчина, помидоры, огурцы, лук маринованный, майонез, салат, зелень	210 г	\N	10.1	t
19	1728	Салат «Тайский»	Салаты	Вырезка говяжья, лук-порей, огурцы, помидоры, капуста пекинская, чеснок, кетчуп, соус соевый, сок лимонный, масло оливковое, салат, зелень	230 г	\N	15.6	t
19	1729	Салат из креветок и авокадо	Салаты	Креветки, помидоры черри, авокадо, салат, сок лимонный, масло оливковое, мёд, зелень	230 г	\N	16.1	t
19	1730	Салат из овощей	Салаты	Овощи, листья салата, масло оливковое, сок лимонный	210 г	\N	9.1	t
19	1731	Салат из языка и пекинской капусты	Салаты	Язык, листья салата, опята, помидоры черри, лук‑порей	220 г	\N	10.1	t
19	1732	Салат с говядиной и авокадо	Салаты	Вырезка говяжья, авокадо, яйца перепелиные, помидоры черри, соус с горчицей «Французская»	200 г	\N	15.6	t
22	1955	Пахлава «Бурма»	Десерты	Восточная сладость из слоёного теста с орехами в медовом сиропе		\N	2.5	t
19	1733	Салат из куриной грудки с лисичками	Салаты	Филе куриное, листья салата, овощи, лисички, соус на коньяке	200 г	\N	14.1	t
19	1734	Салат «Сельдь под шубой»	Салаты	Картофель, свёкла, сельдь, яйцо, морковь, яблоко, майонез, сыр, грибы маринованные, зелень, салат, лимон	300 г	\N	9.1	t
19	1735	Салат «Цезарь»	Салаты	Филе цыплёнка, салат, помидоры, сыр «Джюгас», помидоры черри, сухарики, заправка	250 г	\N	14.1	t
19	1736	Салат «Цезарь» с креветками	Салаты	Креветки, салат, помидоры, сыр «Джюгас», помидоры черри, сухарики, заправка	250 г	\N	19.1	t
19	1737	Борщ с капустой и картофелем	Супы		320 г	\N	5.6	t
19	1738	Солянка	Супы	Говядина, ветчина, колбаса сырокопчёная, лук, огурцы маринованные, помидоры, оливки, сметана, каперсы, лимон, зелень	250 г	\N	7.1	t
19	1739	Суп-пюре грибной	Супы	Шампиньоны, картофель, морковь, лук, хлеб тостовый, масло растительное, приправа, зелень	270 г	\N	7.1	t
19	1740	Суп-пюре из овощей	Супы	Ветчина, капуста цветная, картофель, морковь, лук, горошек, мука, масло сливочное, сливки, яйцо, хлеб тостовый, масло растительное, приправа, зелень	300 г	\N	5.6	t
19	1741	Раки речные, сваренные в бульоне со специями	Горячие закуски		100 г	\N	7.5	t
19	1742	Кальмары фри	Горячие закуски	Кальмар, яйцо, мука, масло растительное, соус «Тартар», салат, зелень	170 г	\N	10.1	t
19	1743	Закуска «Куриные пальчики»	Горячие закуски	Филе куриное, яйцо, мука, салат «Коул слоу», соус медово-горчичный, салат, зелень	300 г	\N	9.1	t
19	1744	Острые гренки	Горячие закуски	Хлеб, сыр «Джюгас», яйцо, кетчуп, соус, салат, зелень	160 г	\N	10.1	t
19	1745	Горячая закуска «Поленица»	Горячие закуски	Хлеб, сыр, майонез, масло растительное, чеснок	350 г	\N	7.1	t
19	1746	Рёбрышки «Барбекю»	Горячие закуски	Рёбра свиные, кетчуп, масло растительное, салат, зелень	310 г	\N	10.1	t
19	1747	Слойка «К пиву»	Горячие закуски	Тесто слоёное, яйцо, мука, масло сливочное, перец чили, перец молотый, паприка	120 г	\N	8.1	t
19	1748	Сыр смажаны с соусом «Тар‑тар»	Горячие закуски	Сыр сычужный, яйцо, сухари панировочные, масло растительное, салат, зелень	200 г	\N	9.6	t
19	1749	Крылья «Барбекю»	Горячие блюда	Крылья куриные, соус, кетчуп «Аджика», салат, зелень	280 г	\N	10.1	t
19	1750	Beerрулька	Горячие блюда	Рулька свиная, соус, листья салата	1000 г	\N	30.6	t
19	1751	Горшочек «Белорусский»	Горячие блюда	Драники, свинина, лук, шампиньоны, сметана, зелень	350 г	\N	10.6	t
19	1752	Блинчики с икрой	Горячие блюда	Блины, икра лососевая, масло сливочное	125 г	\N	9.1	t
19	1753	Блинчики с сёмгой	Горячие блюда	Блины, сёмга подкопчённая, масло сливочное	145 г	\N	8.1	t
19	1754	Говядина «Карнавал»	Горячие блюда	Вырезка говяжья маринованная, рататуй овощной	260 г	\N	24.1	t
19	1755	Сковородка «Деревенская»	Горячие блюда	Картофель, шкварка белорусская, лук, чеснок, сметана, яйцо перепелиное, огурцы маринованные, перец маринованный, помидоры, помидоры черри маринованные, зелень	400 г	\N	14.1	t
19	1756	Джамбалайя с диким рисом	Горячие блюда	Филе куриное, рис дикий, колбаски подкопчённые, масло растительное, перец, лук репчатый, чеснок, сельдерей, масло сливочное, зелень	360 г	\N	11.1	t
19	1757	Картофель, запечённый с лисичками и луком в сметанном соусе	Горячие блюда		400 г	\N	10.6	t
19	1758	Картофельные оладьи с соусом из шампиньонов	Горячие блюда		305 г	\N	12.6	t
19	1759	Колбаски «По-мюнхенски» с картофельными дольками и фасолью	Горячие блюда	Колбаски подкопченные, фасоль, лук репчатый, дольки картофельные, горчица «Французская», яйцо, зелень	430 г	\N	14.1	t
19	1760	Филе куриное с лисичками и картофелем	Горячие блюда	Картофель отварной, лисички, филе куриное, соус сметанно‑луковый	400 г	\N	15.1	t
19	1761	Мачанка 	Горячие блюда	Блины мучные, свинина, колбаски «Аппетитные», грудинка, лук, соус сметанный	400 г	\N	13.6	t
19	1762	Мясо «По‑купечески»	Горячие блюда	Вырезка свиная, шампиньоны, ветчина, сыр, яйцо, сухари, масло растительное, салат, зелень	240 г	\N	13.1	t
19	1763	Мясо «По‑охотничьи»	Горячие блюда	Свинина, лук, соус соевый, салат, грибы, сметана, зелень	220 г	\N	14.1	t
19	1765	Рыба, запечённая в фольге	Горячие блюда	Филе сёмги, сметана, майонез, соус соевый, лимон, зелень	160 г	\N	17.1	t
19	1766	Рыба, запечённая с грибами	Горячие блюда	Сёмга, мука, масло растительное, шампиньоны, сметана, майонез, сыр, лимон, салат, зелень	175 г	\N	20.6	t
19	1767	Свинина, запечённая с лисичками «По‑деревенски»	Горячие блюда	Отбивная свиная, лисички, сыр	200 г	\N	14.1	t
19	1768	Сковородка «Тирольская»	Горячие блюда	Картофель, колбаски подкопчённые, ветчина, колбаски «Аппетитные», лук, чеснок, сметана, яйцо, зелень	410 г	\N	14.1	t
19	1769	Стейк из говядины	Горячие блюда	Вырезка говяжья, маринад, салат, зелень	160 г	\N	22.6	t
19	1770	Стейк из форели	Горячие блюда		130 г	\N	22.6	t
19	1771	Горячее блюдо «Ушки Пятачка»	Горячие блюда	Уши свиные, чеснок, соус соевый, дым жидкий, огурцы маринованные, помидоры, салат «Коул слоу», салат, зелень	410 г	\N	15.1	t
19	1772	Филе птицы в кунжуте	Горячие блюда	Филе птицы, кунжут белый, кунжут чёрный, соус	260 г	\N	13.1	t
19	1773	Форель радужная	Горячие блюда	Форель, специи, зелень	120 г	\N	12.6	t
19	1774	Цыплёнок-табака	Горячие блюда		1000 г	\N	22.6	t
19	1775	Картофель, запечённый с лисичками и луком в сметанном соусе	Горячие блюда		400 г	\N	10.6	t
19	1776	Гарнир к Beerрульке	Гарниры	Дольки картофельные, горчица, хрен	250 г	\N	6.1	t
19	1777	Картофель отварной	Гарниры	Картофель, масло сливочное, капуста «По-слуцки», морковь «По-корейски», огурцы, салат, зелень	270 г	\N	4.4	t
19	1778	Картофель отварной со шкварками и луком	Гарниры	Картофель, масло растительное, лук, шкварка «Белорусская», зелень	330 г	\N	6.1	t
19	1779	Картофель фри с салатом «Коул слоу»	Гарниры		230 г	\N	6.1	t
19	1780	Картофельные дольки с салатом «Коул слоу»	Гарниры		230 г	\N	5.1	t
19	1781	Овощи отварные с маслом	Гарниры	Капуста цветная, брокколи, фасоль стручковая, масло сливочное	165 г	\N	4.4	t
19	1782	Рис с овощами	Гарниры	Рис дикий пропаренный, кукуруза, горошек, перец, масло сливочное		\N	4.4	t
19	1783	Сок Rich апельсиновый	Холодные напитки		1000 мл	\N	7.5	t
19	1784	Сок Rich томатный	Холодные напитки		1000 мл	\N	7.5	t
19	1785	Сок Rich яблочный	Холодные напитки		1000 мл	\N	7.5	t
19	1786	Сок Rich грейпфрутовый	Холодные напитки		1000 мл	\N	7.5	t
19	1787	Сок Rich виноградный	Холодные напитки		1000 мл	\N	7.5	t
19	1788	Морс клюквенно-виноградный Rich	Холодные напитки		1000 мл	\N	7.5	t
19	1789	Вода питьевая BonAqua	Холодные напитки		500 мл	\N	2	t
19	1790	Газированный напиток Coca‑Cola	Холодные напитки		500 мл	\N	3	t
19	1791	Газированный напиток Fanta	Холодные напитки		500 мл	\N	3	t
19	1792	Газированный напиток Sprite	Холодные напитки		500 мл	\N	3	t
19	1793	Газированный напиток Schweppes	Холодные напитки		500 мл	\N	3	t
19	1794	Энергетический напиток Burn	Холодные напитки		250 мл	\N	4	t
19	1795	Минеральная вода «Боржоми»	Холодные напитки		500 мл	\N	4	t
19	1796	Штрудель с яблоком	Десерты			\N	7.1	t
19	1797	Салат фруктовый	Десерты			\N	7.1	t
19	1798	Контейнер «Супница»	Упаковка			\N	0.25	f
19	1799	Контейнер на 3 секции	Упаковка			\N	0.25	f
19	1800	Контейнер «Гамбургер»	Упаковка			\N	0.25	f
19	1801	Акционная пицца 26 см	Акция	На выбор: пиццы «Везувио», «Милано», «Чикен», «Веганская», «Компаньола»		\N	20	t
19	1802	Акционная пицца 32 см	Акция	На выбор: пиццы «Везувио», «Милано», «Чикен», «Веганская», «Компаньола»		\N	30	t
20	1803	Пицца «Капричоза»	Пицца	Соус, сыр «Моцарелла», ветчина, грибы, специи	490 г 32 см	\N	15.4	t
20	1804	Пицца «Дижонская»	Пицца	Соус, горчица, сыр «Моцарелла», ветчина, бекон, фасоль стручковая, специи	470 г 32 см	\N	15.4	t
20	1805	Пицца «Сырная»	Пицца	Сыр «Моцарелла», соус сметанный, соус майонезный, яйцо, специи	400 г 32 см	\N	13.2	t
20	1806	Пицца «Салями»	Пицца	Соус, сыр «Моцарелла», салями, специи	385 г 32 см	\N	14.3	t
20	1807	Пицца «Мисто»	Пицца	Соус, сыр «Моцарелла», ветчина, салями, грибы, огурцы маринованные, помидоры, соус сметанный, специи	520 г 32 см	\N	15.4	t
20	1808	Пицца «Четыре сезона»	Пицца	Соус, сыр «Моцарелла», ветчина, салями, грибы, помидоры, специи	510 г 32 см	\N	15.4	t
20	1809	Пицца «Цезарь»	Пицца	Соус, сыр «Моцарелла», филе куриное, микс из листьев салатов, помидоры, соус «Цезарь», специи	545 г 32 см	\N	15.4	t
20	1810	Пицца «Домашняя»	Пицца	Соус, сыр «Моцарелла», салями, бекон, грибы, яйцо, соус сметанный, соус майонезный, зелень, специи	490 г 32 см	\N	15.4	t
20	1811	Пицца «Мясная»	Пицца	Соус, сыр «Моцарелла», ветчина, бекон, филе куриное, лук обжаренный, грибы, специи	520 г 32 см	\N	15.4	t
20	1812	Пицца «Маргарита»	Пицца	Соус, сыр «Моцарелла», помидоры, специи	390 г 32 см	\N	13.2	t
20	1813	Пицца с курицей	Пицца	Соус, сыр «Моцарелла», филе куриное, огурцы маринованные, грибы, зелень, специи	450 г 32 см	\N	14.9	t
20	1814	Бифбургер	Бургеры	Котлета говяжья, микс из листьев салатов, лук, огурцы маринованные, помидоры, соус «Барбекю», сыр «Чеддер»	305 г	\N	8.5	t
20	1815	Бургер «Тайский» (острый)	Бургеры	Котлета говяжья, микс из листьев салатов, помидоры, лук, огурцы маринованные, перец халапеньо маринованный, соус «Барбекю»	290 г	\N	8	t
20	1816	Чизбургер	Бургеры	Котлета куриная, помидоры, микс из листьев салатов, соус сырный, двойной сыр «Чеддер»	320 г	\N	8	t
20	1817	Бургер «Чикен‑бекон»	Бургеры	Котлета куриная, бекон обжаренный, картофель фри, микс из листьев салатов, соус майонезный, сыр «Чеддер»	320 г	\N	8	t
20	1818	Чикенбургер	Бургеры	Котлета куриная, микс из листьев салатов, соус майонезный	250 г	\N	7.5	t
20	1819	Биф-ролл	Твистер-роллы	Котлета говяжья, микс из листьев салатов, помидоры, огурцы маринованные, соус «Барбекю», сыр «Чеддер»	270 г	\N	8.5	t
20	1820	Цезарь-ролл	Твистер-роллы	Котлета куриная, микс из листьев салатов, помидоры, соус «Цезарь», сыр «Чеддер»	270 г	\N	8	t
20	1821	Ролл «Тайский» (острый)	Твистер-роллы	Котлета говяжья, микс из листьев салатов, помидоры, лук, огурцы маринованные, перец халапеньо маринованный, соус «Барбекю»	270 г	\N	8	t
20	1822	Картофель фри	Закуски		130 г	\N	3.6	t
20	1823	Куриные наггетсы 	Закуски		130 г	\N	4.8	t
20	1824	Сырный	Соус порциионный		25 мл	\N	0.8	t
20	1825	Горчичный	Соус порциионный		25 мл	\N	0.8	t
20	1826	Чесночный	Соус порциионный		25 мл	\N	0.8	t
20	1827	Напиток газированный Coca‑Cola	Холодные напитки		250 мл	\N	2.3	t
20	1828	Напиток газированный Sprite	Холодные напитки		250 мл	\N	2.3	t
20	1829	Напиток газированный Fanta	Холодные напитки		250 мл	\N	2.3	t
20	1830	Энергетический напиток Burn «Оригинальный»	Холодные напитки		250 мл	\N	4.3	t
20	1831	Энергетический напиток Burn со вкусом яблока и киви	Холодные напитки		250 мл	\N	4.3	t
20	1832	Напиток «Добрый „Палпи“» апельсиновый	Холодные напитки		450 мл	\N	2.5	t
20	1833	Напиток «Добрый „Палпи“» тропический	Холодные напитки		450 мл	\N	2.5	t
20	1834	Вода BonAqua негазированная	Холодные напитки		500 мл	\N	1.8	t
20	1835	Вода BonAqua среднегазированная	Холодные напитки		500 мл	\N	1.8	t
20	1836	Вода BonAqua сильногазированная	Холодные напитки		500 мл	\N	1.8	t
20	1837	Сок «Добрый» яблочный	Холодные напитки		330 мл	\N	2	t
20	1838	Сок «Добрый» мультифруктовый	Холодные напитки		330 мл	\N	2	t
20	1839	Сок «Добрый» апельсиновый	Холодные напитки		330 мл	\N	2	t
20	1840	Сок «Добрый» томатный	Холодные напитки		330 мл	\N	2	t
20	1841	Чайный напиток FuzeTea «Лесные ягоды‑гибискус»	Холодные напитки		500 мл	\N	2.5	t
20	1842	Чайный напиток FuzeTea «Лимон-лемонграсс»	Холодные напитки		500 мл	\N	2.5	t
20	1843	Чайный напиток FuzeTea «Клубника-малина»	Холодные напитки		500 мл	\N	2.5	t
20	1844	Чайный напиток FuzeTea «Манго‑ромашка»	Холодные напитки		500 мл	\N	2.5	t
20	1845	Чайный напиток FuzeTea «Улун малина‑мята»	Холодные напитки		500 мл	\N	2.5	t
20	1846	2 защитные маски	Акция	Отдельно заказать нельзя, только по промокоду		\N	20	t
20	1847	Попкорн	Акция	Отдельно заказать нельзя, только по промокоду		\N	20	t
23	2065	Сырные палочки	Закуски		160 г	\N	9.5	t
21	1848	Бургер с наггетсами	Бургеры	Наггетсы, сыр «Чеддер», салат листовой, помидоры свежие, огурцы маринованные, лук ялтинский, горчичный соус, фирменный соус «Сладкий чили»	245 г	\N	6.4	t
21	1849	Бургер «Двойной форсаж»	Бургеры	Котлета из свинины, помидор, огурцы маринованные, сыр «Чеддер», перец халапеньо, зелёный салат, фирменный соус «Барбекю»	290 г	\N	6.7	t
21	1850	Чикенбургер	Бургеры	Котлета из куриного филе, помидор, огурцы маринованные, сыр «Чеддер», зелёный салат, лук, фирменный луковый соус, фирменный «Сырный» соус	290 г	\N	6.9	t
21	1851	Бургер «Митбургер»	Бургеры	Котлета из свинины, помидор, огурцы маринованные, сыр «Чеддер», зелёный салат, лук, фирменный «Луковый» соус	290 г	\N	7.6	t
21	1852	Бургер «Драйв»	Бургеры	Котлета из свинины, помидор, огурцы маринованные, сыр «Чеддер», перец халапеньо, зелёный салат, фирменный соус «Барбекю»	285 г	\N	8.9	t
21	1853	Бургер «Шеф»	Бургеры	Котлета из говядины, помидор, перец сладкий, огурцы маринованные, сыр «Чеддер», зелёный салат, лук, фирменный луковый соус	300 г	\N	9.3	t
21	1854	Двойной чикенбургер	Бургеры	Две котлеты из куриного филе, помидор, огурцы маринованные, сыр «Чеддер», зелёный салат, , фирменный луковый соус, фирменный «Сырный» соус	425 г	\N	10.5	t
21	1855	Бургер «Чили»	Бургеры	Котлета из говядины, помидор, огурцы маринованные, сыр «Чеддер», перец халапеньо, зелёный салат, фирменный соус «Барбекю»	285 г	\N	10.5	t
21	1856	Бургер «Брутальный»	Бургеры	Две котлеты из говядины, помидор, огурцы маринованные, сыр «Чеддер», зелёный салат, лук, фирменный соус «Барбекю», фирменный «Сырный» соус	425 г	\N	16	t
21	1857	Бургер «Детский»	Бургеры	Котлета куриная, сыр «Чеддер», кетчуп	220 г	\N	5.2	t
21	1858	Шаурма «Королевская»	Шаурма	Филе куриное, зелёный салат, сыр твёрдый, картофель фри, шампиньоны, помидор, огурцы солёные, капуста белокочанная, лук, фирменный соус	600 г	\N	9.99	t
21	1859	Шаурма «Арабская»	Шаурма	Филе куриное, картофель фри, соленый огурец, фирменный соус	290 г	\N	4.9	t
21	1860	Шаурма «Мексиканская»	Шаурма	Филе куриное, зелёный салат, картофель фри, помидор, огурцы солёные, кукуруза, капуста, лук, фирменный соус острый	370 г	\N	5.1	t
21	1861	Шаурма «Дамаск»	Шаурма	Филе куриное, зелёный салат, помидор, огурец, огурцы солёные, капуста белокочанная, фирменный соус	360 г	\N	4.9	t
21	1862	Шаурма «Голландская»	Шаурма	Филе куриное, зелёный салат, помидор, капуста, огурец, соус сырный, фирменный соус	330 г	\N	5.5	t
21	1863	Шаурма «Греческая»	Шаурма	Помидор, огурец, филе куриное, перец сладкий, сыр «Фета», капуста белокочанная, маслины, лук, греческий соус	500 г	\N	7.2	t
21	1864	Шаурма «Вегетарианская» с картофелем фри	Шаурма	Зелёный салат, помидор, огурец, капуста, картофель фри, лук, фирменный соус	515 г	\N	4.7	t
21	1865	Шаурма «Вегетарианская» с сыром	Шаурма	Зелёный салат, сыр твёрдый, сыр «Моцарелла», помидор, огурец, лук, капуста, фирменный соус	515 г	\N	4.4	t
21	1866	Фалафель 	Шаурма	Фалафель, зелёный салат, помидор, огурцы солёные, капуста, лук, соус «Тахини»	360 г	\N	3.9	t
21	1867	Сосиска «По‑восточному»	Шаурма	Сосиска, капуста белокочанная, огурцы солёные, морковь «По-корейски», кетчуп, горчица	220 г	\N	4.5	t
21	1868	Шаурма «Арабская» с говядиной	Шаурма			\N	8.5	t
21	1869	Шаурма «Голландская» с говядиной	Шаурма			\N	9	t
21	1870	Шаурма «Дамасская» с говядиной	Шаурма			\N	8.5	t
21	1871	Шаурма «Мексиканская» с говядиной	Шаурма			\N	9.5	t
21	1872	Шаурма «Королевская» с говядиной	Шаурма			\N	14.99	t
21	1873	Сэндвич «Гонконгский» с сыром «Брынза» и помидорами	Сэндвичи	Гонконгская вафля, салат латук, помидоры свежие, сыр «Брынза», масло оливковое, базилик сушёный	230 г	\N	7.2	t
21	1874	Сэндвич «Гонконгский» с шаурмой	Сэндвичи	Гонконгская вафля, соус чесночный, салат латук, лук ялтинский, филе куриное, помидоры, огурец солёный	240 г	\N	7.5	t
21	1875	Сэндвич «Гонконгский» с колбасками	Сэндвичи	Гонконгская вафля, колбаска, соус горчичный, салат латук, помидоры, огурцы маринованные	220 г	\N	8.5	t
23	2066	Пивная тарелка	Закуски		510 г	\N	35	t
21	1876	Сэндвич «Гонконгский» с наггетсами	Сэндвичи	Гонконгская вафля, наггетсы куриные, салат латук, соус «Тар‑тар», помидоры	230 г	\N	8.2	t
21	1877	Сэндвич-бургер «Гонконгский»	Сэндвичи	Гонконгская вафля, котлета из свинины, сыр «Чеддер», салат латук, лук ялтинский, кетчуп, помидоры, картофель фри	250 г	\N	10.4	t
21	1878	Салат «Греческий»	Салаты	Помидоры, огурцы, перец сладкий, сыр «Фета», салат «Айсберг», лук, маслины, греческая заправка	150 г	\N	5	t
21	1879	Картофель фри	Закуски		150 г	\N	3.5	t
21	1880	Дольки картофельные фри	Закуски		120 г	\N	2.2	t
21	1881	Кольца луковые	Закуски		100 г	\N	3.8	t
21	1882	Наггетсы куриные 	Закуски		80 г	\N	2.7	t
21	1883	Куриные крылышки фри	Закуски		210 г	\N	7.6	t
21	1884	Шаурма «Детская»	Детское меню		300 г	\N	4.3	t
21	1885	Бургер «Детский»	Детское меню		215 г	\N	5.2	t
21	1886	Картофель фри	Детское меню		80 г	\N	2.2	t
21	1887	Наггетсы куриные 	Детское меню		80 г 4 шт	\N	2.7	t
21	1888	Соус Heinz «Кисло‑сладкий»	Соусы			\N	0.7	t
21	1889	Соус Heinz «Цезарь»	Соусы			\N	0.7	t
21	1890	Соус Heinz «Чесночный»	Соусы			\N	0.7	t
21	1891	Соус Heinz «Барбекю»	Соусы			\N	0.7	t
21	1892	Соус майонезный Astoria «Сырный»	Соусы			\N	0.7	t
21	1893	Кетчуп	Соусы			\N	0.7	t
21	1894	Напиток газированный «Coca‑Cola»	Напитки		330 мл	\N	2.1	t
21	1895	Напиток газированный «Sprite»	Напитки		500 мл	\N	2.7	t
21	1896	Напиток газированный «Fanta»	Напитки		500 мл	\N	2.7	t
21	1897	Вода «Бон-Аква» газированная	Напитки		500 мл	\N	2	t
21	1898	Вода «Бон-Аква» негазированная	Напитки		500 мл	\N	1.9	t
21	1899	Напиток «Фьюз ти» лесная ягода	Напитки		500 мл	\N	2.9	t
21	1900	Напиток «Добрый „Палпи“» апельсиновый	Напитки		450 мл	\N	2.5	t
21	1901	Напиток «Добрый „Палпи“» тропический вкус	Напитки		450 мл	\N	2.5	t
21	1902	Чайный напиток «Фьюз ти» клубника и малина	Напитки		500 мл	\N	2.9	t
21	1903	Напиток «Fanta» мандарин	Напитки		500 мл	\N	2.7	t
21	1904	Напиток «Добрый Палпи» ананасовый	Напитки		500 мл	\N	2.5	t
21	1905	Нектар «Добрый» яблочный	Напитки		200 мл	\N	1.6	t
21	1906	Нектар «Добрый» мультифруктовый	Напитки		200 мл	\N	1.6	t
21	1907	Энергетический напиток «Burn»	Напитки			\N	4	t
22	1908	Омлет с зеленью	Завтраки	Яйца, зелень	135 г	\N	2.5	t
22	1909	Омлет с зеленью и овощами	Завтраки			\N	2.9	t
22	1910	Лаваш с сыром	Завтраки	Бездрожжевой тонкий лаваш, запечённый с сочной сырной начинкой		\N	1.5	t
22	1911	«Большой завтрак»	Завтраки	Омлет из яиц с зеленью, мясо с гриля на выбор, свежие овощи и лаваш с сыром		\N	7.9	t
22	1912	Дурум «Утренний»	Завтраки	Пышный омлет из яиц с зеленью в сочетании с ароматным куриным мясом на гриле, перцем, кукурузой, кусочками помидора, заправленный фирменным соусом и завернутый в тонкий лаваш		\N	6	t
22	1913	Каша овсяная	Каша на завтрак	Цельные хлопья овсяные, заваренные на воде или молоке на выбор	250 г	\N	2.8	t
22	1914	Дурум «Детский» с курицей	Детское меню	Турецкое блюдо из лаваша, начинённого куриным мясом-гриль и овощами, с соусом по фирменному рецепту 	195 г	\N	4	t
22	1915	Детский БОКС с бургером	Детское меню	Чикенбургер, сок, картофель фри, игрушка		\N	6.3	t
22	1916	Детский БОКС с дурумом с курицей	Детское меню	Дурум-донер детский с курицей, игрушка, картофель фри маленький, сок, соус на выбор: фирменный, чесночный, чили, сметанный 	195 г	\N	8.5	t
22	1917	Лаваш с сыром	Детское меню	Бездрожжевой тонкий лаваш, запечённый с сочной сырной начинкой		\N	1.5	t
22	1918	Лукум «Детский мир»	Детское меню	Набор фруктовых восточных сладостей рахат‑лукум		\N	3	t
22	1919	Коллекционные стикеры	Детское меню	Набор фирменных стикеров от MCDoner-это наклейки, которые украсят любую поверхность, придадут индивидуальности вашему смартфону/планшету/ноутбуку и превратят обычные вещи в уникальные		\N	0.5	t
22	1954	Топпинг к каше	Топинг	Укажите в комментарии: клубника, шоколад, карамель, банан, малина, баблгам		\N	0.4	t
22	1920	Дурум «Мега Чикен Донер»	Дурум	Лаваш, мясо курицы, овощи, картофель фри, маринованный огурец, фирменный соус, чесночный соус	570 г	\N	9	t
22	1921	Дурум с курицей	Дурум	Турецкое блюдо из лаваша, начинённого куриным мясом-гриль и овощами, с соусом на выбор	245 г	\N	4	t
22	1922	Дурум с говядиной	Дурум	Турецкое блюдо из лаваша, начинённого говяжьим мясом-гриль и овощами, с соусом на выбор	400 г	\N	6	t
22	1923	Дурум «Микс»	Дурум	Турецкое блюдо из лаваша, начинённого говяжьим и куриным мясом-гриль и овощами, с соусом на выбор	400 г	\N	6	t
22	1924	Вег-дурум	Дурум	Основа из лаваша, начиненного сыром и овощами, с соусом на выбор	300 г	\N	5.5	t
22	1925	Донер с курицей	Донер	Нарезанное тонкими пластами мясо курицы-гриль на свежевыпеченной турецкой лепёшке с кунжутом в сочетании с помидорами и листьями салата, с соусом на выбор	435 г	\N	8	t
22	1926	Донер с говядиной	Донер	Нарезанное тонкими пластами мясо говядины-гриль на свежевыпеченной турецкой лепёшке с кунжутом в сочетании с помидорами и листьями салата	435 г	\N	8	t
22	1927	Донер «Микс»	Донер	Нарезанное тонкими пластами говяжье и филе куриное-гриль на свежевыпеченной турецкой лепёшке с кунжутом в сочетании с помидорами и листьями салата, с соусом на выбор	435 г	\N	8	t
22	1928	Донер «Цезарь»	Донер	Нарезанное тонкими пластами сочное мясо курицы-гриль в сочетании со свежими овощами, сыром «Пармезан» и специальным соусом в свежевыпеченной румяной турецкой лепешке с кунжутом.	403 г	\N	8	t
22	1929	Лахмаджун	Лахмаджун	Турецкое блюдо на основе из тонкого теста с начинкой из говяжьего фарша, которое запекается в печи до румяной корочки		\N	3	t
22	1930	Лахмаджун с сыром	Лахмаджун	Турецкое блюдо на основе из тонкого теста с начинкой из говяжьего фарша с сыром, которое запекается в печи до румяной корочки	180 г	\N	3.7	t
22	1931	Лахмаджун с овощами	Лахмаджун	Турецкое блюдо на основе из тонкого теста с начинкой из говяжьего фарша и овощей, которое запекается в печи до румяной корочки	210 г	\N	5	t
22	1932	Куриные крылышки	Куриные крылышки		6 шт	\N	6.2	t
22	1933	ДонБургер	Бургер	Булочка с кунжутной посыпкой, начинённая говядиной с вертела, помидором, салатом «Айсберг», маринованными огурцами и сыром «Чеддер», заправленная чесночным соусом	225 г	\N	5.5	t
22	1934	Бургер «ДоннаЧика»	Бургер	Булочка с кунжутной посыпкой, начинённая мясом курицы с вертела, ананасами, салатом, ломтиком помидора, заправленная специальным соусом на йогуртной основе	225 г	\N	5.5	t
22	1935	Мега Биф Бургер	Бургер	Большой Бургер с двумя сочными котлетами из говядины, двойной порцией сыра и соуса в сочетании с маринованным огурчиком и свежим томатом на картофельной булочке.		\N	7.5	t
22	1936	Донер-БОКС с курицей	Боксы	Салат, картофель фри, мясо и соус на выбор: фирменный, чесночный, чили, сметанный	340 г	\N	6.9	t
22	1937	«Атлетик БОКС»	Боксы	Овощной салат, мясо курицы, лаваш с сыром, оливковая заправка	270 г	\N	7.1	t
22	1938	Донер-БОКС с говядиной	Боксы	Салат, картофель фри, мясо говядины с вертела + соус на выбор		\N	6.9	t
22	1939	Донер-БОКС «Микс»	Боксы	Салат, картофель фри, мясо курицы и говядины с вертела + соус на выбор		\N	6.9	t
22	1940	Салат «Легкий»	Салат	В составе: салат «Айсберг», капуста пекинская, помидоры, перец сладкий, кукуруза, свежая зелень	200 г	\N	5.5	t
22	1941	Картофель фри	Фри			\N	2.5	t
22	1942	Картофель фри (большой)	Фри			\N	2.9	t
22	1943	Картофель фри (мега)	Фри			\N	3.8	t
22	1944	Картофельные дольки	Фри			\N	3.3	t
22	1945	Лаваш с сыром	Фри	Бездрожжевой тонкий лаваш, запечённый с сочной сырной начинкой		\N	1.5	t
22	1946	Коллекционные стикеры	Топинг	Набор фирменных стикеров от MCDoner-это наклейки, которые украсят любую поверхность, придадут индивидуальности вашему смартфону/планшету/ноутбуку и превратят обычные вещи в уникальные		\N	0.5	t
22	1947	Соус фирменный	Топинг			\N	0.7	t
22	1948	Соус чесночный	Топинг			\N	0.7	t
22	1949	Соус «Чили»	Топинг			\N	0.7	t
22	1950	Соус сметанный	Топинг			\N	0.7	t
22	1956	Пахлава «Бюль‑бюль»	Десерты	Восточная сладость в форме полукольца из слоёного теста с орехами в медовом сиропе, украшенная грецким орехом		\N	3	t
22	1957	Чурчхела	Десерты	Традиционная восточная сладость из орехов и натурального сока	1 шт	\N	5.5	t
22	1958	Лукум «Гранат»	Десерты	Восточная сладость на основе натурального гранатового сока		\N	1.5	t
22	1959	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.6	t
22	1960	Напиток газированный Fanta	Напитки		500 мл	\N	2.6	t
22	1961	Напиток газированный Sprite	Напитки		500 мл	\N	2.6	t
22	1962	Вода BonAqua негазированная	Напитки		500 мл	\N	1.6	t
22	1963	Напиток чайный Fuze Tea «Лимон»	Напитки		500 мл	\N	2.3	t
22	1964	Напиток чайный Fuze Tea «Манго‑ромашка»	Напитки		500 мл	\N	2.3	t
22	1965	Напиток чайный Fuze Tea «Цитрус»	Напитки		500 мл	\N	2.3	t
22	1966	Напиток чайный Fuze Tea «Клубника и малина»	Напитки		500 мл	\N	2.3	t
22	1967	Берн Ориджинал	Напитки		250 г	\N	3.5	t
22	1968	Берн Яблоко‑Киви	Напитки		250 г	\N	3.5	t
23	1969	Ролл «Миннесота»	Роллы	Рис, нори, сёмга слабосолёная, сыр творожный	260 г	\N	11.5	t
23	1970	Ролл «Арканзас»	Роллы	Рис, нори, сёмга слабосолёная, сыр творожный, огурец	280 г	\N	12	t
23	1971	Ролл «Алабама»	Роллы	Рис, нори, снежный краб, сыр творожный, соус «Терияки»	275 г	\N	7.5	t
23	1972	Ролл «Миссисипи»	Роллы	Рис, нори, креветки, сыр творожный, икра тобико	270 г	\N	12.5	t
23	1973	Ролл «Теннесси»	Роллы	Рис, нори, сёмга слабосолёная, сыр творожный, салат «Айсберг»	270 г	\N	13.13	t
23	1974	Ролл «Аляска»	Роллы	Рис, ноир, сёмга слабосолёная, сыр творожный, авокадо	270 г	\N	12.5	t
23	1975	Ролл «Вашингтон»	Роллы	Рис, нори, сёмга слабосолёная, сыр творожный, перец, огурец	280 г	\N	12.5	t
23	1976	Ролл «Мэн»	Роллы	Рис, нори, сыр творожный, угорь, огурец, авокадо	280 г	\N	12.5	t
23	1977	Ролл «Нью‑Джерси»	Роллы	Рис, нори, снежный краб, огурец, майонез	260 г	\N	6.6	t
23	1978	Ролл «Южная Дакота»	Роллы	Рис, нори, угорь, сыр творожный, креветки	260 г	\N	11.5	t
23	1979	Ролл «Вермонт»	Роллы	Рис, нори, сыр творожный, огурец, авокадо, салат «Айсберг»	260 г	\N	8.5	t
23	1980	Ролл «Нью‑Мексико»	Роллы	Рис, нори, чукка‑салат	250 г	\N	7	t
23	1981	Ролл «Северная Дакота»	Роллы	Рис, нори, сыр творожный, снежный краб, такуан	260 г	\N	7	t
23	1982	Ролл «Нью‑Йорк»	Роллы	Рис, нори, сыр творожный	250 г	\N	7	t
23	1983	Ролл «Джорджия»	Сложные роллы	Рис, нори, сыр творожный, сёмга подкопчённая, огурец, сыр плавленый ломтевой	305 г	\N	13	t
23	1984	Ролл «Филадельфия»	Сложные роллы	Рис, нори, сыр творожный, огурец, сёмга слабосолёная	300 г	\N	14	t
23	1985	Ролл «Калифорния»	Сложные роллы	Рис, нори, сыр творожный, креветки, авокадо, икра тобико, соус «Терияки»	310 г	\N	13.5	t
23	1986	Ролл «Индиана»	Сложные роллы	Рис, нори, сыр творожный, огурец, перец, морковь, кунжут	280 г	\N	8.5	t
23	1987	Ролл «Колорадо»	Сложные роллы	Рис, нори, сыр творожный, угорь, такуан, кунжут	290 г	\N	11.5	t
23	1988	Ролл «Айдахо»	Сложные роллы	Рис, нори, сыр творожный, огурец, угорь	310 г	\N	14.5	t
23	1989	Ролл «Бонито»	Сложные роллы	Рис, нори, сыр творожный, огурец, сёмга подкопчённая, стружка тунца	270 г	\N	11	t
23	1990	Ролл «Миссури»	Сложные роллы	Рис, нори, сыр творожный, снежный краб, угорь, креветки, икра тобико	300 г	\N	14	t
23	1991	Ролл «Вирджиния»	Сложные роллы	Рис, нори, сыр творожный, перец, чукка‑салат, кунжут	270 г	\N	7	t
23	1992	Ролл «Юта»	Сложные роллы	Рис, нори, сыр творожный, сёмга слабосолёная, икра лососёвая	310 г	\N	15	t
23	1993	Ролл «Пенсильвания»	Сложные роллы	Рис, нори, сыр творожный, угорь, кунжут	305 г	\N	14	t
23	1994	Ролл «Огайо»	Сложные роллы	Рис, нори, сыр творожный, стружка тунца	270 г	\N	8.5	t
23	1995	Ролл «Иллинойс»	Сложные роллы	Рис, нори, сыр творожный, кунжут	280 г	\N	7.5	t
23	1996	Ролл «Невада»	Сложные роллы	Рис, нори, сыр творожный, креветки, угорь, сёмга слабосолёная	310 г	\N	15	t
23	1997	Ролл «Гавайи»	Сложные роллы	Рис, нори, сыр творожный, авокадо, сёмга слабосолёная, икра тобико	310 г	\N	15	t
23	1998	Ролл «Монтана»	Сложные роллы	Рис, нори, сыр творожный, огурец, авокадо, сёмга подкопчённая, икра тобико	320 г	\N	14.5	t
23	1999	Ролл «Луизиана»	Сложные роллы	Рис, нори, сыр творожный, огурец, авокадо, сёмга слабосолёная, кунужт	270 г	\N	10	t
23	2000	Ролл «Небраска»	Сложные роллы	Рис, нори, сыр творожный, сыр плавленый ломтевой, икра лососёвая	315 г	\N	14	t
23	2001	Ролл «Орегон»	Сложные роллы	Рис, нори, сыр творожный, авокадо, сёмга слабосолёная, стружка тунца	260 г	\N	14	t
23	2002	Ролл «Канзас»	Сложные роллы	Рис, нори, сыр творожный, авокадо, угорь, сёмга слабосолёная, икра тобико	300 г	\N	14.5	t
23	2003	Ролл «Оклахома»	Сложные роллы	Рис, нори, сёмга слабосолёная, огурец, сыр творожный, икра тобико	300 г	\N	14	t
23	2004	Ролл «Флорида»	Сложные роллы	Рис, нори, сёмга слабосолёная, авокадо, сыр творожный, снежный краб	320 г	\N	15	t
23	2005	Ролл «Аризона»	Сложные роллы	Рис, нори, сыр творожный, угорь, сыр плавленый ломтевой, кунжут	300 г	\N	13	t
23	2006	Ролл «Кентукки»	Сложные роллы	Рис, нори, сыр творожный, креветки, сыр плавленый ломтевой	315 г	\N	12	t
23	2007	Чиз-ролл	Сложные роллы	Рис, нори, сыр творожный, сыр «Чеддер», сыр «Пармезан», сыр плавленый ломтевой	360 г	\N	12	t
23	2008	Ролл «Северная Каролина»	Сложные роллы	Рис, нори, сыр творожный, икра тобико, сёмга слабой соли, огурец, соус «Ким‑чи», икра масаго	420 г	\N	14.5	t
23	2009	Ролл «Финикс»	Сложные роллы	Рис, нори, огурец, сыр творожный, сёмга слабой соли, грудинка копчёно‑варёная	335 г	\N	13.5	t
23	2010	Ролл «Майами»	Сложные роллы	Рис, нори, сыр, майонез, чеснок, помидоры, ветчина	310 г	\N	10	t
23	2011	Ролл «Остин»	Сложные роллы	Рис, нори, сыр творжный, огурец, ветчина, грудинка копчёно‑варёная	335 г	\N	9	t
23	2012	Ролл «Бостон Hot»	Горячие роллы	Рис, нори, сёмга слабой соли, сыр творожный, авокадо, сыр «Пармезан», майонез, кунжут	345 г	\N	12.12	t
23	2013	Ролл «Чикаго Hot»	Горячие роллы	Рис, нори, угорь, сыр творожный, сыр «Пармезан», майонез	345 г	\N	15.15	t
23	2014	Ролл «Лос-Анджелес Hot»	Горячие роллы	Рис, нори, сыр творожный, креветки, сыр «Пармезан», майонез, икра тобико	350 г	\N	14.5	t
23	2015	Ролл «Сан‑Хосе Hot»	Горячие роллы	Рис, нори, сёмга слабой соли, авокадо, перец, сыр творожный, сыр «Пармезан», майонез	330 г	\N	13	t
23	2016	Ролл «Нью‑Йорк Hot»»	Горячие роллы	Рис, нори, сыр творожный, сыр «Пармезан», майонез	300 г	\N	8	t
23	2017	Ролл «Южная Дакота Hot»»	Горячие роллы	Рис, нори, сыр творожный, креветки, угорь, сыр «Чеддер», майонез, соус «Ким‑чи», кунжут	330 г	\N	15	t
23	2018	Ролл «Миннесота Hot»»	Горячие роллы	Рис, нори, сёмга подкопчённая, сыр творожный, сыр «Чеддер», майонез, соус «Ким‑чи»	310 г	\N	13.5	t
23	2019	Ролл «Сан-Диего Hot»»	Горячие роллы	Рис, нори, сёмга слабой соли, угорь, снежный краб, сыр творожный, сыр «Чеддер», майонез, соус «Ким‑чи»	340 г	\N	15	t
23	2020	Ролл «Алабама Hot»	Горячие роллы	Рис, нори, сыр творожный, снежный краб, соус «Терияки», майонез, соус «Ким‑чи»	395 г	\N	10.5	t
23	2021	Ролл «Арканзас Hot»	Горячие роллы	Рис, нори, сыр творожный, сёмга слабой соли, огурец, снежный краб, майонез, соус «Ким‑чи»	390 г	\N	13	t
23	2022	Ролл «Аляска Corn»	Горячие роллы	Рис, нори, сыр творожный, авокадо, сёмга слабой соли, темпура, сухари панировочные	390 г	\N	13.5	t
23	2023	Ролл «Атланта Corn»	Горячие роллы	Рис, нори, сыр творожный, креветки, сёмга слабой соли, темпура, сухари панировочные	400 г	\N	13	t
23	2024	Ролл «Омаха Corn»	Горячие роллы	Рис, нори, снежный краб, креветки, сыр творожный, темпура, сухари панировочные	390 г	\N	11	t
23	2025	Ролл «Хьюстон Corn»	Горячие роллы	Рис, нори, сыр творожный, угорь, темпура, сухари панировочные	390 г	\N	14	t
23	2026	Ролл «Буффало Corn»	Гор��чие роллы	Рис, нори, сыр творожный, филе цыплёнка-бройлера копчёное, лук, темпура, сухари	390 г	\N	10	t
23	2027	Ролл «Балтимор Hot»	Горячие роллы	Рис, нори, сыр творожный, филе цыплёнка-бройлера копчёное, перец, сыр «Пармезан», майонез	320 г	\N	10	t
23	2028	Ролл «Сан-Франциско Corn»	Горячие роллы	Рис, нори, сыр творожный, ветчина, темпура, сухари	380 г	\N	10.5	t
23	2029	Сет №1	Суши-сеты	Ролл «Филадельфия», ролл «Джорджия», ролл «Пенсильвания», японский гарнир	930 г	\N	38	t
23	2030	Сет №2	Суши-сеты	Ролл «Иллинойс», ролл «Вирджиния», ролл «Луизиана», японский гарнир	820 г	\N	21	t
23	2031	Сет №3	Суши-сеты	Ролл «Арканзас», ролл «Алабама», ролл «Нью-Мексико», японский гарнир	805 г	\N	22	t
23	2032	Сет №4	Суши-сеты	Ролл «Сан-Хосе Hot», ролл «Южная Дакота Hot», ролл «Алабама Hot», японский гарнир	1055 г	\N	36	t
23	2033	Сет №5	Суши-сеты	Ролл «Канзас», ролл «Оклахома», ролл «Миссури», японский гарнир	900 г	\N	38	t
23	2034	Сет №6	Суши-сеты	Ролл «Вермонт», ролл «Индиана», ролл «Нью-Йорк», японский гарнир	790 г	\N	20	t
23	2035	Сет №7	Суши-сеты	Ролл «Чизролл», ролл «Иллинойс», ролл «Аризона», японский гарнир	940 г	\N	29	t
23	2036	Сет №8 Corn	Суши-сеты	Ролл «Аляска Corn», ролл «Атланта Corn», ролл «Омаха Corn», ролл «Хьюстон Corn», японский гарнир	1170 г	\N	46	t
23	2037	Сет №9 «Темпура»	Суши-сеты	Ролл «Аляска темпура», ролл «Атланта темпура», ролл «Омаха темпура», ролл «Хьюстон темпура», японский гарнир	1170 г	\N	43	t
23	2038	Сет №10	Суши-сеты	Ролл «Бонито», ролл «Арканзас», ролл «Луизиана», японский гарнир	720 г	\N	30	t
23	2039	Сет №11	Суши-сеты	Ролл «Алабама», ролл «Миннесота», ролл «Филадельфия», японский гарнир	835 г	\N	30	t
23	2040	Сет №12	Суши-сеты	Ролл «Даллас», ролл «Финикс», ролл «Ванкувер», японский гарнир	935 г	\N	32	t
23	2041	Сет №13	Суши-сеты	Ролл «Айдахо», ролл «Аляска», ролл «Калифорния», японский гарнир	890 г	\N	38	t
23	2042	Сет №14	Суши-сеты	Ролл «Южная Дакота», ролл «Буффало Corn», ролл «Бостон Hot», японский гарнир	990 г	\N	35	t
23	2043	Сет №15	Суши-сеты	Ролл «Айдахо», ролл «Небраска», ролл «Остин», ролл «Оклахома», ролл «Филадельфия»	1560 г	\N	50	t
23	2044	Ролл «Аляска темпура»	Темпура	Рис, нори, сыр творожный, авокадо, сёмга слабой соли, темпура, имбирь, васаби, соус соевый	350 г	\N	13	t
23	2045	Ролл «Атланта темпура»	Темпура	Рис, нори, сыр творожный, креветки, сёмга слабой соли, темпура, имбирь, васаби, соус соевый	460 г	\N	12.5	t
23	2046	Ролл «Омаха темпура»	Темпура	Рис, нори, снежный краб, креветки, сыр творожный, темпура, имбирь, васаби, соус соевый	350 г	\N	10.5	t
23	2047	Ролл «Хьюстон темпура»	Темпура	Рис, нори, сыр творожный, угорь, темпура, имбирь, васаби, соус соевый	350 г	\N	13.5	t
23	2048	Ролл «Буффало темпура»	Темпура	Рис, нори, сыр творожный, филе цыплёнка-бройлера копчёное, лук, темпура	360 г	\N	9.5	t
23	2049	Ролл «Сан-Франциско темпура»	Темпура	Рис, нори, сыр творожный, ветчина, темпура	350 г	\N	10.1	t
23	2050	Васаби 	Японский гарнир	Булочка с кунжутом, котлета, лист салатный, лук, помидор, огурцы маринованные, сыр ломтевой, соус	20 г	\N	0.5	t
23	2051	Имбирь маринованный	Японский гарнир	Булочка с кунжутом, котлета, бекон, лист салатный, лук, помидор, огурцы маринованные, сыр ломтевой, соус	30 г	\N	0.5	t
23	2052	Соус соевый	Японский гарнир	Булочка с кунжутом, котлета, лист салатный, лук, помидор, огурцы маринованные, сыр ломтевой, соус		\N	0.5	t
23	2053	Соус «Терияки» 	Японский гарнир	Булочка с кунжутом, котлета рыбная, лист салатный, лук, помидор, огурцы маринованные, сыр ломтевой, соус		\N	1.5	t
23	2054	Соус ореховый	Японский гарнир	Булочка с кунжутом, котлета куриная, лист салатный, лук, помидор, огурцы маринованные, сыр ломтевой, соус		\N	1.5	t
23	2055	Чукка-салат 	Японский гарнир	В комплекте идёт чесночный соус	200 г	\N	5.5	t
23	2056	Чизбургер	Бургеры	В комплекте идёт чесночный соус	245 г	\N	6	t
23	2057	Гриль-бургер	Бургеры	Сыр «Моцарелла», панировка, соус чесночный	270 г	\N	7.5	t
23	2058	Dreamбургер	Бургеры	Кольца кальмара, сырные палочки, тигровые креветки, наггетсы, соус чесночный, кетчуп	390 г	\N	9	t
23	2059	Фишбургер	Бургеры		230 г	\N	6	t
23	2060	Чикенбургер	Бургеры		230 г	\N	6	t
23	2061	Картофель фри	Закуски		120 г	\N	3	t
23	2062	Наггетсы куриные 	Закуски		110 г	\N	6	t
23	2063	Кольца кальмара в панировке	Закуски		110 г	\N	9	t
23	2064	Тигровые креветки в панировке	Закуски		130 г	\N	13	t
23	2067	Газированный напиток Coca‑Cola	Напитки		500 мл	\N	2	t
23	2068	Газированный напиток Fanta	Напитки		500 мл	\N	2	t
23	2069	Газированный напиток Sprite	Напитки		500 мл	\N	2	t
23	2070	Вода BonAqua среднегазированная	Напитки		500 мл	\N	1.3	t
23	2071	Вода BonAqua негазированная	Напитки		500 мл	\N	1.3	t
23	2072	Энергетический напиток Burn	Напитки		500 мл	\N	2.8	t
23	2073	Энергетический напиток Burn «Освежающий заряд»	Напитки		500 мл	\N	2.8	t
24	2074	Нигири «Магуро»	Нигири	Тунец, васаби 5 гр	35 г 1 шт	\N	3.2	t
24	2075	Нигири с лососем маринованным	Нигири	Лосось, маринованный в соевом соусе, майонез, икра тобико, васаби 5 гр	38 г 1 шт	\N	3.2	t
24	2076	Нигири с лососем опалённым	Нигири	Лосось опалённый, такуан маринованный, соус «Чили» сладкий, майонез, нори, васаби 5 гр	39 г 1 шт	\N	3.2	t
24	2077	Нигири с окунем маринованным	Нигири	Морской окунь, маринованный в соевом соусе, икра тобико, майонез, васаби 5 гр	33 г 1 шт	\N	2.2	t
24	2078	Нигири с окунем опалённым	Нигири	Морской окунь опалённый, майонез, соус «Чили» сладкий, кешью, васаби 5 гр	33 г 1 шт	\N	2.2	t
24	2079	Нигири с тунцом опалённым	Нигири	Тунец опалённый, стружка тунца, майонез, соус «Чили» сладкий, васаби 5 гр	38 г 1 шт	\N	3.4	t
24	2080	Нигири с тунцом маринованным	Нигири	Тунец, маринованный в соевом соусе, майонез, икра тобико, васаби 5 гр	38 г 1 шт	\N	3.4	t
24	2081	Нигири «Тай»	Нигири	Морской окунь, васаби 5 гр	30 г 1 шт	\N	2	t
24	2082	Нигири «Тамаго»	Нигири	Омлет японский, соус «Терияки», кунжут, васаби 5 гр	44 г 1 шт	\N	1.8	t
24	2083	Нигири «Унаги» 	Нигири	Угорь копчёный, соус «Терияки», кунжут, васаби 5 гр	34 г 1 шт	\N	3.7	t
24	2084	Нигири «Эби»	Нигири	Креветка тигровая, васаби 5 гр	32 г 1 шт	\N	3.5	t
24	2085	Нигири «Сяке»	Нигири	Лосось, васаби 5 гр	35 г 1 шт	\N	2.8	t
24	2086	Гункан «Спайси кунсей» 	Гунканы	Лосось копчёный, соус острый, омлет японский, зелёный лук, васаби 5 гр	41 г 1 шт	\N	2.9	t
24	2087	Гункан «Спайси магуро» 	Гунканы	Тунец, соус острый, стружка тунца, васаби 5 гр	40 г 1 шт	\N	3.4	t
24	2088	Гункан «Спайси сурими» 	Гунканы	Палочки крабовые, соус острый, кунжут, васаби 5 гр	40 г 1 шт	\N	2.1	t
24	2089	Гункан «Спайси сяке» 	Гунканы	Лосось, соус острый, васаби 5 гр	38 г 1 шт	\N	3.1	t
24	2090	Гункан «Спайси сяке микс» 	Гунканы	Лосось жареный, соус острый, маринованный такуан, васаби 5 гр	43 г 1 шт	\N	3.2	t
24	2091	Гункан «Спайси тай» 	Гунканы	Морской окунь, соус острый, кешью, васаби 5 гр	41 г 1 шт	\N	2.5	t
24	2092	Гункан «Спайси тай микс» 	Гунканы	Морской окунь жареный, соус острый, укроп, васаби	40 г 1 шт	\N	2.9	t
24	2093	Гункан «Спайси тамаго» 	Гунканы	Омлет японский, соус острый, творожный сыр, лук зелёный, васаби 5 гр	40 г 1 шт	\N	1.8	t
24	2094	Гункан «Тобико Блэк»	Гунканы	Икра тобико, васаби 5 гр	35 г 1 шт	\N	3.8	t
24	2095	Гункан «Тобико Грин»	Гунканы	Икра тобико, васаби 5 гр	35 г 1 шт	\N	3.8	t
24	2096	Гункан «Тобико Рэд»	Гунканы	Икра тобико, васаби 5 гр	35 г 1 шт	\N	3.8	t
24	2097	Гункан «Эби микс»	Гунканы	Креветка тигровая, авокадо, сыр творожный, васаби 5 гр	38 г 1 шт	\N	3.4	t
24	2098	Гункан «Ясай»	Гунканы	Авокадо, огурец, салат «Айсберг», итальянский соус, васаби 5 гр	40 г 1 шт	\N	1.6	t
24	2099	Ролл «Спайси текка маки» 	Маки	Тунец, соус острый, васаби 5 гр	8 шт	\N	6.6	t
24	2100	Ролл «Сяке маки»	Маки	Лосось, васаби 5 гр	8 шт	\N	5.9	t
24	2101	Ролл «Спайси сяке маки» 	Маки	Лосось, соус острый, васаби 5 гр	8 шт	\N	6.4	t
24	2102	Ролл «Текка маки»	Маки	Тунец, васаби 5 гр	8 шт	\N	6.5	t
24	2103	Ролл «Авокадо маки»	Маки	Авокадо, майонез, васаби 5 гр	8 шт	\N	4.4	t
24	2104	Ролл «Сяке авокадо маки»	Маки	Лосось, авокадо, васаби 5 гр	8 шт	\N	8	t
24	2105	Ролл «Каппа маки»	Маки	Огурец, кунжут, васаби 5 гр	8 шт	\N	3.5	t
24	2106	Ролл «Унаги маки» 	Маки	Угорь копчёный, огурец, васаби 5 гр	8 шт	\N	7.8	t
24	2107	Ролл «Спайси кунсей маки» 	Маки	Лосось копчёный, зелёный лук, соус острый, васаби 5 гр	8 шт	\N	7.5	t
27	2446	Перец халапеньо	Конструктор бургеров		20 г	\N	0.5	f
24	2108	Ролл «Энсёку маки»	Маки	Креветка тигровая, сыр творожный, икра масаго, васаби 5 гр	8 шт	\N	8	t
24	2109	Ролл «Катори маки»	Маки	Лосось, авокадо, творожный сыр, соевая бумага маменори, васаби 5 гр	8 шт	\N	7.6	t
24	2110	Ролл «Сяке оригами маки»	Маки	Лосось, творожный сыр, водоросли хияши вакаме, сыр «Тофу», икра тобико, васаби 5 гр	8 шт	\N	10.4	t
24	2111	Ролл «Ямато маки»	Ура Маки	Лосось жареный, японский омлет, маринованный редис такуан, орех кешью, острый соус, укроп, творожный сыр, белый и черный кунжут, лук жареный, соус «Терияки»	4 шт	\N	6.8	t
24	2112	Ролл «New Филадельфия маки»	Ура Маки	Лосось, творожный сыр, огурец, авокадо, васаби 5 гр	8 шт	\N	14.5	t
24	2113	Ролл «Филадельфия гранд маки»	Ура Маки	Лосось, творожный сыр, огурец, авокадо, васаби	8 шт	\N	14.9	t
24	2114	Ролл «Аризона маки»	Ура Маки	Креветка тигровая, огурец, помидор, майонез, кунжут, васаби 5 гр	8 шт	\N	10.6	t
24	2115	Ролл «Асахи маки»	Ура Маки	Креветка тигровая, кальмар в темпуре, авокадо, творожный сыр, стружка тунца, васаби 5 гр	8 шт	\N	12.2	t
24	2116	Ролл «Атами маки»	Ура Маки	Лосось копчёный, творожный сыр, огурец, палочки крабовые, соус острый, зелёный лук, кунжут, васаби 5 гр	8 шт	\N	10.4	t
24	2117	Ролл «Бекон маки»	Ура Маки	Бекон, творожный сыр, помидор, салат «Айсберг», соус итальянский, кешью, соус майонезный с укропом, васаби 5 гр	8 шт	\N	9.3	t
24	2118	Ролл «Бекон тай маки»	Ура Маки	Морской окунь жареный, бекон опалённый, творожный сыр, огурец, такуан маринованный, соус острый, соус «Чили» сладкий, васаби 5 гр	8 шт	\N	11.6	t
24	2119	Ролл «Бекон терияки маки» 	Ура Маки	Лосось жареный, бекон, творожный сыр, огурец, перец, зелёный лук, соус «Микс», соус «Терияки», лепестки миндаля, васаби 5 гр	8 шт	\N	11	t
24	2120	Ролл «Бекон черри маки»	Ура Маки	Бекон, творожный сыр, помидор, огурец, салат «Айсберг», соус «Микс», васаби 5 гр	8 шт	\N	8.4	t
24	2121	Ролл «Бунсаи маки»	Ура Маки	Филе цыплёнка в соусе «Терияки., авокадо, творожный сыр, маринованный такуан, салат «Айсберг», соус «Оранж», соевая бумага маменори, васаби 5 гр	8 шт	\N	9.1	t
24	2122	Ролл «Вашики маки»	Ура Маки	Тунец, творожный сыр, салат «Айсберг», такуан маринованный, соус «Терияки», васаби 5 гр	8 шт	\N	8.1	t
24	2123	Ролл «Дайсен маки»	Ура Маки	Лосось копчёный, угорь копчёный, маринованный такуан, творожный сыр, кунжут, васаби 5 гр	8 шт	\N	15.5	t
24	2124	Ролл «Кабуки маки»	Ура Маки	Тунец, творожный сыр, салат «Айсберг», маринованный такуан, икра васабико, икра тобико, соус «Микс», васаби 5 гр	8 шт	\N	16.8	t
24	2125	Ролл «Кайсо маки»	Ура Маки	Креветка тигровая, лосось, творожный сыр, водоросли хияши вакаме, васаби 5 гр	8 шт	\N	14.14	t
24	2126	Ролл «Калифорния маки»	Ура Маки	Палочки крабовые, авокадо, огурец, майонез, икра тобико оранжевая, васаби 5 гр	8 шт	\N	12.4	t
24	2127	Ролл «Карада маки»	Ура Маки	Угорь копчёный, творожный сыр, огурец, салат «Айсберг», соус «Терияки», кунжут, васаби 5 гр	8 шт	\N	14.4	t
24	2128	Ролл «Карай маки»	Ура Маки	Палочки крабовые, авокадо, соус острый, творожный сыр, маринованный такуан, соус «Терияки», васаби 5 гр	8 шт	\N	8	t
24	2129	Ролл «Кияри маки»	Ура Маки	Лосось жареный, творожный сыр, салат «Айсберг», омлет японский, соус «Терияки», кунжут, васаби 5 гр	8 шт	\N	10	t
24	2130	Ролл «Кунсей маки»	Ура Маки	Лосось копчёный, творожный сыр, соус острый, огурец, салат «Айсберг», васаби 5 гр	8 шт	\N	7.9	t
24	2131	Ролл «Магуро фреш маки»	Ура Маки	Тунец, творожный сыр, апельсин, авокадо, помидор, зелёный лук, итальянский соус, васаби 5 гр	8 шт	\N	12.4	t
24	2132	Ролл «Манго сяке маки»	Ура Маки	Лосось маринованный в соевом соусе, манго, творожный сыр, васаби 5 гр	8 шт	\N	11.7	t
24	2133	Ролл «Манго тай маки»	Ура Маки	Морской окунь опалённый, творожный сыр, манго, салат «Айсберг», соус «Чили» сладкий, васаби 5 гр	8 шт	\N	8.7	t
24	2134	Ролл «Мариока маки»	Ура Маки	Лосось копчёный, творожный сыр, маринованный такуан, помидор, омлет японский, соус «Микс», стружка тунца, нори, васаби 5 гр	8 шт	\N	10.3	t
24	2135	Ролл «Масаго кунсей маки»	Ура Маки	Лосось копчёный, творожный сыр, салат «Айсберг», икра масаго, соус острый, васаби 5 гр	8 шт	\N	11.7	t
24	2136	Ролл «Масаго тай маки»	Ура Маки	Морской окунь жареный, творожный сыр, помидор, икра масаго, соус майонезный с укропом, васаби 5 гр	8 шт	\N	10.6	t
24	2137	Ролл «Мияги маки»	Ура Маки	Лосось копчёный, творожный сыр, огурец, авокадо, кунжут, васаби 5 гр	8 шт	\N	11.4	t
24	2138	Ролл «Нара маки»	Ура Маки	Лосось, соус «Оранж», апельсин, палочки крабовые, творожный сыр, васаби 5 гр	8 шт	\N	13.4	t
24	2139	Ролл «Нефрит маки»	Ура Маки	Перец, помидор, огурец, салат «Айсберг», маринованный такуан, творожный сыр, соус «Манго-чили», кунжут, васаби 5 гр	8 шт	\N	6.1	t
24	2140	Ролл «Окинава маки»	Ура Маки	Тунец, творожный сыр, ореховый соус, икра тобико, маринованные водоросли хияши вакаме, васаби 5 гр	8 шт	\N	10.2	t
24	2141	Ролл «Омура маки»	Ура Маки	Лосось, творожный сыр, помидор, лимон, икра тобико, васаби 5 гр	8 шт	\N	11.8	t
24	2142	Ролл «Оранж тай маки»	Ура Маки	Морской окунь маринованный в соевом соусе, творожный сыр, помидор, салат «Айсберг», соус «Оранж», васаби 5 гр	8 шт	\N	9	t
24	2143	Ролл «Осака маки»	Ура Маки	Креветка тигровая, творожный сыр, авокадо, огурец, лосось, васаби 5 гр	8 шт	\N	16.5	t
24	2144	Ролл «Сакура маки»	Ура Маки	Филе цыплёнка в соусе «Терияки», творожный сыр, салат «Айсберг», манго, икра тобико красная, васаби 5 гр	8 шт	\N	9	t
24	2145	Ролл «Спайси кияри маки» 	Ура Маки	Лосось жареный, творожный сыр, помидор, салат «Айсберг», соус острый, соус «Микс», лук зелёный, васаби 5 гр	8 шт	\N	9.3	t
24	2146	Ролл «Сурими рэд маки»	Ура Маки	Палочки крабовые, творожный сыр, жареная брокколи, помидор, огурец, соус устричный, соус майонезный с укропом, васаби 5 гр	8 шт	\N	6.4	t
24	2147	Ролл «Сэндай маки»	Ура Маки	Кальмар в темпуре, тунец, творожный сыр, авокадо, лосось копчёный, васаби 5 гр	8 шт	\N	15.3	t
24	2148	Ролл «Сяке блэк маки»	Ура Маки	Лосось опалённый, творожный сыр, омлет японский, зелёный лук, соус острый, васаби 5 гр	8 шт	\N	14.4	t
24	2149	Ролл «Сяке де люкс маки»	Ура Маки	Лосось, творожный сыр, салат «Айсберг», перец, соус острый, укроп, васаби 5 гр	8 шт	\N	11.4	t
24	2150	Ролл «Сяке ясай маки»	Ура Маки	Лосось, творожный сыр, помидор, салат «Айсберг», итальянский соус, васаби 5 гр	8 шт	\N	7.9	t
24	2151	Ролл «Тай маки»	Ура Маки	Морской окунь маринованный в соусе «Терияки», творожный сыр, соус «Микс», маринованный такуан, помидор, васаби 5 гр	8 шт	\N	6.5	t
24	2152	Ролл «Тай терияки маки» 	Ура Маки	Морской окунь маринованный в соусе «Терияки», творожный сыр, салат «Айсберг», майонез, соус «Терияки», васаби 5 гр	8 шт	\N	7.9	t
24	2153	Ролл «Тамаго маки»	Ура Маки	Омлет японский, творожный сыр, огурец, салат «Айсберг», соус острый, васаби 5 гр	8 шт	\N	6.2	t
24	2154	Ролл «Токио маки»	Ура Маки	Креветка тигровая, творожный сыр, помидор, авокадо, икра тобико красная, васаби 5 гр	8 шт	\N	16.8	t
24	2155	Ролл «Тори кунсей маки»	Ура Маки	Лосось копчёный, филе цыплёнка в соусе «Терияки», творожный сыр, салат «Айсберг», икра тобико, соус «Микс», соус острый, васаби 5 гр	8 шт	\N	13.9	t
24	2156	Ролл «Тояма маки»	Ура Маки	Лосось, творожный сыр, помидор, огурец, салат «Айсберг», васаби 5 гр	8 шт	\N	11.6	t
24	2157	Ролл «Умаи маки»	Ура Маки	Лосось копчёный, творожный сыр, омлет японский, икра тобико чёрная, креветка тигровая, васаби 5 гр	8 шт	\N	16.3	t
24	2158	Ролл «Умаи фреш маки»	Ура Маки	Креветка тигровая, творожный сыр, помидор, салат «Айсберг», соус «Оранж», итальянский соус, васаби 5 гр	8 шт	\N	13.1	t
24	2159	Ролл «Филадельфия маки»	Ура Маки	Лосось, творожный сыр, авокадо, огурец, кунжут, васаби 5 гр	8 шт	\N	11	t
24	2160	Ролл «Хоккайдо маки»	Ура Маки	Лосось копчёный, творожный сыр, салат «Айсберг», имбирь маринованный, икра тобико, васаби 5 гр	8 шт	\N	11.6	t
24	2161	Ролл «Хокку маки»	Ура Маки	Креветка тигровая, творожный сыр, помидор, лимон, икра тобико, васаби 5 гр	8 шт	\N	15.2	t
24	2162	Ролл «Чиз кунсей маки»	Ура Маки	Лосось копчёный, творожный сыр, манго, омлет японский, соус «Терияки», сыр «Пармезан», васаби 5 гр	8 шт	\N	10.2	t
24	2163	Ролл «Чукка маки» 	Ура Маки	Маринованные водоросли хияши вакаме, творожный сыр, помидор, ореховый соус, кешью, васаби 5 гр	8 шт	\N	6.9	t
24	2164	Ролл «Эби фреш маки»	Ура Маки	Креветка тигровая, творожный сыр, авокадо, салат «Айсберг», соус «Оранж», васаби 5 гр	8 шт	\N	9.9	t
24	2165	Ролл «Якитори маки»	Ура Маки	Филе цыплёнка в соусе «Терияки», творожный сыр, салат «Айсберг», орех кешью, соус «Микс», соус устричный, васаби 5 гр	8 шт	\N	7.5	t
24	2166	Ролл «Ясай маки»	Ура Маки	Огурец, помидор, перец сладкий, салат «Айсберг», творожный сыр, орех кешью, кунжут, итальянский соус, укроп, васаби 5 гр	8 шт	\N	7.2	t
24	2167	Ролл «Саппоро маки»	Футо Маки	Угорь копчёный, авокадо, огурец, майонез, омлет японский, васаби 5 гр	187 г 6 шт	\N	10.7	t
24	2168	Ролл «Шимода маки»	Футо Маки	Креветка тигровая, авокадо, огурец, икра тобико оранжевая, салат «Айсберг», перец сладкий, соус острый, васаби 5 гр	160 г 6 шт	\N	13.3	t
24	2169	Ролл «Фудзи маки»	Футо Маки	Перец сладкий, помидор, мякоть апельсина, соус медово-апельсиновый, салат «Айсберг», зелёный перец чили, лук зелёный, васаби 5 гр	150 г 5 шт	\N	5.7	t
24	2170	Запечённый ролл «Яки тай маки»	Запечённые роллы	Окунь жареный, творожный сыр, помидор, маринованный редис Такуан, сыр «Джюгас», майонез, соус «Терияки», омлет японский	270 г	\N	9	t
24	2171	Запечённый ролл «Яки натто маки»	Запечённые роллы	Орех кешью, творожный сыр, лук жареный, салат «Айсберг», сыр «Джюгас», майонез, омлет японский, соус «Терияки»	255 г	\N	9	t
24	2172	Запечённый ролл «Яки магуро маки»	Запечённые роллы	Тунец, творожный сыр, икра тобико оранжевая, маринованный редис Такуан, сыр «Пармезан», соус Микс, омлет японский	265 г	\N	12.9	t
24	2173	Запечённый ролл «Яки сабо маки»	Запечённые роллы	Филе цыплёнка в соусе «Терияки», творожный сыр, огурец, салат «Айсберг», сыр «Джюгас», майонез, омлет японский, соус «Терияки»	265 г	\N	8	t
24	2174	Запечённый ролл «Яки сяке маки»	Запечённые роллы	Лосось жареный, творожный сыр, авокадо, сыр «Джюгас», майонез, омлет японский, соус «Терияки»	270 г	\N	13.3	t
24	2175	Запечённый ролл «Яки тамура маки»	Запечённые роллы	Бекон, творожный сыр, огурец, помидор, салат «Айсберг», сыр «Джюгас», майонез, омлет японский, соус «Терияки»	270 г	\N	8.5	t
24	2176	Суширрито с жареной курицей	Суширрито	Жареная курица, соус «Томатно-имбирный», майонез, капуста-микс, салат «Айсберг», помидор, перец сладкий, сыр «Пармезан», васаби 5 гр	360 г 1 шт	\N	7.8	t
24	2177	Суширрито с жареным окунем	Суширрито	Морской окунь, соус майонезный с укропом, соус устричный, капуста-микс, салат «Айсберг», помидор, перец сладкий, паста из морепродуктов, чили зелёный, васаби 5 гр	360 г 1 шт	\N	8.9	t
24	2178	Сет «Грин»	Сеты	Ролл «Ясай», ролл «Чукка-микс», ролл «Чукка маки», ролл «Ясай маки»	594 г 20 шт	\N	18.5	t
24	2179	Сет «Только мне»	Сеты	Ролл «Сяке ясай маки», ролл «Тояма маки», ролл «Авокадо маки»	554 г 24 шт	\N	21.9	t
24	2180	Сет «С охотой»	Сеты	Ролл «Бекон маки», ролл «Бекон черри маки», ролл «Бекон терияки маки», ролл «Тамаго маки»	934 г 32 шт	\N	31.9	t
24	2181	Сет «Море рыбы»	Сеты	Ролл «Манго сяке маки», ролл «Магуро фреш маки», ролл «Манго тай маки», ролл «Умаи фреш маки»	964 г 32 шт	\N	41.5	t
24	2182	Сет «Рыба моя»	Сеты	Ролл «Тори кунсей маки», ролл «Сяке блэк маки», ролл «Тояма маки», ролл «Сяке де люкс маки»	956 г 32 шт	\N	42.9	t
24	2183	Сет №1	Сеты	Ролл «Калифорния маки», ролл «Филадельфия маки», ролл «Тамаго маки», ролл «Сяке маки», ролл «Авокадо маки»	885 г 40 шт	\N	36.9	t
24	2184	Сет №2	Сеты	Ролл «Кияри маки», ролл «Тай терияки маки», ролл «Орандж тай маки», ролл «Спайси кунсей маки», ролл «Спайси текка маки»	971 г 40 шт	\N	37.9	t
24	2185	Нигири-сет №1	Сеты	Нигири «Сяке» 5 шт, нигири «Магуро» 5 шт, нигири «Тай» 5 шт, гункан «Спайси сяке микс» 5 шт, гункан «Спайси тамаго» 5 шт	915 г 25 шт	\N	51.9	t
24	2186	Нигири-сет №2	Сеты	Нигири с тунцом маринованным 5 шт, нигири с окунем опалённым 5 шт, гункан «Спайси магуро» 5 шт, гункан «Спайси сяке микс» 5 шт, нигири с лососем опалённым 5 шт	965 г 25 шт	\N	63.5	t
24	2187	Нигири-сет №3	Сеты	Нигири с лососем маринованным 5 шт, нигири с тунцом опалённым 5 шт, нигири с окунем маринованным 5 шт, гункан «Спайси тай» 5 шт, гункан «Спайси сурими» 5 шт	950 г 25 шт	\N	48.5	t
27	2447	Филе куриное	Конструктор бургеров		120 г	\N	4	f
24	2188	Суши-сет «Гуляй, офис! на 9 человек»	Сеты	Филадельфия маки 16 шт Тояма маки 16 шт Карай маки 16 шт Сакура маки 16 шт Мияги маки 16 шт Манго сяке маки 16 шт Тамаго маки 16 шт	3194 г 112 шт	\N	109	t
24	2189	Суши-сет «Гуляй, офис! на 19 человек»"	Сеты	Филадельфия маки 32 шт Тояма маки 32 шт Карай маки 32 шт Сакура маки 32 шт Мияги маки 32 шт Манго сяке маки 32 шт Тамаго маки 32 шт	6388 г 224 шт	\N	199	t
24	2190	Суши-сет «Гуляй, офис! на 28 человек»	Сеты	Филадельфия маки 48 шт Тояма маки 48 шт Карай маки 48 шт Сакура маки 48 шт Мияги маки 48 шт Манго сяке маки 48 шт Тамаго маки 48 шт	9582 г 336 шт	\N	293	t
24	2191	Суши-сет "Радио Relax"	Сеты			\N	37.9	t
24	2192	Суши-сет "С охотой"	Сеты			\N	31.9	t
24	2193	Мисо суп 	Супы	Грибы Намеко», сыр «Тофу», водоросли вакаме	200 г	\N	3.4	t
24	2194	Суп острый с жареным лососем	Супы	Лосось жареный, яичная лапша, зелёный лук, соус острый	245 г	\N	6.2	t
24	2195	Суп с курицей	Супы	Филе цыплёнка в соусе «Терияки», водоросли вакаме, яичная лапша, зелёный лук	215 г	\N	4.3	t
24	2196	Чука-салат	Салаты	Водоросли морские маринованные хияши вакаме, ореховый соус	100 г	\N	8.3	t
24	2197	Овощной салат с сыром «Моцарелла»	Салаты	Салат «Айсберг», капуста пекинская, огурец, перец болгарский, помидор, сыр «Моцарелла», семечки тыквенные, соус «Ореховый»	205 г	\N	5.9	t
24	2198	Салат с жареной курицей «По‑азиатски»	Салаты	Салат «Айсберг», капуста пекинская, перец болгарский, жареная курица, помидор, лук жареный, соус «Микс»	205 г	\N	5.9	t
24	2199	Салат с жареной курицей «По‑итальянски»	Салаты	Салат «Айсберг», капуста пекинская, огурец, курица жареная, помидор, сыр «Моцарелла», тёртый миндаль, соус «Итальянский»	210 г	\N	5.9	t
24	2200	Ролл «Момо маки»	Десерты	Сладкий блинчик, сырная масса, персик, ягодный соус	150 г	\N	6.7	t
24	2201	Ролл «Яси маки»	Десерты	Сладкий рис, банан, кокос, миндальные лепестки, шоколадный соус	178 г	\N	7.7	t
24	2202	Морс «Ягода малина»	Напитки	Вода, клубника, вишня, малина, сок лимонный, сахар	330 мл	\N	2	t
24	2203	Морс «Экзотическая вишня»	Напитки	Вода, манго, вишня, сок лимонный, сахар	330 мл	\N	3	t
24	2204	Морс «Клюква»	Напитки		330 мл	\N	2	t
24	2205	Морс «Бананго»	Напитки	Вода, манго, банан, сок лимонный, сахар	330 мл	\N	2.5	t
24	2206	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.3	t
24	2207	Напиток газированный Coca‑Cola zero	Напитки		500 мл	\N	2.3	t
24	2208	Напиток газированный Fanta	Напитки		500 мл	\N	2.3	t
24	2209	Напиток газированный Sprite	Напитки		500 мл	\N	2.3	t
24	2210	Напиток газированный Schweppes Indian Tonic	Напитки		500 мл	\N	2.3	t
24	2211	Напиток газированный Schweppes Bitter lemon	Напитки		500 мл	\N	2.3	t
24	2212	Напиток газированный Schweppes «Пряная клюква»	Напитки		500 мл	\N	2.3	t
24	2213	Вода BonAqua среднегазированная	Напитки		500 мл	\N	1.8	t
24	2214	Вода BonAqua негазированная	Напитки		500 мл	\N	1.8	t
24	2215	Напиток чайный FuzeTea со вкусом персика	Напитки		500 мл	\N	2.8	t
24	2216	Напиток чайный FuzeTea со вкусом лесных ягод	Напитки		500 мл	\N	2.8	t
24	2217	Напиток чайный FuzeTea зелёный чай с цитрусом	Напитки		500 мл	\N	2.8	t
24	2218	Сок Granini апельсиновый	Напитки		250 мл	\N	3.2	t
24	2219	Сок Granini томатный	Напитки		250 мл	\N	3.2	t
24	2220	Сок Granini яблочный	Напитки		250 мл	\N	3.2	t
24	2221	Сок Granini виноградный	Напитки		250 мл	\N	3.2	t
24	2222	Нектар Granini ананасовый	Напитки		250 мл	\N	3.3	t
24	2223	Нектар Granini грейпфрутовый	Напитки		250 мл	\N	3.3	t
24	2224	Нектар Granini банановый	Напитки		250 мл	\N	3.3	t
24	2225	Нектар Granini грушевый	Напитки		250 мл	\N	3.3	t
24	2226	Нектар Granini черносмородиновый	Напитки		250 мл	\N	3.3	t
25	2227	Окунь с мидиями	Роллы	Окунь, мидии, сливочный сыр, огурец, укроп, соус Спайси	222 г	\N	6.8	t
25	2228	Угорь в кунжуте	Роллы	Угорь, авокадо, сливочный сыр, кунжут, соус Унаги	237 г	\N	10.9	t
25	2229	Бонито	Роллы	Лосось терияки, авокадо, сливочный сыр, стружка тунца	212 г	\N	8.3	t
25	2230	Копченый лосось с авокадо	Роллы	Копченый лосось, сливочный сыр, авокадо	208 г	\N	8.9	t
25	2231	Обжаренный лосось с Томаго и апельсином	Роллы	Лосось, икра масаго, омлет Томаго, сливочный сыр, апельсин	252 г	\N	11.2	t
25	2232	Калифорния с креветкой	Роллы	Креветка, сливочный сыр, авокадо, икра масаго	257 г	\N	12.6	t
25	2233	Сливочный лосось в кунжуте	Роллы	Лосоь, сливочный сыр, кунжут	212 г	\N	8.9	t
25	2234	Филадельфия в угре	Роллы	Угорь, сливочный сыр, огурец, Унаги соус, кунжут	229 г	\N	13.7	t
25	2235	Бекон и сыр	Роллы	Копченый бекон, перец, сливочный сыр, сыр плавленый, кунжу	232 г	\N	7.9	t
25	2236	Витамин	Роллы	Сливочный сыр, айсберг, перец, томат, лук порей, кунжут	220 г	\N	5.8	t
25	2237	Токио	Роллы	Креветка, лосось, икра Тобико, сливочный сыр, соус Розовый, соус Унаги	273 г	\N	15	t
25	2238	Острый тунец	Роллы	тунец, сливочный сыр, огурец, Спайси соус, лук зеленый	240 г	\N	11.8	t
25	2239	Филадельфия с копченым лососем	Роллы	Лосось, сливочный сыр, огурец, Розовый соус, Шрирача соус	237 г	\N	11.2	t
25	2240	Филадельфия роял	Роллы	Сливочный сыр, лосось, крабовые палочки, огурец	267 г	\N	11.4	t
25	2241	Карибский	Роллы	Креветка, сыр сливочный, яблоко, икра масаго, кунжут	254 г	\N	12.6	t
25	2242	Гребешок с креветкой	Роллы	Гребешок, креветка, сливочный сыр	213 г	\N	13.7	t
25	2243	Угорь с креветкой	Роллы	Угорь, креветка,сливочный сыр,яблоко, икра масаго	232 г	\N	13.4	t
25	2244	Кальмар в укропе	Роллы	Кальмар, огурец, зеленый лук, сливочный сыр, укроп	222 г	\N	7.2	t
25	2245	Острый окунь	Роллы	Окунь, салат айсберг, сливочный сыр, кунжут, соус Спайси	232 г	\N	6.7	t
25	2246	Тунец с лососем и такуаном	Роллы	Тунец, лосось, такуан, томат, сливочный сыр	242 г	\N	11.4	t
25	2247	Угорь и чеддер	Роллы	Угорь, такуан, омлет Томаго, сливочный сыр, сыр Чеддер	257 г	\N	12.5	t
25	2248	Креветка темпура	Роллы	Креветка темпура, огурец, соус Оранж	198 г	\N	9.1	t
25	2249	Сливочный с Томаго	Роллы	Сливочный сыр, омлет Томаго, крабовые палочки, такуан, соус Унаги, соус Спайси	237 г	\N	6.9	t
25	2250	Лосось с апельсином	Роллы	Лосось, сливочный сыр, апельсин	213 г	\N	8.8	t
25	2251	Сливочный лосось с чукой	Роллы	Лосось, чука, сливочный сыр	208 г	\N	8.7	t
25	2252	Лосось с гребешком и такуаном	Роллы	Лосось, гребешок, сливочный сыр, такуан	218 г	\N	13.4	t
25	2253	Филадельфия в лососе	Роллы	Лосось, сливочный сыр	282 г	\N	13.5	t
25	2254	Острый копченый лосось	Роллы	Копченый лосось, омлет Томаго, сливочный сыр, томат, авокадо, зеленый лук, укроп, соус Шрирача	263 г	\N	12.8	t
25	2255	Филадельфия	Роллы	Лосось, сливочный сыр, огурец	232 г	\N	10.9	t
25	2256	Филадельфия в кунжуте	Роллы	Лосось, сливочный сыр, огурец, кунжут	222 г	\N	8.7	t
25	2257	Кальмар с окунем	Роллы	Кальмар, окунь, сливочный сыр, икра масаго, томат	252 г	\N	9.9	t
25	2258	Филадельфия в лососе с авокадо	Роллы	Лосось, сливочный сыр, авокадо	302 г	\N	14.9	t
25	2259	Бонито с окунем	Роллы	Окунь, сливочный сыр, айсберг, стружка тунца, рис	202 г	\N	8.1	t
25	2260	Филадельфия микс	Роллы	Сливочный сыр, лосось, угорь, огурец	236 г	\N	12.9	t
25	2261	Тунец с такуаном	Роллы	Тунец, такуан, сливочный сыр, айсберг, соус Унаги, кунжут	221 г	\N	9.3	t
25	2262	Лосось с авокадо	Роллы	Лосось, авокадо	193 г	\N	8.9	t
25	2263	Филадельфия с авокадо	Роллы	Лосось, сливочный сыр, авокадо.	232 г	\N	11.7	t
25	2264	Лосось в чуке	Роллы	Лосось, сливочный сыр, чука.	262 г	\N	9.9	t
25	2265	Филадельфия лайт	Роллы	Лосось, сливочный сыр, огурец.	213 г	\N	7.9	t
25	2266	Кальмар в сыре Чеддер	Роллы	Кальмар, авокадо, сливочный сыр, зеленый лук, соус Спайси, Чеддер	252 г	\N	9.2	t
25	2267	Креветка с авокадо	Роллы	Креветка, авокадо, сливочный сыр, кунжут	227 г	\N	10.1	t
25	2268	Сливочный угорь	Роллы	Угорь, авокадо, омлет Томаго, сливочный сыр, кунжут, соус Унаги	254 г	\N	13.9	t
25	2269	Острый тунец и лосось	Роллы	Тунец, лосось, чука, сливочный сыр, перец, зеленый лук, соус Шрирача	240 г	\N	12.8	t
25	2270	Морской микс	Роллы			\N	9.6	t
25	2271	Нью-Йорк	Роллы	Копченый лосось, сливочный сыр, огурец, крошка чипсов, соус Розовый	227 г	\N	8.7	t
25	2272	Горячий ролл «Лосось с авокадо»	Горячие роллы	Лосось, авокадо, сыр сливочный, сыр плавленый, соус «Спайси», кляр	8 шт 258	\N	9.9	t
25	2273	Горячий ролл «Окунь и тунец»	Горячие роллы	Окунь, тунец, сыр сливочный, кляр	8 шт 253	\N	9.4	t
25	2274	Горячий ролл «Угорь с авокадо»	Горячие роллы	Угорь, авокадо, сыр сливочный, соус «Спайси», кляр	8 шт 252	\N	10.6	t
25	2275	Горячий ролл «Лосось копчёный»	Горячие роллы	Лосось копчёный, икра масаго, огурец, кляр	8 шт 233	\N	9.5	t
25	2276	Горячий ролл «Бекон»	Горячие роллы	Бекон, сыр сливочный, перец, кляр	8 шт 233	\N	7.4	t
25	2277	Ролл горячий с овощами	Горячие роллы	Огурец, перец, помидор, кунжут, кляр	8 шт 225	\N	5.4	t
25	2278	Запечённый ролл «Филадельфия»	Запечённые роллы		8 шт 267	\N	12.1	t
25	2279	Запечённый ролл «Калифорния»	Запечённые роллы		8 шт 280	\N	13.2	t
25	2280	Запечённый ролл «Угорь с лососем»	Запечённые роллы		8 шт 269	\N	13.3	t
25	2281	Запечённый ролл «Лосось терияки» 	Запечённые роллы		8 шт 253	\N	9.8	t
25	2282	Запечённый ролл «Окунь с креветкой»	Запечённые роллы		8 шт 252	\N	12.2	t
25	2283	Фаст-ролл «Филадельфия»	Фаст-роллы	Лосось, сыр сливочный, огурец	1 шт 213	\N	6.8	t
25	2284	Фаст-ролл «Лосось с такуаном»	Фаст-роллы	Лосось, сыр сливочный, салат, такуан	1 шт 213	\N	7.4	t
25	2285	Фитнес-ролл	Фаст-роллы	Перец, салат «Айсберг», огурец, кунжут, соус розовый	1 шт 188	\N	4.4	t
25	2286	Фаст-ролл «Лосось»	Фаст-роллы	Лосось, сыр сливочный, кунжут	1 шт 196	\N	6.6	t
25	2287	Фаст-ролл «Острый бекон»	Фаст-роллы	Бекон копчёный, сыр сливочный, перец, салат «Айсберг», лук зелёный, соус «Спайси»	1 шт 228	\N	6.2	t
25	2288	Фаст-ролл «Нежный краб»	Фаст-роллы	Палочки крабовые, огурец, сыр сливочный	1 шт 203	\N	4.8	t
25	2289	Мини-ролл «Фишкейк»	Мини-роллы	Лосось, сыр сливочный, брусника	6 шт 144	\N	6.1	t
25	2290	Мини-ролл «Угорь»	Мини-роллы	Угорь, кунжут, соус «Унаги»	6 шт 119	\N	6.1	t
25	2291	Мини-ролл «Лосось»	Мини-роллы	Лосось, рис	6 шт 112	\N	5.1	t
25	2292	Мини-ролл «Авокадо»	Мини-роллы	Рис, авокадо	6 шт 112	\N	4.1	t
25	2293	Мини-ролл «Огурец»	Мини-роллы	Огурец, рис	6 шт 112	\N	3.1	t
25	2294	Мини-ролл «Чукка» 	Мини-роллы	Рис, чукка‑салат	6 шт 113	\N	3.5	t
25	2295	Мини-ролл «Гребешок»	Мини-роллы	Рис, гребешок	6 шт 112	\N	6.1	t
25	2296	Мини-ролл «Бекон» острый	Мини-роллы	Бекон, лук зелёный, соус «Спайси»	6 шт 112	\N	4.6	t
25	2297	Суши-сет Love is set	Суши-сеты	Ролл «Сливочный окунь», ролл «Тунец с креветкой», ролл «Лосось с угрём и манго», ролл «Тунец с помидором»	975 г 32 шт	\N	35.9	t
25	2298	Суши-сет «Годзилла»	Суши-сеты	Ролл «Филадельфия с манго», ролл «Креветка темпура с масаго», ролл «Карай с кальмаром и брусникой», нигири «Лосось», нигири «Тунец» острый	827 г 28 шт	\N	32.9	t
25	2299	Суши-сет «Вегетарианец»	Суши-сеты	Ролл «Грибы шиитаке с чуккой», ролл «Авокадо в сыре Чеддер», ролл «Такуан с омлетом тамаго», ролл «Манго с айсбергом»	968 г 32 шт	\N	25.9	t
25	2300	Суши-сет «Акито»	Суши-сеты	Ролл «Филадельфия» с авокадо, ролл «Лосось копчёный» с авокадо, ролл «Филадельфия» в кунжуте, ролл «Бонито» с окунем	864 г 32 шт	\N	33.9	t
25	2301	Суши-сет «Филадельфия»	Суши-сеты	Ролл «Филадельфия», ролл «Филадельфия лайт», ролл «Филадельфия икура», ролл «Филадельфия роял»	929 г 32 шт	\N	35.9	t
25	2302	Суши-сет «Ниндзя»	Суши-сеты	Ролл «Филадельфия», ролл «Сливочный томаго», ролл «Тунец с такуаном»	690 г 24 шт	\N	25.9	t
25	2303	Суши-сет «Якудза»	Суши-сеты	Ролл «Филадельфия», ролл «Морской микс», ролл «Кальмар в укропе», ролл «Креветка с авокадо»	889 г 32 шт	\N	34.9	t
25	2304	Суши-сет «Наруто»	Суши-сеты	Ролл «Филадельфия», ролл «Угорь с креветкой», ролл «Тунец с такуаном», ролл «Витамин», мини-ролл «Лосось», мини‑ролл «Угорь»	1136 г 44 шт	\N	44.9	t
25	2305	Суши-сет «Тануки»	Суши-сеты	Ролл «Филадельфия» с салатом «Айсберг», ролл «Кальмар в сыре «Чеддер», ролл «Филадельфия» в кунжуте, ролл «Кальмар с окунем», ролл «Окунь с мидиями»	1309 г 40 шт	\N	41.9	t
25	2306	Суши-сет «Самурай»	Суши-сеты	Ролл «Филадельфия», ролл «Филадельфия люкс», ролл «Лосось с апельсином», ролл «Лосось с авокадо»	885 г 32 шт	\N	36.9	t
25	2307	Суши-сет «Мегаполис»	Суши-сеты	Ролл «Филадельфия», ролл «Сливочный угорь» в кунжуте, ролл «Филадельфия роял», ролл «Креветки терияки», ролл «Калифорния», ролл «Фишкейк», гунканы с креветками	1427 г 48 шт	\N	55.9	t
25	2308	Суши-сет «Банзай»	Суши-сеты	Ролл «Филадельфия», ролл «Витамин», ролл «Лосось с томаго»	670 г 24 шт	\N	24.9	t
25	2309	Суши-сет «Для друзей»	Суши-сеты	Ролл «Угорь с креветкой», ролл «Бонито», ролл «Филадельфия», ролл «Филадельфия» в кунжуте, ролл «Нью-Йорк», ролл «Карибский», ролл «Калифорния», ролл «Калифорния» с сыром, ролл «Лосось с апельсином», ролл «Лосось с авокадо»	2274 г 80 шт	\N	87.9	t
25	2310	Суши-сет «Суши-шок премиум»	Суши-сеты	Ролл «Филадельфия», ролл с тунцом, ролл «Калифорния», мини-ролл «Бекон» острый	808 г 30 шт	\N	32.9	t
25	2311	Суши-сет «Мини-Филадельфия мания»	Суши-сеты	Ролл «Филадельфия», нигири с лососем, гунканы с креветкой и сливочным сыром	372 г 12 шт	\N	19.9	t
25	2312	Суши-сет «Классический»	Суши-сеты	Ролл «Филадельфия» с авокадо, мини-ролл «Фишкейк», гунканы с лососем, гунканы с чукка‑салатом	520 г 18 шт	\N	24.9	t
25	2313	Суши-сет «Мини‑набор»	Суши-сеты	Мини-ролл «Тунец», мини-ролл «Лосось», мини-ролл «Угорь», мини-ролл «Авокадо», мини‑ролл «Чукка»	557 г 30 шт	\N	22.9	t
25	2314	Суши-сет «Касуми»	Суши-сеты	Ролл «Кальмар с окунем», ролл «Сливочная креветка», ролл «Тунец с лососем и такуаном»	706 г 24 шт	\N	28.9	t
25	2315	Суши-сет «Темпура»	Суши-сеты	Горячий ролл «Лосось копчёный», горячий ролл «Окунь и тунец», горячий ролл «Бекон»	729 г 24 шт	\N	25.9	t
25	2316	Нигири «Угорь»	Нигири		1 шт 36	\N	3	t
25	2317	Нигири «Лосось»	Нигири		1 шт 35	\N	2.5	t
25	2318	Нигири «Тунец»	Нигири		1 шт 35	\N	2.5	t
25	2319	Нигири «Лосось копчёный»	Нигири		1 шт 35	\N	2.5	t
25	2320	Гункан «Мидии»	Гунканы		1 шт	\N	2	t
25	2321	Гункан «Лосось»	Гунканы		1 шт	\N	2.5	t
25	2322	Гункан «Тунец»	Гунканы		1 шт	\N	2.5	t
25	2323	Гункан «Угорь»	Гунканы		1 шт	\N	3	t
25	2324	Гункан «Креветка и сыр сливочный»	Гунканы		1 шт	\N	2.9	t
25	2325	Гункан «Гребешок»	Гунканы		1 шт	\N	3	t
25	2326	Мисо-суп	Супы	Мисо-бульон, шиитаке, сыр «Тофу», вакаме, лук‑порей	285 г	\N	2.9	t
25	2327	Суп «Кимчи»	Супы	Бульон, бекон, вакаме, соус «Ким-Чи», сыр «Тофу», лук зелёный	240 г	\N	4.9	t
25	2328	Суп сливочный с лососем	Супы	Бульон рыбный, лосось, сливки, лук‑порей, рис	285 г	\N	5.9	t
25	2329	Суп острый с лососем	Супы	Лосось, рис, мисо-бульон, вакаме, лук зелёный, соус «Ширачи»	302 г	\N	5.9	t
25	2330	Чукка-салат 	Супы	Чукка-салат, вакаме, лимон, соус ореховый, кунжут	130 г	\N	3.9	t
25	2331	Салат с лососем и креветками	Салаты	Креветки, лосось, помидоры черри, салат «Айсберг», перец, масло оливковое	155 г	\N	7.9	t
25	2332	Салат с лососем и томаго	Салаты	Лосось, омлет томаго, помидоры черри, салат «Айсберг», соус «Оранж»	234 г	\N	6.9	t
25	2333	Салат овощной	Салаты	Помидоры черри, перец, огурец, салат «Айсберг», заправка фирменная	165 г	\N	2.9	t
25	2334	Соус соевый	Гарниры		40 г	\N	1	t
25	2335	Имбирь	Гарниры		40 г	\N	1	t
25	2336	Васаби 	Гарниры		15 г	\N	1	t
25	2337	Соус ореховый	Гарниры		40 г	\N	1.5	t
25	2338	Соус сырный	Гарниры		40 г	\N	1	t
25	2339	Соус «Терияки» 	Гарниры		40 г	\N	1.5	t
25	2340	Соус острый	Гарниры		40 г	\N	1	t
25	2341	Вода питьевая «BonAqua» негазированная	Напитки		500 мл	\N	1.2	t
25	2342	Вода питьевая «BonAqua» среднегазированная	Напитки		500 мл	\N	1.2	t
25	2343	Газированный напиток Coca‑Cola	Напитки		500 мл	\N	1.8	t
25	2344	Газированный напиток Coca‑Cola Zero	Напитки		500 мл	\N	1.8	t
25	2345	Газированный напиток Fanta	Напитки		500 мл	\N	1.8	t
25	2346	Напиток чайный Fuze Tea «Клубника и малина»	Напитки		500 мл	\N	2	t
25	2347	Напиток чайный Fuze Tea «Цитрус»	Напитки		500 мл	\N	2	t
25	2348	Газированный напиток Sprite	Напитки		500 мл	\N	1.8	t
25	2349	Сок Rich яблочный	Напитки		300 мл	\N	2	t
27	2448	Филе куриное в панировке	Конструктор бургеров		150 г	\N	4	f
26	2350	Бургер Карри Кардашьян	Бургеры	Свежеиспеченная булочка, котлета из куриного бедра, сыр «Чеддер», корнишоны, салат «Айсберг», 1000 островов, соус «Карри»	350 г	\N	14	t
26	2351	Камамбургер	Бургеры	Свежеиспеченная булочка, котлета говяжья, сыр Камамбер, сырный соус, соус вишнёвый	350 г	\N	16	t
26	2352	Бургер Double beef	Бургеры	Булочка свежеиспечённая, две говяжьи котлеты, сыр «Чеддер», ароматный бекон, салат «Айсберг», соус 1000 островов	370 г	\N	19	t
26	2353	Steak Бургер	Бургеры	Свежеиспеченная булочка, вырезка говяжья, свежий помидоры, руккола, сливочно-грибной соус, лук маринованный	330 г	\N	16	t
26	2354	Бургер «Киллер»	Бургеры	Булочка свежеиспечённая, котлета говяжья, сыр «Сулугуни», шампиньоны, ароматный бекон, лук красный маринованный, корнишоны, соус «1000 островов»	350 г	\N	16	t
26	2355	Бургер Italiana	Бургеры	Булочка свежеиспечённая, котлета говяжья, соус «Песто», сыр «Моцарелла», свежий помидоры, руккола, соус «Ранч»	300 г	\N	15	t
26	2356	Бургер «Местный»	Бургеры	Булочка свежеиспечённая, котлета говяжья, сыр «Чеддер», бекон, перец халапеньо, руккола, соус «1000 островов»	300 г	\N	15	t
26	2357	Бургер Cherry Provolone	Бургеры	Булочка свежеиспечённая, котлета говяжья, соус «Ранч», ароматный бекон, помидоры, помидоры черри джем, сыр проволоне	300 г	\N	16	t
26	2358	Бургер «Чиполлино»	Бургеры	Булочка свежеиспечённая, котлета говяжья, сыр «Чеддер», ароматный бекон, лук карамелизированный, лук красный маринованный, соус «Барбекю»	310 г	\N	15	t
26	2359	Бургер «Американский»	Бургеры	Булочка, котлета говяжья, сыр «Чеддер», лук маринованный, бекон, салат «Айсберг», маринованный огурец, помидор, соус 1000 островов	320 г	\N	15	t
26	2360	Бургер «Мексиканский Замес»	Бургеры	Свежеиспеченная булочка, натуральная котлета говяжья, соус 1000 островов, сыр «Сулугуни», корнишоны, салат «Айсберг», маринованный красный лук, перец халапеньо	290 г	\N	15	t
26	2361	Бургер «Сочный Грек»	Бургеры	Свежеиспеченная булочка, натуральная котлета говяжья, соус «Дзадзыки, помидор, салат «Айсберг», сыр «Сулугуни»	300 г	\N	14	t
26	2362	Бургер «Завали Билла»	Бургеры	Свежеиспеченная булочка, котлета говяжья, соус 1000 островов, сыр «Сулугуни», корнишоны, салат «Айсберг», маринованный красный лук	310 г	\N	14	t
26	2363	Бургер Скрамбл	Бургеры	Свежеиспеченная булочка, котлета говяжья, сыр «Чеддер», сыр «Сулугуни», яйцо жареное, перец болгарский, лук маринованный, американская горчица	350 г	\N	15	t
26	2364	Бургер «Дон Карлеоне»	Бургеры	Свежеиспеченная булочка, котлета говяжья, кетчуп, сыр рикотта, помидоры вяленые, базилик	300 г	\N	16	t
26	2365	Бургер рваный	Бургеры	Реберное томленое мясо свинина, свежеиспеченная булочка, сыр «Сулугуни», соус чипотле, салат коул слоу	300 г	\N	14	t
26	2366	Бекон	Топинг		20 г	\N	2	t
26	2367	Котлета говяжья	Топинг		125 г	\N	6	t
26	2368	Сыр «Чеддер»	Топинг		20 г	\N	2	t
26	2369	Перец халапеньо	Топинг		20 г	\N	1.5	t
26	2370	Яйцо жареное	Топинг		1 шт	\N	1.5	t
26	2371	Соус «Барбекю»	Топинг		30 г	\N	1.5	t
26	2372	Соус брусничный	Топинг		30 г	\N	1.5	t
26	2373	Соус горчичный	Топинг		30 г	\N	1.5	t
26	2374	Соус «Терияки» 	Топинг		30 г	\N	1.5	t
26	2375	Кетчуп	Топинг		30 г	\N	1.5	t
26	2376	Соус «Манго» острый	Топинг		30 г	\N	1.5	t
26	2377	Соус «Ранч» 	Топинг		30 г	\N	1.5	t
26	2378	Сет на компанию	Сеты	Фри соломка, чиз боллы, куриные крылья, колбаски в соусе bbq, бедра куриные, огурцы маринованные, кетчуп	1700 г	\N	45	t
26	2379	Сет на большую компанию	Сеты	Чипсы начос, шампиньоны, пряные картофельные дольки, колбаски в остром соусе, колбаски в сырном соусе, наггетсы, кольца луковые, куриные крылья, сырные палочки, соус bbq, кетчуп, соус сырный	1720 г	\N	55	t
26	2380	Chill сет	Сеты	-бургер «New York» свежеиспеченная булочка, котлета из фермерской говядины, сыр «Чеддер», соус коул-слоу, свежий помидоры, красный лук маринованный, ароматный бекон, салат ромен, корнишоны-крылья куриные в соусе терияки-картофель фри с	750 г	\N	33	t
27	2449	Котлета рубленая из куриного филе	Конструктор бургеров		135 г	\N	4	f
26	2381	Кардашьян сет	Сеты	-бургер «Бедро Кардашьян» свежеиспеченная булочка, куриное бедро в соусе терияки, салатфли, соус манго-чили, чипсы начос-куриные наггетсы в хрустящей панировке-картофельные рифленые чипсы	610 г	\N	24	t
26	2382	Базовый сет	Сеты	-бургер «Базовый» свежеиспеченная булочка, котлета из фермерской говядины, сыр «Чеддер», красный лук маринованный, корнишоны, кетчуп-крокеты 6 шт, итальянская паста в сырно-грибном соусе в хрустящей панировке-маринованные шампиньоны ша	550 г	\N	25	t
26	2383	Греческий сет	Сеты	Состав:-Бургер Сочный Грек свежеиспеченная булочка, котлета из фермерской говядины, соус греческий дзадзыки, свежий помидоры, салат «Айсберг», сыр «Сулугуни»-Сырные палочки фабрика-кухня BBJ-Соус вишневый-Картофель фри соломка‑Кетчуп	540 г	\N	29	t
26	2384	Пивной сет	Сеты	Наггетсы, кольца луковые, сырные палочки, соус ранч, кетчуп, чипсы начос	400 г	\N	16	t
26	2385	Биф сет	Сеты	Бургер Double Beef Куриные крылья	700 г	\N	28	t
26	2386	Киллер Сет	Сеты	Бургер Киллер‑mac n cheese	570 г	\N	22	t
26	2387	Колбасный сет	Сеты	Фри соломка, огурцы маринованные, колбаски в соусе bbq, колбаски в остром соусе, колбаски в сырном соусе, лук маринованный, горчичный соус	920 г	\N	36	t
26	2388	Сет " Много не мало "	Сеты	-чизболлы-бедра куриные-крылья куриные-картофель фри соломка-соус 1000 островов ‑кетчуп	1240 г	\N	43	t
26	2389	Детский сет	Сеты	Бургер детский с куриной котлетой, картофель фри, наггетсы, кетчуп, морс ягодный натуральный	910 г	\N	19	t
26	2390	Салат «Цезарь» с курицей	Салаты	Салат радичио, салат ромен, помидоры черри, филе куриное, яйцо, сыр «Пармезан», зелень, соус «Цезарь», крутоны	360 г	\N	14	t
26	2391	Салат с морским гадом	Салаты	Салат радичио, салат ромен, помидоры черри, морской коктейль, креветка королевская, сыр «Фета», зелень	330 г	\N	16	t
26	2392	Стейк салат	Салаты	Нежнейшая вырезка говяжья, салат Рамен, шампиньоны на гриле, помидоры вяленые, каперсы, перец болгарский	310 г	\N	16	t
26	2393	Салат «Цезарь» с креветками	Салаты	Салат радичио, салат ромен, помидоры черри, креветки тигровые, яйцо, сыр «Пармезан», зелень, соус «Цезарь», крутоны	360 г	\N	18	t
26	2394	Жареные креветки с хрустящим хлебом	Закуски	Жареные креветки с хрустящим хлебом	10шт	\N	25	t
26	2395	Mac n Cheese	Закуски	Итальянская паста в соусе сырно-грибном и панировка	220 г	\N	8	t
26	2396	Крылья куриные в соусе «Терияки» 	Закуски	Куриные наггетсы, картофель фри, соус	400 г	\N	12	t
26	2397	Крылья куриные в соусе «Барбекю»	Закуски	Вкуснейший шоколадный десерт	400 г	\N	12	t
26	2398	Крылья куриные в остром соусе	Закуски	Песочно-миндальная корзинка с ягодным курдом	400 г	\N	12	t
26	2399	Наггетсы 	Закуски	Песочно-миндальная крошка, нежнейший крем чиз, кусочки киви, ягодный джем	230 г	\N	12	t
26	2400	Картофель фри с соусом и беконом	Закуски		250 г	\N	9	t
26	2401	Картофель фри соломкой	Закуски		140 г	\N	4	t
26	2402	Картофель фри дольками	Закуски		140 г	\N	4	t
26	2403	Кольца луковые	Закуски		120 г	\N	5	t
26	2404	Сырные палочки	Закуски		6 шт	\N	8	t
26	2405	Шоколадный брауни 	Десерты		200 г	\N	8	t
26	2406	Ягодный тарт 	Десерты		200 г	\N	6	t
26	2407	Трайфл	Десерты		200 г	\N	6	t
26	2408	Энергетический напиток Burn «Максимальный заряд»	Напитки		250 мл	\N	4	t
26	2409	Энергетический напиток Burn «Освежающий заряд»	Напитки		250 мл	\N	4	t
26	2410	Вода питьевая BonAqua газированная	Напитки		330 мл	\N	3	t
26	2411	Вода BonAqua негазированная	Напитки		330 мл	\N	3	t
26	2412	Напиток газированный Coca‑Cola	Напитки		250 мл	\N	3	t
26	2413	Напиток газированный Fanta «Апельсин»	Напитки		250 мл	\N	3	t
26	2414	Напиток газированный Sprite	Напитки		250 мл	\N	3	t
26	2415	Морс Ягодный	Морсы собственного приготовления		300 мл	\N	3.5	t
27	2416	Сет «Дегустационный»	Бургер-сеты	Бургер с куриным филе и китайским соусом, Бургер «Классический», Бургер с куриной котлетой и беконом	260 г	\N	17.5	t
27	2450	Котлета говяжья	Конструктор бургеров		125 г	\N	4	f
27	2417	Сет-Lunch	Бургер-сеты	Бриошь, отбивная в кляре из филе цыплёнка, отбивная свиная, помидоры, огурцы, сыр, соус «Тар-тар», листья салата	330 г	\N	14	t
27	2418	Бургер с криспи-филе цыплёнка	Бургеры	Бриошь, филе куриное, криспи кукурузные, соус сырно-сливочный, корнишоны маринованные, помидоры, листья салата	385 г	\N	8	t
27	2419	Бургер «Классический»	Бургеры	Бриошь, котлета из говядины со свининой, корнишоны маринованные, помидоры, сыр, лук красный, соус «Барбекю», листья салата	350 г	\N	7	t
27	2420	Бургер с куриной котлетой и беконом	Бургеры	Бриошь, котлета из филе цыплёнка, слайсы чипсов из жареного бекона, помидоры, огурцы, сыр, соус сметанно-луковый, листья салата	370 г	\N	7	t
27	2421	Бургер с куриным филе и китайским соусом	Бургеры	Бриошь, филе цыплёнка, перец сладкий свежий, сыр, соус кисло-сладкий, соус томатный, листья салата	350 г	\N	6.5	t
27	2422	Бургер с говядиной и рукколой	Бургеры	Бриошь, говядина на гриле, руккола, помидоры, огурцы, масло чесночное, соус томатный, листья салата	300 г	\N	9.5	t
27	2423	Бургер «Классический» с шампиньонами	Бургеры	Бриошь, котлета из говядины со свининой, шампиньоны жареные, помидоры, сыр, лук красный, соус грибной, салат	370 г	\N	7.5	t
27	2424	Бургер с колбасками «По‑охотничьи»	Бургеры	Бриошь, колбаски «По-охотничьи», корнишоны, редис, помидоры, сыр, лук красный, соус «Барбекю», листья салата	350 г	\N	8	t
27	2425	Бургер «Классический макси»	Бургеры	Бриошь, котлета из говядины со свининой, бекон жареный, корнишоны маринованные, помидоры, сыр, лук красный, соус со вкусом «Барбекю», листья салата	525 г	\N	11.5	t
27	2426	Бургер «Чикаго‑гриль»	Бургеры	Бриошь, филе цыплёнка-гриль, цукини, шампиньоны, сыр, соус «Айоли», помидоры, салат	360 г	\N	7.5	t
27	2427	Бургер со свиной корейкой и апельсиновым соусом	Бургеры	Бриошь, соус апельсиновый с «Французской» горчицей, корейка свиная, яблоки жареные, помидоры, огурец, сыр, листья салата		\N	8	t
27	2428	Бургер с куриным филе и соусом «Терияки» 	Бургеры	Бриошь, филе цыплёнка, соус «Терияки», кунжут, шайбы жареного ананаса, сыр, огурец свежий, листья салата		\N	7.5	t
27	2429	Бургер Sea-Fish с филе трески	Бургеры	Бриошь, филе трески, сыр, шампиньоны жареные, огурцыежие, салат из морских водорослей «Чукка», соус орехово‑кунжутный		\N	8	t
27	2430	Стейк-бургер Grand	Бургеры	Бриошь, соус гранатовый, стейк из говядины, баклажан, перец сладкий, цукини, соус соевый, листья салата	350 г	\N	15.15	t
27	2431	Бургер InBox с куриной котлетой и беконом	Бургеры InBox	Бриошь, котлета из филе цыплёнка, слайсы чипсов из жареного бекона, сыр сливочный, помидоры, соус сметанно-луковый, листья салата	315 г	\N	7	t
27	2432	Бургер InBox «По‑гречески»	Бургеры InBox	Бриошь, помидоры, огурцы, перец сладкий, сыр «Фета», маслины, заправка салатная на основе оливкового масла, листья салата	235 г	\N	6	t
27	2433	Бургер InBox с наггетсами и овощной сальсой	Бургеры InBox	Бриошь, наггетсы куриные, соус «Сальса» овощной, сыр сливочный, соус кисло-сладкий, соус сырный, листья салата	250 г	\N	6.5	t
27	2434	Бургер InBox с котлетой	Бургеры InBox	Бриошь, котлета из говядины и свинины, корнишоны маринованные, помидоры, сыр, лук красный, соус со вкусом «Барбекю», листья салата	310 г	\N	7	t
27	2435	Бургер InBox с говядиной	Бургеры InBox	Бриошь, говядина, соус сливочный, шампиньоны, корнишоны маринованные, лук красный, листья салата	265 г	\N	9.5	t
27	2436	Бургер InBox с куриным бедром‑гриль	Бургеры InBox	Бриошь, шаурма, помидоры, огурцы, листья салата	330 г	\N	8	t
27	2437	Руккола	Конструктор бургеров		20 г	\N	0.75	f
27	2438	Листья салата	Конструктор бургеров		20 г	\N	0.5	f
27	2439	Салат «Айсберг»	Конструктор бургеров		30 г	\N	0.5	f
27	2440	Помидор	Конструктор бургеров		40 г	\N	0.5	f
27	2441	Перец сладкий	Конструктор бургеров		30 г	\N	0.5	f
27	2442	Огурец	Конструктор бургеров		30 г	\N	0.5	f
27	2443	Огурцы маринованные	Конструктор бургеров		30 г	\N	0.5	f
27	2444	Лук красный	Конструктор бургеров		10 г	\N	0.5	f
27	2445	Шампиньоны жареные	Конструктор бургеров		30 г	\N	0.5	f
27	2451	Шницель из свинины	Конструктор бургеров		110 г	\N	4	f
27	2452	Корейка свиная жареная	Конструктор бургеров		80 г	\N	4	f
27	2453	Вырезка говяжья	Конструктор бургеров		80 г	\N	5	f
27	2454	Бекон жареный	Конструктор бургеров		40 г	\N	1.5	f
27	2455	Соус апельсиновый с «Французской» горчицей	Конструктор бургеров		40 г	\N	1	f
27	2456	Соус «Терияки» с кунжутом 	Конструктор бургеров		40 г	\N	1	f
27	2457	Соус сырный	Конструктор бургеров		40 г	\N	1	f
27	2458	Соус «Тар‑тар»	Конструктор бургеров		40 г	\N	1	f
27	2459	Соус кисло‑сладкий	Конструктор бургеров		40 г	\N	1	f
27	2460	Соус сметанно-луковый	Конструктор бургеров		40 г	\N	1	f
27	2461	Соус «Барбекю»	Конструктор бургеров		40 г	\N	1	f
27	2462	Соус «Айоли»	Конструктор бургеров		40 г	\N	1	f
27	2463	Кетчуп	Конструктор бургеров		40 г	\N	1	f
27	2464	Майонез	Конструктор бургеров		40 г	\N	1	f
27	2465	Сыр	Конструктор бургеров		1 шт.	\N	1	f
27	2466	Хлопья жареного лука	Конструктор бургеров			\N	1	f
27	2467	Чукка-салат 	Конструктор бургеров			\N	1	f
27	2468	Картофель фри с кетчупом	Гарниры			\N	3	t
27	2469	Дольки картофельные с кетчупом	Гарниры			\N	3	t
27	2470	Наггетсы куриные с двумя видами соуса 	Гарниры			\N	5	t
27	2471	Шарики картофельные с двумя видами соуса	Гарниры			\N	3	t
27	2472	Стиксы куриные в кунжуте с двумя видами соуса	Гарниры			\N	5	t
27	2473	Кукуруза-гриль с двумя видами соуса	Гарниры			\N	4.5	t
27	2474	Пончики ванильные	Десерты			\N	4	t
27	2475	Маффин ванильный	Десерты			\N	1	t
27	2476	Чизкейк кокосовый 	Десерты			\N	4	t
27	2477	Чизкейк «Шоколадный» 	Десерты			\N	4	t
27	2478	Чизкейк «Ягодный» 	Десерты			\N	4	t
27	2479	Сок Rich апельсиновый	Напитки		1000 мл	\N	3.5	t
27	2480	Сок Rich яблочный	Напитки		1000 мл	\N	3.5	t
27	2481	Сок Rich вишнёвый	Напитки		1000 мл	\N	3.5	t
27	2482	Сок Rich мультифруктовый	Напитки		1000 мл	\N	3.5	t
27	2483	Газированный напиток Coca‑Cola	Напитки		500 мл	\N	2.5	t
27	2484	Напиток газированный Coca‑Сola Zero	Напитки		500 мл	\N	2.5	t
27	2485	Напиток газированный Fanta	Напитки		500 мл	\N	2.5	t
27	2486	Напиток газированный Schweppes Indian tonic	Напитки		500 мл	\N	2.5	t
27	2487	Вода питьевая BonAqua газированная	Напитки		500 мл	\N	2	t
27	2488	Вода BonAqua негазированная	Напитки		500 мл	\N	2	t
27	2489	Согревающий ароматный глинтвейн	Напитки			\N	3.5	t
27	2490	Имбирный чай с облепихой	Напитки			\N	3.5	t
28	2491	Чили-сэндвич с ветчиной	Сэндвичи	Пшеничный хлеб, ветчина, помидоры, сыр «Чеддер», салат «Айсберг», соус «Чили», майонез	200 г	\N	4.3	t
28	2492	Сэндвич с курицей и хрустящим беконом	Сэндвичи	Пшеничный хлеб, филе куриное, помидоры, бекон, микс-салат, огурец консервированный, соус «Бургер», майонез	210 г	\N	4.3	t
28	2493	Сэндвич с курицей, луковыми кольцами и соусом «Ореховым»	Сэндвичи	Пшеничный хлеб, филе куриное, бекон, кольца луковые, помидоры, салат «Айсберг», соус «Ореховый», луковые чипсы	195 г	\N	4.3	t
28	2494	Сэндвич-ролл со свининой и соусом BBQ 	Сэндвичи	Пшеничный хлеб, свинина, бекон, сыр «Моцарелла», лук карамелизированный, помидоры, салат «Айсбеог», соус «Барбекю» с майонезом	240 г	\N	4.9	t
28	2495	Сэндвич с ветчиной, курицей и соусом «Спайси» 	Сэндвичи	Пшеничный хлеб, филе куриное, ветчина, помидоры, огурцы маринованные, салат «Айсберг», соус «Спайси»	215 г	\N	4.3	t
28	2496	Бифштекс с яйцом и картофельным пюре	Горячие блюда	Котлета говяжья, яйцо жареное, пюре картофельное, соус «Демиглас», микс‑салат	80 г	\N	11.4	t
28	2497	Говядина с картофельными крокетами и овощами‑гриль	Горячие блюда	Филе говядины, крокеты картофельные, цукини, шампиньоны, микс перцев, лук красный, помидоры черри, масло «Базилик»	140 г	\N	19.5	t
28	2498	Куриные котлеты с французским пюре	Горячие блюда	Котлеты куриные, французское пюре, микс-салат, помидоры черри, заправка лимонная	180 г	\N	12.7	t
28	2499	Свиные рёбра чили с запечённным картофелем и сыром	Горячие блюда	Рёбра свиные, картофель, сметана, майонез, сыр «Моцарелла», соус «Чили»	250 г	\N	18.5	t
28	2500	Филе куриное с ростис и грибным соусом	Горячие блюда	Филе куриное, крокеты картофельные, соус сливочный с грибами и луком, укроп	110 г	\N	12.9	t
28	2501	Рулька с картофелем и яйцом	Горячие блюда	Рулька, картофель, яйцо, соус из хрена, петрушка	400 г	\N	12.9	t
28	2502	Запеканка с филе судака и овощами	Горячие блюда	Филе судака, картофель, брокколи, соус белый, помидоры, сыр «Моцарелла», сыр «Дорблю», лук красный, укроп	400 г	\N	14.9	t
28	2503	Блинчики с мачанкой	Горячие блюда	Блинчики, мачанка из свинины и шампиньонов, соус «Бешамель», сыр «Моцарелла», зелень	330 г	\N	9.4	t
28	2504	Щёчки говяжьи с соусом «Демиглас»	Горячие блюда	Щёки говяжьи, картофельное пюре, соус «Демиглас», зелень	320 г	\N	28.8	t
28	2505	Куриный окорочок с салатом	Горячие блюда	Куриный окорочок, помидоры черри, салат микс, огурец, масло базилик, кукуруза отварная	325 г	\N	12.4	t
28	2506	Салат «Греческий» с рулетиками из цукини и сливочного крема	Салаты	Микс-салат, помидоры черри, перец сладкий, огурцы, маслины, красный лук, цукини, сливочный крем, заправка «Греческая»	270 г	\N	9.3	t
28	2507	Салат с индейкой и соусом из вяленых помидоров	Салаты	Индейка «Хойсин», микс-салат, сыр «Пармезн», гренки, соус «Песто» красный, помидоры вяленые	240 г	\N	12.9	t
28	2508	Салат «Цезарь» с копчёным лососем	Салаты	Лосось копчёный, чипсы из бекона, микс-салат, сыр «Пармезан», соус «Цезарь», гренки	220 г	\N	12.9	t
28	2509	Салат «Цезарь» с курицей	Салаты	Филе куриное, микс-салат, сыр «Пармезан», соус «Цезарь», гренки, помидоры черри, масло «Базилик»	230 г	\N	11.3	t
28	2510	Пицца «Пять сыров»	Пицца	Сыр «Моцарелла», сыр «Дорблю», сыр «Фета», сыр «Чеддер», сыр «Проволоне», соус сырный, орегано	520 г 32 см	\N	17.9	t
28	2511	Пицца «Барбекю»	Пицца	Свинина «Барбекю», шампиньоны, бекон, лук карамельный, сыр «Моцарелла», соус «Барбекю», орегано	590 г 32 см	\N	16.3	t
28	2512	Пицца «Карбонара»	Пицца	Бекон, красный лук, яйцо, сыр «Моцарелла», сыр «Пармезан», соус белый, орегано	480 г 32 см	\N	14.7	t
28	2513	Пицца «Маргарита»	Пицца	Сыр «Моцарелла», масло «Базилик», соус томатный, орегано	410 г 32 см	\N	8.4	t
28	2514	Пицца «Пеперони»	Пицца	Пеперони, сыр «Моцарелла», соус томатный, орегано	460 г 32 см	\N	12.3	t
28	2515	Пицца «Ветчина и грибы»	Пицца	Ветчина, шампиньоны, сыр «Моцарелла», соус томатный, орегано	460 г 32 см	\N	12.3	t
28	2516	Пицца «Шеф‑пицца»	Пицца	Ветчина, бекон, колбаса сырокопчёная, шампиньоны, помидор, сыр «Моцарелла», соус томатный, орегано	630 г 32 см	\N	16.3	t
28	2517	Пицца «Гавайская»	Пицца	Ветчина, ананасы консервированные, сыр «Моцарелла», соус «Роуз Мэри», орегано	520 г 32 см	\N	12.3	t
28	2518	Пицца «Рустика»	Пицца	Филе куриное, лук карамельный, огурцы консервированные, шампиньоны, сыр «Дорблю», сыр «Моцарелла», соус белый, масло базилик, орегано	540 г 32 см	\N	17.9	t
28	2519	Пицца «Дорблю пеперони»	Пицца	Пеперони, сыр «Дорблю», сыр «Моцарелла», груша, соус белый, орегано	500 г 32 см	\N	16.3	t
28	2520	Пицца «Четыре сезона»	Пицца	Ветчина варёная, шампиньоны, креветка салатная, перец консервированный, паста томатная, орегано	540 г 32 см	\N	17.9	t
28	2521	Пицца «Боскайола»	Пицца	Сосиски, колбаски «Охотничьи», бекон копчёно-варёный, лук красный, маслины, сыр «Моцарелла», соус томатный, орегано	580 г 32 см	\N	14.7	t
28	2522	Пицца «Жульен с грибами»	Пицца	Филе куриное, шампиньоны, лук, соус сливочный, огурцы маринованные, опята маринованные, яйцо, горчица, сыр «Моцарелла», орегано	660 г 32 см	\N	15.6	t
28	2523	Пицца «Tasty»	Пицца	Фарш говяжий, сыр «Чеддер», помидоры, лук красный, сыр «Моцарелла», соус томатный, соус Гриль, орегано	615 г 32 см	\N	17.9	t
28	2524	Пицца «Греческая»	Пицца	Сыр «Дорблю», Сыр «Рикотта», сыр «Пармезан», сыр «Моцарелла», шпинат, помидоры вяленый, лук, соус томатный, соус Рэнч, орегано	605 г 32 см	\N	15.6	t
28	2582	Соус соевый	Японский гарнир		40 г	\N	1	t
28	2583	Соус ореховый	Японский гарнир		40 г	\N	2.2	t
28	2525	Пицца «Баварская»	Пицца	Колбаски «Охотничьи», бекон, огурцы маринованные, лук красный, соус Рэнч, соус горчичный, сыр «Моцарелла», луковые чипсы, орегано	585 г 32 см	\N	16.3	t
28	2526	Пицца «Дьябло»	Пицца	Колбаса пеперони, ветчина, помидоры, лук красный, халапеньо, сыр «Моцарелла», соус «Барбекю», орегано	560 г 32 см	\N	14.7	t
28	2527	Пицца «Калифорния» с копчёным лососем и креветками	Пицца	Лосось копчёный, креветка салатная, помидоры черри, каперсы, сыр «Моцарелла», соус белый, орегано	550 г 32 см	\N	19.7	t
28	2528	Пицца «Свинина спайси & терияки» 	Пицца	Свинина, колбаса пеперони, перец свежий, сыр «Моцарелла», соус «Спайси», соус «Терияки», кунжут, орегано	545 г 32 см	\N	16.3	t
28	2529	Бургер Chicken	Бургеры	Котлета куриная, булочка «Бриошь», помидоры вяленые, лук красный, руккола, соус сырный, майонез, соус «Гуакамоле»	300 г	\N	11.9	t
28	2530	Бургер Jack Daniel`s	Бургеры	Котлета из говядины, бекон, сыр «Проволоне», помидоры вяленые, шампиньоны, соус «Джек Дениелс», руккола, майонез	320 г	\N	14.9	t
28	2531	Бургер «Чеддер & бекон»	Бургеры	Котлета из говядины, помидоры, сыр «Чеддер», бекон, лук маринованный, майонез, руккола	280 г	\N	13.4	t
28	2532	Бургер-сет	Выгодные сеты	Бургер «Чеддер &amp; Бекон», бельгийский картофель, соус «Рэнч», 1 «Кока‑кола»	300 г	\N	18.2	t
28	2533	Пивной сет для компании	Выгодные сеты	Бельгийский картофель, наггетсы, кольца луковые, пальчики «Моцарелла», картофельные крокеты, соус «Барбекю», соус «Бургер», соус «Рэнч»	150 г	\N	24.4	t
28	2534	Сет для двоих (пицца)	Выгодные сеты	Пицца «Карбонара» 32 см, Шеф-пицца 32 см, 1 «Кока‑кола»	480 г	\N	24.9	t
28	2535	Сет для компании	Выгодные сеты	Шеф-пицца 32 см, пицца «Пять сыров» 32 см, пицца «Дорблю Пеперони» 32 см, пицца «Четыре сезона» 32 см, пицца «Гавайская» 32 см, 3 «Кока‑колы» 500 мл	630 г	\N	60	t
28	2536	Суши-сет «Дары моря»	Выгодные сеты	Ролл с угрём, авокадо, сливочным сыром и омлетом тамаго, ролл с креветкой, чукка и лососем, ролл «Бонито» с лососем и авокадо, 1/2 ролла с форелью, огурцом, сливочным сыром в кунжуте, 2 японских гарнира	910 г	\N	33.7	t
28	2537	Суши-сет «Хит»	Выгодные сеты	Ролл с угрём, лососем, авокадо и сливочным сыром, ролл с форелью и сливочным сыром, ролл с креветкой, помидором, авокадо и икрой масаго, 1/2 ролла «Филадельфия классическая», 2 японских гарнира	920 г	\N	38.9	t
28	2538	Суши-сет «Сытый самурай»	Выгодные сеты	Ролл с угрём, тунцом, сливочным сыром и такуаном, ролл «Пикантный» с форелью, помидором, сливочным сыром и омлетом тамаго, ролл «Чукка сяке маки» с ореховым соусом, ролл с лососем, тунцом и тигровой креветкой, 2 японских гарнира	1070 г	\N	41.2	t
28	2539	Винный сет	Выгодные сеты	Сырная закуска: сыр «Проволоне», сыр «Моцарелла», сыр «Дорблю», мёд, пикантные оливки и маслины, мёд, руккола Карпаччо: маринованная говядина, помидоры черри, руккола, сыр «Пармезан», луковые чипсы, медовая заправка	445 г	\N	23	t
28	2540	Бельгийский картофель с соусом «Бургер»	Закуски		150 г	\N	4.7	t
28	2541	Наггетсы куриные с кетчупом 	Закуски		120 г	\N	6.9	t
28	2542	Кольца луковые с соусом «Барбекю» с майонезом	Закуски		160 г	\N	6.7	t
28	2543	Карпаччо из говядины 	Закуски	Говядина маринованная, сыр «Пармезан», помидоры черри, руккола, чипсы луковые, заправка медовая	175 г	\N	13.4	t
28	2544	Пальчики «Моцарелла» с соусом «Барбекю» с майонезом	Закуски		160 г	\N	6.9	t
28	2545	Закуска «Сельдь с картофелем»	Закуски	Филе сельди, лук маринованный, помидоры, картофель отварной, сметана, зелень	120 г	\N	8.4	t
28	2546	Закуска «Сырная»	Закуски	Сыр «Проволоне», сыр «Моцарелла», сыр «Дорблю», мёд, оливки, маслины, лепёшка сырная, руккола	40 г	\N	14.5	t
28	2547	Хлеб чесночный	Закуски	Мини-багет «Шведский», топинг чесночный	140 г	\N	3.9	t
28	2548	Кесадия с курицей и овощами	Закуски	Тортилья, цукини, филе куриное, лайм, лук, паста томатная, соус сырный, чили перец, масло оливковое, кинза, перец чёрный	180 г	\N	7.9	t
28	2584	Соус «Терияки» 	Японский гарнир		40 г	\N	2	t
28	2585	Японский гарнир	Японский гарнир	Соус соевый, имбирь, васаби, лимон	40 г	\N	2.9	t
28	2586	Хлеб	Хлеб		50 г	\N	0.5	t
28	2587	Фокачча 	Хлеб		100 г	\N	1.9	t
28	2549	Пивной набор	Закуски	Куриные крылышки, грудинка свиная, колбаски из баранины-говядины, колбаски «Охотничьи», пеперони, колбаса сырокопчёная, сальса /лук красный, перец сладкий, перец зелёный, огурец, помидоры, фасоль красная, кукуруза, авокадо, маринованный редис, перец халапеньо, майонез, паприка кусочками/, фокачча, кольца луковые, соус сырный, соус «Гуакамоле», руккола	800 г	\N	35	t
28	2550	Солянка Garage	Супы	Филе куриное, бекон, ветчина, огурцы маринованные, лук, каперсы, маслины, лимон, сметана, паста томатная, колбаса, укроп	280 г	\N	6.5	t
28	2551	Борщ с ребром	Супы	Свиное рёбрышко, свёкла, картофель, паста томатная, бульон, морковь, лук, чеснок, сметана, укроп	200 г	\N	6.9	t
28	2552	Блинчики с курицей, грибами и соусом «Бешамель»	Драники и блины	Блинчики, филе куриное, шампиньоны, лук, соус «Бешамель», сыр «Моцарелла», зелень	300 г	\N	8.9	t
28	2553	Драники с копчёным лососем	Драники и блины	Драники, соус творожный, лосось копчёный	150 г	\N	13.4	t
28	2554	Драники с мачанкой	Драники и блины	Драники, свинина, шампиньоны, лук, зелень	150 г	\N	12.9	t
28	2555	Запечённые крокеты с курицей и шампиньонами	Драники и блины	Крокеты картофельные, филе куриное, шампиньоны, лук, соус «Бешамель», сыр «Моцарелла»	380 г	\N	9.9	t
28	2556	Крем-чиз борт (стандарт)	Сырный борт для пиццы		140 г	\N	2.9	t
28	2557	Крем-чиз борт (мега)	Сырный борт для пиццы		240 г	\N	4.9	t
28	2558	Бельгийский картофель	Гарниры		150 г	\N	3.9	t
28	2559	Драники	Гарниры		100 г	\N	3.9	t
28	2560	Овощи-гриль	Гарниры		75 г	\N	3.9	t
28	2561	Кокосовый рис	Гарниры		180 г	\N	3.9	t
28	2562	Картофельные крокеты	Гарниры		150 г	\N	3.9	t
28	2563	Французское пюре	Гарниры		150 г	\N	3.9	t
28	2564	Ролл «Филадельфия унаги маки» 	Роллы	Угорь копчёный, редис такуан, сыр сливочный, кунжут, соус «Терияки», рис, нори	195 г	\N	14.4	t
28	2565	Ролл «Филадельфия классическая»	Роллы	Лосось, авокадо, огурец, сыр сливочный, рис, нори	255 г	\N	16.9	t
28	2566	Ролл «Калифорния маки»	Роллы	Креветка, авокадо, огурцы, майонез, икра тобико, рис, нори	205 г	\N	13.4	t
28	2567	Ролл «Сяке авокадо маки»	Роллы	Лосось, авокадо, рис, нори	170 г	\N	9.3	t
28	2568	Ролл «Бонито» с лососем и авокадо	Роллы	Лосось, авокадо, сыр сливочный, стружка тунца, рис, нори	205 г	\N	10.9	t
28	2569	Ролл «Чукка сяке маки» 	Роллы	Лосось, чукка-салат, сыр сливочный, ореховый соус, рис, нори	225 г	\N	11.9	t
28	2570	Ролл «Ясай маки»	Роллы	Перец, огурцы, авокадо, салат, кунжут, рис, нори	205 г	\N	6.4	t
28	2571	Ролл с угрём, лососем и омлетом	Роллы	Угорь, лосось, омлет «Тамаго», огурец, сыр сливочный, рис, нори, соус «Спайси», соус «Терияки»	230 г	\N	15.9	t
28	2572	Ролл с острым лососем, тунцом и омлетом «Тамаго»	Роллы	Лосось, тунец, сыр сливочный, омлет «Тамаго», огурец, рис, нори	260 г	\N	15.4	t
28	2573	Ролл «Когета маки»	Роллы	Опалённый лосось и тунец, огурец, сливочный сыр, рис, нори, соус «Терияки», икра тобико	235 г	\N	13.7	t
28	2574	Ролл «Лава маки»	Роллы	Огурец, сливочный сыр, соус «Лава», рис, нори, соус «Терияки»	270 г	\N	12.7	t
28	2575	Ролл «Йоган маки»	Роллы	Помидор, салат ромен, сливочный сыр, соус «Чизукани», рис, нори, ореховый соус	275 г	\N	9.3	t
28	2576	Ролл «Юки маки» с тунцом	Роллы	Тунец, огурец, опалённый сливочный сыр, рис, нори, соус «Терияки»	215 г	\N	11.9	t
28	2577	Суши-сет «Ниёдогава»	Суши-сеты	Ролл «Чука сяке маки с ореховым соусом», ролл «Йоган маки», ролл с форелью и сливочным сыром, ролл «Бонито» с копчёным лососем, 2 японских гарнира	890 г	\N	39.9	t
28	2578	Суши-сет «Тадами»	Суши-сеты	Ролл с тигровой креветкой и икрой тобико, ролл с острым лососем, тунцом и омлетом томаго, ролл «Бонито» с лососем и авокадо, ролл «Филадельфия унаги маки», 2 японских гарнира	865 г	\N	41.9	t
28	2579	Суши-сет «Сёцоку»	Суши-сеты	Ролл «Лава маки», ролл с угрём, лососем и омлетом, ролл с острым тунцом, сливочным сыром и огурцом, ½ ролла «Филадельфия классическая», ½ ролла с форелью и сыром «Чеддер», 2 японских гарнира	965 г	\N	46.7	t
28	2580	Васаби с лимоном 	Японский гарнир		5 г	\N	1	t
28	2581	Имбирь маринованный	Японский гарнир		25 г	\N	1	t
28	2591	Сырники со сметаной и кули из клубники	Десерты	Сырники, пудра сахарная, соус клубничный, сметана, мята	220 г	\N	5.5	t
28	2592	Чизкейк классический 	Десерты		120 г	\N	5.3	t
28	2593	Торт морковный	Десерты		140 г	\N	5.3	t
28	2594	Булочка карамельная с корицей	Десерты		80 г	\N	2.9	t
28	2595	Круассан с карамелью	Десерты		80 г	\N	2.9	t
28	2596	Круассан с шоколадом	Десерты		90 г	\N	2.9	t
28	2597	Бульон с курицей	Детское меню	Бульон, филе куриное, укроп	320 г	\N	3.4	t
28	2598	Пицца «Котик»	Детское меню	Колбаса сырокопчёная, сосиски, помидоры, сыр «Моцарелла», укроп, майонез, маслины, соус томатный	300 г	\N	6.9	t
28	2599	Чизбургер «Лягушка»	Детское меню	Котлета из говядины, булочка бриошь, сыр «Чеддер», огурец, маслины, майонез, кетчуп	190 г	\N	6.9	t
28	2600	Мини-салат «Цезарь» с курицей	Детское меню	Филе куриное, салат-микс, сыр «Пармезан», крутоны, соус «Цезарь», масло с базиликом	120 г	\N	4.9	t
28	2601	Куриные наггетсы с бельгийским картофелем 	Детское меню	Куриные наггетсы, бельгийский картофель фри, кетчуп	250 г	\N	7.5	t
28	2602	Бельгийский картофель с кетчупом	Детское меню		150 г	\N	3.9	t
28	2603	Печёная сосиска с пюре «Бабочка»	Детское меню	Сосиска, картофельное пюре, огурцы, помидоры, кетчуп, майонез	250 г	\N	4.5	t
28	2604	Сырники со сметаной и клубничным кули	Детское меню	Сырники, пудра сахарная, соус клубничный, сметана, мята	220 г	\N	5.5	t
28	2605	Торт морковный	Детское меню		169 г	\N	5.3	t
28	2606	Куриная котлета с картофельным пюре и кукурузой	Детское меню		311 г	\N	6.5	t
28	2607	Ролл с огурцом	Детское меню		110 г	\N	3.4	t
28	2608	Сырники	Детское меню		220 г	\N	5.5	t
28	2609	Сок Rich апельсиновый	Напитки		1000 мл	\N	5.9	t
28	2610	Сок Rich грейпфрутовый	Напитки		1000 мл	\N	5.9	t
28	2611	Сок Rich вишнёвый	Напитки		1000 мл	\N	5.9	t
28	2612	Сок Rich ананасовый	Напитки		1000 мл	\N	5.9	t
28	2613	Сок «Добрый» яблочный	Напитки		1000 мл	\N	5.9	t
28	2614	Сок «Добрый» томатный	Напитки		1000 мл	\N	5.9	t
28	2615	Клюквенный морс	Напитки		200 мл	\N	2.2	t
28	2616	Морс черносмородиновый	Напитки		200 мл	\N	2.2	t
28	2617	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.2	t
28	2618	Напиток газированный Coca‑cola Zero	Напитки		500 мл	\N	2.2	t
28	2619	Напиток газированный Fanta	Напитки		500 мл	\N	2.2	t
28	2620	Напиток газированный Sprite	Напитки		500 мл	\N	2.2	t
28	2621	Напиток газированный Schweppes	Напитки		500 мл	\N	2.2	t
28	2622	Энергетический напиток Burn	Напитки		250 мл	\N	4	t
28	2623	Напиток чайный FuzeTea	Напитки		500 мл	\N	2.2	t
28	2624	Вода BonAqua негазированная	Напитки		500 мл	\N	2.2	t
28	2625	Вода BonAqua среднегазированная	Напитки		500 мл	\N	2.2	t
28	2626	Вода BonAqua сильногазированная	Напитки		500 мл	\N	2.2	t
29	2627	Ролл «Акегато маки»	Роллы с лососем	Лосось, салат, помидор, майонез, кунжут	107 г 4 шт	\N	3.95	t
29	2628	Ролл «Бонито маки»	Роллы с лососем	Лосось, сыр сливочный, огурцы, стружка тунца	125 г 4 шт	\N	4.8	t
29	2629	Ролл «Грин филадельфия»	Роллы с лососем		110 г 4 шт	\N	4.45	t
29	2630	Ролл «Ояко маки»	Роллы с лососем	Лосось, огурец, икра тобико	187 г 8 шт	\N	8.7	t
29	2631	Ролл «Самурай маки»	Роллы с лососем	Лосось, креветка, васаби, огурцы, авокадо	110 г 4 шт	\N	6.1	t
29	2632	Ролл «Спайси сяке маки» 	Роллы с лососем	Лосось, соус острый «Кимчи»	88 г 4 шт	\N	3.55	t
29	2633	Ролл «Сяке авокадо маки»	Роллы с лососем	Авокадо, лосось	90 г 4 шт	\N	3.9	t
29	2634	Ролл «Сяке маки»	Роллы с лососем		83 г 4 шт	\N	3.25	t
29	2635	Ролл «Филадельфия классик»	Роллы с лососем	Лосось, сыр сливочный	148 г 4 шт	\N	7.75	t
29	2636	Ролл «Филадельфия классик лайт»	Роллы с лососем	Лосось, сыр сливочный, огурец	150 г 4 шт	\N	7.9	t
29	2637	Ролл «Филадельфия классик люкс»	Роллы с лососем		150 г	\N	7.9	t
29	2638	Ролл «Филадельфия маки»	Роллы с лососем	Лосось, сыр сливочный, авокадо, огурцы, кунжут	128 г 4 шт	\N	4.95	t
29	2639	Ролл «Маки кунсей»	Роллы с копчёным лосем	Лосось копчёный, рис, нори	83 г 4 шт	\N	3.8	t
29	2640	Ролл «Гурмэ маки»	Роллы с копчёным лосем	Лосось копчёный, сыр сливочный, помидор, рис, нори	150 г 4 шт	\N	4.95	t
29	2641	Ролл «Панда маки»	Роллы с копчёным лосем	Лосось копчёный, сыр сливочный, салат зелёный, кляр	110 г 4 шт	\N	5.95	t
29	2642	Ролл «Мики маки»	Роллы с копчёным лосем	Лосось копчёный, помидоры, огурец, томаго, соус «Спайси» «Кимчи», кунжут	110 г 4 шт	\N	4.35	t
29	2643	Ролл «Казай маки»	Роллы с жаренным лососем	Лосось, соус «Терияки», сыр сливочный, огурцы, омлет «Томаго»	124 г 4 шт	\N	4.35	t
29	2644	Ролл «Ритоку маки»	Роллы с жаренным лососем	Лосось «Терияки», сыр сливочный, помидор, икра тобико, рис, нори	111 г 4 шт	\N	4.3	t
29	2645	Ролл «Шимми маки»	Роллы с жаренным лососем	Лосось жареный, салат, огурцы, майонез, рис, нори	96 г 4 шт	\N	3.95	t
29	2646	Ролл «Яшимитсу маки»	Роллы с жаренным лососем	Лосось «Терияки», креветка, сыр сливочный, перец красный, рис, нори	122 г 4 шт	\N	4.95	t
29	2647	Ролл «Тенчи маки»	Ролл с тунцом	Тунец, креветка, сыр сливочный, помидор, икра тобико, рис, нори	118 г 4 шт	\N	5.2	t
29	2648	Ролл «Текка маки»	Ролл с тунцом	Тунец, рис, нори	83 г 4 шт	\N	3.95	t
29	2649	Ролл «Спайси текка маки» 	Ролл с тунцом	Тунец, соус «Спайси», рис, нори	84 г 4 шт	\N	3.75	t
29	2650	Ролл «Текка каппа маки»	Ролл с тунцом		89 г 4шт	\N	3.8	t
29	2651	Ролл «Тото маки»	Ролл с тунцом	Тунец, сыр сливочный, огурец, кунжут	118 г 4 шт	\N	4.3	t
29	2652	Ролл «Банзай маки»	Роллы с копчёным тунцом	Рыба масляная, креветка, огурец, авокадо, сыр сливочный	143 г 4 шт	\N	7.95	t
29	2653	Ролл «Маисо маки»	Роллы с копчёным тунцом	Рыба масляная, сыр сливочный, помидор, икра масаго, рис, нори	124 г 4 шт	\N	5.95	t
29	2654	Ролл «Мудзиями маки»	Роллы с копчёным тунцом	Рыба масляная, сыр сливочный, водоросли чукка, стружка тунца	104 г  4шт	\N	4.75	t
29	2655	Ролл «Дракон маки»	Роллы с угрём	Угорь, креветка, икра тобико, авокадо, кунжут обжаренный, рис, нори	126 г 4шт	\N	9.75	t
29	2656	Ролл «Сенсей маки»	Роллы с угрём	Угорь копчёный, перец красный, сыр сливочный, икра тобико, кунжут, рис, нори	124 г 4 шт	\N	5.8	t
29	2657	Ролл «Уками маки»	Роллы с угрём	Угорь, сыр сливочный, перец, помидор, икра тобико, кунжут, рис, нори	116 г 4 шт	\N	5.35	t
29	2658	Ролл «Унаги маки» 	Роллы с угрём	Угорь копчёный, огурцы, рис, нори	95 г 4 шт	\N	5.25	t
29	2659	Ролл «Унаги ошинко маки» 	Роллы с угрём	Угорь копчёный, редис дайкон, сыр сливочный, авокадо, рис, нори	113 г 4 шт	\N	5.3	t
29	2660	Ролл «Авокадо маки»	Роллы с овощами	Авокадо, рис, нори	79 г 4 шт	\N	2.95	t
29	2661	Ролл «Умодзю маки»	Роллы с овощами	Огурец, авокадо, сыр сливочный, кунжут	107 г	\N	3.4	t
29	2662	Ролл «Чукка маки» 	Роллы с овощами	Чукка-салат, кунжут, рис, нори	76 г  4шт	\N	2.55	t
29	2663	Ролл «Ясай маки»	Роллы с овощами	Перец сладкий, помидор, огурцы, салат, кунжут, рис, нори	182 г 8 шт	\N	7.2	t
29	2664	Ролл «Каппа маки»	Роллы с овощами	Огурцы, рис, нори	83 г 4 шт	\N	1.75	t
29	2665	Ролл «Хирохито маки»	Роллы с овощами	Такуан, сыр сливочный	93 г 4 шт	\N	2.95	t
29	2666	Ролл «Аризона маки»	Ролл с креветкой	Креветка тигровая, помидор, огурцы, кунжут обжаренный, рис, нори	114 г 4 шт	\N	5.75	t
29	2667	Ролл «Омоширо маки»	Ролл с креветкой	Лосось, сыр сливочный, креветка, чукка-салат, рис, нори	128 г 4 шт	\N	6.8	t
29	2668	Ролл «Осака маки»	Ролл с креветкой	Лосось, креветки, сыр сливочный, авокадо, огурцы	144 г 4 шт	\N	7.95	t
29	2669	Ролл «Токио маки»	Ролл с креветкой	Креветка тигровая, помидор, авокадо, сыр сливочный, икра тобико, рис, нори	134 г 4 шт	\N	7.98	t
29	2670	Ролл «Шимода маки»	Ролл с креветкой	Креветка тигровая, авокадо, огурцы, перец сладкий, икра тобико, соус острый, рис, нори	185 г 6 шт	\N	8.4	t
29	2671	Ролл «Акито маки»	Роллы с мидиями	Мидии, сыр сливочный, чукка‑салат, огурец	108 г 4 шт	\N	3.9	t
29	2672	Ролл «Игай маки»	Роллы с мидиями	Мидии, сыр сливочный, омлет японский «Тамаго», огурцы, икра тобико, рис, нори	119 г 4шт	\N	4.45	t
30	2778	Ролл «Чукка» 	Классические роллы	Рис, нори, сыр творожный, чукка-салат, ореховый соус	8 шт	\N	5.2	t
29	2673	Ролл «Ниндзя маки»	Роллы с мидиями	Мидии, авокадо, сыр сливочный, соус «Спайси кимчи», икра тобико	113 г 4шт	\N	4.55	t
29	2674	Ролл «Цезарь маки»	Роллы с курицей	Курица, сыр сливочный, салат, перец, икра масаго	104 г 4 шт	\N	3.95	t
29	2675	Ролл «Чикен маки»	Роллы с курицей	Курица, сыр сливочный, помидор, лимон, икра тобико	104 г 4 шт	\N	3.95	t
29	2676	Ролл «Шикасу маки»	Роллы с курицей	Курица, сыр сливочный, помидор, такуан, икра тобико	104 г 4 шт	\N	3.95	t
29	2677	Ролл «Биг маки»	Дизайн роллы	Лосось, креветка, икра тобико, сыр сливочный, авокадо	293 г 8 шт	\N	19.3	t
29	2678	Ролл «Биг маки кунсей»	Дизайн роллы	Копченый лосось, креветка, сыр сливочный, помидоры, икра масаго	293 г 8 шт	\N	19.6	t
29	2679	Ролл «Инь‑ян маки»	Дизайн роллы	Тунец, лосось	198 г 8 шт	\N	11.4	t
29	2680	Ролл «Саппоро маки»	Дизайн роллы	Омлет японский «Тамаго», угорь копчёный, огурцы, авокадо, рис, нори	194 г 6шт	\N	10.9	t
29	2681	Ролл «Тенчи маки хот»	Горячие роллы	Тунец, креветка, сыр сливочный, помидоры, икра тобико, темпура	263 г 8 шт	\N	10.9	t
29	2682	Ролл «Гурмэ маки хот»	Горячие роллы	Лосось копчёный, сыр сливочный, помидоры, темпура	260 г 8 шт	\N	10.15	t
29	2683	Ролл «Маисо маки хот»	Горячие роллы	Рыба масляная, сыр сливочный, помидоры, икра масаго, темпура	260 г 8 шт	\N	9.9	t
29	2684	Ролл «Могилевщина маки»	Горячие роллы	Лосось, сыр сливочный, огурец, икра масаго, майонез Hellmanns, сыр «Моцарелла», сыр «Чеддер»	328 г 8 шт	\N	13.5	t
29	2685	Ролл «Нитсу маки»	Горячие роллы	Лосось копчёный, огурцы, чукка-салат, майонез, сыр «Моцарелла», сыр «Чеддер»	303 г 8 шт	\N	9.9	t
29	2686	Ролл «Филадельфия маки хот»	Горячие роллы	Лосось, сыр сливочный, огурцы, авокадо, темпура	270 г 8 шт	\N	9.9	t
29	2687	Ролл «Сяке маки гриль»	Горячие роллы	Лосось, майонез Hellmanns, сыр «Моцарелла», сыр «Чеддер»	243 г 8 шт	\N	9.9	t
29	2688	Ролл «Росуто маки»	Горячие роллы	Лосось в соусе «Терияки» жареный, сыр сливочный, чукка-салат, майонез, сыр «Моцарелла», сыр «Чеддер»	323 г 8 шт	\N	9.9	t
29	2689	Ролл «Тайсай маки хот»	Горячие роллы	Лосось, томаго, салат, огурцы, темпура	228 г 8 шт	\N	8.5	t
29	2690	Ролл «Эни маки»	Горячие роллы			\N	9.9	t
29	2691	Ролл «Хотто маки»	Горячие роллы	Мидии, сыр сливочный, огурец, соус «Спайси», майонез Hellmanns, сыр «Моцарелла», сыр «Чеддер»	323 г 8 шт	\N	11.5	t
29	2692	Нигири «Сяке»	Суши и нигири	Рис, лосось	40 г	\N	2.5	t
29	2693	Нигири «Сяке гурмэ»	Суши и нигири	Рис, лосось копчёный	40 г	\N	2.7	t
29	2694	Нигири «Унаги» 	Суши и нигири	Рис, угорь	40 г	\N	3.5	t
29	2695	Нигири «Сяке Филадельфия»	Суши и нигири	Рис, сливочный сыр, лосось	45 г	\N	2.7	t
29	2696	Нигири «Имудзи»	Суши и нигири	Рис, тунец копчёный	40 г	\N	3.2	t
29	2697	Нигири «Имудзи филадельфия»	Суши и нигири	Рис, сливочный сыр, тунец копчёный	45 г	\N	3.5	t
29	2698	Нигири «Сяке Филадельфия гурмэ»	Суши и нигири	Рис, сливочный сыр, лосось копчёный	45 г	\N	2.9	t
29	2699	Нигири «Тамаго»	Суши и нигири	Рис, омлет японский	40 г	\N	1.5	t
29	2700	Cет «Крейзи микс»	Суши-сеты	1/2 Грин филадельфия маки 1/2 Ниндзя маки 1/2 Шикасу маки 1/2 Тото маки 1/2 Гурмэ маки 1/2 Ритоку	32 шт.	\N	39.99	t
29	2701	Сет «Овощной микс» вегетарианский	Суши-сеты	Умодзю маки-1 шт Авокадо маки-1 шт Каппа маки-1 шт Ясай маки-1 шт Чукка маки‑1 шт	1043 г 40 шт.	\N	27	t
29	2702	Суши-сет «Премиум»	Суши-сеты	Грин филадельфия ½ Тенчи маки ½ Игай маки ½ Маисо маки ½ 5 сяке филадельфия, японский гарнир и палочки	695 г 21 шт	\N	37	t
29	2703	Суши-сет «Хидзуке»	Суши-сеты	Ролл «Каппа маки», ролл «Авокадо маки», ролл «Сяке маки», ролл «Текка маки», ролл «Унаги маки»	1118 г 40 шт	\N	37	t
29	2704	Сет горячий «Ями»	Суши-сеты	Сяке маки гриль-1 шт Хотто маки-1 шт Росуто маки-1 шт Фри картофель‑2 шт	860 г 24 шт	\N	35	t
29	2705	Суши-сет №10 «Изуми ланч»	Суши-сеты	Ролл «Бонито маки», ролл «Акито маки», соус соевый, васаби, имбирь 	509 г	\N	9.9	t
29	2706	Суши-сет №1	Суши-сеты	1/2 ролла «Сяке маки», 1/2 ролла «Унаги маки», 1/2 ролла «Текка маки», 1/2 ролла «Сяке терияки маки», 1/2 ролла «Авокадо маки», 1/2 ролла «Каппа маки», японский гарнир и палочки	550 г	\N	20	t
29	2707	Суши-сет №11 «Чикен ланч» (только с 10:00 до 15:00)	Суши-сеты	Ролл «Цезарь маки», ролл «Чикен маки», соус соевый, васаби, имбирь	509 г	\N	9.9	t
29	2708	Суши-сет №2	Суши-сеты	1/2 ролла «Сяке авокадо маки», 1/2 ролла «Игай маки», 1/2 ролла «Маисо маки», 1/2 ролла «Текка каппа маки», нигири «Сяке» 2 шт, нигири «Томаго 2 шт, нигири «Унаги» 1 шт, японский гарнир и палочки	651 г	\N	22	t
29	2709	Суши-сет №3 «Сырный»	Суши-сеты	Ролл «Филадельфия маки», ролл «Филадельфия классик», ролл «Филадельфия хот», японский гарнир и палочки	820 г	\N	45	t
29	2710	Суши-сет №4 «Филадельфия Ultimate»	Суши-сеты	1/2 ролла «Токио маки», 1/2 ролла «Тенчи маки», 1/2 ролла «Филадельфия маки», 1/2 ролла «Бонито», ролл «Сяке филадельфия», японский гарнир и палочки	693 г	\N	39	t
29	2711	Суши-сет №5 «Party сет»	Суши-сеты	Ролл «Сяке терияки маки», ролл «»Омоширо маки», ролл «Унаги маки», нигири «Унаги», нигири «Томаго», нигири «Сяке» + до пяти бесплатных гарниров и палочки	1240 г	\N	69	t
29	2712	Суши-сет №6 «Сет с дымом»	Суши-сеты	1/2 ролла «Омоширо маки», 1/2 ролла «Маисо маки», 1/2 ролла «Гурме маки», 1/2 ролла «Сенсей маки», нигири с белым тунцом, японский гарнир и палочки	700 г	\N	30	t
29	2713	Суши-сет №7	Суши-сеты	1/2 ролла «Тайсай маки», 1/2 ролла «Сяке авокадо маки», 1/2 ролла «Шимми маки», 1/2 ролла «Ояко маки», 1/2 ролла «Филадельфия маки», 1/2 ролла «Маисо маки», два японских гарнира, две пары палочек	830 г	\N	39	t
29	2714	Суши-сет №8 «Запечённый япончик»	Суши-сеты	1/2 ролла «Филадельфия хот», 1/2 ролла «Гурме хот», 1/2 ролла «Тенчи хот», 1/2 ролла «Тайсай хот», ролл «Сяке маки гриль», японский гарнир, соус «Чили» сладкий, пара палочек	753 г	\N	39	t
29	2715	Суши-сет №9 «Обеденный сет» (только с 10:00 до 15:00)	Суши-сеты		509 г	\N	9.9	t
29	2716	Васаби 	Японский гарнир		10 г	\N	1.4	t
29	2717	Имбирь	Японский гарнир		30 г	\N	1.4	t
29	2718	Соус соевый	Японский гарнир		50 г	\N	1.4	t
29	2719	Соус орехово-кунжутный	Японский гарнир		30 г	\N	2	t
29	2720	Соус кисло-сладкий «Чили»	Японский гарнир		30 г	\N	2	t
29	2721	Соус «Кимчи» (острый)	Японский гарнир		30 г	\N	2	t
29	2722	Соус устричный	Японский гарнир		30 г	\N	2	t
29	2723	Соус «Терияки» 	Японский гарнир		30 г	\N	2	t
29	2724	Кальмар темпура	Горячие закуски		100 г	\N	8.9	t
29	2725	Картофель фри	Горячие закуски		100 г	\N	2.6	t
29	2726	Кольца луковые	Горячие закуски		100 г	\N	4.4	t
29	2727	Наггетсы 	Горячие закуски		100 г	\N	4.5	t
29	2728	Креветка темпура	Горячие закуски		100 г	\N	9.9	t
29	2729	Сет «Темпура»	Горячие закуски	Ролл «Филадельфия маки», ролл «Калифорния маки», соус соевый, васаби, имбирь, одна пара палочек		\N	19.9	f
29	2730	Палочки	Приборы	Кальмар, креветка, кольца луковые, соус кисло‑сладкий чили	1 пара	\N	0.15	f
29	2731	Вилка	Приборы		1 шт.	\N	0.15	t
29	2732	Лапша яичная	WOK		250 г	\N	3.9	t
29	2733	Лапша рисовая	WOK		250 г	\N	3.9	t
29	2734	Креветки	WOK		30 г	\N	2.25	t
29	2735	Курица	WOK		30 г	\N	1.15	t
29	2736	Лосось	WOK		30 г	\N	2.45	t
29	2737	Мидии	WOK		30 г	\N	1.4	t
29	2738	Сыр «Моцарелла»	WOK		30 г	\N	1.3	t
29	2739	Сыр сливочный	WOK		30 г	\N	1.1	t
29	2740	Вода питьевая BonAqua	Напитки	В ассортименте	500 мл	\N	1.4	t
29	2741	Сок «Добрый» мультифрукт	Напитки	С трубочкой	200 мл	\N	1.2	t
29	2742	Сок «Добрый» апельсиновый	Напитки	С трубочкой	200 мл	\N	1.2	t
29	2743	Энергитический напиток «Бёрн» красный	Напитки		250 мл	\N	3.25	t
29	2744	Энергитический напиток «Бёрн» синий	Напитки		250 мл	\N	3.25	t
29	2745	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	1.5	t
29	2746	Напиток газированный Fanta «Апельсин»	Напитки		500 мл	\N	1.5	t
29	2747	Напиток газированный Fanta «Мандарин»	Напитки		500 мл	\N	1.5	t
29	2748	Напиток газированный Sprite	Напитки		500 мл	\N	1.5	t
29	2749	Напиток газированный Coca-Cola «Лимон»	Напитки		500 мл	\N	1.5	t
29	2750	Вода питьевая BonAqua «Лимон»	Напитки			\N	1.4	t
30	2751	Суши-сет «Эгоист»	Суши-сеты	Запечённый ролл «Лосось», ролл «Филадельфия лайт», ролл «Аляска», ролл «Грин лосось»	985 г 32 шт	\N	35.4	t
30	2752	Суши-сет «Филадельфия XL»	Суши-сеты	Ролл «Филадельфия в кунжуте» 8 шт, ролл «Филадельфия лайт» 4 шт, ролл «Филадельфия классическая» 4 шт, ролл «Филадельфия с огурцом» 4 шт, ролл «Филадельфия с авокадо» 4 шт, ролл «Грин» 8 шт	1050 г 32 шт	\N	49.8	t
30	2753	Суши-сет «Хот‑микс»	Суши-сеты	Ролл «Хот-хит», запечённый ролл с курицей и такуаном, ролл «Рим», запечённый ролл «Лакедра в кунжуте»	930 г 32 шт	\N	32.9	t
30	2754	Суши-сет «Гонконг»	Суши-сеты	Ролл «Филадельфия лайт», запечённый ролл с курицей и такуаном, ролл «Грин лосось», ролл «Лакедра с чуккой», ролл «Терияки в огурце»	1205 г 40 шт	\N	43.9	t
30	2755	Сет «Кентуки»	Суши-сеты	Ролл «Креветка» 8 шт, Ролл «Тунец с креветкой» 8 шт, «Бонито» 4 шт, «Грин» 4 шт, «Филадельфия в кунжуте» 4 шт	771 г 28 шт	\N	30.9	t
30	2756	Сет «Запечённый»	Суши-сеты	Запечённый ролл «Креветка», запечённый ролл «Лосось», запечённый ролл «Мидии», запечённый ролл «Тунец»	1000 г 32 шт	\N	31.9	t
30	2757	Суши-сет «Токио»	Суши-сеты	Ролл «Бонито» 4 шт, ролл «Копченый лосось с чуккой» 4 шт, ролл «Грин» 4 шт, ролл «Лосось копчёный с авокадо» 4 шт, ролл «Мидии в кунжуте» 4 шт, ролл «Калифорния классическая» 4 шт, ролл «Сабвей» 4 шт, ролл «Аляска» 4 шт, ролл «Лакедра с чуккой» 4 шт	1039 г 36 шт	\N	36.9	t
30	2758	Суши-сет «Изуми»	Суши-сеты	Ролл «Лосось копчёный с чуккой» 4 шт, ролл «Филадельфия классическая» 4 шт, ролл «Запечённый ролл лакедра в кунжуте» 8 шт, ролл «Бонито» 4 шт, ролл «Римский» 4 шт, ролл «Лосось копчёный с авокадо» 4 шт	887 г 28 шт	\N	33.9	t
30	2759	Суши-сет «Терияки» 	Суши-сеты	Ролл «Терияки в огурце», ролл «Лосось терияки», ролл «Терияки» в стружке тунца, ролл «Терияки» в беконе 4 шт	820 г 28 шт	\N	28.9	t
30	2760	Суши-сет «Осака»	Суши-сеты	Ролл «Унаги маки», ролл «Лосось копчёный с авокадо», ролл «Калифорния классическая», ролл «Лосось копчёный с такуаном»	845 г 32 шт	\N	33.9	t
30	2761	Суши-сет «Монтана»	Суши-сеты	Ролл «Дракон» 4 шт, ролл «Лосось терияки» 4 шт, ролл «Эбби» 4 шт, ролл «Мидии в кунжуте» 4 шт, ролл «Тунец с креветкой» 4 шт, ролл «Кацио Буши» 8 шт	796 г 28 шт	\N	29.9	t
30	2762	Суши-сет «Хот»	Суши-сеты	Ролл «Хот-хит», ролл «Тори бекон», ролл «Сакура», ролл «Рим»	805 г 32 шт	\N	32.9	t
30	2763	Суши-сет «Изуми»	Суши-сеты	Ролл «Лосось копчёный» с чуккой 4 шт, ролл «Филадельфия классическая» 4 шт, запечённый ролл «Лакедра в кунжуте» 8 шт, ролл «Бонито» 4 шт, ролл «Римский» 4 шт, ролл «Лосось копчёный» с авокадо 4 шт	887 г 28 шт	\N	33.9	t
30	2764	Суши-сет «Марокко»	Суши-сеты	Ролл «Филадельфия лайт» 8 шт, ролл «Тигровый» 8 шт, ролл «Филадельфия классическая» 4 шт, ролл «Нежный угорь» 4 шт	755 г 24 шт	\N	39.3	t
30	2765	Суши-сет «Тануки»	Суши-сеты	Ролл «Тигровый» 8 шт, ролл «Мидии в кунжуте» 8 шт, ролл «Калифорния с креветкой» 4 шт, ролл «Аляска» 4шт	745 г 24 шт	\N	29.9	t
30	2766	Суши-сет «Классический»	Суши-сеты	Ролл «Лосось», ролл «Креветка», ролл «Унаги маки», ролл «Авокадо», ролл «Мидии»	905 г 40 шт	\N	33.9	t
30	2767	Суши-сет «Аризона»	Суши-сеты	Ролл «Сакура», ролл «Лосось» запечённый, ролл «Филадельфия в кунжуте», ролл «Бонито»	900 г 32 шт	\N	33.9	t
30	2768	Ролл «Лосось терияки» 	Классические роллы	Рис, нори, cыр творожный, лосось жареный, огурец, омлет японский	8 шт	\N	7.2	t
30	2769	Ролл «Унаги маки» 	Классические роллы	Рис, нори, угорь, огурец	8 шт	\N	8.9	t
30	2770	Ролл «Лакедра с чуккой»	Классические роллы	Рис, нори, сыр творожный, лакедра, чукка‑салат	8 шт	\N	7.9	t
30	2771	Ролл «Лосось копчёный с такуаном»	Классические роллы	Рис, нори, сыр творожный, лосось копчёный, такуан	8 шт	\N	7.2	t
30	2772	Ролл «Сабвей»	Классические роллы	Рис, нори, сыр творожный, авокадо, перец, помидоры, огурец	8 шт	\N	7.5	t
30	2773	Ролл «Римский»	Классические роллы	Рис, нори, сыр творожный, краб, огурец, перец, соус «Спайси»,	8 шт	\N	7.5	t
30	2774	Ролл «Креветка с тунцом и помидором»	Классические роллы	Рис, нори, сыр, тунец, креветка, помидоры	8 шт	\N	8.5	t
30	2775	Ролл «Лосось»	Классические роллы	Рис, нори, лосось	8 шт	\N	5.4	t
30	2776	Ролл «Тунец»	Классические роллы	Рис, нори, сыр творожный, тунец	8 шт	\N	6.2	t
30	2777	Ролл «Краб»	Классические роллы	Рис, нори, сыр творожный, краб	8 шт	\N	4.9	t
31	2965	Соус «Терияки» 	Топинг		30 г	\N	2.6	t
30	2779	Ролл «Мидии»	Классические роллы	Рис, нори, сыр творожный, мидии	8 шт	\N	5.2	t
30	2780	Ролл «Авокадо»	Классические роллы	Рис, нори, сыр творожный, авокадо	8 шт	\N	5.2	t
30	2781	Ролл «Лосось лайт»	Классические роллы	Рис, нори, сыр творожный, лосось	8 шт	\N	5.7	t
30	2782	Ролл «Креветка»	Классические роллы	Рис, нори, сыр творожный, креветка	8 шт	\N	7.1	t
30	2783	Ролл «Кацио Буши»	Роллы	Рис, нори, сыр творожный, лосось копчёный, огурец, лук, соус «Спайси», стружка тунца	8 шт	\N	7.4	t
30	2784	Ролл «Филадельфия классическая»	Роллы	Рис, нори, сыр творожный, лосось	8 шт	\N	16.9	t
30	2785	Ролл «Филадельфия» с авокадо	Роллы	Рис, нори, сыр творожный, лосось, авокадо	8 шт	\N	17.9	t
30	2786	Ролл «Филадельфия» с огурцом	Роллы		8 шт	\N	16.9	t
30	2787	Ролл «Филадельфия лайт»	Роллы	Рис, нори, сыр творожный, авокадо, лосось	8 шт	\N	11.9	t
30	2788	Ролл «Филадельфия» в кунжуте	Роллы	Рис, нори, сыр творожный, лосось, огурец, авокадо, кунжут	8 шт	\N	9.9	t
30	2789	Ролл «Лакедра с лососем в кунжуте»	Роллы	Рис, нори, сыр творожный, лакедра, лосось, чукка‑салат, кунжут	8 шт	\N	8.9	t
30	2790	Ролл «Лосось с угрём»	Роллы	Рис, нори, сыр творожный, угорь, лосось, такуан, кунжут	8 шт	\N	10.9	t
30	2791	Ролл «Мидии в кунжуте»	Роллы	Рис, нори, сыр творожный, мидии, чукка-салат, кунжут, ореховый соус	8 шт	\N	7.5	t
30	2792	Ролл «Мидии остро‑сладкие»	Роллы	Рис, нори, сыр творожный, мидии, огурец, лук, соус остро‑сладкий, кунжут	8 шт	\N	7.5	t
30	2793	Ролл «Калифорния с креветкой»	Роллы	Рис, нори, сыр творожный, креветка, огурец, икра тобико	8 шт	\N	11.6	t
30	2794	Ролл «Калифорния с лососем»	Роллы	Рис, нори, сыр творожный, лосось, икра тобико	8 шт	\N	11.1	t
30	2795	Ролл «Классическая Калифорния»	Роллы	Рис, нори, сыр творожный, краб, икра тобико	8 шт	\N	9.2	t
30	2796	Ролл «Эбби»	Роллы	Рис, нори, сыр творожный, креветка, икра тобико	8 шт	\N	10.2	t
30	2797	Ролл «Тунец с креветкой»	Роллы	Рис, нори, сыр творожный, тунец, креветка, икра тобико	8 шт	\N	11.5	t
30	2798	Ролл «Лосось с креветкой и авокадо»	Роллы	Рис, нори, сыр творожный, лосось, креветка, авокадо, икра тобико	8 шт	\N	11.5	t
30	2799	Ролл «Аляска»	Роллы	Рис, нори, сыр творожный, копчёная курица, огурец, лук, бекон	8 шт	\N	7.9	t
30	2800	Ролл «Терияки в беконе» 	Роллы	Рис, нори, сыр творожный, лосось жареный, огурец, бекон, соус «Унаги»	8 шт	\N	9.1	t
30	2801	Ролл «Терияки в огурце» 	Роллы	Рис, нори, сыр творожный, лосось жареный, помидоры, огурец	8 шт	\N	8.2	t
30	2802	Ролл «Терияки в стружке тунца» 	Роллы	Рис, нори, сыр творожный, лосось жареный, огурец, стружка тунца, чукка‑салат	8 шт	\N	8.3	t
30	2803	Ролл «Грин»	Роллы	Рис, нори, сыр творожный, лосось, огурец, помидоры, укроп	8 шт	\N	7.2	t
30	2804	Ролл «Грин лосось»	Роллы	Рис, нори, сыр творожный, лосось, салат-чукка, соус кунжутный	8 шт	\N	7.8	t
30	2805	Ролл «Лосось копчёный с чуккой»	Роллы	Рис, нори, сыр творожный, лосось копчёный, омлет японский, чукка‑салат	8 шт	\N	7.9	t
30	2806	Ролл «Лосось копчёный с авокадо»	Роллы	Рис, нори, сыр творожный, лосось копчёный, омлет японский, авокадо, кунжут	8 шт	\N	8.1	t
30	2807	Ролл «Дракон»	Роллы	Рис, нори, сыр творожный, угорь, икра тобико, огурец, лук, соус «Спайси», стружка тунца	8 шт	\N	11.5	t
30	2808	Ролл «Бонито»	Роллы	Рис, нори, сыр творожный, лосось, авокадо, стружка тунца,	8 шт	\N	8.5	t
30	2809	Ролл «Тигровый»	Роллы	Рис, нори, сыр творожный, лосось, огурец, креветка	8 шт	\N	11.9	t
30	2810	Ролл «Нежный угорь»	Роллы	Рис, нори, сыр творожный, авокадо, икра тобико, угорь, соус «Унаги»	8 шт	\N	12.9	t
30	2811	Ролл-темпура «Сакура»	Темпура	Рис, нори, сыр творожный, лосось, огурец, икра тобико	200 г	\N	8.8	t
30	2812	Ролл-темпура «Рим»	Темпура	Рис, нори, сыр творожный, тунец, креветка, помидоры	205 г	\N	7.4	t
30	2813	Ролл-темпура «Цезарь»	Темпура	Рис, нори, сыр творожный, курица копчёная, огурец, помидоры	205 г	\N	6.9	t
30	2814	Ролл-темпура «Тори бекон»	Темпура	Рис, нори, сыр творожный, копчёная курица, бекон, огурец, лук, соус «Спайси»	210 г	\N	7.2	t
30	2815	Ролл-темпура «Хот‑хит»	Темпура	Рис, нори, лосось, креветка, икра тобико, лук, соус «Спайси»	190 г	\N	9.3	t
30	2816	Ролл-темпура «Лакедра»	Темпура			\N	8.9	t
30	2817	Запечённый ролл «Креветка»	Запечённые роллы	Рис, нори, сыр «Креметте», соус сырный, соус «Унаги», кунжут	220 г	\N	7.9	t
30	2818	Запечённый ролл «Лосось»	Запечённые роллы	Рис, нори, сыр «Креметте», лосось, соус сырный, соус «Унаги», кунжут	210 г	\N	7.8	t
30	2819	Запечённый ролл «Мидии»	Запечённые роллы	Рис, нори, сыр «Креметте», мидии, соус сырный, соус «Унаги», кунжут	240 г	\N	6.8	t
30	2820	Запечённый ролл «Тунец»	Запечённые роллы	Рис, нори, сыр «Креметте», тунец, соус сырный, соус «Унаги», кунжут	240 г	\N	7.9	t
30	2821	Запечённый ролл «Краб»	Запечённые роллы	Рис, нори, сыр «Креметте», краб, соус сырный, соус «Унаги», кунжут	245 г	\N	6.5	t
30	2822	Запечённый ролл «Угорь»	Запечённые роллы	Рис, нори, сыр «Креметте», угорь, соус сырный, соус «Унаги», кунжут	240 г	\N	8.6	t
30	2823	Запечённый ролл «Лосось копчёный с такуаном»	Запечённые роллы	Рис, нори, сыр творожный, лосось копчёный, омлет японский, такуан, сырный соус	295 г	\N	9.2	t
30	2824	Запечённый ролл «Креветка с огурцом»	Запечённые роллы	Рис, нори, сыр творожный, креветка, огурец, икра тобико, сырный соус	285 г	\N	9.5	t
30	2825	Запечённый ролл «Терияки» 	Запечённые роллы	Рис, нори, сыр творожный, лосось жареный, помидоры, стружка тунца, сырный соус	285 г	\N	8.7	t
30	2826	Запечённый ролл «Лакедра в кунжуте»	Запечённые роллы	Рис, нори, лакедра, сыр творожный, чукка-салат, кунжут, сырный соус	275 г	\N	8.4	t
30	2827	Запечённый ролл «Курица с такуаном»	Запечённые роллы	Рис, нори, сыр творожный, курица, такуан, стружка тунца, сырный соус	260 г	\N	7.2	t
30	2828	Запечённый ролл «Филадельфия»	Запечённые роллы	Рис, нори, сыр «Филадельфия», авокадо, лосось	230 г	\N	11.9	t
30	2829	Запечённый ролл «Аляска»	Запечённые роллы	Рис, нори, сыр «Филадельфия», бекон, копченая курица, огурец, зелёный лук	220 г	\N	7.9	t
30	2830	Соус соевый	Топинг		40 мл	\N	1.2	t
30	2831	Соус кунжутный	Топинг		30 мл	\N	2	t
30	2832	Имбирь маринованный	Топинг		40 г	\N	1.5	t
30	2833	Васаби 	Топинг		20 г	\N	1.4	t
30	2834	Соус «Чили» сладкий	Топинг		30 мл	\N	2	t
30	2835	Соус «Терияки» 	Топинг		30 мл	\N	2	t
30	2836	«Кока-кола»/«Фанта»/«Спрайт»	Напитки		0,5 л	\N	1.9	t
30	2837	BonAqua среднегазированная	Напитки		0,5 л	\N	1.6	t
31	2838	Ролл «Кунсей Хияши»	Роллы	Рис, нори, сыр, копченый лосось, салат чука, кунжут ким чи	250 г	\N	8.3	t
31	2839	Ролл «Микс Тартар» 	Роллы	Рис, нори, сыр, огурец, авокадо, лосось, тунец, окунь, кунжут, соус «Азия»	275 г	\N	14.9	t
31	2840	Ролл Orange	Роллы	Рис, нори, сыр, апельсин, лосось, авокадо, соус «Айсберг»	275 г	\N	12.88	t
31	2841	Ролл «Трио»	Роллы	Рис, нори, креветка тигровая, тунец, лосось, авокадо, соус «Айсберг»	280 г	\N	23.8	t
31	2842	Ролл «Канзас»	Роллы	Рис, нори, сыр, креветка тигровая, авокадо, салат чука, лосось, угорь, соус «Терияки»	260 г	\N	18.64	t
31	2843	Ролл «Эби кунсей»	Роллы	Рис, нори, лосось копченый, сыр, салат рамен, креветка тигровая, соус Азия, кунжут	285 г	\N	18.9	t
31	2844	Ролл «Торнадо маки»	Роллы	Рис, нори, салат, креветка в темпуре, икра масаго	165 г	\N	8.4	t
31	2845	Ролл «Хияши Магуро»	Роллы	Рис, нори, тунец, сыр, чукка‑салат	160 г	\N	8.9	t
31	2846	Ролл «Филадельфия эби»	Роллы	Рис, нори, сыр, краб, креветка, огурец, кунжут	230 г	\N	9.5	t
31	2847	Ролл «Кранч Пира»	Роллы	Рис, нори, кранч, соус «Спайси», лосось жареный, сыр «Чеддер», соус «Барбекю»	230 г	\N	11.8	t
31	2848	Ролл «Грин маки»	Роллы	Рис, нори, сыр, лосось копченый, ананас, огурец, кунжут, соус «Терияки»	265 г	\N	10.9	t
31	2849	Ролл «Эби хияши»	Роллы	Рис, нори, сыр, креветка, авокадо, чукка, унаги соус, кунжутный соус	260 г	\N	13.4	t
31	2850	Ролл «Тар тар Магуро»	Роллы	Рис, нори, сыр, салат, огурец, тунец, соус «Спайси», икра масаго	260 г	\N	13.8	t
31	2851	Ролл «Тар‑тар»	Роллы	Рис, нори, лосось, цедра апельсина, перец чили, сыр, яблоко, соус сладкий «Чили»	280 г	\N	11.8	t
31	2852	Ролл «Инари»	Роллы	Рис, нори, сыр, креветка в темпуре, огурец, авокадо, угорь, креветочный соус, соус «Унаги», кранч	290 г	\N	17.6	t
31	2853	Ролл Easy	Роллы	Рис, нори, сыр, угорь, огурец, авокадо, икра тобико	285 г	\N	17.4	t
31	2854	Ролл «Оттава»	Роллы	Рис, нори, сыр, креветка тигровая, авокадо, угорь жареный, соус «Унаги», миндаль	275 г	\N	21.3	t
31	2855	Ролл «Окинава»	Роллы	Рис, нори, сыр, салат «Айсберг», икра тобико, угорь жареный, соус «Унаги», кешью	250 г	\N	16.9	t
31	2856	Ролл «Филадельфия» в кунжуте	Роллы	Рис, нори, сыр, огурец, авокадо, лосось, кунжут	245 г	\N	10.6	t
31	2857	Ролл «Калифорния» с лососем	Роллы	Рис, нори, огурец, авокадо, лосось, икра тобико	240 г	\N	16.2	t
31	2858	Ролл «Калифорния» с креветкой	Роллы	Рис, нори, огурец, авокадо, креветка тигровая, икра тобико	240 г	\N	17.8	t
31	2859	Ролл «Калифорния классик»	Роллы	Рис, нори, огурец, авокадо, снежный краб, икра тобико	250 г	\N	13.9	t
31	2860	Ролл «Тюгоку»	Роллы	Рис, нори, сыр, помидор, лосось жареный, бекон, соус «Чили» сладкий	270 г	\N	13	t
31	2861	Ролл «Филадельфия» с авокадо	Роллы	Рис, нори, сыр, лосось, авокадо	280 г	\N	17.2	t
31	2862	Ролл «Филадельфия» с огурцом	Роллы	Рис, нори, сыр, лосось, огурец	280 г	\N	16.8	t
31	2863	Ролл «Филадельфия классическая»	Роллы	Рис, нори, сыр, лосось	280 г	\N	16.3	t
31	2864	Ролл «Салмонскин»	Роллы	Рис, нори, сыр, огурец, васаби, лосось жареный, стружка тунца	220 г	\N	10.5	t
31	2865	Ролл «Нацу»	Роллы	Рис, нори, сыр, лосось, огурец, кешью, креветка жареная, икра тобико	295 г	\N	18	t
31	2866	Ролл «Тай маки»	Роллы	Рис, нори, сыр, яблоко, креветка, окунь опалённый, кунжут, соус кисло‑сладкий	270 г	\N	13.9	t
31	2867	Ролл «Сайтама»	Роллы	Рис, нори, снежный краб, огурец, авокадо, икра тобико, тунец, соус «Спайси», соус «Унаги»	260 г	\N	14.6	t
31	2868	Ролл «Фукуока»	Роллы	Рис, нори, сыр, лосось, угорь жареный, огурец, авокадо	250 г	\N	15.8	t
31	2869	Ролл «Ямагато»	Роллы	Рис, нори, креветка жареная, авокадо, огурец, икра тобико, тунец, соус «Кимчи»	265 г	\N	17.5	t
31	2870	Ролл «Ямагути»	Роллы	Рис, нори, сыр, ананас, угорь жареный, чукка‑салат	260 г	\N	15.6	t
31	2871	Ролл «Хияши маки»	Роллы	Рис, нори, сыр, лосось, чукка-салат, соус ореховый	265 г	\N	10.7	t
31	2872	Ролл «Бонито»	Роллы	Рис, нори, сыр, авокадо, лосось, стружка тунца	230 г	\N	11.3	t
31	2873	Ролл «Горячая Филадельфия»	Роллы	Рис, нори, сыр, огурец, авокадо, лосось опалённый	280 г	\N	16.1	t
31	2874	Ролл «Филадельфия-Бали»	Роллы	Рис, нори, сыр, манго, лосось, миндаль	290 г	\N	15.2	t
31	2875	Ролл «Хокайдо»	Роллы	Рис, нори, сыр, авокадо, лакедра, стружка тунца	230 г	\N	11.9	t
31	2876	Ролл «Самурай»	Роллы	Рис, нори, сыр, лосось подкопчённый, огурец, угорь, кунжут, соус «Унаги», миндаль	270 г	\N	19.8	t
31	2877	Ланч-ролл	Роллы	Рис, нори, сыр, лосось, снежный краб, авокадо, икра тобико	250 г	\N	15.7	t
31	2878	Ролл «Эби масаго»	Роллы	Рис, нори, сыр, огурец, икра тобико, креветка тигровая	270 г	\N	17	t
31	2879	Ролл «Акита»	Роллы	Рис, нори, креветка жареная, сыр, чукка-салат, икра тобико, соус ореховый	260 г	\N	12.1	t
31	2880	Ролл «Чёрный дракон»	Роллы	Рис, нори, угорь жареный, лосось, сыр, огурец, соус «Унаги», кунжут	270 г	\N	20.6	t
31	2881	Ролл «Гейша»	Роллы	Рис, нори, лосось жареный, авокадо, сыр, васаби	160 г	\N	9.2	t
31	2882	Ролл «Изуми»	Роллы	Рис, нори, сыр, соус «Спайси», окунь морской, огурец	170 г	\N	5.5	t
31	2883	Ролл «Кайсо»	Роллы	Рис, нори, сыр, чукка-салат, лакедра, креветка тигровая	170 г	\N	9	t
31	2884	Ролл «Азия»	Роллы	Рис, нори, угорь жареный, авокадо, соус «Спайси», кунжут	165 г	\N	11.35	t
31	2885	Ролл «Колизей»	Роллы	Рис, нори, огурец, перец, краб снежный, сыр, соус «Спайси»	175 г	\N	4.5	t
31	2886	Ролл «Май‑тай»	Роллы	Рис, нори, угорь жареный, лосось, икра тобико, авокадо	160 г	\N	10.9	t
31	2887	Ролл «Унаги каппа» 	Роллы	Рис, нори, угорь, огурец	175 г	\N	10.9	t
31	2888	Ролл «Сяке авокадо»	Роллы	Рис, нори, лосось, авокадо	170 г	\N	8.3	t
31	2889	Ролл «Чукка маки» 	Роллы	Рис, нори, чукка-салат, соус ореховый	120 г	\N	4.2	t
31	2890	Ролл «Камчатка маки»	Роллы	Рис, нори, краб	120 г	\N	3.4	t
31	2891	Ролл «Эби лайт маки»	Роллы	Рис, нори, сыр, креветка тигровая	120 г	\N	6.7	t
31	2892	Ролл «Сяке лайт маки»	Роллы	Рис, нори, лосось, сыр	120 г	\N	5.5	t
31	2893	Ролл «Спайси сяке маки» 	Роллы	Рис, нори, лосось, соус «Спайси»	120 г	\N	6	t
31	2894	Ролл «Эби маки»	Роллы	Рис, нори, креветка тигровая	120 г	\N	6.9	t
31	2895	Ролл «Текка маки»	Роллы	Рис, нори, тунец	120 г	\N	6.3	t
31	2896	Ролл «Унаги маки» 	Роллы	Рис, нори, угорь	120 г	\N	9.9	t
31	2897	Ролл «Хеби маки»	Роллы	Рис, нори, лакедра, чукка‑салат	120 г	\N	5.75	t
31	2898	Ролл «Авокадо маки»	Роллы	Рис, нори, авокадо	120 г	\N	4.9	t
31	2899	Ролл «Сяке маки»	Роллы	Рис, нори, лосось	120 г	\N	5.8	t
31	2900	Ролл «Запечённая Калифорния»	Роллы	Рис, нори, огурец, авокадо, краб, икра тобико, соус сырный	345 г	\N	15.3	t
31	2901	Запечённый ролл с овощами	Запечённые роллы	Рис, нори, перец, помидоры, огурец, майонез, соус сырный	310 г	\N	9.9	t
31	2902	Запечённый ролл с креветками	Запечённые роллы	Рис, нори, сыр, огурец, креветка, соус сырный, икра тобико	345 г	\N	14.9	t
31	2903	Запечённый ролл с угрём	Запечённые роллы	Рис, нори, сыр, огурец, лук зелёный, угорь, икра тобико, стружка тунца, соус сырный	330 г	\N	17.9	t
31	2904	Запечённый сырный ролл с лососем	Запечённые роллы	Рис, нори, сыр, лосось, огурец, икра тобико, соус сырный	345 г	\N	14.8	t
31	2905	Запечённый ролл с курицей	Запечённые роллы	Рис, нори, курица, огурец, сыр, лук зелёный, икра тобико, соус сырный, стружка тунца	340 г	\N	11.5	t
31	2906	Горячий ролл «Хот ацуи»	Горячие роллы	Нори, сыр, лосось, креветка, огурец, икра масаго, салат рамен, сухари панировочные, соус «Азия»	200 г	\N	17.2	t
31	2907	Горячий ролл «Хот эби»	Горячие роллы	Рис, нори, сыр, креветка тигровая, икра тобико, огурец, темпура	240 г	\N	11.9	t
31	2908	Горячий ролл «Хот унаги» 	Горячие роллы	Рис, нори, сыр, угорь жареный, икра тобико, огурец, темпура	240 г	\N	14.8	t
31	2909	Горячий ролл «Хот магуро»	Горячие роллы	Рис, нори, сыр, тунец, лакедра, чукка‑салат, темпура	235 г	\N	10.6	t
31	2910	Горячий ролл «Хот сяке»	Горячие роллы	Рис, нори, сыр, лосось, авокадо, темпура	235 г	\N	10.5	t
31	2911	Горячий ролл «Хот Цезарь»	Горячие роллы	Рис, нори, сыр, курица, помидор, салат «Айсберг», темпура	250 г	\N	7.4	t
31	2912	Суши-сет «Саппоро»	Суши-сеты	Ролл «Фреш пира», ролл «Торонто маки», ролл «Торнадо», Запечённый ролл «Колизей»	24 шт	\N	44.35	t
31	2913	Суши-сет «Сяке»	Суши-сеты	Ролл «Филадельфия» с огурцом, ролл «Филадельфия» в кунжуте, ролл «Калифорния »с лососем, ролл «Сяке маки», запечённый ролл «Сяке лайт»	24 шт	\N	58.93	t
31	2914	Суши-сет «Унаги» 	Суши-сеты	Ролл «Манхеттен», ролл «Унаги каппа», ролл «Унаги каппа» запечённный, ролл «Унаги Хияши» 890г	890 г 32 шт	\N	53.37	t
31	2915	Суши-сет «Магуро»	Суши-сеты	Ролл «Магуро Филадельфия», ролл «Тар-тар», ролл «Магуро», ролл «Хияши магуро», запечённый ролл с овощами	995 г 32 шт	\N	43.54	t
31	2916	Суши-сет «Кабояки»	Суши-сеты	Ролл «Такуми», ролл «Филадельфия» с огурцом, ролл «Осака», ролл «Такеши»	1115 г 32 шт	\N	53.18	t
31	2917	Суши-сет «Ничоси»	Суши-сеты	Ролл «Азия», ролл «Гейша», ролл «Унаги каппа», ролл «Терияки», ролл «Май‑тай»	850 г 40 шт	\N	50.37	t
31	2918	Суши-сет Just buy it	Суши-сеты	Ролл Easy, ролл «Эби масаго», ролл «Хияши»	835 г 24 шт	\N	45.9	t
31	2919	Гриль-сет	Суши-сеты	Ролл «Горячая Филадельфия», ролл «Тюгоку», ролл «Тай маки»	810 г 24 шт	\N	42.99	t
31	2920	Суши-сет «Аризона»	Суши-сеты	Ролл «Хоккайдо», ролл «Оттава», ролл «Осака», ролл «Акита»	1050 г 32 шт	\N	61.6	t
31	2921	Суши-сет «Техас»	Суши-сеты	Ролл «Салмонскин», ролл «Маруяке», ролл «Тюгоку», ролл «Колизей»	900 г 32 шт	\N	43.17	t
31	2922	Суши-сет «Милтон»	Суши-сеты	Ролл «Ямагути», ролл «Филадельфия-Бали», ролл «Сайтама», ролл «Фукуока»	1135 г	\N	61.21	t
31	2923	Суши-сет «Калифорния»	Суши-сеты	Ролл «Калифорния классическая», ролл «Калифорния» с креветкой, ролл «Калифорния» с лососем	710 г	\N	47.9	t
31	2966	Соус «Спайси» 	Топинг		30 г	\N	2.4	t
31	2967	Соус «Унаги» 	Топинг		30 г	\N	2.4	t
31	2924	Запечённый суши‑сет	Суши-сеты	Ролл «Запечённая Калифорния», запечённый ролл с лососем, запечённый ролл с угрём	1020 г 24 шт	\N	47.6	t
31	2925	Суши-сет «Флорида»	Суши-сеты	Запечённый ролл с креветкой, запечённый ролл с лососем, ролл «Сэбо», ролл «Тай»	1200 г 32 шт	\N	51.67	t
31	2926	Суши-сет «Оригами»	Суши-сеты	Ролл «Филадельфия» с огурцом, ролл «Эби масаго», ролл «Окинава», ролл «Калифорния классическая»	1000 г 32 шт	\N	64.6	t
31	2927	Суши-сет «Чикаго»	Суши-сеты	Ролл «Цурай», ролл «Бонито», ролл «Хияши», ролл «Филадельфия» в кунжуте	1020 г 32 шт	\N	52.89	t
31	2928	Маки-сет	Суши-сеты	Ролл «Сяке авокадо», ролл «Унаги каппа», ролл «Кайсо», ролл «Текка каппа», ролл «Кансай»	865 г 40 шт	\N	44.76	t
31	2929	Суши-сет «Классик»	Суши-сеты	Ролл «Сяке маки», ролл «Унаги маки», ролл «Текка маки», ролл «Эби маки», ролл «Хотате маки», ролл «Хеби маки»	720 г 48 шт	\N	41.51	t
31	2930	Суши-сет «Филадельфия сан»	Суши-сеты	Ролл «Филадельфия» с огурцом, ролл «Филадельфия классическая», ролл «Филадельфия» с авокадо	850 г	\N	50.3	t
31	2931	Суши «Сяке кунсей»	Суши	Рис, лосось копчёный	35 г	\N	2.9	t
31	2932	Суши «Сяке ацуи»	Суши	Рис, лосось опалённый, майонез, лук зелёный	75 г	\N	4.8	t
31	2933	Суши «Тай ацуи»	Суши	Рис, окунь опалённый, соус кисло‑сладкий	38 г	\N	2.6	t
31	2934	Суши «Магуро ацуи»	Суши	Рис, тунец опалённый, соус «Спайис», лук зелёный	38 г	\N	2.9	t
31	2935	Суши «Тай»	Суши	Рис, морской окунь	35 г	\N	1.6	t
31	2936	Суши «Магуро»	Суши	Рис, тунец	35 г	\N	2.9	t
31	2937	Суши «Унаги» 	Суши	Рис, нори, угорь, соус «Унаги», кунжут	35 г	\N	5.3	t
31	2938	Суши «Сяке»	Суши	Рис, лосось	35 г	\N	2.5	t
31	2939	Суши «Эби»	Суши	Рис, креветка тигровая	35 г	\N	3.6	t
31	2940	Гункан «Хияши»	Гунканы	Рис, нори, чукка-салат, соус кунжутный, кунжут	38 г	\N	1.8	t
31	2941	Гункан «Унаги» 	Гунканы	Рис, нори, угорь, соус «Унаги», кунжут	43 г	\N	5.9	t
31	2942	Гункан «Эби»	Гунканы	Рис, нори, креветка, соус «Спайси»	40 г	\N	4.2	t
31	2943	Гункан «Сяке»	Гунканы	Рис, нори, лосось, соус «Спайси»	40 г	\N	3.2	t
31	2944	Гункан «Магуро»	Гунканы	Рис, нори, тунец, соус «Спайси»	40 г	\N	3.7	t
31	2945	Креветки в темпуре	Закуски	Креветка тигровая, темпура, сладкий соус «Чили»	170 г	\N	14.8	t
31	2946	Запечённые мидии	Закуски	Мидии в раковинах, сырный соус	5 шт	\N	14.5	t
31	2947	Запечённые мидии острые	Закуски		5 шт	\N	14.9	t
31	2948	Поке с лососем татаки 	Закуски	Рис, лосось татаки, огурец, авокадо, хлопья нори, миндаль, апельсин, вакаме, соус «Азия», ореховый соус	305 г	\N	14.9	t
31	2949	Поке с тунцом татаки 	Закуски	Рис, тунец татаки, лаймовые огурцы, маринованный вакаме, рваные нори, кукуруза в початках, соус «Азия», соус томатный, помидоры черри, кунжут «Кимчи»	310 г	\N	14.4	t
31	2950	Поке с угорём и маринованным перцем рамиро 	Закуски	Рис, овощи, угорь, водоросли комбу, соус «Унаги», соус соевый, ананас, авокадо, кунжут	325 г	\N	18.5	t
31	2951	Поке с лососем и апельсиновым дресингом 	Закуски	Рис, авокадо, помидоры черри, конкассе, кинза, картофель пай, нори, лосось, салат чукка	300 г	\N	12.5	t
31	2952	Тайский Фо	Супы	Бульон Фо, лапша рисовая, тай телятина, зелень, имбирь, перец, лайм, ростки сои, имбирь	630 г	\N	9.9	t
31	2953	Суп «Фо бо» с телятиной	Супы	Бульон Фо, рисовая лапша, телятина, имбирь, лайм, зелень, ростки сои	630 г	\N	9.9	t
31	2954	Суп «Том‑ям» 	Супы	Бульон курино-креветочный, мидии, креветки, кальмар, галангал, лемонграс, кафир лайма, молоко кокосовое, рис, шампиньоны	520 г	\N	14.9	t
31	2955	Хибачи с уткой	Хибачи		350 г	\N	13.9	t
31	2956	Рис хибачи с курицей карри	Хибачи			\N	9.8	t
31	2957	Хибачи с овощами	Хибачи			\N	6.2	t
31	2958	Хибачи со свининой в устричном соусе	Хибачи		365 г	\N	10.8	t
31	2959	Хибачи с цыпленком терияки 	Хибачи		375 г	\N	8.9	t
31	2960	Соус соевый	Топинг		50 г	\N	1	t
31	2961	Васаби 	Топинг		20 г	\N	1.4	t
31	2962	Имбирь маринованный	Топинг		40 г	\N	1.6	t
31	2963	Соус кунжутный	Топинг		30 г	\N	2.3	t
31	2964	Соус «Чили» сладкий	Топинг		30 г	\N	2.6	t
31	2968	Напиток газированный Fanta «Апельсин»	Напитки		500 мл	\N	2.5	t
31	2969	Напиток газированный Coca‑Cola	Напитки		500 мл	\N	2.5	t
31	2970	Напиток газированный Sprite	Напитки		500 мл	\N	2.5	t
31	2971	Лапша на выбор + овощи микс + курица без соуса	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная	340 г	\N	7.4	t
31	2972	Лапша на выбор + овощи микс + курица + соус на выбор	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная, соус на выбор: «Пад Тай», соус «Терияки», соус «Устричный», соус соевый	340 г	\N	8.7	t
31	2973	Лапша на выбор + овощи микс + говядина без соуса	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная	340 г	\N	9.4	t
31	2974	Лапша на выбор + овощи микс + говядина + соус на выбор	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная, соус на выбор: «Пад Тай», соус «Терияки», соус «Устричный», соус соевый	340 г	\N	10.7	t
31	2975	Лапша на выбор + овощи микс + креветки без соуса	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная	335 г	\N	13.4	t
31	2976	Лапша на выбор + овощи микс + креветки + соус на выбор	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная, соус на выбор: «Пад Тай», соус «Терияки», соус «Устричный», соус соевый	335 г	\N	14.7	t
31	2977	Лапша без топпинга и без соуса	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная	280 г	\N	5.9	t
31	2978	Лапша без топпинга с соусом	WOK	Лапша на выбор: рисовая, лапша «Удон», гречневая, яичная, соус на выбор: «Пад Тай», соус «Терияки», соус «Устричный», соус соевый	280 г	\N	7.2	t
31	2979	Шампиньоны	Дополнительно к WOK		20 г	\N	0.81	f
31	2980	Грибы «Шитаки»	Дополнительно к WOK		20 г	\N	1.5	f
31	2981	Сыр «Пармезан»	Дополнительно к WOK		20 г	\N	1.2	f
31	2982	Соус перечный	Дополнительно к WOK		20 г	\N	0.81	f
31	2983	Помидоры черри	Дополнительно к WOK		20 г	\N	0.72	f
31	2984	Соевые ростки	Дополнительно к WOK		10 г	\N	0.33	f
32	2985	Микс «Свиной»	Шашлычные миксы	Шашлык из свиной шеи, шашлык из ребра, люля-кебаб, перец, шампиньоны, кабачок на углях, лаваш, лук маринованный	990 г	\N	35	t
32	2986	Микс «Куриный»	Шашлычные миксы	Шашлык из куриного бедра, шашлык из куриного крыла, шашлык из крыла в пряно-остром маринаде, картофель фри, лаваш, лук маринованный	990 г	\N	26	t
32	2987	Микс «На большую компанию»	Шашлычные миксы	Шашлык из куриного бедра, шашлык из куриного крыла, шашлык из свиной шеи, шашлык из ребра, люля-кебаб, картофельные дольки, лаваш, лук маринованный, соус шашлычный, соус «Чесночный»	1490 г	\N	35	t
32	2988	Микс «Пивной»	Шашлычные миксы	Наггетсы куриные, фри, дольки, кольца луковые, соленные палочки, фирменные чипсы, соус острый	1000 г	\N	22	t
32	2989	Микс «Горец»	Шашлычные миксы	Шашлык свиной, лаваш, лук с зеленью	915 г	\N	31.6	t
32	2990	Микс «Рустер»	Шашлычные миксы	Шашлык куриный {крылья и бедра}, лаваш, лук с зеленью	1130 г	\N	32.85	t
32	2991	Микс «Сытный»	Шашлычные миксы	Шашлык свиной, кебаб курица, свинина, лаваш, лук с зеленью	1330 г	\N	49.8	t
32	2992	Микс «Богатырь»	Шашлычные миксы	Шашлык свиной, шашлык куриный, лаваш, лук с зеленью	965 г	\N	30.1	t
32	2993	Микс «На троих»	Шашлычные миксы	Шашлык свиной, кебаб курица, свинина, лаваш, лук с зеленью	1330 г	\N	51.4	t
32	2994	Микс «Друзья»	Шашлычные миксы	Шашлык свиной, шашлык куриный, лаваш, лук с зеленью	730 г	\N	24.3	t
32	2995	Микс «Семья»	Шашлычные миксы	Шашлык куриный, шашлык свиной, кебаб курица, свинина, лаваш, лук с зеленью	730 г	\N	25.7	t
32	2996	Шашлык свиной	Шашлык		200 г	\N	8	t
32	2997	Шашлык из куриных крылышек	Шашлык		200 г	\N	6	t
32	2998	Шашлык из куриных бёдрышек	Шашлык		200 г	\N	7	t
32	2999	Рёбрышки-гриль на мангале	Шашлык		200 г	\N	9	t
32	3000	Гамбургер	Бургеры	Булочка, соус, котлета говяжья, помидор, салат свежий, лук		\N	6.7	t
32	3001	Чизбургер	Бургеры	Булочка, соус, сыр «Чеддер», котлета говяжья, помидор, салат, лук		\N	6.9	t
32	3002	Чикенбургер	Бургеры	Булочка, соус, куриная котлета, помидор, салат		\N	6.2	t
32	3003	Пицца «Мясная»	Пицца	Соус томатный, сыр «Моцарелла», бекон, салями, птица жареная, карамелизованный лук	390 г	\N	9.5	t
32	3004	Пицца «От шефа»	Пицца	Соус томатный, сыр «Моцарелла», бекон, салями, шампиньоны, карамелизованный лук, острое масло	440 г	\N	14	t
32	3005	Пицца «Пулиано»	Пицца	Соус томатный, сыр «Моцарелла», салями, ветчина, помидоры, шампиньоны	440 г	\N	9.5	t
32	3006	Пицца «Стефани»	Пицца	Соус томатный, сыр «Моцарелла», ветчина, помидоры, шампиньоны, оливки	440 г	\N	9.5	t
32	3007	Колбаски «Братвурст»	Колбаски	Свинина, специи, смесь перцев	250 г	\N	8.5	t
32	3008	Колбаски «Карривурсст» с сыром	Колбаски	Свинина, говядина, специи, сыр «Чеддер»	220 г	\N	8.5	t
32	3009	«Улитка» с сыром и чесноком	Колбаски	Фарш куриный, специи	290 г	\N	8.5	t
32	3010	Кабачок-цукини на гриле	Гарниры		150 г	\N	4.5	t
32	3011	Дольки картофельные	Гарниры		150 г	\N	3.5	t
32	3012	Картофель фри	Гарниры		150 г	\N	3.5	t
32	3013	Огурец солёный	Гарниры		150 г	\N	3.1	t
32	3014	Соус «Чесночный»	Соусы		50 г	\N	2	t
32	3015	Соус «Чимичури»	Соусы		50 г	\N	2	t
32	3016	Соус сырный	Соусы		50 г	\N	2	t
32	3017	Напиток газированный «Кока‑кола»	Напитки		330 мл	\N	2	t
32	3018	Напиток газированный «Спрайт»	Напитки		330 мл	\N	2	t
32	3019	Сок «Rich» грейпфрутовый	Напитки		1000 мл	\N	5	t
32	3020	Сок «Rich» яблочный	Напитки		1000 мл	\N	5	t
32	3021	Сок «Rich» апельсиновый	Напитки		1000 мл	\N	5	t
33	3022	Шаурма большая с курицей и огурцом	Шаурма	Филе цыплёнка, капуста, огурцы, соус чесночный, лаваш	360 г	\N	5.5	t
33	3023	Шаурма «Классическая» большая с курицей	Шаурма	Филе цыплёнка, капуста, огурцы, помидоры, огурцы маринованные, соус чесночный, лаваш	400 г	\N	6	t
33	3024	Шаурма большая с курицей и картофелем фри	Шаурма	Филе цыплёнка, картофель фри, огурцы маринованные, соус чесночный, лаваш	380 г	\N	6.2	t
33	3025	Шаурма большая с курицей, картофелем фри и сыром	Шаурма	Филе цыплёнка, картофель фри, помидоры, сыр «Моцарелла», соус чесночный, лаваш	400 г	\N	6.5	t
33	3026	Шаурма большая с курицей, перцем и помидором	Шаурма	Филе цыплёнка, капуста, помидоры, перец, соус чесночный, лаваш	380 г	\N	6.6	t
33	3027	Шаурма большая с курицей, сыром и грибами	Шаурма	Филе цыплёнка, капуста, помидоры, грибы маринованные, сыр «Моцарелла», соус чесночный, лаваш	390 г	\N	6.2	t
33	3028	Шаурма большая с курицей, сыром и перцем	Шаурма	Филе цыплёнка, помидоры, перец, сыр «Моцарелла», соус чесночный, лаваш	350 г	\N	6.2	t
33	3029	Шаурма с курицей и морковью «По‑корейски»	Шаурма	Филе цыплёнка, капуста, морковь «По-корейски», соус чесночный, лаваш	380 г	\N	6	t
33	3030	Шаурма «Классическая» маленькая с курицей	Шаурма	Филе цыплёнка, капуста, огурцы, помидоры, огурцы маринованные, соус чесночный, лаваш	290 г	\N	4	t
33	3031	Шаурма маленькая с курицей, перцем и помидорами	Шаурма	Филе цыплёнка, капуста, помидоры, перец, соус чесночный, лаваш	290 г	\N	4.1	t
33	3032	Шаурма с курицей и морковью «По-корейски» маленька	Шаурма	Филе цыплёнка, капуста, морковь «По-корейски», соус чесночный, лаваш	290 г	\N	4	t
33	3033	Шаурма с халапеньо	Шаурма	Филе цыплёнка, капуста, фри, помидоры, халапеньо, соус, лаваш	400 г	\N	6.5	t
33	3034	Шаурма с имбирем	Шаурма	Филе цыплёнка, капуста, огурец св., огурец мар., имбирь, соус, лаваш	405 г	\N	6.2	t
33	3035	Шаурма с халапеньо XXL	Шаурма	Филе цыплёнка, капуста, картофель фри, помидоры, халапеньо, лаваш	560 г	\N	8.3	t
33	3036	Шаурма с сыром и грибами XXL	Шаурма	Филе цыплёнка, капуста, помидоры, грибы маринованные, сыр «Моцарелла», соус, лаваш	560 г	\N	8.9	t
33	3037	Шаурма с картофелем фри и сыром XXL	Шаурма	Филе цыплёнка, картофель фри, помидоры, сыр «Моцарелла», соус, лаваш	560 г	\N	8.9	t
33	3038	Шаурма «Классическая» XXL	Шаурма	Филе цыплёнка, капуста, огурцы, помидоры, огурцы маринованные, соус, лаваш	560 г	\N	8.5	t
33	3039	Бургер «Чикен‑гриль»	Бургеры-гриль	Булочка, филе куриное, помидоры, огурцы маринованные, салат, горчица, кетчуп		\N	5	t
33	3040	Бургер «Чикенчиз-гриль»	Бургеры-гриль	Булочка, филе куриное, помидоры, огурцы маринованные, салат, сыр «Бистро», горчица, кетчуп		\N	5.4	t
33	3041	Хот-дог «Классический»	Хот-доги	Булка, сосиска свиная, капуста/салат, горчица, кетчуп, майонез	170 г	\N	3.2	t
33	3042	Хот-дог «Датский»	Хот-доги	Булка, сосиска «Краковская», майонез, кетчуп, горчица, огурец консервированный, лук фри	174 г	\N	3.3	t
33	3043	Хот-дог «Доджер»	Хот-доги	Багет, сосиска «Краковская», соус чесночный, горчица «Французская»	160 г	\N	3	t
33	3044	Хот-дог «Французский»	Хот-доги	Багет, сосиска «Краковская», кетчуп, горчица	150 г	\N	3.1	t
33	3045	Хот-дог с морковью «По‑корейски»	Хот-доги	Булка, сосиска свиная, морковь «По-корейски», майонез, кетчуп, лук‑шалот	180 г	\N	3	t
33	3046	Хот-дог «Острый» с халапеньо	Хот-доги	Булка, сосиска свиная, халапеньо, помидоры, майонез, кетчуп	170 г	\N	3.5	t
33	3047	Блинчик со сгущёнкой	Блинчики		135 г	\N	1.8	t
33	3048	Блинчик с сыром и ветчиной	Блинчики		170 г	\N	2.5	t
33	3049	Блинчик с ветчиной, сыром и грибами консервированными	Блинчики		185 г	\N	2.8	t
33	3050	Блинчик с сыром, ветчиной и майонезом	Блинчики		185 г	\N	2.8	t
33	3051	Блинчик с ветчиной, сыром, маринованными огурцами и майонезом	Блинчики			\N	3.4	t
33	3052	Блинчик с филе цыплёнка, майонезом и сыром	Блинчики		185 г	\N	3.2	t
33	3053	Блинчик с филе цыплёнка, майонезом, помидорами и сыром	Блинчики		205 г	\N	3.5	t
33	3054	Блинчик с филе цыплёнка, майонезом, огурцами маринованными и сыром	Блинчики		205 г	\N	3.5	t
33	3055	Блинчик с крабовыми палочками, майонезом, кукурузой	Блинчики			\N	2.1	t
33	3056	Блинчик с сосисками и майонезом	Блинчики			\N	2	t
33	3057	Блинчик с колбасой из мяса птицы варёно-копчёной, майонезом	Блинчики			\N	2	t
33	3058	Картофель фри	Закуски		100 г	\N	2.6	t
33	3059	Наггетсы куриные 	Закуски		4 шт	\N	3	t
33	3060	Соус чесночный + посуда	Топинг		1 г	\N	0.8	t
33	3061	Соус горчичный + посуда	Топинг		1 г	\N	0.8	t
33	3062	Майонез + посуда	Топинг		1 г	\N	0.8	t
33	3063	Кетчуп + посуда	Топинг		1 г	\N	0.8	t
33	3064	Соус «Чили» + посуда	Топинг		1 г	\N	0.8	t
33	3065	Соус сырный + посуда	Топинг		1 г	\N	0.8	t
33	3066	Соус грибной + посуда	Топинг		1 г	\N	0.8	t
33	3067	Соус «Барбекю» классический + посуда	Топинг		1 г	\N	0.8	t
33	3068	Соус кисло-сладкий + посуда	Топинг		1 г	\N	0.8	t
33	3069	Соус «Фирменный с чесноком» + посуда	Топинг			\N	0.8	t
33	3070	Соус «Пикантный» + посуда	Топинг			\N	0.8	t
33	3071	Энергетический напиток Burn	Холодные напитки		250 мл	\N	3.8	t
33	3072	Газированный напиток Coca‑Cola	Холодные напитки		500 мл	\N	2.6	t
33	3073	Газированный напиток Sprite	Холодные напитки		500 мл	\N	2.6	t
33	3074	Газированный напиток Fanta «Апельсин»	Холодные напитки		500 мл	\N	2.6	t
33	3075	Вода BonAqua среднегазированная	Холодные напитки		500 мл	\N	2	t
33	3076	Вода BonAqua негазированная	Холодные напитки		500 мл	\N	2	t
33	3077	Чайный напиток FuzeTea	Холодные напитки		500 мл	\N	2.6	t
33	3078	Сок Rich	Холодные напитки		1000 мл	\N	5.4	t
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.orders (order_id, id_customer, order_list, status, price) FROM stdin;
1	1	1	f	12
2	1	1	f	12
3	1	1:2, 3:1	f	10
\.


--
-- Data for Name: orders_to_meal; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.orders_to_meal (order_id, meal_id) FROM stdin;
\.


--
-- Data for Name: shop_info; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.shop_info (id_shop, shop_name, city_id, waiting_time, shop_description, shop_logo) FROM stdin;
1	Sushi Shop	1	90	Роллы,и-роллы, суши-сеты, темпура, запечённые роллы	\N
2	PIZZAOK	1	45	Комбо, шаурма, лаваш, пицца дня, пиццы, закуски	\N
3	Pizza Smile	1	60	Пицца, роллы, суши-сеты, закуски, салаты, супы, горячие блюда	\N
4	YAKUZA SUSHI	1	65	Урамаки, маки, горячие роллы, нигири, спринг-роллы, супы, wok	\N
5	PaPi	1	50	Пицца, салаты, бургеры, десерты.	\N
6	Пицца Ралли	1	75	Пицца, салаты, напитки	\N
7	Нака Суши	1	60	Роллы, горячие роллы, запечённые роллы, нигири, гунканы, wok	\N
8	BrestBurger	1	65	Бургеры, сэндвичи, шаурма-ролл, закуски, салаты, десерты	\N
9	Пицца Суши	1	52	Мясные пиццы, вегетарианские пиццы, осетинские пироги	\N
10	Burger King	1	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
11	Progresso	1	50	Пиццы, бургеры, тортилья, хот-доги, сэндвичи, роллы, гунканы	\N
12	FusionFood	1	60	Урамаки, маки, темпура, хосомаки, нигири, суши-сеты, напитки	\N
13	Суши Прайм	1	70	Роллы, запечённые роллы,и-роллы, суши-сеты, нигири, поке	\N
14	YoYoSushi	1	50	Роллы, суши-сеты	\N
15	Ешь	1	30	Шаурма, блины	\N
16	What the kebab	1	45	Шаурма, закуски, поп-корн	\N
17	ЕмПлов	1	50	Плов, пироги, фритюр, салаты, полуфабрикаты замороженные	\N
18	Kyxnia 2.0	1	35	Горячие блюда, гарнир, закуски, салаты, супы, шаурма, пицца, хот-доги	\N
19	Доставка обедов	1	60	Обеды	\N
20	Штрудель	1	50	Десертные пироги, штрудели	\N
21	Суши Крабс	2	70	Классические роллы, темпура, запечённые роллы	\N
22	FastGood	2	75	Акция, аперитивы, закуски, шаурма, поке, урамаки, роллы, салаты	\N
23	Pizza Planet	2	50	Пиццы, комбо, закуски, салаты, десерты, напитки	\N
24	Like Pizza	2	75	Комбо, пиццы, напитки	\N
25	Ферма Шаверма	2	50	Шаурма, комбо, хот-доги, гирос, горячие блюда, напитки	\N
26	GARAGE, food&coffee	2	35	Закуски, салаты, супы, горячие блюда, постное меню, драники	\N
27	Шаурма #1	2	50	Шаурма, хот-доги, закуски, напитки	\N
28	BURGERhub	2	50	Бургеры, закуски, напитки	\N
29	Тейсти	2	50	Шаурма, хот-доги, напитки	\N
30	Вкусняша	2	50	Шаурма, хот-дог, донер, напитки	\N
31	Арабиата	2	50	Шаурма, хот-дог, фалафель, кебаб	\N
32	Шаурmen	2	50	Шаурма, хот-доги, комбо, закуски, напитки	\N
33	Brevis	2	60	Стрит-фуд, зож, холодные закуски, супы, горячие закуски	\N
34	ПАПА ЖАРИТ	2	60	Шаурма, хот-доги, картофель фри, шашлык	\N
35	Вилкой не есть	2	75	Урамаки, гунканы, маки, нигири, сеты	\N
36	Лови Ламу	2	55	Роллы, салаты, десерты	\N
37	Витебские пончики	2	65	Выпечка, пончики, хачапури, слоёные изделия	\N
38	Шашлыкhouse	2	75	Шашлык, шаурма, суп	\N
39	Суши Дом	2	60	Роллы, запечённые роллы, суши-сеты, японский гарнир, wok	\N
40	Pizza Smile	2	90	Пицца, закрытые пиццы, суши-сеты, темпура, роллы, нигири, супы	\N
41	Family pizza	3	60	Пиццы, роллы, суши-сеты, нигири	\N
42	Фаст пицца	3	50	Комбо, пиццы, шаурма (ролл), сэндвичи, закуски, напитки	\N
43	Кактус	3	75	Попкорн, бургеры, пиццы, шаурма, закуски, салаты, десерты, торты	\N
44	Yummy	3	60	Пиццы, простые роллы, сложные роллы, запечённые роллы	\N
45	GARAGE	3	35	Закуски, пицца, бургеры, постное меню, роллы, выгодные сеты	\N
46	За обе щеки	3	50	Шаурма, гарниры, напитки	\N
47	СушиМания	3	75	Пицца, пицца-сеты, суши-сеты, роллы, тёплые роллы, нигири	\N
48	Васильки	3	60	Салаты, закуски, десерты, супы, горячие блюды	\N
49	Чабарок	3	90	Салаты, паста, гарниры, горячие блюда	\N
50	Бургер Люкс	3	60	Бургеры, пицца, шаурма	\N
51	EVOKADO	3	60	Блинчики, шаурма, хот-доги, закуски	\N
52	Марвел Бургер	3	52	Бургеры, шаурма, сэндвичи, горячие закуски	\N
53	Шаурма Бургер №1 на Ильича	3	50	Шаурма, бургеры, хот-доги, салаты	\N
54	Kebab Bar	3	45	Шаурма, гарниры, закуски	\N
55	Жар Птица	3	60	Шаурма, наггетсы, картофель фри	\N
56	Сытый папа	3	50	Пиццы, бургеры, шаурма, роллы, суши-сеты, нигири, гунканы	\N
57	PizzaNizza	3	95	Пиццы, сеты, урамаки, хосомаки, гунканы, нигири, горячие роллы	\N
58	BONSAI	3	52	Акции, суши-сеты, суши, классические роллы, сложные роллы	\N
59	Маркони	3	60	Пицца, паста, салаты, горячие блюда, гарниры, хлеб, десерты	\N
60	Пиццбург	3	50	Пицца, бургеры, детские наборы, шаурма, роллы, супы, салаты	\N
61	BEERлога	4	45	Пиццы, бургеры, холодные закуски, салаты, супы, гарниры	\N
62	Биг Джонс (Big Jones)	4	67	Пицца, бургеры, твистер-роллы, сладкие блины, закуски	\N
63	Шаурма Ш&Б Бургер	4	50	Шаурма, бургеры, салаты, закуски	\N
64	MC Doner	4	50	Дурум, донер, лахмаджун, бургер, комбо, фри, десерты	\N
65	DreamFish	4	50	Акции, роллы, сложные роллы, горячие роллы, суши-сеты, мидии	\N
66	Yellow Street 17	4	67	Бургеры, хот-доги, фан-меню, тортилья, обеденное меню	\N
67	Большой буфет	4	67	Акция, бургеры, роллы, жареные роллы, запечённые роллы, wok	\N
68	Карафуто	4	80	Крафт-бургеры, спринг-роллы, роллы, японский гарнир, супы	\N
69	GARAGE	4	35	Пиццы, бургеры, японский гарнир, выгодные сеты, сэндвичи	\N
70	Pizza&Coffee	4	60	Пиццы, пицца-пирог, роллы, закуски, лабаспельменас, фри меню	\N
71	Pizza Smile	4	90	Закрытые пиццы, бургеры, роллы, суши-сеты, темпура, закуски	\N
72	KOIfish	4	75	Маленькие роллы, большие роллы, гунканы, нигири, салаты	\N
73	Burger King	4	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
74	Ниндзя Кебаб	4	75	Шаурма, питы, бургеры, закуски, десерты, напитки	\N
75	ПаркКинг	4	52	Акция, пиццы, шаурма, бургеры, завтраки, наггетсы, хэппи микс	\N
76	FoxPizza	4	50	Пиццы, бортики, пиццы-пироги, роллы, японский гарнир, комбо	\N
77	MakaRonin	4	50	Паста, напитки	\N
78	Суши Wok	4	52	Роллы, суши-сеты, запечённые роллы, сладкие роллы, гарниры	\N
79	Хани Кабани	4	67	Закуски, салаты, супы, бургеры, гриль, говядина, гарниры, десерты, гриль	\N
80	СушиМания	4	75	Суши-сеты, роллы, запечённые роллы, гунканы	\N
81	Суши вёсла take away	5	75	Нигири, гунканы, маки, ура маки, футо маки, суширрито, сеты	\N
82	TOKYO SUSHI	5	75	Праздничное предложение, роллы,и-роллы, суши-сеты	\N
83	Sushi Chef Arts	5	70	Роллы, суши-сеты, пиццы, пицца-сеты, сашими, нигири, гунканы	\N
84	BBJ Burger Bar	5	60	Бургеры, сеты, салаты, закуски, молочные коктейли, десерты	\N
85	ZonaBurger	5	60	Бургер-сеты, бургеры, бургеры inbox, гарниры, десерты	\N
86	GARAGE	5	50	Закуски, пицца, бургеры, постное меню, роллы, выгодные сеты, супы, салаты	\N
87	Ammy Yummy	5	60	Шашлык, гриль	\N
88	Sushi House	5	75	Суши-сеты, роллы, горячие роллы, хосомаки, татаки маки, супы	\N
89	Сказочный замок	5	90	Пицца, шаурма, напитки	\N
90	Terra Pizza	5	60	Пиццы, бургеры, роллы, суши-сеты, нигири, японский гарнир	\N
91	Накормим.бай	5	70	Пицца, бургеры, бурито, закуски, салаты, супы, горячие блюда	\N
92	UrbanFood	5	90	Роллы, пицца, суши-сеты, японский гарнир, гунканы, напитки	\N
93	Burger King	5	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
94	Планета суши	5	70	Роллы, суши-сеты, тёплые роллы, нигири, соусы, горячие блюда	\N
95	Дом папочки. Пироги	5	52	Пицца, осетинские пироги, салаты, супы, горячие блюда, паста	\N
96	Домашние обеды	5	180	Понедельник, вторник, среда, четверг, пятница, хлеб, упаковка	\N
97	Мир пиццы	5	75	Пиццы, салаты, напитки, соусы, горячие блюда, роллы, бургеры	\N
98	Wok.by	5	70	WOK, закуски, супы, горячие блюда, лапша, поке-боулы, плов	\N
99	Печорин	5	75	Сеты пирожков, фуршетные пирожки, пирожки сытные	\N
100	Pizza.by	5	75	Пицца, салаты, бургеры, супы, буррито, горячие блюда, гарниры	\N
101	Уноси-ка суши	6	60	Роллы, гриль, суши-сеты, суши, японский гарнир, приборы, wok	\N
102	Суши фуджи	6	50	Суши-сеты, роллы, темпура, вкусные роллы, спайси-суши, суши	\N
103	Инари	6	50	Роллы, запечённые роллы, горячие роллы, суши-сеты, суши, wok	\N
104	Мясоруб	6	50	Шашлыки, бургеры, пиццы, колбаски	\N
105	Проспект	6	65	Пиццы американские, пиццы итальянские, шаурма, хот-доги	\N
106	Vилки & Lожки	6	60	Пиццы, wok, роллы, суши-сеты, горячие блюда, салаты, закуски	\N
107	STAR FOOD	6	50	Пицца, бургеры, роллы, наггетсы	\N
108	Пицца Темпо	6	60	Пицца, супы, салаты, закуски, десерты	\N
109	ПАПА ПИЦЦА	6	50	Закуски, шаурма, паста, напитки	\N
110	MC Doner	6	45	Дурум, донер, лахмаджун, бургер, комбо, фри, десерты	\N
111	УплетайКА	6	50	Шаурма, хот-доги, бургеры, салаты	\N
112	Терруар	6	80	Роллы, суши-сеты, сэндвичи, круассаны	\N
113	Пан Бульбан	6	50	Блинчики, драники, сэндвичи, сырники	\N
114	Бифштекс	6	60	Шаурма, бургеры, пицца, выпечка	\N
115	Beer House	6	50	Блюда на углях	\N
116	Шпаркi лось	6	45	Піца, бургеры, завяртоны, гарачыя стравы, дранікі, салаткi	\N
117	Нямстердам	6	45	Шаурма	\N
118	Суши Шеф	6	60	Суши, суши-сеты, горячие закуски	\N
119	101	6	70	Горячие блюда, закуски, супы, вегетарианские блюда	\N
120	Акула Суши	6	67	Суши-сеты, роллы, запеченные роллы	\N
121	Sushi Shop	1	90	Роллы, мини-роллы, суши-сеты, темпура, запечённые роллы	\N
122	PIZZAOK	1	45	Комбо, шаурма, лаваш, пицца дня, пиццы, закуски	\N
123	Pizza Smile	1	60	Пицца, роллы, суши-сеты, закуски, салаты, супы, горячие блюда	\N
124	YAKUZA SUSHI	1	65	Урамаки, маки, горячие роллы, нигири, спринг-роллы, супы, wok	\N
125	PaPi	1	50	Пицца, салаты, бургеры, десерты.	\N
126	Пицца Ралли	1	75	Пицца, салаты, напитки	\N
127	Нака Суши	1	60	Роллы, горячие роллы, запечённые роллы, нигири, гунканы, wok	\N
128	BrestBurger	1	65	Бургеры, сэндвичи, шаурма-ролл, закуски, салаты, десерты	\N
129	Пицца Суши	1	52	Мясные пиццы, вегетарианские пиццы, осетинские пироги	\N
130	Burger King	1	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
131	Progresso	1	50	Пиццы, бургеры, тортилья, хот-доги, сэндвичи, роллы, гунканы	\N
132	FusionFood	1	60	Урамаки, маки, темпура, хосомаки, нигири, суши-сеты, напитки	\N
133	Суши Прайм	1	70	Роллы, запечённые роллы, мини-роллы, суши-сеты, нигири, поке	\N
134	YoYoSushi	1	50	Роллы, суши-сеты	\N
135	Ешь	1	30	Шаурма, блины	\N
136	What the kebab	1	45	Шаурма, закуски, поп-корн	\N
137	ЕмПлов	1	50	Плов, пироги, фритюр, салаты, полуфабрикаты замороженные	\N
138	Kyxnia 2.0	1	35	Горячие блюда, гарнир, закуски, салаты, супы, шаурма, пицца, хот-доги	\N
139	Доставка обедов	1	60	Обеды	\N
140	Штрудель	1	50	Десертные пироги, штрудели	\N
141	Суши Крабс	2	70	Классические роллы, темпура, запечённые роллы	\N
142	FastGood	2	75	Акция, аперитивы, закуски, шаурма, поке, урамаки, роллы, салаты	\N
143	Pizza Planet	2	50	Пиццы, комбо, закуски, салаты, десерты, напитки	\N
144	Like Pizza	2	75	Комбо, пиццы, напитки	\N
145	Ферма Шаверма	2	50	Шаурма, комбо, хот-доги, гирос, горячие блюда, напитки	\N
146	GARAGE, food&coffee	2	35	Закуски, салаты, супы, горячие блюда, постное меню, драники	\N
147	Шаурма #1	2	50	Шаурма, хот-доги, закуски, напитки	\N
148	BURGERhub	2	50	Бургеры, закуски, напитки	\N
149	Тейсти	2	50	Шаурма, хот-доги, напитки	\N
150	Вкусняша	2	50	Шаурма, хот-дог, донер, напитки	\N
151	Арабиата	2	50	Шаурма, хот-дог, фалафель, кебаб	\N
152	Шаурmen	2	50	Шаурма, хот-доги, комбо, закуски, напитки	\N
153	Brevis	2	60	Стрит-фуд, зож, холодные закуски, супы, горячие закуски	\N
154	ПАПА ЖАРИТ	2	60	Шаурма, хот-доги, картофель фри, шашлык	\N
155	Вилкой не есть	2	75	Урамаки, гунканы, маки, нигири, сеты	\N
156	Лови Ламу	2	55	Роллы, салаты, десерты	\N
157	Витебские пончики	2	65	Выпечка, пончики, хачапури, слоёные изделия	\N
158	Шашлыкhouse	2	75	Шашлык, шаурма, суп	\N
159	Суши Дом	2	60	Роллы, запечённые роллы, суши-сеты, японский гарнир, wok	\N
160	Pizza Smile	2	90	Пицца, закрытые пиццы, суши-сеты, темпура, роллы, нигири, супы	\N
161	Family pizza	3	60	Пиццы, роллы, суши-сеты, нигири	\N
162	Фаст пицца	3	50	Комбо, пиццы, шаурма (ролл), сэндвичи, закуски, напитки	\N
163	Кактус	3	75	Попкорн, бургеры, пиццы, шаурма, закуски, салаты, десерты, торты	\N
164	Yummy	3	60	Пиццы, простые роллы, сложные роллы, запечённые роллы	\N
165	GARAGE	3	35	Закуски, пицца, бургеры, постное меню, роллы, выгодные сеты	\N
166	За обе щеки	3	50	Шаурма, гарниры, напитки	\N
167	СушиМания	3	75	Пицца, пицца-сеты, суши-сеты, роллы, тёплые роллы, нигири	\N
168	Васильки	3	60	Салаты, закуски, десерты, супы, горячие блюды	\N
169	Чабарок	3	90	Салаты, паста, гарниры, горячие блюда	\N
170	Бургер Люкс	3	60	Бургеры, пицца, шаурма	\N
171	EVOKADO	3	60	Блинчики, шаурма, хот-доги, закуски	\N
172	Марвел Бургер	3	52	Бургеры, шаурма, сэндвичи, горячие закуски	\N
173	Шаурма Бургер №1 на Ильича	3	50	Шаурма, бургеры, хот-доги, салаты	\N
174	Kebab Bar	3	45	Шаурма, гарниры, закуски	\N
175	Жар Птица	3	60	Шаурма, наггетсы, картофель фри	\N
176	Сытый папа	3	50	Пиццы, бургеры, шаурма, роллы, суши-сеты, нигири, гунканы	\N
177	PizzaNizza	3	95	Пиццы, сеты, урамаки, хосомаки, гунканы, нигири, горячие роллы	\N
178	BONSAI	3	52	Акции, суши-сеты, суши, классические роллы, сложные роллы	\N
179	Маркони	3	60	Пицца, паста, салаты, горячие блюда, гарниры, хлеб, десерты	\N
180	Пиццбург	3	50	Пицца, бургеры, детские наборы, шаурма, роллы, супы, салаты	\N
181	BEERлога	4	45	Пиццы, бургеры, холодные закуски, салаты, супы, гарниры	\N
182	Биг Джонс (Big Jones)	4	67	Пицца, бургеры, твистер-роллы, сладкие блины, закуски	\N
183	Шаурма Ш&Б Бургер	4	50	Шаурма, бургеры, салаты, закуски	\N
184	MC Doner	4	50	Дурум, донер, лахмаджун, бургер, комбо, фри, десерты	\N
185	DreamFish	4	50	Акции, роллы, сложные роллы, горячие роллы, суши-сеты, мидии	\N
186	Yellow Street 17	4	67	Бургеры, хот-доги, фан-меню, тортилья, обеденное меню	\N
187	Большой буфет	4	67	Акция, бургеры, роллы, жареные роллы, запечённые роллы, wok	\N
188	Карафуто	4	80	Крафт-бургеры, спринг-роллы, роллы, японский гарнир, супы	\N
189	GARAGE	4	35	Пиццы, бургеры, японский гарнир, выгодные сеты, сэндвичи	\N
190	Pizza&Coffee	4	60	Пиццы, пицца-пирог, роллы, закуски, лабаспельменас, фри меню	\N
191	Pizza Smile	4	90	Закрытые пиццы, бургеры, роллы, суши-сеты, темпура, закуски	\N
192	KOIfish	4	75	Маленькие роллы, большие роллы, гунканы, нигири, салаты	\N
193	Burger King	4	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
194	Ниндзя Кебаб	4	75	Шаурма, питы, бургеры, закуски, десерты, напитки	\N
195	ПаркКинг	4	52	Акция, пиццы, шаурма, бургеры, завтраки, наггетсы, хэппи микс	\N
196	FoxPizza	4	50	Пиццы, бортики, пиццы-пироги, роллы, японский гарнир, комбо	\N
197	MakaRonin	4	50	Паста, напитки	\N
198	Суши Wok	4	52	Роллы, суши-сеты, запечённые роллы, сладкие роллы, гарниры	\N
199	Хани Кабани	4	67	Закуски, салаты, супы, бургеры, гриль, говядина, гарниры, десерты, гриль	\N
200	СушиМания	4	75	Суши-сеты, роллы, запечённые роллы, гунканы	\N
201	Суши вёсла take away	5	75	Нигири, гунканы, маки, ура маки, футо маки, суширрито, сеты	\N
202	TOKYO SUSHI	5	75	Праздничное предложение, роллы, мини-роллы, суши-сеты	\N
203	Sushi Chef Arts	5	70	Роллы, суши-сеты, пиццы, пицца-сеты, сашими, нигири, гунканы	\N
204	BBJ Burger Bar	5	60	Бургеры, сеты, салаты, закуски, молочные коктейли, десерты	\N
205	ZonaBurger	5	60	Бургер-сеты, бургеры, бургеры inbox, гарниры, десерты	\N
206	GARAGE	5	50	Закуски, пицца, бургеры, постное меню, роллы, выгодные сеты, супы, салаты	\N
207	Ammy Yummy	5	60	Шашлык, гриль	\N
208	Sushi House	5	75	Суши-сеты, роллы, горячие роллы, хосомаки, татаки маки, супы	\N
209	Сказочный замок	5	90	Пицца, шаурма, напитки	\N
210	Terra Pizza	5	60	Пиццы, бургеры, роллы, суши-сеты, нигири, японский гарнир	\N
211	Накормим.бай	5	70	Пицца, бургеры, бурито, закуски, салаты, супы, горячие блюда	\N
212	UrbanFood	5	90	Роллы, пицца, суши-сеты, японский гарнир, гунканы, напитки	\N
213	Burger King	5	60	Бургеры, роллы, наггетсы, крылышки, закуски, комбо	\N
214	Планета суши	5	70	Роллы, суши-сеты, тёплые роллы, нигири, соусы, горячие блюда	\N
215	Дом папочки. Пироги	5	52	Пицца, осетинские пироги, салаты, супы, горячие блюда, паста	\N
216	Домашние обеды	5	180	Понедельник, вторник, среда, четверг, пятница, хлеб, упаковка	\N
217	Мир пиццы	5	75	Пиццы, салаты, напитки, соусы, горячие блюда, роллы, бургеры	\N
218	Wok.by	5	70	WOK, закуски, супы, горячие блюда, лапша, поке-боулы, плов	\N
219	Печорин	5	75	Сеты пирожков, фуршетные пирожки, пирожки сытные	\N
220	Pizza.by	5	75	Пицца, салаты, бургеры, супы, буррито, горячие блюда, гарниры	\N
221	Уноси-ка суши	6	60	Роллы, гриль, суши-сеты, суши, японский гарнир, приборы, wok	\N
222	Суши фуджи	6	50	Суши-сеты, роллы, темпура, вкусные роллы, спайси-суши, суши	\N
223	Инари	6	50	Роллы, запечённые роллы, горячие роллы, суши-сеты, суши, wok	\N
224	Мясоруб	6	50	Шашлыки, бургеры, пиццы, колбаски	\N
225	Проспект	6	65	Пиццы американские, пиццы итальянские, шаурма, хот-доги	\N
226	Vилки & Lожки	6	60	Пиццы, wok, роллы, суши-сеты, горячие блюда, салаты, закуски	\N
227	STAR FOOD	6	50	Пицца, бургеры, роллы, наггетсы	\N
228	Пицца Темпо	6	60	Пицца, супы, салаты, закуски, десерты	\N
229	ПАПА ПИЦЦА	6	50	Закуски, шаурма, паста, напитки	\N
230	MC Doner	6	45	Дурум, донер, лахмаджун, бургер, комбо, фри, десерты	\N
231	УплетайКА	6	50	Шаурма, хот-доги, бургеры, салаты	\N
232	Терруар	6	80	Роллы, суши-сеты, сэндвичи, круассаны	\N
233	Пан Бульбан	6	50	Блинчики, драники, сэндвичи, сырники	\N
234	Бифштекс	6	60	Шаурма, бургеры, пицца, выпечка	\N
235	Beer House	6	50	Блюда на углях	\N
236	Шпаркi лось	6	45	Піца, бургеры, завяртоны, гарачыя стравы, дранікі, салаткi	\N
237	Нямстердам	6	45	Шаурма	\N
238	Суши Шеф	6	60	Суши, суши-сеты, горячие закуски	\N
239	101	6	70	Горячие блюда, закуски, супы, вегетарианские блюда	\N
240	Акула Суши	6	67	Суши-сеты, роллы, запеченные роллы	\N
\.


--
-- Data for Name: shop_to_menu; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.shop_to_menu (id_shop, id_menu) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
21	7
22	8
23	9
24	10
25	11
26	12
27	13
41	14
42	15
43	16
44	17
45	18
61	19
62	20
63	21
64	22
65	23
81	24
82	25
83	26
84	27
85	28
101	29
102	30
103	31
104	32
105	33
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: test; Owner: postgres
--

COPY test.test (my_id, my_name) FROM stdin;
\.


--
-- Name: cities_info_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_info_city_id_seq', 7, true);


--
-- Name: city_info_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_info_city_id_seq', 6, true);


--
-- Name: calendar_id_calendar_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.calendar_id_calendar_seq', 1, false);


--
-- Name: city_info_city_id_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.city_info_city_id_seq', 6, true);


--
-- Name: customers_id_customer_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.customers_id_customer_seq', 24, true);


--
-- Name: feedbacks_id_feedback_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.feedbacks_id_feedback_seq', 7, true);


--
-- Name: menu_id_meal_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.menu_id_meal_seq', 3078, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.orders_order_id_seq', 3, true);


--
-- Name: shop_info_id_shop_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.shop_info_id_shop_seq', 240, true);


--
-- Name: test_my_id_seq; Type: SEQUENCE SET; Schema: test; Owner: postgres
--

SELECT pg_catalog.setval('test.test_my_id_seq', 3, true);


--
-- Name: cities_info cities_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities_info
    ADD CONSTRAINT cities_info_pkey PRIMARY KEY (city_id);


--
-- Name: city_info city_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_info
    ADD CONSTRAINT city_info_pkey PRIMARY KEY (city_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id_feedback);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);


--
-- Name: shop_info shop_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_info
    ADD CONSTRAINT shop_info_pkey PRIMARY KEY (id_shop);


--
-- Name: shops_to_menu shops_to_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops_to_menu
    ADD CONSTRAINT shops_to_menu_pkey PRIMARY KEY (id_shop);


--
-- Name: city_info city_info_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.city_info
    ADD CONSTRAINT city_info_pkey PRIMARY KEY (city_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);


--
-- Name: customers customers_user_phone_key; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.customers
    ADD CONSTRAINT customers_user_phone_key UNIQUE (user_phone);


--
-- Name: customers customers_username_key; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.customers
    ADD CONSTRAINT customers_username_key UNIQUE (username);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id_feedback);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: shop_info shop_info_pkey; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.shop_info
    ADD CONSTRAINT shop_info_pkey PRIMARY KEY (id_shop);


--
-- Name: test test_my_name_key; Type: CONSTRAINT; Schema: test; Owner: postgres
--

ALTER TABLE ONLY test.test
    ADD CONSTRAINT test_my_name_key UNIQUE (my_name);


--
-- PostgreSQL database dump complete
--

