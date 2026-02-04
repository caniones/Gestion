object dmCierreTurno: TdmCierreTurno
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 579
  Top = 212
  Height = 212
  Width = 389
  object ibtCierresTurnos: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 16
  end
  object ibqCierresTurnos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCierresTurnos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IDCIERRE, FECHA'
      'FROM CIERRES_TURNOS'
      'ORDER BY 2 DESC')
    Left = 32
    Top = 64
    object ibqCierresTurnosIDCIERRE: TIntegerField
      DisplayLabel = 'NUMERO CIERRE'
      FieldName = 'IDCIERRE'
      Origin = 'CIERRE_TURNO.IDCIERRE'
      Required = True
    end
    object ibqCierresTurnosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CIERRE_TURNO.FECHA'
      Required = True
    end
  end
  object ibsqlCerrarTurno: TIBSQL
    Database = dmConexion.IBDatabase
    ParamCheck = True
    SQL.Strings = (
      
        'INSERT INTO CIERRES_TURNOS (IDCIERRE, FECHA, ID_NROCOMPROBANTE, ' +
        'IDGASTO, IDRECIBO)'
      ' VALUES ('
      ' GEN_ID(GEN_IDCIERRE,1),'
      ' '#39'NOW'#39','
      ' (SELECT MAX(ID_NROCOMPROBANTE)'
      '  FROM COMPROBANTES),'
      ' (SELECT MAX(IDGASTO)'
      '  FROM GASTOS),'
      ' (SELECT MAX(IDRECIBO)'
      '  FROM RECIBOS)'
      ')')
    Transaction = ibtCierresTurnos
    Left = 32
    Top = 112
  end
  object ibqIdCierreTurno: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCierresTurnos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAX(IDCIERRE)'
      'FROM CIERRES_TURNOS')
    Left = 128
    Top = 112
    object ibqIdCierreTurnoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object ibqVentasXmes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCierresTurnos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT EXTRACT(YEAR FROM p.PSFECHA)||'#39'/'#39'||LPAD(CAST(EXTRACT(MONT' +
        'H FROM p.PSFECHA) AS VARCHAR(2)),2,'#39'0'#39') AS FECHA,'
      '    SUM(p.PSTOTAL) AS TOTAL, SUM(p.PSCONTADO) AS CONTADO,'
      
        '    SUM(p.PSCUENTA) AS CUENTA, SUM(p.PSDEBITO) AS DEBITO, SUM(p.' +
        'PSCREDITO) AS CREDITO, '
      
        '    SUM(p.PSCHEQUE) AS CHEQUE, SUM(p.PSTICKET) AS TICKET, SUM(p.' +
        'PSDEPOSITO) AS DEPOSITO'
      'FROM SP_VENTAS_DIARIAS (:DESDE_FECHA, :HASTA_FECHA) p'
      'GROUP BY 1'
      'ORDER BY 1')
    Left = 232
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'DESDE_FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'HASTA_FECHA'
        ParamType = ptInput
      end>
    object ibqVentasXmesFECHA: TIBStringField
      DisplayWidth = 19
      FieldName = 'FECHA'
      Size = 32765
    end
    object ibqVentasXmesTOTAL: TIBBCDField
      DisplayWidth = 19
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesCONTADO: TIBBCDField
      DisplayWidth = 19
      FieldName = 'CONTADO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesCUENTA: TIBBCDField
      DisplayWidth = 19
      FieldName = 'CUENTA'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesDEBITO: TIBBCDField
      DisplayWidth = 19
      FieldName = 'DEBITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesCREDITO: TIBBCDField
      DisplayWidth = 19
      FieldName = 'CREDITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesCHEQUE: TIBBCDField
      DisplayWidth = 19
      FieldName = 'CHEQUE'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesTICKET: TIBBCDField
      DisplayWidth = 19
      FieldName = 'TICKET'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXmesDEPOSITO: TIBBCDField
      DisplayWidth = 19
      FieldName = 'DEPOSITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
  end
  object ibqVentasXanio: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCierresTurnos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT EXTRACT(YEAR FROM p.PSFECHA) AS FECHA,'
      '    SUM(p.PSTOTAL) AS TOTAL, SUM(p.PSCONTADO) AS CONTADO,'
      
        '    SUM(p.PSCUENTA) AS CUENTA, SUM(p.PSDEBITO) AS DEBITO, SUM(p.' +
        'PSCREDITO) AS CREDITO, '
      
        '    SUM(p.PSCHEQUE) AS CHEQUE, SUM(p.PSTICKET) AS TICKET, SUM(p.' +
        'PSDEPOSITO) AS DEPOSITO'
      'FROM SP_VENTAS_DIARIAS (:DESDE_FECHA, :HASTA_FECHA) p'
      'GROUP BY 1'
      'ORDER BY 1')
    Left = 232
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DESDE_FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HASTA_FECHA'
        ParamType = ptUnknown
      end>
    object ibqVentasXanioFECHA: TSmallintField
      DisplayWidth = 19
      FieldName = 'FECHA'
    end
    object ibqVentasXanioTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioCONTADO: TIBBCDField
      FieldName = 'CONTADO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioCUENTA: TIBBCDField
      FieldName = 'CUENTA'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioDEBITO: TIBBCDField
      FieldName = 'DEBITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioCHEQUE: TIBBCDField
      FieldName = 'CHEQUE'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioTICKET: TIBBCDField
      FieldName = 'TICKET'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqVentasXanioDEPOSITO: TIBBCDField
      FieldName = 'DEPOSITO'
      DisplayFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
  end
end
