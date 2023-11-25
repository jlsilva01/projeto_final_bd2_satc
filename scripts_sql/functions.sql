DROP FUNCTION IF EXISTS fn_count_apolices
GO

CREATE FUNCTION fn_count_apolices (@cod_cliente int)
RETURNS int
AS
BEGIN
	DECLARE @resultado int

	SELECT @resultado = COUNT(cod_apolice)
	FROM apolice
	WHERE cod_cliente = @cod_cliente

	RETURN @resultado
END
GO
