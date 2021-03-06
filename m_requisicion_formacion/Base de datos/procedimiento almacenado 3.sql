USE [PRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_REQUI_AUDITORIA]    Script Date: 08/10/2015 04:37:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[INSERTAR_REQUI_AUDITORIA]
@ALAMO BIT ,
@APIZACO BIT ,
@CATEMACO BIT ,
@COATZACOALCOS BIT ,
@CORDOBA BIT ,
@FORTIN BIT ,
@HUAMANTLA BIT ,
@JUAN_PABLO BIT ,
@MARTINEZ BIT ,
@ORIZABA BIT ,
@POZA_RICA BIT ,
@PUEBLA_SUR BIT ,
@TEJERIA BIT ,
@TEZIUTLAN BIT ,
@TLAXCALA BIT ,
@TUXPAN BIT ,
@VERACRUZ BIT ,
@XALAPA BIT ,
@ZACATELCO BIT,

@MES VARCHAR(20),
@DESCRIPCION TEXT


AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN Insertar1
	Begin Try
		INSERT INTO dbo.ESTADO_OFICINA (ALAMO, APIZACO, CATEMACO, COATZACOALCOS, CORDOBA, FORTIN, HUAMANTLA, JUAN_PABLO, MARTINEZ, ORIZABA, POZA_RICA, PUEBLA_SUR, TEJERIA, TEZIUTLAN, TLAXCALA, TUXPAN , VERACRUZ, XALAPA, ZACATELCO) VALUES (@ALAMO, @APIZACO, @CATEMACO, @COATZACOALCOS, @CORDOBA, @FORTIN, @HUAMANTLA, @JUAN_PABLO, @MARTINEZ, @ORIZABA, @POZA_RICA, @PUEBLA_SUR, @TEJERIA, @TEZIUTLAN, @TLAXCALA, @TUXPAN , @VERACRUZ, @XALAPA, @ZACATELCO);
		INSERT INTO dbo.REQUI_AUDITORIA(ESTADO_OFICINA_ID, MES, DESCRIPCION) VALUES (SCOPE_IDENTITY(), @MES, @DESCRIPCION);
		

		COMMIT TRAN Insertar1
	End Try
	Begin Catch
		
		Rollback TRAN Insertar1
	End Catch
END
