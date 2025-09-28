create database pontos_de_vendas;
use pontos_de_vendas;
CREATE TABLE DIM_CALENDARIO (
    DATA DATE PRIMARY KEY,
    MES INT,
    ANO INT
);
CREATE TABLE DIM_PDV (
    ID_PONTO_VENDA INT NOT NULL UNIQUE PRIMARY KEY,
    NOME_PONTO_VENDA VARCHAR(255),
    PERFIL_PONTO_VENDA VARCHAR(100)
);
CREATE TABLE DIM_LINHA_PRODUTO (
    ID_LINHA_PRODUTO INT NOT NULL UNIQUE PRIMARY KEY,
    NOME_LINHA_PRODUTO VARCHAR(255),
    MARCA_LINHA_PRODUTO VARCHAR(100)
);

CREATE TABLE FT_DISPONIBILIDADE (
    DATA DATE references DIM_CALENDARIO(DATA),
    ID_PONTO_VENDA INT references DIM_PDV(ID_PONTO_VENDA), 
    ID_LINHA_PRODUTO INT references DIM_LINHA_PRODUTO(ID_LINHA_PRODUTO),
    QTD_PRESENCA_SET bigint unsigned
);
CREATE TABLE FT_DISPONIBILIDADE_AGRUPADA (
	DATA DATE references DIM_CALENDARIO(DATA),
    ID_PONTO_VENDA INT references DIM_PDV(ID_PONTO_VENDA), 
    QTD_PRESENCA_SET bigint unsigned
);

CREATE TABLE FT_PONTO_EXTRA (
    DATA DATE references DIM_CALENDARIO(DATA),
    ID_PONTO_VENDA INT references DIM_PDV(ID_PONTO_VENDA), 
    ID_LINHA_PRODUTO INT references DIM_LINHA_PRODUTO(ID_LINHA_PRODUTO),
    SOMA_PONTO_EXTRA bigint unsigned
);
CREATE TABLE FT_PONTO_EXTRA_AGRUPADA (
    DATA DATE references DIM_CALENDARIO(DATA),
    ID_PONTO_VENDA INT references DIM_PDV(ID_PONTO_VENDA), 
    SOMA_PONTO_EXTRA bigint unsigned
);

drop table dim_calendario;
drop table dim_pdv;
drop table dim_linha_produto;
drop table FT_DISPONIBILIDADE;
drop table ft_disponibilidade_agrupada;
drop table ft_ponto_extra;
drop table ft_ponto_extra_agrupada;

select * from dim_calendario;
select * from dim_pdv;
select * from dim_linha_produto;
select * from FT_DISPONIBILIDADE;
select * from ft_disponibilidade_agrupada;
select * from ft_ponto_extra;
select * from ft_ponto_extra_agrupada;
