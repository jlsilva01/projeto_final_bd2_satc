DROP PROCEDURE IF EXISTS pr_imc
GO

CREATE PROCEDURE pr_imc (@massa numeric(10,2), @altura numeric(10,2), @resultado numeric(10,2) OUTPUT) AS
BEGIN
	DECLARE @altura_quadrado numeric(10,2)

	SELECT @altura_quadrado = POWER(@altura, 2)

	SELECT @resultado = @massa / @altura_quadrado 
	
END
GO
