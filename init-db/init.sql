-- Utilizar o SCHEMA public;
SET search_path TO public;

-- DROP SEQUENCE public.cid_id;
CREATE SEQUENCE public.cid_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.cid_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.cid_id TO postgres;
-- public.cidade definição

CREATE TABLE public.cidade (
	cid_id int4 DEFAULT nextval('cid_id'::regclass) NOT NULL,
	cid_nome varchar(200) NOT NULL,
	cid_uf bpchar(2) NOT NULL,
	CONSTRAINT cidade_pkey PRIMARY KEY (cid_id)
);
-- Permissions
ALTER TABLE public.cidade OWNER TO postgres;
GRANT ALL ON TABLE public.cidade TO postgres;
-- Inserindo cidades
INSERT INTO public.cidade (cid_id, cid_nome, cid_uf) VALUES
(1, 'Cuiabá', 'MT'),
(2, 'Várzea Grande', 'MT'),
(3, 'Rondonópolis', 'MT'),
(4, 'Sinop', 'MT'),
(5, 'Tangará da Serra', 'MT'),
(6, 'Cáceres', 'MT'),
(7, 'Sorriso', 'MT'),
(8, 'Lucas do Rio Verde', 'MT'),
(9, 'Barra do Garças', 'MT'),
(10, 'Primavera do Leste', 'MT');


-- DROP SEQUENCE public.end_id;
CREATE SEQUENCE public.end_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.end_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.end_id TO postgres;
-- public.endereco definição
CREATE TABLE public.endereco (
	end_id int4 DEFAULT nextval('end_id'::regclass) NOT NULL,
	end_tipo_logradouro varchar(50) NOT NULL,
	end_logradouro varchar(200) NOT NULL,
	end_numero int4 NOT NULL,
	end_bairro varchar(100) NOT NULL,
	cid_id int4 NOT NULL,
	CONSTRAINT endereco_pkey PRIMARY KEY (end_id),
	CONSTRAINT iendereco FOREIGN KEY (cid_id) REFERENCES public.cidade(cid_id)
);
CREATE INDEX iendereco ON public.endereco USING btree (cid_id);
-- Permissions
ALTER TABLE public.endereco OWNER TO postgres;
GRANT ALL ON TABLE public.endereco TO postgres;
-- Inserindo endereços
INSERT INTO public.endereco (end_id, end_tipo_logradouro, end_logradouro, end_numero, end_bairro, cid_id) VALUES
(1, 'Rua', 'Barão de Melgaço', 1000, 'Centro', 1),
(2, 'Avenida', 'Brigadeiro Eduardo Gomes', 500, 'Centro', 2),
(3, 'Rua', 'Fernando Corrêa da Costa', 250, 'Jardim Primavera', 3),
(4, 'Rua', 'Das Violetas', 1500, 'Centro', 4),
(5, 'Avenida', 'Brasil', 200, 'Vila Alta', 5),
(6, 'Rua', 'Comandante Costa', 10, 'Centro', 6),
(7, 'Rua', 'Palmeiras', 800, 'Centro', 7),
(8, 'Avenida', 'Mato Grosso', 1200, 'Centro', 8),
(9, 'Rua', 'Minas Gerais', 300, 'Centro', 9),
(10, 'Avenida', 'Porto Alegre', 50, 'Centro', 10);



-- DROP SEQUENCE public.unid_id;
CREATE SEQUENCE public.unid_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.unid_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.unid_id TO postgres;
-- public.unidade definição
CREATE TABLE public.unidade (
	unid_id int4 DEFAULT nextval('unid_id'::regclass) NOT NULL,
	unid_nome varchar(200) NOT NULL,
	unid_sigla varchar(20) NOT NULL,
	CONSTRAINT unidade_pkey PRIMARY KEY (unid_id)
);
-- Permissions
ALTER TABLE public.unidade OWNER TO postgres;
GRANT ALL ON TABLE public.unidade TO postgres;
-- Inserindo unidades
INSERT INTO public.unidade (unid_id, unid_nome, unid_sigla) VALUES
(1, 'Departamento de TI', 'DTI'),
(2, 'Recursos Humanos', 'RH'),
(3, 'Financeiro', 'FIN'),
(4, 'Jurídico', 'JUR'),
(5, 'Comunicação', 'COM'),
(6, 'Tecnologia', 'TEC'),
(7, 'Educação', 'EDU'),
(8, 'Saúde', 'SAU'),
(9, 'Segurança', 'SEG'),
(10, 'Administração', 'ADM');



-- DROP SEQUENCE public.pes_id;
CREATE SEQUENCE public.pes_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.pes_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.pes_id TO postgres;
-- public.pessoa definição
CREATE TABLE public.pessoa (
	pes_id int4 DEFAULT nextval('pes_id'::regclass) NOT NULL,
	pes_nome varchar(200) NOT NULL,
	pes_data_nascimento date NOT NULL,
	pes_sexo varchar(9) NOT NULL,
	pes_mae varchar(200) NOT NULL,
	pes_pai varchar(200) NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (pes_id)
);
-- Permissions
ALTER TABLE public.pessoa OWNER TO postgres;
GRANT ALL ON TABLE public.pessoa TO postgres;
-- Inserindo pessoas
INSERT INTO public.pessoa (pes_id, pes_nome, pes_data_nascimento, pes_sexo, pes_mae, pes_pai) VALUES
(1, 'Bruno Azevedo', '1983-10-05', 'Masculino', 'Helena Azevedo', 'Marcos Azevedo'),
(2, 'Larissa Nogueira', '1992-01-17', 'Feminino', 'Vera Nogueira', 'Claudio Nogueira'),
(3, 'Eduardo Tavares', '1979-08-29', 'Masculino', 'Sandra Tavares', 'Milton Tavares'),
(4, 'Patrícia Rocha', '1987-04-13', 'Feminino', 'Lucia Rocha', 'Sérgio Rocha'),
(5, 'André Cunha', '1984-06-22', 'Masculino', 'Irene Cunha', 'Valdir Cunha'),
(6, 'Camila Ferreira', '1996-12-01', 'Feminino', 'Denise Ferreira', 'Rogério Ferreira'),
(7, 'Thiago Mendes', '1990-11-11', 'Masculino', 'Rosana Mendes', 'Geraldo Mendes'),
(8, 'Natália Barros', '1998-07-07', 'Feminino', 'Marta Barros', 'Renato Barros'),
(9, 'Fábio Teixeira', '1985-03-15', 'Masculino', 'Angela Teixeira', 'Marcelo Teixeira'),
(10, 'Isabela Prado', '1993-09-27', 'Feminino', 'Claudia Prado', 'Celso Prado');


-- DROP SEQUENCE public.fp_id;
CREATE SEQUENCE public.fp_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.fp_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.fp_id TO postgres;
-- public.foto_pessoa definição
CREATE TABLE public.foto_pessoa (
	fp_id int4 DEFAULT nextval('fp_id'::regclass) NOT NULL,
	fp_data date NOT NULL,
	fp_bucket varchar(50) NOT NULL,
	fp_hash varchar(50) NOT NULL,
	pes_id int4 NOT NULL,
	CONSTRAINT foto_pessoa_pkey PRIMARY KEY (fp_id),
	CONSTRAINT ifoto_pessoa FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id)
);
CREATE INDEX ifoto_pessoa ON public.foto_pessoa USING btree (pes_id);
-- Permissions
ALTER TABLE public.foto_pessoa OWNER TO postgres;
GRANT ALL ON TABLE public.foto_pessoa TO postgres;



-- public.pessoa_endereco definição
CREATE TABLE public.pessoa_endereco (
	pes_id int4 NOT NULL,
	end_id int4 NOT NULL,
	CONSTRAINT pessoa_endereco_pkey PRIMARY KEY (pes_id, end_id),
	CONSTRAINT ipessoa_endereco FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id),
	CONSTRAINT ipessoa_endereco1 FOREIGN KEY (end_id) REFERENCES public.endereco(end_id)
);
CREATE INDEX ipessoa_endereco1 ON public.pessoa_endereco USING btree (end_id);
-- Permissions
ALTER TABLE public.pessoa_endereco OWNER TO postgres;
GRANT ALL ON TABLE public.pessoa_endereco TO postgres;
-- Associando pessoas a endereços
INSERT INTO public.pessoa_endereco (pes_id, end_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);



-- public.servidor_temporario definição
CREATE TABLE public.servidor_temporario (
	pes_id int4 NOT NULL,
	st_data_admissao date NOT NULL,
	st_data_demissao date NULL,
	CONSTRAINT servidor_temporario_pes_id_fkey FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id) ON DELETE CASCADE
);
-- Permissions
ALTER TABLE public.servidor_temporario OWNER TO postgres;
GRANT ALL ON TABLE public.servidor_temporario TO postgres;
-- Inserindo servidores temporários (outra metade das pessoas)
INSERT INTO public.servidor_temporario (pes_id, st_data_admissao, st_data_demissao) VALUES
(6, '2023-02-10', NULL), (7, '2022-05-15', '2023-07-14'),
(8, '2021-10-20', '2022-12-01'), (9, '2024-02-05', NULL),
(10, '2020-03-18', '2023-06-17');



-- public.servidor_efetivo definição
CREATE TABLE public.servidor_efetivo (
	pes_id int4 NOT NULL,
	se_matricula varchar(20) NOT NULL,
	CONSTRAINT servidor_efetivo_pes_id_fkey FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id) ON DELETE CASCADE
);
-- Permissions
ALTER TABLE public.servidor_efetivo OWNER TO postgres;
GRANT ALL ON TABLE public.servidor_efetivo TO postgres;
-- Inserindo servidores efetivos (metade das pessoas)
INSERT INTO public.servidor_efetivo (pes_id, se_matricula) VALUES
(1, '123456'), (2, '789012'), (3, '345678'),
(4, '901234'), (5, '567890');



-- DROP SEQUENCE public.lot_id;
CREATE SEQUENCE public.lot_id
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- Permissions
ALTER SEQUENCE public.lot_id OWNER TO postgres;
GRANT ALL ON SEQUENCE public.lot_id TO postgres;
-- public.lotacao definição
CREATE TABLE public.lotacao (
	lot_id int4 DEFAULT nextval('lot_id'::regclass) NOT NULL,
	lot_data_lotacao date NOT NULL,
	lot_data_remocao date NULL,
	lot_portaria varchar(100) NOT NULL,
	pes_id int4 NOT NULL,
	unid_id int4 NOT NULL,
	CONSTRAINT lotacao_pkey PRIMARY KEY (lot_id),
	CONSTRAINT ilotacao FOREIGN KEY (unid_id) REFERENCES public.unidade(unid_id),
	CONSTRAINT ilotacao1 FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id)
);
CREATE INDEX ilotacao ON public.lotacao USING btree (unid_id);
CREATE INDEX ilotacao1 ON public.lotacao USING btree (pes_id);
-- Permissions
ALTER TABLE public.lotacao OWNER TO postgres;
GRANT ALL ON TABLE public.lotacao TO postgres;
-- Inserindo lotações
INSERT INTO public.lotacao (lot_id, lot_data_lotacao, lot_data_remocao, lot_portaria, pes_id, unid_id) VALUES
(1, '2022-06-15', NULL, 'Portaria 001/2019', 1, 1),
(2, '2021-02-20', NULL, 'Portaria 002/2021', 2, 2),
(3, '2024-03-01', NULL, 'Portaria 003/2023', 3, 3),
(4, '2020-08-10', '2023-08-09', 'Portaria 004/2022', 4, 4),
(5, '2019-11-05', NULL, 'Portaria 005/2019', 5, 5),
(6, '2024-03-10', NULL, 'Portaria 006/2024', 6, 6),
(7, '2023-07-01', NULL, 'Portaria 007/2023', 7, 7),
(8, '2022-09-15', '2023-09-14', 'Portaria 008/2023', 8, 8),
(9, '2021-10-20', NULL, 'Portaria 009/2021', 9, 9),
(10, '2020-12-05', '2022-12-04', 'Portaria 010/2020', 10, 10);



-- public.unidade_endereco definição
CREATE TABLE public.unidade_endereco (
	unid_id int4 NOT NULL,
	end_id int4 NOT NULL,
	CONSTRAINT unidade_endereco_pkey PRIMARY KEY (unid_id, end_id),
	CONSTRAINT iunidade_endereco FOREIGN KEY (unid_id) REFERENCES public.unidade(unid_id),
	CONSTRAINT iunidade_endereco1 FOREIGN KEY (end_id) REFERENCES public.endereco(end_id)
);
CREATE INDEX iunidade_endereco1 ON public.unidade_endereco USING btree (end_id);
-- Permissions
ALTER TABLE public.unidade_endereco OWNER TO postgres;
GRANT ALL ON TABLE public.unidade_endereco TO postgres;
-- Permissions
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
-- Associando unidades a endereços
INSERT INTO public.unidade_endereco (unid_id, end_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);