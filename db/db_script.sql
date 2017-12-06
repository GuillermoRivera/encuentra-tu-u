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


INSERT INTO tipo_programa VALUES (1, 'Técnico');
INSERT INTO tipo_programa VALUES (2, 'Tecnológico');
INSERT INTO tipo_programa VALUES (3, 'Profesional');


INSERT INTO tipo_institucion VALUES (1, 'Universidad');
INSERT INTO tipo_institucion VALUES (2, 'Institución universitaria');
INSERT INTO tipo_institucion VALUES (3, 'Institución tecnológica');
INSERT INTO tipo_institucion VALUES (4, 'Institución técnica profesional');


INSERT INTO instituciones VALUES (1, 'Universidad CES', 'Calle 10 A No. 22 - 04', '4440555', 'http://www.ces.edu.co/', 'images/ces.jpeg', 1, 'si', 'privado');
INSERT INTO instituciones VALUES (2, 'Politécnico Colombiano Jaime Isaza Cadavid', 'Carrera 48 # 7-151', '3197900', 'http://www.politecnicojic.edu.co/', 'images/poli_jic.jpg', 2, 'no', 'oficial');
INSERT INTO instituciones VALUES (3, 'Universidad de Antioquia', 'Calle 67 No. 53 - 108', '219 8332', 'http://www.udea.edu.co', 'images/udea.jpg', 1, 'si', 'oficial');
INSERT INTO instituciones VALUES (4, 'Universidad de Medellín', ' Carrera 87 N° 30 - 65', '3405555', 'https://www.udem.edu.co/', 'images/udem.png', 1, 'si', 'privado');
INSERT INTO instituciones VALUES (5, 'Universidad San Buenaventura', 'Carrera 56C N° 51-110', '5145600', 'http://www.usbmed.edu.co', 'images/sanba.jpg', 1, 'no', 'oficial');
INSERT INTO instituciones VALUES (6, 'Universidad EAFIT', ' Carrera 49 N° 7 Sur-50', '4489500', 'http://www.eafit.edu.co/', 'images/eafit.png', 1, 'si', 'privada');
INSERT INTO instituciones VALUES (7, 'Universidad Nacional de Colombia', 'Calle 59a #63-20', '4309000', 'http://medellin.unal.edu.co/', 'images/unal.png', 1, 'si', 'oficial');
INSERT INTO instituciones VALUES (8, 'Colegio Mayor de Antioquia', 'Carrera 78 # 65 - 46', '444 56 11', 'http://www.colmayor.edu.co/', 'images/colmayor.png', 2, 'no', 'oficial');
INSERT INTO instituciones VALUES (9, 'Instituto Tecnológico Metropolitano', 'Carrera 65 #98 A-75', '4600727', 'http://www.itm.edu.co/es/', 'images/itm.png', 2, 'si', 'oficial');
INSERT INTO instituciones VALUES (10, 'Institución Universitaria Salazar y Herrera', ' Carrera 70 #52-49', '4488702', 'http://www.iush.edu.co', 'images/iush.jpg', 2, 'no', 'privado');


INSERT INTO facultades VALUES (1, 'Ingeniería');
INSERT INTO facultades VALUES (2, 'Medicina');
INSERT INTO facultades VALUES (3, 'Administración');


INSERT INTO programas VALUES (1, 'Medicina', 3);
INSERT INTO programas VALUES (2, 'Ingeniería informática', 3);
INSERT INTO programas VALUES (3, 'Ingeniería de sistemas', 3);
INSERT INTO programas VALUES (4, 'Ingeniería industrial', 3);
INSERT INTO programas VALUES (5, 'Ingeniería de productividad y calidad', 3);
INSERT INTO programas VALUES (6, 'Ingeniería civil', 3);
INSERT INTO programas VALUES (7, 'Ingeniería agropecuaria', 3);
INSERT INTO programas VALUES (8, 'Contaduría pública', 3);
INSERT INTO programas VALUES (9, 'Administración de empresas', 3);


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


INSERT INTO facultad_institucion_programa VALUES (2, 1, 1, 'http://www.ces.edu.co/index.php/presentacionmedicina');
INSERT INTO facultad_institucion_programa VALUES (3, 2, 8, 'http://politecnicojic.edu.co/index.php/programas/64-contaduria-publica');
INSERT INTO facultad_institucion_programa VALUES (1, 2, 2, 'http://politecnicojic.edu.co/index.php/programas/75-ingenieria-informatica');
INSERT INTO facultad_institucion_programa VALUES (1, 2, 5, 'http://politecnicojic.edu.co/index.php/programas/66-ingenieria-de-productividad-y-calidad');
INSERT INTO facultad_institucion_programa VALUES (1, 3, 3, 'https://www.udem.edu.co/index.php/2012-10-12-13-19-26/ingenieria-de-sistemas/informacion-general');
INSERT INTO facultad_institucion_programa VALUES (1, 4, 3, 'https://www.udem.edu.co/index.php/2012-10-12-13-19-26/ingenieria-de-sistemas/informacion-general');
INSERT INTO facultad_institucion_programa VALUES (1, 6, 3, 'https://minas.medellin.unal.edu.co/formacion/pregrado/ingenieriadesistemas');
INSERT INTO facultad_institucion_programa VALUES (1, 7, 3, 'http://www.eafit.edu.co/pregrado-ingenieria-sistemas');
