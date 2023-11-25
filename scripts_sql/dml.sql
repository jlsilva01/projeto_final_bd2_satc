SET IDENTITY_INSERT aluno ON 
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (1, 'MARISA MELO OLIVEIRA', 'marisa@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (2, 'MURILO CARVALHO CARDOSO', 'murilo@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (3, 'VINICIUS ROCHA RODRIGUES', 'vinicius@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (4, 'CAROLINA ROCHA GOMES', 'carolina@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (5, 'ALINE SANTOS CASTRO', 'aline@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (6, 'LEILA CORREIA CAVALCANTI', 'leila@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (7, 'SOPHIA CORREIA SANTOS', 'sophia@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (8, 'JOÃO CORREIA COSTA', 'joão@email.com')
GO
INSERT aluno (cd_aluno, nm_aluno, email) VALUES (9, 'RAFAEL DIAS SOUZA', 'rafael@email.com')
GO
SET IDENTITY_INSERT aluno OFF
GO

SET IDENTITY_INSERT avaliacao ON 
GO
INSERT avaliacao (cd_avaliacao, ds_avaliacao, dt_abertura, dt_fechamento) VALUES (1, '1a Avaliação Banco de dados (referente as aulas 1 à 5)', CAST('2022-08-30T19:00:00.000' AS DateTime), CAST('2022-08-30T22:00:00.000' AS DateTime))
GO
INSERT avaliacao (cd_avaliacao, ds_avaliacao, dt_abertura, dt_fechamento) VALUES (2, '2a Avaliação Banco de dados', CAST('2022-10-24T19:00:00.000' AS DateTime), CAST('2022-10-24T22:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT avaliacao OFF
GO
  
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (1, 1, '1a Avaliação Banco de dados (referente as aulas 1 à 5)', CAST('2022-10-24T16:00:14.510' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (1, 2, '1a Avaliação Banco de dados', CAST('2022-10-24T16:31:27.380' AS DateTime), NULL)
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 2, '2a Avaliação Banco de dados', CAST('2022-10-24T16:31:28.030' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (1, 4, '1a Avaliação Banco de dados', CAST('2022-10-24T16:31:25.910' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 4, '2a Avaliação Banco de dados', CAST('2022-10-24T16:02:59.533' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 5, '2a Avaliação Banco de dados', CAST('2022-10-24T16:31:25.020' AS DateTime), NULL)
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (1, 6, '1a Avaliação Banco de dados', CAST('2022-10-24T16:31:26.690' AS DateTime), NULL)
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 6, '2a Avaliação Banco de dados', CAST('2022-10-24T16:31:27.027' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 8, '2a Avaliação Banco de dados', CAST('2022-10-24T16:31:26.327' AS DateTime), CAST('2022-10-24T16:00:35.893' AS DateTime))
GO
INSERT avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, dt_inicio, dt_fim) VALUES (2, 9, '2a Avaliação Banco de dados', CAST('2022-10-24T16:31:27.737' AS DateTime), NULL)
GO
