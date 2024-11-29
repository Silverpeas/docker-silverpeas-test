--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

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

CREATE USER silver WITH PASSWORD 'silverpeas';
CREATE DATABASE silverpeas;
GRANT ALL PRIVILEGES ON DATABASE silverpeas TO silver;
ALTER DATABASE silverpeas OWNER TO silver;

\connect silverpeas;

SET default_tablespace = '';
SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 18320)
-- Name: calendarcategory; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendarcategory (
    categoryid character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.calendarcategory OWNER TO silver;

--
-- TOC entry 210 (class 1259 OID 18323)
-- Name: calendarjournal; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendarjournal (
    id integer NOT NULL,
    name character varying(2000) NOT NULL,
    description character varying(4000),
    delegatorid character varying(100) NOT NULL,
    startday character varying(50) NOT NULL,
    endday character varying(50),
    starthour character varying(50),
    endhour character varying(50),
    classification character varying(20),
    priority integer,
    lastmodification character varying(50),
    externalid character varying(50)
);


ALTER TABLE public.calendarjournal OWNER TO silver;

--
-- TOC entry 211 (class 1259 OID 18328)
-- Name: calendarjournalattendee; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendarjournalattendee (
    journalid integer NOT NULL,
    userid character varying(100) NOT NULL,
    participationstatus character varying(50)
);


ALTER TABLE public.calendarjournalattendee OWNER TO silver;

--
-- TOC entry 212 (class 1259 OID 18331)
-- Name: calendarjournalcategory; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendarjournalcategory (
    journalid integer NOT NULL,
    categoryid character varying(50) NOT NULL
);


ALTER TABLE public.calendarjournalcategory OWNER TO silver;

--
-- TOC entry 213 (class 1259 OID 18334)
-- Name: calendartodo; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendartodo (
    id integer NOT NULL,
    name character varying(2000) NOT NULL,
    description character varying(4000),
    delegatorid character varying(100) NOT NULL,
    startday character varying(50),
    endday character varying(50),
    starthour character varying(50),
    endhour character varying(50),
    classification character varying(20),
    priority integer,
    lastmodification character varying(50),
    percentcompleted integer,
    completedday character varying(20),
    duration integer,
    componentid character varying(100),
    spaceid character varying(100),
    externalid character varying(100)
);


ALTER TABLE public.calendartodo OWNER TO silver;

--
-- TOC entry 214 (class 1259 OID 18339)
-- Name: calendartodoattendee; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.calendartodoattendee (
    todoid integer NOT NULL,
    userid character varying(100) NOT NULL,
    participationstatus character varying(50)
);


ALTER TABLE public.calendartodoattendee OWNER TO silver;

--
-- TOC entry 215 (class 1259 OID 18342)
-- Name: days; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.days (
    day character varying(50) NOT NULL
);


ALTER TABLE public.days OWNER TO silver;

--
-- TOC entry 216 (class 1259 OID 18345)
-- Name: domainsp_group; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.domainsp_group (
    id integer NOT NULL,
    supergroupid integer,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.domainsp_group OWNER TO silver;

--
-- TOC entry 217 (class 1259 OID 18350)
-- Name: domainsp_group_user_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.domainsp_group_user_rel (
    groupid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.domainsp_group_user_rel OWNER TO silver;

--
-- TOC entry 218 (class 1259 OID 18353)
-- Name: domainsp_user; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.domainsp_user (
    id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100) NOT NULL,
    phone character varying(20),
    homephone character varying(20),
    cellphone character varying(20),
    fax character varying(20),
    address character varying(500),
    title character varying(100),
    company character varying(100),
    "position" character varying(100),
    boss character varying(100),
    login character varying(50) NOT NULL,
    password character varying(123),
    passwordvalid character(1) DEFAULT 'Y'::bpchar NOT NULL,
    loginmail character varying(100),
    email character varying(100)
);


ALTER TABLE public.domainsp_user OWNER TO silver;

--
-- TOC entry 219 (class 1259 OID 18359)
-- Name: model; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.model (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    imagename character varying(100),
    htmldisplayer character varying(3500) NOT NULL,
    htmleditor character varying(3500) NOT NULL,
    partid integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.model OWNER TO silver;

--
-- TOC entry 220 (class 1259 OID 18365)
-- Name: model_contact; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.model_contact (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50),
    imagename character varying(50),
    htmldisplayer character varying(3000) NOT NULL,
    htmleditor character varying(3000) NOT NULL
);


ALTER TABLE public.model_contact OWNER TO silver;

--
-- TOC entry 221 (class 1259 OID 18370)
-- Name: pdcaxisvalue; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.pdcaxisvalue (
    valueid bigint NOT NULL,
    axisid bigint NOT NULL
);


ALTER TABLE public.pdcaxisvalue OWNER TO silver;

--
-- TOC entry 222 (class 1259 OID 18373)
-- Name: pdcclassification; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.pdcclassification (
    id bigint NOT NULL,
    contentid character varying(255),
    instanceid character varying(255) NOT NULL,
    modifiable boolean NOT NULL,
    nodeid character varying(255)
);


ALTER TABLE public.pdcclassification OWNER TO silver;

--
-- TOC entry 223 (class 1259 OID 18378)
-- Name: pdcclassification_pdcposition; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.pdcclassification_pdcposition (
    pdcclassification_id bigint NOT NULL,
    positions_id bigint NOT NULL
);


ALTER TABLE public.pdcclassification_pdcposition OWNER TO silver;

--
-- TOC entry 224 (class 1259 OID 18381)
-- Name: pdcposition; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.pdcposition (
    id bigint NOT NULL
);


ALTER TABLE public.pdcposition OWNER TO silver;

--
-- TOC entry 225 (class 1259 OID 18384)
-- Name: pdcposition_pdcaxisvalue; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.pdcposition_pdcaxisvalue (
    pdcposition_id bigint NOT NULL,
    axisvalues_valueid bigint NOT NULL,
    axisvalues_axisid bigint NOT NULL
);


ALTER TABLE public.pdcposition_pdcaxisvalue OWNER TO silver;

--
-- TOC entry 226 (class 1259 OID 18387)
-- Name: permalinks_document; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.permalinks_document (
    documentid integer NOT NULL,
    documentuuid character varying(50) NOT NULL
);


ALTER TABLE public.permalinks_document OWNER TO silver;

--
-- TOC entry 227 (class 1259 OID 18390)
-- Name: permalinks_version; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.permalinks_version (
    versionid integer NOT NULL,
    versionuuid character varying(50) NOT NULL
);


ALTER TABLE public.permalinks_version OWNER TO silver;

--
-- TOC entry 228 (class 1259 OID 18393)
-- Name: personalization; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.personalization (
    id character varying(100) NOT NULL,
    languages character varying(100),
    zoneid character varying(100),
    look character varying(50),
    personalwspace character varying(50),
    thesaurusstatus integer NOT NULL,
    draganddropstatus integer DEFAULT 1,
    webdaveditingstatus integer DEFAULT 0,
    menudisplay character varying(50) DEFAULT 'DEFAULT'::character varying
);


ALTER TABLE public.personalization OWNER TO silver;

--
-- TOC entry 229 (class 1259 OID 18399)
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO silver;

--
-- TOC entry 230 (class 1259 OID 18404)
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO silver;

--
-- TOC entry 231 (class 1259 OID 18409)
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO silver;

--
-- TOC entry 232 (class 1259 OID 18414)
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO silver;

--
-- TOC entry 233 (class 1259 OID 18419)
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO silver;

--
-- TOC entry 234 (class 1259 OID 18424)
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO silver;

--
-- TOC entry 235 (class 1259 OID 18427)
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO silver;

--
-- TOC entry 236 (class 1259 OID 18430)
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO silver;

--
-- TOC entry 237 (class 1259 OID 18433)
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO silver;

--
-- TOC entry 238 (class 1259 OID 18438)
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO silver;

--
-- TOC entry 239 (class 1259 OID 18443)
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO silver;

--
-- TOC entry 240 (class 1259 OID 18448)
-- Name: readingcontrol; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.readingcontrol (
    pubid integer NOT NULL,
    actorid character varying(100) NOT NULL,
    space character varying(50) NOT NULL,
    componentname character varying(50) NOT NULL
);


ALTER TABLE public.readingcontrol OWNER TO silver;

--
-- TOC entry 241 (class 1259 OID 18451)
-- Name: sb_agenda_holidays; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_agenda_holidays (
    userid integer NOT NULL,
    holidaydate character varying(10) NOT NULL
);


ALTER TABLE public.sb_agenda_holidays OWNER TO silver;

--
-- TOC entry 242 (class 1259 OID 18454)
-- Name: sb_agenda_import_settings; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_agenda_import_settings (
    userid integer NOT NULL,
    hostname character varying(500) NOT NULL,
    synchrotype integer NOT NULL,
    synchrodelay integer NOT NULL,
    url character varying(500),
    remotelogin character varying(200),
    remotepwd character varying(200),
    charset character varying(20)
);


ALTER TABLE public.sb_agenda_import_settings OWNER TO silver;

--
-- TOC entry 243 (class 1259 OID 18459)
-- Name: sb_cal_attendees; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_attendees (
    id character varying(40) NOT NULL,
    attendeeid character varying(40) NOT NULL,
    componentid character varying(40) NOT NULL,
    type integer NOT NULL,
    participation character varying(12) DEFAULT 'AWAITING'::character varying NOT NULL,
    presence character varying(12) DEFAULT 'REQUIRED'::character varying NOT NULL,
    delegate character varying(40),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_attendees OWNER TO silver;

--
-- TOC entry 244 (class 1259 OID 18464)
-- Name: sb_cal_attributes; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_attributes (
    id character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.sb_cal_attributes OWNER TO silver;

--
-- TOC entry 245 (class 1259 OID 18469)
-- Name: sb_cal_calendar; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_calendar (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    title character varying(255) NOT NULL,
    zoneid character varying(40) NOT NULL,
    externalurl character varying(250),
    synchrodate timestamp without time zone,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_calendar OWNER TO silver;

--
-- TOC entry 246 (class 1259 OID 18474)
-- Name: sb_cal_categories; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_categories (
    id character varying(40) NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.sb_cal_categories OWNER TO silver;

--
-- TOC entry 247 (class 1259 OID 18477)
-- Name: sb_cal_components; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_components (
    id character varying(40) NOT NULL,
    calendarid character varying(40) NOT NULL,
    startdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone NOT NULL,
    indays boolean NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(2000) NOT NULL,
    location character varying(255),
    attributes character varying(40),
    priority integer NOT NULL,
    sequence bigint DEFAULT 0 NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_cal_components OWNER TO silver;

--
-- TOC entry 248 (class 1259 OID 18483)
-- Name: sb_cal_event; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_event (
    id character varying(40) NOT NULL,
    externalid character varying(255),
    synchrodate timestamp without time zone,
    componentid character varying(40) NOT NULL,
    visibility character varying(50) NOT NULL,
    recurrenceid character varying(40)
);


ALTER TABLE public.sb_cal_event OWNER TO silver;

--
-- TOC entry 249 (class 1259 OID 18486)
-- Name: sb_cal_occurrences; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_occurrences (
    id character varying(60) NOT NULL,
    eventid character varying(40) NOT NULL,
    componentid character varying(40) NOT NULL
);


ALTER TABLE public.sb_cal_occurrences OWNER TO silver;

--
-- TOC entry 250 (class 1259 OID 18489)
-- Name: sb_cal_recurrence; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_recurrence (
    id character varying(40) NOT NULL,
    recur_periodinterval integer NOT NULL,
    recur_periodunit character varying(5) NOT NULL,
    recur_count integer DEFAULT 0,
    recur_enddate timestamp without time zone
);


ALTER TABLE public.sb_cal_recurrence OWNER TO silver;

--
-- TOC entry 251 (class 1259 OID 18493)
-- Name: sb_cal_recurrence_dayofweek; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_recurrence_dayofweek (
    recurrenceid character varying(40) NOT NULL,
    recur_nth integer NOT NULL,
    recur_dayofweek integer NOT NULL
);


ALTER TABLE public.sb_cal_recurrence_dayofweek OWNER TO silver;

--
-- TOC entry 252 (class 1259 OID 18496)
-- Name: sb_cal_recurrence_exception; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_cal_recurrence_exception (
    recurrenceid character varying(40) NOT NULL,
    recur_exceptiondate timestamp without time zone NOT NULL
);


ALTER TABLE public.sb_cal_recurrence_exception OWNER TO silver;

--
-- TOC entry 253 (class 1259 OID 18499)
-- Name: sb_classifyengine_classify; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_classifyengine_classify (
    positionid integer NOT NULL,
    objectid integer NOT NULL,
    axis0 character varying(150),
    axis1 character varying(150),
    axis2 character varying(150),
    axis3 character varying(150),
    axis4 character varying(150),
    axis5 character varying(150),
    axis6 character varying(150),
    axis7 character varying(150),
    axis8 character varying(150),
    axis9 character varying(150),
    axis10 character varying(150),
    axis11 character varying(150),
    axis12 character varying(150),
    axis13 character varying(150),
    axis14 character varying(150),
    axis15 character varying(150),
    axis16 character varying(150),
    axis17 character varying(150),
    axis18 character varying(150),
    axis19 character varying(150),
    axis20 character varying(150),
    axis21 character varying(150),
    axis22 character varying(150),
    axis23 character varying(150),
    axis24 character varying(150),
    axis25 character varying(150),
    axis26 character varying(150),
    axis27 character varying(150),
    axis28 character varying(150),
    axis29 character varying(150),
    axis30 character varying(150),
    axis31 character varying(150),
    axis32 character varying(150),
    axis33 character varying(150),
    axis34 character varying(150),
    axis35 character varying(150),
    axis36 character varying(150),
    axis37 character varying(150),
    axis38 character varying(150),
    axis39 character varying(150),
    axis40 character varying(150),
    axis41 character varying(150),
    axis42 character varying(150),
    axis43 character varying(150),
    axis44 character varying(150),
    axis45 character varying(150),
    axis46 character varying(150),
    axis47 character varying(150),
    axis48 character varying(150),
    axis49 character varying(150)
);


ALTER TABLE public.sb_classifyengine_classify OWNER TO silver;

--
-- TOC entry 254 (class 1259 OID 18504)
-- Name: sb_comment_comment; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_comment_comment (
    commentid integer NOT NULL,
    commentownerid integer NOT NULL,
    commentcreationdate character(10) NOT NULL,
    commentmodificationdate character(10),
    commentcomment character varying(2000) NOT NULL,
    instanceid character varying(50) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_comment_comment OWNER TO silver;

--
-- TOC entry 255 (class 1259 OID 18509)
-- Name: sb_contact_contact; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contact_contact (
    contactid integer NOT NULL,
    contactfirstname character varying(1000),
    contactlastname character varying(1000),
    contactemail character varying(1000),
    contactphone character varying(20),
    contactfax character varying(20),
    userid character varying(100),
    contactcreationdate character varying(10) NOT NULL,
    contactcreatorid character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_contact_contact OWNER TO silver;

--
-- TOC entry 256 (class 1259 OID 18514)
-- Name: sb_contact_contactfather; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contact_contactfather (
    contactid integer NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE public.sb_contact_contactfather OWNER TO silver;

--
-- TOC entry 257 (class 1259 OID 18517)
-- Name: sb_contact_info; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contact_info (
    infoid integer NOT NULL,
    contactid integer NOT NULL,
    modelid character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_contact_info OWNER TO silver;

--
-- TOC entry 258 (class 1259 OID 18520)
-- Name: sb_containermanager_instance; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_containermanager_instance (
    instanceid integer NOT NULL,
    componentid character varying(100) NOT NULL,
    containertype character varying(100) NOT NULL,
    contenttype character varying(100) NOT NULL
);


ALTER TABLE public.sb_containermanager_instance OWNER TO silver;

--
-- TOC entry 259 (class 1259 OID 18523)
-- Name: sb_containermanager_links; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_containermanager_links (
    positionid integer NOT NULL,
    containerinstanceid integer NOT NULL
);


ALTER TABLE public.sb_containermanager_links OWNER TO silver;

--
-- TOC entry 260 (class 1259 OID 18526)
-- Name: sb_contentmanager_content; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contentmanager_content (
    silvercontentid integer NOT NULL,
    internalcontentid character varying(100) NOT NULL,
    contentinstanceid integer NOT NULL,
    authorid integer NOT NULL,
    creationdate date NOT NULL,
    begindate character varying(10),
    enddate character varying(10),
    isvisible integer
);


ALTER TABLE public.sb_contentmanager_content OWNER TO silver;

--
-- TOC entry 261 (class 1259 OID 18529)
-- Name: sb_contentmanager_instance; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contentmanager_instance (
    instanceid integer NOT NULL,
    componentid character varying(100) NOT NULL,
    containertype character varying(100) NOT NULL,
    contenttype character varying(100) NOT NULL
);


ALTER TABLE public.sb_contentmanager_instance OWNER TO silver;

--
-- TOC entry 262 (class 1259 OID 18532)
-- Name: sb_contribution_tracking; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_contribution_tracking (
    id character varying(40) NOT NULL,
    context character varying(255) DEFAULT ''::character varying,
    contrib_id character varying(40) NOT NULL,
    contrib_type character varying(40) NOT NULL,
    contrib_instanceid character varying(50) NOT NULL,
    action_type character varying(20) NOT NULL,
    action_date timestamp without time zone NOT NULL,
    action_by character varying(50) NOT NULL
);


ALTER TABLE public.sb_contribution_tracking OWNER TO silver;

--
-- TOC entry 263 (class 1259 OID 18538)
-- Name: sb_coordinates_coordinates; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_coordinates_coordinates (
    coordinatesid integer NOT NULL,
    nodeid integer NOT NULL,
    coordinatesleaf character varying(50) NOT NULL,
    coordinatesdisplayorder integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_coordinates_coordinates OWNER TO silver;

--
-- TOC entry 264 (class 1259 OID 18541)
-- Name: sb_filesharing_history; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_filesharing_history (
    id bigint NOT NULL,
    keyfile character varying(255) NOT NULL,
    downloaddate bigint NOT NULL,
    downloadip character varying(50) NOT NULL
);


ALTER TABLE public.sb_filesharing_history OWNER TO silver;

--
-- TOC entry 265 (class 1259 OID 18544)
-- Name: sb_filesharing_ticket; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_filesharing_ticket (
    shared_object bigint NOT NULL,
    componentid character varying(255) NOT NULL,
    creatorid character varying(50) NOT NULL,
    creationdate bigint NOT NULL,
    updateid character varying(50),
    updatedate bigint,
    enddate bigint,
    nbaccessmax integer NOT NULL,
    nbaccess integer,
    keyfile character varying(255) NOT NULL,
    shared_object_type character varying(255) NOT NULL
);


ALTER TABLE public.sb_filesharing_ticket OWNER TO silver;

--
-- TOC entry 266 (class 1259 OID 18549)
-- Name: sb_formtemplate_record; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_formtemplate_record (
    recordid integer NOT NULL,
    templateid integer NOT NULL,
    externalid character varying(250) NOT NULL,
    lang character(2)
);


ALTER TABLE public.sb_formtemplate_record OWNER TO silver;

--
-- TOC entry 267 (class 1259 OID 18552)
-- Name: sb_formtemplate_template; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_formtemplate_template (
    templateid integer NOT NULL,
    externalid character varying(250) NOT NULL,
    templatename character varying(250)
);


ALTER TABLE public.sb_formtemplate_template OWNER TO silver;

--
-- TOC entry 268 (class 1259 OID 18557)
-- Name: sb_formtemplate_templatefield; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_formtemplate_templatefield (
    templateid integer NOT NULL,
    fieldname character varying(50) NOT NULL,
    fieldindex integer NOT NULL,
    fieldtype character varying(50) NOT NULL,
    ismandatory smallint DEFAULT 0,
    isreadonly smallint DEFAULT 0,
    ishidden smallint DEFAULT 0
);


ALTER TABLE public.sb_formtemplate_templatefield OWNER TO silver;

--
-- TOC entry 269 (class 1259 OID 18563)
-- Name: sb_formtemplate_textfield; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_formtemplate_textfield (
    recordid integer NOT NULL,
    fieldname character varying(100) NOT NULL,
    fieldvalue character varying(4000),
    fieldvalueindex integer
);


ALTER TABLE public.sb_formtemplate_textfield OWNER TO silver;

--
-- TOC entry 270 (class 1259 OID 18568)
-- Name: sb_interests; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_interests (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    criteria character varying(255),
    workspaceid character(100),
    peasid character(100),
    authorid character(10),
    afterdate character varying(10),
    beforedate character varying(10),
    ownerid integer NOT NULL
);


ALTER TABLE public.sb_interests OWNER TO silver;

--
-- TOC entry 271 (class 1259 OID 18573)
-- Name: sb_interests_axis; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_interests_axis (
    id integer NOT NULL,
    icid integer NOT NULL,
    axisid integer NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_interests_axis OWNER TO silver;

--
-- TOC entry 272 (class 1259 OID 18576)
-- Name: sb_mylinks_cat; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_mylinks_cat (
    catid integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    userid character varying(50) NOT NULL,
    "position" integer
);


ALTER TABLE public.sb_mylinks_cat OWNER TO silver;

--
-- TOC entry 273 (class 1259 OID 18581)
-- Name: sb_mylinks_link; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_mylinks_link (
    linkid integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    url character varying(255) NOT NULL,
    visible integer NOT NULL,
    popup integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid character varying(50),
    objectid character varying(50),
    "position" integer
);


ALTER TABLE public.sb_mylinks_link OWNER TO silver;

--
-- TOC entry 274 (class 1259 OID 18586)
-- Name: sb_mylinks_linkcat; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_mylinks_linkcat (
    linkid integer NOT NULL,
    catid integer NOT NULL
);


ALTER TABLE public.sb_mylinks_linkcat OWNER TO silver;

--
-- TOC entry 275 (class 1259 OID 18589)
-- Name: sb_node_node; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_node_node (
    nodeid integer NOT NULL,
    nodename character varying(1000) NOT NULL,
    nodedescription character varying(2000),
    nodecreationdate character varying(10) NOT NULL,
    nodecreatorid character varying(100) NOT NULL,
    nodepath character varying(1000) NOT NULL,
    nodelevelnumber integer NOT NULL,
    nodefatherid integer NOT NULL,
    modelid character varying(1000),
    nodestatus character varying(1000),
    instanceid character varying(50) NOT NULL,
    type character varying(50),
    ordernumber integer DEFAULT 0,
    lang character(2),
    rightsdependson integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.sb_node_node OWNER TO silver;

--
-- TOC entry 276 (class 1259 OID 18596)
-- Name: sb_node_nodei18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_node_nodei18n (
    id integer NOT NULL,
    nodeid integer NOT NULL,
    lang character(2) NOT NULL,
    nodename character varying(1000) NOT NULL,
    nodedescription character varying(2000)
);


ALTER TABLE public.sb_node_nodei18n OWNER TO silver;

--
-- TOC entry 277 (class 1259 OID 18601)
-- Name: sb_notation_notation; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_notation_notation (
    id integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    externalid character varying(50) NOT NULL,
    externaltype character varying(50) NOT NULL,
    author character varying(50) NOT NULL,
    note integer NOT NULL
);


ALTER TABLE public.sb_notation_notation OWNER TO silver;

--
-- TOC entry 278 (class 1259 OID 18604)
-- Name: sb_pdc_axis; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_axis (
    id integer NOT NULL,
    rootid integer NOT NULL,
    name character varying(255) NOT NULL,
    axistype character(1) NOT NULL,
    axisorder integer NOT NULL,
    creationdate character varying(10),
    creatorid character varying(255),
    description character varying(1000),
    lang character(2)
);


ALTER TABLE public.sb_pdc_axis OWNER TO silver;

--
-- TOC entry 279 (class 1259 OID 18609)
-- Name: sb_pdc_axisi18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_axisi18n (
    id integer NOT NULL,
    axisid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.sb_pdc_axisi18n OWNER TO silver;

--
-- TOC entry 280 (class 1259 OID 18614)
-- Name: sb_pdc_group_rights; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_group_rights (
    axisid integer NOT NULL,
    valueid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.sb_pdc_group_rights OWNER TO silver;

--
-- TOC entry 281 (class 1259 OID 18617)
-- Name: sb_pdc_subscription; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_subscription (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ownerid integer NOT NULL
);


ALTER TABLE public.sb_pdc_subscription OWNER TO silver;

--
-- TOC entry 282 (class 1259 OID 18620)
-- Name: sb_pdc_subscription_axis; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_subscription_axis (
    id integer NOT NULL,
    pdcsubscriptionid integer NOT NULL,
    axisid integer NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_pdc_subscription_axis OWNER TO silver;

--
-- TOC entry 283 (class 1259 OID 18623)
-- Name: sb_pdc_user_rights; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_user_rights (
    axisid integer NOT NULL,
    valueid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.sb_pdc_user_rights OWNER TO silver;

--
-- TOC entry 284 (class 1259 OID 18626)
-- Name: sb_pdc_utilization; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_pdc_utilization (
    id integer NOT NULL,
    instanceid character varying(100) NOT NULL,
    axisid integer NOT NULL,
    basevalue integer NOT NULL,
    mandatory integer NOT NULL,
    variant integer NOT NULL
);


ALTER TABLE public.sb_pdc_utilization OWNER TO silver;

--
-- TOC entry 285 (class 1259 OID 18629)
-- Name: sb_publication_publi; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_publication_publi (
    pubid integer NOT NULL,
    infoid character varying(50),
    pubname character varying(400) NOT NULL,
    pubdescription character varying(2000),
    pubcreationdate character varying(10) NOT NULL,
    pubbegindate character varying(10) NOT NULL,
    pubenddate character varying(10) NOT NULL,
    pubcreatorid character varying(100) NOT NULL,
    pubimportance integer,
    pubversion character varying(100),
    pubkeywords character varying(1000),
    pubcontent character varying(2000),
    pubstatus character varying(100),
    pubupdatedate character varying(10),
    instanceid character varying(50) NOT NULL,
    pubupdaterid character varying(100),
    pubvalidatedate character varying(10),
    pubvalidatorid character varying(50),
    pubbeginhour character varying(5),
    pubendhour character varying(5),
    pubauthor character varying(50),
    pubtargetvalidatorid character varying(50),
    pubcloneid integer DEFAULT '-1'::integer,
    pubclonestatus character varying(50),
    lang character(2),
    pubdraftoutdate character varying(10)
);


ALTER TABLE public.sb_publication_publi OWNER TO silver;

--
-- TOC entry 286 (class 1259 OID 18635)
-- Name: sb_publication_publifather; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_publication_publifather (
    pubid integer NOT NULL,
    nodeid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    aliasuserid integer,
    aliasdate character varying(20),
    puborder integer DEFAULT 0
);


ALTER TABLE public.sb_publication_publifather OWNER TO silver;

--
-- TOC entry 287 (class 1259 OID 18639)
-- Name: sb_publication_publii18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_publication_publii18n (
    id integer NOT NULL,
    pubid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(400) NOT NULL,
    description character varying(2000),
    keywords character varying(1000)
);


ALTER TABLE public.sb_publication_publii18n OWNER TO silver;

--
-- TOC entry 288 (class 1259 OID 18644)
-- Name: sb_publication_validation; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_publication_validation (
    id integer NOT NULL,
    pubid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    userid integer NOT NULL,
    decisiondate character varying(20) NOT NULL,
    decision character varying(50) NOT NULL
);


ALTER TABLE public.sb_publication_validation OWNER TO silver;

--
-- TOC entry 289 (class 1259 OID 18647)
-- Name: sb_question_answer; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_question_answer (
    answerid integer NOT NULL,
    questionid integer NOT NULL,
    answerlabel character varying(1000),
    answernbpoints integer,
    answerissolution integer NOT NULL,
    answercomment character varying(2000),
    answernbvoters integer NOT NULL,
    answerisopened integer NOT NULL,
    answerimage character varying(2000),
    answerquestionlink character varying(100)
);


ALTER TABLE public.sb_question_answer OWNER TO silver;

--
-- TOC entry 290 (class 1259 OID 18652)
-- Name: sb_question_question; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_question_question (
    questionid integer NOT NULL,
    qcid integer NOT NULL,
    questionlabel character varying(1000) NOT NULL,
    questiondescription character varying(2000),
    questionclue character varying(2000),
    questionimage character varying(1000),
    questionisqcm integer NOT NULL,
    questiontype integer NOT NULL,
    questionisopen integer NOT NULL,
    questioncluepenalty integer NOT NULL,
    questionmaxtime integer NOT NULL,
    questiondisplayorder integer NOT NULL,
    questionnbpointsmin integer NOT NULL,
    questionnbpointsmax integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    style character varying(50)
);


ALTER TABLE public.sb_question_question OWNER TO silver;

--
-- TOC entry 291 (class 1259 OID 18657)
-- Name: sb_question_questionresult; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_question_questionresult (
    qrid integer NOT NULL,
    questionid integer NOT NULL,
    userid character varying(100) NOT NULL,
    answerid integer NOT NULL,
    qropenanswer character varying(2000),
    qrnbpoints integer NOT NULL,
    qrpolldate character varying(10) NOT NULL,
    qrelapsedtime character varying(100),
    qrparticipationid integer
);


ALTER TABLE public.sb_question_questionresult OWNER TO silver;

--
-- TOC entry 292 (class 1259 OID 18662)
-- Name: sb_question_score; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_question_score (
    scoreid integer NOT NULL,
    qcid integer NOT NULL,
    userid character varying(100) NOT NULL,
    scoreparticipationid integer NOT NULL,
    scorescore integer NOT NULL,
    scoreelapsedtime character varying(100),
    scoreparticipationdate character varying(10) NOT NULL,
    scoresuggestion character varying(2000)
);


ALTER TABLE public.sb_question_score OWNER TO silver;

--
-- TOC entry 293 (class 1259 OID 18667)
-- Name: sb_questioncontainer_comment; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_questioncontainer_comment (
    commentid integer NOT NULL,
    commentfatherid integer NOT NULL,
    userid character varying(100) NOT NULL,
    commentcomment character varying(2000),
    commentisanonymous integer NOT NULL,
    commentdate character varying(10) NOT NULL
);


ALTER TABLE public.sb_questioncontainer_comment OWNER TO silver;

--
-- TOC entry 294 (class 1259 OID 18672)
-- Name: sb_questioncontainer_qc; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_questioncontainer_qc (
    qcid integer NOT NULL,
    qctitle character varying(1000) NOT NULL,
    qcdescription character varying(2000),
    qccomment character varying(2000),
    qccreatorid character varying(100) NOT NULL,
    qccreationdate character varying(10) NOT NULL,
    qcbegindate character varying(10) NOT NULL,
    qcenddate character varying(10) NOT NULL,
    qcisclosed integer NOT NULL,
    qcnbvoters integer NOT NULL,
    qcnbquestionspage integer NOT NULL,
    qcnbmaxparticipations integer,
    qcnbtriesbeforesolution integer,
    qcmaxtime integer,
    instanceid character varying(50) NOT NULL,
    anonymous integer NOT NULL,
    resultmode integer NOT NULL,
    resultview integer NOT NULL
);


ALTER TABLE public.sb_questioncontainer_qc OWNER TO silver;

--
-- TOC entry 295 (class 1259 OID 18677)
-- Name: sb_reminder; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_reminder (
    id character varying(41) NOT NULL,
    remindertype character varying(40) NOT NULL,
    contrib_id character varying(40) NOT NULL,
    contrib_instanceid character varying(30) NOT NULL,
    contrib_type character varying(40) NOT NULL,
    userid character varying(40) NOT NULL,
    text character varying(255),
    triggered boolean DEFAULT false NOT NULL,
    trigger_datetime timestamp without time zone,
    trigger_durationtime integer,
    trigger_durationunit character varying(12),
    trigger_prop character varying(30),
    process_name character varying(200) NOT NULL
);


ALTER TABLE public.sb_reminder OWNER TO silver;

--
-- TOC entry 296 (class 1259 OID 18683)
-- Name: sb_seealso_link; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_seealso_link (
    id integer NOT NULL,
    objectid integer NOT NULL,
    objectinstanceid character varying(50) NOT NULL,
    targetid integer NOT NULL,
    targetinstanceid character varying(50) NOT NULL
);


ALTER TABLE public.sb_seealso_link OWNER TO silver;

--
-- TOC entry 297 (class 1259 OID 18686)
-- Name: sb_sn_externalaccount; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_sn_externalaccount (
    profileid character varying(100) NOT NULL,
    networkid character varying(10) NOT NULL,
    silverpeasuserid character varying(50)
);


ALTER TABLE public.sb_sn_externalaccount OWNER TO silver;

--
-- TOC entry 298 (class 1259 OID 18689)
-- Name: sb_sn_invitation; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_sn_invitation (
    id integer NOT NULL,
    senderid integer NOT NULL,
    receiverid integer NOT NULL,
    message character varying(1000),
    invitationdate timestamp without time zone NOT NULL
);


ALTER TABLE public.sb_sn_invitation OWNER TO silver;

--
-- TOC entry 299 (class 1259 OID 18694)
-- Name: sb_sn_relationship; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_sn_relationship (
    id integer NOT NULL,
    user1id integer NOT NULL,
    user2id integer NOT NULL,
    typerelationshipid integer,
    acceptancedate timestamp without time zone NOT NULL,
    inviterid integer NOT NULL
);


ALTER TABLE public.sb_sn_relationship OWNER TO silver;

--
-- TOC entry 300 (class 1259 OID 18697)
-- Name: sb_sn_status; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_sn_status (
    id integer NOT NULL,
    userid integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    description character varying(1000) NOT NULL
);


ALTER TABLE public.sb_sn_status OWNER TO silver;

--
-- TOC entry 301 (class 1259 OID 18702)
-- Name: sb_sn_typerelationship; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_sn_typerelationship (
    id integer NOT NULL,
    designation character varying(10)
);


ALTER TABLE public.sb_sn_typerelationship OWNER TO silver;

--
-- TOC entry 302 (class 1259 OID 18705)
-- Name: sb_stat_access; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_access (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countaccess numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_access OWNER TO silver;

--
-- TOC entry 303 (class 1259 OID 18708)
-- Name: sb_stat_accesscumul; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_accesscumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countaccess numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_accesscumul OWNER TO silver;

--
-- TOC entry 304 (class 1259 OID 18711)
-- Name: sb_stat_connection; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_connection (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    countconnection numeric(19,0) NOT NULL,
    duration numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_connection OWNER TO silver;

--
-- TOC entry 305 (class 1259 OID 18714)
-- Name: sb_stat_connectioncumul; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_connectioncumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    countconnection numeric(19,0) NOT NULL,
    duration numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_connectioncumul OWNER TO silver;

--
-- TOC entry 306 (class 1259 OID 18717)
-- Name: sb_stat_sizedir; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_sizedir (
    datestat character varying(10) NOT NULL,
    filedir character varying(256) NOT NULL,
    sizedir numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_sizedir OWNER TO silver;

--
-- TOC entry 307 (class 1259 OID 18720)
-- Name: sb_stat_sizedircumul; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_sizedircumul (
    datestat character varying(10) NOT NULL,
    filedir character varying(256) NOT NULL,
    sizedir numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_sizedircumul OWNER TO silver;

--
-- TOC entry 308 (class 1259 OID 18723)
-- Name: sb_stat_volume; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_volume (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countvolume numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_volume OWNER TO silver;

--
-- TOC entry 309 (class 1259 OID 18726)
-- Name: sb_stat_volumecumul; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_stat_volumecumul (
    datestat character varying(10) NOT NULL,
    userid integer NOT NULL,
    peastype character varying(50) NOT NULL,
    spaceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    countvolume numeric(19,0) NOT NULL
);


ALTER TABLE public.sb_stat_volumecumul OWNER TO silver;

--
-- TOC entry 310 (class 1259 OID 18729)
-- Name: sb_statistic_history; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_statistic_history (
    datestat character varying(10) NOT NULL,
    heurestat character varying(10) NOT NULL,
    userid character varying(100) NOT NULL,
    resourceid character varying(50) NOT NULL,
    componentid character varying(50) NOT NULL,
    actiontype integer NOT NULL,
    resourcetype character varying(50) NOT NULL
);


ALTER TABLE public.sb_statistic_history OWNER TO silver;

--
-- TOC entry 311 (class 1259 OID 18732)
-- Name: sb_tagcloud_tagcloud; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_tagcloud_tagcloud (
    id integer NOT NULL,
    tag character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    instanceid character varying(50) NOT NULL,
    externalid character varying(50) NOT NULL,
    externaltype integer NOT NULL
);


ALTER TABLE public.sb_tagcloud_tagcloud OWNER TO silver;

--
-- TOC entry 312 (class 1259 OID 18735)
-- Name: sb_thesaurus_jargon; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_thesaurus_jargon (
    id integer NOT NULL,
    type integer NOT NULL,
    idvoca integer NOT NULL,
    iduser character varying(50) NOT NULL
);


ALTER TABLE public.sb_thesaurus_jargon OWNER TO silver;

--
-- TOC entry 313 (class 1259 OID 18738)
-- Name: sb_thesaurus_synonym; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_thesaurus_synonym (
    id integer NOT NULL,
    idvoca integer NOT NULL,
    idtree integer NOT NULL,
    idterm integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.sb_thesaurus_synonym OWNER TO silver;

--
-- TOC entry 314 (class 1259 OID 18741)
-- Name: sb_thesaurus_vocabulary; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_thesaurus_vocabulary (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(2000) NOT NULL
);


ALTER TABLE public.sb_thesaurus_vocabulary OWNER TO silver;

--
-- TOC entry 315 (class 1259 OID 18746)
-- Name: sb_thumbnail_thumbnail; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_thumbnail_thumbnail (
    instanceid character varying(50) NOT NULL,
    objectid integer NOT NULL,
    objecttype integer NOT NULL,
    originalattachmentname character varying(250) NOT NULL,
    modifiedattachmentname character varying(250),
    mimetype character varying(250),
    xstart integer,
    ystart integer,
    xlength integer,
    ylength integer
);


ALTER TABLE public.sb_thumbnail_thumbnail OWNER TO silver;

--
-- TOC entry 316 (class 1259 OID 18751)
-- Name: sb_tree_tree; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_tree_tree (
    treeid integer NOT NULL,
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000),
    creationdate character(10) NOT NULL,
    creatorid character varying(255) NOT NULL,
    path character varying(1000) NOT NULL,
    levelnumber integer NOT NULL,
    fatherid integer NOT NULL,
    ordernumber integer,
    lang character(2)
);


ALTER TABLE public.sb_tree_tree OWNER TO silver;

--
-- TOC entry 317 (class 1259 OID 18756)
-- Name: sb_tree_treei18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_tree_treei18n (
    id integer NOT NULL,
    treeid integer NOT NULL,
    nodeid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.sb_tree_treei18n OWNER TO silver;

--
-- TOC entry 318 (class 1259 OID 18761)
-- Name: sb_variables_value; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_variables_value (
    id character varying(40) NOT NULL,
    variableid character varying(40) NOT NULL,
    value character varying(2000) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_variables_value OWNER TO silver;

--
-- TOC entry 319 (class 1259 OID 18766)
-- Name: sb_variables_variable; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_variables_variable (
    id character varying(40) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(2000),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_variables_variable OWNER TO silver;

--
-- TOC entry 320 (class 1259 OID 18771)
-- Name: sb_webconnections_info; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_webconnections_info (
    connectionid integer NOT NULL,
    userid integer NOT NULL,
    componentid character varying(50) NOT NULL,
    paramlogin character varying(100) NOT NULL,
    parampassword bytea
);


ALTER TABLE public.sb_webconnections_info OWNER TO silver;

--
-- TOC entry 321 (class 1259 OID 18776)
-- Name: sb_workflow_activestate; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_activestate (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    backstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutdate timestamp without time zone
);


ALTER TABLE public.sb_workflow_activestate OWNER TO silver;

--
-- TOC entry 322 (class 1259 OID 18781)
-- Name: sb_workflow_error; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_error (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    stepid integer,
    errormessage character varying(200),
    stacktrace character varying(4000),
    userid character varying(100),
    actionname character varying(100),
    actiondate timestamp without time zone,
    userrole character varying(100),
    statename character varying(100)
);


ALTER TABLE public.sb_workflow_error OWNER TO silver;

--
-- TOC entry 323 (class 1259 OID 18786)
-- Name: sb_workflow_historystep; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_historystep (
    instanceid integer NOT NULL,
    id integer NOT NULL,
    userid character varying(50),
    substituteid character varying(40),
    userrolename character varying(50),
    action character varying(50),
    actiondate timestamp without time zone,
    resolvedstate character varying(50),
    tostate character varying(50),
    actionstatus integer
);


ALTER TABLE public.sb_workflow_historystep OWNER TO silver;

--
-- TOC entry 324 (class 1259 OID 18789)
-- Name: sb_workflow_interesteduser; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_interesteduser (
    id integer NOT NULL,
    userid character varying(50),
    usersrole character varying(50),
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    groupid character varying(50)
);


ALTER TABLE public.sb_workflow_interesteduser OWNER TO silver;

--
-- TOC entry 325 (class 1259 OID 18792)
-- Name: sb_workflow_lockinguser; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_lockinguser (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    lockdate timestamp without time zone
);


ALTER TABLE public.sb_workflow_lockinguser OWNER TO silver;

--
-- TOC entry 326 (class 1259 OID 18795)
-- Name: sb_workflow_processinstance; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_processinstance (
    instanceid integer NOT NULL,
    modelid character varying(50) NOT NULL,
    locked numeric(1,0) NOT NULL,
    errorstatus numeric(1,0) DEFAULT 0 NOT NULL,
    timeoutstatus numeric(1,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.sb_workflow_processinstance OWNER TO silver;

--
-- TOC entry 327 (class 1259 OID 18800)
-- Name: sb_workflow_question; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_question (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    questiontext character varying(500) NOT NULL,
    responsetext character varying(500),
    questiondate timestamp without time zone NOT NULL,
    responsedate timestamp without time zone,
    fromstate character varying(50) NOT NULL,
    targetstate character varying(50) NOT NULL,
    fromuserid character varying(50) NOT NULL,
    touserid character varying(50) NOT NULL,
    relevant numeric(1,0) NOT NULL
);


ALTER TABLE public.sb_workflow_question OWNER TO silver;

--
-- TOC entry 328 (class 1259 OID 18805)
-- Name: sb_workflow_replacements; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_replacements (
    id character varying(40) NOT NULL,
    incumbentid character varying(40) NOT NULL,
    substituteid character varying(40) NOT NULL,
    workflowid character varying(40) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sb_workflow_replacements OWNER TO silver;

--
-- TOC entry 329 (class 1259 OID 18808)
-- Name: sb_workflow_undo_step; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_undo_step (
    id integer NOT NULL,
    stepid integer NOT NULL,
    instanceid integer NOT NULL,
    action character varying(20) NOT NULL,
    parameters character varying(150) NOT NULL
);


ALTER TABLE public.sb_workflow_undo_step OWNER TO silver;

--
-- TOC entry 330 (class 1259 OID 18811)
-- Name: sb_workflow_userinfo; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_userinfo (
    id integer NOT NULL,
    settingsid integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(100)
);


ALTER TABLE public.sb_workflow_userinfo OWNER TO silver;

--
-- TOC entry 331 (class 1259 OID 18814)
-- Name: sb_workflow_usersettings; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_usersettings (
    settingsid integer NOT NULL,
    userid character varying(100) NOT NULL,
    peasid character varying(100) NOT NULL
);


ALTER TABLE public.sb_workflow_usersettings OWNER TO silver;

--
-- TOC entry 332 (class 1259 OID 18817)
-- Name: sb_workflow_workinguser; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sb_workflow_workinguser (
    id integer NOT NULL,
    userid character varying(50),
    usersrole character varying(50),
    instanceid integer NOT NULL,
    state character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    groupid character varying(50)
);


ALTER TABLE public.sb_workflow_workinguser OWNER TO silver;

--
-- TOC entry 333 (class 1259 OID 18820)
-- Name: sc_blog_post; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_blog_post (
    pubid integer NOT NULL,
    dateevent character(13) DEFAULT '0000000000000'::bpchar NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_blog_post OWNER TO silver;

--
-- TOC entry 334 (class 1259 OID 18824)
-- Name: sc_classifieds_classifieds; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_classifieds_classifieds (
    classifiedid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(4000) NOT NULL,
    price integer,
    creatorid character varying(50) NOT NULL,
    creationdate character varying(13) NOT NULL,
    updatedate character varying(13),
    status character varying(50) NOT NULL,
    validatorid character varying(50),
    validatedate character varying(13)
);


ALTER TABLE public.sc_classifieds_classifieds OWNER TO silver;

--
-- TOC entry 335 (class 1259 OID 18829)
-- Name: sc_classifieds_subscribes; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_classifieds_subscribes (
    subscribeid integer NOT NULL,
    userid character varying(50) NOT NULL,
    instanceid character varying(50) NOT NULL,
    field1 character varying(100) NOT NULL,
    field2 character varying(100) NOT NULL
);


ALTER TABLE public.sc_classifieds_subscribes OWNER TO silver;

--
-- TOC entry 336 (class 1259 OID 18832)
-- Name: sc_community; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_community (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    spaceid character varying(30) NOT NULL,
    groupid integer,
    homepage character varying(400),
    homepagetype integer,
    charterurl character varying(400)
);


ALTER TABLE public.sc_community OWNER TO silver;

--
-- TOC entry 337 (class 1259 OID 18837)
-- Name: sc_community_membership; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_community_membership (
    id character varying(40) NOT NULL,
    community character varying(40) NOT NULL,
    userid integer NOT NULL,
    status character varying(15) NOT NULL,
    joiningdate timestamp without time zone,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_community_membership OWNER TO silver;

--
-- TOC entry 338 (class 1259 OID 18840)
-- Name: sc_connecteurjdbc_connectinfo; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_connecteurjdbc_connectinfo (
    id integer NOT NULL,
    datasource character varying(250),
    login character varying(250),
    password character varying(250),
    sqlreq character varying(4000),
    rowlimit integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_connecteurjdbc_connectinfo OWNER TO silver;

--
-- TOC entry 339 (class 1259 OID 18845)
-- Name: sc_contact_groupfather; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_contact_groupfather (
    groupid integer NOT NULL,
    fatherid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_contact_groupfather OWNER TO silver;

--
-- TOC entry 340 (class 1259 OID 18848)
-- Name: sc_delegatednews_news; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_delegatednews_news (
    pubid integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    status character varying(100) NOT NULL,
    contributorid character varying(50) NOT NULL,
    validatorid character varying(50),
    validationdate timestamp(0) without time zone,
    begindate timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    newsorder integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sc_delegatednews_news OWNER TO silver;

--
-- TOC entry 341 (class 1259 OID 18852)
-- Name: sc_formsonline_forminstances; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_formsonline_forminstances (
    id integer NOT NULL,
    formid integer NOT NULL,
    state integer NOT NULL,
    creatorid character varying(20) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_formsonline_forminstances OWNER TO silver;

--
-- TOC entry 342 (class 1259 OID 18855)
-- Name: sc_formsonline_forminstvali; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_formsonline_forminstvali (
    id integer NOT NULL,
    forminstid integer NOT NULL,
    validationby character varying(40) NOT NULL,
    validationtype character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    validationdate timestamp without time zone NOT NULL,
    validationcomment character varying(4000) DEFAULT NULL::character varying,
    follower boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sc_formsonline_forminstvali OWNER TO silver;

--
-- TOC entry 343 (class 1259 OID 18862)
-- Name: sc_formsonline_forms; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_formsonline_forms (
    id integer NOT NULL,
    xmlformname character varying(80) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(1000),
    creationdate timestamp without time zone NOT NULL,
    state integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    alreadyused smallint DEFAULT 0 NOT NULL,
    creatorid character varying(20) NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    hierarchicalvalidation boolean DEFAULT false NOT NULL,
    forminstexchangereceiver character varying(200) DEFAULT NULL::character varying,
    deleteafterforminstexchange boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sc_formsonline_forms OWNER TO silver;

--
-- TOC entry 344 (class 1259 OID 18872)
-- Name: sc_formsonline_grouprights; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_formsonline_grouprights (
    formid integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    groupid character varying(20) NOT NULL,
    righttype character varying(1) NOT NULL
);


ALTER TABLE public.sc_formsonline_grouprights OWNER TO silver;

--
-- TOC entry 345 (class 1259 OID 18875)
-- Name: sc_formsonline_userrights; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_formsonline_userrights (
    formid integer NOT NULL,
    instanceid character varying(80) NOT NULL,
    userid character varying(20) NOT NULL,
    righttype character varying(1) NOT NULL
);


ALTER TABLE public.sc_formsonline_userrights OWNER TO silver;

--
-- TOC entry 346 (class 1259 OID 18878)
-- Name: sc_forums_forum; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_forums_forum (
    forumid integer NOT NULL,
    forumname character varying(1000) NOT NULL,
    forumdescription character varying(2000),
    forumcreationdate character varying(50) NOT NULL,
    forumclosedate character varying(50),
    forumcreator character varying(255) NOT NULL,
    forumactive integer NOT NULL,
    forumparent integer DEFAULT 0 NOT NULL,
    forummodes character varying(50),
    forumlocklevel integer,
    instanceid character varying(50) NOT NULL,
    categoryid character varying(50)
);


ALTER TABLE public.sc_forums_forum OWNER TO silver;

--
-- TOC entry 347 (class 1259 OID 18884)
-- Name: sc_forums_historyuser; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_forums_historyuser (
    userid character varying(255) NOT NULL,
    messageid integer NOT NULL,
    lastaccess character varying(50) NOT NULL
);


ALTER TABLE public.sc_forums_historyuser OWNER TO silver;

--
-- TOC entry 348 (class 1259 OID 18887)
-- Name: sc_forums_message; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_forums_message (
    messageid integer NOT NULL,
    messagetitle character varying(1000) NOT NULL,
    messageauthor character varying(255) NOT NULL,
    forumid integer NOT NULL,
    messageparentid integer,
    messagedate timestamp without time zone,
    status character varying(50)
);


ALTER TABLE public.sc_forums_message OWNER TO silver;

--
-- TOC entry 349 (class 1259 OID 18892)
-- Name: sc_forums_rights; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_forums_rights (
    userid character varying(255) NOT NULL,
    forumid character varying(255) NOT NULL
);


ALTER TABLE public.sc_forums_rights OWNER TO silver;

--
-- TOC entry 350 (class 1259 OID 18897)
-- Name: sc_gallery_internal; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_internal (
    mediaid character varying(40) NOT NULL,
    filename character varying(255),
    filesize bigint,
    filemimetype character varying(100),
    download integer,
    begindownloaddate bigint,
    enddownloaddate bigint
);


ALTER TABLE public.sc_gallery_internal OWNER TO silver;

--
-- TOC entry 351 (class 1259 OID 18900)
-- Name: sc_gallery_media; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_media (
    mediaid character varying(40) NOT NULL,
    mediatype character varying(30) NOT NULL,
    instanceid character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    author character varying(50),
    keyword character varying(1000),
    beginvisibilitydate bigint DEFAULT '-2208992400000'::bigint NOT NULL,
    endvisibilitydate bigint DEFAULT '32503676399999'::bigint NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(50) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(50)
);


ALTER TABLE public.sc_gallery_media OWNER TO silver;

--
-- TOC entry 352 (class 1259 OID 18907)
-- Name: sc_gallery_order; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_order (
    orderid character varying(40) NOT NULL,
    userid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    createdate timestamp without time zone NOT NULL,
    processdate timestamp without time zone,
    processuser character varying(50)
);


ALTER TABLE public.sc_gallery_order OWNER TO silver;

--
-- TOC entry 353 (class 1259 OID 18910)
-- Name: sc_gallery_orderdetail; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_orderdetail (
    orderid character varying(40) NOT NULL,
    mediaid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    downloaddate timestamp without time zone,
    downloaddecision character varying(50)
);


ALTER TABLE public.sc_gallery_orderdetail OWNER TO silver;

--
-- TOC entry 354 (class 1259 OID 18913)
-- Name: sc_gallery_path; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_path (
    mediaid character varying(40) NOT NULL,
    instanceid character varying(50) NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE public.sc_gallery_path OWNER TO silver;

--
-- TOC entry 355 (class 1259 OID 18916)
-- Name: sc_gallery_photo; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_photo (
    mediaid character varying(40) NOT NULL,
    resolutionw integer,
    resolutionh integer
);


ALTER TABLE public.sc_gallery_photo OWNER TO silver;

--
-- TOC entry 356 (class 1259 OID 18919)
-- Name: sc_gallery_sound; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_sound (
    mediaid character varying(40) NOT NULL,
    bitrate bigint,
    duration bigint
);


ALTER TABLE public.sc_gallery_sound OWNER TO silver;

--
-- TOC entry 357 (class 1259 OID 18922)
-- Name: sc_gallery_streaming; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_streaming (
    mediaid character varying(40) NOT NULL,
    homepageurl character varying(1000) NOT NULL,
    provider character varying(50) NOT NULL
);


ALTER TABLE public.sc_gallery_streaming OWNER TO silver;

--
-- TOC entry 358 (class 1259 OID 18927)
-- Name: sc_gallery_video; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_gallery_video (
    mediaid character varying(40) NOT NULL,
    resolutionw integer,
    resolutionh integer,
    bitrate bigint,
    duration bigint
);


ALTER TABLE public.sc_gallery_video OWNER TO silver;

--
-- TOC entry 359 (class 1259 OID 18930)
-- Name: sc_il_extsus; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_il_extsus (
    letter integer NOT NULL,
    email character varying(1000) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_extsus OWNER TO silver;

--
-- TOC entry 360 (class 1259 OID 18935)
-- Name: sc_il_letter; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_il_letter (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000),
    periode character varying(255),
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_letter OWNER TO silver;

--
-- TOC entry 361 (class 1259 OID 18940)
-- Name: sc_il_publication; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_il_publication (
    id integer NOT NULL,
    title character varying(1000) NOT NULL,
    description character varying(2000),
    parutiondate character varying(255),
    publicationstate integer NOT NULL,
    letterid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_il_publication OWNER TO silver;

--
-- TOC entry 362 (class 1259 OID 18945)
-- Name: sc_kmelia_search; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_kmelia_search (
    id bigint NOT NULL,
    instanceid character varying(50),
    topicid integer NOT NULL,
    userid integer NOT NULL,
    searchdate timestamp without time zone NOT NULL,
    language character varying(50),
    query character varying(255)
);


ALTER TABLE public.sc_kmelia_search OWNER TO silver;

--
-- TOC entry 363 (class 1259 OID 18948)
-- Name: sc_mailinglist_attachment; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mailinglist_attachment (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    attachmentsize bigint,
    attachmentpath character varying(255),
    filename character varying(255),
    contenttype character varying(255),
    md5signature character varying(255),
    messageid character varying(255)
);


ALTER TABLE public.sc_mailinglist_attachment OWNER TO silver;

--
-- TOC entry 364 (class 1259 OID 18953)
-- Name: sc_mailinglist_external_user; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mailinglist_external_user (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    componentid character varying(255),
    email character varying(255) NOT NULL,
    listid character varying(255)
);


ALTER TABLE public.sc_mailinglist_external_user OWNER TO silver;

--
-- TOC entry 365 (class 1259 OID 18958)
-- Name: sc_mailinglist_internal_sub; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mailinglist_internal_sub (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    subscriber_type character varying(255) NOT NULL,
    externalid character varying(255) NOT NULL,
    mailinglistid character varying(255) NOT NULL
);


ALTER TABLE public.sc_mailinglist_internal_sub OWNER TO silver;

--
-- TOC entry 366 (class 1259 OID 18963)
-- Name: sc_mailinglist_list; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mailinglist_list (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    componentid character varying(255)
);


ALTER TABLE public.sc_mailinglist_list OWNER TO silver;

--
-- TOC entry 367 (class 1259 OID 18968)
-- Name: sc_mailinglist_message; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mailinglist_message (
    id character varying(255) NOT NULL,
    version integer NOT NULL,
    mailid character varying(255) NOT NULL,
    componentid character varying(255) NOT NULL,
    title character varying(255),
    summary character varying(255),
    sender character varying(255),
    sentdate timestamp without time zone,
    referenceid character varying(255),
    moderated boolean,
    contenttype character varying(255),
    attachmentssize bigint,
    messageyear integer,
    messagemonth integer,
    body text
);


ALTER TABLE public.sc_mailinglist_message OWNER TO silver;

--
-- TOC entry 368 (class 1259 OID 18973)
-- Name: sc_mydb_connectinfo; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_mydb_connectinfo (
    id integer NOT NULL,
    datasource character varying(250),
    login character varying(250),
    password character varying(250),
    tablename character varying(100),
    rowlimit integer,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_mydb_connectinfo OWNER TO silver;

--
-- TOC entry 369 (class 1259 OID 18978)
-- Name: sc_projectmanager_calendar; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_projectmanager_calendar (
    holidaydate character varying(10) NOT NULL,
    fatherid integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_projectmanager_calendar OWNER TO silver;

--
-- TOC entry 370 (class 1259 OID 18981)
-- Name: sc_projectmanager_resources; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_projectmanager_resources (
    id integer NOT NULL,
    taskid integer NOT NULL,
    resourceid integer NOT NULL,
    charge integer NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_projectmanager_resources OWNER TO silver;

--
-- TOC entry 371 (class 1259 OID 18984)
-- Name: sc_projectmanager_tasks; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_projectmanager_tasks (
    id integer NOT NULL,
    mereid integer,
    chrono integer NOT NULL,
    nom character varying(100) NOT NULL,
    description character varying(500),
    organisateurid integer NOT NULL,
    responsableid integer NOT NULL,
    charge double precision,
    consomme double precision,
    raf double precision,
    avancement integer,
    statut integer,
    datedebut character varying(10) NOT NULL,
    datefin character varying(10) NOT NULL,
    codeprojet character varying(50),
    descriptionprojet character varying(100),
    estdecomposee integer,
    instanceid character varying(50) NOT NULL,
    path character varying(50) NOT NULL,
    previousid integer
);


ALTER TABLE public.sc_projectmanager_tasks OWNER TO silver;

--
-- TOC entry 372 (class 1259 OID 18989)
-- Name: sc_questionreply_question; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_questionreply_question (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    content character varying(2000),
    creatorid character varying(50) NOT NULL,
    creationdate character varying(10) NOT NULL,
    status integer NOT NULL,
    publicreplynumber integer NOT NULL,
    privatereplynumber integer NOT NULL,
    replynumber integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    categoryid character varying(50)
);


ALTER TABLE public.sc_questionreply_question OWNER TO silver;

--
-- TOC entry 373 (class 1259 OID 18994)
-- Name: sc_questionreply_recipient; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_questionreply_recipient (
    id integer NOT NULL,
    questionid integer NOT NULL,
    userid character varying(50) NOT NULL
);


ALTER TABLE public.sc_questionreply_recipient OWNER TO silver;

--
-- TOC entry 374 (class 1259 OID 18997)
-- Name: sc_questionreply_reply; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_questionreply_reply (
    id integer NOT NULL,
    questionid integer NOT NULL,
    title character varying(300) NOT NULL,
    content character varying(2000),
    creatorid character varying(50) NOT NULL,
    creationdate character varying(10) NOT NULL,
    publicreply integer NOT NULL,
    privatereply integer NOT NULL
);


ALTER TABLE public.sc_questionreply_reply OWNER TO silver;

--
-- TOC entry 375 (class 1259 OID 19002)
-- Name: sc_quickinfo_news; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_quickinfo_news (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    foreignid character varying(40) NOT NULL,
    important boolean NOT NULL,
    broadcastticker boolean NOT NULL,
    broadcastmandatory boolean NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    publishdate timestamp without time zone,
    publishedby character varying(40),
    version bigint NOT NULL
);


ALTER TABLE public.sc_quickinfo_news OWNER TO silver;

--
-- TOC entry 376 (class 1259 OID 19005)
-- Name: sc_resources_category; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_resources_category (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    bookable integer,
    form character varying(50),
    responsibleid integer,
    createrid character varying(50),
    updaterid character varying(50),
    description character varying(2000)
);


ALTER TABLE public.sc_resources_category OWNER TO silver;

--
-- TOC entry 377 (class 1259 OID 19010)
-- Name: sc_resources_managers; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_resources_managers (
    resourceid bigint NOT NULL,
    managerid bigint NOT NULL
);


ALTER TABLE public.sc_resources_managers OWNER TO silver;

--
-- TOC entry 378 (class 1259 OID 19013)
-- Name: sc_resources_reservation; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_resources_reservation (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    evenement character varying(128) NOT NULL,
    userid integer NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    begindate character varying(20) NOT NULL,
    enddate character varying(20) NOT NULL,
    reason character varying(2000),
    place character varying(128),
    status character varying(50)
);


ALTER TABLE public.sc_resources_reservation OWNER TO silver;

--
-- TOC entry 379 (class 1259 OID 19018)
-- Name: sc_resources_reservedresource; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_resources_reservedresource (
    reservationid bigint NOT NULL,
    resourceid bigint NOT NULL,
    status character varying(50)
);


ALTER TABLE public.sc_resources_reservedresource OWNER TO silver;

--
-- TOC entry 380 (class 1259 OID 19021)
-- Name: sc_resources_resource; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_resources_resource (
    id bigint NOT NULL,
    instanceid character varying(50) NOT NULL,
    categoryid bigint NOT NULL,
    name character varying(128) NOT NULL,
    creationdate character varying(20) NOT NULL,
    updatedate character varying(20) NOT NULL,
    bookable integer,
    responsibleid integer,
    createrid character varying(50),
    updaterid character varying(50),
    description character varying(2000)
);


ALTER TABLE public.sc_resources_resource OWNER TO silver;

--
-- TOC entry 381 (class 1259 OID 19026)
-- Name: sc_rss_channels; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_rss_channels (
    id integer NOT NULL,
    url character varying(1000) NOT NULL,
    safeurl boolean DEFAULT false NOT NULL,
    refreshrate integer NOT NULL,
    nbdisplayeditems integer NOT NULL,
    displayimage integer NOT NULL,
    creatorid character varying(100) NOT NULL,
    creationdate character(10) NOT NULL,
    instanceid character varying(50) NOT NULL
);


ALTER TABLE public.sc_rss_channels OWNER TO silver;

--
-- TOC entry 382 (class 1259 OID 19032)
-- Name: sc_scheduleevent_contributor; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_scheduleevent_contributor (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    userid integer NOT NULL,
    lastvalidation timestamp without time zone,
    lastvisit timestamp without time zone
);


ALTER TABLE public.sc_scheduleevent_contributor OWNER TO silver;

--
-- TOC entry 383 (class 1259 OID 19037)
-- Name: sc_scheduleevent_list; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_scheduleevent_list (
    id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(4000),
    creationdate timestamp without time zone NOT NULL,
    status integer NOT NULL,
    creatorid integer NOT NULL
);


ALTER TABLE public.sc_scheduleevent_list OWNER TO silver;

--
-- TOC entry 384 (class 1259 OID 19042)
-- Name: sc_scheduleevent_options; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_scheduleevent_options (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    optionday timestamp without time zone NOT NULL,
    optionhour integer NOT NULL
);


ALTER TABLE public.sc_scheduleevent_options OWNER TO silver;

--
-- TOC entry 385 (class 1259 OID 19047)
-- Name: sc_scheduleevent_response; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_scheduleevent_response (
    id character varying(255) NOT NULL,
    scheduleeventid character varying(255) NOT NULL,
    userid integer NOT NULL,
    optionid character varying(255) NOT NULL
);


ALTER TABLE public.sc_scheduleevent_response OWNER TO silver;

--
-- TOC entry 386 (class 1259 OID 19052)
-- Name: sc_silvercrawler_statistic; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_silvercrawler_statistic (
    datedownload character(13) NOT NULL,
    userid character varying(100) NOT NULL,
    path character varying(1000) NOT NULL,
    componentid character varying(50) NOT NULL,
    objecttype character varying(50) NOT NULL
);


ALTER TABLE public.sc_silvercrawler_statistic OWNER TO silver;

--
-- TOC entry 387 (class 1259 OID 19057)
-- Name: sc_suggestion; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_suggestion (
    id character varying(40) NOT NULL,
    suggestionboxid character varying(40) NOT NULL,
    title character varying(2000) NOT NULL,
    status character varying(20) NOT NULL,
    validationdate timestamp without time zone,
    validationcomment character varying(2000),
    validationby character varying(40),
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_suggestion OWNER TO silver;

--
-- TOC entry 388 (class 1259 OID 19062)
-- Name: sc_suggestion_box; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_suggestion_box (
    id character varying(40) NOT NULL,
    instanceid character varying(30) NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.sc_suggestion_box OWNER TO silver;

--
-- TOC entry 389 (class 1259 OID 19065)
-- Name: sc_websites_icons; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_websites_icons (
    iconsid integer NOT NULL,
    iconsname character varying(1000) NOT NULL,
    iconsdescription character varying(2000) NOT NULL,
    iconsaddress character varying(1000) NOT NULL
);


ALTER TABLE public.sc_websites_icons OWNER TO silver;

--
-- TOC entry 390 (class 1259 OID 19070)
-- Name: sc_websites_site; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_websites_site (
    siteid integer NOT NULL,
    sitename character varying(1000) NOT NULL,
    sitedescription character varying(2000),
    sitepage character varying(1000) NOT NULL,
    sitetype integer NOT NULL,
    siteauthor character varying(1000) NOT NULL,
    sitedate character varying(10) NOT NULL,
    sitestate integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    popup integer NOT NULL
);


ALTER TABLE public.sc_websites_site OWNER TO silver;

--
-- TOC entry 391 (class 1259 OID 19075)
-- Name: sc_websites_siteicons; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_websites_siteicons (
    siteid integer NOT NULL,
    iconsid integer NOT NULL
);


ALTER TABLE public.sc_websites_siteicons OWNER TO silver;

--
-- TOC entry 392 (class 1259 OID 19078)
-- Name: sc_whitepages_card; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_whitepages_card (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    hidestatus integer NOT NULL,
    instanceid character varying(50) NOT NULL,
    creationdate character(10) DEFAULT '2003/01/01'::bpchar NOT NULL,
    creatorid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sc_whitepages_card OWNER TO silver;

--
-- TOC entry 393 (class 1259 OID 19083)
-- Name: sc_whitepages_searchfields; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sc_whitepages_searchfields (
    id character varying(255) NOT NULL,
    instanceid character varying(50) NOT NULL,
    fieldid character varying(50) NOT NULL
);


ALTER TABLE public.sc_whitepages_searchfields OWNER TO silver;

--
-- TOC entry 394 (class 1259 OID 19086)
-- Name: sr_packages; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.sr_packages (
    sr_package character varying(32) NOT NULL,
    sr_version character(3) NOT NULL
);


ALTER TABLE public.sr_packages OWNER TO silver;

--
-- TOC entry 395 (class 1259 OID 19089)
-- Name: st_accesslevel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_accesslevel (
    id character(1) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.st_accesslevel OWNER TO silver;

--
-- TOC entry 396 (class 1259 OID 19092)
-- Name: st_componentinstance; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_componentinstance (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    name character varying(100) NOT NULL,
    componentname character varying(100) NOT NULL,
    description character varying(400),
    createdby integer,
    ordernum integer DEFAULT 0 NOT NULL,
    createtime character varying(20),
    updatetime character varying(20),
    removetime character varying(20),
    componentstatus character(1),
    updatedby integer,
    removedby integer,
    ispublic integer DEFAULT 0 NOT NULL,
    ishidden integer DEFAULT 0 NOT NULL,
    lang character(2),
    isinheritanceblocked integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.st_componentinstance OWNER TO silver;

--
-- TOC entry 397 (class 1259 OID 19101)
-- Name: st_componentinstancei18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_componentinstancei18n (
    id integer NOT NULL,
    componentid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.st_componentinstancei18n OWNER TO silver;

--
-- TOC entry 398 (class 1259 OID 19106)
-- Name: st_datereminder; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_datereminder (
    id character varying(40) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    datereminder timestamp without time zone NOT NULL,
    message character varying(2000),
    processstatus integer DEFAULT 0 NOT NULL,
    createdate timestamp without time zone NOT NULL,
    createdby character varying(40) NOT NULL,
    lastupdatedate timestamp without time zone NOT NULL,
    lastupdatedby character varying(40) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.st_datereminder OWNER TO silver;

--
-- TOC entry 399 (class 1259 OID 19112)
-- Name: st_delayednotification; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_delayednotification (
    id bigint NOT NULL,
    userid integer NOT NULL,
    fromuserid integer NOT NULL,
    channel integer NOT NULL,
    action integer NOT NULL,
    notificationresourceid bigint NOT NULL,
    language character varying(2) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    message character varying(10000)
);


ALTER TABLE public.st_delayednotification OWNER TO silver;

--
-- TOC entry 400 (class 1259 OID 19117)
-- Name: st_delayednotifusersetting; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_delayednotifusersetting (
    id integer NOT NULL,
    userid integer NOT NULL,
    channel integer NOT NULL,
    frequency character varying(4) NOT NULL
);


ALTER TABLE public.st_delayednotifusersetting OWNER TO silver;

--
-- TOC entry 401 (class 1259 OID 19120)
-- Name: st_domain; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_domain (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400),
    propfilename character varying(100) NOT NULL,
    classname character varying(100) NOT NULL,
    authenticationserver character varying(100) NOT NULL,
    thetimestamp character varying(100) DEFAULT '0'::character varying NOT NULL,
    silverpeasserverurl character varying(400)
);


ALTER TABLE public.st_domain OWNER TO silver;

--
-- TOC entry 402 (class 1259 OID 19126)
-- Name: st_formdesigner_connectors; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_formdesigner_connectors (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000) NOT NULL,
    driver character varying(1000) NOT NULL,
    url character varying(1000) NOT NULL,
    login character varying(1000) NOT NULL,
    passwd character varying(1000),
    sqlquery character varying(4000) NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE public.st_formdesigner_connectors OWNER TO silver;

--
-- TOC entry 403 (class 1259 OID 19131)
-- Name: st_formdesigner_formdesign; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_formdesigner_formdesign (
    id integer NOT NULL,
    refidform integer NOT NULL,
    componentid character varying(100) NOT NULL,
    name character varying(1000) NOT NULL,
    description character varying(2000) NOT NULL,
    creationdate character varying(10) NOT NULL,
    author integer NOT NULL
);


ALTER TABLE public.st_formdesigner_formdesign OWNER TO silver;

--
-- TOC entry 404 (class 1259 OID 19136)
-- Name: st_formeditor_formedited; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_formeditor_formedited (
    id integer NOT NULL,
    formid integer NOT NULL,
    userid integer NOT NULL,
    createdate character varying(10) NOT NULL,
    modifydate character varying(10) NOT NULL
);


ALTER TABLE public.st_formeditor_formedited OWNER TO silver;

--
-- TOC entry 405 (class 1259 OID 19139)
-- Name: st_formeditor_formediteddata; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_formeditor_formediteddata (
    id integer NOT NULL,
    formeditedid integer NOT NULL,
    editedkey character varying(50) NOT NULL,
    editedvalue character varying(500) NOT NULL
);


ALTER TABLE public.st_formeditor_formediteddata OWNER TO silver;

--
-- TOC entry 406 (class 1259 OID 19144)
-- Name: st_group; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_group (
    id integer NOT NULL,
    domainid integer NOT NULL,
    specificid character varying(500) NOT NULL,
    supergroupid integer,
    name character varying(100) NOT NULL,
    description character varying(400),
    synchrorule character varying(2000),
    creationdate timestamp without time zone,
    savedate timestamp without time zone,
    state character varying(30) NOT NULL,
    statesavedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_group OWNER TO silver;

--
-- TOC entry 407 (class 1259 OID 19149)
-- Name: st_group_user_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_group_user_rel (
    groupid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_group_user_rel OWNER TO silver;

--
-- TOC entry 408 (class 1259 OID 19152)
-- Name: st_groupuserrole; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_groupuserrole (
    id integer NOT NULL,
    groupid integer NOT NULL,
    rolename character varying(100) NOT NULL
);


ALTER TABLE public.st_groupuserrole OWNER TO silver;

--
-- TOC entry 409 (class 1259 OID 19155)
-- Name: st_groupuserrole_group_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_groupuserrole_group_rel (
    groupuserroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_groupuserrole_group_rel OWNER TO silver;

--
-- TOC entry 410 (class 1259 OID 19158)
-- Name: st_groupuserrole_user_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_groupuserrole_user_rel (
    groupuserroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_groupuserrole_user_rel OWNER TO silver;

--
-- TOC entry 411 (class 1259 OID 19161)
-- Name: st_instance_data; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_instance_data (
    id integer NOT NULL,
    componentid integer NOT NULL,
    name character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    value character varying(1000)
);


ALTER TABLE public.st_instance_data OWNER TO silver;

--
-- TOC entry 412 (class 1259 OID 19166)
-- Name: st_instance_modelused; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_instance_modelused (
    instanceid character varying(50) NOT NULL,
    modelid character varying(50) NOT NULL,
    objectid character varying(50) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.st_instance_modelused OWNER TO silver;

--
-- TOC entry 413 (class 1259 OID 19170)
-- Name: st_keystore; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_keystore (
    userkey numeric(18,0) NOT NULL,
    login character varying(100) NOT NULL,
    domainid integer NOT NULL
);


ALTER TABLE public.st_keystore OWNER TO silver;

--
-- TOC entry 414 (class 1259 OID 19173)
-- Name: st_longtext; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_longtext (
    id integer NOT NULL,
    ordernum integer NOT NULL,
    bodycontent character varying(2000) NOT NULL
);


ALTER TABLE public.st_longtext OWNER TO silver;

--
-- TOC entry 415 (class 1259 OID 19178)
-- Name: st_notifaddress; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifaddress (
    id integer NOT NULL,
    userid integer NOT NULL,
    notifname character varying(20) NOT NULL,
    notifchannelid integer NOT NULL,
    address character varying(250) NOT NULL,
    usage character varying(20),
    priority integer NOT NULL
);


ALTER TABLE public.st_notifaddress OWNER TO silver;

--
-- TOC entry 416 (class 1259 OID 19181)
-- Name: st_notifchannel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifchannel (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(200),
    couldbeadded character(1) DEFAULT 'Y'::bpchar NOT NULL,
    fromavailable character(1) DEFAULT 'N'::bpchar NOT NULL,
    subjectavailable character(1) DEFAULT 'N'::bpchar NOT NULL
);


ALTER TABLE public.st_notifchannel OWNER TO silver;

--
-- TOC entry 417 (class 1259 OID 19187)
-- Name: st_notifdefaultaddress; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifdefaultaddress (
    id integer NOT NULL,
    userid integer NOT NULL,
    notifaddressid integer NOT NULL
);


ALTER TABLE public.st_notifdefaultaddress OWNER TO silver;

--
-- TOC entry 418 (class 1259 OID 19190)
-- Name: st_notificationresource; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notificationresource (
    id bigint NOT NULL,
    componentinstanceid character varying(50) NOT NULL,
    resourceid character varying(500) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    resourcename character varying(500) NOT NULL,
    resourcedescription character varying(2000),
    resourcelocation character varying(500) NOT NULL,
    resourceurl character varying(1000),
    attachmenttargetid character varying(500),
    resourcedetails character varying(8000)
);


ALTER TABLE public.st_notificationresource OWNER TO silver;

--
-- TOC entry 419 (class 1259 OID 19195)
-- Name: st_notifpreference; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifpreference (
    id integer NOT NULL,
    notifaddressid integer NOT NULL,
    componentinstanceid integer NOT NULL,
    userid integer NOT NULL,
    messagetype integer NOT NULL
);


ALTER TABLE public.st_notifpreference OWNER TO silver;

--
-- TOC entry 420 (class 1259 OID 19198)
-- Name: st_notifsended; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifsended (
    notifid integer NOT NULL,
    userid integer NOT NULL,
    messagetype integer,
    notifdate character(13) NOT NULL,
    title character varying(1024),
    link character varying(255),
    sessionid character varying(255),
    componentid character varying(255),
    body integer
);


ALTER TABLE public.st_notifsended OWNER TO silver;

--
-- TOC entry 421 (class 1259 OID 19203)
-- Name: st_notifsendedreceiver; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_notifsendedreceiver (
    notifid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_notifsendedreceiver OWNER TO silver;

--
-- TOC entry 422 (class 1259 OID 19206)
-- Name: st_popupmessage; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_popupmessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    body character varying(4000),
    senderid character varying(10),
    sendername character varying(200),
    answerallowed character(1) DEFAULT '0'::bpchar,
    source character varying(255),
    url character varying(255),
    msgdate character varying(10),
    msgtime character varying(5)
);


ALTER TABLE public.st_popupmessage OWNER TO silver;

--
-- TOC entry 423 (class 1259 OID 19212)
-- Name: st_quota; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_quota (
    id bigint NOT NULL,
    quotatype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    mincount bigint NOT NULL,
    maxcount bigint NOT NULL,
    currentcount bigint NOT NULL,
    savedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_quota OWNER TO silver;

--
-- TOC entry 424 (class 1259 OID 19215)
-- Name: st_servermessage; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_servermessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    header character varying(255),
    subject character varying(1024),
    body character varying(4000),
    sessionid character varying(255),
    type character(1)
);


ALTER TABLE public.st_servermessage OWNER TO silver;

--
-- TOC entry 425 (class 1259 OID 19220)
-- Name: st_silvermailmessage; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_silvermailmessage (
    id integer NOT NULL,
    userid integer NOT NULL,
    folderid integer,
    header character varying(255),
    sendername character varying(255),
    subject character varying(1024),
    body character varying(4000),
    source character varying(255),
    url character varying(255),
    datemsg character varying(255),
    readen integer NOT NULL
);


ALTER TABLE public.st_silvermailmessage OWNER TO silver;

--
-- TOC entry 426 (class 1259 OID 19225)
-- Name: st_space; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_space (
    id integer NOT NULL,
    domainfatherid integer,
    name character varying(100) NOT NULL,
    description character varying(400),
    createdby integer,
    firstpagetype integer NOT NULL,
    firstpageextraparam character varying(400),
    ordernum integer DEFAULT 0 NOT NULL,
    createtime character varying(20),
    updatetime character varying(20),
    removetime character varying(20),
    spacestatus character(1),
    updatedby integer,
    removedby integer,
    lang character(2),
    isinheritanceblocked integer DEFAULT 0 NOT NULL,
    look character varying(50),
    displayspacefirst smallint,
    ispersonal smallint
);


ALTER TABLE public.st_space OWNER TO silver;

--
-- TOC entry 427 (class 1259 OID 19232)
-- Name: st_spacei18n; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_spacei18n (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    lang character(2) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(400)
);


ALTER TABLE public.st_spacei18n OWNER TO silver;

--
-- TOC entry 428 (class 1259 OID 19237)
-- Name: st_spaceuserrole; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_spaceuserrole (
    id integer NOT NULL,
    spaceid integer NOT NULL,
    name character varying(100),
    rolename character varying(100) NOT NULL,
    description character varying(400),
    isinherited integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.st_spaceuserrole OWNER TO silver;

--
-- TOC entry 429 (class 1259 OID 19243)
-- Name: st_spaceuserrole_group_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_spaceuserrole_group_rel (
    spaceuserroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_spaceuserrole_group_rel OWNER TO silver;

--
-- TOC entry 430 (class 1259 OID 19246)
-- Name: st_spaceuserrole_user_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_spaceuserrole_user_rel (
    spaceuserroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_spaceuserrole_user_rel OWNER TO silver;

--
-- TOC entry 431 (class 1259 OID 19249)
-- Name: st_token; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_token (
    id bigint NOT NULL,
    tokentype character varying(50) NOT NULL,
    resourceid character varying(50) NOT NULL,
    token character varying(50) NOT NULL,
    savecount integer NOT NULL,
    savedate timestamp without time zone NOT NULL
);


ALTER TABLE public.st_token OWNER TO silver;

--
-- TOC entry 432 (class 1259 OID 19252)
-- Name: st_user; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_user (
    id integer NOT NULL,
    domainid integer NOT NULL,
    specificid character varying(500) NOT NULL,
    firstname character varying(100),
    lastname character varying(100) NOT NULL,
    email character varying(100),
    login character varying(100) NOT NULL,
    loginmail character varying(100),
    accesslevel character(1) DEFAULT 'U'::bpchar NOT NULL,
    loginquestion character varying(200),
    loginanswer character varying(200),
    creationdate timestamp without time zone,
    savedate timestamp without time zone,
    version integer DEFAULT 0 NOT NULL,
    tosacceptancedate timestamp without time zone,
    lastlogindate timestamp without time zone,
    nbsuccessfulloginattempts integer DEFAULT 0 NOT NULL,
    lastlogincredentialupdatedate timestamp without time zone,
    expirationdate timestamp without time zone,
    state character varying(30) NOT NULL,
    statesavedate timestamp without time zone NOT NULL,
    notifmanualreceiverlimit integer,
    sensitivedata boolean DEFAULT false NOT NULL
);


ALTER TABLE public.st_user OWNER TO silver;

--
-- TOC entry 433 (class 1259 OID 19261)
-- Name: st_userfavoritespaces; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_userfavoritespaces (
    id integer NOT NULL,
    userid integer NOT NULL,
    spaceid integer NOT NULL
);


ALTER TABLE public.st_userfavoritespaces OWNER TO silver;

--
-- TOC entry 434 (class 1259 OID 19264)
-- Name: st_userrole; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_userrole (
    id integer NOT NULL,
    instanceid integer NOT NULL,
    name character varying(100),
    rolename character varying(100) NOT NULL,
    description character varying(400),
    isinherited integer DEFAULT 0 NOT NULL,
    objectid integer,
    objecttype character varying(50)
);


ALTER TABLE public.st_userrole OWNER TO silver;

--
-- TOC entry 435 (class 1259 OID 19270)
-- Name: st_userrole_group_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_userrole_group_rel (
    userroleid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.st_userrole_group_rel OWNER TO silver;

--
-- TOC entry 436 (class 1259 OID 19273)
-- Name: st_userrole_user_rel; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.st_userrole_user_rel (
    userroleid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.st_userrole_user_rel OWNER TO silver;

--
-- TOC entry 437 (class 1259 OID 19276)
-- Name: subscribe; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.subscribe (
    subscriberid character varying(100) NOT NULL,
    subscribertype character varying(50) NOT NULL,
    subscriptionmethod character varying(50) NOT NULL,
    resourceid character varying(100) NOT NULL,
    resourcetype character varying(50) NOT NULL,
    space character varying(50) NOT NULL,
    instanceid character varying(50) NOT NULL,
    creatorid character varying(100) NOT NULL,
    creationdate timestamp without time zone NOT NULL
);


ALTER TABLE public.subscribe OWNER TO silver;

--
-- TOC entry 438 (class 1259 OID 19281)
-- Name: uniqueid; Type: TABLE; Schema: public; Owner: silver
--

CREATE TABLE public.uniqueid (
    maxid bigint NOT NULL,
    tablename character varying(100) NOT NULL
);


ALTER TABLE public.uniqueid OWNER TO silver;

--
-- TOC entry 4920 (class 0 OID 18320)
-- Dependencies: 209
-- Data for Name: calendarcategory; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendarcategory (categoryid, name) FROM stdin;
1	Réunion
2	Déplacement
3	Vacances
4	Personnel
5	Brain Storming
6	Formation
\.


--
-- TOC entry 4921 (class 0 OID 18323)
-- Dependencies: 210
-- Data for Name: calendarjournal; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendarjournal (id, name, description, delegatorid, startday, endday, starthour, endhour, classification, priority, lastmodification, externalid) FROM stdin;
\.


--
-- TOC entry 4922 (class 0 OID 18328)
-- Dependencies: 211
-- Data for Name: calendarjournalattendee; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendarjournalattendee (journalid, userid, participationstatus) FROM stdin;
\.


--
-- TOC entry 4923 (class 0 OID 18331)
-- Dependencies: 212
-- Data for Name: calendarjournalcategory; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendarjournalcategory (journalid, categoryid) FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 18334)
-- Dependencies: 213
-- Data for Name: calendartodo; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendartodo (id, name, description, delegatorid, startday, endday, starthour, endhour, classification, priority, lastmodification, percentcompleted, completedday, duration, componentid, spaceid, externalid) FROM stdin;
\.


--
-- TOC entry 4925 (class 0 OID 18339)
-- Dependencies: 214
-- Data for Name: calendartodoattendee; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.calendartodoattendee (todoid, userid, participationstatus) FROM stdin;
\.


--
-- TOC entry 4926 (class 0 OID 18342)
-- Dependencies: 215
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.days (day) FROM stdin;
01
02
03
04
05
06
07
08
09
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
\.


--
-- TOC entry 4927 (class 0 OID 18345)
-- Dependencies: 216
-- Data for Name: domainsp_group; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.domainsp_group (id, supergroupid, name, description) FROM stdin;
\.


--
-- TOC entry 4928 (class 0 OID 18350)
-- Dependencies: 217
-- Data for Name: domainsp_group_user_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.domainsp_group_user_rel (groupid, userid) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 18353)
-- Dependencies: 218
-- Data for Name: domainsp_user; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.domainsp_user (id, firstname, lastname, phone, homephone, cellphone, fax, address, title, company, "position", boss, login, password, passwordvalid, loginmail, email) FROM stdin;
0	\N	Administrateur	\N	\N	\N	\N	\N	\N	\N	\N	\N	SilverAdmin	$6$q9O/tichACgAq$6fMxLk3/WWAxZzVosHvwo7bHSwxuHNaD58VGaehpOl6UMEPTW/YqVFn.s8a74E3AEXs.5JKKjQc/zTRLEVujF/	Y	\N	silveradmin@localhost
\.


--
-- TOC entry 4930 (class 0 OID 18359)
-- Dependencies: 219
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.model (id, name, description, imagename, htmldisplayer, htmleditor, partid) FROM stdin;
\.


--
-- TOC entry 4931 (class 0 OID 18365)
-- Dependencies: 220
-- Data for Name: model_contact; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.model_contact (id, name, description, imagename, htmldisplayer, htmleditor) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 18370)
-- Dependencies: 221
-- Data for Name: pdcaxisvalue; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.pdcaxisvalue (valueid, axisid) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 18373)
-- Dependencies: 222
-- Data for Name: pdcclassification; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.pdcclassification (id, contentid, instanceid, modifiable, nodeid) FROM stdin;
\.


--
-- TOC entry 4934 (class 0 OID 18378)
-- Dependencies: 223
-- Data for Name: pdcclassification_pdcposition; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.pdcclassification_pdcposition (pdcclassification_id, positions_id) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 18381)
-- Dependencies: 224
-- Data for Name: pdcposition; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.pdcposition (id) FROM stdin;
\.


--
-- TOC entry 4936 (class 0 OID 18384)
-- Dependencies: 225
-- Data for Name: pdcposition_pdcaxisvalue; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.pdcposition_pdcaxisvalue (pdcposition_id, axisvalues_valueid, axisvalues_axisid) FROM stdin;
\.


--
-- TOC entry 4937 (class 0 OID 18387)
-- Dependencies: 226
-- Data for Name: permalinks_document; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.permalinks_document (documentid, documentuuid) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 18390)
-- Dependencies: 227
-- Data for Name: permalinks_version; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.permalinks_version (versionid, versionuuid) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 18393)
-- Dependencies: 228
-- Data for Name: personalization; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.personalization (id, languages, zoneid, look, personalwspace, thesaurusstatus, draganddropstatus, webdaveditingstatus, menudisplay) FROM stdin;
0	en	Europe/Paris	Waves		0	1	1	DEFAULT
\.


--
-- TOC entry 4940 (class 0 OID 18399)
-- Dependencies: 229
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 18404)
-- Dependencies: 230
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- TOC entry 4942 (class 0 OID 18409)
-- Dependencies: 231
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 18414)
-- Dependencies: 232
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 18419)
-- Dependencies: 233
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 18424)
-- Dependencies: 234
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
PersistentQuartzScheduler	TRIGGER_ACCESS
\.


--
-- TOC entry 4946 (class 0 OID 18427)
-- Dependencies: 235
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 18430)
-- Dependencies: 236
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- TOC entry 4948 (class 0 OID 18433)
-- Dependencies: 237
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 18438)
-- Dependencies: 238
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 18443)
-- Dependencies: 239
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- TOC entry 4951 (class 0 OID 18448)
-- Dependencies: 240
-- Data for Name: readingcontrol; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.readingcontrol (pubid, actorid, space, componentname) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 18451)
-- Dependencies: 241
-- Data for Name: sb_agenda_holidays; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_agenda_holidays (userid, holidaydate) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 18454)
-- Dependencies: 242
-- Data for Name: sb_agenda_import_settings; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_agenda_import_settings (userid, hostname, synchrotype, synchrodelay, url, remotelogin, remotepwd, charset) FROM stdin;
\.


--
-- TOC entry 4954 (class 0 OID 18459)
-- Dependencies: 243
-- Data for Name: sb_cal_attendees; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_attendees (id, attendeeid, componentid, type, participation, presence, delegate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 18464)
-- Dependencies: 244
-- Data for Name: sb_cal_attributes; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_attributes (id, name, value) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 18469)
-- Dependencies: 245
-- Data for Name: sb_cal_calendar; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_calendar (id, instanceid, title, zoneid, externalurl, synchrodate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 18474)
-- Dependencies: 246
-- Data for Name: sb_cal_categories; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_categories (id, category) FROM stdin;
\.


--
-- TOC entry 4958 (class 0 OID 18477)
-- Dependencies: 247
-- Data for Name: sb_cal_components; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_components (id, calendarid, startdate, enddate, indays, title, description, location, attributes, priority, sequence, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 18483)
-- Dependencies: 248
-- Data for Name: sb_cal_event; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_event (id, externalid, synchrodate, componentid, visibility, recurrenceid) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 18486)
-- Dependencies: 249
-- Data for Name: sb_cal_occurrences; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_occurrences (id, eventid, componentid) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 18489)
-- Dependencies: 250
-- Data for Name: sb_cal_recurrence; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_recurrence (id, recur_periodinterval, recur_periodunit, recur_count, recur_enddate) FROM stdin;
\.


--
-- TOC entry 4962 (class 0 OID 18493)
-- Dependencies: 251
-- Data for Name: sb_cal_recurrence_dayofweek; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_recurrence_dayofweek (recurrenceid, recur_nth, recur_dayofweek) FROM stdin;
\.


--
-- TOC entry 4963 (class 0 OID 18496)
-- Dependencies: 252
-- Data for Name: sb_cal_recurrence_exception; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_cal_recurrence_exception (recurrenceid, recur_exceptiondate) FROM stdin;
\.


--
-- TOC entry 4964 (class 0 OID 18499)
-- Dependencies: 253
-- Data for Name: sb_classifyengine_classify; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_classifyengine_classify (positionid, objectid, axis0, axis1, axis2, axis3, axis4, axis5, axis6, axis7, axis8, axis9, axis10, axis11, axis12, axis13, axis14, axis15, axis16, axis17, axis18, axis19, axis20, axis21, axis22, axis23, axis24, axis25, axis26, axis27, axis28, axis29, axis30, axis31, axis32, axis33, axis34, axis35, axis36, axis37, axis38, axis39, axis40, axis41, axis42, axis43, axis44, axis45, axis46, axis47, axis48, axis49) FROM stdin;
-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1
\.


--
-- TOC entry 4965 (class 0 OID 18504)
-- Dependencies: 254
-- Data for Name: sb_comment_comment; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_comment_comment (commentid, commentownerid, commentcreationdate, commentmodificationdate, commentcomment, instanceid, resourcetype, resourceid) FROM stdin;
\.


--
-- TOC entry 4966 (class 0 OID 18509)
-- Dependencies: 255
-- Data for Name: sb_contact_contact; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contact_contact (contactid, contactfirstname, contactlastname, contactemail, contactphone, contactfax, userid, contactcreationdate, contactcreatorid, instanceid) FROM stdin;
\.


--
-- TOC entry 4967 (class 0 OID 18514)
-- Dependencies: 256
-- Data for Name: sb_contact_contactfather; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contact_contactfather (contactid, nodeid) FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 18517)
-- Dependencies: 257
-- Data for Name: sb_contact_info; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contact_info (infoid, contactid, modelid, instanceid) FROM stdin;
\.


--
-- TOC entry 4969 (class 0 OID 18520)
-- Dependencies: 258
-- Data for Name: sb_containermanager_instance; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_containermanager_instance (instanceid, componentid, containertype, contenttype) FROM stdin;
\.


--
-- TOC entry 4970 (class 0 OID 18523)
-- Dependencies: 259
-- Data for Name: sb_containermanager_links; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_containermanager_links (positionid, containerinstanceid) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 18526)
-- Dependencies: 260
-- Data for Name: sb_contentmanager_content; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contentmanager_content (silvercontentid, internalcontentid, contentinstanceid, authorid, creationdate, begindate, enddate, isvisible) FROM stdin;
9	9	1	0	2024-10-02	2024/10/02	9999/99/99	1
1	1	1	0	2024-10-02	2024/10/02	9999/99/99	1
10	10	1	0	2024-10-02	2024/10/02	9999/99/99	1
13	13	2	0	2024-10-02	0000/00/00	9999/99/99	1
12	12	2	0	2024-10-02	0000/00/00	9999/99/99	1
11	11	2	0	2024-10-02	0000/00/00	9999/99/99	1
8	8	1	0	2024-10-02	2024/10/02	9999/99/99	1
17	17	1	0	2024-10-08	2024/10/08	9999/99/99	1
6	6	1	0	2024-10-02	2024/10/02	9999/99/99	1
14	14	1	0	2024-10-03	2024/10/03	9999/99/99	1
7	7	1	0	2024-10-02	2024/10/02	9999/99/99	1
5	5	1	0	2024-10-02	2024/10/02	9999/99/99	1
4	4	1	0	2024-10-02	2024/10/02	9999/99/99	1
16	16	1	0	2024-10-07	2024/10/07	9999/99/99	1
15	15	1	0	2024-10-07	2024/10/07	9999/99/99	1
3	3	1	0	2024-10-02	2024/10/02	9999/99/99	1
2	2	1	0	2024-10-02	2024/10/02	9999/99/99	1
\.


--
-- TOC entry 4972 (class 0 OID 18529)
-- Dependencies: 261
-- Data for Name: sb_contentmanager_instance; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contentmanager_instance (instanceid, componentid, containertype, contenttype) FROM stdin;
1	kmelia1	containerPDC	kmelia
2	quickinfo2	containerPDC	quickinfo
\.


--
-- TOC entry 4973 (class 0 OID 18532)
-- Dependencies: 262
-- Data for Name: sb_contribution_tracking; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_contribution_tracking (id, context, contrib_id, contrib_type, contrib_instanceid, action_type, action_date, action_by) FROM stdin;
7a2e2a2c-862a-4033-8981-3f3dbc28f5e7		1	Publication	kmelia1	CREATION	2024-10-02 09:37:49.063738	0
287c2f6a-1b53-4fc8-82ac-79209bf91d23		2	Publication	kmelia1	CREATION	2024-10-02 09:38:36.22519	0
e56e6388-d288-431a-862c-88f8a2bc1316		3	Publication	kmelia1	CREATION	2024-10-02 09:39:24.349851	0
1981f60e-94b9-4f70-8869-24888c8e29c2		4	Publication	kmelia1	CREATION	2024-10-02 09:40:24.393402	0
9f75d198-fa04-4301-aa10-7e832bb14ebd		5	Publication	kmelia1	CREATION	2024-10-02 09:41:16.731907	0
02419afb-92f8-4fb4-93de-35c0dc3532a5		6	Publication	kmelia1	CREATION	2024-10-02 09:45:30.831621	0
b452af1e-6996-4507-b625-7b2833284061		7	Publication	kmelia1	CREATION	2024-10-02 09:46:38.978556	0
4740bcf3-83ed-43e0-8cac-5fcb15d81029		7	Publication	kmelia1	MINOR_UPDATE	2024-10-02 09:47:07.56961	0
285f7984-1136-4869-8add-857cc813fa64		8	Publication	kmelia1	CREATION	2024-10-02 09:49:59.112156	0
80286cdd-563d-41af-9e1b-3aebadb31fec		9	Publication	kmelia1	CREATION	2024-10-02 09:52:56.69379	0
bcfcd62f-b52c-4c00-b38e-0755d36ce9a6		10	Publication	kmelia1	CREATION	2024-10-02 09:55:57.12574	0
5d49b757-a314-4528-b419-f86c6f01cc41		11	Publication	quickinfo2	CREATION	2024-10-02 12:57:28.499601	0
1de2660b-24c5-49c3-8424-b26972229bf5		11	Publication	quickinfo2	UPDATE	2024-10-02 12:57:30.062101	0
312f06d2-37af-4f84-891d-d0d3229bf436		11	Publication	quickinfo2	MINOR_UPDATE	2024-10-02 13:23:56.387141	0
762fcaf3-efc8-481c-bc66-44afd8e995b9		12	Publication	quickinfo2	CREATION	2024-10-02 13:24:42.879936	0
f8e29dc9-d645-4321-a352-90e1f8adbd43		12	Publication	quickinfo2	UPDATE	2024-10-02 13:24:42.981707	0
b2b3edaa-dc69-48e2-8967-ea7d280b156c		13	Publication	quickinfo2	CREATION	2024-10-02 13:27:31.008868	0
bd898e56-d618-4f4a-b4a3-ea3fdbcffdab		13	Publication	quickinfo2	UPDATE	2024-10-02 13:27:31.107318	0
2d0c1053-bca2-49be-81f4-2b31adc08cd5		11	Publication	quickinfo2	MINOR_UPDATE	2024-10-02 13:53:41.603737	0
95f7deb0-3c48-4a10-82ae-8bdd8f868b85		12	Publication	quickinfo2	MINOR_UPDATE	2024-10-02 13:58:53.55824	0
a3c1e8f3-0be3-42ba-ab75-5608489a72db		1	Publication	kmelia1	MINOR_UPDATE	2024-10-02 16:04:43.949132	0
13f269c3-ac6b-45d4-b8db-005fa5c5e452		1	Publication	kmelia1	UPDATE	2024-10-02 16:14:28.014448	0
f5dd02d6-6cc6-486f-b143-d7262a148995		1	Publication	kmelia1	MINOR_UPDATE	2024-10-02 16:15:31.135344	0
f0f10b47-1275-46ba-9a4a-052f51a06d71		1	Publication	kmelia1	MINOR_UPDATE	2024-10-02 16:16:36.583016	0
696ad81a-4941-4da5-bdec-2ac457f9f6b5		1	Publication	kmelia1	MINOR_UPDATE	2024-10-02 16:17:05.570531	0
8acd0033-dfc2-48b8-abf8-fb6a29a0b9ea		7	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:24:28.719572	0
ab088e36-8542-42df-95c3-5e2a4dffee63		10	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:27:20.671921	0
2d960846-7e32-41ff-a6f8-457afcaa716d		10	Publication	kmelia1	UPDATE	2024-10-03 09:27:54.60035	0
168f549f-3b47-4872-b1f5-7098501112fa		10	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:30:49.97727	0
c3d0a568-c5c7-454a-b199-b4f4ee555179		10	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:32:16.206002	0
b2bd78da-9ae7-484c-b930-b4d83b4a8ba7		10	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:47:23.589887	0
c5ed53a1-505d-4f1c-92f6-3f8c72fbd8e1		10	Publication	kmelia1	MINOR_UPDATE	2024-10-03 09:52:11.646	0
031917a6-7f8d-41e7-8b93-e5a02ae7c5b1		14	Publication	kmelia1	CREATION	2024-10-03 13:56:10.873298	0
b19692fb-d630-49a5-8cd6-b87a9c5ffb1d		14	Publication	kmelia1	MINOR_UPDATE	2024-10-03 13:59:04.286156	0
18c236d2-5511-4beb-9ca3-00cd1890cca6		14	Publication	kmelia1	UPDATE	2024-10-03 14:11:54.056876	0
8e1fddde-b41d-490b-b29a-294a4446b227		14	Publication	kmelia1	MINOR_UPDATE	2024-10-03 14:15:37.923935	0
9a5ebd9d-39e4-44ab-bef1-05b3bd91958d		8	Publication	kmelia1	UPDATE	2024-10-03 14:33:07.408052	0
f51b5b1e-6dab-4e00-b415-42197fe44be3		8	Publication	kmelia1	MINOR_UPDATE	2024-10-03 14:34:32.891652	0
d65a8e35-bbf0-4d82-84a7-9d6a720d0f18		8	Publication	kmelia1	MINOR_UPDATE	2024-10-03 14:44:38.300884	0
6a882779-d284-468b-9c31-55b47d638661		8	Publication	kmelia1	MINOR_UPDATE	2024-10-03 15:19:22.493242	0
263a0799-88b1-4e4e-8a22-6e02c496f60e		8	Publication	kmelia1	MINOR_UPDATE	2024-10-03 15:22:06.997109	0
bdb699d9-10e7-4b51-a58c-ab525fca2b4e		6	Publication	kmelia1	MINOR_UPDATE	2024-10-03 15:36:12.952294	0
b3d1e3de-90bc-4564-ac44-5e9612baefcc		6	Publication	kmelia1	UPDATE	2024-10-03 16:21:14.051847	0
d84ee9d5-1756-4bbf-aa0e-bbea150ecbf1		6	Publication	kmelia1	MINOR_UPDATE	2024-10-03 16:21:43.02011	0
554288f2-2d83-492e-8ea6-2a6d08d0a46f		6	Publication	kmelia1	MINOR_UPDATE	2024-10-03 16:23:11.359328	0
01bd47d6-5a53-424e-b941-7c346ce2f244		6	Publication	kmelia1	MINOR_UPDATE	2024-10-03 16:24:46.241862	0
442a1d7c-049a-4398-b84e-21f2b1822c71		14	Publication	kmelia1	MINOR_UPDATE	2024-10-07 08:01:40.072238	0
ebb113f7-0b4a-4fc7-9090-38ef1e665fc5		7	Publication	kmelia1	UPDATE	2024-10-07 08:42:15.588834	0
fe82657e-ebce-4f53-b3f1-7c66baf2aef3		15	Publication	kmelia1	CREATION	2024-10-07 12:30:15.692088	0
ac88115e-5f42-4f50-b09e-5a7ffcbf7721		15	Publication	kmelia1	UPDATE	2024-10-07 12:30:15.997713	0
870d5917-8888-4bbd-bc5d-134a0fa03f6e		16	Publication	kmelia1	CREATION	2024-10-07 12:30:49.979319	0
7c182d7e-03d3-433c-ae49-b78202d07caa		16	Publication	kmelia1	UPDATE	2024-10-07 12:30:50.075258	0
5bb91bdb-885e-476e-858f-4b83990ffc53		4	Publication	kmelia1	UPDATE	2024-10-07 14:40:13.725602	0
cb07a286-39a0-49cc-9104-d393fa66c735		5	Publication	kmelia1	UPDATE	2024-10-07 14:45:46.441254	0
66f2b3f6-0d8d-47c5-89bb-0935cde237e8		5	Publication	kmelia1	MINOR_UPDATE	2024-10-07 14:46:02.370587	0
7f6df09a-bb5b-4158-8234-bd495d608bed		5	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:28:02.426656	0
174cf19d-bf82-417e-b47e-204ca274ccdc		5	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:28:49.497127	0
24a27432-26b6-4ea7-9655-7281b27b9516		5	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:29:37.507379	0
9236f473-20b3-4aec-aebc-355af2e7ba06		4	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:30:14.405403	0
3f6e37ef-569c-4c17-82fe-18e39a004714		4	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:30:37.393659	0
694f0b44-8af0-419e-89c4-b648134102da		4	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 15:30:51.784124	0
4d79369e-d693-4794-9c06-877f4aa6baef		2	Publication	kmelia1	UPDATE	2024-10-07 15:31:44.607979	0
0c22d934-3e79-49b2-b4f7-4e198464d521		2	Publication	kmelia1	MAJOR_UPDATE	2024-10-07 16:00:07.336656	0
32b426ed-39e9-46b5-81e4-5532056125fd		3	Publication	kmelia1	UPDATE	2024-10-07 16:13:40.327569	0
c2254acc-b352-437b-8010-f072a260e7a5		16	Publication	kmelia1	MINOR_UPDATE	2024-10-08 07:30:00.446848	0
6ccff423-2815-427d-9ec2-368feaa72f16		15	Publication	kmelia1	MINOR_UPDATE	2024-10-08 07:30:21.022541	0
4e2b30bf-f65e-4f67-8811-ced63ab68ffb		3	Publication	kmelia1	MAJOR_UPDATE	2024-10-08 07:40:54.698841	0
b5908102-f6bb-45b8-9d1a-4302cd46b213		3	Publication	kmelia1	MINOR_UPDATE	2024-10-08 07:42:02.805971	0
315f17bf-19f2-47a6-b7a8-8a06e61b5ec9		3	Publication	kmelia1	MAJOR_UPDATE	2024-10-08 07:43:06.960564	0
b7640317-fe41-4cfe-b2d3-466294548d68		2	Publication	kmelia1	MAJOR_UPDATE	2024-10-08 07:46:21.127807	0
6efaa2f8-4d8e-445d-bce0-dfae8b41539d		9	Publication	kmelia1	UPDATE	2024-10-08 08:29:05.189512	0
1f7859b9-a527-4e96-a71f-1f2c3fe1fced		9	Publication	kmelia1	MAJOR_UPDATE	2024-10-08 08:52:22.900261	0
50d01a7a-de1b-4a36-8d2d-11ebe39ed3c1		13	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 09:02:08.851583	0
7adbf352-c511-4e0b-a5e3-e94a87129232		13	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 09:04:11.909228	0
1a65c4bb-3bdc-4b7f-b72d-95b40d61777c		13	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 09:27:14.76741	0
b999f8dd-e665-4661-b82a-b63421ce174b		12	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 10:03:27.924346	0
4e9d0794-a3f2-4274-8639-4360dce027a4		12	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 10:06:07.695339	0
9b445cae-f225-44dc-b8bc-1d4d8bca2fcd		17	Publication	kmelia1	CREATION	2024-10-08 12:26:04.729141	0
955b32e6-31ca-4376-bb36-64851501371c		17	Publication	kmelia1	MINOR_UPDATE	2024-10-08 14:16:56.503588	0
384d9a5a-09b5-4f8c-a871-fc7e0ab14233		17	Publication	kmelia1	MINOR_UPDATE	2024-10-08 14:17:30.9868	0
5805a278-e546-4926-b520-7c0df883694f		17	Publication	kmelia1	MINOR_UPDATE	2024-10-08 14:18:06.02635	0
dc4f55c0-de27-426a-a6fa-753c8aca7ed5		17	Publication	kmelia1	MINOR_UPDATE	2024-10-08 14:18:06.326505	0
933d3f36-7cbe-40f6-be77-bab6030d55b8		17	Publication	kmelia1	UPDATE	2024-10-08 14:23:27.726278	0
81480655-a9d6-47db-be7c-59d6ef4ce134		17	Publication	kmelia1	MAJOR_UPDATE	2024-10-08 14:28:16.495518	0
2be791a4-7a23-4c74-a9a1-3747226d68c2		11	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 14:29:28.336714	0
ad04308a-e070-4087-a829-2a6ee87a2bc5		12	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 15:33:43.043889	0
ec818d02-d775-4264-9717-2810b44b8f85		12	Publication	quickinfo2	MAJOR_UPDATE	2024-10-08 15:34:22.500399	0
f4c20f60-78d2-4856-84b3-5ff2f7d6f456		13	Publication	quickinfo2	MINOR_UPDATE	2024-10-09 12:58:53.293779	0
93a6d114-f3d3-462f-aa1e-fc7b28804ae9		13	Publication	quickinfo2	MINOR_UPDATE	2024-10-10 13:26:17.114734	0
b5fd137a-aa32-427d-91b7-7edf05fe1331		12	Publication	quickinfo2	MAJOR_UPDATE	2024-10-10 13:29:48.457422	0
dad4b67f-84a7-405c-a9ec-ce30c899d4b0		11	Publication	quickinfo2	MINOR_UPDATE	2024-10-10 13:32:15.625613	0
c949689c-f564-4b2f-82a1-163bd633d3ff		17	Publication	kmelia1	MAJOR_UPDATE	2024-10-10 13:43:24.346496	0
f694dbd3-9118-4522-b9b7-e92c5e9675ba		17	Publication	kmelia1	MINOR_UPDATE	2024-10-10 13:44:46.199392	0
f63ad01e-4eaa-42db-88d5-e3ea4f4aec48		17	Publication	kmelia1	MAJOR_UPDATE	2024-10-10 13:47:35.690041	0
6b512ae7-7f5e-4b47-8674-0218c37b94ee		17	Publication	kmelia1	MINOR_UPDATE	2024-10-10 13:48:54.609121	0
8e8b7835-4efa-4262-a35c-02e808084787		7	Publication	kmelia1	MAJOR_UPDATE	2024-10-10 13:54:48.866206	0
\.


--
-- TOC entry 4974 (class 0 OID 18538)
-- Dependencies: 263
-- Data for Name: sb_coordinates_coordinates; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_coordinates_coordinates (coordinatesid, nodeid, coordinatesleaf, coordinatesdisplayorder, instanceid) FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 18541)
-- Dependencies: 264
-- Data for Name: sb_filesharing_history; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_filesharing_history (id, keyfile, downloaddate, downloadip) FROM stdin;
\.


--
-- TOC entry 4976 (class 0 OID 18544)
-- Dependencies: 265
-- Data for Name: sb_filesharing_ticket; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_filesharing_ticket (shared_object, componentid, creatorid, creationdate, updateid, updatedate, enddate, nbaccessmax, nbaccess, keyfile, shared_object_type) FROM stdin;
\.


--
-- TOC entry 4977 (class 0 OID 18549)
-- Dependencies: 266
-- Data for Name: sb_formtemplate_record; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_formtemplate_record (recordid, templateid, externalid, lang) FROM stdin;
1	1	0	\N
\.


--
-- TOC entry 4978 (class 0 OID 18552)
-- Dependencies: 267
-- Data for Name: sb_formtemplate_template; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_formtemplate_template (templateid, externalid, templatename) FROM stdin;
1	webPages3:auroraspacehomepage	auroraspacehomepage.xml
\.


--
-- TOC entry 4979 (class 0 OID 18557)
-- Dependencies: 268
-- Data for Name: sb_formtemplate_templatefield; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_formtemplate_templatefield (templateid, fieldname, fieldindex, fieldtype, ismandatory, isreadonly, ishidden) FROM stdin;
\.


--
-- TOC entry 4980 (class 0 OID 18563)
-- Dependencies: 269
-- Data for Name: sb_formtemplate_textfield; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_formtemplate_textfield (recordid, fieldname, fieldvalue, fieldvalueindex) FROM stdin;
1	newsImportantOnly	0	0
1	displayTaxonomy		0
1	users		0
1	rightFreeContentTitle		0
1	secondPicture	\N	0
1	newUsers	\N	0
1	mainFreeContentTitle		0
1	newsRenderingType	carousel	0
1	shortcutLabel1		0
1	shortcutURL4		0
1	shortcutLabel4		0
1	newsZone	main	0
1	shortcutURL3		0
1	shortcutLabel5		0
1	displayAdmins	0	0
1	shortcutURL2		0
1	shortcutLabel2		0
1	intro	xmlWysiwygField_0_intro	0
1	shortcutURL1		0
1	shortcutLabel3		0
1	shortcutLabel6		0
1	picture	\N	0
1	rightFreeContentValue	xmlWysiwygField_0_rightFreeContentValue	0
1	displayNews	1	0
1	shortcutTarget2		0
1	shortcutTarget1		0
1	shortcutURL6		0
1	shortcutURL5		0
1	latestPublications		0
1	displaySubspaces	1	0
1	newsLimit	5	0
1	shortcutIcon1	\N	0
1	shortcutIcon2	\N	0
1	mainFreeContentValue	xmlWysiwygField_0_mainFreeContentValue	0
1	displayMedias	0	0
1	displayEvents	0	0
1	shortcutIcon5	\N	0
1	shortcutTarget6		0
1	newsOfSubSpaces	1	0
1	shortcutTarget5		0
1	shortcutIcon6	\N	0
1	shortcutIcon3	\N	0
1	shortcutTarget4		0
1	shortcutTarget3		0
1	shortcutIcon4	\N	0
1	usersLabel		0
1	displayApps	1	0
1	secondPictureLink		0
\.


--
-- TOC entry 4981 (class 0 OID 18568)
-- Dependencies: 270
-- Data for Name: sb_interests; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_interests (id, name, criteria, workspaceid, peasid, authorid, afterdate, beforedate, ownerid) FROM stdin;
\.


--
-- TOC entry 4982 (class 0 OID 18573)
-- Dependencies: 271
-- Data for Name: sb_interests_axis; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_interests_axis (id, icid, axisid, value) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 18576)
-- Dependencies: 272
-- Data for Name: sb_mylinks_cat; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_mylinks_cat (catid, name, description, userid, "position") FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 18581)
-- Dependencies: 273
-- Data for Name: sb_mylinks_link; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_mylinks_link (linkid, name, description, url, visible, popup, userid, instanceid, objectid, "position") FROM stdin;
\.


--
-- TOC entry 4985 (class 0 OID 18586)
-- Dependencies: 274
-- Data for Name: sb_mylinks_linkcat; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_mylinks_linkcat (linkid, catid) FROM stdin;
\.


--
-- TOC entry 4986 (class 0 OID 18589)
-- Dependencies: 275
-- Data for Name: sb_node_node; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_node_node (nodeid, nodename, nodedescription, nodecreationdate, nodecreatorid, nodepath, nodelevelnumber, nodefatherid, modelid, nodestatus, instanceid, type, ordernumber, lang, rightsdependson) FROM stdin;
0	Accueil	La Racine	2024/10/02	0	/	1	-1	\N	Visible	kmelia1	default	1	fr	-1
1	Corbeille	Vous trouvez ici les publications que vous avez supprimé	2024/10/02	0	/0/	2	0	\N	Invisible	kmelia1	default	1	fr	-1
2	Déclassées	Vos publications inaccessibles se retrouvent ici	2024/10/02	0	/0/	2	0	\N	Invisible	kmelia1	default	2	fr	-1
3	Optional modules	Silverpeas have some optionnal modules, not deploy here in this docker version. Contact us to more informations	2024/10/02	0	/0/	2	0	\N	Invisible	kmelia1	default	1	en	-1
4	First steps	This content can't replace a formation. It's just some basics steps to start with our platform.	2024/10/02	0	/0/	2	0	\N	Invisible	kmelia1	default	0	en	-1
5	Last Release note		2024/10/07	0	/0/	2	0	\N	Invisible	kmelia1	default	5	en	-1
\.


--
-- TOC entry 4987 (class 0 OID 18596)
-- Dependencies: 276
-- Data for Name: sb_node_nodei18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_node_nodei18n (id, nodeid, lang, nodename, nodedescription) FROM stdin;
1	3	fr	Optional modules	Silverpeas have some optionnal modules, not deploy here in this docker version. Contact us to more informations
2	4	fr	First step	This content can't replace a formation. It's just some basics steps to start with our platform.
3	5	fr	Last Release note	
\.


--
-- TOC entry 4988 (class 0 OID 18601)
-- Dependencies: 277
-- Data for Name: sb_notation_notation; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_notation_notation (id, instanceid, externalid, externaltype, author, note) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 18604)
-- Dependencies: 278
-- Data for Name: sb_pdc_axis; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_axis (id, rootid, name, axistype, axisorder, creationdate, creatorid, description, lang) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 18609)
-- Dependencies: 279
-- Data for Name: sb_pdc_axisi18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_axisi18n (id, axisid, lang, name, description) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 18614)
-- Dependencies: 280
-- Data for Name: sb_pdc_group_rights; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_group_rights (axisid, valueid, groupid) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 18617)
-- Dependencies: 281
-- Data for Name: sb_pdc_subscription; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_subscription (id, name, ownerid) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 18620)
-- Dependencies: 282
-- Data for Name: sb_pdc_subscription_axis; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_subscription_axis (id, pdcsubscriptionid, axisid, value) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 18623)
-- Dependencies: 283
-- Data for Name: sb_pdc_user_rights; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_user_rights (axisid, valueid, userid) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 18626)
-- Dependencies: 284
-- Data for Name: sb_pdc_utilization; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_pdc_utilization (id, instanceid, axisid, basevalue, mandatory, variant) FROM stdin;
\.


--
-- TOC entry 4996 (class 0 OID 18629)
-- Dependencies: 285
-- Data for Name: sb_publication_publi; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_publication_publi (pubid, infoid, pubname, pubdescription, pubcreationdate, pubbegindate, pubenddate, pubcreatorid, pubimportance, pubversion, pubkeywords, pubcontent, pubstatus, pubupdatedate, instanceid, pubupdaterid, pubvalidatedate, pubvalidatorid, pubbeginhour, pubendhour, pubauthor, pubtargetvalidatorid, pubcloneid, pubclonestatus, lang, pubdraftoutdate) FROM stdin;
15	0	Release note de Silverpeas 6.3	Find features and fixes bug improve in the 6.4. (the document is in french)	2024/10/07	2024/10/07	9999/99/99	0	1				Valid	2024/10/07	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	fr	\N
12	0	How does Silverpeas work ?	A first and fast guide to give you the good way to approach your platform.	2024/10/02	0000/00/00	9999/99/99	0	0	\N		\N	Valid	2024/10/10	quickinfo2	0	\N	\N	00:00	23:59	\N	\N	-1	\N	fr	\N
11	0	Discover our concept of “Publication”		2024/10/02	0000/00/00	9999/99/99	0	0	\N		\N	Valid	2024/10/08	quickinfo2	0	\N	\N	00:00	23:59	\N	\N	-1	\N	fr	\N
7	0	Front office / Back office / How to edit et manage content	Simply and basic : content creation, edition and participation is accessible simply by the "What do you want to do next?" menu.\r\nFor function more administrative, like group creation, forms editing, space and application deployed, a switch to the backoffice is needed	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/10	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
3	0	Online editing in the browser	Document editing can be done directly in the browser, without using software installed on the user's computer. 	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/08	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
2	0	SSO Modules 		2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/08	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
1	0	Instant messaging and visioconference	Based on ConverseJS plugin for chat and Jitsi for visioconference. This add allows to offer : chat, chat group and visioconference inside one and only portal.	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/02	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
5	0	SilverDrive	This application allows you to automatically publish files in a “Document Management I” type application on a Silverpeas server.	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/07	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
8	0	Classification way : Interest and set up	SILVERPEAS offers a complementary and optional means of classification. It allows a completely cross-platform classification. Thus, the user no longer accesses information vertically (through spaces, then through applications, etc.). He accesses it by the type of information sought, completely ignoring the local classification system.	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/03	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
17	0	Publication : what's the point ?	Here, find an example of the interest of the publication concept. We can see how the context is important and helping. Here , the explanations of the content of a press release. And the importance of contacting a person in charge before sharing this elements.	2024/10/08	2024/10/08	9999/99/99	0	1				Valid	2024/10/10	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
9	0	Space and organization of the tree structure		2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/08	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
4	0	Smartphone App	Silverpeas Mobile transforms your smartphone into a complete information and collaboration portal. View, publish, and interact with all your professional data in real-time.	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/07	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
10	0	Deploy and setting apps	Deploy an app, so easy. But give it the good setting, require a little time and mental projection.	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/03	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
6	0	Groups and users	Update your administrator profil. Define group and create new users...	2024/10/02	2024/10/02	9999/99/99	0	1				Valid	2024/10/03	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
14	0	The backoffice	Access to the backoffice by the button in the header. The backoffice allow you to create space, application, group and users ...	2024/10/03	2024/10/03	9999/99/99	0	1				Valid	2024/10/03	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	en	\N
16	0	Release note - Silverpeas 6.4	Find features and fixes bug improve in the 6.4. (the document is in french)	2024/10/07	2024/10/07	9999/99/99	0	1				Valid	2024/10/07	kmelia1	0	\N	\N	00:00	23:59	\N	\N	-1	\N	fr	\N
13	0	Congrate, welcome to Silverpeas community	A presentation of our community and our product. And just few links and contacts you can be able to need.	2024/10/02	0000/00/00	9999/99/99	0	0	\N		\N	Valid	2024/10/08	quickinfo2	0	\N	\N	00:00	23:59	\N	\N	-1	\N	fr	\N
\.


--
-- TOC entry 4997 (class 0 OID 18635)
-- Dependencies: 286
-- Data for Name: sb_publication_publifather; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_publication_publifather (pubid, nodeid, instanceid, aliasuserid, aliasdate, puborder) FROM stdin;
7	4	kmelia1	\N	\N	0
6	4	kmelia1	\N	\N	1
8	4	kmelia1	\N	\N	2
9	4	kmelia1	\N	\N	3
10	4	kmelia1	\N	\N	4
14	0	kmelia1	\N	\N	0
15	5	kmelia1	\N	\N	0
16	5	kmelia1	\N	\N	0
1	3	kmelia1	\N	\N	0
4	3	kmelia1	\N	\N	1
2	3	kmelia1	\N	\N	2
3	3	kmelia1	\N	\N	3
5	3	kmelia1	\N	\N	4
17	0	kmelia1	\N	\N	0
\.


--
-- TOC entry 4998 (class 0 OID 18639)
-- Dependencies: 287
-- Data for Name: sb_publication_publii18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_publication_publii18n (id, pubid, lang, name, description, keywords) FROM stdin;
\.


--
-- TOC entry 4999 (class 0 OID 18644)
-- Dependencies: 288
-- Data for Name: sb_publication_validation; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_publication_validation (id, pubid, instanceid, userid, decisiondate, decision) FROM stdin;
\.


--
-- TOC entry 5000 (class 0 OID 18647)
-- Dependencies: 289
-- Data for Name: sb_question_answer; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_question_answer (answerid, questionid, answerlabel, answernbpoints, answerissolution, answercomment, answernbvoters, answerisopened, answerimage, answerquestionlink) FROM stdin;
\.


--
-- TOC entry 5001 (class 0 OID 18652)
-- Dependencies: 290
-- Data for Name: sb_question_question; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_question_question (questionid, qcid, questionlabel, questiondescription, questionclue, questionimage, questionisqcm, questiontype, questionisopen, questioncluepenalty, questionmaxtime, questiondisplayorder, questionnbpointsmin, questionnbpointsmax, instanceid, style) FROM stdin;
\.


--
-- TOC entry 5002 (class 0 OID 18657)
-- Dependencies: 291
-- Data for Name: sb_question_questionresult; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_question_questionresult (qrid, questionid, userid, answerid, qropenanswer, qrnbpoints, qrpolldate, qrelapsedtime, qrparticipationid) FROM stdin;
\.


--
-- TOC entry 5003 (class 0 OID 18662)
-- Dependencies: 292
-- Data for Name: sb_question_score; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_question_score (scoreid, qcid, userid, scoreparticipationid, scorescore, scoreelapsedtime, scoreparticipationdate, scoresuggestion) FROM stdin;
\.


--
-- TOC entry 5004 (class 0 OID 18667)
-- Dependencies: 293
-- Data for Name: sb_questioncontainer_comment; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_questioncontainer_comment (commentid, commentfatherid, userid, commentcomment, commentisanonymous, commentdate) FROM stdin;
\.


--
-- TOC entry 5005 (class 0 OID 18672)
-- Dependencies: 294
-- Data for Name: sb_questioncontainer_qc; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_questioncontainer_qc (qcid, qctitle, qcdescription, qccomment, qccreatorid, qccreationdate, qcbegindate, qcenddate, qcisclosed, qcnbvoters, qcnbquestionspage, qcnbmaxparticipations, qcnbtriesbeforesolution, qcmaxtime, instanceid, anonymous, resultmode, resultview) FROM stdin;
\.


--
-- TOC entry 5006 (class 0 OID 18677)
-- Dependencies: 295
-- Data for Name: sb_reminder; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_reminder (id, remindertype, contrib_id, contrib_instanceid, contrib_type, userid, text, triggered, trigger_datetime, trigger_durationtime, trigger_durationunit, trigger_prop, process_name) FROM stdin;
\.


--
-- TOC entry 5007 (class 0 OID 18683)
-- Dependencies: 296
-- Data for Name: sb_seealso_link; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_seealso_link (id, objectid, objectinstanceid, targetid, targetinstanceid) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 18686)
-- Dependencies: 297
-- Data for Name: sb_sn_externalaccount; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_sn_externalaccount (profileid, networkid, silverpeasuserid) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 18689)
-- Dependencies: 298
-- Data for Name: sb_sn_invitation; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_sn_invitation (id, senderid, receiverid, message, invitationdate) FROM stdin;
\.


--
-- TOC entry 5010 (class 0 OID 18694)
-- Dependencies: 299
-- Data for Name: sb_sn_relationship; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_sn_relationship (id, user1id, user2id, typerelationshipid, acceptancedate, inviterid) FROM stdin;
\.


--
-- TOC entry 5011 (class 0 OID 18697)
-- Dependencies: 300
-- Data for Name: sb_sn_status; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_sn_status (id, userid, creationdate, description) FROM stdin;
\.


--
-- TOC entry 5012 (class 0 OID 18702)
-- Dependencies: 301
-- Data for Name: sb_sn_typerelationship; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_sn_typerelationship (id, designation) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 18705)
-- Dependencies: 302
-- Data for Name: sb_stat_access; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_access (datestat, userid, peastype, spaceid, componentid, countaccess) FROM stdin;
2024-10-01	0	quickinfo	WA1	quickinfo2	1
2024-10-01	0	kmelia	WA1	kmelia1	5
\.


--
-- TOC entry 5014 (class 0 OID 18708)
-- Dependencies: 303
-- Data for Name: sb_stat_accesscumul; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_accesscumul (datestat, userid, peastype, spaceid, componentid, countaccess) FROM stdin;
2024-10-01	0	webPages	WA1	webPages4	16
2024-10-01	0	quickinfo	WA1	quickinfo2	29
2024-10-01	0	kmelia	WA1	kmelia1	44
\.


--
-- TOC entry 5015 (class 0 OID 18711)
-- Dependencies: 304
-- Data for Name: sb_stat_connection; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_connection (datestat, userid, countconnection, duration) FROM stdin;
2024-10-01	0	1	2724064
\.


--
-- TOC entry 5016 (class 0 OID 18714)
-- Dependencies: 305
-- Data for Name: sb_stat_connectioncumul; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_connectioncumul (datestat, userid, countconnection, duration) FROM stdin;
2024-09-01	0	7	17377746
2024-09-01	10	2	556625
2024-10-01	0	35	355375963
\.


--
-- TOC entry 5017 (class 0 OID 18717)
-- Dependencies: 306
-- Data for Name: sb_stat_sizedir; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_sizedir (datestat, filedir, sizedir) FROM stdin;
2024-10-01	D:/SILVERPEAS/V6/data	18776890
\.


--
-- TOC entry 5018 (class 0 OID 18720)
-- Dependencies: 307
-- Data for Name: sb_stat_sizedircumul; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_sizedircumul (datestat, filedir, sizedir) FROM stdin;
2024-09-01	D:/SILVERPEAS/V6/data	5301559
2024-10-01	D:/SILVERPEAS/V6/data	18774274
\.


--
-- TOC entry 5019 (class 0 OID 18723)
-- Dependencies: 308
-- Data for Name: sb_stat_volume; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_volume (datestat, userid, peastype, spaceid, componentid, countvolume) FROM stdin;
2024-10-01	0	kmelia	WA1	kmelia1	14
2024-10-01	-2	webPages	WA1	webPages3	1
2024-10-01	0	quickinfo	WA1	quickinfo2	3
2024-10-01	-2	webPages	WA1	webPages4	1
2024-10-01	-2	hyperlink	WA2	hyperlink5	1
2024-10-01	-2	hyperlink	WA2	hyperlink6	1
2024-10-01	-2	hyperlink	WA2	hyperlink7	1
\.


--
-- TOC entry 5020 (class 0 OID 18726)
-- Dependencies: 309
-- Data for Name: sb_stat_volumecumul; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_stat_volumecumul (datestat, userid, peastype, spaceid, componentid, countvolume) FROM stdin;
2024-10-01	0	kmelia	WA1	kmelia1	14
2024-10-01	-2	webPages	WA1	webPages3	1
2024-10-01	0	quickinfo	WA1	quickinfo2	3
2024-10-01	-2	webPages	WA1	webPages4	1
2024-10-01	-2	hyperlink	WA2	hyperlink5	1
2024-10-01	-2	hyperlink	WA2	hyperlink6	1
2024-10-01	-2	hyperlink	WA2	hyperlink7	1
\.


--
-- TOC entry 5021 (class 0 OID 18729)
-- Dependencies: 310
-- Data for Name: sb_statistic_history; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_statistic_history (datestat, heurestat, userid, resourceid, componentid, actiontype, resourcetype) FROM stdin;
2024/10/02	11:37	0	1	kmelia1	1	Publication
2024/10/02	11:38	0	2	kmelia1	1	Publication
2024/10/02	11:39	0	3	kmelia1	1	Publication
2024/10/02	11:40	0	4	kmelia1	1	Publication
2024/10/02	11:41	0	5	kmelia1	1	Publication
2024/10/02	11:45	0	6	kmelia1	1	Publication
2024/10/02	11:46	0	7	kmelia1	1	Publication
2024/10/02	11:49	0	8	kmelia1	1	Publication
2024/10/02	11:52	0	9	kmelia1	1	Publication
2024/10/02	11:55	0	10	kmelia1	1	Publication
2024/10/02	14:57	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/02	15:23	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/02	15:23	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/02	15:24	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/02	15:27	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/02	15:52	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/02	15:53	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/02	15:54	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/02	15:55	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/02	15:56	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/02	15:56	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/02	15:57	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/02	15:58	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/02	17:58	0	1	kmelia1	1	Publication
2024/10/03	11:17	0	10	kmelia1	1	Publication
2024/10/03	11:19	0	7	kmelia1	1	Publication
2024/10/03	11:25	0	10	kmelia1	1	Publication
2024/10/03	11:28	0	10	kmelia1	1	Publication
2024/10/03	11:31	0	10	kmelia1	1	Publication
2024/10/03	11:49	0	10	kmelia1	1	Publication
2024/10/03	15:46	0	10	kmelia1	1	Publication
2024/10/03	15:47	0	6	kmelia1	1	Publication
2024/10/03	15:56	0	14	kmelia1	1	Publication
2024/10/03	16:04	0	14	kmelia1	1	Publication
2024/10/03	16:12	0	14	kmelia1	1	Publication
2024/10/03	16:18	0	8	kmelia1	1	Publication
2024/10/03	16:34	0	8	kmelia1	1	Publication
2024/10/03	16:35	0	8	kmelia1	1	Publication
2024/10/03	17:18	0	8	kmelia1	1	Publication
2024/10/03	17:22	0	6	kmelia1	1	Publication
2024/10/03	17:31	0	8	kmelia1	1	Publication
2024/10/03	17:31	0	6	kmelia1	1	Publication
2024/10/03	17:40	0	6	kmelia1	1	Publication
2024/10/07	09:57	0	14	kmelia1	1	Publication
2024/10/07	10:02	0	7	kmelia1	1	Publication
2024/10/07	12:02	0	14	kmelia1	1	Publication
2024/10/07	12:02	0	7	kmelia1	1	Publication
2024/10/07	12:02	0	6	kmelia1	1	Publication
2024/10/07	12:02	0	8	kmelia1	1	Publication
2024/10/07	12:02	0	9	kmelia1	1	Publication
2024/10/07	14:31	0	15	kmelia1	1	Publication
2024/10/07	14:47	0	15	kmelia1	1	Publication
2024/10/07	15:09	0	15	kmelia1	1	Publication
2024/10/07	16:33	0	16	kmelia1	1	Publication
2024/10/07	16:33	0	1	kmelia1	1	Publication
2024/10/07	16:33	0	2	kmelia1	1	Publication
2024/10/07	16:33	0	3	kmelia1	1	Publication
2024/10/07	16:33	0	4	kmelia1	1	Publication
2024/10/07	16:40	0	5	kmelia1	1	Publication
2024/10/07	17:28	0	4	kmelia1	1	Publication
2024/10/07	17:28	0	5	kmelia1	1	Publication
2024/10/07	17:28	0	1	kmelia1	1	Publication
2024/10/07	17:28	0	5	kmelia1	1	Publication
2024/10/07	17:29	0	4	kmelia1	1	Publication
2024/10/07	17:31	0	5	kmelia1	1	Publication
2024/10/07	17:31	0	1	kmelia1	1	Publication
2024/10/07	17:31	0	2	kmelia1	1	Publication
2024/10/07	18:00	0	3	kmelia1	1	Publication
2024/10/08	09:27	0	16	kmelia1	1	Publication
2024/10/08	09:30	0	15	kmelia1	1	Publication
2024/10/08	09:30	0	2	kmelia1	1	Publication
2024/10/08	09:30	0	3	kmelia1	1	Publication
2024/10/08	09:41	0	4	kmelia1	1	Publication
2024/10/08	09:41	0	3	kmelia1	1	Publication
2024/10/08	09:42	0	4	kmelia1	1	Publication
2024/10/08	09:42	0	3	kmelia1	1	Publication
2024/10/08	09:44	0	2	kmelia1	1	Publication
2024/10/08	09:46	0	3	kmelia1	1	Publication
2024/10/08	09:46	0	4	kmelia1	1	Publication
2024/10/08	09:46	0	5	kmelia1	1	Publication
2024/10/08	09:46	0	1	kmelia1	1	Publication
2024/10/08	09:47	0	7	kmelia1	1	Publication
2024/10/08	09:47	0	6	kmelia1	1	Publication
2024/10/08	09:47	0	8	kmelia1	1	Publication
2024/10/08	09:47	0	9	kmelia1	1	Publication
2024/10/08	09:47	0	10	kmelia1	1	Publication
2024/10/08	09:47	0	9	kmelia1	1	Publication
2024/10/08	10:52	0	7	kmelia1	1	Publication
2024/10/08	10:52	0	6	kmelia1	1	Publication
2024/10/08	10:52	0	8	kmelia1	1	Publication
2024/10/08	10:52	0	9	kmelia1	1	Publication
2024/10/08	10:52	0	10	kmelia1	1	Publication
2024/10/08	10:53	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	11:02	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	11:02	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	11:04	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	11:04	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	11:27	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	12:03	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	12:03	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	12:06	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	14:26	0	17	kmelia1	1	Publication
2024/10/08	14:23	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	16:16	0	17	kmelia1	1	Publication
2024/10/08	16:28	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/08	16:29	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/08	16:41	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/08	16:42	0	17	kmelia1	1	Publication
2024/10/08	17:31	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	17:33	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/08	17:34	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/09	14:39	0	9	kmelia1	1	Publication
2024/10/09	14:45	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/09	14:56	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/09	14:58	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/09	15:03	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/09	15:05	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/09	15:11	0	7	kmelia1	1	Publication
2024/10/09	15:11	0	6	kmelia1	1	Publication
2024/10/09	15:11	0	8	kmelia1	1	Publication
2024/10/09	15:11	0	9	kmelia1	1	Publication
2024/10/09	15:11	0	10	kmelia1	1	Publication
2024/10/10	15:21	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/10	15:26	0	11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	1	News
2024/10/10	15:29	0	b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	1	News
2024/10/10	15:32	0	d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	1	News
2024/10/10	15:41	0	17	kmelia1	1	Publication
2024/10/10	15:49	0	14	kmelia1	1	Publication
2024/10/10	15:51	0	1	kmelia1	1	Publication
2024/10/10	15:52	0	4	kmelia1	1	Publication
2024/10/10	15:52	0	2	kmelia1	1	Publication
2024/10/10	15:52	0	3	kmelia1	1	Publication
2024/10/10	15:53	0	5	kmelia1	1	Publication
2024/10/10	15:54	0	7	kmelia1	1	Publication
2024/10/10	15:55	0	6	kmelia1	1	Publication
2024/10/10	15:55	0	8	kmelia1	1	Publication
2024/10/10	15:56	0	9	kmelia1	1	Publication
2024/10/10	15:56	0	10	kmelia1	1	Publication
\.


--
-- TOC entry 5022 (class 0 OID 18732)
-- Dependencies: 311
-- Data for Name: sb_tagcloud_tagcloud; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_tagcloud_tagcloud (id, tag, label, instanceid, externalid, externaltype) FROM stdin;
\.


--
-- TOC entry 5023 (class 0 OID 18735)
-- Dependencies: 312
-- Data for Name: sb_thesaurus_jargon; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_thesaurus_jargon (id, type, idvoca, iduser) FROM stdin;
\.


--
-- TOC entry 5024 (class 0 OID 18738)
-- Dependencies: 313
-- Data for Name: sb_thesaurus_synonym; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_thesaurus_synonym (id, idvoca, idtree, idterm, name) FROM stdin;
\.


--
-- TOC entry 5025 (class 0 OID 18741)
-- Dependencies: 314
-- Data for Name: sb_thesaurus_vocabulary; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_thesaurus_vocabulary (id, name, description) FROM stdin;
\.


--
-- TOC entry 5026 (class 0 OID 18746)
-- Dependencies: 315
-- Data for Name: sb_thumbnail_thumbnail; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_thumbnail_thumbnail (instanceid, objectid, objecttype, originalattachmentname, modifiedattachmentname, mimetype, xstart, ystart, xlength, ylength) FROM stdin;
kmelia1	1	1	1727861869601.png	\N	image/png	\N	\N	\N	\N
kmelia1	2	1	1727861916338.png	\N	image/png	\N	\N	\N	\N
kmelia1	3	1	1727861964453.png	\N	image/png	\N	\N	\N	\N
kmelia1	4	1	1727862024493.png	\N	image/png	\N	\N	\N	\N
kmelia1	5	1	1727862076838.png	\N	image/png	\N	\N	\N	\N
quickinfo2	12	1	1727875482911.png	\N	image/png	\N	\N	\N	\N
quickinfo2	13	1	1727875651046.png	\N	image/png	\N	\N	\N	\N
quickinfo2	11	1	1727877221361.png	\N	image/png	\N	\N	\N	\N
kmelia1	14	1	1727963944210.png	\N	image/png	\N	\N	\N	\N
\.


--
-- TOC entry 5027 (class 0 OID 18751)
-- Dependencies: 316
-- Data for Name: sb_tree_tree; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_tree_tree (treeid, id, name, description, creationdate, creatorid, path, levelnumber, fatherid, ordernumber, lang) FROM stdin;
\.


--
-- TOC entry 5028 (class 0 OID 18756)
-- Dependencies: 317
-- Data for Name: sb_tree_treei18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_tree_treei18n (id, treeid, nodeid, lang, name, description) FROM stdin;
\.


--
-- TOC entry 5029 (class 0 OID 18761)
-- Dependencies: 318
-- Data for Name: sb_variables_value; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_variables_value (id, variableid, value, startdate, enddate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5030 (class 0 OID 18766)
-- Dependencies: 319
-- Data for Name: sb_variables_variable; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_variables_variable (id, label, description, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5031 (class 0 OID 18771)
-- Dependencies: 320
-- Data for Name: sb_webconnections_info; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_webconnections_info (connectionid, userid, componentid, paramlogin, parampassword) FROM stdin;
\.


--
-- TOC entry 5032 (class 0 OID 18776)
-- Dependencies: 321
-- Data for Name: sb_workflow_activestate; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_activestate (id, instanceid, state, backstatus, timeoutstatus, timeoutdate) FROM stdin;
\.


--
-- TOC entry 5033 (class 0 OID 18781)
-- Dependencies: 322
-- Data for Name: sb_workflow_error; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_error (id, instanceid, stepid, errormessage, stacktrace, userid, actionname, actiondate, userrole, statename) FROM stdin;
\.


--
-- TOC entry 5034 (class 0 OID 18786)
-- Dependencies: 323
-- Data for Name: sb_workflow_historystep; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_historystep (instanceid, id, userid, substituteid, userrolename, action, actiondate, resolvedstate, tostate, actionstatus) FROM stdin;
\.


--
-- TOC entry 5035 (class 0 OID 18789)
-- Dependencies: 324
-- Data for Name: sb_workflow_interesteduser; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_interesteduser (id, userid, usersrole, instanceid, state, role, groupid) FROM stdin;
\.


--
-- TOC entry 5036 (class 0 OID 18792)
-- Dependencies: 325
-- Data for Name: sb_workflow_lockinguser; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_lockinguser (id, userid, instanceid, state, lockdate) FROM stdin;
\.


--
-- TOC entry 5037 (class 0 OID 18795)
-- Dependencies: 326
-- Data for Name: sb_workflow_processinstance; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_processinstance (instanceid, modelid, locked, errorstatus, timeoutstatus) FROM stdin;
\.


--
-- TOC entry 5038 (class 0 OID 18800)
-- Dependencies: 327
-- Data for Name: sb_workflow_question; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_question (id, instanceid, questiontext, responsetext, questiondate, responsedate, fromstate, targetstate, fromuserid, touserid, relevant) FROM stdin;
\.


--
-- TOC entry 5039 (class 0 OID 18805)
-- Dependencies: 328
-- Data for Name: sb_workflow_replacements; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_replacements (id, incumbentid, substituteid, workflowid, startdate, enddate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5040 (class 0 OID 18808)
-- Dependencies: 329
-- Data for Name: sb_workflow_undo_step; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_undo_step (id, stepid, instanceid, action, parameters) FROM stdin;
\.


--
-- TOC entry 5041 (class 0 OID 18811)
-- Dependencies: 330
-- Data for Name: sb_workflow_userinfo; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_userinfo (id, settingsid, name, value) FROM stdin;
\.


--
-- TOC entry 5042 (class 0 OID 18814)
-- Dependencies: 331
-- Data for Name: sb_workflow_usersettings; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_usersettings (settingsid, userid, peasid) FROM stdin;
\.


--
-- TOC entry 5043 (class 0 OID 18817)
-- Dependencies: 332
-- Data for Name: sb_workflow_workinguser; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sb_workflow_workinguser (id, userid, usersrole, instanceid, state, role, groupid) FROM stdin;
\.


--
-- TOC entry 5044 (class 0 OID 18820)
-- Dependencies: 333
-- Data for Name: sc_blog_post; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_blog_post (pubid, dateevent, instanceid) FROM stdin;
\.


--
-- TOC entry 5045 (class 0 OID 18824)
-- Dependencies: 334
-- Data for Name: sc_classifieds_classifieds; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_classifieds_classifieds (classifiedid, instanceid, title, description, price, creatorid, creationdate, updatedate, status, validatorid, validatedate) FROM stdin;
\.


--
-- TOC entry 5046 (class 0 OID 18829)
-- Dependencies: 335
-- Data for Name: sc_classifieds_subscribes; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_classifieds_subscribes (subscribeid, userid, instanceid, field1, field2) FROM stdin;
\.


--
-- TOC entry 5047 (class 0 OID 18832)
-- Dependencies: 336
-- Data for Name: sc_community; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_community (id, instanceid, spaceid, groupid, homepage, homepagetype, charterurl) FROM stdin;
\.


--
-- TOC entry 5048 (class 0 OID 18837)
-- Dependencies: 337
-- Data for Name: sc_community_membership; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_community_membership (id, community, userid, status, joiningdate, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5049 (class 0 OID 18840)
-- Dependencies: 338
-- Data for Name: sc_connecteurjdbc_connectinfo; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_connecteurjdbc_connectinfo (id, datasource, login, password, sqlreq, rowlimit, instanceid) FROM stdin;
\.


--
-- TOC entry 5050 (class 0 OID 18845)
-- Dependencies: 339
-- Data for Name: sc_contact_groupfather; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_contact_groupfather (groupid, fatherid, instanceid) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 18848)
-- Dependencies: 340
-- Data for Name: sc_delegatednews_news; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_delegatednews_news (pubid, instanceid, status, contributorid, validatorid, validationdate, begindate, enddate, newsorder) FROM stdin;
\.


--
-- TOC entry 5052 (class 0 OID 18852)
-- Dependencies: 341
-- Data for Name: sc_formsonline_forminstances; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_formsonline_forminstances (id, formid, state, creatorid, creationdate, instanceid) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 18855)
-- Dependencies: 342
-- Data for Name: sc_formsonline_forminstvali; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_formsonline_forminstvali (id, forminstid, validationby, validationtype, status, validationdate, validationcomment, follower) FROM stdin;
\.


--
-- TOC entry 5054 (class 0 OID 18862)
-- Dependencies: 343
-- Data for Name: sc_formsonline_forms; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_formsonline_forms (id, xmlformname, name, description, creationdate, state, instanceid, alreadyused, creatorid, title, hierarchicalvalidation, forminstexchangereceiver, deleteafterforminstexchange) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 18872)
-- Dependencies: 344
-- Data for Name: sc_formsonline_grouprights; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_formsonline_grouprights (formid, instanceid, groupid, righttype) FROM stdin;
\.


--
-- TOC entry 5056 (class 0 OID 18875)
-- Dependencies: 345
-- Data for Name: sc_formsonline_userrights; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_formsonline_userrights (formid, instanceid, userid, righttype) FROM stdin;
\.


--
-- TOC entry 5057 (class 0 OID 18878)
-- Dependencies: 346
-- Data for Name: sc_forums_forum; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_forums_forum (forumid, forumname, forumdescription, forumcreationdate, forumclosedate, forumcreator, forumactive, forumparent, forummodes, forumlocklevel, instanceid, categoryid) FROM stdin;
\.


--
-- TOC entry 5058 (class 0 OID 18884)
-- Dependencies: 347
-- Data for Name: sc_forums_historyuser; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_forums_historyuser (userid, messageid, lastaccess) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 18887)
-- Dependencies: 348
-- Data for Name: sc_forums_message; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_forums_message (messageid, messagetitle, messageauthor, forumid, messageparentid, messagedate, status) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 18892)
-- Dependencies: 349
-- Data for Name: sc_forums_rights; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_forums_rights (userid, forumid) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 18897)
-- Dependencies: 350
-- Data for Name: sc_gallery_internal; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_internal (mediaid, filename, filesize, filemimetype, download, begindownloaddate, enddownloaddate) FROM stdin;
\.


--
-- TOC entry 5062 (class 0 OID 18900)
-- Dependencies: 351
-- Data for Name: sc_gallery_media; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_media (mediaid, mediatype, instanceid, title, description, author, keyword, beginvisibilitydate, endvisibilitydate, createdate, createdby, lastupdatedate, lastupdatedby) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 18907)
-- Dependencies: 352
-- Data for Name: sc_gallery_order; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_order (orderid, userid, instanceid, createdate, processdate, processuser) FROM stdin;
\.


--
-- TOC entry 5064 (class 0 OID 18910)
-- Dependencies: 353
-- Data for Name: sc_gallery_orderdetail; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_orderdetail (orderid, mediaid, instanceid, downloaddate, downloaddecision) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 18913)
-- Dependencies: 354
-- Data for Name: sc_gallery_path; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_path (mediaid, instanceid, nodeid) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 18916)
-- Dependencies: 355
-- Data for Name: sc_gallery_photo; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_photo (mediaid, resolutionw, resolutionh) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 18919)
-- Dependencies: 356
-- Data for Name: sc_gallery_sound; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_sound (mediaid, bitrate, duration) FROM stdin;
\.


--
-- TOC entry 5068 (class 0 OID 18922)
-- Dependencies: 357
-- Data for Name: sc_gallery_streaming; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_streaming (mediaid, homepageurl, provider) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 18927)
-- Dependencies: 358
-- Data for Name: sc_gallery_video; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_gallery_video (mediaid, resolutionw, resolutionh, bitrate, duration) FROM stdin;
\.


--
-- TOC entry 5070 (class 0 OID 18930)
-- Dependencies: 359
-- Data for Name: sc_il_extsus; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_il_extsus (letter, email, instanceid) FROM stdin;
\.


--
-- TOC entry 5071 (class 0 OID 18935)
-- Dependencies: 360
-- Data for Name: sc_il_letter; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_il_letter (id, name, description, periode, instanceid) FROM stdin;
\.


--
-- TOC entry 5072 (class 0 OID 18940)
-- Dependencies: 361
-- Data for Name: sc_il_publication; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_il_publication (id, title, description, parutiondate, publicationstate, letterid, instanceid) FROM stdin;
\.


--
-- TOC entry 5073 (class 0 OID 18945)
-- Dependencies: 362
-- Data for Name: sc_kmelia_search; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_kmelia_search (id, instanceid, topicid, userid, searchdate, language, query) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 18948)
-- Dependencies: 363
-- Data for Name: sc_mailinglist_attachment; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mailinglist_attachment (id, version, attachmentsize, attachmentpath, filename, contenttype, md5signature, messageid) FROM stdin;
\.


--
-- TOC entry 5075 (class 0 OID 18953)
-- Dependencies: 364
-- Data for Name: sc_mailinglist_external_user; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mailinglist_external_user (id, version, componentid, email, listid) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 18958)
-- Dependencies: 365
-- Data for Name: sc_mailinglist_internal_sub; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mailinglist_internal_sub (id, version, subscriber_type, externalid, mailinglistid) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 18963)
-- Dependencies: 366
-- Data for Name: sc_mailinglist_list; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mailinglist_list (id, version, componentid) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 18968)
-- Dependencies: 367
-- Data for Name: sc_mailinglist_message; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mailinglist_message (id, version, mailid, componentid, title, summary, sender, sentdate, referenceid, moderated, contenttype, attachmentssize, messageyear, messagemonth, body) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 18973)
-- Dependencies: 368
-- Data for Name: sc_mydb_connectinfo; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_mydb_connectinfo (id, datasource, login, password, tablename, rowlimit, instanceid) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 18978)
-- Dependencies: 369
-- Data for Name: sc_projectmanager_calendar; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_projectmanager_calendar (holidaydate, fatherid, instanceid) FROM stdin;
\.


--
-- TOC entry 5081 (class 0 OID 18981)
-- Dependencies: 370
-- Data for Name: sc_projectmanager_resources; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_projectmanager_resources (id, taskid, resourceid, charge, instanceid) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 18984)
-- Dependencies: 371
-- Data for Name: sc_projectmanager_tasks; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_projectmanager_tasks (id, mereid, chrono, nom, description, organisateurid, responsableid, charge, consomme, raf, avancement, statut, datedebut, datefin, codeprojet, descriptionprojet, estdecomposee, instanceid, path, previousid) FROM stdin;
\.


--
-- TOC entry 5083 (class 0 OID 18989)
-- Dependencies: 372
-- Data for Name: sc_questionreply_question; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_questionreply_question (id, title, content, creatorid, creationdate, status, publicreplynumber, privatereplynumber, replynumber, instanceid, categoryid) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 18994)
-- Dependencies: 373
-- Data for Name: sc_questionreply_recipient; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_questionreply_recipient (id, questionid, userid) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 18997)
-- Dependencies: 374
-- Data for Name: sc_questionreply_reply; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_questionreply_reply (id, questionid, title, content, creatorid, creationdate, publicreply, privatereply) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 19002)
-- Dependencies: 375
-- Data for Name: sc_quickinfo_news; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_quickinfo_news (id, instanceid, foreignid, important, broadcastticker, broadcastmandatory, createdate, createdby, lastupdatedate, lastupdatedby, publishdate, publishedby, version) FROM stdin;
11d9277a-4599-4289-81f3-76797d224f11	quickinfo2	13	f	f	f	2024-10-02 15:27:31.011	0	2024-10-10 15:26:17.267	0	2024-10-02 15:27:31.128	0	6
b054c1f5-95b1-44dd-b500-242b31e23ea6	quickinfo2	12	f	f	f	2024-10-02 15:24:42.882	0	2024-10-10 15:29:48.576	0	2024-10-02 15:24:43.002	0	7
d41b970f-639c-4654-b53f-7fff2a8f6d8b	quickinfo2	11	f	f	f	2024-10-02 14:57:28.505	0	2024-10-10 15:32:15.734	0	2024-10-02 14:57:30.12	0	5
\.


--
-- TOC entry 5087 (class 0 OID 19005)
-- Dependencies: 376
-- Data for Name: sc_resources_category; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_resources_category (id, instanceid, name, creationdate, updatedate, bookable, form, responsibleid, createrid, updaterid, description) FROM stdin;
\.


--
-- TOC entry 5088 (class 0 OID 19010)
-- Dependencies: 377
-- Data for Name: sc_resources_managers; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_resources_managers (resourceid, managerid) FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 19013)
-- Dependencies: 378
-- Data for Name: sc_resources_reservation; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_resources_reservation (id, instanceid, evenement, userid, creationdate, updatedate, begindate, enddate, reason, place, status) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 19018)
-- Dependencies: 379
-- Data for Name: sc_resources_reservedresource; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_resources_reservedresource (reservationid, resourceid, status) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 19021)
-- Dependencies: 380
-- Data for Name: sc_resources_resource; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_resources_resource (id, instanceid, categoryid, name, creationdate, updatedate, bookable, responsibleid, createrid, updaterid, description) FROM stdin;
\.


--
-- TOC entry 5092 (class 0 OID 19026)
-- Dependencies: 381
-- Data for Name: sc_rss_channels; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_rss_channels (id, url, safeurl, refreshrate, nbdisplayeditems, displayimage, creatorid, creationdate, instanceid) FROM stdin;
\.


--
-- TOC entry 5093 (class 0 OID 19032)
-- Dependencies: 382
-- Data for Name: sc_scheduleevent_contributor; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_scheduleevent_contributor (id, scheduleeventid, userid, lastvalidation, lastvisit) FROM stdin;
\.


--
-- TOC entry 5094 (class 0 OID 19037)
-- Dependencies: 383
-- Data for Name: sc_scheduleevent_list; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_scheduleevent_list (id, title, description, creationdate, status, creatorid) FROM stdin;
\.


--
-- TOC entry 5095 (class 0 OID 19042)
-- Dependencies: 384
-- Data for Name: sc_scheduleevent_options; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_scheduleevent_options (id, scheduleeventid, optionday, optionhour) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 19047)
-- Dependencies: 385
-- Data for Name: sc_scheduleevent_response; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_scheduleevent_response (id, scheduleeventid, userid, optionid) FROM stdin;
\.


--
-- TOC entry 5097 (class 0 OID 19052)
-- Dependencies: 386
-- Data for Name: sc_silvercrawler_statistic; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_silvercrawler_statistic (datedownload, userid, path, componentid, objecttype) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 19057)
-- Dependencies: 387
-- Data for Name: sc_suggestion; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_suggestion (id, suggestionboxid, title, status, validationdate, validationcomment, validationby, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 19062)
-- Dependencies: 388
-- Data for Name: sc_suggestion_box; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_suggestion_box (id, instanceid, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 19065)
-- Dependencies: 389
-- Data for Name: sc_websites_icons; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_websites_icons (iconsid, iconsname, iconsdescription, iconsaddress) FROM stdin;
0	Icon0	Desc0	/silverpeas/util/icons/Coeur.gif
1	Icon1	Desc1	/silverpeas/util/icons/Actualite.gif
2	Icon2	Desc2	/silverpeas/util/icons/News.gif
3	Icon3	Desc3	/silverpeas/util/icons/Lien.gif
4	Icon4	Desc4	/silverpeas/util/icons/Mot.gif
5	Icon5	Desc5	/silverpeas/util/icons/Download.gif
6	Icon6	Desc6	/silverpeas/util/icons/Audio.gif
7	Icon7	Desc7	/silverpeas/util/icons/Video.gif
8	Icon8	Desc8	/silverpeas/util/icons/Multi.gif
9	Icon9	Desc9	/silverpeas/util/icons/Forum.gif
10	Icon10	Desc10	/silverpeas/util/icons/Perso.gif
11	Icon11	Desc11	/silverpeas/util/icons/Login.gif
12	Icon12	Desc12	/silverpeas/util/icons/Home.gif
13	Icon13	Desc13	/silverpeas/util/icons/Payant.gif
14	Icon14	Desc14	/silverpeas/util/icons/Vente.gif
\.


--
-- TOC entry 5101 (class 0 OID 19070)
-- Dependencies: 390
-- Data for Name: sc_websites_site; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_websites_site (siteid, sitename, sitedescription, sitepage, sitetype, siteauthor, sitedate, sitestate, instanceid, popup) FROM stdin;
\.


--
-- TOC entry 5102 (class 0 OID 19075)
-- Dependencies: 391
-- Data for Name: sc_websites_siteicons; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_websites_siteicons (siteid, iconsid) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 19078)
-- Dependencies: 392
-- Data for Name: sc_whitepages_card; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_whitepages_card (id, userid, hidestatus, instanceid, creationdate, creatorid) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 19083)
-- Dependencies: 393
-- Data for Name: sc_whitepages_searchfields; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sc_whitepages_searchfields (id, instanceid, fieldid) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 19086)
-- Dependencies: 394
-- Data for Name: sr_packages; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.sr_packages (sr_package, sr_version) FROM stdin;
dbbuilder	004
busCore	046
agenda	001
calendar	001
classifyEngine	002
comment	003
contact	003
containerManager	002
contentManager	004
coordinates	003
dateReminder	001
fileSharing	004
formTemplate	010
interests	004
myLinks	005
node	007
notation	003
notificationManager	010
nsChannelPOPUP	005
nsChannelSERVER	002
nsChannelSILVERMAIL	003
pdc	008
pdcSubscription	002
publication	021
question	004
questionContainer	004
quota	002
reminder	003
scheduler	001
silverStatistics	002
socialNetwork	003
statistic	003
tagCloud	002
thesaurus	002
token	001
treeManager	004
variables	001
versioning	014
webConnections	002
workflowEngine	009
almanach	006
blog	002
classifieds	004
community	002
connecteurJDBC	003
delegatedNews	003
formsOnline	003
forums	006
gallery	006
infoLetter	002
kmelia	005
mailingList	004
myDB	003
projectManager	003
questionReply	007
quickinfo	001
resourcesManager	005
rssAgregator	004
scheduleevent	003
silverCrawler	002
suggestionBox	001
webSites	004
whitePages	005
yellowpages	002
\.


--
-- TOC entry 5106 (class 0 OID 19089)
-- Dependencies: 395
-- Data for Name: st_accesslevel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_accesslevel (id, name) FROM stdin;
U	User
A	Administrator
G	Guest
R	Removed
K	KMManager
D	DomainManager
\.


--
-- TOC entry 5107 (class 0 OID 19092)
-- Dependencies: 396
-- Data for Name: st_componentinstance; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_componentinstance (id, spaceid, name, componentname, description, createdby, ordernum, createtime, updatetime, removetime, componentstatus, updatedby, removedby, ispublic, ishidden, lang, isinheritanceblocked) FROM stdin;
3	1	Page d'accueil	webPages		0	1	1727877585010	\N	\N	\N	\N	\N	0	1	fr	0
2	1	Don't miss up	quickinfo		0	2	1727859684064	1727877404937	\N	\N	0	\N	0	0	fr	0
4	1	Welcome 	webPages	A webpage that should appear in the general home page	0	3	1727879314764	\N	\N	\N	\N	\N	1	1	en	0
5	2	🤖 Github - Code Source Silverpeas	hyperlink		0	0	1728293933735	\N	\N	\N	\N	\N	1	0	en	0
6	2	🧩 Redmine - Ticketing Silverpeas	hyperlink		0	1	1728293999194	\N	\N	\N	\N	\N	1	0	en	0
7	2	✉ Silverpeas users Group	hyperlink		0	2	1728294393551	1728294466541	\N	\N	0	\N	1	0	en	0
1	1	Documentation	kmelia		0	0	1727859164795	1728546640494	\N	\N	0	\N	0	0	fr	0
\.


--
-- TOC entry 5108 (class 0 OID 19101)
-- Dependencies: 397
-- Data for Name: st_componentinstancei18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_componentinstancei18n (id, componentid, lang, name, description) FROM stdin;
1	4	fr	Welcome 	A webpage that should appear in the general home page
2	5	fr	🤖 Github - Code Source Silverpeas	
3	6	fr	🧩 Redmine - Ticketing Silverpeas	
4	7	fr	✉ Silverpeas users Group	
\.


--
-- TOC entry 5109 (class 0 OID 19106)
-- Dependencies: 398
-- Data for Name: st_datereminder; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_datereminder (id, resourcetype, resourceid, datereminder, message, processstatus, createdate, createdby, lastupdatedate, lastupdatedby, version) FROM stdin;
\.


--
-- TOC entry 5110 (class 0 OID 19112)
-- Dependencies: 399
-- Data for Name: st_delayednotification; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_delayednotification (id, userid, fromuserid, channel, action, notificationresourceid, language, creationdate, message) FROM stdin;
\.


--
-- TOC entry 5111 (class 0 OID 19117)
-- Dependencies: 400
-- Data for Name: st_delayednotifusersetting; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_delayednotifusersetting (id, userid, channel, frequency) FROM stdin;
\.


--
-- TOC entry 5112 (class 0 OID 19120)
-- Dependencies: 401
-- Data for Name: st_domain; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_domain (id, name, description, propfilename, classname, authenticationserver, thetimestamp, silverpeasserverurl) FROM stdin;
-1	internal	Do not remove - Used by Silverpeas engine	-	-	-	0	
0	domainSilverpeas	default domain for Silverpeas	org.silverpeas.domains.domainSP	org.silverpeas.core.admin.domain.driver.SilverpeasDomainDriver	autDomainSP	0	http://localhost:8000
\.


--
-- TOC entry 5113 (class 0 OID 19126)
-- Dependencies: 402
-- Data for Name: st_formdesigner_connectors; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_formdesigner_connectors (id, name, description, driver, url, login, passwd, sqlquery, type) FROM stdin;
0	________	 	 	 	 	 	 	 
\.


--
-- TOC entry 5114 (class 0 OID 19131)
-- Dependencies: 403
-- Data for Name: st_formdesigner_formdesign; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_formdesigner_formdesign (id, refidform, componentid, name, description, creationdate, author) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 19136)
-- Dependencies: 404
-- Data for Name: st_formeditor_formedited; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_formeditor_formedited (id, formid, userid, createdate, modifydate) FROM stdin;
\.


--
-- TOC entry 5116 (class 0 OID 19139)
-- Dependencies: 405
-- Data for Name: st_formeditor_formediteddata; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_formeditor_formediteddata (id, formeditedid, editedkey, editedvalue) FROM stdin;
\.


--
-- TOC entry 5117 (class 0 OID 19144)
-- Dependencies: 406
-- Data for Name: st_group; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_group (id, domainid, specificid, supergroupid, name, description, synchrorule, creationdate, savedate, state, statesavedate) FROM stdin;
\.


--
-- TOC entry 5118 (class 0 OID 19149)
-- Dependencies: 407
-- Data for Name: st_group_user_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_group_user_rel (groupid, userid) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 19152)
-- Dependencies: 408
-- Data for Name: st_groupuserrole; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_groupuserrole (id, groupid, rolename) FROM stdin;
\.


--
-- TOC entry 5120 (class 0 OID 19155)
-- Dependencies: 409
-- Data for Name: st_groupuserrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_groupuserrole_group_rel (groupuserroleid, groupid) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 19158)
-- Dependencies: 410
-- Data for Name: st_groupuserrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_groupuserrole_user_rel (groupuserroleid, userid) FROM stdin;
\.


--
-- TOC entry 5122 (class 0 OID 19161)
-- Dependencies: 411
-- Data for Name: st_instance_data; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_instance_data (id, componentid, name, label, value) FROM stdin;
65	5	URL	URL	https://github.com/Silverpeas/
66	5	openNewWindow	Ouvrir dans une nouvelle fenetre	yes
67	5	isInternalLink	Lien interne	no
68	5	clientSSO	Authentification automatique	no
69	5	login	Nom du champ 'Login'	
70	5	password	Nom du champ 'Mot de passe'	
71	5	method	Méthode du formulaire	GET
72	5	nameParam1	Paramètre sup 1	
73	5	valueParam1	Valeur paramètre 1	
74	5	nameParam2	Paramètre sup 2	
75	5	valueParam2	Valeur paramètre 2	
76	5	nameParam3	Paramètre sup 3	
77	5	valueParam3	Valeur paramètre 3	
78	5	nameParam4	Paramètre sup 4	
79	5	valueParam4	Valeur paramètre 4	
80	5	nameParam5	Paramètre sup 5	
81	5	valueParam5	Valeur paramètre 5	
82	6	URL	URL	https://tracker.silverpeas.org/
83	6	openNewWindow	Ouvrir dans une nouvelle fenetre	yes
84	6	isInternalLink	Lien interne	no
85	6	clientSSO	Authentification automatique	no
86	6	login	Nom du champ 'Login'	
87	6	password	Nom du champ 'Mot de passe'	
88	6	method	Méthode du formulaire	GET
51	2	usePdc	Classification PDC	no
52	2	comments	Commentaires	yes
53	2	delegatedNews	Actualités déléguées	no
54	2	broadcasting	Diffusion annexe	none
55	2	userview	Vue des lecteurs	mosaic
56	2	thumbnailMandatory	Visuel obligatoire	yes
57	2	thumbnailWidthSize	Largeur de recadrage	800
58	2	thumbnailHeightSize	Hauteur de recadrage	534
59	3	useSubscription	Gestion de l'abonnement	no
60	3	xmlTemplate	Formulaire utilisé	auroraspacehomepage.xml
61	3	xmlTemplate2	Autre formulaire utilisé	
62	4	useSubscription	Gestion de l'abonnement	no
63	4	xmlTemplate	Formulaire utilisé	
64	4	xmlTemplate2	Autre formulaire utilisé	
89	6	nameParam1	Paramètre sup 1	
90	6	valueParam1	Valeur paramètre 1	
91	6	nameParam2	Paramètre sup 2	
92	6	valueParam2	Valeur paramètre 2	
93	6	nameParam3	Paramètre sup 3	
94	6	valueParam3	Valeur paramètre 3	
95	6	nameParam4	Paramètre sup 4	
96	6	valueParam4	Valeur paramètre 4	
97	6	nameParam5	Paramètre sup 5	
98	6	valueParam5	Valeur paramètre 5	
1	1	isTree	Arborescence	0
2	1	delegatedTopicManagement	Gestion déléguée	no
3	1	rightsOnTopics	Droits spécifiques	no
4	1	wysiwygOnTopics	Description riche	no
5	1	displayNB	Nombre de publications	yes
6	1	nbPubliOnRoot	Nb dernières publi	0
7	1	nbPubliPerPage	Nombre par page	
8	1	publicationSort	Ordre d'affichage	2
22	1	publicationAlwaysVisible	Publication toujours visible	no
23	1	coWriting	Co-rédaction	no
24	1	suppressionOnlyForAdmin	Suppression restreinte	no
25	1	XmlFormForPublis	Formulaire complémentaire	
26	1	tabAttachments	Fichiers joints	yes
27	1	attachmentsInPubList	Listing	no
28	1	openSingleAttachment	Ouverture directe	no
29	1	authorizedFileExtension	Extension(s) autorisée(s)	
30	1	forbiddenFileExtension	Extension(s) interdite(s)	
99	7	URL	URL	https://groups.google.com/g/silverpeas-users?pli=1
100	7	openNewWindow	Ouvrir dans une nouvelle fenetre	yes
101	7	isInternalLink	Lien interne	no
102	7	clientSSO	Authentification automatique	no
103	7	login	Nom du champ 'Login'	
104	7	password	Nom du champ 'Mot de passe'	
105	7	method	Méthode du formulaire	GET
106	7	nameParam1	Paramètre sup 1	
107	7	valueParam1	Valeur paramètre 1	
108	7	nameParam2	Paramètre sup 2	
109	7	valueParam2	Valeur paramètre 2	
110	7	nameParam3	Paramètre sup 3	
111	7	valueParam3	Valeur paramètre 3	
112	7	nameParam4	Paramètre sup 4	
113	7	valueParam4	Valeur paramètre 4	
114	7	nameParam5	Paramètre sup 5	
115	7	valueParam5	Valeur paramètre 5	
9	1	draft	Mode brouillon	no
10	1	codification	Codification unique	no
11	1	useAuthor	Champ Auteur	no
12	1	useReminder	Rappel	no
13	1	tabContent	Contenu	yes
14	1	tabSeeAlso	Voir Aussi	no
15	1	tabAccessPaths	Emplacements multiples	no
16	1	tabReadersList	Contrôles de lecture	no
17	1	tabComments	Commentaires	no
18	1	tabLastVisitors	Derniers visiteurs	no
19	1	notifications	Notifications	yes
20	1	publicationRating	Notes	no
21	1	targetValidation	Mode de validation	0
31	1	massiveDragAndDrop	Glisser / Déposer	yes
32	1	importFiles	Importation	0
33	1	nbDayForReservation	Gestion des retards	
34	1	XmlFormForFiles	Formulaire complémentaire	
35	1	versionControl	Suivi de versions	no
36	1	hideAllVersionsLink	Dernière version publique	no
37	1	publicFiles	Banque de fichiers	no
38	1	useFolderSharing	Dossiers	0
39	1	usePublicationSharing	Publications	0
40	1	useFileSharing	Fichiers	0
41	1	usePdc	Classification PDC	no
42	1	axisIdGlossary	Lexique	
43	1	searchOnTopics	Recherche locale	yes
44	1	privateSearch	Exclu de la recherche générale	no
45	1	thumbnailMandatory	Vignette obligatoire	no
46	1	thumbnailWidthSize	Largeur de la vignette	
47	1	thumbnailHeightSize	Hauteur de la vignette	
48	1	exportApplication	Exportation de l'application	0
49	1	exportTopic	Exportation de dossiers	0
50	1	exportPublication	Exportation de publications	0
\.


--
-- TOC entry 5123 (class 0 OID 19166)
-- Dependencies: 412
-- Data for Name: st_instance_modelused; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_instance_modelused (instanceid, modelid, objectid) FROM stdin;
\.


--
-- TOC entry 5124 (class 0 OID 19170)
-- Dependencies: 413
-- Data for Name: st_keystore; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_keystore (userkey, login, domainid) FROM stdin;
\.


--
-- TOC entry 5125 (class 0 OID 19173)
-- Dependencies: 414
-- Data for Name: st_longtext; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_longtext (id, ordernum, bodycontent) FROM stdin;
6	0	Sujet : End of session on 21:16 (07/10/2024) <br><br>If you don't reply, the system will end your session !<!--BEFORE_MESSAGE_FOOTER--><!--AFTER_MESSAGE_FOOTER-->
9	0	Sujet : End of session on 21:15 (08/10/2024) <br><br>If you don't reply, the system will end your session !<!--BEFORE_MESSAGE_FOOTER--><!--AFTER_MESSAGE_FOOTER-->
\.


--
-- TOC entry 5126 (class 0 OID 19178)
-- Dependencies: 415
-- Data for Name: st_notifaddress; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifaddress (id, userid, notifname, notifchannelid, address, usage, priority) FROM stdin;
\.


--
-- TOC entry 5127 (class 0 OID 19181)
-- Dependencies: 416
-- Data for Name: st_notifchannel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifchannel (id, name, description, couldbeadded, fromavailable, subjectavailable) FROM stdin;
1	SMTP		Y	E	Y
2	SMS		Y	 	N
3	POPUP		N	I	N
4	SILVERMAIL		N	I	Y
5	REMOVE		N	 	N
6	SERVER		N	 	N
\.


--
-- TOC entry 5128 (class 0 OID 19187)
-- Dependencies: 417
-- Data for Name: st_notifdefaultaddress; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifdefaultaddress (id, userid, notifaddressid) FROM stdin;
\.


--
-- TOC entry 5129 (class 0 OID 19190)
-- Dependencies: 418
-- Data for Name: st_notificationresource; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notificationresource (id, componentinstanceid, resourceid, resourcetype, resourcename, resourcedescription, resourcelocation, resourceurl, attachmenttargetid, resourcedetails) FROM stdin;
\.


--
-- TOC entry 5130 (class 0 OID 19195)
-- Dependencies: 419
-- Data for Name: st_notifpreference; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifpreference (id, notifaddressid, componentinstanceid, userid, messagetype) FROM stdin;
\.


--
-- TOC entry 5131 (class 0 OID 19198)
-- Dependencies: 420
-- Data for Name: st_notifsended; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifsended (notifid, userid, messagetype, notifdate, title, link, sessionid, componentid, body) FROM stdin;
\.


--
-- TOC entry 5132 (class 0 OID 19203)
-- Dependencies: 421
-- Data for Name: st_notifsendedreceiver; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_notifsendedreceiver (notifid, userid) FROM stdin;
\.


--
-- TOC entry 5133 (class 0 OID 19206)
-- Dependencies: 422
-- Data for Name: st_popupmessage; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_popupmessage (id, userid, body, senderid, sendername, answerallowed, source, url, msgdate, msgtime) FROM stdin;
\.


--
-- TOC entry 5134 (class 0 OID 19212)
-- Dependencies: 423
-- Data for Name: st_quota; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_quota (id, quotatype, resourceid, mincount, maxcount, currentcount, savedate) FROM stdin;
\.


--
-- TOC entry 5135 (class 0 OID 19215)
-- Dependencies: 424
-- Data for Name: st_servermessage; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_servermessage (id, userid, header, subject, body, sessionid, type) FROM stdin;
\.


--
-- TOC entry 5136 (class 0 OID 19220)
-- Dependencies: 425
-- Data for Name: st_silvermailmessage; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_silvermailmessage (id, userid, folderid, header, sendername, subject, body, source, url, datemsg, readen) FROM stdin;
\.


--
-- TOC entry 5137 (class 0 OID 19225)
-- Dependencies: 426
-- Data for Name: st_space; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_space (id, domainfatherid, name, description, createdby, firstpagetype, firstpageextraparam, ordernum, createtime, updatetime, removetime, spacestatus, updatedby, removedby, lang, isinheritanceblocked, look, displayspacefirst, ispersonal) FROM stdin;
1	\N	WELCOME	This space is using like a demo. When you are friendly with Silverpeas usage, delete this space.	0	0		0	1727855046856	1727859760358	\N	\N	0	\N	en	0	\N	1	\N
2	\N	Silverpeas links		0	0		1	1728293803132	\N	\N	\N	\N	\N	en	0	\N	1	\N
\.


--
-- TOC entry 5138 (class 0 OID 19232)
-- Dependencies: 427
-- Data for Name: st_spacei18n; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_spacei18n (id, spaceid, lang, name, description) FROM stdin;
1	1	fr	WELCOME	This space is using like a demo. When you are friendly with Silverpeas usage, delete this space.
2	2	fr	Silverpeas links	
\.


--
-- TOC entry 5139 (class 0 OID 19237)
-- Dependencies: 428
-- Data for Name: st_spaceuserrole; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_spaceuserrole (id, spaceid, name, rolename, description, isinherited) FROM stdin;
1	1	Manager d'espace	Manager		0
2	1		admin		0
\.


--
-- TOC entry 5140 (class 0 OID 19243)
-- Dependencies: 429
-- Data for Name: st_spaceuserrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_spaceuserrole_group_rel (spaceuserroleid, groupid) FROM stdin;
\.


--
-- TOC entry 5141 (class 0 OID 19246)
-- Dependencies: 430
-- Data for Name: st_spaceuserrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_spaceuserrole_user_rel (spaceuserroleid, userid) FROM stdin;
1	0
2	0
\.


--
-- TOC entry 5142 (class 0 OID 19249)
-- Dependencies: 431
-- Data for Name: st_token; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_token (id, tokentype, resourceid, token, savecount, savedate) FROM stdin;
1	USER	0	e49fca8c9fe84143bba567f520e73ca9	1	2024-09-25 11:15:43.16
\.


--
-- TOC entry 5143 (class 0 OID 19252)
-- Dependencies: 432
-- Data for Name: st_user; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_user (id, domainid, specificid, firstname, lastname, email, login, loginmail, accesslevel, loginquestion, loginanswer, creationdate, savedate, version, tosacceptancedate, lastlogindate, nbsuccessfulloginattempts, lastlogincredentialupdatedate, expirationdate, state, statesavedate, notifmanualreceiverlimit, sensitivedata) FROM stdin;
0	0	0		Administrateur	silveradmin@localhost	SilverAdmin	\N	A	\N	\N	\N	2024-10-10 15:21:28.026	27	\N	2024-10-10 15:21:28.023	27	\N	\N	VALID	2024-09-25 10:37:49.431736	\N	f
\.


--
-- TOC entry 5144 (class 0 OID 19261)
-- Dependencies: 433
-- Data for Name: st_userfavoritespaces; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_userfavoritespaces (id, userid, spaceid) FROM stdin;
\.


--
-- TOC entry 5145 (class 0 OID 19264)
-- Dependencies: 434
-- Data for Name: st_userrole; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_userrole (id, instanceid, name, rolename, description, isinherited, objectid, objecttype) FROM stdin;
1	1		admin		1	\N	\N
2	2		admin		1	\N	\N
3	3		admin		1	\N	\N
4	4		admin		1	\N	\N
\.


--
-- TOC entry 5146 (class 0 OID 19270)
-- Dependencies: 435
-- Data for Name: st_userrole_group_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_userrole_group_rel (userroleid, groupid) FROM stdin;
\.


--
-- TOC entry 5147 (class 0 OID 19273)
-- Dependencies: 436
-- Data for Name: st_userrole_user_rel; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.st_userrole_user_rel (userroleid, userid) FROM stdin;
1	0
2	0
3	0
4	0
\.


--
-- TOC entry 5148 (class 0 OID 19276)
-- Dependencies: 437
-- Data for Name: subscribe; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.subscribe (subscriberid, subscribertype, subscriptionmethod, resourceid, resourcetype, space, instanceid, creatorid, creationdate) FROM stdin;
\.


--
-- TOC entry 5149 (class 0 OID 19281)
-- Dependencies: 438
-- Data for Name: uniqueid; Type: TABLE DATA; Schema: public; Owner: silver
--

COPY public.uniqueid (maxid, tablename) FROM stdin;
1	st_token
5	sb_node_node
3	sb_node_nodei18n
2	sb_contentmanager_instance
2	st_spaceuserrole
2	st_space
2	st_spacei18n
17	sb_publication_publi
17	sb_contentmanager_content
22	sb_simple_document
10	st_longtext
10	st_popupmessage
1	sb_formtemplate_template
1	sb_formtemplate_record
4	st_userrole
7	st_componentinstance
4	st_componentinstancei18n
115	st_instance_data
\.


--
-- TOC entry 4608 (class 2606 OID 19285)
-- Name: st_datereminder const_st_datereminder_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_datereminder
    ADD CONSTRAINT const_st_datereminder_pk PRIMARY KEY (id);


--
-- TOC entry 4611 (class 2606 OID 19287)
-- Name: st_delayednotification const_st_dn_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_pk PRIMARY KEY (id);


--
-- TOC entry 4615 (class 2606 OID 19289)
-- Name: st_delayednotifusersetting const_st_dnus_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_delayednotifusersetting
    ADD CONSTRAINT const_st_dnus_pk PRIMARY KEY (id);


--
-- TOC entry 4654 (class 2606 OID 19291)
-- Name: st_notificationresource const_st_nr_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notificationresource
    ADD CONSTRAINT const_st_nr_pk PRIMARY KEY (id);


--
-- TOC entry 4665 (class 2606 OID 19293)
-- Name: st_quota const_st_quota_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_quota
    ADD CONSTRAINT const_st_quota_pk PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 19295)
-- Name: st_token const_st_token_pk; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_token
    ADD CONSTRAINT const_st_token_pk PRIMARY KEY (id);


--
-- TOC entry 4534 (class 2606 OID 19297)
-- Name: sc_mailinglist_message mailinglist_message_mailid_key; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_message
    ADD CONSTRAINT mailinglist_message_mailid_key UNIQUE (mailid, componentid);


--
-- TOC entry 4165 (class 2606 OID 19299)
-- Name: pdcaxisvalue pdcaxisvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcaxisvalue
    ADD CONSTRAINT pdcaxisvalue_pkey PRIMARY KEY (valueid, axisid);


--
-- TOC entry 4171 (class 2606 OID 19301)
-- Name: pdcclassification_pdcposition pdcclassification_pdcposition_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT pdcclassification_pdcposition_pkey PRIMARY KEY (pdcclassification_id, positions_id);


--
-- TOC entry 4173 (class 2606 OID 19303)
-- Name: pdcclassification_pdcposition pdcclassification_pdcposition_positions_id_key; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT pdcclassification_pdcposition_positions_id_key UNIQUE (positions_id);


--
-- TOC entry 4169 (class 2606 OID 19305)
-- Name: pdcclassification pdcclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcclassification
    ADD CONSTRAINT pdcclassification_pkey PRIMARY KEY (id);


--
-- TOC entry 4177 (class 2606 OID 19307)
-- Name: pdcposition_pdcaxisvalue pdcposition_pdcaxisvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT pdcposition_pdcaxisvalue_pkey PRIMARY KEY (pdcposition_id, axisvalues_valueid, axisvalues_axisid);


--
-- TOC entry 4175 (class 2606 OID 19309)
-- Name: pdcposition pdcposition_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcposition
    ADD CONSTRAINT pdcposition_pkey PRIMARY KEY (id);


--
-- TOC entry 4600 (class 2606 OID 19311)
-- Name: st_accesslevel pk_accesslevel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_accesslevel
    ADD CONSTRAINT pk_accesslevel PRIMARY KEY (id);


--
-- TOC entry 4234 (class 2606 OID 19313)
-- Name: sb_cal_attendees pk_attendee; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT pk_attendee PRIMARY KEY (id);


--
-- TOC entry 4236 (class 2606 OID 19315)
-- Name: sb_cal_attributes pk_attributes; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_attributes
    ADD CONSTRAINT pk_attributes PRIMARY KEY (id, name);


--
-- TOC entry 4463 (class 2606 OID 19317)
-- Name: sc_blog_post pk_blog_post; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_blog_post
    ADD CONSTRAINT pk_blog_post PRIMARY KEY (pubid);


--
-- TOC entry 4242 (class 2606 OID 19319)
-- Name: sb_cal_components pk_calcomponent; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_components
    ADD CONSTRAINT pk_calcomponent PRIMARY KEY (id);


--
-- TOC entry 4238 (class 2606 OID 19321)
-- Name: sb_cal_calendar pk_calendar; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_calendar
    ADD CONSTRAINT pk_calendar PRIMARY KEY (id);


--
-- TOC entry 4139 (class 2606 OID 19323)
-- Name: calendarcategory pk_calendarcategory; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendarcategory
    ADD CONSTRAINT pk_calendarcategory PRIMARY KEY (categoryid);


--
-- TOC entry 4141 (class 2606 OID 19325)
-- Name: calendarjournal pk_calendarjournal; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendarjournal
    ADD CONSTRAINT pk_calendarjournal PRIMARY KEY (id);


--
-- TOC entry 4143 (class 2606 OID 19327)
-- Name: calendarjournalattendee pk_calendarjournalattendee; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendarjournalattendee
    ADD CONSTRAINT pk_calendarjournalattendee PRIMARY KEY (journalid, userid);


--
-- TOC entry 4145 (class 2606 OID 19329)
-- Name: calendarjournalcategory pk_calendarjournalcategory; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendarjournalcategory
    ADD CONSTRAINT pk_calendarjournalcategory PRIMARY KEY (journalid, categoryid);


--
-- TOC entry 4147 (class 2606 OID 19331)
-- Name: calendartodo pk_calendartodo; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendartodo
    ADD CONSTRAINT pk_calendartodo PRIMARY KEY (id);


--
-- TOC entry 4149 (class 2606 OID 19333)
-- Name: calendartodoattendee pk_calendartodoattendee; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.calendartodoattendee
    ADD CONSTRAINT pk_calendartodoattendee PRIMARY KEY (todoid, userid);


--
-- TOC entry 4240 (class 2606 OID 19335)
-- Name: sb_cal_categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id, category);


--
-- TOC entry 4301 (class 2606 OID 19337)
-- Name: sb_classifyengine_classify pk_classifyengine_classify; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_classifyengine_classify
    ADD CONSTRAINT pk_classifyengine_classify PRIMARY KEY (positionid);


--
-- TOC entry 4303 (class 2606 OID 19339)
-- Name: sb_comment_comment pk_comment_comment; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_comment_comment
    ADD CONSTRAINT pk_comment_comment PRIMARY KEY (commentid);


--
-- TOC entry 4604 (class 2606 OID 19341)
-- Name: st_componentinstance pk_componentinstance; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT pk_componentinstance PRIMARY KEY (id);


--
-- TOC entry 4479 (class 2606 OID 19343)
-- Name: sc_connecteurjdbc_connectinfo pk_connecteurjdbc_connectinfo; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_connecteurjdbc_connectinfo
    ADD CONSTRAINT pk_connecteurjdbc_connectinfo PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 19345)
-- Name: sb_contact_contact pk_contact_contact; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contact_contact
    ADD CONSTRAINT pk_contact_contact PRIMARY KEY (contactid);


--
-- TOC entry 4307 (class 2606 OID 19347)
-- Name: sb_contact_contactfather pk_contact_contactfather; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contact_contactfather
    ADD CONSTRAINT pk_contact_contactfather PRIMARY KEY (contactid, nodeid);


--
-- TOC entry 4309 (class 2606 OID 19349)
-- Name: sb_contact_info pk_contact_info; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contact_info
    ADD CONSTRAINT pk_contact_info PRIMARY KEY (infoid);


--
-- TOC entry 4311 (class 2606 OID 19351)
-- Name: sb_containermanager_instance pk_containermanager_instance; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_containermanager_instance
    ADD CONSTRAINT pk_containermanager_instance PRIMARY KEY (instanceid);


--
-- TOC entry 4314 (class 2606 OID 19353)
-- Name: sb_contentmanager_content pk_contentmanager_content; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contentmanager_content
    ADD CONSTRAINT pk_contentmanager_content PRIMARY KEY (silvercontentid);


--
-- TOC entry 4318 (class 2606 OID 19355)
-- Name: sb_contentmanager_instance pk_contentmanager_instance; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contentmanager_instance
    ADD CONSTRAINT pk_contentmanager_instance PRIMARY KEY (instanceid);


--
-- TOC entry 4321 (class 2606 OID 19357)
-- Name: sb_contribution_tracking pk_contribution_tracking; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contribution_tracking
    ADD CONSTRAINT pk_contribution_tracking PRIMARY KEY (id);


--
-- TOC entry 4324 (class 2606 OID 19359)
-- Name: sb_coordinates_coordinates pk_coordinates_coordinates; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_coordinates_coordinates
    ADD CONSTRAINT pk_coordinates_coordinates PRIMARY KEY (coordinatesid, nodeid, instanceid);


--
-- TOC entry 4484 (class 2606 OID 19361)
-- Name: sc_delegatednews_news pk_delegatednews_news; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_delegatednews_news
    ADD CONSTRAINT pk_delegatednews_news PRIMARY KEY (pubid);


--
-- TOC entry 4151 (class 2606 OID 19363)
-- Name: domainsp_group pk_domainsp_group; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT pk_domainsp_group PRIMARY KEY (id);


--
-- TOC entry 4155 (class 2606 OID 19365)
-- Name: domainsp_group_user_rel pk_domainsp_group_user_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT pk_domainsp_group_user_rel PRIMARY KEY (groupid, userid);


--
-- TOC entry 4157 (class 2606 OID 19367)
-- Name: domainsp_user pk_domainsp_user; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_user
    ADD CONSTRAINT pk_domainsp_user PRIMARY KEY (id);


--
-- TOC entry 4244 (class 2606 OID 19369)
-- Name: sb_cal_event pk_event; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- TOC entry 4400 (class 2606 OID 19371)
-- Name: sb_sn_externalaccount pk_externalaccount; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_sn_externalaccount
    ADD CONSTRAINT pk_externalaccount PRIMARY KEY (profileid, networkid);


--
-- TOC entry 4330 (class 2606 OID 19373)
-- Name: sb_formtemplate_record pk_formtemplate_record; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT pk_formtemplate_record PRIMARY KEY (recordid);


--
-- TOC entry 4334 (class 2606 OID 19375)
-- Name: sb_formtemplate_template pk_formtemplate_template; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_template
    ADD CONSTRAINT pk_formtemplate_template PRIMARY KEY (templateid);


--
-- TOC entry 4338 (class 2606 OID 19377)
-- Name: sb_formtemplate_templatefield pk_formtemplate_templatefield; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT pk_formtemplate_templatefield PRIMARY KEY (templateid, fieldname);


--
-- TOC entry 4492 (class 2606 OID 19379)
-- Name: sc_forums_forum pk_forums_forum; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_forums_forum
    ADD CONSTRAINT pk_forums_forum PRIMARY KEY (forumid);


--
-- TOC entry 4494 (class 2606 OID 19381)
-- Name: sc_forums_historyuser pk_forums_historyuser; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_forums_historyuser
    ADD CONSTRAINT pk_forums_historyuser PRIMARY KEY (userid, messageid);


--
-- TOC entry 4496 (class 2606 OID 19383)
-- Name: sc_forums_message pk_forums_message; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_forums_message
    ADD CONSTRAINT pk_forums_message PRIMARY KEY (messageid);


--
-- TOC entry 4498 (class 2606 OID 19385)
-- Name: sc_forums_rights pk_forums_rights; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_forums_rights
    ADD CONSTRAINT pk_forums_rights PRIMARY KEY (userid, forumid);


--
-- TOC entry 4630 (class 2606 OID 19387)
-- Name: st_group pk_group; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT pk_group PRIMARY KEY (id);


--
-- TOC entry 4636 (class 2606 OID 19389)
-- Name: st_group_user_rel pk_group_user_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT pk_group_user_rel PRIMARY KEY (groupid, userid);


--
-- TOC entry 4520 (class 2606 OID 19391)
-- Name: sc_il_letter pk_infoletter_letter; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_il_letter
    ADD CONSTRAINT pk_infoletter_letter PRIMARY KEY (id);


--
-- TOC entry 4522 (class 2606 OID 19393)
-- Name: sc_il_publication pk_infoletter_publication; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_il_publication
    ADD CONSTRAINT pk_infoletter_publication PRIMARY KEY (id);


--
-- TOC entry 4638 (class 2606 OID 19395)
-- Name: st_instance_data pk_instance_data; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT pk_instance_data PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 19397)
-- Name: sb_interests pk_interests; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_interests
    ADD CONSTRAINT pk_interests PRIMARY KEY (id);


--
-- TOC entry 4345 (class 2606 OID 19399)
-- Name: sb_interests_axis pk_interests_axis; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_interests_axis
    ADD CONSTRAINT pk_interests_axis PRIMARY KEY (id);


--
-- TOC entry 4524 (class 2606 OID 19401)
-- Name: sc_kmelia_search pk_kmelia_search; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_kmelia_search
    ADD CONSTRAINT pk_kmelia_search PRIMARY KEY (id);


--
-- TOC entry 4526 (class 2606 OID 19403)
-- Name: sc_mailinglist_attachment pk_mailinglist_attachment; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_attachment
    ADD CONSTRAINT pk_mailinglist_attachment PRIMARY KEY (id);


--
-- TOC entry 4528 (class 2606 OID 19405)
-- Name: sc_mailinglist_external_user pk_mailinglist_external_user; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_external_user
    ADD CONSTRAINT pk_mailinglist_external_user PRIMARY KEY (id);


--
-- TOC entry 4530 (class 2606 OID 19407)
-- Name: sc_mailinglist_internal_sub pk_mailinglist_internal_sub; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_internal_sub
    ADD CONSTRAINT pk_mailinglist_internal_sub PRIMARY KEY (id);


--
-- TOC entry 4532 (class 2606 OID 19409)
-- Name: sc_mailinglist_list pk_mailinglist_list; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_list
    ADD CONSTRAINT pk_mailinglist_list PRIMARY KEY (id);


--
-- TOC entry 4536 (class 2606 OID 19411)
-- Name: sc_mailinglist_message pk_mailinglist_message; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_message
    ADD CONSTRAINT pk_mailinglist_message PRIMARY KEY (id);


--
-- TOC entry 4161 (class 2606 OID 19413)
-- Name: model pk_model; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT pk_model PRIMARY KEY (id);


--
-- TOC entry 4163 (class 2606 OID 19415)
-- Name: model_contact pk_model_contact; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.model_contact
    ADD CONSTRAINT pk_model_contact PRIMARY KEY (id);


--
-- TOC entry 4538 (class 2606 OID 19417)
-- Name: sc_mydb_connectinfo pk_mydb_connectinfo; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mydb_connectinfo
    ADD CONSTRAINT pk_mydb_connectinfo PRIMARY KEY (id);


--
-- TOC entry 4351 (class 2606 OID 19419)
-- Name: sb_node_node pk_node_node; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_node_node
    ADD CONSTRAINT pk_node_node PRIMARY KEY (nodeid, instanceid);


--
-- TOC entry 4353 (class 2606 OID 19421)
-- Name: sb_node_nodei18n pk_node_nodei18n; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_node_nodei18n
    ADD CONSTRAINT pk_node_nodei18n PRIMARY KEY (id);


--
-- TOC entry 4658 (class 2606 OID 19423)
-- Name: st_notifpreference pk_notifaddr_component; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT pk_notifaddr_component PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 19425)
-- Name: st_notifaddress pk_notifaddress; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT pk_notifaddress PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 19427)
-- Name: st_notifchannel pk_notifchannel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifchannel
    ADD CONSTRAINT pk_notifchannel PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 19429)
-- Name: st_notifsended pk_notifsended; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifsended
    ADD CONSTRAINT pk_notifsended PRIMARY KEY (notifid);


--
-- TOC entry 4663 (class 2606 OID 19431)
-- Name: st_notifsendedreceiver pk_notifsendedreceiver; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifsendedreceiver
    ADD CONSTRAINT pk_notifsendedreceiver PRIMARY KEY (notifid, userid);


--
-- TOC entry 4246 (class 2606 OID 19433)
-- Name: sb_cal_occurrences pk_occurrence; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT pk_occurrence PRIMARY KEY (id);


--
-- TOC entry 4362 (class 2606 OID 19435)
-- Name: sb_pdc_axis pk_pdc_axis; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_axis
    ADD CONSTRAINT pk_pdc_axis PRIMARY KEY (id);


--
-- TOC entry 4364 (class 2606 OID 19437)
-- Name: sb_pdc_axisi18n pk_pdc_axisi18n; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_axisi18n
    ADD CONSTRAINT pk_pdc_axisi18n PRIMARY KEY (id);


--
-- TOC entry 4366 (class 2606 OID 19439)
-- Name: sb_pdc_subscription pk_pdc_subscription; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_subscription
    ADD CONSTRAINT pk_pdc_subscription PRIMARY KEY (id);


--
-- TOC entry 4368 (class 2606 OID 19441)
-- Name: sb_pdc_subscription_axis pk_pdc_subscription_axis; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_subscription_axis
    ADD CONSTRAINT pk_pdc_subscription_axis PRIMARY KEY (id);


--
-- TOC entry 4372 (class 2606 OID 19443)
-- Name: sb_pdc_utilization pk_pdc_utilization; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_utilization
    ADD CONSTRAINT pk_pdc_utilization PRIMARY KEY (id);


--
-- TOC entry 4179 (class 2606 OID 19445)
-- Name: permalinks_document pk_permalinks_document; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.permalinks_document
    ADD CONSTRAINT pk_permalinks_document PRIMARY KEY (documentid);


--
-- TOC entry 4181 (class 2606 OID 19447)
-- Name: permalinks_version pk_permalinks_version; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.permalinks_version
    ADD CONSTRAINT pk_permalinks_version PRIMARY KEY (versionid);


--
-- TOC entry 4183 (class 2606 OID 19449)
-- Name: personalization pk_personalization; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.personalization
    ADD CONSTRAINT pk_personalization PRIMARY KEY (id);


--
-- TOC entry 4540 (class 2606 OID 19451)
-- Name: sc_projectmanager_calendar pk_projectmanager_calendar; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_projectmanager_calendar
    ADD CONSTRAINT pk_projectmanager_calendar PRIMARY KEY (holidaydate, fatherid, instanceid);


--
-- TOC entry 4542 (class 2606 OID 19453)
-- Name: sc_projectmanager_resources pk_projectmanager_resource; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_projectmanager_resources
    ADD CONSTRAINT pk_projectmanager_resource PRIMARY KEY (id);


--
-- TOC entry 4544 (class 2606 OID 19455)
-- Name: sc_projectmanager_tasks pk_projectmanager_tasks; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_projectmanager_tasks
    ADD CONSTRAINT pk_projectmanager_tasks PRIMARY KEY (id);


--
-- TOC entry 4374 (class 2606 OID 19457)
-- Name: sb_publication_publi pk_publication_publi; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_publication_publi
    ADD CONSTRAINT pk_publication_publi PRIMARY KEY (pubid);


--
-- TOC entry 4377 (class 2606 OID 19459)
-- Name: sb_publication_publifather pk_publication_publifather; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_publication_publifather
    ADD CONSTRAINT pk_publication_publifather PRIMARY KEY (pubid, nodeid, instanceid);


--
-- TOC entry 4379 (class 2606 OID 19461)
-- Name: sb_publication_publii18n pk_publication_publii18n; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_publication_publii18n
    ADD CONSTRAINT pk_publication_publii18n PRIMARY KEY (id);


--
-- TOC entry 4381 (class 2606 OID 19463)
-- Name: sb_question_answer pk_question_answer; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_question_answer
    ADD CONSTRAINT pk_question_answer PRIMARY KEY (answerid);


--
-- TOC entry 4383 (class 2606 OID 19465)
-- Name: sb_question_question pk_question_question; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_question_question
    ADD CONSTRAINT pk_question_question PRIMARY KEY (questionid);


--
-- TOC entry 4385 (class 2606 OID 19467)
-- Name: sb_question_questionresult pk_question_questionresult; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_question_questionresult
    ADD CONSTRAINT pk_question_questionresult PRIMARY KEY (qrid);


--
-- TOC entry 4387 (class 2606 OID 19469)
-- Name: sb_question_score pk_question_score; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_question_score
    ADD CONSTRAINT pk_question_score PRIMARY KEY (scoreid);


--
-- TOC entry 4389 (class 2606 OID 19471)
-- Name: sb_questioncontainer_comment pk_questioncontainer_comment; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_questioncontainer_comment
    ADD CONSTRAINT pk_questioncontainer_comment PRIMARY KEY (commentid);


--
-- TOC entry 4391 (class 2606 OID 19473)
-- Name: sb_questioncontainer_qc pk_questioncontainer_qc; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_questioncontainer_qc
    ADD CONSTRAINT pk_questioncontainer_qc PRIMARY KEY (qcid);


--
-- TOC entry 4546 (class 2606 OID 19475)
-- Name: sc_questionreply_question pk_questionreply_question; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_questionreply_question
    ADD CONSTRAINT pk_questionreply_question PRIMARY KEY (id);


--
-- TOC entry 4549 (class 2606 OID 19477)
-- Name: sc_questionreply_recipient pk_questionreply_recipient; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_questionreply_recipient
    ADD CONSTRAINT pk_questionreply_recipient PRIMARY KEY (id);


--
-- TOC entry 4552 (class 2606 OID 19479)
-- Name: sc_questionreply_reply pk_questionreply_reply; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_questionreply_reply
    ADD CONSTRAINT pk_questionreply_reply PRIMARY KEY (id);


--
-- TOC entry 4227 (class 2606 OID 19481)
-- Name: readingcontrol pk_readingcontrol; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.readingcontrol
    ADD CONSTRAINT pk_readingcontrol PRIMARY KEY (pubid, actorid, space, componentname);


--
-- TOC entry 4248 (class 2606 OID 19483)
-- Name: sb_cal_recurrence pk_recurrence; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_recurrence
    ADD CONSTRAINT pk_recurrence PRIMARY KEY (id);


--
-- TOC entry 4396 (class 2606 OID 19485)
-- Name: sb_reminder pk_reminder; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_reminder
    ADD CONSTRAINT pk_reminder PRIMARY KEY (id);


--
-- TOC entry 4453 (class 2606 OID 19487)
-- Name: sb_workflow_replacements pk_replacement; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_replacements
    ADD CONSTRAINT pk_replacement PRIMARY KEY (id);


--
-- TOC entry 4557 (class 2606 OID 19489)
-- Name: sc_resources_category pk_resources_category; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_resources_category
    ADD CONSTRAINT pk_resources_category PRIMARY KEY (id);


--
-- TOC entry 4559 (class 2606 OID 19491)
-- Name: sc_resources_managers pk_resources_managers; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_resources_managers
    ADD CONSTRAINT pk_resources_managers PRIMARY KEY (resourceid, managerid);


--
-- TOC entry 4561 (class 2606 OID 19493)
-- Name: sc_resources_reservation pk_resources_reservation; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_resources_reservation
    ADD CONSTRAINT pk_resources_reservation PRIMARY KEY (id);


--
-- TOC entry 4563 (class 2606 OID 19495)
-- Name: sc_resources_reservedresource pk_resources_reservedresource; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_resources_reservedresource
    ADD CONSTRAINT pk_resources_reservedresource PRIMARY KEY (reservationid, resourceid);


--
-- TOC entry 4565 (class 2606 OID 19497)
-- Name: sc_resources_resource pk_resources_resource; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_resources_resource
    ADD CONSTRAINT pk_resources_resource PRIMARY KEY (id);


--
-- TOC entry 4567 (class 2606 OID 19499)
-- Name: sc_rss_channels pk_rss_channels; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_rss_channels
    ADD CONSTRAINT pk_rss_channels PRIMARY KEY (id);


--
-- TOC entry 4230 (class 2606 OID 19501)
-- Name: sb_agenda_holidays pk_sb_agenda_holidays; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_agenda_holidays
    ADD CONSTRAINT pk_sb_agenda_holidays PRIMARY KEY (userid, holidaydate);


--
-- TOC entry 4232 (class 2606 OID 19503)
-- Name: sb_agenda_import_settings pk_sb_agenda_import_settings_set; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_agenda_import_settings
    ADD CONSTRAINT pk_sb_agenda_import_settings_set PRIMARY KEY (userid);


--
-- TOC entry 4326 (class 2606 OID 19505)
-- Name: sb_filesharing_history pk_sb_filesharing_history; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_filesharing_history
    ADD CONSTRAINT pk_sb_filesharing_history PRIMARY KEY (id);


--
-- TOC entry 4328 (class 2606 OID 19507)
-- Name: sb_filesharing_ticket pk_sb_filesharing_ticket; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_filesharing_ticket
    ADD CONSTRAINT pk_sb_filesharing_ticket PRIMARY KEY (keyfile);


--
-- TOC entry 4347 (class 2606 OID 19509)
-- Name: sb_mylinks_cat pk_sb_mylink_cat; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_mylinks_cat
    ADD CONSTRAINT pk_sb_mylink_cat PRIMARY KEY (catid);


--
-- TOC entry 4349 (class 2606 OID 19511)
-- Name: sb_mylinks_link pk_sb_mylink_link; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_mylinks_link
    ADD CONSTRAINT pk_sb_mylink_link PRIMARY KEY (linkid);


--
-- TOC entry 4357 (class 2606 OID 19513)
-- Name: sb_notation_notation pk_sb_notation_notation; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_notation_notation
    ADD CONSTRAINT pk_sb_notation_notation PRIMARY KEY (id);


--
-- TOC entry 4402 (class 2606 OID 19515)
-- Name: sb_sn_invitation pk_sb_sn_invitation; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_sn_invitation
    ADD CONSTRAINT pk_sb_sn_invitation PRIMARY KEY (id);


--
-- TOC entry 4404 (class 2606 OID 19517)
-- Name: sb_sn_relationship pk_sb_sn_relationship; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_sn_relationship
    ADD CONSTRAINT pk_sb_sn_relationship PRIMARY KEY (id);


--
-- TOC entry 4406 (class 2606 OID 19519)
-- Name: sb_sn_status pk_sb_sn_status; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_sn_status
    ADD CONSTRAINT pk_sb_sn_status PRIMARY KEY (id);


--
-- TOC entry 4408 (class 2606 OID 19521)
-- Name: sb_sn_typerelationship pk_sb_sn_typerelationship; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_sn_typerelationship
    ADD CONSTRAINT pk_sb_sn_typerelationship PRIMARY KEY (id);


--
-- TOC entry 4414 (class 2606 OID 19523)
-- Name: sb_tagcloud_tagcloud pk_sb_tagcloud_tagcloud; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_tagcloud_tagcloud
    ADD CONSTRAINT pk_sb_tagcloud_tagcloud PRIMARY KEY (id);


--
-- TOC entry 4435 (class 2606 OID 19525)
-- Name: sb_webconnections_info pk_sb_webconnections_info; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_webconnections_info
    ADD CONSTRAINT pk_sb_webconnections_info PRIMARY KEY (connectionid);


--
-- TOC entry 4465 (class 2606 OID 19527)
-- Name: sc_classifieds_classifieds pk_sc_classifieds_classifieds; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_classifieds_classifieds
    ADD CONSTRAINT pk_sc_classifieds_classifieds PRIMARY KEY (classifiedid);


--
-- TOC entry 4468 (class 2606 OID 19529)
-- Name: sc_classifieds_subscribes pk_sc_classifieds_subscribes; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_classifieds_subscribes
    ADD CONSTRAINT pk_sc_classifieds_subscribes PRIMARY KEY (userid, instanceid, field1, field2);


--
-- TOC entry 4482 (class 2606 OID 19531)
-- Name: sc_contact_groupfather pk_sc_contact_groupfather; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_contact_groupfather
    ADD CONSTRAINT pk_sc_contact_groupfather PRIMARY KEY (groupid, fatherid, instanceid);


--
-- TOC entry 4486 (class 2606 OID 19533)
-- Name: sc_formsonline_forminstances pk_sc_formsonline_forminstances; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_forminstances
    ADD CONSTRAINT pk_sc_formsonline_forminstances PRIMARY KEY (id);


--
-- TOC entry 4488 (class 2606 OID 19535)
-- Name: sc_formsonline_forminstvali pk_sc_formsonline_forminstvali; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_forminstvali
    ADD CONSTRAINT pk_sc_formsonline_forminstvali PRIMARY KEY (id);


--
-- TOC entry 4490 (class 2606 OID 19537)
-- Name: sc_formsonline_forms pk_sc_formsonline_forms; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_forms
    ADD CONSTRAINT pk_sc_formsonline_forms PRIMARY KEY (id);


--
-- TOC entry 4500 (class 2606 OID 19539)
-- Name: sc_gallery_internal pk_sc_gallery_internal; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_internal
    ADD CONSTRAINT pk_sc_gallery_internal PRIMARY KEY (mediaid);


--
-- TOC entry 4502 (class 2606 OID 19541)
-- Name: sc_gallery_media pk_sc_gallery_media; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_media
    ADD CONSTRAINT pk_sc_gallery_media PRIMARY KEY (mediaid);


--
-- TOC entry 4504 (class 2606 OID 19543)
-- Name: sc_gallery_order pk_sc_gallery_order; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_order
    ADD CONSTRAINT pk_sc_gallery_order PRIMARY KEY (orderid);


--
-- TOC entry 4507 (class 2606 OID 19545)
-- Name: sc_gallery_orderdetail pk_sc_gallery_orderdetail; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_orderdetail
    ADD CONSTRAINT pk_sc_gallery_orderdetail PRIMARY KEY (orderid, mediaid);


--
-- TOC entry 4510 (class 2606 OID 19547)
-- Name: sc_gallery_path pk_sc_gallery_path; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_path
    ADD CONSTRAINT pk_sc_gallery_path PRIMARY KEY (nodeid, mediaid);


--
-- TOC entry 4512 (class 2606 OID 19549)
-- Name: sc_gallery_photo pk_sc_gallery_photo; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_photo
    ADD CONSTRAINT pk_sc_gallery_photo PRIMARY KEY (mediaid);


--
-- TOC entry 4514 (class 2606 OID 19551)
-- Name: sc_gallery_sound pk_sc_gallery_sound; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_sound
    ADD CONSTRAINT pk_sc_gallery_sound PRIMARY KEY (mediaid);


--
-- TOC entry 4516 (class 2606 OID 19553)
-- Name: sc_gallery_streaming pk_sc_gallery_streaming; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_streaming
    ADD CONSTRAINT pk_sc_gallery_streaming PRIMARY KEY (mediaid);


--
-- TOC entry 4518 (class 2606 OID 19555)
-- Name: sc_gallery_video pk_sc_gallery_video; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_gallery_video
    ADD CONSTRAINT pk_sc_gallery_video PRIMARY KEY (mediaid);


--
-- TOC entry 4571 (class 2606 OID 19557)
-- Name: sc_scheduleevent_contributor pk_scheduleevent_contrib; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_contributor
    ADD CONSTRAINT pk_scheduleevent_contrib PRIMARY KEY (id);


--
-- TOC entry 4573 (class 2606 OID 19559)
-- Name: sc_scheduleevent_list pk_scheduleevent_list; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_list
    ADD CONSTRAINT pk_scheduleevent_list PRIMARY KEY (id);


--
-- TOC entry 4575 (class 2606 OID 19561)
-- Name: sc_scheduleevent_options pk_scheduleevent_options; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_options
    ADD CONSTRAINT pk_scheduleevent_options PRIMARY KEY (id);


--
-- TOC entry 4578 (class 2606 OID 19563)
-- Name: sc_scheduleevent_response pk_scheduleevent_response; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT pk_scheduleevent_response PRIMARY KEY (id);


--
-- TOC entry 4398 (class 2606 OID 19565)
-- Name: sb_seealso_link pk_seealso_link; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_seealso_link
    ADD CONSTRAINT pk_seealso_link PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 19567)
-- Name: st_space pk_space; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT pk_space PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 19569)
-- Name: st_spaceuserrole pk_spaceuserrole; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT pk_spaceuserrole PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 19571)
-- Name: st_spaceuserrole_group_rel pk_spaceuserrole_group_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT pk_spaceuserrole_group_rel PRIMARY KEY (spaceuserroleid, groupid);


--
-- TOC entry 4678 (class 2606 OID 19573)
-- Name: st_spaceuserrole_user_rel pk_spaceuserrole_user_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT pk_spaceuserrole_user_rel PRIMARY KEY (spaceuserroleid, userid);


--
-- TOC entry 4598 (class 2606 OID 19575)
-- Name: sr_packages pk_sr_packages; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sr_packages
    ADD CONSTRAINT pk_sr_packages PRIMARY KEY (sr_package);


--
-- TOC entry 4620 (class 2606 OID 19577)
-- Name: st_domain pk_st_domain; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_domain
    ADD CONSTRAINT pk_st_domain PRIMARY KEY (id);


--
-- TOC entry 4622 (class 2606 OID 19579)
-- Name: st_formdesigner_connectors pk_st_formdesigner_connectors; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_formdesigner_connectors
    ADD CONSTRAINT pk_st_formdesigner_connectors PRIMARY KEY (id);


--
-- TOC entry 4624 (class 2606 OID 19581)
-- Name: st_formdesigner_formdesign pk_st_formdesigner_formdesign; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_formdesigner_formdesign
    ADD CONSTRAINT pk_st_formdesigner_formdesign PRIMARY KEY (id);


--
-- TOC entry 4628 (class 2606 OID 19583)
-- Name: st_formeditor_formediteddata pk_st_formeditor_fed; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_formeditor_formediteddata
    ADD CONSTRAINT pk_st_formeditor_fed PRIMARY KEY (id);


--
-- TOC entry 4626 (class 2606 OID 19585)
-- Name: st_formeditor_formedited pk_st_formeditor_formedited; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_formeditor_formedited
    ADD CONSTRAINT pk_st_formeditor_formedited PRIMARY KEY (id);


--
-- TOC entry 4643 (class 2606 OID 19587)
-- Name: st_instance_modelused pk_st_instance_modelused; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_instance_modelused
    ADD CONSTRAINT pk_st_instance_modelused PRIMARY KEY (instanceid, modelid, objectid);


--
-- TOC entry 4645 (class 2606 OID 19589)
-- Name: st_longtext pk_st_longtext; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_longtext
    ADD CONSTRAINT pk_st_longtext PRIMARY KEY (id, ordernum);


--
-- TOC entry 4652 (class 2606 OID 19591)
-- Name: st_notifdefaultaddress pk_st_notifdefaultaddress; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifdefaultaddress
    ADD CONSTRAINT pk_st_notifdefaultaddress PRIMARY KEY (id);


--
-- TOC entry 4417 (class 2606 OID 19593)
-- Name: sb_thesaurus_jargon pk_thesaurus_jargon; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_thesaurus_jargon
    ADD CONSTRAINT pk_thesaurus_jargon PRIMARY KEY (id);


--
-- TOC entry 4419 (class 2606 OID 19595)
-- Name: sb_thesaurus_synonym pk_thesaurus_synonym; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_thesaurus_synonym
    ADD CONSTRAINT pk_thesaurus_synonym PRIMARY KEY (id);


--
-- TOC entry 4422 (class 2606 OID 19597)
-- Name: sb_thesaurus_vocabulary pk_thesaurus_vocabulary; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_thesaurus_vocabulary
    ADD CONSTRAINT pk_thesaurus_vocabulary PRIMARY KEY (id);


--
-- TOC entry 4424 (class 2606 OID 19599)
-- Name: sb_thumbnail_thumbnail pk_thumbnail_thumbnail; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_thumbnail_thumbnail
    ADD CONSTRAINT pk_thumbnail_thumbnail PRIMARY KEY (objectid, objecttype, instanceid);


--
-- TOC entry 4427 (class 2606 OID 19601)
-- Name: sb_tree_tree pk_tree_tree; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_tree_tree
    ADD CONSTRAINT pk_tree_tree PRIMARY KEY (treeid, id);


--
-- TOC entry 4429 (class 2606 OID 19603)
-- Name: sb_tree_treei18n pk_tree_treei18n; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_tree_treei18n
    ADD CONSTRAINT pk_tree_treei18n PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 19605)
-- Name: uniqueid pk_uniqueid; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.uniqueid
    ADD CONSTRAINT pk_uniqueid PRIMARY KEY (tablename);


--
-- TOC entry 4683 (class 2606 OID 19607)
-- Name: st_user pk_user; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 19609)
-- Name: st_userfavoritespaces pk_userfavoritespaces; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT pk_userfavoritespaces PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 19611)
-- Name: st_userrole pk_userrole; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT pk_userrole PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 19613)
-- Name: st_userrole_group_rel pk_userrole_group_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT pk_userrole_group_rel PRIMARY KEY (userroleid, groupid);


--
-- TOC entry 4697 (class 2606 OID 19615)
-- Name: st_userrole_user_rel pk_userrole_user_rel; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT pk_userrole_user_rel PRIMARY KEY (userroleid, userid);


--
-- TOC entry 4431 (class 2606 OID 19617)
-- Name: sb_variables_value pk_variables_value; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_variables_value
    ADD CONSTRAINT pk_variables_value PRIMARY KEY (id);


--
-- TOC entry 4433 (class 2606 OID 19619)
-- Name: sb_variables_variable pk_variables_variable; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_variables_variable
    ADD CONSTRAINT pk_variables_variable PRIMARY KEY (id);


--
-- TOC entry 4586 (class 2606 OID 19621)
-- Name: sc_websites_icons pk_websites_icons; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_websites_icons
    ADD CONSTRAINT pk_websites_icons PRIMARY KEY (iconsid);


--
-- TOC entry 4588 (class 2606 OID 19623)
-- Name: sc_websites_site pk_websites_site; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_websites_site
    ADD CONSTRAINT pk_websites_site PRIMARY KEY (siteid);


--
-- TOC entry 4590 (class 2606 OID 19625)
-- Name: sc_websites_siteicons pk_websites_siteicons; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_websites_siteicons
    ADD CONSTRAINT pk_websites_siteicons PRIMARY KEY (siteid, iconsid);


--
-- TOC entry 4592 (class 2606 OID 19627)
-- Name: sc_whitepages_card pk_whitepages_card; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_whitepages_card
    ADD CONSTRAINT pk_whitepages_card PRIMARY KEY (id);


--
-- TOC entry 4595 (class 2606 OID 19629)
-- Name: sc_whitepages_searchfields pk_whitepages_searchfields; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_whitepages_searchfields
    ADD CONSTRAINT pk_whitepages_searchfields PRIMARY KEY (id);


--
-- TOC entry 4437 (class 2606 OID 19631)
-- Name: sb_workflow_activestate pk_workflow_activestate; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_activestate
    ADD CONSTRAINT pk_workflow_activestate PRIMARY KEY (id);


--
-- TOC entry 4439 (class 2606 OID 19633)
-- Name: sb_workflow_error pk_workflow_error; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_error
    ADD CONSTRAINT pk_workflow_error PRIMARY KEY (id);


--
-- TOC entry 4441 (class 2606 OID 19635)
-- Name: sb_workflow_historystep pk_workflow_historystep; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_historystep
    ADD CONSTRAINT pk_workflow_historystep PRIMARY KEY (id);


--
-- TOC entry 4443 (class 2606 OID 19637)
-- Name: sb_workflow_interesteduser pk_workflow_interesteduser; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_interesteduser
    ADD CONSTRAINT pk_workflow_interesteduser PRIMARY KEY (id);


--
-- TOC entry 4445 (class 2606 OID 19639)
-- Name: sb_workflow_lockinguser pk_workflow_lockinguser; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_lockinguser
    ADD CONSTRAINT pk_workflow_lockinguser PRIMARY KEY (id);


--
-- TOC entry 4447 (class 2606 OID 19641)
-- Name: sb_workflow_processinstance pk_workflow_processinstance; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_processinstance
    ADD CONSTRAINT pk_workflow_processinstance PRIMARY KEY (instanceid);


--
-- TOC entry 4449 (class 2606 OID 19643)
-- Name: sb_workflow_question pk_workflow_question; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_question
    ADD CONSTRAINT pk_workflow_question PRIMARY KEY (id);


--
-- TOC entry 4455 (class 2606 OID 19645)
-- Name: sb_workflow_undo_step pk_workflow_undo_step; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_undo_step
    ADD CONSTRAINT pk_workflow_undo_step PRIMARY KEY (id);


--
-- TOC entry 4457 (class 2606 OID 19647)
-- Name: sb_workflow_userinfo pk_workflow_userinfo; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_userinfo
    ADD CONSTRAINT pk_workflow_userinfo PRIMARY KEY (id);


--
-- TOC entry 4459 (class 2606 OID 19649)
-- Name: sb_workflow_usersettings pk_workflow_usersettings; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_usersettings
    ADD CONSTRAINT pk_workflow_usersettings PRIMARY KEY (settingsid);


--
-- TOC entry 4461 (class 2606 OID 19651)
-- Name: sb_workflow_workinguser pk_workflow_workinguser; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_workinguser
    ADD CONSTRAINT pk_workflow_workinguser PRIMARY KEY (id);


--
-- TOC entry 4185 (class 2606 OID 19653)
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4187 (class 2606 OID 19655)
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- TOC entry 4189 (class 2606 OID 19657)
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4197 (class 2606 OID 19659)
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- TOC entry 4201 (class 2606 OID 19661)
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- TOC entry 4203 (class 2606 OID 19663)
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- TOC entry 4205 (class 2606 OID 19665)
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- TOC entry 4207 (class 2606 OID 19667)
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- TOC entry 4209 (class 2606 OID 19669)
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4211 (class 2606 OID 19671)
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4225 (class 2606 OID 19673)
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4477 (class 2606 OID 19675)
-- Name: sc_community_membership sc_community_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT sc_community_membership_pkey PRIMARY KEY (id);


--
-- TOC entry 4472 (class 2606 OID 19677)
-- Name: sc_community sc_community_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT sc_community_pkey PRIMARY KEY (id);


--
-- TOC entry 4555 (class 2606 OID 19679)
-- Name: sc_quickinfo_news sc_quickinfo_news_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_quickinfo_news
    ADD CONSTRAINT sc_quickinfo_news_pkey PRIMARY KEY (id);


--
-- TOC entry 4584 (class 2606 OID 19681)
-- Name: sc_suggestion_box sc_suggestion_box_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_suggestion_box
    ADD CONSTRAINT sc_suggestion_box_pkey PRIMARY KEY (id);


--
-- TOC entry 4581 (class 2606 OID 19683)
-- Name: sc_suggestion sc_suggestion_pkey; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_suggestion
    ADD CONSTRAINT sc_suggestion_pkey PRIMARY KEY (id);


--
-- TOC entry 4602 (class 2606 OID 19685)
-- Name: st_accesslevel un_accesslevel_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_accesslevel
    ADD CONSTRAINT un_accesslevel_1 UNIQUE (name);


--
-- TOC entry 4474 (class 2606 OID 19687)
-- Name: sc_community un_community; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT un_community UNIQUE (instanceid, spaceid);


--
-- TOC entry 4606 (class 2606 OID 19689)
-- Name: st_componentinstance un_componentinstance_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT un_componentinstance_1 UNIQUE (spaceid, name);


--
-- TOC entry 4153 (class 2606 OID 19691)
-- Name: domainsp_group un_domainsp_group_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT un_domainsp_group_1 UNIQUE (supergroupid, name);


--
-- TOC entry 4159 (class 2606 OID 19693)
-- Name: domainsp_user un_domainsp_user_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_user
    ADD CONSTRAINT un_domainsp_user_1 UNIQUE (login);


--
-- TOC entry 4332 (class 2606 OID 19695)
-- Name: sb_formtemplate_record un_formtemplate_record; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT un_formtemplate_record UNIQUE (templateid, externalid, lang);


--
-- TOC entry 4336 (class 2606 OID 19697)
-- Name: sb_formtemplate_template un_formtemplate_template; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_template
    ADD CONSTRAINT un_formtemplate_template UNIQUE (externalid);


--
-- TOC entry 4340 (class 2606 OID 19699)
-- Name: sb_formtemplate_templatefield un_formtemplate_templatefield; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT un_formtemplate_templatefield UNIQUE (templateid, fieldindex);


--
-- TOC entry 4632 (class 2606 OID 19701)
-- Name: st_group un_group_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT un_group_1 UNIQUE (specificid, domainid);


--
-- TOC entry 4634 (class 2606 OID 19703)
-- Name: st_group un_group_2; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT un_group_2 UNIQUE (supergroupid, name, domainid);


--
-- TOC entry 4640 (class 2606 OID 19705)
-- Name: st_instance_data un_instance_data_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT un_instance_data_1 UNIQUE (componentid, name);


--
-- TOC entry 4355 (class 2606 OID 19707)
-- Name: sb_node_nodei18n un_node_nodei18n; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_node_nodei18n
    ADD CONSTRAINT un_node_nodei18n UNIQUE (nodeid, lang);


--
-- TOC entry 4359 (class 2606 OID 19709)
-- Name: sb_notation_notation un_sb_notation_notation; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_notation_notation
    ADD CONSTRAINT un_sb_notation_notation UNIQUE (instanceid, externalid, externaltype, author);


--
-- TOC entry 4670 (class 2606 OID 19711)
-- Name: st_space un_space_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT un_space_1 UNIQUE (domainfatherid, name);


--
-- TOC entry 4674 (class 2606 OID 19713)
-- Name: st_spaceuserrole un_spaceuserrole_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT un_spaceuserrole_1 UNIQUE (spaceid, rolename, isinherited);


--
-- TOC entry 4685 (class 2606 OID 19715)
-- Name: st_user un_user_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT un_user_1 UNIQUE (specificid, domainid);


--
-- TOC entry 4687 (class 2606 OID 19717)
-- Name: st_user un_user_2; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT un_user_2 UNIQUE (login, domainid);


--
-- TOC entry 4693 (class 2606 OID 19719)
-- Name: st_userrole un_userrole_1; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT un_userrole_1 UNIQUE (instanceid, rolename, isinherited, objectid);


--
-- TOC entry 4316 (class 2606 OID 19721)
-- Name: sb_contentmanager_content uqe_contentmanager_content; Type: CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_contentmanager_content
    ADD CONSTRAINT uqe_contentmanager_content UNIQUE (internalcontentid, contentinstanceid);


--
-- TOC entry 4469 (class 1259 OID 19722)
-- Name: idx_community_component; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_community_component ON public.sc_community USING btree (id, instanceid);


--
-- TOC entry 4475 (class 1259 OID 19723)
-- Name: idx_community_membership; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_community_membership ON public.sc_community_membership USING btree (id, community);


--
-- TOC entry 4470 (class 1259 OID 19724)
-- Name: idx_community_space; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_community_space ON public.sc_community USING btree (id, spaceid);


--
-- TOC entry 4609 (class 1259 OID 19725)
-- Name: idx_datereminder; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_datereminder ON public.st_datereminder USING btree (resourcetype, resourceid);


--
-- TOC entry 4450 (class 1259 OID 19726)
-- Name: idx_incumbent; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_incumbent ON public.sb_workflow_replacements USING btree (incumbentid, workflowid);


--
-- TOC entry 4553 (class 1259 OID 19727)
-- Name: idx_news; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_news ON public.sc_quickinfo_news USING btree (instanceid, id);


--
-- TOC entry 4166 (class 1259 OID 19728)
-- Name: idx_pdcclassification_contentid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_pdcclassification_contentid ON public.pdcclassification USING btree (contentid);


--
-- TOC entry 4167 (class 1259 OID 19729)
-- Name: idx_pdcclassification_instanceid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_pdcclassification_instanceid ON public.pdcclassification USING btree (instanceid);


--
-- TOC entry 4190 (class 1259 OID 19730)
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- TOC entry 4191 (class 1259 OID 19731)
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- TOC entry 4192 (class 1259 OID 19732)
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- TOC entry 4193 (class 1259 OID 19733)
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- TOC entry 4194 (class 1259 OID 19734)
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- TOC entry 4195 (class 1259 OID 19735)
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- TOC entry 4198 (class 1259 OID 19736)
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- TOC entry 4199 (class 1259 OID 19737)
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- TOC entry 4212 (class 1259 OID 19738)
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- TOC entry 4213 (class 1259 OID 19739)
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- TOC entry 4214 (class 1259 OID 19740)
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- TOC entry 4215 (class 1259 OID 19741)
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- TOC entry 4216 (class 1259 OID 19742)
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- TOC entry 4217 (class 1259 OID 19743)
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- TOC entry 4218 (class 1259 OID 19744)
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- TOC entry 4219 (class 1259 OID 19745)
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- TOC entry 4220 (class 1259 OID 19746)
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- TOC entry 4221 (class 1259 OID 19747)
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- TOC entry 4222 (class 1259 OID 19748)
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- TOC entry 4223 (class 1259 OID 19749)
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- TOC entry 4392 (class 1259 OID 19750)
-- Name: idx_reminder_contrib; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_reminder_contrib ON public.sb_reminder USING btree (contrib_id, contrib_instanceid, contrib_type);


--
-- TOC entry 4393 (class 1259 OID 19751)
-- Name: idx_reminder_contrib_user; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_reminder_contrib_user ON public.sb_reminder USING btree (contrib_id, contrib_instanceid, contrib_type, userid);


--
-- TOC entry 4394 (class 1259 OID 19752)
-- Name: idx_reminder_user; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_reminder_user ON public.sb_reminder USING btree (userid);


--
-- TOC entry 4319 (class 1259 OID 19753)
-- Name: idx_sb_contribution_tracking_contribution; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_sb_contribution_tracking_contribution ON public.sb_contribution_tracking USING btree (contrib_id, contrib_type, contrib_instanceid);


--
-- TOC entry 4341 (class 1259 OID 19754)
-- Name: idx_sb_formtemplate_textfield; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_sb_formtemplate_textfield ON public.sb_formtemplate_textfield USING btree (recordid);


--
-- TOC entry 4612 (class 1259 OID 19755)
-- Name: idx_st_dn_channel; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_st_dn_channel ON public.st_delayednotification USING btree (channel);


--
-- TOC entry 4613 (class 1259 OID 19756)
-- Name: idx_st_dn_userid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_st_dn_userid ON public.st_delayednotification USING btree (userid);


--
-- TOC entry 4616 (class 1259 OID 19757)
-- Name: idx_st_dnus_channel; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_st_dnus_channel ON public.st_delayednotifusersetting USING btree (channel);


--
-- TOC entry 4617 (class 1259 OID 19758)
-- Name: idx_st_dnus_uc; Type: INDEX; Schema: public; Owner: silver
--

CREATE UNIQUE INDEX idx_st_dnus_uc ON public.st_delayednotifusersetting USING btree (userid, channel);


--
-- TOC entry 4618 (class 1259 OID 19759)
-- Name: idx_st_dnus_userid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_st_dnus_userid ON public.st_delayednotifusersetting USING btree (userid);


--
-- TOC entry 4655 (class 1259 OID 19760)
-- Name: idx_st_nr_resourceid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_st_nr_resourceid ON public.st_notificationresource USING btree (resourceid);


--
-- TOC entry 4451 (class 1259 OID 19761)
-- Name: idx_substitute; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_substitute ON public.sb_workflow_replacements USING btree (substituteid, workflowid);


--
-- TOC entry 4579 (class 1259 OID 19762)
-- Name: idx_suggestion; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_suggestion ON public.sc_suggestion USING btree (suggestionboxid, id);


--
-- TOC entry 4582 (class 1259 OID 19763)
-- Name: idx_suggestion_box; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX idx_suggestion_box ON public.sc_suggestion_box USING btree (instanceid, id);


--
-- TOC entry 4666 (class 1259 OID 19764)
-- Name: idx_uc_st_quota; Type: INDEX; Schema: public; Owner: silver
--

CREATE UNIQUE INDEX idx_uc_st_quota ON public.st_quota USING btree (quotatype, resourceid);


--
-- TOC entry 4681 (class 1259 OID 19765)
-- Name: idx_uc_st_token; Type: INDEX; Schema: public; Owner: silver
--

CREATE UNIQUE INDEX idx_uc_st_token ON public.st_token USING btree (tokentype, resourceid);


--
-- TOC entry 4249 (class 1259 OID 19766)
-- Name: in_classifyengine_axis0; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis0 ON public.sb_classifyengine_classify USING btree (axis0);


--
-- TOC entry 4250 (class 1259 OID 19767)
-- Name: in_classifyengine_axis1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis1 ON public.sb_classifyengine_classify USING btree (axis1);


--
-- TOC entry 4251 (class 1259 OID 19768)
-- Name: in_classifyengine_axis10; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis10 ON public.sb_classifyengine_classify USING btree (axis10);


--
-- TOC entry 4252 (class 1259 OID 19769)
-- Name: in_classifyengine_axis11; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis11 ON public.sb_classifyengine_classify USING btree (axis11);


--
-- TOC entry 4253 (class 1259 OID 19770)
-- Name: in_classifyengine_axis12; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis12 ON public.sb_classifyengine_classify USING btree (axis12);


--
-- TOC entry 4254 (class 1259 OID 19771)
-- Name: in_classifyengine_axis13; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis13 ON public.sb_classifyengine_classify USING btree (axis13);


--
-- TOC entry 4255 (class 1259 OID 19772)
-- Name: in_classifyengine_axis14; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis14 ON public.sb_classifyengine_classify USING btree (axis14);


--
-- TOC entry 4256 (class 1259 OID 19773)
-- Name: in_classifyengine_axis15; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis15 ON public.sb_classifyengine_classify USING btree (axis15);


--
-- TOC entry 4257 (class 1259 OID 19774)
-- Name: in_classifyengine_axis16; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis16 ON public.sb_classifyengine_classify USING btree (axis16);


--
-- TOC entry 4258 (class 1259 OID 19775)
-- Name: in_classifyengine_axis17; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis17 ON public.sb_classifyengine_classify USING btree (axis17);


--
-- TOC entry 4259 (class 1259 OID 19776)
-- Name: in_classifyengine_axis18; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis18 ON public.sb_classifyengine_classify USING btree (axis18);


--
-- TOC entry 4260 (class 1259 OID 19777)
-- Name: in_classifyengine_axis19; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis19 ON public.sb_classifyengine_classify USING btree (axis19);


--
-- TOC entry 4261 (class 1259 OID 19778)
-- Name: in_classifyengine_axis2; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis2 ON public.sb_classifyengine_classify USING btree (axis2);


--
-- TOC entry 4262 (class 1259 OID 19779)
-- Name: in_classifyengine_axis20; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis20 ON public.sb_classifyengine_classify USING btree (axis20);


--
-- TOC entry 4263 (class 1259 OID 19780)
-- Name: in_classifyengine_axis21; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis21 ON public.sb_classifyengine_classify USING btree (axis21);


--
-- TOC entry 4264 (class 1259 OID 19781)
-- Name: in_classifyengine_axis22; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis22 ON public.sb_classifyengine_classify USING btree (axis22);


--
-- TOC entry 4265 (class 1259 OID 19782)
-- Name: in_classifyengine_axis23; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis23 ON public.sb_classifyengine_classify USING btree (axis23);


--
-- TOC entry 4266 (class 1259 OID 19783)
-- Name: in_classifyengine_axis24; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis24 ON public.sb_classifyengine_classify USING btree (axis24);


--
-- TOC entry 4267 (class 1259 OID 19784)
-- Name: in_classifyengine_axis25; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis25 ON public.sb_classifyengine_classify USING btree (axis25);


--
-- TOC entry 4268 (class 1259 OID 19785)
-- Name: in_classifyengine_axis26; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis26 ON public.sb_classifyengine_classify USING btree (axis26);


--
-- TOC entry 4269 (class 1259 OID 19786)
-- Name: in_classifyengine_axis27; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis27 ON public.sb_classifyengine_classify USING btree (axis27);


--
-- TOC entry 4270 (class 1259 OID 19787)
-- Name: in_classifyengine_axis28; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis28 ON public.sb_classifyengine_classify USING btree (axis28);


--
-- TOC entry 4271 (class 1259 OID 19788)
-- Name: in_classifyengine_axis29; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis29 ON public.sb_classifyengine_classify USING btree (axis29);


--
-- TOC entry 4272 (class 1259 OID 19789)
-- Name: in_classifyengine_axis3; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis3 ON public.sb_classifyengine_classify USING btree (axis3);


--
-- TOC entry 4273 (class 1259 OID 19790)
-- Name: in_classifyengine_axis30; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis30 ON public.sb_classifyengine_classify USING btree (axis30);


--
-- TOC entry 4274 (class 1259 OID 19791)
-- Name: in_classifyengine_axis31; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis31 ON public.sb_classifyengine_classify USING btree (axis31);


--
-- TOC entry 4275 (class 1259 OID 19792)
-- Name: in_classifyengine_axis32; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis32 ON public.sb_classifyengine_classify USING btree (axis32);


--
-- TOC entry 4276 (class 1259 OID 19793)
-- Name: in_classifyengine_axis33; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis33 ON public.sb_classifyengine_classify USING btree (axis33);


--
-- TOC entry 4277 (class 1259 OID 19794)
-- Name: in_classifyengine_axis34; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis34 ON public.sb_classifyengine_classify USING btree (axis34);


--
-- TOC entry 4278 (class 1259 OID 19795)
-- Name: in_classifyengine_axis35; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis35 ON public.sb_classifyengine_classify USING btree (axis35);


--
-- TOC entry 4279 (class 1259 OID 19796)
-- Name: in_classifyengine_axis36; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis36 ON public.sb_classifyengine_classify USING btree (axis36);


--
-- TOC entry 4280 (class 1259 OID 19797)
-- Name: in_classifyengine_axis37; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis37 ON public.sb_classifyengine_classify USING btree (axis37);


--
-- TOC entry 4281 (class 1259 OID 19798)
-- Name: in_classifyengine_axis38; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis38 ON public.sb_classifyengine_classify USING btree (axis38);


--
-- TOC entry 4282 (class 1259 OID 19799)
-- Name: in_classifyengine_axis39; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis39 ON public.sb_classifyengine_classify USING btree (axis39);


--
-- TOC entry 4283 (class 1259 OID 19800)
-- Name: in_classifyengine_axis4; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis4 ON public.sb_classifyengine_classify USING btree (axis4);


--
-- TOC entry 4284 (class 1259 OID 19801)
-- Name: in_classifyengine_axis40; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis40 ON public.sb_classifyengine_classify USING btree (axis40);


--
-- TOC entry 4285 (class 1259 OID 19802)
-- Name: in_classifyengine_axis41; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis41 ON public.sb_classifyengine_classify USING btree (axis41);


--
-- TOC entry 4286 (class 1259 OID 19803)
-- Name: in_classifyengine_axis42; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis42 ON public.sb_classifyengine_classify USING btree (axis42);


--
-- TOC entry 4287 (class 1259 OID 19804)
-- Name: in_classifyengine_axis43; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis43 ON public.sb_classifyengine_classify USING btree (axis43);


--
-- TOC entry 4288 (class 1259 OID 19805)
-- Name: in_classifyengine_axis44; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis44 ON public.sb_classifyengine_classify USING btree (axis44);


--
-- TOC entry 4289 (class 1259 OID 19806)
-- Name: in_classifyengine_axis45; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis45 ON public.sb_classifyengine_classify USING btree (axis45);


--
-- TOC entry 4290 (class 1259 OID 19807)
-- Name: in_classifyengine_axis46; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis46 ON public.sb_classifyengine_classify USING btree (axis46);


--
-- TOC entry 4291 (class 1259 OID 19808)
-- Name: in_classifyengine_axis47; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis47 ON public.sb_classifyengine_classify USING btree (axis47);


--
-- TOC entry 4292 (class 1259 OID 19809)
-- Name: in_classifyengine_axis48; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis48 ON public.sb_classifyengine_classify USING btree (axis48);


--
-- TOC entry 4293 (class 1259 OID 19810)
-- Name: in_classifyengine_axis49; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis49 ON public.sb_classifyengine_classify USING btree (axis49);


--
-- TOC entry 4294 (class 1259 OID 19811)
-- Name: in_classifyengine_axis5; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis5 ON public.sb_classifyengine_classify USING btree (axis5);


--
-- TOC entry 4295 (class 1259 OID 19812)
-- Name: in_classifyengine_axis6; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis6 ON public.sb_classifyengine_classify USING btree (axis6);


--
-- TOC entry 4296 (class 1259 OID 19813)
-- Name: in_classifyengine_axis7; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis7 ON public.sb_classifyengine_classify USING btree (axis7);


--
-- TOC entry 4297 (class 1259 OID 19814)
-- Name: in_classifyengine_axis8; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis8 ON public.sb_classifyengine_classify USING btree (axis8);


--
-- TOC entry 4298 (class 1259 OID 19815)
-- Name: in_classifyengine_axis9; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_axis9 ON public.sb_classifyengine_classify USING btree (axis9);


--
-- TOC entry 4299 (class 1259 OID 19816)
-- Name: in_classifyengine_objectid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_classifyengine_objectid ON public.sb_classifyengine_classify USING btree (objectid);


--
-- TOC entry 4312 (class 1259 OID 19817)
-- Name: in_containermanager_links_dlb; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_containermanager_links_dlb ON public.sb_containermanager_links USING btree (positionid, containerinstanceid);


--
-- TOC entry 4322 (class 1259 OID 19818)
-- Name: in_coordinates_leafid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_coordinates_leafid ON public.sb_coordinates_coordinates USING btree (coordinatesleaf, coordinatesid);


--
-- TOC entry 4646 (class 1259 OID 19819)
-- Name: in_notifaddress_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_notifaddress_1 ON public.st_notifaddress USING btree (userid);


--
-- TOC entry 4656 (class 1259 OID 19820)
-- Name: in_notifpreference_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE UNIQUE INDEX in_notifpreference_1 ON public.st_notifpreference USING btree (userid, componentinstanceid, messagetype);


--
-- TOC entry 4661 (class 1259 OID 19821)
-- Name: in_notifsendedreceiver; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_notifsendedreceiver ON public.st_notifsendedreceiver USING btree (notifid);


--
-- TOC entry 4375 (class 1259 OID 19822)
-- Name: in_publi_father; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_publi_father ON public.sb_publication_publifather USING btree (nodeid);


--
-- TOC entry 4360 (class 1259 OID 19823)
-- Name: in_sb_pdc_axis_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_sb_pdc_axis_1 ON public.sb_pdc_axis USING btree (axistype);


--
-- TOC entry 4369 (class 1259 OID 19824)
-- Name: in_sb_pdc_utilization_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_sb_pdc_utilization_1 ON public.sb_pdc_utilization USING btree (basevalue);


--
-- TOC entry 4370 (class 1259 OID 19825)
-- Name: in_sb_pdc_utilization_2; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_sb_pdc_utilization_2 ON public.sb_pdc_utilization USING btree (instanceid);


--
-- TOC entry 4425 (class 1259 OID 19826)
-- Name: in_sb_tree_tree_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX in_sb_tree_tree_1 ON public.sb_tree_tree USING btree (path);


--
-- TOC entry 4466 (class 1259 OID 19827)
-- Name: ind_classifieds_subscribes; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_classifieds_subscribes ON public.sc_classifieds_subscribes USING btree (subscribeid);


--
-- TOC entry 4480 (class 1259 OID 19828)
-- Name: ind_contact_groupfather; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_contact_groupfather ON public.sc_contact_groupfather USING btree (fatherid, instanceid);


--
-- TOC entry 4505 (class 1259 OID 19829)
-- Name: ind_order; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_order ON public.sc_gallery_orderdetail USING btree (orderid);


--
-- TOC entry 4508 (class 1259 OID 19830)
-- Name: ind_path; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_path ON public.sc_gallery_path USING btree (nodeid);


--
-- TOC entry 4568 (class 1259 OID 19831)
-- Name: ind_sc_scheduleevent_contributor_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_sc_scheduleevent_contributor_1 ON public.sc_scheduleevent_contributor USING btree (scheduleeventid);


--
-- TOC entry 4569 (class 1259 OID 19832)
-- Name: ind_sc_scheduleevent_contributor_2; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_sc_scheduleevent_contributor_2 ON public.sc_scheduleevent_contributor USING btree (userid);


--
-- TOC entry 4576 (class 1259 OID 19833)
-- Name: ind_sc_scheduleevent_response_1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_sc_scheduleevent_response_1 ON public.sc_scheduleevent_response USING btree (scheduleeventid, userid);


--
-- TOC entry 4641 (class 1259 OID 19834)
-- Name: ind_st_instance_modelused; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_st_instance_modelused ON public.st_instance_modelused USING btree (instanceid, modelid);


--
-- TOC entry 4409 (class 1259 OID 19835)
-- Name: ind_state_connectioncumul1; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_state_connectioncumul1 ON public.sb_stat_connectioncumul USING btree (datestat);


--
-- TOC entry 4410 (class 1259 OID 19836)
-- Name: ind_state_connectioncumul2; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_state_connectioncumul2 ON public.sb_stat_connectioncumul USING btree (userid);


--
-- TOC entry 4411 (class 1259 OID 19837)
-- Name: ind_statistic_resourceid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_statistic_resourceid ON public.sb_statistic_history USING btree (resourceid);


--
-- TOC entry 4412 (class 1259 OID 19838)
-- Name: ind_statistic_userid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX ind_statistic_userid ON public.sb_statistic_history USING btree (userid);


--
-- TOC entry 4228 (class 1259 OID 19839)
-- Name: index_sb_agenda_holidays; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX index_sb_agenda_holidays ON public.sb_agenda_holidays USING btree (userid);


--
-- TOC entry 4415 (class 1259 OID 19840)
-- Name: jargon_iduser; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX jargon_iduser ON public.sb_thesaurus_jargon USING btree (iduser);


--
-- TOC entry 4547 (class 1259 OID 19841)
-- Name: questionreply_instanceid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX questionreply_instanceid ON public.sc_questionreply_question USING btree (instanceid);


--
-- TOC entry 4550 (class 1259 OID 19842)
-- Name: questionreply_userid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX questionreply_userid ON public.sc_questionreply_recipient USING btree (userid);


--
-- TOC entry 4420 (class 1259 OID 19843)
-- Name: synonym_termvoca; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX synonym_termvoca ON public.sb_thesaurus_synonym USING btree (idvoca, idtree, idterm);


--
-- TOC entry 4593 (class 1259 OID 19844)
-- Name: whitepages_instid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX whitepages_instid ON public.sc_whitepages_card USING btree (instanceid);


--
-- TOC entry 4596 (class 1259 OID 19845)
-- Name: whitepages_searchfieldsinstid; Type: INDEX; Schema: public; Owner: silver
--

CREATE INDEX whitepages_searchfieldsinstid ON public.sc_whitepages_searchfields USING btree (instanceid);


--
-- TOC entry 4754 (class 2606 OID 19846)
-- Name: st_delayednotification const_st_dn_fk_nrid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_fk_nrid FOREIGN KEY (notificationresourceid) REFERENCES public.st_notificationresource(id);


--
-- TOC entry 4755 (class 2606 OID 19851)
-- Name: st_delayednotification const_st_dn_fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_delayednotification
    ADD CONSTRAINT const_st_dn_fk_userid FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4756 (class 2606 OID 19856)
-- Name: st_delayednotifusersetting const_st_dnus_fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_delayednotifusersetting
    ADD CONSTRAINT const_st_dnus_fk_userid FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4746 (class 2606 OID 19861)
-- Name: sc_mailinglist_external_user fk9290f7c94b1a1b47; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_external_user
    ADD CONSTRAINT fk9290f7c94b1a1b47 FOREIGN KEY (listid) REFERENCES public.sc_mailinglist_list(id);


--
-- TOC entry 4712 (class 2606 OID 19866)
-- Name: sb_cal_attendees fk_attendee_component; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT fk_attendee_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- TOC entry 4714 (class 2606 OID 19871)
-- Name: sb_cal_components fk_calendar; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_components
    ADD CONSTRAINT fk_calendar FOREIGN KEY (calendarid) REFERENCES public.sb_cal_calendar(id);


--
-- TOC entry 4739 (class 2606 OID 19876)
-- Name: sc_community_membership fk_community; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT fk_community FOREIGN KEY (community) REFERENCES public.sc_community(id);


--
-- TOC entry 4752 (class 2606 OID 19881)
-- Name: st_componentinstance fk_componentinstance_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT fk_componentinstance_1 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- TOC entry 4753 (class 2606 OID 19886)
-- Name: st_componentinstance fk_componentinstance_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_componentinstance
    ADD CONSTRAINT fk_componentinstance_2 FOREIGN KEY (createdby) REFERENCES public.st_user(id);


--
-- TOC entry 4748 (class 2606 OID 19891)
-- Name: sc_scheduleevent_contributor fk_contributor_scheduleeventid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_contributor
    ADD CONSTRAINT fk_contributor_scheduleeventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- TOC entry 4713 (class 2606 OID 19896)
-- Name: sb_cal_attendees fk_delegate; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_attendees
    ADD CONSTRAINT fk_delegate FOREIGN KEY (delegate) REFERENCES public.sb_cal_attendees(id);


--
-- TOC entry 4700 (class 2606 OID 19901)
-- Name: domainsp_group fk_domainsp_group_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group
    ADD CONSTRAINT fk_domainsp_group_1 FOREIGN KEY (supergroupid) REFERENCES public.domainsp_group(id);


--
-- TOC entry 4701 (class 2606 OID 19906)
-- Name: domainsp_group_user_rel fk_domainsp_group_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT fk_domainsp_group_user_rel_1 FOREIGN KEY (groupid) REFERENCES public.domainsp_group(id);


--
-- TOC entry 4702 (class 2606 OID 19911)
-- Name: domainsp_group_user_rel fk_domainsp_group_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.domainsp_group_user_rel
    ADD CONSTRAINT fk_domainsp_group_user_rel_2 FOREIGN KEY (userid) REFERENCES public.domainsp_user(id);


--
-- TOC entry 4715 (class 2606 OID 19916)
-- Name: sb_cal_event fk_event_component; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT fk_event_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- TOC entry 4716 (class 2606 OID 19921)
-- Name: sb_cal_event fk_event_recurrence; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_event
    ADD CONSTRAINT fk_event_recurrence FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- TOC entry 4741 (class 2606 OID 19926)
-- Name: sc_formsonline_forminstances fk_forminstance; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_forminstances
    ADD CONSTRAINT fk_forminstance FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- TOC entry 4721 (class 2606 OID 19931)
-- Name: sb_formtemplate_record fk_formtemplate_record; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_record
    ADD CONSTRAINT fk_formtemplate_record FOREIGN KEY (templateid) REFERENCES public.sb_formtemplate_template(templateid);


--
-- TOC entry 4722 (class 2606 OID 19936)
-- Name: sb_formtemplate_templatefield fk_formtemplate_templatefield; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_templatefield
    ADD CONSTRAINT fk_formtemplate_templatefield FOREIGN KEY (templateid) REFERENCES public.sb_formtemplate_template(templateid);


--
-- TOC entry 4723 (class 2606 OID 19941)
-- Name: sb_formtemplate_textfield fk_formtemplate_textfield; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_formtemplate_textfield
    ADD CONSTRAINT fk_formtemplate_textfield FOREIGN KEY (recordid) REFERENCES public.sb_formtemplate_record(recordid);


--
-- TOC entry 4738 (class 2606 OID 19946)
-- Name: sc_community fk_group; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community
    ADD CONSTRAINT fk_group FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- TOC entry 4757 (class 2606 OID 19951)
-- Name: st_group fk_group_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group
    ADD CONSTRAINT fk_group_1 FOREIGN KEY (supergroupid) REFERENCES public.st_group(id);


--
-- TOC entry 4758 (class 2606 OID 19956)
-- Name: st_group_user_rel fk_group_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT fk_group_user_rel_1 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- TOC entry 4759 (class 2606 OID 19961)
-- Name: st_group_user_rel fk_group_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_group_user_rel
    ADD CONSTRAINT fk_group_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4743 (class 2606 OID 19966)
-- Name: sc_formsonline_grouprights fk_grouprights; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_grouprights
    ADD CONSTRAINT fk_grouprights FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- TOC entry 4760 (class 2606 OID 19971)
-- Name: st_instance_data fk_instance_data_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_instance_data
    ADD CONSTRAINT fk_instance_data_1 FOREIGN KEY (componentid) REFERENCES public.st_componentinstance(id);


--
-- TOC entry 4724 (class 2606 OID 19976)
-- Name: sb_mylinks_linkcat fk_mylinks_cat_id; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_mylinks_linkcat
    ADD CONSTRAINT fk_mylinks_cat_id FOREIGN KEY (catid) REFERENCES public.sb_mylinks_cat(catid);


--
-- TOC entry 4725 (class 2606 OID 19981)
-- Name: sb_mylinks_linkcat fk_mylinks_link_id; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_mylinks_linkcat
    ADD CONSTRAINT fk_mylinks_link_id FOREIGN KEY (linkid) REFERENCES public.sb_mylinks_link(linkid);


--
-- TOC entry 4761 (class 2606 OID 19986)
-- Name: st_notifaddress fk_notifaddress_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT fk_notifaddress_1 FOREIGN KEY (notifchannelid) REFERENCES public.st_notifchannel(id);


--
-- TOC entry 4762 (class 2606 OID 19991)
-- Name: st_notifaddress fk_notifaddress_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifaddress
    ADD CONSTRAINT fk_notifaddress_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4763 (class 2606 OID 19996)
-- Name: st_notifdefaultaddress fk_notifdefaultaddress_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifdefaultaddress
    ADD CONSTRAINT fk_notifdefaultaddress_1 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4764 (class 2606 OID 20001)
-- Name: st_notifpreference fk_notifpreference_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT fk_notifpreference_1 FOREIGN KEY (componentinstanceid) REFERENCES public.st_componentinstance(id);


--
-- TOC entry 4765 (class 2606 OID 20006)
-- Name: st_notifpreference fk_notifpreference_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_notifpreference
    ADD CONSTRAINT fk_notifpreference_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4717 (class 2606 OID 20011)
-- Name: sb_cal_occurrences fk_occurrence_component; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT fk_occurrence_component FOREIGN KEY (componentid) REFERENCES public.sb_cal_components(id);


--
-- TOC entry 4718 (class 2606 OID 20016)
-- Name: sb_cal_occurrences fk_occurrence_event; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_occurrences
    ADD CONSTRAINT fk_occurrence_event FOREIGN KEY (eventid) REFERENCES public.sb_cal_event(id);


--
-- TOC entry 4749 (class 2606 OID 20021)
-- Name: sc_scheduleevent_options fk_options_eventid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_options
    ADD CONSTRAINT fk_options_eventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- TOC entry 4726 (class 2606 OID 20026)
-- Name: sb_pdc_group_rights fk_pdc_group_rights_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_group_rights
    ADD CONSTRAINT fk_pdc_group_rights_1 FOREIGN KEY (axisid) REFERENCES public.sb_pdc_axis(id);


--
-- TOC entry 4727 (class 2606 OID 20031)
-- Name: sb_pdc_group_rights fk_pdc_group_rights_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_group_rights
    ADD CONSTRAINT fk_pdc_group_rights_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- TOC entry 4728 (class 2606 OID 20036)
-- Name: sb_pdc_user_rights fk_pdc_user_rights_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_user_rights
    ADD CONSTRAINT fk_pdc_user_rights_1 FOREIGN KEY (axisid) REFERENCES public.sb_pdc_axis(id);


--
-- TOC entry 4729 (class 2606 OID 20041)
-- Name: sb_pdc_user_rights fk_pdc_user_rights_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_pdc_user_rights
    ADD CONSTRAINT fk_pdc_user_rights_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4703 (class 2606 OID 20046)
-- Name: pdcclassification_pdcposition fk_pdcclassification_pdcposition_positionid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT fk_pdcclassification_pdcposition_positionid FOREIGN KEY (positions_id) REFERENCES public.pdcposition(id);


--
-- TOC entry 4704 (class 2606 OID 20051)
-- Name: pdcclassification_pdcposition fk_pdcclassification_pdcposition_positionid_pdcclassificationid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcclassification_pdcposition
    ADD CONSTRAINT fk_pdcclassification_pdcposition_positionid_pdcclassificationid FOREIGN KEY (pdcclassification_id) REFERENCES public.pdcclassification(id);


--
-- TOC entry 4705 (class 2606 OID 20056)
-- Name: pdcposition_pdcaxisvalue fk_pdcposition_pdcaxisvalue_pdcaxisvalueid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT fk_pdcposition_pdcaxisvalue_pdcaxisvalueid FOREIGN KEY (axisvalues_valueid, axisvalues_axisid) REFERENCES public.pdcaxisvalue(valueid, axisid);


--
-- TOC entry 4706 (class 2606 OID 20061)
-- Name: pdcposition_pdcaxisvalue fk_pdcposition_pdcaxisvalue_pdcpositionid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.pdcposition_pdcaxisvalue
    ADD CONSTRAINT fk_pdcposition_pdcaxisvalue_pdcpositionid FOREIGN KEY (pdcposition_id) REFERENCES public.pdcposition(id);


--
-- TOC entry 4719 (class 2606 OID 20066)
-- Name: sb_cal_recurrence_dayofweek fk_recurrence_dayofweek; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_recurrence_dayofweek
    ADD CONSTRAINT fk_recurrence_dayofweek FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- TOC entry 4720 (class 2606 OID 20071)
-- Name: sb_cal_recurrence_exception fk_recurrence_exception; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_cal_recurrence_exception
    ADD CONSTRAINT fk_recurrence_exception FOREIGN KEY (recurrenceid) REFERENCES public.sb_cal_recurrence(id);


--
-- TOC entry 4750 (class 2606 OID 20076)
-- Name: sc_scheduleevent_response fk_response_optionid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT fk_response_optionid FOREIGN KEY (optionid) REFERENCES public.sc_scheduleevent_options(id);


--
-- TOC entry 4751 (class 2606 OID 20081)
-- Name: sc_scheduleevent_response fk_response_scheduleeventid; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_scheduleevent_response
    ADD CONSTRAINT fk_response_scheduleeventid FOREIGN KEY (scheduleeventid) REFERENCES public.sc_scheduleevent_list(id);


--
-- TOC entry 4742 (class 2606 OID 20086)
-- Name: sc_formsonline_forminstvali fk_sc_formsonline_forminstances_id; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_forminstvali
    ADD CONSTRAINT fk_sc_formsonline_forminstances_id FOREIGN KEY (forminstid) REFERENCES public.sc_formsonline_forminstances(id);


--
-- TOC entry 4766 (class 2606 OID 20091)
-- Name: st_space fk_space_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT fk_space_1 FOREIGN KEY (createdby) REFERENCES public.st_user(id);


--
-- TOC entry 4767 (class 2606 OID 20096)
-- Name: st_space fk_space_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_space
    ADD CONSTRAINT fk_space_2 FOREIGN KEY (domainfatherid) REFERENCES public.st_space(id);


--
-- TOC entry 4768 (class 2606 OID 20101)
-- Name: st_spaceuserrole fk_spaceuserrole_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole
    ADD CONSTRAINT fk_spaceuserrole_1 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- TOC entry 4769 (class 2606 OID 20106)
-- Name: st_spaceuserrole_group_rel fk_spaceuserrole_group_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT fk_spaceuserrole_group_rel_1 FOREIGN KEY (spaceuserroleid) REFERENCES public.st_spaceuserrole(id);


--
-- TOC entry 4770 (class 2606 OID 20111)
-- Name: st_spaceuserrole_group_rel fk_spaceuserrole_group_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_group_rel
    ADD CONSTRAINT fk_spaceuserrole_group_rel_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- TOC entry 4771 (class 2606 OID 20116)
-- Name: st_spaceuserrole_user_rel fk_spaceuserrole_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT fk_spaceuserrole_user_rel_1 FOREIGN KEY (spaceuserroleid) REFERENCES public.st_spaceuserrole(id);


--
-- TOC entry 4772 (class 2606 OID 20121)
-- Name: st_spaceuserrole_user_rel fk_spaceuserrole_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_spaceuserrole_user_rel
    ADD CONSTRAINT fk_spaceuserrole_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4747 (class 2606 OID 20126)
-- Name: sc_mailinglist_internal_sub fk_subscriber_mailinglist_id; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_internal_sub
    ADD CONSTRAINT fk_subscriber_mailinglist_id FOREIGN KEY (mailinglistid) REFERENCES public.sc_mailinglist_list(id);


--
-- TOC entry 4740 (class 2606 OID 20131)
-- Name: sc_community_membership fk_user; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_community_membership
    ADD CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4773 (class 2606 OID 20136)
-- Name: st_user fk_user_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_user
    ADD CONSTRAINT fk_user_1 FOREIGN KEY (accesslevel) REFERENCES public.st_accesslevel(id);


--
-- TOC entry 4774 (class 2606 OID 20141)
-- Name: st_userfavoritespaces fk_userfavoritespaces_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT fk_userfavoritespaces_1 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4775 (class 2606 OID 20146)
-- Name: st_userfavoritespaces fk_userfavoritespaces_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userfavoritespaces
    ADD CONSTRAINT fk_userfavoritespaces_2 FOREIGN KEY (spaceid) REFERENCES public.st_space(id);


--
-- TOC entry 4744 (class 2606 OID 20151)
-- Name: sc_formsonline_userrights fk_userrights; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_formsonline_userrights
    ADD CONSTRAINT fk_userrights FOREIGN KEY (formid) REFERENCES public.sc_formsonline_forms(id);


--
-- TOC entry 4776 (class 2606 OID 20156)
-- Name: st_userrole fk_userrole_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole
    ADD CONSTRAINT fk_userrole_1 FOREIGN KEY (instanceid) REFERENCES public.st_componentinstance(id);


--
-- TOC entry 4777 (class 2606 OID 20161)
-- Name: st_userrole_group_rel fk_userrole_group_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT fk_userrole_group_rel_1 FOREIGN KEY (userroleid) REFERENCES public.st_userrole(id);


--
-- TOC entry 4778 (class 2606 OID 20166)
-- Name: st_userrole_group_rel fk_userrole_group_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_group_rel
    ADD CONSTRAINT fk_userrole_group_rel_2 FOREIGN KEY (groupid) REFERENCES public.st_group(id);


--
-- TOC entry 4779 (class 2606 OID 20171)
-- Name: st_userrole_user_rel fk_userrole_user_rel_1; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT fk_userrole_user_rel_1 FOREIGN KEY (userroleid) REFERENCES public.st_userrole(id);


--
-- TOC entry 4780 (class 2606 OID 20176)
-- Name: st_userrole_user_rel fk_userrole_user_rel_2; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.st_userrole_user_rel
    ADD CONSTRAINT fk_userrole_user_rel_2 FOREIGN KEY (userid) REFERENCES public.st_user(id);


--
-- TOC entry 4730 (class 2606 OID 20181)
-- Name: sb_variables_value fk_variables_value; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_variables_value
    ADD CONSTRAINT fk_variables_value FOREIGN KEY (variableid) REFERENCES public.sb_variables_variable(id);


--
-- TOC entry 4731 (class 2606 OID 20186)
-- Name: sb_workflow_activestate fk_workflow_activestate; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_activestate
    ADD CONSTRAINT fk_workflow_activestate FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4732 (class 2606 OID 20191)
-- Name: sb_workflow_historystep fk_workflow_historystep; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_historystep
    ADD CONSTRAINT fk_workflow_historystep FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4733 (class 2606 OID 20196)
-- Name: sb_workflow_interesteduser fk_workflow_interesteduser; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_interesteduser
    ADD CONSTRAINT fk_workflow_interesteduser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4734 (class 2606 OID 20201)
-- Name: sb_workflow_lockinguser fk_workflow_lockinguser; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_lockinguser
    ADD CONSTRAINT fk_workflow_lockinguser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4735 (class 2606 OID 20206)
-- Name: sb_workflow_question fk_workflow_question; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_question
    ADD CONSTRAINT fk_workflow_question FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4736 (class 2606 OID 20211)
-- Name: sb_workflow_userinfo fk_workflow_userinfo; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_userinfo
    ADD CONSTRAINT fk_workflow_userinfo FOREIGN KEY (settingsid) REFERENCES public.sb_workflow_usersettings(settingsid);


--
-- TOC entry 4737 (class 2606 OID 20216)
-- Name: sb_workflow_workinguser fk_workflow_workinguser; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sb_workflow_workinguser
    ADD CONSTRAINT fk_workflow_workinguser FOREIGN KEY (instanceid) REFERENCES public.sb_workflow_processinstance(instanceid);


--
-- TOC entry 4745 (class 2606 OID 20221)
-- Name: sc_mailinglist_attachment fkce814959db1c14ee; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.sc_mailinglist_attachment
    ADD CONSTRAINT fkce814959db1c14ee FOREIGN KEY (messageid) REFERENCES public.sc_mailinglist_message(id);


--
-- TOC entry 4707 (class 2606 OID 20226)
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 4708 (class 2606 OID 20231)
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 4709 (class 2606 OID 20236)
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 4710 (class 2606 OID 20241)
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 4711 (class 2606 OID 20246)
-- Name: qrtz_triggers qrtz_triggers_sched_name_job_name_job_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silver
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_job_name_job_group_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);

--
-- silverQL database dump complete
--
