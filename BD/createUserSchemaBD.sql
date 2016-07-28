CREATE ROLE "trixDiscover" LOGIN ENCRYPTED PASSWORD 'md52622d2d05ff692359df3aeecff5f7990'
  SUPERUSER
   VALID UNTIL 'infinity';

CREATE DATABASE "TrixDiscover"
  WITH OWNER = "trixDiscover"
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Mexico.1252'
       LC_CTYPE = 'Spanish_Mexico.1252'
       CONNECTION LIMIT = -1;

CREATE SCHEMA trixdiscover
       AUTHORIZATION "trixDiscover";


