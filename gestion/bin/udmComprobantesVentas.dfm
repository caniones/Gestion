object dmComprobantesVentas: TdmComprobantesVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 371
  Top = 181
  Height = 423
  Width = 651
  object dspComprobantes: TDataSetProvider
    DataSet = ibdsComprobantes
    Exported = False
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereChanged
    OnGetTableName = dspComprobantesGetTableName
    Left = 48
    Top = 64
  end
  object ibtComprobantes: TIBTransaction
    Active = False
    DefaultDatabase = dmConexion.IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 48
    Top = 16
  end
  object ibdsComprobantes: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM COMPROBANTES'
      'WHERE NROCOMPROBANTE = -1')
    InsertSQL.Strings = (
      
        'INSERT INTO COMPROBANTES (ID_NROCOMPROBANTE, IDTIPOCOMPROBANTE, ' +
        'NROSUCURSAL, NROCOMPROBANTE, FECHA, IDCLIENTE, IDFORMAPAGO, TOTA' +
        'L_NETO, TOTAL_IVA, TOTAL_DESCUENTO, TOTAL_GENERAL, COEFICIENTE, ' +
        'OBSERVACIONES, ANULADO)'
      ' VALUES ('
      ':ID_NROCOMPROBANTE, '
      ':IDTIPOCOMPROBANTE, '
      ':NROSUCURSAL, '
      ':NROCOMPROBANTE, '
      #39'NOW'#39', '
      ':IDCLIENTE, '
      ':IDFORMAPAGO, '
      ':TOTAL_NETO, '
      ':TOTAL_IVA, '
      ':TOTAL_DESCUENTO, '
      ':TOTAL_GENERAL,'
      ':COEFICIENTE,'
      ':OBSERVACIONES,'
      '0'
      ')')
    SelectSQL.Strings = (
      
        'SELECT C.ID_NROCOMPROBANTE, C.IDTIPOCOMPROBANTE, C.NROSUCURSAL, ' +
        'C.NROCOMPROBANTE, C.FECHA, C.IDCLIENTE, C.IDFORMAPAGO, C.TOTAL_N' +
        'ETO, C.TOTAL_IVA, C.TOTAL_DESCUENTO, C.TOTAL_GENERAL, C.COEFICIE' +
        'NTE, C.OBSERVACIONES'
      'FROM COMPROBANTES C'
      'WHERE C.NROCOMPROBANTE = -1')
    ModifySQL.Strings = (
      'UPDATE COMPROBANTES'
      'SET'
      ' IDTIPOCOMPROBANTE = :IDTIPOCOMPROBANTE,'
      ' NROCOMPROBANTE = :NROCOMPROBANTE,'
      ' IDCLIENTE = :IDCLIENTE, '
      ' IDFORMAPAGO = :IDFORMAPAGO, '
      ' TOTAL_NETO = :TOTAL_NETO, '
      ' TOTAL_IVA = :TOTAL_IVA, '
      ' TOTAL_DESCUENTO = :TOTAL_DESCUENTO, '
      ' TOTAL_GENERAL = :TOTAL_GENERAL,'
      ' COEFICIENTE = :COEFICIENTE,'
      ' OBSERVACIONES = :OBSERVACIONES'
      'WHERE ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE')
    GeneratorField.Field = 'ID_NROCOMPROBANTE'
    GeneratorField.Generator = 'GEN_ID_NROCOMPROBANTE'
    Left = 48
    Top = 112
    object ibdsComprobantesID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'COMPROBANTES.ID_NROCOMPROBANTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdsComprobantesIDTIPOCOMPROBANTE: TIntegerField
      FieldName = 'IDTIPOCOMPROBANTE'
      Origin = 'COMPROBANTES.IDTIPOCOMPROBANTE'
      Required = True
    end
    object ibdsComprobantesNROSUCURSAL: TIntegerField
      FieldName = 'NROSUCURSAL'
      Origin = 'COMPROBANTES.NROSUCURSAL'
      Required = True
    end
    object ibdsComprobantesNROCOMPROBANTE: TIntegerField
      FieldName = 'NROCOMPROBANTE'
      Origin = 'COMPROBANTES.NROCOMPROBANTE'
      Required = True
    end
    object ibdsComprobantesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'COMPROBANTES.FECHA'
      Required = True
    end
    object ibdsComprobantesIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'COMPROBANTES.IDCLIENTE'
      Required = True
    end
    object ibdsComprobantesIDFORMAPAGO: TIntegerField
      FieldName = 'IDFORMAPAGO'
      Origin = 'COMPROBANTES.IDFORMAPAGO'
      Required = True
      OnChange = ibdsComprobantesIDFORMAPAGOChange
    end
    object ibdsComprobantesTOTAL_NETO: TIBBCDField
      FieldName = 'TOTAL_NETO'
      Origin = 'COMPROBANTES.TOTAL_NETO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesTOTAL_IVA: TIBBCDField
      FieldName = 'TOTAL_IVA'
      Origin = 'COMPROBANTES.TOTAL_IVA'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesTOTAL_DESCUENTO: TIBBCDField
      FieldName = 'TOTAL_DESCUENTO'
      Origin = 'COMPROBANTES.TOTAL_DESCUENTO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesTOTAL_GENERAL: TIBBCDField
      FieldName = 'TOTAL_GENERAL'
      Origin = 'COMPROBANTES.TOTAL_GENERAL'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesCOEFICIENTE: TIBBCDField
      FieldName = 'COEFICIENTE'
      Origin = 'COMPROBANTES.COEFICIENTE'
      Required = True
      Precision = 18
      Size = 4
    end
    object ibdsComprobantesOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'COMPROBANTES.OBSERVACIONES'
      Size = 200
    end
  end
  object ibdsItems: TIBDataSet
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    OnCalcFields = ibdsItemsCalcFields
    OnNewRecord = ibdsItemsNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ITEMS'
      'WHERE IDITEM = :IDITEM')
    InsertSQL.Strings = (
      
        'INSERT INTO ITEMS (IDITEM, ID_NROCOMPROBANTE, IDARTICULO, CANTID' +
        'AD, PRECIO, IVA, DESCUENTO)'
      ' VALUES ('
      ' :NEW_IDITEM, '
      ' :NEW_ID_NROCOMPROBANTE, '
      ' :NEW_IDARTICULO, '
      ' :NEW_CANTIDAD, '
      ' (SELECT A.PRECIO_PUBLICO'
      '  FROM ARTICULOS A'
      '  WHERE A.IDARTICULO = :IDARTICULO),'
      ' :NEW_IVA, '
      ' :NEW_DESCUENTO'
      ')')
    SelectSQL.Strings = (
      
        'SELECT I.IDITEM, I.ID_NROCOMPROBANTE, I.IDARTICULO, A.CODIGO_INT' +
        'ERNO, A.DESCRIPCION, I.CANTIDAD, I.PRECIO, I.IVA, I.DESCUENTO'
      'FROM ITEMS I'
      'INNER JOIN ARTICULOS A ON A.IDARTICULO = I.IDARTICULO'
      'WHERE I.ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE'
      '')
    ModifySQL.Strings = (
      'UPDATE ITEMS'
      'SET'
      '  IDARTICULO = :IDARTICULO,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  DESCUENTO = :DESCUENTO'
      'WHERE IDITEM = :IDITEM')
    GeneratorField.Field = 'IDITEM'
    GeneratorField.Generator = 'GEN_IDITEM'
    DataSource = dsComprobantes
    Left = 48
    Top = 208
    object ibdsItemsIDITEM: TIntegerField
      FieldName = 'IDITEM'
      Origin = 'ITEMS.IDITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdsItemsID_NROCOMPROBANTE: TIntegerField
      FieldName = 'ID_NROCOMPROBANTE'
      Origin = 'ITEMS.ID_NROCOMPROBANTE'
      Required = True
    end
    object ibdsItemsIDARTICULO: TIntegerField
      FieldName = 'IDARTICULO'
      Origin = 'ITEMS.IDARTICULO'
      Required = True
      OnChange = ibdsItemsIDARTICULOChange
    end
    object ibdsItemsCODIGO_INTERNO: TIBStringField
      FieldName = 'CODIGO_INTERNO'
      Origin = 'ARTICULOS.CODIGO_INTERNO'
    end
    object ibdsItemsDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ARTICULOS.DESCRIPCION'
      Required = True
      Size = 200
    end
    object ibdsItemsCANTIDAD: TIBBCDField
      FieldName = 'CANTIDAD'
      Origin = 'ITEMS.CANTIDAD'
      Required = True
      Precision = 9
      Size = 4
    end
    object ibdsItemsPRECIO: TIBBCDField
      FieldName = 'PRECIO'
      Origin = 'ITEMS.PRECIO'
      ReadOnly = True
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsItemsDESCUENTO: TIBBCDField
      FieldName = 'DESCUENTO'
      Origin = 'ITEMS.DESCUENTO'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibdsItemsSUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBTOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
    object ibdsItemsIVA: TIBBCDField
      FieldName = 'IVA'
      Origin = 'ITEMS.IVA'
      Required = True
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
  end
  object dsComprobantes: TDataSource
    AutoEdit = False
    DataSet = ibdsComprobantes
    Left = 48
    Top = 160
  end
  object ibqTiposComprobantes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsComprobantes
    SQL.Strings = (
      'SELECT TC.IDTIPOCOMPROBANTE, TC.DESCRIPCION, TC.LETRA'
      'FROM TIPOS_COMPROBANTES TC'
      'WHERE TC.IDTIPOCOMPROBANTE = :IDTIPOCOMPROBANTE'
      'ORDER BY 2')
    Left = 152
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCOMPROBANTE'
        ParamType = ptInput
        Size = 4
      end>
    object ibqTiposComprobantesIDTIPOCOMPROBANTE: TIntegerField
      FieldName = 'IDTIPOCOMPROBANTE'
      Origin = 'TIPOS_COMPROBANTES.IDTIPOCOMPROBANTE'
      Required = True
    end
    object ibqTiposComprobantesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPOS_COMPROBANTES.DESCRIPCION'
      Required = True
      Size = 30
    end
    object ibqTiposComprobantesLETRA: TIBStringField
      FieldName = 'LETRA'
      Origin = 'TIPOS_COMPROBANTES.LETRA'
      FixedChar = True
      Size = 1
    end
  end
  object ibqClientes: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.IDCLIENTE, C.NOMBRE, C.CUIT, S.NOMBRE_CORTO, C.DIRECCIO' +
        'N, C.CODIGO_POSTAL, L.NOMBRE||'#39' - '#39'||P.NOMBRE AS LOCALIDAD, 1+(C' +
        '.INTERES/100) AS INTERES, C.LIMITE_CREDITO'
      'FROM CLIENTES C'
      'INNER JOIN LOCALIDADES L ON L.IDLOCALIDAD = C.IDLOCALIDAD'
      'INNER JOIN PROVINCIAS P ON P.IDPROVINCIA = L.IDPROVINCIA'
      'INNER JOIN SITUACIONES S ON S.IDSITUACION = C.IDSITUACION'
      'WHERE C.FECHA_BAJA IS NULL'
      'ORDER BY C.NOMBRE')
    Left = 432
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
      Origin = 'CLIENTES.DIRECCION'
      Required = True
      Size = 50
    end
    object ibqClientesCODIGO_POSTAL: TIBStringField
      FieldName = 'CODIGO_POSTAL'
      Origin = 'CLIENTES.CODIGO_POSTAL'
      Size = 13
    end
    object ibqClientesLOCALIDAD: TIBStringField
      FieldName = 'LOCALIDAD'
      Required = True
      Size = 103
    end
    object ibqClientesINTERES: TIBBCDField
      FieldName = 'INTERES'
      Required = True
      Precision = 18
      Size = 4
    end
    object ibqClientesLIMITE_CREDITO: TIBBCDField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
      Precision = 18
      Size = 4
    end
  end
  object ibqFormasPagos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IDFORMAPAGO, DESCRIPCION, COEFICIENTE'
      'FROM FORMAS_PAGOS'
      'ORDER BY 1')
    Left = 528
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
  object ibqDetalleGral: TIBQuery
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
        'OBANTE) AS TOTAL_FINANCIADO,'
      'SUM(I.CANTIDAD) AS UNIDADES'
      'FROM ITEMS I'
      
        'INNER JOIN COMPROBANTES C ON C.ID_NROCOMPROBANTE = I.ID_NROCOMPR' +
        'OBANTE'
      'WHERE I.ID_NROCOMPROBANTE = :ID_NROCOMPROBANTE'
      '')
    Left = 248
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ID_NROCOMPROBANTE'
        ParamType = ptInput
      end>
    object ibqDetalleGralSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibqDetalleGralDESCUENTO: TIBBCDField
      FieldName = 'DESCUENTO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 4
    end
    object ibqDetalleGralTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibqDetalleGralTOTAL_FINANCIADO: TFloatField
      FieldName = 'TOTAL_FINANCIADO'
      DisplayFormat = '$#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibqDetalleGralUNIDADES: TIBBCDField
      FieldName = 'UNIDADES'
      Precision = 18
      Size = 4
    end
  end
  object ibqArticulos: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT A.IDARTICULO, A.CODIGO_INTERNO, A.DESCRIPCION,'
      
        ' A.PRECIO_PUBLICO AS PRECIO, A.IVA, A.STOCK, A.PUNTO_REPOSICION,' +
        ' A.CONTROL_STOCK'
      'FROM ARTICULOS A'
      'WHERE A.CODIGO_INTERNO <> '#39#39
      'AND A.FECHA_BAJA IS NULL'
      'ORDER BY A.DESCRIPCION')
    Left = 528
    Top = 112
    object ibqArticulosIDARTICULO: TIntegerField
      FieldName = 'IDARTICULO'
      Origin = 'ARTICULOS.IDARTICULO'
      Required = True
    end
    object ibqArticulosCODIGO_INTERNO: TIBStringField
      FieldName = 'CODIGO_INTERNO'
      Origin = 'ARTICULOS.CODIGO_INTERNO'
      Required = True
    end
    object ibqArticulosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ARTICULOS.DESCRIPCION'
      Required = True
      Size = 200
    end
    object ibqArticulosPRECIO: TIBBCDField
      FieldName = 'PRECIO'
      Origin = 'ARTICULOS.PRECIO_PUBLICO'
      Required = True
      DisplayFormat = '$,0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 4
    end
    object ibqArticulosIVA: TIBBCDField
      FieldName = 'IVA'
      Origin = 'ARTICULOS.IVA'
      Required = True
      Precision = 18
      Size = 4
    end
    object ibqArticulosSTOCK: TIBBCDField
      FieldName = 'STOCK'
      Origin = 'ARTICULOS.STOCK'
      Required = True
      Precision = 9
      Size = 4
    end
    object ibqArticulosPUNTO_REPOSICION: TIBBCDField
      FieldName = 'PUNTO_REPOSICION'
      Origin = 'ARTICULOS.PUNTO_REPOSICION'
      Required = True
      Precision = 9
      Size = 4
    end
    object ibqArticulosCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
      Origin = 'ARTICULOS.CONTROL_STOCK'
      Required = True
    end
  end
  object dsItems: TDataSource
    AutoEdit = False
    DataSet = ibdsItems
    Left = 48
    Top = 256
  end
  object ibqControlStock: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsItems
    SQL.Strings = (
      'UPDATE ARTICULOS'
      'SET'
      '  STOCK = STOCK - :CANTIDAD'
      'WHERE IDARTICULO = :IDARTICULO'
      'AND CONTROL_STOCK = 1')
    Left = 48
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CANTIDAD'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'IDARTICULO'
        ParamType = ptInput
        Size = 4
      end>
  end
  object ibspControlCtaCte: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = ibtComprobantes
    StoredProcName = 'SP_CONTROL_CUENTAS_CLIENTE'
    Left = 152
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
  object ibspDevolverStock: TIBStoredProc
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    StoredProcName = 'SP_DEVOLVER_STOCK'
    Left = 336
    Top = 208
  end
  object ibqBusquedaArt: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT r.IDARTICULO, r.DESCRIPCION, r.PRECIO_PUBLICO, r.IVA'
      'FROM ARTICULOS r'
      'WHERE LOWER(r.CODIGO_INTERNO) = LOWER(:CODIGO_INTERNO)')
    Left = 528
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO_INTERNO'
        ParamType = ptUnknown
      end>
    object ibqBusquedaArtIDARTICULO: TIntegerField
      FieldName = 'IDARTICULO'
      Origin = 'ARTICULOS.IDARTICULO'
      Required = True
    end
    object ibqBusquedaArtDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ARTICULOS.DESCRIPCION'
      Required = True
      Size = 200
    end
    object ibqBusquedaArtPRECIO_PUBLICO: TIBBCDField
      FieldName = 'PRECIO_PUBLICO'
      Origin = 'ARTICULOS.PRECIO_PUBLICO'
      Required = True
      Precision = 18
      Size = 4
    end
    object ibqBusquedaArtIVA: TIBBCDField
      FieldName = 'IVA'
      Origin = 'ARTICULOS.IVA'
      Required = True
      Precision = 18
      Size = 4
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = ibqClientes
    Left = 432
    Top = 112
  end
  object ibqSaldo: TIBQuery
    Database = dmConexion.IBDatabase
    Transaction = dmConexion.ibTransac
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsClientes
    SQL.Strings = (
      'SELECT CC.SALDO'
      'FROM CUENTASCORRIENTES_CLIENTES CC'
      'INNER JOIN CLIENTES C ON C.IDCLIENTE = CC.IDCLIENTE'
      'AND CC.IDTRANSACCION = (SELECT MAX(CC.IDTRANSACCION)'
      
        '                                                 FROM CUENTASCOR' +
        'RIENTES_CLIENTES CC'
      
        '                                                 WHERE CC.IDCLIE' +
        'NTE = :IDCLIENTE)')
    Left = 432
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
      Precision = 18
      Size = 4
    end
  end
end
