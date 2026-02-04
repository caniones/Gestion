object dmEstadoCtasCtesClientes: TdmEstadoCtasCtesClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 449
  Top = 239
  Height = 347
  Width = 327
  object ibtCtasCtesClientes: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 40
    Top = 16
  end
  object ibqClientes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtasCtesClientes
    AfterOpen = ibqClientesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.IDCLIENTE, C.NOMBRE, C.DIRECCION, L.NOMBRE||'#39' - '#39'||P.NO' +
        'MBRE AS LOCALIDAD, C.LIMITE_CREDITO'
      'FROM CLIENTES C'
      'INNER JOIN LOCALIDADES L ON L.IDLOCALIDAD = C.IDLOCALIDAD'
      'INNER JOIN PROVINCIAS P ON P.IDPROVINCIA = L.IDPROVINCIA'
      'AND IDCLIENTE > 0'
      'AND C.FECHA_BAJA IS NULL'
      'ORDER BY C.NOMBRE')
    Left = 40
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
    object ibqClientesDIRECCION: TIBStringField
      DisplayWidth = 40
      FieldName = 'DIRECCION'
      Origin = 'CLIENTES.DIRECCION'
      Required = True
      Size = 50
    end
    object ibqClientesLOCALIDAD: TIBStringField
      DisplayWidth = 60
      FieldName = 'LOCALIDAD'
      Required = True
      Size = 103
    end
    object ibqClientesLIMITE_CREDITO: TIBBCDField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
      Precision = 18
      Size = 4
    end
  end
  object ibqComprobantes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtasCtesClientes
    AfterOpen = ibqComprobantesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      
        'SELECT IDTRANSACCION, FECHA, CC.ID_NROCOMPROBANTE, (SELECT C.NRO' +
        'SUCURSAL||'#39' - '#39'||C.NROCOMPROBANTE FROM COMPROBANTES C WHERE C.ID' +
        '_NROCOMPROBANTE = CC.ID_NROCOMPROBANTE AND C.IDCLIENTE = CC.IDCL' +
        'IENTE) AS COMPROBANTE, IMPORTE_COMPROBANTE, (SELECT R.NUMERO FRO' +
        'M RECIBOS R WHERE R.IDRECIBO = CC.IDRECIBO AND R.IDCLIENTE = CC.' +
        'IDCLIENTE) AS RECIBO, IMPORTE_RECIBO, SALDO'
      'FROM CUENTASCORRIENTES_CLIENTES CC'
      'WHERE CC.IDCLIENTE = :IDCLIENTE'
      'ORDER BY CC.IDTRANSACCION')
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibqComprobantesIDTRANSACCION: TIntegerField
      FieldName = 'IDTRANSACCION'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IDTRANSACCION'
      Required = True
    end
    object ibqComprobantesFECHA: TDateTimeField
      DisplayWidth = 24
      FieldName = 'FECHA'
      Origin = 'CUENTASCORRIENTES_CLIENTES.FECHA'
      Required = True
    end
    object ibqComprobantesID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'CUENTASCORRIENTES_CLIENTES.ID_NROCOMPROBANTE'
    end
    object ibqComprobantesCOMPROBANTE: TIBStringField
      FieldName = 'COMPROBANTE'
      Size = 25
    end
    object ibqComprobantesIMPORTE_COMPROBANTE: TIBBCDField
      DisplayLabel = 'IMPORTE'
      FieldName = 'IMPORTE_COMPROBANTE'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IMPORTE_COMPROBANTE'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqComprobantesRECIBO: TIntegerField
      FieldName = 'RECIBO'
    end
    object ibqComprobantesIMPORTE_RECIBO: TIBBCDField
      DisplayLabel = 'IMPORTE'
      FieldName = 'IMPORTE_RECIBO'
      Origin = 'CUENTASCORRIENTES_CLIENTES.IMPORTE_RECIBO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqComprobantesSALDO: TIBBCDField
      FieldName = 'SALDO'
      Origin = 'CUENTASCORRIENTES_CLIENTES.SALDO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
  end
  object ibqDetalles: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtasCtesClientes
    OnCalcFields = ibqDetallesCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsComprobantes
    SQL.Strings = (
      
        'SELECT C.NROCOMPROBANTE, A.CODIGO_INTERNO,  A.DESCRIPCION, I.CAN' +
        'TIDAD, I.PRECIO, I.DESCUENTO'
      'FROM ITEMS I'
      'INNER JOIN ARTICULOS A ON A.IDARTICULO = I.IDARTICULO'
      
        'INNER JOIN COMPROBANTES C ON C.ID_NROCOMPROBANTE = I.ID_NROCOMPR' +
        'OBANTE'
      'AND I.ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE')
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibqDetallesNROCOMPROBANTE: TIntegerField
      FieldName = 'NROCOMPROBANTE'
      Origin = 'COMPROBANTES.NROCOMPROBANTE'
      Required = True
    end
    object ibqDetallesCODIGO_INTERNO: TIBStringField
      FieldName = 'CODIGO_INTERNO'
      Origin = 'ARTICULOS.CODIGO_INTERNO'
      Required = True
    end
    object ibqDetallesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ARTICULOS.DESCRIPCION'
      Required = True
      Size = 200
    end
    object ibqDetallesCANTIDAD: TIBBCDField
      FieldName = 'CANTIDAD'
      Origin = 'ITEMS.CANTIDAD'
      Required = True
      Precision = 9
      Size = 4
    end
    object ibqDetallesPRECIO: TIBBCDField
      FieldName = 'PRECIO'
      Origin = 'ARTICULOS.PRECIO_PUBLICO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqDetallesDESCUENTO: TIBBCDField
      FieldName = 'DESCUENTO'
      Origin = 'ITEMS.DESCUENTO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqDetallesSUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBTOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = ibqClientes
    Left = 40
    Top = 112
  end
  object dsComprobantes: TDataSource
    AutoEdit = False
    DataSet = ibqComprobantes
    Left = 40
    Top = 208
  end
  object ibqAcumuladosXmes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtCtasCtesClientes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      
        'SELECT EXTRACT(YEAR FROM p.PSFECHA)||'#39'/'#39'||LPAD(CAST(EXTRACT(MONT' +
        'H FROM p.PSFECHA) AS VARCHAR(2)),2,'#39'0'#39') AS FECHA,'
      '    SUM(p.PSTOTAL) AS TOTAL'
      'FROM SP_VENTAS_DIARIAS_CLIENTE (:IDCLIENTE) p'
      'GROUP BY 1'
      'ORDER BY 1 DESC')
    Left = 144
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
        Size = 4
      end>
    object ibqAcumuladosXmesFECHA: TIBStringField
      FieldName = 'FECHA'
      Size = 32765
    end
    object ibqAcumuladosXmesTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '$#,##0.00'
      Precision = 18
      Size = 4
    end
  end
end
