object dmRubros: TdmRubros
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 495
  Top = 191
  Height = 236
  Width = 239
  object ibdsRubros: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtRubros
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM RUBROS'
      'WHERE IDRUBRO = :IDRUBRO')
    InsertSQL.Strings = (
      'INSERT INTO RUBROS (IDRUBRO, DESCRIPCION)'
      ' VALUES ('
      ':IDRUBRO, '
      ':DESCRIPCION'
      ')')
    SelectSQL.Strings = (
      'SELECT IDRUBRO, DESCRIPCION'
      'FROM RUBROS'
      'ORDER BY 2')
    ModifySQL.Strings = (
      'UPDATE RUBROS SET'
      'DESCRIPCION = :DESCRIPCION'
      'WHERE IDRUBRO = :IDRUBRO;')
    GeneratorField.Field = 'IDRUBRO'
    GeneratorField.Generator = 'GEN_IDRUBRO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 112
    object ibdsRubrosIDRUBRO: TIntegerField
      FieldName = 'IDRUBRO'
      Origin = 'RUBROS.IDRUBRO'
      Required = True
      Visible = False
    end
    object ibdsRubrosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RUBROS.DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object dspRubros: TDataSetProvider
    DataSet = ibdsRubros
    Constraints = True
    Left = 32
    Top = 64
  end
  object ibtRubros: TIBTransaction
    Active = False
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 16
  end
  object ibqValidar: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtRubros
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM RUBROS'
      'WHERE UPPER(DESCRIPCION) = UPPER(:NOMBRE)'
      'AND IDRUBRO <> :ID')
    Left = 104
    Top = 16
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
    Transaction = ibtRubros
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM ARTICULOS A'
      'WHERE A.IDRUBRO = :IDRUBRO')
    Left = 104
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBRO'
        ParamType = ptInput
      end>
    object ibqPermisoBajaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
