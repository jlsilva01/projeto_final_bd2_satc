/*==============================================================*/
/* DBMS name:      Microsoft SQL Server                         */
/* Created on:     24/11/2023 20:55:02                          */
/* Author:         Jorge Luiz da Silva                          */
/*==============================================================*/

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('avaliacao_aluno') and o.name = 'fk_aluno__avaliacao_aluno')
alter table avaliacao_aluno
   drop constraint fk_aluno__avaliacao_aluno
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('avaliacao_aluno') and o.name = 'fk_avaliacao__avaliacao_aluno')
alter table avaliacao_aluno
   drop constraint fk_avaliacao__avaliacao_aluno
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('questao') and o.name = 'fk_avaliacao__questao')
alter table questao
   drop constraint fk_avaliacao__questao
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('questao_item') and o.name = 'fk_questao__questao_item')
alter table questao_item
   drop constraint fk_questao__questao_item
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('resposta_aberta') and o.name = 'fk_avaliacao_aluno__resposta_aberta')
alter table resposta_aberta
   drop constraint fk_avaliacao_aluno__resposta_aberta
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('resposta_aberta') and o.name = 'fk_questao__resposta_aberta')
alter table resposta_aberta
   drop constraint fk_questao__resposta_aberta
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('resposta_fechada') and o.name = 'fk_avaliacao_aluno__resposta_fechada')
alter table resposta_fechada
   drop constraint fk_avaliacao_aluno__resposta_fechada
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('resposta_fechada') and o.name = 'fk_questao_item__resposta_fechada')
alter table resposta_fechada
   drop constraint fk_questao_item__resposta_fechada
go

if exists (select 1
            from  sysobjects
           where  id = object_id('aluno')
            and   type = 'U')
   drop table aluno
go

if exists (select 1
            from  sysobjects
           where  id = object_id('avaliacao')
            and   type = 'U')
   drop table avaliacao
go

if exists (select 1
            from  sysobjects
           where  id = object_id('avaliacao_aluno')
            and   type = 'U')
   drop table avaliacao_aluno
go

if exists (select 1
            from  sysobjects
           where  id = object_id('questao')
            and   type = 'U')
   drop table questao
go

if exists (select 1
            from  sysobjects
           where  id = object_id('questao_item')
            and   type = 'U')
   drop table questao_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('resposta_aberta')
            and   type = 'U')
   drop table resposta_aberta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('resposta_fechada')
            and   type = 'U')
   drop table resposta_fechada
go

/*==============================================================*/
/* Table: aluno                                                 */
/*==============================================================*/
create table aluno (
   cd_aluno             int                  identity,
   nm_aluno             varchar(100)         not null,
   email                varchar(100)         not null,
   constraint pk_aluno primary key (cd_aluno)
)
go

/*==============================================================*/
/* Table: avaliacao                                             */
/*==============================================================*/
create table avaliacao (
   cd_avaliacao         int                  identity,
   ds_avaliacao         varchar(100)         not null,
   dt_abertura          datetime             not null,
   dt_fechamento        datetime             not null,
   constraint pk_avaliacao primary key (cd_avaliacao)
)
go

/*==============================================================*/
/* Table: avaliacao_aluno                                       */
/*==============================================================*/
create table avaliacao_aluno (
   cd_avaliacao         int                  not null,
   cd_aluno             int                  not null,
   ds_avaliacao_aluno   varchar(100)         not null,
   dt_inicio            datetime             not null default getdate(),
   dt_fim               datetime             null,
   constraint pk_avaliacao_aluno primary key (cd_aluno, cd_avaliacao)
)
go

/*==============================================================*/
/* Table: questao                                               */
/*==============================================================*/
create table questao (
   cd_questao           int                  identity,
   cd_avaliacao         int                  not null,
   ds_questao           varchar(max)         not null,
   tp_questao           tinyint              not null
      constraint ckc_tp_questao_questao check (tp_questao in (1,2,3)),
   constraint pk_questao primary key (cd_questao)
)
go

/*==============================================================*/
/* Table: questao_item                                          */
/*==============================================================*/
create table questao_item (
   cd_questao_item      int                  identity,
   cd_questao           int                  not null,
   ds_questao_item      varchar(max)         not null,
   is_correta           bit                  not null,
   constraint pk_questao_item primary key (cd_questao_item)
)
go

/*==============================================================*/
/* Table: resposta_aberta                                       */
/*==============================================================*/
create table resposta_aberta (
   cd_avaliacao         int                  not null,
   cd_aluno             int                  not null,
   cd_questao           int                  not null,
   ds_resposta_aberta   varchar(max)         null,
   dt_resposta          datetime             not null,
   constraint pk_resposta_aberta primary key (cd_questao, cd_aluno, cd_avaliacao)
)
go

/*==============================================================*/
/* Table: resposta_fechada                                      */
/*==============================================================*/
create table resposta_fechada (
   cd_avaliacao         int                  not null,
   cd_aluno             int                  not null,
   cd_questao_item      int                  not null,
   dt_resposta          datetime             not null,
   constraint pk_resposta_fechada primary key (cd_questao_item, cd_aluno, cd_avaliacao)
)
go

alter table avaliacao_aluno
   add constraint fk_aluno__avaliacao_aluno foreign key (cd_aluno)
      references aluno (cd_aluno)
go

alter table avaliacao_aluno
   add constraint fk_avaliacao__avaliacao_aluno foreign key (cd_avaliacao)
      references avaliacao (cd_avaliacao)
go

alter table questao
   add constraint fk_avaliacao__questao foreign key (cd_avaliacao)
      references avaliacao (cd_avaliacao)
go

alter table questao_item
   add constraint fk_questao__questao_item foreign key (cd_questao)
      references questao (cd_questao)
go

alter table resposta_aberta
   add constraint fk_avaliacao_aluno__resposta_aberta foreign key (cd_aluno, cd_avaliacao)
      references avaliacao_aluno (cd_aluno, cd_avaliacao)
go

alter table resposta_aberta
   add constraint fk_questao__resposta_aberta foreign key (cd_questao)
      references questao (cd_questao)
go

alter table resposta_fechada
   add constraint fk_avaliacao_aluno__resposta_fechada foreign key (cd_aluno, cd_avaliacao)
      references avaliacao_aluno (cd_aluno, cd_avaliacao)
go

alter table resposta_fechada
   add constraint fk_questao_item__resposta_fechada foreign key (cd_questao_item)
      references questao_item (cd_questao_item)
go
