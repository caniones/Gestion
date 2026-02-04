object dmTitulos: TdmTitulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 484
  Top = 241
  Height = 197
  Width = 202
  object dspTitulos: TDataSetProvider
    DataSet = ibdsTitulos
    Constraints = True
    Left = 24
    Top = 64
  end
  object ibtTitulos: TIBTransaction
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
  object ibdsTitulos: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtTitulos
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TITULOS'
      'WHERE IDTITULO = :IDTITULO')
    InsertSQL.Strings = (
      'INSERT INTO TITULOS (IDTITULO, DESCRIPCION)'
      ' VALUES ('
      ':IDTITULO, '
      ':DESCRIPCION'
      ')')
    SelectSQL.Strings = (
      'SELECT IDTITULO, DESCRIPCION'
      'FROM TITULOS'
      'ORDER BY 2')
    ModifySQL.Strings = (
      'UPDATE TITULOS'
      'SET'
      '  DESCRIPCION = :DESCRIPCION'
      'WHERE IDTITULO = :IDTITULO')
    GeneratorField.Field = 'IDTITULO'
    GeneratorField.Generator = 'GEN_IDTITULO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 24
    Top = 112
    object ibdsTitulosIDTITULO: TIntegerField
      FieldName = 'IDTITULO'
      Origin = 'TITULOS.IDTITULO'
      Required = True
    end
    object ibdsTitulosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TITULOS.DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object ibqValidar: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtTitulos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM TITULOS'
      'WHERE DESCRIPCION = :DESCRIPCION'
      'AND IDTITULO <> :IDTITULO')
    Left = 96
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULO'
        ParamType = ptInput
      end>
    object ibqValidarCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibqPermisoBaja: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtTitulos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM ARTICULOS'
      'WHERE IDTITULO = :IDTITULO')
    Left = 96
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULO'
        ParamType = ptInput
      end>
    object ibqPermisoBajaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
