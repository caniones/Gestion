object dmClientes: TdmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 585
  Top = 212
  Height = 277
  Width = 325
  object ibdsClientes: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtClientes
    OnNewRecord = ibdsClientesNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'UPDATE CLIENTES'
      'SET FECHA_BAJA = '#39'NOW'#39
      'WHERE IDCLIENTE = :IDCLIENTE')
    InsertSQL.Strings = (
      
        'INSERT INTO CLIENTES (IDCLIENTE, IDSITUACION, CUIT, NOMBRE, DIRE' +
        'CCION, CODIGO_POSTAL, IDLOCALIDAD, '
      
        'TELEFONO_FIJO, TELEFONO_MOVIL, TELEFONO_TRABAJO, NUMERO_FAX, EMA' +
        'IL, LIMITE_CREDITO, '
      'SALDO_INICIAL, FECHA_INGRESO, INTERES)'
      ' VALUES ('
      ':IDCLIENTE, '
      ':IDSITUACION, '
      ':CUIT,'
      ':NOMBRE, '
      ':DIRECCION, '
      ':CODIGO_POSTAL, '
      ':IDLOCALIDAD, '
      ':TELEFONO_FIJO,'
      ':TELEFONO_MOVIL, '
      ':TELEFONO_TRABAJO, '
      ':NUMERO_FAX, '
      ':EMAIL, '
      ':LIMITE_CREDITO, '
      ':SALDO_INICIAL, '
      #39'NOW'#39','
      ':INTERES'
      ')')
    SelectSQL.Strings = (
      
        'SELECT C.IDCLIENTE, C.IDSITUACION, C.CUIT, C.NOMBRE, C.DIRECCION' +
        ', C.CODIGO_POSTAL, '
      
        '  C.IDLOCALIDAD, L.NOMBRE||'#39' - '#39'||P.NOMBRE AS LOCALIDAD, C.TELEF' +
        'ONO_FIJO, '
      
        '  C.TELEFONO_MOVIL, C.TELEFONO_TRABAJO, C.NUMERO_FAX, C.EMAIL, C' +
        '.LIMITE_CREDITO, '
      '  C.SALDO_INICIAL, C.FECHA_INGRESO, C.FECHA_BAJA, C.INTERES'
      'FROM CLIENTES C'
      'INNER JOIN LOCALIDADES L ON L.IDLOCALIDAD = C.IDLOCALIDAD'
      'INNER JOIN PROVINCIAS P ON P.IDPROVINCIA = L.IDPROVINCIA'
      'ORDER BY 4')
    ModifySQL.Strings = (
      'UPDATE CLIENTES'
      'SET '
      ' IDSITUACION= :IDSITUACION,'
      ' CUIT = :CUIT, '
      ' NOMBRE= :NOMBRE,'
      ' DIRECCION= :DIRECCION,'
      ' CODIGO_POSTAL= :CODIGO_POSTAL,'
      ' IDLOCALIDAD= :IDLOCALIDAD, '
      ' TELEFONO_FIJO= :TELEFONO_FIJO,'
      ' TELEFONO_MOVIL= :TELEFONO_MOVIL,'
      ' TELEFONO_TRABAJO= :TELEFONO_TRABAJO,'
      ' NUMERO_FAX= :NUMERO_FAX,'
      ' EMAIL= :EMAIL,'
      ' LIMITE_CREDITO= :LIMITE_CREDITO,'
      ' FECHA_BAJA = :FECHA_BAJA,'
      ' INTERES = :INTERES'
      'WHERE IDCLIENTE = :IDCLIENTE;')
    GeneratorField.Field = 'IDCLIENTE'
    GeneratorField.Generator = 'GEN_IDCLIENTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 104
    object ibdsClientesIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'CLIENTES.IDCLIENTE'
      Required = True
    end
    object ibdsClientesIDSITUACION: TIntegerField
      FieldName = 'IDSITUACION'
      Origin = 'CLIENTES.IDSITUACION'
      Required = True
    end
    object ibdsClientesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Required = True
      Size = 50
    end
    object ibdsClientesDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'CLIENTES.DIRECCION'
      Required = True
      Size = 50
    end
    object ibdsClientesCODIGO_POSTAL: TIBStringField
      FieldName = 'CODIGO_POSTAL'
      Origin = 'CLIENTES.CODIGO_POSTAL'
      Size = 13
    end
    object ibdsClientesIDLOCALIDAD: TIntegerField
      FieldName = 'IDLOCALIDAD'
      Origin = 'CLIENTES.IDLOCALIDAD'
      Required = True
    end
    object ibdsClientesTELEFONO_FIJO: TIBStringField
      FieldName = 'TELEFONO_FIJO'
      Origin = 'CLIENTES.TELEFONO_FIJO'
      Size = 15
    end
    object ibdsClientesTELEFONO_MOVIL: TIBStringField
      FieldName = 'TELEFONO_MOVIL'
      Origin = 'CLIENTES.TELEFONO_MOVIL'
      Size = 15
    end
    object ibdsClientesTELEFONO_TRABAJO: TIBStringField
      FieldName = 'TELEFONO_TRABAJO'
      Origin = 'CLIENTES.TELEFONO_TRABAJO'
      Size = 15
    end
    object ibdsClientesNUMERO_FAX: TIBStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'CLIENTES.NUMERO_FAX'
      Size = 15
    end
    object ibdsClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 50
    end
    object ibdsClientesLIMITE_CREDITO: TIBBCDField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsClientesSALDO_INICIAL: TIBBCDField
      FieldName = 'SALDO_INICIAL'
      Origin = 'CLIENTES.SALDO_INICIAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsClientesFECHA_INGRESO: TDateField
      FieldName = 'FECHA_INGRESO'
      Origin = 'CLIENTES.FECHA_INGRESO'
    end
    object ibdsClientesFECHA_BAJA: TDateField
      FieldName = 'FECHA_BAJA'
      Origin = 'CLIENTES.FECHA_BAJA'
    end
    object ibdsClientesCUIT: TIBStringField
      FieldName = 'CUIT'
      Origin = 'CLIENTES.CUIT'
      Required = True
      Size = 11
    end
    object ibdsClientesINTERES: TIBBCDField
      FieldName = 'INTERES'
      Origin = 'CLIENTES.INTERES'
      Required = True
      DisplayFormat = '%,0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibdsClientesLOCALIDAD: TIBStringField
      FieldName = 'LOCALIDAD'
      Size = 103
    end
  end
  object ibqValidar: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM CLIENTES'
      'WHERE IDCLIENTE <> :IDCLIENTE'
      'AND UPPER(NOMBRE) = UPPER(:NOMBRE)')
    Left = 96
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end>
    object ibqValidarCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibqSituaciones: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IDSITUACION, DESCRIPCION'
      'FROM SITUACIONES'
      'ORDER BY 2')
    Left = 168
    Top = 8
    object ibqSituacionesIDSITUACION: TIntegerField
      FieldName = 'IDSITUACION'
      Origin = 'SITUACIONES.IDSITUACION'
      Required = True
    end
    object ibqSituacionesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'SITUACIONES.DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object ibqLocalidades: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT L.IDLOCALIDAD, L.NOMBRE||'#39' - '#39'||P.NOMBRE AS LOCALIDAD'
      'FROM LOCALIDADES L'
      'INNER JOIN PROVINCIAS P ON P.IDPROVINCIA = L.IDPROVINCIA'
      'ORDER BY 2')
    Left = 168
    Top = 56
    object ibqLocalidadesIDLOCALIDAD: TIntegerField
      FieldName = 'IDLOCALIDAD'
      Origin = 'LOCALIDADES.IDLOCALIDAD'
      Required = True
    end
    object ibqLocalidadesLOCALIDAD: TIBStringField
      FieldName = 'LOCALIDAD'
      Required = True
      Size = 103
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = ibdsClientes
    Left = 32
    Top = 56
  end
  object ibtClientes: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 8
  end
  object ibqControlCtaCte: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtClientes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      
        'INSERT INTO CUENTASCORRIENTES_CLIENTES (IDTRANSACCION, FECHA, ID' +
        'CLIENTE, SALDO)'
      ' VALUES ('
      'GEN_ID(GEN_IDTRANSACCION,1),'
      #39'NOW'#39', '
      ':IDCLIENTE, '
      ':SALDO_INICIAL'
      ')'
      ''
      '')
    GeneratorField.Generator = 'GEN_IDTRANSACCION'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'SALDO_INICIAL'
        ParamType = ptUnknown
      end>
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = ibdsClientes
    Left = 32
    Top = 152
  end
end
