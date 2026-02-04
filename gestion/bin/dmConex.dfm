object dmConexion: TdmConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 609
  Top = 178
  Height = 314
  Width = 322
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Desarrollos\Sistemas\facturacion\data\0.9\GESTION.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 16
  end
  object ibTransac: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 64
  end
  object ibdsSecuencias: TIBDataSet
    Database = IBDatabase
    Transaction = ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT r.IDSECUENCIA, r.NOMBRE, r.VALOR'
      'FROM SECUENCIAS r'
      'WHERE r.SUCURSAL = :SUCURSAL')
    ModifySQL.Strings = (
      'UPDATE SECUENCIAS r'
      'SET'
      ' r.VALOR = :VALOR'
      'WHERE r.SUCURSAL = 1'
      'AND r.IDSECUENCIA = :IDSECUENCIA')
    Left = 32
    Top = 112
    object ibdsSecuenciasIDSECUENCIA: TIntegerField
      FieldName = 'IDSECUENCIA'
      Origin = 'SECUENCIAS.IDSECUENCIA'
      Required = True
    end
    object ibdsSecuenciasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'SECUENCIAS.NOMBRE'
      Required = True
      Size = 50
    end
    object ibdsSecuenciasVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'SECUENCIAS.VALOR'
      Required = True
    end
  end
  object ibdsMonedas: TIBDataSet
    Database = IBDatabase
    Transaction = ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT r.IDMONEDA, r.MONEDA, r.COTIZACION, r.SIGNO'
      'FROM MONEDAS r')
    ModifySQL.Strings = (
      'UPDATE MONEDAS SET '
      'COTIZACION = :COTIZACION, '
      'SIGNO = :SIGNO'
      'WHERE IDMONEDA = :IDMONEDA')
    Left = 144
    Top = 112
    object ibdsMonedasIDMONEDA: TIntegerField
      FieldName = 'IDMONEDA'
      Origin = 'MONEDAS.IDMONEDA'
      Required = True
    end
    object ibdsMonedasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'MONEDAS.MONEDA'
      Required = True
      Size = 50
    end
    object ibdsMonedasCOTIZACION: TIBBCDField
      FieldName = 'COTIZACION'
      Origin = 'MONEDAS.COTIZACION'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 9
      Size = 4
    end
    object ibdsMonedasSIGNO: TIBStringField
      FieldName = 'SIGNO'
      Origin = 'MONEDAS.SIGNO'
      Size = 10
    end
  end
  object dsMonedas: TDataSource
    AutoEdit = False
    DataSet = ibdsMonedas
    Left = 144
    Top = 160
  end
  object ibqActualizarCostos: TIBQuery
    Database = IBDatabase
    Transaction = ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsMonedas
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ACTUALIZAR_COSTOS_MONEDAS (:IDMONEDA)')
    Left = 144
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMONEDA'
        ParamType = ptUnknown
        Size = 4
      end>
  end
end
