object dmComprobantesAdmin: TdmComprobantesAdmin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 491
  Top = 165
  Height = 344
  Width = 440
  object ibtComprobantes: TIBTransaction
    Active = True
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 48
    Top = 8
  end
  object ibqComprobantes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.ID_NROCOMPROBANTE, TC.DESCRIPCION AS TIPO, C.NROSUCURSA' +
        'L, C.NROCOMPROBANTE,'
      
        '  C.FECHA, C.IDCLIENTE, CL.NOMBRE AS CLIENTE, FP.DESCRIPCION AS ' +
        'FORMA_PAGO, C.ANULADO'
      'FROM COMPROBANTES C'
      'INNER JOIN FORMAS_PAGOS FP ON FP.IDFORMAPAGO = C.IDFORMAPAGO'
      
        'INNER JOIN TIPOS_COMPROBANTES TC ON TC.IDTIPOCOMPROBANTE = C.IDT' +
        'IPOCOMPROBANTE'
      'INNER JOIN CLIENTES CL ON CL.IDCLIENTE = C.IDCLIENTE'
      'ORDER BY 5 DESC')
    Left = 48
    Top = 104
    object ibqComprobantesID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'COMPROBANTES.ID_NROCOMPROBANTE'
      Required = True
    end
    object ibqComprobantesTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'TIPOS_COMPROBANTES.DESCRIPCION'
      Required = True
      Size = 30
    end
    object ibqComprobantesNROSUCURSAL: TIntegerField
      DisplayLabel = 'PUNTO'
      FieldName = 'NROSUCURSAL'
      Origin = 'COMPROBANTES.NROSUCURSAL'
      Required = True
    end
    object ibqComprobantesNROCOMPROBANTE: TIntegerField
      DisplayLabel = 'NUMERO'
      FieldName = 'NROCOMPROBANTE'
      Origin = 'COMPROBANTES.NROCOMPROBANTE'
      Required = True
    end
    object ibqComprobantesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'COMPROBANTES.FECHA'
      Required = True
    end
    object ibqComprobantesIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'COMPROBANTES.IDCLIENTE'
      Required = True
    end
    object ibqComprobantesCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTES.NOMBRE'
      Required = True
      Size = 50
    end
    object ibqComprobantesFORMA_PAGO: TIBStringField
      DisplayLabel = 'PAGO'
      FieldName = 'FORMA_PAGO'
      Origin = 'FORMAS_PAGOS.DESCRIPCION'
      Size = 30
    end
    object ibqComprobantesANULADO: TIntegerField
      FieldName = 'ANULADO'
      Origin = 'COMPROBANTES.ANULADO'
      Required = True
    end
  end
  object ibqItems: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    OnCalcFields = ibqItemsCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsComprobantes
    SQL.Strings = (
      
        'SELECT I.IDITEM, I.ID_NROCOMPROBANTE, I.IDARTICULO, A.CODIGO_INT' +
        'ERNO, A.DESCRIPCION, I.CANTIDAD, I.PRECIO, I.IVA, I.DESCUENTO'
      'FROM ITEMS I '
      'INNER JOIN ARTICULOS A ON A.IDARTICULO = I.IDARTICULO'
      'WHERE I.ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE'
      '')
    Left = 48
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibqItemsIDITEM: TIntegerField
      FieldName = 'IDITEM'
      Origin = 'ITEMS.IDITEM'
      Required = True
    end
    object ibqItemsID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'ITEMS.ID_NROCOMPROBANTE'
      Required = True
    end
    object ibqItemsIDARTICULO: TIntegerField
      FieldName = 'IDARTICULO'
      Origin = 'ITEMS.IDARTICULO'
      Required = True
    end
    object ibqItemsCODIGO_INTERNO: TIBStringField
      FieldName = 'CODIGO_INTERNO'
      Origin = 'ARTICULOS.CODIGO_INTERNO'
      Required = True
    end
    object ibqItemsDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ARTICULOS.DESCRIPCION'
      Required = True
      Size = 200
    end
    object ibqItemsCANTIDAD: TIBBCDField
      FieldName = 'CANTIDAD'
      Origin = 'ITEMS.CANTIDAD'
      Required = True
      Precision = 9
      Size = 4
    end
    object ibqItemsPRECIO: TIBBCDField
      FieldName = 'PRECIO'
      Origin = 'ITEMS.PRECIO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqItemsIVA: TIBBCDField
      FieldName = 'IVA'
      Origin = 'ITEMS.IVA'
      Required = True
      Precision = 18
      Size = 4
    end
    object ibqItemsDESCUENTO: TIBBCDField
      FieldName = 'DESCUENTO'
      Origin = 'ITEMS.DESCUENTO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqItemsSUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBTOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
  end
  object dsComprobantes: TDataSource
    AutoEdit = False
    DataSet = ibqComprobantes
    OnDataChange = dsComprobantesDataChange
    Left = 48
    Top = 152
  end
  object ibqClientes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsComprobantes
    SQL.Strings = (
      
        'SELECT C.IDCLIENTE, C.NOMBRE, C.CUIT, S.NOMBRE_CORTO, C.DIRECCIO' +
        'N||'#39' - '#39'||L.NOMBRE||'#39' - '#39'||P.NOMBRE AS DIRECCION'
      'FROM CLIENTES C'
      'INNER JOIN LOCALIDADES L ON L.IDLOCALIDAD = C.IDLOCALIDAD'
      'INNER JOIN PROVINCIAS P ON P.IDPROVINCIA = L.IDPROVINCIA'
      'INNER JOIN SITUACIONES S ON S.IDSITUACION = C.IDSITUACION'
      'WHERE C.IDCLIENTE = :IDCLIENTE'
      'ORDER BY C.NOMBRE')
    Left = 127
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLIENTE'
        ParamType = ptInput
      end>
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
    object ibqClientesCUIT: TIBStringField
      FieldName = 'CUIT'
      Origin = 'CLIENTES.CUIT'
      Required = True
      Size = 11
    end
    object ibqClientesNOMBRE_CORTO: TIBStringField
      FieldName = 'NOMBRE_CORTO'
      Origin = 'SITUACIONES.NOMBRE_CORTO'
      Required = True
      Size = 5
    end
    object ibqClientesDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Required = True
      Size = 156
    end
  end
  object ibspAnularComprobante: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    StoredProcName = 'SP_ANULAR_COMPROBANTE'
    Left = 168
    Top = 8
  end
  object ibqDetalle: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsComprobantes
    SQL.Strings = (
      'SELECT SUM(I.CANTIDAD*I.PRECIO) AS SUBTOTAL,'
      'SUM(I.DESCUENTO) AS DESCUENTO,'
      '(SUM(I.CANTIDAD*I.PRECIO))-(SUM(I.DESCUENTO)) AS TOTAL,'
      
        '(SUM(I.CANTIDAD*I.PRECIO)-SUM(I.DESCUENTO))*(SELECT C.COEFICIENT' +
        'E'
      
        '                                                                ' +
        '                       FROM COMPROBANTES C'
      
        '                                                                ' +
        '                        WHERE C.ID_NROCOMPROBANTE = :ID_NROCOMPR' +
        'OBANTE) AS TOTAL_FINANCIADO'
      'FROM ITEMS I'
      
        'INNER JOIN COMPROBANTES C ON C.ID_NROCOMPROBANTE = I.ID_NROCOMPR' +
        'OBANTE'
      'WHERE I.ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE'
      '')
    Left = 192
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptInput
      end>
    object ibqDetalleSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibqDetalleDESCUENTO: TIBBCDField
      FieldName = 'DESCUENTO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqDetalleTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibqDetalleTOTAL_FINANCIADO: TFloatField
      FieldName = 'TOTAL_FINANCIADO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
end
