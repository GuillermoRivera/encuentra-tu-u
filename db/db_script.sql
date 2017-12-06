-- Generado por Oracle SQL Developer Data Modeler 17.3.0.261.1529
--   en:        2017-11-27 12:44:57 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g

DROP DATABASE IF EXISTS encuentra_tu_u;

CREATE DATABASE encuentra_tu_u;

USE encuentra_tu_u;

CREATE TABLE facultad_institucion (
    facultades_id_fac       INT(3) NOT NULL,
    instituciones_id_inst   INT(3) NOT NULL
);

ALTER TABLE facultad_institucion ADD CONSTRAINT facultad_institucion_pk PRIMARY KEY ( facultades_id_fac,
instituciones_id_inst );

CREATE TABLE facultad_institucion_programa (
    id_fac_pk    INT(3) NOT NULL,
    id_inst_pk   INT(3) NOT NULL,
    id_prog_pk   INT(4) NOT NULL,
    url_programa VARCHAR(500)
);

ALTER TABLE facultad_institucion_programa
    ADD CONSTRAINT fac_inst_prog_pk PRIMARY KEY ( id_fac_pk,
    id_inst_pk,
    id_prog_pk );

CREATE TABLE facultades (
    id_fac       INT(3) NOT NULL,
    nombre_fac   VARCHAR(50) NOT NULL
);

ALTER TABLE facultades ADD CONSTRAINT facultades_pk PRIMARY KEY ( id_fac );

CREATE TABLE institucion_programa (
    id_prog_ipf   INT(4) NOT NULL,
    id_fac_ipf    INT NOT NULL,
    id_inst_ipf   INT(3) NOT NULL,
    id_fac        INT(3) NOT NULL
);

ALTER TABLE institucion_programa
    ADD CONSTRAINT institucion_programa_pk PRIMARY KEY ( id_inst_ipf,
    id_prog_ipf,
    id_fac_ipf );

CREATE TABLE instituciones (
    id_inst          INT(3) NOT NULL,
    nombre_inst      VARCHAR(50) NOT NULL,
    direccion_inst   VARCHAR(50) NOT NULL,
    telefono_inst    VARCHAR(10) NOT NULL,
    pagina_web       VARCHAR(50) NOT NULL,
    logo              VARCHAR(100),
    id_ti_i          INT(1) NOT NULL,
    acreditada       VARCHAR(2) NOT NULL,
    sector           VARCHAR(10) NOT NULL
);

ALTER TABLE instituciones ADD CONSTRAINT universidad_pk PRIMARY KEY ( id_inst );

CREATE TABLE programas (
    id_prog         INT(4) NOT NULL,
    nombre_prog     VARCHAR(50) NOT NULL,
    tipo_programa   VARCHAR(2) NOT NULL
);

ALTER TABLE programas ADD CONSTRAINT programas_pk PRIMARY KEY ( id_prog );

CREATE TABLE tipo_institucion (
    id_ti            INT(1) NOT NULL,
    descripcion_ti   VARCHAR(50) NOT NULL
);

ALTER TABLE tipo_institucion ADD CONSTRAINT tipo_institucion_pk PRIMARY KEY ( id_ti );

CREATE TABLE tipo_programa (
    id_tipo_programa   VARCHAR(2) NOT NULL,
    descripcion        VARCHAR(50) NOT NULL
);

ALTER TABLE tipo_programa ADD CONSTRAINT tipo_programa_pk PRIMARY KEY ( id_tipo_programa );


ALTER TABLE facultad_institucion_programa
    ADD CONSTRAINT fac_inst_prog_fac_programas_fk FOREIGN KEY ( id_prog_pk )
        REFERENCES programas ( id_prog );

ALTER TABLE institucion_programa
    ADD CONSTRAINT facultades_fk FOREIGN KEY ( id_fac )
        REFERENCES facultades ( id_fac );

ALTER TABLE facultad_institucion
    ADD CONSTRAINT id_institucion FOREIGN KEY ( instituciones_id_inst )
        REFERENCES instituciones ( id_inst );

ALTER TABLE programas
    ADD CONSTRAINT id_tipo_programa FOREIGN KEY ( tipo_programa )
        REFERENCES tipo_programa ( id_tipo_programa );

ALTER TABLE institucion_programa
    ADD CONSTRAINT instituciones_fk FOREIGN KEY ( id_inst_ipf )
        REFERENCES instituciones ( id_inst );

ALTER TABLE institucion_programa
    ADD CONSTRAINT programa_fk FOREIGN KEY ( id_prog_ipf )
        REFERENCES programas ( id_prog );

ALTER TABLE instituciones
    ADD CONSTRAINT tipo_institucion_fk FOREIGN KEY ( id_ti_i )
        REFERENCES tipo_institucion ( id_ti );


-- program types
INSERT INTO tipo_programa VALUES (1, 'técnico');
INSERT INTO tipo_programa VALUES (2, 'tecnológico');
INSERT INTO tipo_programa VALUES (3, 'profesional');


INSERT INTO tipo_institucion VALUES (1, 'universidad');
INSERT INTO tipo_institucion VALUES (2, 'institución universitaria');
INSERT INTO tipo_institucion VALUES (3, 'institución tecnológica');
INSERT INTO tipo_institucion VALUES (4, 'institución técnica profesional');

-- Institutions
INSERT INTO instituciones VALUES (1, 'universidad ces', 'Calle 10 A No. 22 - 04', '4440555', 'http://www.ces.edu.co/', 'images/ces.jpeg', 1, 'si', 'privado');
INSERT INTO instituciones VALUES (2, 'politécnico colombiano jaime isaza cadavid', 'Carrera 48 # 7-151', '3197900', 'http://www.politecnicojic.edu.co/', 'images/poli_jic', 2, 'no', 'oficial');
INSERT INTO instituciones VALUES (3, 'universidad de antioquia', 'Calle 67 No. 53 - 108', '219 8332', 'http://www.udea.edu.co', 'images/udea.jpg', 1, 'si', 'oficial');
INSERT INTO instituciones VALUES (4, 'universidad de medellin', ' Carrera 87 N° 30 - 65', '3405555', 'https://www.udem.edu.co/', 'images/udem.png', 1, 'si', 'privado');
INSERT INTO instituciones VALUES (5, 'universidad san buenaventura', 'Carrera 56C N° 51-110', '5145600', 'http://www.usbmed.edu.co', 'images/sanba.jpg', 1, 'no', 'oficial');
INSERT INTO instituciones VALUES (6, 'universidad eafit', ' Carrera 49 N° 7 Sur-50', '4489500', 'http://www.eafit.edu.co/', 'images/eafit.png', 1, 'si', 'privada');
INSERT INTO instituciones VALUES (7, 'universidad nacional de colombia', 'Calle 59a #63-20', '4309000', 'http://medellin.unal.edu.co/', 'images/unal.png', 1, 'si', 'oficial');
INSERT INTO instituciones VALUES (8, 'colegio mayor de antioquia', 'Carrera 78 # 65 - 46', '444 56 11', 'http://www.colmayor.edu.co/', 'images/colmayor.png', 2, 'no', 'oficial');
INSERT INTO instituciones VALUES (9, 'instituto tecnologico metropolitano', 'Carrera 65 #98 A-75', '4600727', 'http://www.itm.edu.co/es/', 'images/itm.png', 2, 'si', 'oficial');
INSERT INTO instituciones VALUES (10, 'institucion universitaria salazar y herrera', ' Carrera 70 #52-49', '4488702', 'http://www.iush.edu.co', 'images/iush.jpg', 2, 'no', 'privado');


INSERT INTO facultades VALUES (1, 'ingeniería');
INSERT INTO facultades VALUES (2, 'medicina');
INSERT INTO facultades VALUES (3, 'administracion');


INSERT INTO programas VALUES (1, 'medicina', 3);
INSERT INTO programas VALUES (2, 'ingeniería informática', 3);
INSERT INTO programas VALUES (3, 'ingeniería de sistemas', 3);
INSERT INTO programas VALUES (4, 'ingeniería industrial', 3);
INSERT INTO programas VALUES (5, 'ingeniería de productividad y calidad', 3);
INSERT INTO programas VALUES (6, 'ingeniería civil', 3);
INSERT INTO programas VALUES (7, 'ingeniería agropecuaria', 3);
INSERT INTO programas VALUES (8, 'contaduria publica', 3);
INSERT INTO programas VALUES (9, 'administracion de empresas', 3);


INSERT INTO facultad_institucion VALUES (1, 1);
INSERT INTO facultad_institucion VALUES (1, 2);
INSERT INTO facultad_institucion VALUES (1, 3);
INSERT INTO facultad_institucion VALUES (1, 4);
INSERT INTO facultad_institucion VALUES (1, 5);
INSERT INTO facultad_institucion VALUES (1, 6);
INSERT INTO facultad_institucion VALUES (1, 7);
INSERT INTO facultad_institucion VALUES (1, 9);
INSERT INTO facultad_institucion VALUES (1, 10);
INSERT INTO facultad_institucion VALUES (2, 1);
INSERT INTO facultad_institucion VALUES (2, 3);
INSERT INTO facultad_institucion VALUES (2, 4);
INSERT INTO facultad_institucion VALUES (2, 5);
INSERT INTO facultad_institucion VALUES (2, 6);
INSERT INTO facultad_institucion VALUES (2, 7);
INSERT INTO facultad_institucion VALUES (2, 9);
INSERT INTO facultad_institucion VALUES (2, 10);
INSERT INTO facultad_institucion VALUES (3, 1);
INSERT INTO facultad_institucion VALUES (3, 2);
INSERT INTO facultad_institucion VALUES (3, 3);
INSERT INTO facultad_institucion VALUES (3, 4);
INSERT INTO facultad_institucion VALUES (3, 5);
INSERT INTO facultad_institucion VALUES (3, 6);
INSERT INTO facultad_institucion VALUES (3, 7);
INSERT INTO facultad_institucion VALUES (3, 9);
INSERT INTO facultad_institucion VALUES (3, 10);

-- facultad_institucion_programa
INSERT INTO facultad_institucion_programa VALUES (2, 1, 1, 'http://www.ces.edu.co/index.php/presentacionmedicina');
INSERT INTO facultad_institucion_programa VALUES (3, 2, 8, 'http://politecnicojic.edu.co/index.php/programas/64-contaduria-publica');
INSERT INTO facultad_institucion_programa VALUES (1, 2, 2, 'http://politecnicojic.edu.co/index.php/programas/75-ingenieria-informatica');
INSERT INTO facultad_institucion_programa VALUES (1, 2, 5, 'http://politecnicojic.edu.co/index.php/programas/66-ingenieria-de-productividad-y-calidad');
INSERT INTO facultad_institucion_programa VALUES (1, 3, 3, 'https://www.udem.edu.co/index.php/2012-10-12-13-19-26/ingenieria-de-sistemas/informacion-general');
INSERT INTO facultad_institucion_programa VALUES (1, 4, 3, 'https://www.udem.edu.co/index.php/2012-10-12-13-19-26/ingenieria-de-sistemas/informacion-general');
INSERT INTO facultad_institucion_programa VALUES (1, 6, 3, 'https://minas.medellin.unal.edu.co/formacion/pregrado/ingenieriadesistemas');
INSERT INTO facultad_institucion_programa VALUES (1, 7, 3, 'http://www.eafit.edu.co/pregrado-ingenieria-sistemas');


-- Informe de Resumen de Oracle SQL Developer Data Modeler:
--
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
