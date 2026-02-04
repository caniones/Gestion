object dmPagos: TdmPagos
  OldCreateOrder = False
  Left = 604
  Top = 247
  Height = 253
  Width = 298
  object dspCheques: TDataSetProvider
    DataSet = ibdsCheques
    Left = 32
    Top = 56
  end
  object ibtPagos: TIBTransaction
    Active = False
    DefaultDatabase = dmConexion.IBDatabase
    AutoStopAction = saNone
    Left = 32
    Top = 8
  end
  object ibdsCheques: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtPagos
    OnNewRecord = ibdsChequesNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    InsertSQL.Strings = (
      
        'INSERT INTO CHEQUES (IDCHEQUE, FECHA, NROCHEQUE, FECHA_CHEQUE, B' +
        'ANCO, IMPORTE, FECHA_COBRO, OBSERVACIONES)'
      ' VALUES ('
      ':IDCHEQUE, '
      #39'NOW'#39', '
      ':NROCHEQUE, '
      ':FECHA_CHEQUE, '
      ':BANCO, '
      ':IMPORTE, '
      ':FECHA_COBRO, '
      ':OBSERVACIONES'
      ')')
    SelectSQL.Strings = (
      
        'SELECT a.IDCHEQUE, a.FECHA, a.NROCHEQUE, a.FECHA_CHEQUE, a.BANCO' +
        ', a.IMPORTE, a.FECHA_COBRO, a.OBSERVACIONES'
      'FROM CHEQUES a'
      'ORDER BY A.BANCO, A.NROCHEQUE')
    ModifySQL.Strings = (
      'UPDATE CHEQUES'
      'SET'
      ' FECHA_COBRO = :FECHACOBRO,'
      ' OBSERVACIONES = :OBSERVACIONES'
      'WHERE IDCHEQUE = :IDCHEQUE')
    GeneratorField.Field = 'IDCHEQUE'
    GeneratorField.Generator = 'GEN_IDCHEQUE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 104
    object ibdsChequesIDCHEQUE: TIntegerField
      FieldName = 'IDCHEQUE'
      Origin = 'CHEQUES.IDCHEQUE'
      Required = True
    end
    object ibdsChequesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CHEQUES.FECHA'
      Required = True
    end
    object ibdsChequesNROCHEQUE: TIntegerField
      FieldName = 'NROCHEQUE'
      Origin = 'CHEQUES.NROCHEQUE'
      Required = True
    end
    object ibdsChequesFECHA_CHEQUE: TDateField
      FieldName = 'FECHA_CHEQUE'
      Origin = 'CHEQUES.FECHA_CHEQUE'
      Required = True
    end
    object ibdsChequesBANCO: TIBStringField
      FieldName = 'BANCO'
      Origin = 'CHEQUES.BANCO'
      Required = True
      Size = 50
    end
    object ibdsChequesIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'CHEQUES.IMPORTE'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibdsChequesFECHA_COBRO: TDateField
      FieldName = 'FECHA_COBRO'
      Origin = 'CHEQUES.FECHA_COBRO'
    end
    object ibdsChequesOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'CHEQUES.OBSERVACIONES'
      Size = 100
    end
  end
  object dspDepositos: TDataSetProvider
    DataSet = ibdsDepositos
    Left = 112
    Top = 56
  end
  object ibdsDepositos: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtPagos
    OnNewRecord = ibdsDepositosNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    InsertSQL.Strings = (
      
        'INSERT INTO DEPOSITOS_BANCARIOS (IDDEPOSITO, FECHA, NRODEPOSITO,' +
        ' FECHA_DEPOSITO, BANCO, IMPORTE, OBSERVACIONES)'
      ' VALUES ('
      ':IDDEPOSITO, '
      #39'NOW'#39', '
      ':NRODEPOSITO, '
      ':FECHA_DEPOSITO, '
      ':BANCO, '
      ':IMPORTE, '
      ':OBSERVACIONES'
      ')')
    SelectSQL.Strings = (
      
        'SELECT a.IDDEPOSITO, a.FECHA, a.NRODEPOSITO, a.FECHA_DEPOSITO, a' +
        '.BANCO, a.IMPORTE, a.OBSERVACIONES'
      'FROM DEPOSITOS_BANCARIOS a'
      'ORDER BY A.BANCO, A.NRODEPOSITO')
    ModifySQL.Strings = (
      'UPDATE DEPOSITOS_BANCARIOS'
      'SET'
      ' OBSERVACIONES = :OBSERVACIONES'
      'WHERE IDDEPOSITO = :IDDEPOSITO')
    GeneratorField.Field = 'IDDEPOSITO'
    GeneratorField.Generator = 'GEN_IDDEPOSITOBANCARIO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 112
    Top = 104
    object ibdsDepositosIDDEPOSITO: TIntegerField
      FieldName = 'IDDEPOSITO'
      Origin = 'DEPOSITOS_BANCARIOS.IDDEPOSITO'
      Required = True
    end
    object ibdsDepositosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DEPOSITOS_BANCARIOS.FECHA'
      Required = True
    end
    object ibdsDepositosNRODEPOSITO: TIntegerField
      FieldName = 'NRODEPOSITO'
      Origin = 'DEPOSITOS_BANCARIOS.NRODEPOSITO'
      Required = True
    end
    object ibdsDepositosFECHA_DEPOSITO: TDateField
      FieldName = 'FECHA_DEPOSITO'
      Origin = 'DEPOSITOS_BANCARIOS.FECHA_DEPOSITO'
      Required = True
    end
    object ibdsDepositosBANCO: TIBStringField
      FieldName = 'BANCO'
      Origin = 'DEPOSITOS_BANCARIOS.BANCO'
      Required = True
      Size = 50
    end
    object ibdsDepositosIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      Origin = 'DEPOSITOS_BANCARIOS.IMPORTE'
      Required = True
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsDepositosOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'DEPOSITOS_BANCARIOS.OBSERVACIONES'
      Size = 100
    end
  end
end
