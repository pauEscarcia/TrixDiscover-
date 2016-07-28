CREATE TABLE trixdiscover."Prestador"
(
  "IdPrestador" bigserial NOT NULL,
  "Fecha" date,
  "NomOrganización" text,
  "Direccion" text,
  "Lat" bigint,
  "Long" bigint,
  "Gerente" text,
  "Email" text,
  "Pagina" text,
  "Facebook" text,
  "YouTube" text,
  "WhatsApp" text,
  "Instagram" text,
  "Twitter" text,
  "Tumblr" text,
  "TelEmpresa" text,
  "TelCel" text,
  CONSTRAINT pk_prestador PRIMARY KEY ("IdPrestador")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE trixdiscover."Prestador"
  OWNER TO postgres;


CREATE TABLE trixdiscover."Categoria"
(
  "idCategoria" bigserial NOT NULL,
  "NomCategoria" text,
  CONSTRAINT "Pk_Categoria" PRIMARY KEY ("idCategoria")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE trixdiscover."Categoria"
  OWNER TO "trixDiscover";

--CREATE TABLE trixdiscover."Actividad"
--(
--   "idActividad" bigserial, 
--   "Nombre" text, 
--   "Descripcion" text, 
--   "Disponibilidad" text, 
--   "Duracion" text, 
--   "Costo" integer, 
--   "idCategoria" bigint, 
--   CONSTRAINT "Pk_Actividad" PRIMARY KEY ("idActividad"), 
--   CONSTRAINT "Fk_Actividad" FOREIGN KEY ("idCategoria") REFERENCES trixdiscover."Categoria" ("idCategoria") ON UPDATE NO ACTION ON DELETE NO ACTION
--) 
--WITH (
--  OIDS = FALSE
--)
--;
--ALTER TABLE trixdiscover."Actividad"
--  OWNER TO "trixDiscover";

-- Table: trixdiscover."Actividad"

-- DROP TABLE trixdiscover."Actividad";

CREATE TABLE trixdiscover."Actividad"
(
  "idActividad" bigserial NOT NULL,
  "Nombre" text,
  "Descripcion" text,
  "Disponibilidad" text,
  "Duracion" text,
  "Costo" integer,
  "idCategoria" bigint,
  "idPrestador" bigint,
  CONSTRAINT "Pk_Actividad" PRIMARY KEY ("idActividad"),
  CONSTRAINT "FK_ActividadesPrestador" FOREIGN KEY ("idPrestador")
      REFERENCES trixdiscover."Prestador" ("IdPrestador") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Fk_Actividad" FOREIGN KEY ("idCategoria")
      REFERENCES trixdiscover."Categoria" ("idCategoria") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE trixdiscover."Actividad"
  OWNER TO "trixDiscover";

-- Index: trixdiscover."FKI_ActividadesPrestador"

-- DROP INDEX trixdiscover."FKI_ActividadesPrestador";

CREATE INDEX "FKI_ActividadesPrestador"
  ON trixdiscover."Actividad"
  USING btree
  ("idPrestador");