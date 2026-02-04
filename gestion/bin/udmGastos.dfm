object dmGastos: TdmGastos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 523
  Top = 194
  Height = 269
  Width = 255
  object dspGastos: TDataSetProvider
    DataSet = ibdsGastos
    Constraints = True
    Left = 24
    Top = 64
  end
  object ibtGastos: TIBTransaction
    Active = False
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 24
    Top = 16
  end
  object ibdsGastos: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtGastos
    OnNewRecord = ibdsGastosNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GASTOS'
      'WHERE IDGASTO = :IDGASTO')
    InsertSQL.Strings = (
      
        'INSERT INTO GASTOS (IDGASTO, FECHA, DESCRIPCION, IMPORTE, IDFORM' +
        'APAGO)'
      ' VALUES ('
      ':IDGASTO,'
      #39'NOW'#39','
      ':DESCRIPCION,'
      ':IMPORTE,'
      ':IDFORMAPAGO'
      ')')
    SelectSQL.Strings = (
      
        'SELECT G.IDGASTO, G.FECHA, G.DESCRIPCION, G.IMPORTE, G.IDFORMAPA' +
        'GO'
      'FROM GASTOS G, FORMAS_PAGOS FP'
      'WHERE G.IDFORMAPAGO = FP.IDFORMAPAGO'
      'AND G.FECHA = :FECHA'
      'ORDER BY 1')
    GeneratorField.Field = 'IDGASTO'
    GeneratorField.Generator = 'GEN_IDGASTO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 24
    Top = 112
    object ibdsGastosIDGASTO: TIntegerField
      FieldName = 'IDGASTO'
      Origin = 'GASTOS.IDGASTO'
      Required = True
    end
    object ibdsGastosFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'GASTOS.FECHA'
      Required = True
    end
    object ibdsGastosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'GASTOS.DESCRIPCION'
      Required = True
      Size = 50
    end
    object ibdsGastosIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'GASTOS.IMPORTE'
      Required = True
      DisplayFormat = '$,0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibdsGastosIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'GASTOS.IDFORMAPAGO'
      Required = True
    end
    object ibdsGastosFORMAPAGO: TStringField
      FieldKind = fkLookup
      FieldName = 'FORMAPAGO'
      LookupDataSet = ibqFormasPagos
      LookupKeyFields = 'IDFORMAPAGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDFORMAPAGO'
      Lookup = True
    end
  end
  object ibqFormasPagos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtGastos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IDFORMAPAGO, DESCRIPCION'
      'FROM FORMAS_PAGOS'
      'WHERE DESCRIPCION <> '#39'CUENTA CORRIENTE'#39
      'ORDER BY 1')
    Left = 96
    Top = 16
    object ibqFormasPagosIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'FORMAS_PAGOS.IDFORMAPAGO'
      Required = True
    end
    object ibqFormasPagosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FORMAS_PAGOS.DESCRIPCION'
      Size = 30
    end
  end
end
