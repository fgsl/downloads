-- Database: kimotadb

-- DROP DATABASE kimotadb;

CREATE DATABASE kimotadb
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'pt_BR.UTF-8'
       LC_CTYPE = 'pt_BR.UTF-8'
       CONNECTION LIMIT = -1;

-- Table: acessos

-- DROP TABLE acessos;

CREATE TABLE acessos
(
  id serial NOT NULL,
  recurso character varying(80) NOT NULL,
  privilegio character varying(80) NOT NULL,
  CONSTRAINT acessos_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE acessos OWNER TO postgres;

-- Table: papeis

-- DROP TABLE papeis;

CREATE TABLE papeis
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  CONSTRAINT papeis_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE papeis OWNER TO postgres;


-- Table: acessos_papel

-- DROP TABLE acessos_papel;

CREATE TABLE acessos_papel
(
  id serial NOT NULL,
  id_papel integer NOT NULL,
  id_acesso integer NOT NULL,
  CONSTRAINT acessos_papel_pkey PRIMARY KEY (id),
  CONSTRAINT acessos_papel_id_acesso_fkey FOREIGN KEY (id_acesso)
      REFERENCES acessos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT acessos_papel_id_papel_fkey FOREIGN KEY (id_papel)
      REFERENCES papeis (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE acessos_papel OWNER TO postgres;

-- Table: clientes

-- DROP TABLE clientes;

CREATE TABLE clientes
(
  cpf character varying(11) NOT NULL,
  nome character varying(80) NOT NULL,
  senha character varying(80) NOT NULL,
  email character varying(80) NOT NULL,
  CONSTRAINT clientes_pkey PRIMARY KEY (cpf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE clientes OWNER TO postgres;


-- Table: funcionarios

-- DROP TABLE funcionarios;

CREATE TABLE funcionarios
(
  matricula serial NOT NULL,
  nome character varying(80) NOT NULL,
  apelido character varying(80) NOT NULL,
  senha character varying(80) NOT NULL,
  CONSTRAINT funcionarios_pkey PRIMARY KEY (matricula)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE funcionarios OWNER TO postgres;

-- Table: promocoes

-- DROP TABLE promocoes;

CREATE TABLE promocoes
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  operador character(1) NOT NULL,
  fator double precision,
  CONSTRAINT promocoes_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE promocoes OWNER TO postgres;


-- Table: produtos

-- DROP TABLE produtos;

CREATE TABLE produtos
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  preco double precision,
  id_promocao integer,
  CONSTRAINT produtos_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE produtos OWNER TO postgres;

-- Table: estoques

-- DROP TABLE estoques;

CREATE TABLE estoques
(
  id_produto integer NOT NULL,
  quantidade integer,
  maximo integer,
  minimo integer,
  reservada integer,
  CONSTRAINT estoques_pkey PRIMARY KEY (id_produto),
  CONSTRAINT estoques_id_produto_fkey FOREIGN KEY (id_produto)
      REFERENCES produtos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE estoques OWNER TO postgres;


-- Table: pedidos

-- DROP TABLE pedidos;

CREATE TABLE pedidos
(
  id serial NOT NULL,
  data timestamp without time zone NOT NULL,
  status smallint NOT NULL,
  cpf character varying(11) NOT NULL,
  CONSTRAINT pedidos_pkey PRIMARY KEY (id),
  CONSTRAINT pedidos_cpf_fkey FOREIGN KEY (cpf)
      REFERENCES clientes (cpf) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE pedidos OWNER TO postgres;


-- Table: itens

-- DROP TABLE itens;

CREATE TABLE itens
(
  id_pedido integer NOT NULL,
  id_produto integer NOT NULL,
  preco double precision NOT NULL,
  quantidade integer NOT NULL,
  CONSTRAINT itens_pkey PRIMARY KEY (id_pedido, id_produto),
  CONSTRAINT itens_id_pedido_fkey FOREIGN KEY (id_pedido)
      REFERENCES pedidos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT itens_id_produto_fkey FOREIGN KEY (id_produto)
      REFERENCES produtos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE itens OWNER TO postgres;

-- Table: movimentacoes

-- DROP TABLE movimentacoes;

CREATE TABLE movimentacoes
(
  id serial NOT NULL,
  id_produto integer NOT NULL,
  quantidade integer,
  data date NOT NULL,
  tipo character(1) NOT NULL,
  CONSTRAINT movimentacoes_pkey PRIMARY KEY (id),
  CONSTRAINT movimentacoes_id_produto_fkey FOREIGN KEY (id_produto)
      REFERENCES produtos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE movimentacoes OWNER TO postgres;

-- Table: papeis_funcionario

-- DROP TABLE papeis_funcionario;

CREATE TABLE papeis_funcionario
(
  id serial NOT NULL,
  id_papel integer NOT NULL,
  id_funcionario integer NOT NULL,
  CONSTRAINT papeis_funcionario_pkey PRIMARY KEY (id),
  CONSTRAINT papeis_funcionario_id_funcionario_fkey FOREIGN KEY (id_funcionario)
      REFERENCES funcionarios (matricula) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT papeis_funcionario_id_papel_fkey FOREIGN KEY (id_papel)
      REFERENCES papeis (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE papeis_funcionario OWNER TO postgres;


