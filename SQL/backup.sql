--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-15 11:30:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'BIG5';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 33238)
-- Name: intel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA intel;


ALTER SCHEMA intel OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 244 (class 1259 OID 33246)
-- Name: Client; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel."Client" (
    project_id bigint
)
INHERITS (public."User");


ALTER TABLE intel."Client" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 33277)
-- Name: Material; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel."Material" (
    "Material_id" bigint NOT NULL,
    "Material_name" character varying,
    "Material_type" character varying,
    "Material_ref" character varying
);


ALTER TABLE intel."Material" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 33251)
-- Name: Role; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel."Role" (
    role_id bigint NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE intel."Role" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 33239)
-- Name: User; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel."User" (
    user_id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password character varying,
    image character varying,
    phone_number character varying,
    adress character varying
);


ALTER TABLE intel."User" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 33263)
-- Name: division; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel.division (
    division_id bigint NOT NULL,
    division_name character varying,
    division_adress character varying,
    "CA" double precision
);


ALTER TABLE intel.division OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 33294)
-- Name: employee; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel.employee (
    role_id bigint,
    division_id bigint NOT NULL,
    project_id bigint NOT NULL
)
INHERITS (intel."User");


ALTER TABLE intel.employee OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 33256)
-- Name: project; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel.project (
    project_id bigint NOT NULL,
    theme character varying,
    appelation character varying,
    start_date date,
    end_date date,
    material_id bigint
);


ALTER TABLE intel.project OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 33270)
-- Name: team; Type: TABLE; Schema: intel; Owner: postgres
--

CREATE TABLE intel.team (
    team_id bigint NOT NULL,
    team_name character varying,
    type_team character varying
)
INHERITS (intel.division);


ALTER TABLE intel.team OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 33246)
-- Dependencies: 244
-- Data for Name: Client; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel."Client" (user_id, first_name, last_name, email, password, image, phone_number, adress, project_id) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 33277)
-- Dependencies: 249
-- Data for Name: Material; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel."Material" ("Material_id", "Material_name", "Material_type", "Material_ref") FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 33251)
-- Dependencies: 245
-- Data for Name: Role; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel."Role" (role_id, name, description) FROM stdin;
\.


--
-- TOC entry 3414 (class 0 OID 33239)
-- Dependencies: 243
-- Data for Name: User; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel."User" (user_id, first_name, last_name, email, password, image, phone_number, adress) FROM stdin;
\.


--
-- TOC entry 3418 (class 0 OID 33263)
-- Dependencies: 247
-- Data for Name: division; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel.division (division_id, division_name, division_adress, "CA") FROM stdin;
\.


--
-- TOC entry 3421 (class 0 OID 33294)
-- Dependencies: 250
-- Data for Name: employee; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel.employee (user_id, first_name, last_name, email, password, image, phone_number, adress, role_id, division_id, project_id) FROM stdin;
\.


--
-- TOC entry 3417 (class 0 OID 33256)
-- Dependencies: 246
-- Data for Name: project; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel.project (project_id, theme, appelation, start_date, end_date, material_id) FROM stdin;
\.


--
-- TOC entry 3419 (class 0 OID 33270)
-- Dependencies: 248
-- Data for Name: team; Type: TABLE DATA; Schema: intel; Owner: postgres
--

COPY intel.team (division_id, division_name, division_adress, "CA", team_id, team_name, type_team) FROM stdin;
\.


--
-- TOC entry 3268 (class 2606 OID 33283)
-- Name: Material Material_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel."Material"
    ADD CONSTRAINT "Material_pkey" PRIMARY KEY ("Material_id");


--
-- TOC entry 3260 (class 2606 OID 33310)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (role_id);


--
-- TOC entry 3258 (class 2606 OID 33245)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 3264 (class 2606 OID 33269)
-- Name: division division_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.division
    ADD CONSTRAINT division_pkey PRIMARY KEY (division_id);


--
-- TOC entry 3262 (class 2606 OID 33262)
-- Name: project project_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);


--
-- TOC entry 3266 (class 2606 OID 33276)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- TOC entry 3272 (class 2606 OID 33299)
-- Name: employee division_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.employee
    ADD CONSTRAINT division_id FOREIGN KEY (division_id) REFERENCES intel.division(division_id);


--
-- TOC entry 3271 (class 2606 OID 33326)
-- Name: team division_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.team
    ADD CONSTRAINT division_id FOREIGN KEY (division_id) REFERENCES intel.division(division_id) NOT VALID;


--
-- TOC entry 3270 (class 2606 OID 33316)
-- Name: project material_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.project
    ADD CONSTRAINT material_id FOREIGN KEY (material_id) REFERENCES intel."Material"("Material_id") NOT VALID;


--
-- TOC entry 3273 (class 2606 OID 33304)
-- Name: employee project_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.employee
    ADD CONSTRAINT project_id FOREIGN KEY (project_id) REFERENCES intel.project(project_id);


--
-- TOC entry 3269 (class 2606 OID 33321)
-- Name: Client project_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel."Client"
    ADD CONSTRAINT project_id FOREIGN KEY (project_id) REFERENCES intel.project(project_id) NOT VALID;


--
-- TOC entry 3274 (class 2606 OID 33311)
-- Name: employee role_id; Type: FK CONSTRAINT; Schema: intel; Owner: postgres
--

ALTER TABLE ONLY intel.employee
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES intel."Role"(role_id) NOT VALID;


-- Completed on 2021-12-15 11:30:24

--
-- PostgreSQL database dump complete
--

