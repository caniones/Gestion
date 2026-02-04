object dmLineas: TdmLineas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 657
  Top = 299
  Height = 212
  Width = 248
  object dspLineas: TDataSetProvider
    DataSet = ibdsLineas
    Constraints = True
    Left = 16
    Top = 56
  end
  object ibtLineas: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 16
    Top = 8
  end
  object ibdsLineas: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtLineas
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM LINEAS'
      'WHERE IDLINEA = :IDLINEA')
    InsertSQL.Strings = (
      'INSERT INTO LINEAS (IDLINEA, DESCRIPCION)'
      ' VALUES ('
      ':IDLINEA, '
      ':DESCRIPCION'
      ')')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM LINEAS'
      'ORDER BY 2')
    ModifySQL.Strings = (
      'UPDATE LINEAS SET'
      'DESCRIPCION = :DESCRIPCION'
      'WHERE IDLINEA = :IDLINEA;')
    GeneratorField.Field = 'IDLINEA'
    GeneratorField.Generator = 'GEN_IDLINEA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 16
    Top = 104
    object ibdsLineasIDLINEA: TIntegerField
      FieldName = 'IDLINEA'
      Origin = 'LINEAS.IDLINEA'
      Required = True
    end
    object ibdsLineasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LINEAS.DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object ibqValidar: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtLineas
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM LINEAS'
      'WHERE UPPER(DESCRIPCION) = UPPER(:NOMBRE)'
      'AND IDLINEA <> :ID')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object ibqValidarCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibqPermisoBaja: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtLineas
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM ARTICULOS A'
      'WHERE A.IDLINEA = :IDLINEA')
    Left = 88
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLINEA'
        ParamType = ptInput
      end>
    object ibqPermisoBajaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
