object dmRecibos: TdmRecibos
  OldCreateOrder = False
  Left = 578
  Top = 215
  Height = 265
  Width = 394
  object ibtRecibos: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 24
    Top = 16
  end
  object ibdsRecibos: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtRecibos
    OnCalcFields = ibdsRecibosCalcFields
    OnNewRecord = ibdsRecibosNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE SP_ANULAR_RECIBO(:IDRECIBO)')
    InsertSQL.Strings = (
      
        'INSERT INTO RECIBOS (IDRECIBO, NUMERO, FECHA, IDCLIENTE, IMPORTE' +
        ', IDFORMAPAGO, IDPAGO)'
      ' VALUES ('
      ':IDRECIBO,'
      ':NUMERO,'
      #39'NOW'#39','
      ':IDCLIENTE,'
      ':IMPORTE,'
      ':IDFORMAPAGO,'
      ':IDPAGO'
      ')')
    SelectSQL.Strings = (
      
        'SELECT IDRECIBO, NUMERO, FECHA, IDCLIENTE, IMPORTE, IDFORMAPAGO,' +
        ' IDPAGO, ANULADO'
      'FROM RECIBOS'
      'WHERE ANULADO = 0'
      'ORDER BY FECHA DESC, NUMERO DESC')
    ModifySQL.Strings = (
      'UPDATE RECIBOS'
      'SET NUMERO = :NUMERO'
      'WHERE IDRECIBO = :IDRECIBO')
    GeneratorField.Field = 'IDRECIBO'
    GeneratorField.Generator = 'GEN_IDRECIBO'
    Left = 24
    Top = 112
    object ibdsRecibosIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
      Origin = 'RECIBOS.IDRECIBO'
      Required = True
    end
    object ibdsRecibosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'RECIBOS.NUMERO'
      Required = True
    end
    object ibdsRecibosFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'RECIBOS.FECHA'
      Required = True
    end
    object ibdsRecibosIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'RECIBOS.IDCLIENTE'
    end
    object ibdsRecibosIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'RECIBOS.IMPORTE'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibdsRecibosIMPORTERECARGO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IMPORTERECARGO'
      Calculated = True
    end
    object ibdsRecibosIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'RECIBOS.IDFORMAPAGO'
      Required = True
    end
    object ibdsRecibosFORMAPAGO: TStringField
      DisplayLabel = 'FORMA DE PAGO'
      FieldKind = fkLookup
      FieldName = 'FORMAPAGO'
      LookupDataSet = ibqFormasPagos
      LookupKeyFields = 'IDFORMAPAGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDFORMAPAGO'
      Lookup = True
    end
    object ibdsRecibosCLIENTE: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'CLIENTE'
      LookupDataSet = ibqClientes
      LookupKeyFields = 'IDCLIENTE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'IDCLIENTE'
      Size = 50
      Lookup = True
    end
    object ibdsRecibosIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'RECIBOS.IDPAGO'
    end
    object ibdsRecibosANULADO: TIntegerField
      FieldName = 'ANULADO'
      Origin = 'RECIBOS.ANULADO'
    end
  end
  object dspRecibos: TDataSetProvider
    DataSet = ibdsRecibos
    Exported = False
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 64
  end
  object ibqFormasPagos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtRecibos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IDFORMAPAGO, DESCRIPCION, COEFICIENTE'
      'FROM FORMAS_PAGOS'
      'WHERE IDFORMAPAGO <> 500'
      'ORDER BY 1')
    Left = 296
    Top = 64
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
    object ibqFormasPagosCOEFICIENTE: TIBBCDField
      FieldName = 'COEFICIENTE'
      Origin = 'FORMAS_PAGOS.COEFICIENTE'
      Required = True
      Precision = 18
      Size = 4
    end
  end
  object ibspControlCtaCte: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = ibtRecibos
    StoredProcName = 'SP_CONTROL_CUENTAS_CLIENTE'
    Left = 296
    Top = 112
    ParamData = <
      item
        DataType = ftBCD
        Name = 'PSSALDO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PSMENSAJE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PEID_NROCOMPROBANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDRECIBO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEIDCLIENTE'
        ParamType = ptInput
      end>
    object ibspControlCtaCtePSSALDO: TIBBCDField
      FieldName = 'PSSALDO'
      Origin = 'SP_CONTROL_CUENTAS_CLIENTE.PSSALDO'
      Precision = 18
      Size = 4
    end
    object ibspControlCtaCtePSMENSAJE: TIBStringField
      FieldName = 'PSMENSAJE'
      Origin = 'SP_CONTROL_CUENTAS_CLIENTE.PSMENSAJE'
      Size = 100
    end
  end
  object ibqClientes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtRecibos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT C.IDCLIENTE, C.NOMBRE'
      'FROM CLIENTES C'
      'WHERE C.FECHA_BAJA IS NULL'
      'AND C.IDCLIENTE > 0'
      'ORDER BY C.NOMBRE')
    Left = 112
    Top = 64
    object ibqClientesIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'CLIENTES.IDCLIENTE'
      Required = True
    end
    object ibqClientesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Required = True
      Size = 50
    end
  end
  object ibspAnularRecibo: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = ibtRecibos
    StoredProcName = 'SP_ANULAR_RECIBO'
    Left = 296
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEID'
        ParamType = ptInput
      end>
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = ibqClientes
    Left = 112
    Top = 112
  end
  object ibqSaldo: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      'SELECT r.SALDO'
      'FROM CUENTASCORRIENTES_CLIENTES r'
      'WHERE R.IDTRANSACCION = (SELECT MAX(CCC.IDTRANSACCION)'
      
        '                                                     FROM CUENTA' +
        'SCORRIENTES_CLIENTES CCC'
      
        '                                                     WHERE CCC.I' +
        'DCLIENTE = :IDCLIENTE)')
    Left = 112
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCLIENTE'
        ParamType = ptUnknown
      end>
    object ibqSaldoSALDO: TIBBCDField
      FieldName = 'SALDO'
      Origin = 'CUENTASCORRIENTES_CLIENTES.SALDO'
      Required = True
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
  end
  object ibqUltimoPago: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      'SELECT r.FECHA'
      'FROM CUENTASCORRIENTES_CLIENTES r'
      'WHERE R.IDTRANSACCION = (SELECT MAX(CCC.IDTRANSACCION)'
      
        '                                                     FROM CUENTA' +
        'SCORRIENTES_CLIENTES CCC'
      
        '                                                     WHERE CCC.I' +
        'DCLIENTE = :IDCLIENTE)')
    Left = 192
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCLIENTE'
        ParamType = ptUnknown
      end>
    object ibqUltimoPagoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CUENTASCORRIENTES_CLIENTES.FECHA'
      Required = True
    end
  end
end
