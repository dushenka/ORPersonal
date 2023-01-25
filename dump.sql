--
-- PostgreSQL database dump
--

-- Dumped from database version 11.18 (Debian 11.18-0+deb10u1)
-- Dumped by pg_dump version 11.18 (Debian 11.18-0+deb10u1)

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
-- Name: openrepo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE openrepo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';


ALTER DATABASE openrepo OWNER TO postgres;

\connect openrepo

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: repo_build; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_build (
    id bigint NOT NULL,
    build_number bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    completion_status character varying(128) NOT NULL,
    repo_id bigint NOT NULL
);


ALTER TABLE public.repo_build OWNER TO postgres;

--
-- Name: repo_build_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_build_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_build_id_seq OWNER TO postgres;

--
-- Name: repo_build_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_build_id_seq OWNED BY public.repo_build.id;


--
-- Name: repo_buildlogline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_buildlogline (
    id bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    command text NOT NULL,
    message text NOT NULL,
    loglevel character varying(128) NOT NULL,
    line_number integer NOT NULL,
    execution_time_sec double precision,
    exec_complete boolean NOT NULL,
    build_id bigint NOT NULL
);


ALTER TABLE public.repo_buildlogline OWNER TO postgres;

--
-- Name: repo_buildlogline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_buildlogline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_buildlogline_id_seq OWNER TO postgres;

--
-- Name: repo_buildlogline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_buildlogline_id_seq OWNED BY public.repo_buildlogline.id;


--
-- Name: repo_mirror; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_mirror (
    id bigint NOT NULL,
    repo_id bigint NOT NULL
);


ALTER TABLE public.repo_mirror OWNER TO postgres;

--
-- Name: repo_mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_mirror_id_seq OWNER TO postgres;

--
-- Name: repo_mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_mirror_id_seq OWNED BY public.repo_mirror.id;


--
-- Name: repo_package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_package (
    id bigint NOT NULL,
    package_uid character varying(65536) NOT NULL,
    filename character varying(65536) NOT NULL,
    package_name character varying(65536) NOT NULL,
    version character varying(65536) NOT NULL,
    build_date timestamp with time zone,
    upload_date timestamp with time zone NOT NULL,
    checksum_sha512 character varying(512) NOT NULL,
    repo_id bigint NOT NULL,
    architecture character varying(256) NOT NULL
);


ALTER TABLE public.repo_package OWNER TO postgres;

--
-- Name: repo_package_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_package_id_seq OWNER TO postgres;

--
-- Name: repo_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_package_id_seq OWNED BY public.repo_package.id;


--
-- Name: repo_pgpsigningkey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_pgpsigningkey (
    id bigint NOT NULL,
    name character varying(65536) NOT NULL,
    email character varying(2048) NOT NULL,
    fingerprint character varying(65535) NOT NULL,
    private_key_pem character varying(65536) NOT NULL,
    public_key_pem character varying(65536) NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.repo_pgpsigningkey OWNER TO postgres;

--
-- Name: repo_pgpsigningkey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_pgpsigningkey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_pgpsigningkey_id_seq OWNER TO postgres;

--
-- Name: repo_pgpsigningkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_pgpsigningkey_id_seq OWNED BY public.repo_pgpsigningkey.id;


--
-- Name: repo_repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_repository (
    id bigint NOT NULL,
    repo_uid character varying(1024) NOT NULL,
    repo_type character varying(128) NOT NULL,
    keep_only_latest boolean NOT NULL,
    package_count integer NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    is_stale boolean NOT NULL,
    refresh_count bigint NOT NULL,
    promote_to_id bigint,
    signing_key_id bigint
);


ALTER TABLE public.repo_repository OWNER TO postgres;

--
-- Name: repo_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_repository_id_seq OWNER TO postgres;

--
-- Name: repo_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_repository_id_seq OWNED BY public.repo_repository.id;


--
-- Name: repo_repository_write_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_repository_write_access (
    id bigint NOT NULL,
    repository_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.repo_repository_write_access OWNER TO postgres;

--
-- Name: repo_repository_write_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_repository_write_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_repository_write_access_id_seq OWNER TO postgres;

--
-- Name: repo_repository_write_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_repository_write_access_id_seq OWNED BY public.repo_repository_write_access.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: repo_build id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_build ALTER COLUMN id SET DEFAULT nextval('public.repo_build_id_seq'::regclass);


--
-- Name: repo_buildlogline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_buildlogline ALTER COLUMN id SET DEFAULT nextval('public.repo_buildlogline_id_seq'::regclass);


--
-- Name: repo_mirror id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_mirror ALTER COLUMN id SET DEFAULT nextval('public.repo_mirror_id_seq'::regclass);


--
-- Name: repo_package id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_package ALTER COLUMN id SET DEFAULT nextval('public.repo_package_id_seq'::regclass);


--
-- Name: repo_pgpsigningkey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_pgpsigningkey ALTER COLUMN id SET DEFAULT nextval('public.repo_pgpsigningkey_id_seq'::regclass);


--
-- Name: repo_repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository ALTER COLUMN id SET DEFAULT nextval('public.repo_repository_id_seq'::regclass);


--
-- Name: repo_repository_write_access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository_write_access ALTER COLUMN id SET DEFAULT nextval('public.repo_repository_write_access_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add build	7	add_build
26	Can change build	7	change_build
27	Can delete build	7	delete_build
28	Can view build	7	view_build
29	Can add pgp signing key	8	add_pgpsigningkey
30	Can change pgp signing key	8	change_pgpsigningkey
31	Can delete pgp signing key	8	delete_pgpsigningkey
32	Can view pgp signing key	8	view_pgpsigningkey
33	Can add repository	9	add_repository
34	Can change repository	9	change_repository
35	Can delete repository	9	delete_repository
36	Can view repository	9	view_repository
37	Can add mirror	10	add_mirror
38	Can change mirror	10	change_mirror
39	Can delete mirror	10	delete_mirror
40	Can view mirror	10	view_mirror
41	Can add build log line	11	add_buildlogline
42	Can change build log line	11	change_buildlogline
43	Can delete build log line	11	delete_buildlogline
44	Can view build log line	11	view_buildlogline
45	Can add package	12	add_package
46	Can change package	12	change_package
47	Can delete package	12	delete_package
48	Can view package	12	view_package
49	Can add Token	13	add_token
50	Can change Token	13	change_token
51	Can delete Token	13	delete_token
52	Can view Token	13	view_token
53	Can add token	14	add_tokenproxy
54	Can change token	14	change_tokenproxy
55	Can delete token	14	delete_tokenproxy
56	Can view token	14	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$wL2bSd3WIKkBthL4m0wLsv$y/P/rmLGUe7BU0o+En0uo97eB/BlhZ8BoZ/id5j5tSI=	2023-01-16 15:19:50.15009+03	t	admin				t	t	2023-01-09 16:19:42.049986+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
0d6a5368a96b1f4a35ed2c418b64633651cbd30a	2023-01-09 16:19:42.232715+03	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-01-16 15:45:54.03369+03	1		1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	repo	build
8	repo	pgpsigningkey
9	repo	repository
10	repo	mirror
11	repo	buildlogline
12	repo	package
13	authtoken	token
14	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-01-09 16:19:41.39563+03
2	auth	0001_initial	2023-01-09 16:19:41.496818+03
3	admin	0001_initial	2023-01-09 16:19:41.530455+03
4	admin	0002_logentry_remove_auto_add	2023-01-09 16:19:41.548165+03
5	admin	0003_logentry_add_action_flag_choices	2023-01-09 16:19:41.559887+03
6	contenttypes	0002_remove_content_type_name	2023-01-09 16:19:41.580769+03
7	auth	0002_alter_permission_name_max_length	2023-01-09 16:19:41.588757+03
8	auth	0003_alter_user_email_max_length	2023-01-09 16:19:41.59925+03
9	auth	0004_alter_user_username_opts	2023-01-09 16:19:41.611683+03
10	auth	0005_alter_user_last_login_null	2023-01-09 16:19:41.619716+03
11	auth	0006_require_contenttypes_0002	2023-01-09 16:19:41.621796+03
12	auth	0007_alter_validators_add_error_messages	2023-01-09 16:19:41.630561+03
13	auth	0008_alter_user_username_max_length	2023-01-09 16:19:41.648824+03
14	auth	0009_alter_user_last_name_max_length	2023-01-09 16:19:41.658421+03
15	auth	0010_alter_group_name_max_length	2023-01-09 16:19:41.675664+03
16	auth	0011_update_proxy_permissions	2023-01-09 16:19:41.6844+03
17	auth	0012_alter_user_first_name_max_length	2023-01-09 16:19:41.695821+03
18	authtoken	0001_initial	2023-01-09 16:19:41.720498+03
19	authtoken	0002_auto_20160226_1747	2023-01-09 16:19:41.748173+03
20	authtoken	0003_tokenproxy	2023-01-09 16:19:41.751634+03
21	repo	0001_initial	2023-01-09 16:19:42.002935+03
22	repo	0002_default_superuser	2023-01-09 16:19:42.235698+03
23	repo	0003_remove_repository_architecture_package_architecture	2023-01-09 16:19:42.273833+03
24	repo	0004_alter_repository_signing_key	2023-01-09 16:19:42.294275+03
25	sessions	0001_initial	2023-01-09 16:19:42.312493+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
z6py28fr9qtfmtw4omtsjidelfnxjhpa	.eJxVjDsOwyAQRO9CHSGW30LK9D4DWj4KTiKQjF1FuXtsyUXSjea9mTcLtK01bKMsYc7syoBdfrtI6VnaAfKD2r3z1Nu6zJEfCj_p4FPP5XU73b-DSqPuazRorXFZASiZYc8Zok8IZIU22kpXHAiHWpH3VNAJRI_SC11iVNKyzxeVvzXZ:1pHNj9:3Hk198tfpwFJkPn_T8icur4mqarSW6WKhQ9rcCmB4x4	2023-01-30 14:32:35.143909+03
ps2on2jy345u4zkvxr4u53ntkg3utzva	.eJxVjDsOwyAQRO9CHSGW30LK9D4DWj4KTiKQjF1FuXtsyUXSjea9mTcLtK01bKMsYc7syoBdfrtI6VnaAfKD2r3z1Nu6zJEfCj_p4FPP5XU73b-DSqPuazRorXFZASiZYc8Zok8IZIU22kpXHAiHWpH3VNAJRI_SC11iVNKyzxeVvzXZ:1pHOSs:O9lEO0Rk13--FJcHKnJ7J5ag-VNC4swymwx7D2m8zm0	2023-01-30 15:19:50.152489+03
\.


--
-- Data for Name: repo_build; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_build (id, build_number, "timestamp", completion_status, repo_id) FROM stdin;
\.


--
-- Data for Name: repo_buildlogline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_buildlogline (id, "timestamp", command, message, loglevel, line_number, execution_time_sec, exec_complete, build_id) FROM stdin;
\.


--
-- Data for Name: repo_mirror; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_mirror (id, repo_id) FROM stdin;
\.


--
-- Data for Name: repo_package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_package (id, package_uid, filename, package_name, version, build_date, upload_date, checksum_sha512, repo_id, architecture) FROM stdin;
\.


--
-- Data for Name: repo_pgpsigningkey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_pgpsigningkey (id, name, email, fingerprint, private_key_pem, public_key_pem, creation_date) FROM stdin;
\.


--
-- Data for Name: repo_repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_repository (id, repo_uid, repo_type, keep_only_latest, package_count, last_updated, is_stale, refresh_count, promote_to_id, signing_key_id) FROM stdin;
1			f	0	2023-01-16 15:45:54.024911+03	f	0	\N	\N
\.


--
-- Data for Name: repo_repository_write_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo_repository_write_access (id, repository_id, user_id) FROM stdin;
1	1	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: repo_build_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_build_id_seq', 1, false);


--
-- Name: repo_buildlogline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_buildlogline_id_seq', 1, false);


--
-- Name: repo_mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_mirror_id_seq', 1, false);


--
-- Name: repo_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_package_id_seq', 1, false);


--
-- Name: repo_pgpsigningkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_pgpsigningkey_id_seq', 1, false);


--
-- Name: repo_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_repository_id_seq', 1, true);


--
-- Name: repo_repository_write_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repo_repository_write_access_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: repo_build repo_build_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_build
    ADD CONSTRAINT repo_build_pkey PRIMARY KEY (id);


--
-- Name: repo_build repo_build_repo_id_build_number_d0784efc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_build
    ADD CONSTRAINT repo_build_repo_id_build_number_d0784efc_uniq UNIQUE (repo_id, build_number);


--
-- Name: repo_buildlogline repo_buildlogline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_buildlogline
    ADD CONSTRAINT repo_buildlogline_pkey PRIMARY KEY (id);


--
-- Name: repo_mirror repo_mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_mirror
    ADD CONSTRAINT repo_mirror_pkey PRIMARY KEY (id);


--
-- Name: repo_package repo_package_package_uid_repo_id_d0c1f129_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_package
    ADD CONSTRAINT repo_package_package_uid_repo_id_d0c1f129_uniq UNIQUE (package_uid, repo_id);


--
-- Name: repo_package repo_package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_package
    ADD CONSTRAINT repo_package_pkey PRIMARY KEY (id);


--
-- Name: repo_package repo_package_repo_id_package_name_version_435a1b4b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_package
    ADD CONSTRAINT repo_package_repo_id_package_name_version_435a1b4b_uniq UNIQUE (repo_id, package_name, version);


--
-- Name: repo_pgpsigningkey repo_pgpsigningkey_fingerprint_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_pgpsigningkey
    ADD CONSTRAINT repo_pgpsigningkey_fingerprint_key UNIQUE (fingerprint);


--
-- Name: repo_pgpsigningkey repo_pgpsigningkey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_pgpsigningkey
    ADD CONSTRAINT repo_pgpsigningkey_pkey PRIMARY KEY (id);


--
-- Name: repo_repository repo_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository
    ADD CONSTRAINT repo_repository_pkey PRIMARY KEY (id);


--
-- Name: repo_repository repo_repository_repo_uid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository
    ADD CONSTRAINT repo_repository_repo_uid_key UNIQUE (repo_uid);


--
-- Name: repo_repository_write_access repo_repository_write_ac_repository_id_user_id_ded4d3df_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository_write_access
    ADD CONSTRAINT repo_repository_write_ac_repository_id_user_id_ded4d3df_uniq UNIQUE (repository_id, user_id);


--
-- Name: repo_repository_write_access repo_repository_write_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository_write_access
    ADD CONSTRAINT repo_repository_write_access_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: repo_build_build_number_583ff9e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_build_build_number_583ff9e2 ON public.repo_build USING btree (build_number);


--
-- Name: repo_build_completion_status_4fc66076; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_build_completion_status_4fc66076 ON public.repo_build USING btree (completion_status);


--
-- Name: repo_build_completion_status_4fc66076_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_build_completion_status_4fc66076_like ON public.repo_build USING btree (completion_status varchar_pattern_ops);


--
-- Name: repo_build_repo_id_675c0c32; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_build_repo_id_675c0c32 ON public.repo_build USING btree (repo_id);


--
-- Name: repo_build_timestamp_0c975d17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_build_timestamp_0c975d17 ON public.repo_build USING btree ("timestamp");


--
-- Name: repo_buildlogline_build_id_604cefa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_buildlogline_build_id_604cefa8 ON public.repo_buildlogline USING btree (build_id);


--
-- Name: repo_buildlogline_line_number_1f43ad94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_buildlogline_line_number_1f43ad94 ON public.repo_buildlogline USING btree (line_number);


--
-- Name: repo_buildlogline_loglevel_057d4d78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_buildlogline_loglevel_057d4d78 ON public.repo_buildlogline USING btree (loglevel);


--
-- Name: repo_buildlogline_loglevel_057d4d78_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_buildlogline_loglevel_057d4d78_like ON public.repo_buildlogline USING btree (loglevel varchar_pattern_ops);


--
-- Name: repo_buildlogline_timestamp_acd1e833; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_buildlogline_timestamp_acd1e833 ON public.repo_buildlogline USING btree ("timestamp");


--
-- Name: repo_mirror_repo_id_9fe50676; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_mirror_repo_id_9fe50676 ON public.repo_mirror USING btree (repo_id);


--
-- Name: repo_package_architecture_f4da55b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_architecture_f4da55b7 ON public.repo_package USING btree (architecture);


--
-- Name: repo_package_architecture_f4da55b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_architecture_f4da55b7_like ON public.repo_package USING btree (architecture varchar_pattern_ops);


--
-- Name: repo_package_checksum_sha512_077d1de6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_checksum_sha512_077d1de6 ON public.repo_package USING btree (checksum_sha512);


--
-- Name: repo_package_checksum_sha512_077d1de6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_checksum_sha512_077d1de6_like ON public.repo_package USING btree (checksum_sha512 varchar_pattern_ops);


--
-- Name: repo_package_package_name_aa4d27a5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_package_name_aa4d27a5 ON public.repo_package USING btree (package_name);


--
-- Name: repo_package_package_name_aa4d27a5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_package_name_aa4d27a5_like ON public.repo_package USING btree (package_name varchar_pattern_ops);


--
-- Name: repo_package_package_uid_07360c16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_package_uid_07360c16 ON public.repo_package USING btree (package_uid);


--
-- Name: repo_package_package_uid_07360c16_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_package_uid_07360c16_like ON public.repo_package USING btree (package_uid varchar_pattern_ops);


--
-- Name: repo_package_repo_id_890bca6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_repo_id_890bca6f ON public.repo_package USING btree (repo_id);


--
-- Name: repo_package_version_e4d0d3c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_version_e4d0d3c2 ON public.repo_package USING btree (version);


--
-- Name: repo_package_version_e4d0d3c2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_package_version_e4d0d3c2_like ON public.repo_package USING btree (version varchar_pattern_ops);


--
-- Name: repo_pgpsigningkey_fingerprint_7b21f308_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_pgpsigningkey_fingerprint_7b21f308_like ON public.repo_pgpsigningkey USING btree (fingerprint varchar_pattern_ops);


--
-- Name: repo_repository_is_stale_f9673467; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_is_stale_f9673467 ON public.repo_repository USING btree (is_stale);


--
-- Name: repo_repository_promote_to_id_d81961cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_promote_to_id_d81961cb ON public.repo_repository USING btree (promote_to_id);


--
-- Name: repo_repository_repo_type_f5d4c7bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_repo_type_f5d4c7bc ON public.repo_repository USING btree (repo_type);


--
-- Name: repo_repository_repo_type_f5d4c7bc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_repo_type_f5d4c7bc_like ON public.repo_repository USING btree (repo_type varchar_pattern_ops);


--
-- Name: repo_repository_repo_uid_2ebb6f1d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_repo_uid_2ebb6f1d_like ON public.repo_repository USING btree (repo_uid varchar_pattern_ops);


--
-- Name: repo_repository_signing_key_id_d99662fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_signing_key_id_d99662fb ON public.repo_repository USING btree (signing_key_id);


--
-- Name: repo_repository_write_access_repository_id_03f3f140; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_write_access_repository_id_03f3f140 ON public.repo_repository_write_access USING btree (repository_id);


--
-- Name: repo_repository_write_access_user_id_77f1d5c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_repository_write_access_user_id_77f1d5c2 ON public.repo_repository_write_access USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_build repo_build_repo_id_675c0c32_fk_repo_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_build
    ADD CONSTRAINT repo_build_repo_id_675c0c32_fk_repo_repository_id FOREIGN KEY (repo_id) REFERENCES public.repo_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_buildlogline repo_buildlogline_build_id_604cefa8_fk_repo_build_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_buildlogline
    ADD CONSTRAINT repo_buildlogline_build_id_604cefa8_fk_repo_build_id FOREIGN KEY (build_id) REFERENCES public.repo_build(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_mirror repo_mirror_repo_id_9fe50676_fk_repo_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_mirror
    ADD CONSTRAINT repo_mirror_repo_id_9fe50676_fk_repo_repository_id FOREIGN KEY (repo_id) REFERENCES public.repo_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_package repo_package_repo_id_890bca6f_fk_repo_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_package
    ADD CONSTRAINT repo_package_repo_id_890bca6f_fk_repo_repository_id FOREIGN KEY (repo_id) REFERENCES public.repo_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_repository repo_repository_promote_to_id_d81961cb_fk_repo_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository
    ADD CONSTRAINT repo_repository_promote_to_id_d81961cb_fk_repo_repository_id FOREIGN KEY (promote_to_id) REFERENCES public.repo_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_repository repo_repository_signing_key_id_d99662fb_fk_repo_pgps; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository
    ADD CONSTRAINT repo_repository_signing_key_id_d99662fb_fk_repo_pgps FOREIGN KEY (signing_key_id) REFERENCES public.repo_pgpsigningkey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_repository_write_access repo_repository_writ_repository_id_03f3f140_fk_repo_repo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository_write_access
    ADD CONSTRAINT repo_repository_writ_repository_id_03f3f140_fk_repo_repo FOREIGN KEY (repository_id) REFERENCES public.repo_repository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: repo_repository_write_access repo_repository_write_access_user_id_77f1d5c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_repository_write_access
    ADD CONSTRAINT repo_repository_write_access_user_id_77f1d5c2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

