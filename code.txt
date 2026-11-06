CREATE DATABASE locadora_veiculos
	ENCODING = 'UTF8'
	LC_COLLATE = 'en_US.UTF-8'
	LC_CTYPE = 'en_US.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres;

SET search_path TO pg_catalog,public;

CREATE SEQUENCE public.cidade_id_cidade_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

ALTER SEQUENCE public.cidade_id_cidade_seq OWNER TO postgres;

CREATE TABLE public.cidade (
	id_cidade integer NOT NULL DEFAULT nextval('public.cidade_id_cidade_seq'::regclass),
	nome character varying(100) NOT NULL,
	estado character(2) NOT NULL,
	CONSTRAINT cidade_pkey PRIMARY KEY (id_cidade),
	CONSTRAINT cidade_nome_estado_key UNIQUE (nome,estado)
);

ALTER TABLE public.cidade OWNER TO postgres;

CREATE SEQUENCE public.pessoa_id_pessoa_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

ALTER SEQUENCE public.pessoa_id_pessoa_seq OWNER TO postgres;

CREATE TABLE public.pessoa (
	id_pessoa integer NOT NULL DEFAULT nextval('public.pessoa_id_pessoa_seq'::regclass),
	telefone character varying(20),
	email character varying(100),
	id_cidade integer NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (id_pessoa)
);

ALTER TABLE public.pessoa OWNER TO postgres;

CREATE TABLE public.individuo (
	id_pessoa integer NOT NULL,
	nome character varying(150) NOT NULL,
	cpf character varying(14) NOT NULL,
	rg character varying(20) NOT NULL,
	CONSTRAINT individuo_pkey PRIMARY KEY (id_pessoa),
	CONSTRAINT individuo_cpf_key UNIQUE (cpf)
);

ALTER TABLE public.individuo OWNER TO postgres;

CREATE TABLE public.organizacao (
	id_pessoa integer NOT NULL,
	razao_social character varying(150) NOT NULL,
	nome_fantasia character varying(150) NOT NULL,
	cnpj character varying(18) NOT NULL,
	CONSTRAINT organizacao_pkey PRIMARY KEY (id_pessoa),
	CONSTRAINT organizacao_cnpj_key UNIQUE (cnpj)
);
-- ddl-end --
ALTER TABLE public.organizacao OWNER TO postgres;
-- ddl-end --

-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente(
	id_pessoa integer NOT NULL,
	CONSTRAINT cliente_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO postgres;
-- ddl-end --

-- object: public.cliente_autorizado | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente_autorizado CASCADE;
CREATE TABLE public.cliente_autorizado (
	id_pessoa integer NOT NULL,
	data_liberacao date NOT NULL,
	CONSTRAINT cliente_autorizado_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.cliente_autorizado OWNER TO postgres;
-- ddl-end --

-- object: public.proprietario | type: TABLE --
-- DROP TABLE IF EXISTS public.proprietario CASCADE;
CREATE TABLE public.proprietario (
	id_pessoa integer NOT NULL,
	data_inicio_condicao date NOT NULL,
	numero_ultimo_contrato character varying(50),
	CONSTRAINT proprietario_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.proprietario OWNER TO postgres;
-- ddl-end --

-- object: public.locadora | type: TABLE --
-- DROP TABLE IF EXISTS public.locadora CASCADE;
CREATE TABLE public.locadora (
	id_pessoa integer NOT NULL,
	CONSTRAINT locadora_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.locadora OWNER TO postgres;
-- ddl-end --

-- object: public.setor_id_setor_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.setor_id_setor_seq CASCADE;
CREATE SEQUENCE public.setor_id_setor_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.setor_id_setor_seq OWNER TO postgres;
-- ddl-end --

-- object: public.setor | type: TABLE --
-- DROP TABLE IF EXISTS public.setor CASCADE;
CREATE TABLE public.setor (
	id_setor integer NOT NULL DEFAULT nextval('public.setor_id_setor_seq'::regclass),
	nome_setor character varying(50) NOT NULL,
	id_locadora integer NOT NULL,
	CONSTRAINT setor_pkey PRIMARY KEY (id_setor),
	CONSTRAINT setor_nome_setor_id_locadora_key UNIQUE (nome_setor,id_locadora)
);
-- ddl-end --
ALTER TABLE public.setor OWNER TO postgres;
-- ddl-end --

-- object: public.funcionario | type: TABLE --
-- DROP TABLE IF EXISTS public.funcionario CASCADE;
CREATE TABLE public.funcionario (
	id_pessoa integer NOT NULL,
	matricula character varying(20) NOT NULL,
	data_admissao date NOT NULL,
	salario_base numeric(10,2) NOT NULL,
	id_locadora integer NOT NULL,
	CONSTRAINT funcionario_pkey PRIMARY KEY (id_pessoa),
	CONSTRAINT funcionario_matricula_key UNIQUE (matricula)
);
-- ddl-end --
ALTER TABLE public.funcionario OWNER TO postgres;
-- ddl-end --

-- object: public.vendedor | type: TABLE --
-- DROP TABLE IF EXISTS public.vendedor CASCADE;
CREATE TABLE public.vendedor (
	id_pessoa integer NOT NULL,
	percentual_comissao numeric(5,2) NOT NULL,
	CONSTRAINT vendedor_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.vendedor OWNER TO postgres;
-- ddl-end --

-- object: public.gerente | type: TABLE --
-- DROP TABLE IF EXISTS public.gerente CASCADE;
CREATE TABLE public.gerente (
	id_pessoa integer NOT NULL,
	id_setor integer NOT NULL,
	CONSTRAINT gerente_pkey PRIMARY KEY (id_pessoa)
);
-- ddl-end --
ALTER TABLE public.gerente OWNER TO postgres;
-- ddl-end --

-- object: public.fabricante_id_fabricante_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.fabricante_id_fabricante_seq CASCADE;
CREATE SEQUENCE public.fabricante_id_fabricante_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.fabricante_id_fabricante_seq OWNER TO postgres;
-- ddl-end --

-- object: public.fabricante | type: TABLE --
-- DROP TABLE IF EXISTS public.fabricante CASCADE;
CREATE TABLE public.fabricante (
	id_fabricante integer NOT NULL DEFAULT nextval('public.fabricante_id_fabricante_seq'::regclass),
	nome character varying(100) NOT NULL,
	ano_fundacao integer,
	pais_origem character varying(50),
	CONSTRAINT fabricante_pkey PRIMARY KEY (id_fabricante)
);
-- ddl-end --
ALTER TABLE public.fabricante OWNER TO postgres;
-- ddl-end --

-- object: public.modelo_id_modelo_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.modelo_id_modelo_seq CASCADE;
CREATE SEQUENCE public.modelo_id_modelo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.modelo_id_modelo_seq OWNER TO postgres;
-- ddl-end --

-- object: public.modelo | type: TABLE --
-- DROP TABLE IF EXISTS public.modelo CASCADE;
CREATE TABLE public.modelo (
	id_modelo integer NOT NULL DEFAULT nextval('public.modelo_id_modelo_seq'::regclass),
	nome character varying(100) NOT NULL,
	consumo_medio numeric(5,2) NOT NULL,
	numero_marchas integer NOT NULL,
	ano_lancamento integer NOT NULL,
	ano_final_producao integer,
	capacidade_porta_malas integer NOT NULL,
	velocidade_maxima integer NOT NULL,
	tempo_aceleracao_0_100 numeric(5,2) NOT NULL,
	tipo_cambio character varying(30) NOT NULL,
	torque numeric(6,2) NOT NULL,
	potencia integer NOT NULL,
	id_fabricante integer NOT NULL,
	CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo)
);
-- ddl-end --
ALTER TABLE public.modelo OWNER TO postgres;
-- ddl-end --

-- object: public.cor_id_cor_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.cor_id_cor_seq CASCADE;
CREATE SEQUENCE public.cor_id_cor_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.cor_id_cor_seq OWNER TO postgres;
-- ddl-end --

-- object: public.cor | type: TABLE --
-- DROP TABLE IF EXISTS public.cor CASCADE;
CREATE TABLE public.cor (
	id_cor integer NOT NULL DEFAULT nextval('public.cor_id_cor_seq'::regclass),
	nome character varying(50) NOT NULL,
	codigo_hexadecimal character varying(7),
	tipo character varying(30),
	acabamento character varying(30),
	caracteristicas_pintura text,
	CONSTRAINT cor_pkey PRIMARY KEY (id_cor)
);
-- ddl-end --
ALTER TABLE public.cor OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_de_propulsao_id_tipo_propulsao_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.tipo_de_propulsao_id_tipo_propulsao_seq CASCADE;
CREATE SEQUENCE public.tipo_de_propulsao_id_tipo_propulsao_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.tipo_de_propulsao_id_tipo_propulsao_seq OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_de_propulsao | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_de_propulsao CASCADE;
CREATE TABLE public.tipo_de_propulsao (
	id_tipo_propulsao integer NOT NULL DEFAULT nextval('public.tipo_de_propulsao_id_tipo_propulsao_seq'::regclass),
	nome character varying(50) NOT NULL,
	descricao text NOT NULL,
	usa_tanque boolean NOT NULL,
	usa_bateria boolean NOT NULL,
	CONSTRAINT tipo_de_propulsao_pkey PRIMARY KEY (id_tipo_propulsao)
);
-- ddl-end --
ALTER TABLE public.tipo_de_propulsao OWNER TO postgres;
-- ddl-end --

-- object: public.veiculo | type: TABLE --
-- DROP TABLE IF EXISTS public.veiculo CASCADE;
CREATE TABLE public.veiculo (
	placa character varying(7) NOT NULL,
	chassi character varying(17) NOT NULL,
	preco_venda numeric(10,2) NOT NULL,
	valor_diaria numeric(8,2) NOT NULL,
	condicao character varying(30) NOT NULL,
	ano_fabricacao integer NOT NULL,
	quilometragem_atual integer NOT NULL,
	id_modelo integer NOT NULL,
	id_cor integer NOT NULL,
	id_tipo_propulsao integer NOT NULL,
	id_proprietario integer NOT NULL,
	CONSTRAINT veiculo_pkey PRIMARY KEY (placa),
	CONSTRAINT veiculo_chassi_key UNIQUE (chassi),
	CONSTRAINT veiculo_condicao_check CHECK ( condicao IN ('Excelente', 'Muito bom', 'Bom', 'Regular', 'de Colecionador') )
);
-- ddl-end --
ALTER TABLE public.veiculo OWNER TO postgres;
-- ddl-end --

-- object: public.locacao_id_locacao_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.locacao_id_locacao_seq CASCADE;
CREATE SEQUENCE public.locacao_id_locacao_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.locacao_id_locacao_seq OWNER TO postgres;
-- ddl-end --

-- object: public.locacao | type: TABLE --
-- DROP TABLE IF EXISTS public.locacao CASCADE;
CREATE TABLE public.locacao (
	id_locacao integer NOT NULL DEFAULT nextval('public.locacao_id_locacao_seq'::regclass),
	quilometragem_inicial integer NOT NULL,
	quilometragem_final integer,
	data_hora_retirada timestamp NOT NULL,
	data_hora_devolucao_prevista timestamp NOT NULL,
	data_hora_devolucao_efetiva timestamp,
	valor_operacao numeric(10,2),
	id_cliente integer NOT NULL,
	placa_veiculo character varying(7) NOT NULL,
	id_vendedor integer NOT NULL,
	id_locadora integer NOT NULL,
	CONSTRAINT locacao_pkey PRIMARY KEY (id_locacao)
);
-- ddl-end --
ALTER TABLE public.locacao OWNER TO postgres;
-- ddl-end --

-- object: fk_pessoa_cidade | type: CONSTRAINT --
-- ALTER TABLE public.pessoa DROP CONSTRAINT IF EXISTS fk_pessoa_cidade CASCADE;
ALTER TABLE public.pessoa ADD CONSTRAINT fk_pessoa_cidade FOREIGN KEY (id_cidade)
REFERENCES public.cidade (id_cidade) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_individuo_pessoa | type: CONSTRAINT --
-- ALTER TABLE public.individuo DROP CONSTRAINT IF EXISTS fk_individuo_pessoa CASCADE;
ALTER TABLE public.individuo ADD CONSTRAINT fk_individuo_pessoa FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_org_pessoa | type: CONSTRAINT --
-- ALTER TABLE public.organizacao DROP CONSTRAINT IF EXISTS fk_org_pessoa CASCADE;
ALTER TABLE public.organizacao ADD CONSTRAINT fk_org_pessoa FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_cliente_pessoa | type: CONSTRAINT --
-- ALTER TABLE public.cliente DROP CONSTRAINT IF EXISTS fk_cliente_pessoa CASCADE;
ALTER TABLE public.cliente ADD CONSTRAINT fk_cliente_pessoa FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_cliente_auth_cliente | type: CONSTRAINT --
-- ALTER TABLE public.cliente_autorizado DROP CONSTRAINT IF EXISTS fk_cliente_auth_cliente CASCADE;
ALTER TABLE public.cliente_autorizado ADD CONSTRAINT fk_cliente_auth_cliente FOREIGN KEY (id_pessoa)
REFERENCES public.cliente (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_proprietario_pessoa | type: CONSTRAINT --
-- ALTER TABLE public.proprietario DROP CONSTRAINT IF EXISTS fk_proprietario_pessoa CASCADE;
ALTER TABLE public.proprietario ADD CONSTRAINT fk_proprietario_pessoa FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_locadora_org | type: CONSTRAINT --
-- ALTER TABLE public.locadora DROP CONSTRAINT IF EXISTS fk_locadora_org CASCADE;
ALTER TABLE public.locadora ADD CONSTRAINT fk_locadora_org FOREIGN KEY (id_pessoa)
REFERENCES public.organizacao (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_setor_locadora | type: CONSTRAINT --
-- ALTER TABLE public.setor DROP CONSTRAINT IF EXISTS fk_setor_locadora CASCADE;
ALTER TABLE public.setor ADD CONSTRAINT fk_setor_locadora FOREIGN KEY (id_locadora)
REFERENCES public.locadora (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_func_individuo | type: CONSTRAINT --
-- ALTER TABLE public.funcionario DROP CONSTRAINT IF EXISTS fk_func_individuo CASCADE;
ALTER TABLE public.funcionario ADD CONSTRAINT fk_func_individuo FOREIGN KEY (id_pessoa)
REFERENCES public.individuo (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_func_locadora | type: CONSTRAINT --
-- ALTER TABLE public.funcionario DROP CONSTRAINT IF EXISTS fk_func_locadora CASCADE;
ALTER TABLE public.funcionario ADD CONSTRAINT fk_func_locadora FOREIGN KEY (id_locadora)
REFERENCES public.locadora (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_vendedor_func | type: CONSTRAINT --
-- ALTER TABLE public.vendedor DROP CONSTRAINT IF EXISTS fk_vendedor_func CASCADE;
ALTER TABLE public.vendedor ADD CONSTRAINT fk_vendedor_func FOREIGN KEY (id_pessoa)
REFERENCES public.funcionario (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_gerente_func | type: CONSTRAINT --
-- ALTER TABLE public.gerente DROP CONSTRAINT IF EXISTS fk_gerente_func CASCADE;
ALTER TABLE public.gerente ADD CONSTRAINT fk_gerente_func FOREIGN KEY (id_pessoa)
REFERENCES public.funcionario (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_gerente_setor | type: CONSTRAINT --
-- ALTER TABLE public.gerente DROP CONSTRAINT IF EXISTS fk_gerente_setor CASCADE;
ALTER TABLE public.gerente ADD CONSTRAINT fk_gerente_setor FOREIGN KEY (id_setor)
REFERENCES public.setor (id_setor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_modelo_fabricante | type: CONSTRAINT --
-- ALTER TABLE public.modelo DROP CONSTRAINT IF EXISTS fk_modelo_fabricante CASCADE;
ALTER TABLE public.modelo ADD CONSTRAINT fk_modelo_fabricante FOREIGN KEY (id_fabricante)
REFERENCES public.fabricante (id_fabricante) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_veiculo_modelo | type: CONSTRAINT --
-- ALTER TABLE public.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_modelo CASCADE;
ALTER TABLE public.veiculo ADD CONSTRAINT fk_veiculo_modelo FOREIGN KEY (id_modelo)
REFERENCES public.modelo (id_modelo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_veiculo_cor | type: CONSTRAINT --
-- ALTER TABLE public.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_cor CASCADE;
ALTER TABLE public.veiculo ADD CONSTRAINT fk_veiculo_cor FOREIGN KEY (id_cor)
REFERENCES public.cor (id_cor) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_veiculo_propulsao | type: CONSTRAINT --
-- ALTER TABLE public.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_propulsao CASCADE;
ALTER TABLE public.veiculo ADD CONSTRAINT fk_veiculo_propulsao FOREIGN KEY (id_tipo_propulsao)
REFERENCES public.tipo_de_propulsao (id_tipo_propulsao) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_veiculo_proprietario | type: CONSTRAINT --
-- ALTER TABLE public.veiculo DROP CONSTRAINT IF EXISTS fk_veiculo_proprietario CASCADE;
ALTER TABLE public.veiculo ADD CONSTRAINT fk_veiculo_proprietario FOREIGN KEY (id_proprietario)
REFERENCES public.proprietario (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_locacao_cliente | type: CONSTRAINT --
-- ALTER TABLE public.locacao DROP CONSTRAINT IF EXISTS fk_locacao_cliente CASCADE;
ALTER TABLE public.locacao ADD CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente)
REFERENCES public.cliente (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_locacao_veiculo | type: CONSTRAINT --
-- ALTER TABLE public.locacao DROP CONSTRAINT IF EXISTS fk_locacao_veiculo CASCADE;
ALTER TABLE public.locacao ADD CONSTRAINT fk_locacao_veiculo FOREIGN KEY (placa_veiculo)
REFERENCES public.veiculo (placa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_locacao_vendedor | type: CONSTRAINT --
-- ALTER TABLE public.locacao DROP CONSTRAINT IF EXISTS fk_locacao_vendedor CASCADE;
ALTER TABLE public.locacao ADD CONSTRAINT fk_locacao_vendedor FOREIGN KEY (id_vendedor)
REFERENCES public.vendedor (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_locacao_locadora | type: CONSTRAINT --
-- ALTER TABLE public.locacao DROP CONSTRAINT IF EXISTS fk_locacao_locadora CASCADE;
ALTER TABLE public.locacao ADD CONSTRAINT fk_locacao_locadora FOREIGN KEY (id_locadora)
REFERENCES public.locadora (id_pessoa) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


