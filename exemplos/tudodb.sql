CREATE TABLE clientes
(
  cpf character varying(11) NOT NULL,
  nome character varying(80) NOT NULL,
  senha character varying(8) NOT NULL,
  email character varying(80) NOT NULL,
  CONSTRAINT clientes_pkey PRIMARY KEY (cpf)
)
WITH (OIDS=FALSE);
ALTER TABLE clientes OWNER TO postgres;


CREATE TABLE promocoes
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  operador character(1) NOT NULL,
  fator double precision,
  CONSTRAINT promocoes_pkey PRIMARY KEY (id)
)
WITH (OIDS=FALSE);
ALTER TABLE promocoes OWNER TO postgres;

CREATE TABLE produtos
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  preco double precision,
  id_promocao integer,
  CONSTRAINT produtos_pkey PRIMARY KEY (id)
)
WITH (OIDS=FALSE);
ALTER TABLE produtos OWNER TO postgres;

CREATE TABLE estoques
(
  id_produto integer NOT NULL,
  quantidade integer,
  maximo integer,
  minimo integer,
  CONSTRAINT estoques_pkey PRIMARY KEY (id_produto),
  CONSTRAINT estoques_id_produto_fkey FOREIGN KEY (id_produto)
      REFERENCES produtos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (OIDS=FALSE);
ALTER TABLE estoques OWNER TO postgres;

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
WITH (OIDS=FALSE);
ALTER TABLE movimentacoes OWNER TO postgres;

CREATE TABLE pedidos
(
  id integer NOT NULL,
  data date NOT NULL,
  status smallint NOT NULL,
  cpf character varying(11) NOT NULL,
  CONSTRAINT pedidos_pkey PRIMARY KEY (id),
  CONSTRAINT pedidos_cpf_fkey FOREIGN KEY (cpf)
      REFERENCES clientes (cpf) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (OIDS=FALSE);
ALTER TABLE pedidos OWNER TO postgres;

CREATE TABLE itens
(
  id integer NOT NULL,
  id_pedido integer NOT NULL,
  id_produto integer NOT NULL,
  preco double precision NOT NULL,
  CONSTRAINT itens_pkey PRIMARY KEY (id),
  CONSTRAINT itens_id_pedido_fkey FOREIGN KEY (id_pedido)
      REFERENCES pedidos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT itens_id_produto_fkey FOREIGN KEY (id_produto)
      REFERENCES produtos (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (OIDS=FALSE);
ALTER TABLE itens OWNER TO postgres;

CREATE TABLE funcionarios
(
  matricula serial NOT NULL,
  nome character varying(80) NOT NULL,
  apelido character varying(80) NOT NULL,
  senha character varying(80) NOT NULL,
  CONSTRAINT funcionarios_pkey PRIMARY KEY (matricula)
)
WITH (OIDS=FALSE);
ALTER TABLE funcionarios OWNER TO postgres;

CREATE TABLE papeis
(
  id serial NOT NULL,
  nome character varying(80) NOT NULL,
  CONSTRAINT papeis_pkey PRIMARY KEY (id)
)
WITH (OIDS=FALSE);
ALTER TABLE papeis OWNER TO postgres;

CREATE TABLE papeis_funcionario
(
  id integer NOT NULL,
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
WITH (OIDS=FALSE);
ALTER TABLE papeis_funcionario OWNER TO postgres;

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

CREATE TABLE acessos_papel
(
  id integer NOT NULL,
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
WITH (OIDS=FALSE);
ALTER TABLE acessos_papel OWNER TO postgres;
