-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-04-18 20:47:40 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_cartao (
    cd_cartao                 INTEGER NOT NULL,
    nm_cartao                 VARCHAR2(100) NOT NULL,
    nr_cartao                 VARCHAR2(100) NOT NULL,
    dt_validade_cartao        DATE NOT NULL,
    dsc_bandeira_cartao       VARCHAR2(100) NOT NULL,
    nr_cvv_cartao             VARCHAR2(3) NOT NULL,
    dsc_tipo_cartao           VARCHAR2(100) NOT NULL,
    nr_cpf_titular_cartao     VARCHAR2(11) NOT NULL,
    t_fin_cadastro_id_usuario INTEGER NOT NULL
);

ALTER TABLE t_cartao ADD CONSTRAINT t_cartao_pk PRIMARY KEY ( cd_cartao );

CREATE TABLE t_fin_cadastro (
    id_usuario    INTEGER NOT NULL,
    tx_login      VARCHAR2(50) NOT NULL,
    tx_senha      VARCHAR2(20) NOT NULL,
    nr_cpf        VARCHAR2(11) NOT NULL,
    nm_usuario    VARCHAR2(70) NOT NULL,
    tx_email      VARCHAR2(50) NOT NULL,
    nr_telefone   VARCHAR2(15) NOT NULL,
    dt_nascimento DATE NOT NULL,
    tx_genero     VARCHAR2(1) NOT NULL
);

CREATE UNIQUE INDEX t_fin_cadastro__idx ON
    t_fin_cadastro (
        tx_login
    ASC );

ALTER TABLE t_fin_cadastro ADD CONSTRAINT t_fin_cadastro_pk PRIMARY KEY ( id_usuario );

CREATE TABLE t_fin_despesa (
    id_despesa                     INTEGER NOT NULL,
    dt_despesa                     DATE NOT NULL,
    ds_despesa                     VARCHAR2(120) NOT NULL,
    vl_despesa                     NUMBER(10, 2) NOT NULL,
    qtd_mes_recorrencia            NUMBER(3),
    st_recorrencia                 VARCHAR2(15),
    t_fin_cadastro_id_usuario      INTEGER NOT NULL,
    t_fin_tipo_despesa_cod_despesa INTEGER NOT NULL
);

ALTER TABLE t_fin_despesa ADD CONSTRAINT t_fin_despesa_pk PRIMARY KEY ( id_despesa );

CREATE TABLE t_fin_receita (
    id_receita                     INTEGER NOT NULL,
    ds_receita                     VARCHAR2(120) NOT NULL,
    vl_receita                     NUMBER(10, 2) NOT NULL,
    dt_receita                     DATE NOT NULL,
    t_fin_cadastro_id_usuario      INTEGER NOT NULL,
    t_fin_tipo_receita_cod_receita INTEGER NOT NULL,
);

ALTER TABLE t_fin_receita ADD CONSTRAINT t_fin_receita_pk PRIMARY KEY ( id_receita );

CREATE TABLE t_fin_tipo_despesa (
    cod_despesa INTEGER NOT NULL,
    ds_despesa  VARCHAR2(120) NOT NULL
);

ALTER TABLE t_fin_tipo_despesa ADD CONSTRAINT t_fin_tipo_despesa_pk PRIMARY KEY ( cod_despesa );

CREATE TABLE t_fin_tipo_receita (
    cod_receita INTEGER NOT NULL,
    ds_receita  VARCHAR2(120) NOT NULL
);

ALTER TABLE t_fin_tipo_receita ADD CONSTRAINT t_fin_tipo_receita_pk PRIMARY KEY ( cod_receita );

CREATE TABLE t_objetivofinanceiro (
    cd_objetivofinanceiro       INTEGER NOT NULL,
    nm_objetivofinanceiro       VARCHAR2(100) NOT NULL,
    vl_meta_objetivofinanceiro  NUMBER(20, 2) NOT NULL,
    dt_prazo_objetivofinanceiro DATE NOT NULL,
    dsc_objetivofinanceiro      VARCHAR2(100),
    t_fin_cadastro_id_usuario   INTEGER NOT NULL
);

ALTER TABLE t_objetivofinanceiro ADD CONSTRAINT t_objetivofinanceiro_pk PRIMARY KEY ( cd_objetivofinanceiro );

ALTER TABLE t_cartao
    ADD CONSTRAINT t_cartao_t_cadastro_fk FOREIGN KEY ( t_fin_cadastro_id_usuario )
        REFERENCES t_fin_cadastro ( id_usuario );

ALTER TABLE t_fin_despesa
    ADD CONSTRAINT t_fin_des_t_fin_cadastro_fk FOREIGN KEY ( t_fin_cadastro_id_usuario )
        REFERENCES t_fin_cadastro ( id_usuario );

ALTER TABLE t_fin_despesa
    ADD CONSTRAINT t_fin_desp_t_fin_tp_despesa_fk FOREIGN KEY ( t_fin_tipo_despesa_cod_despesa )
        REFERENCES t_fin_tipo_despesa ( cod_despesa );

ALTER TABLE t_fin_receita
    ADD CONSTRAINT t_fin_receita_t_fin_cad_fk FOREIGN KEY ( t_fin_cadastro_id_usuario )
        REFERENCES t_fin_cadastro ( id_usuario );

ALTER TABLE t_fin_receita
    ADD CONSTRAINT t_fin_receita_t_fin_tp_rec_fk FOREIGN KEY ( t_fin_tipo_receita_cod_receita )
        REFERENCES t_fin_tipo_receita ( cod_receita );

ALTER TABLE t_objetivofinanceiro
    ADD CONSTRAINT t_objfin_t_fin_cadastro_fk FOREIGN KEY ( t_fin_cadastro_id_usuario )
        REFERENCES t_fin_cadastro ( id_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             13
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
-- CREATE MATERIALIZED VIEW LOG             0
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
