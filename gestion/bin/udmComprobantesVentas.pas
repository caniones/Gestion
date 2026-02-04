unit udmComprobantesVentas;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, Provider, IBQuery,
  DBClient, IBSQL, IBStoredProc, Forms, Windows;

type
  TdmComprobantesVentas = class(TDataModule)
    dspComprobantes: TDataSetProvider;
    ibtComprobantes: TIBTransaction;
    ibdsComprobantes: TIBDataSet;
    ibdsItems: TIBDataSet;
    dsComprobantes: TDataSource;
    ibqTiposComprobantes: TIBQuery;
    ibqClientes: TIBQuery;
    ibqFormasPagos: TIBQuery;
    ibqTiposComprobantesIDTIPOCOMPROBANTE: TIntegerField;
    ibqTiposComprobantesDESCRIPCION: TIBStringField;
    ibqTiposComprobantesLETRA: TIBStringField;
    ibdsComprobantesID_NROCOMPROBANTE: TIntegerField;
    ibdsComprobantesIDTIPOCOMPROBANTE: TIntegerField;
    ibdsComprobantesNROSUCURSAL: TIntegerField;
    ibdsComprobantesNROCOMPROBANTE: TIntegerField;
    ibdsComprobantesFECHA: TDateTimeField;
    ibdsComprobantesIDCLIENTE: TIntegerField;
    ibdsComprobantesIDFORMAPAGO: TIntegerField;
    ibdsComprobantesTOTAL_NETO: TIBBCDField;
    ibdsComprobantesTOTAL_IVA: TIBBCDField;
    ibdsComprobantesTOTAL_DESCUENTO: TIBBCDField;
    ibdsComprobantesTOTAL_GENERAL: TIBBCDField;
    ibdsItemsIDITEM: TIntegerField;
    ibdsItemsID_NROCOMPROBANTE: TIntegerField;
    ibdsItemsIDARTICULO: TIntegerField;
    ibdsItemsPRECIO: TIBBCDField;
    ibdsItemsDESCUENTO: TIBBCDField;
    ibqDetalleGral: TIBQuery;
    ibqArticulos: TIBQuery;
    ibdsItemsSUBTOTAL: TFloatField;
    ibdsItemsIVA: TIBBCDField;
    ibqFormasPagosIDFORMAPAGO: TIntegerField;
    ibqFormasPagosDESCRIPCION: TIBStringField;
    ibqClientesIDCLIENTE: TIntegerField;
    ibqClientesNOMBRE: TIBStringField;
    ibqClientesCUIT: TIBStringField;
    ibqClientesNOMBRE_CORTO: TIBStringField;
    ibqClientesDIRECCION: TIBStringField;
    ibqClientesCODIGO_POSTAL: TIBStringField;
    ibqClientesLOCALIDAD: TIBStringField;
    dsItems: TDataSource;
    ibqControlStock: TIBQuery;
    ibspControlCtaCte: TIBStoredProc;
    ibspControlCtaCtePSSALDO: TIBBCDField;
    ibspControlCtaCtePSMENSAJE: TIBStringField;
    ibqFormasPagosCOEFICIENTE: TIBBCDField;
    ibdsComprobantesCOEFICIENTE: TIBBCDField;
    ibqClientesINTERES: TIBBCDField;
    ibqArticulosIDARTICULO: TIntegerField;
    ibqArticulosCODIGO_INTERNO: TIBStringField;
    ibqArticulosPRECIO: TIBBCDField;
    ibqArticulosIVA: TIBBCDField;
    ibspDevolverStock: TIBStoredProc;
    ibdsComprobantesOBSERVACIONES: TIBStringField;
    ibqBusquedaArt: TIBQuery;
    ibqBusquedaArtIDARTICULO: TIntegerField;
    ibqBusquedaArtPRECIO_PUBLICO: TIBBCDField;
    ibqBusquedaArtIVA: TIBBCDField;
    ibqArticulosDESCRIPCION: TIBStringField;
    ibdsItemsDESCRIPCION: TIBStringField;
    ibdsItemsCANTIDAD: TIBBCDField;
    ibqDetalleGralSUBTOTAL: TFloatField;
    ibqDetalleGralDESCUENTO: TIBBCDField;
    ibqDetalleGralTOTAL: TFloatField;
    ibqDetalleGralTOTAL_FINANCIADO: TFloatField;
    ibqDetalleGralUNIDADES: TIBBCDField;
    dsClientes: TDataSource;
    ibqSaldo: TIBQuery;
    ibqClientesLIMITE_CREDITO: TIBBCDField;
    ibqSaldoSALDO: TIBBCDField;
    ibqArticulosSTOCK: TIBBCDField;
    ibqArticulosPUNTO_REPOSICION: TIBBCDField;
    ibqArticulosCONTROL_STOCK: TIntegerField;
    ibqBusquedaArtDESCRIPCION: TIBStringField;
    ibdsItemsCODIGO_INTERNO: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ibdsItemsCalcFields(DataSet: TDataSet);
    procedure ibdsItemsNewRecord(DataSet: TDataSet);
    procedure ibdsItemsIDARTICULOChange(Sender: TField);
    procedure dspComprobantesGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure ibdsComprobantesIDFORMAPAGOChange(Sender: TField);
  private
    { Private declarations }
    procedure verificarTipoFactura();
    procedure verificarModificacionPrecio();
    procedure refrescarDetalle();
    procedure grabarTotalesGral();
    procedure actualizarStock();
    procedure asignarNumeroComprobante();
    procedure comprobarStock();
  public
    { Public declarations }
    function buscarCodigoInterno(elCodigo :string) :integer;
    procedure grabar();
    procedure grabarPresupuesto();
    procedure grabarRenglon();
    procedure nuevoRemito();
    procedure nuevaFactura();
    procedure nuevaNotaCredito();
    procedure nuevoPresupuesto();
    function comprobarLimiteCredito():boolean;
  end;

var
  dmComprobantesVentas: TdmComprobantesVentas;

implementation

uses dmConex, uPublicos;

{$R *.dfm}

{ TdmComprobantesVentas }

procedure TdmComprobantesVentas.DataModuleCreate(Sender: TObject);
begin
  self.verificarModificacionPrecio;
  ibdsComprobantes.Open;
  ibdsItems.Open;
  ibqClientes.Close;
  ibqClientes.Open;
  ibqClientes.Last;
  ibqClientes.First;
  ibqFormasPagos.Close;
  ibqFormasPagos.Open;
  ibqFormasPagos.Last;
  ibqFormasPagos.First;
  ibqArticulos.Close;
  ibqArticulos.Open;
  ibqArticulos.Last;
  ibqArticulos.First;
end;

procedure TdmComprobantesVentas.verificarTipoFactura;
var
  sEmpresa:string;
begin
  // esto tendría que estar en un ini 
  sEmpresa:='RNI';
  if sEmpresa = 'RI' THEN
    if ibqClientes.FieldByName('NOMBRE_CORTO').AsString = 'RI' then
      // aca va factura A
      begin
      end
    else
      // aca va factura B
      begin
      end
  else
    // aca va factura C
    begin
    // asigno el 100 de Remito R
    ibdsComprobantesIDTIPOCOMPROBANTE.AsInteger:=100;
    end;
  // cierro y abro para que detecte el Master Detail
  ibqTiposcomprobantes.Close;
  ibqTiposcomprobantes.Open;
end;

procedure TdmComprobantesVentas.nuevoRemito;
begin
  ibdsComprobantes.Insert;
  // datos iniciales para un nuevo remito
  ibdsComprobantesNROSUCURSAL.AsInteger:=
    StrToInt(uPublicos.LeerIni(ChangeFileExt(Application.ExeName,'.INI'),
    'VENTAS','PUNTODEVENTA','1'));
  ibdsComprobantesNROCOMPROBANTE.AsInteger:=-1;
  // remito 100
  ibdsComprobantesIDTIPOCOMPROBANTE.AsInteger:=100;
  ibdsComprobantesFECHA.AsDateTime:=date;
  ibdsComprobantesIDCLIENTE.AsInteger:=0; // id cliente VARIOS
  ibdsComprobantesIDFORMAPAGO.AsInteger:=100; // CONTADO
  ibdsComprobantesTOTAL_NETO.AsFloat:=0;
  ibdsComprobantesTOTAL_IVA.AsFloat:=0;
  ibdsComprobantesTOTAL_DESCUENTO.AsFloat:=0;
  ibdsComprobantesTOTAL_GENERAL.AsFloat:=0;
  ibdsComprobantesCOEFICIENTE.AsFloat:=1;
  ibdsComprobantes.CheckBrowseMode;
  ibdsComprobantes.Edit;
  ibqTiposcomprobantes.Close;
  ibqTiposcomprobantes.Open;
end;

procedure TdmComprobantesVentas.nuevaFactura;
begin
  ibdsComprobantes.Insert;
  // datos iniciales para una nueva factura
  ibdsComprobantesNROSUCURSAL.AsInteger:=
    StrToInt(uPublicos.LeerIni(ChangeFileExt(Application.ExeName,'.INI'),
    'VENTAS','PUNTODEVENTA','1'));
  ibdsComprobantesNROCOMPROBANTE.AsInteger:=-1;
  // tipo de factura
  self.verificarTipoFactura;
  ibdsComprobantesFECHA.AsDateTime:=date;
  ibdsComprobantesIDCLIENTE.AsInteger:=0; // id cliente VARIOS
  ibdsComprobantesIDFORMAPAGO.AsInteger:=100; // CONTADO
  ibdsComprobantesTOTAL_NETO.AsFloat:=0;
  ibdsComprobantesTOTAL_IVA.AsFloat:=0;
  ibdsComprobantesTOTAL_DESCUENTO.AsFloat:=0;
  ibdsComprobantesTOTAL_GENERAL.AsFloat:=0;
  // por defecto en 1 la forma de pago modifica el coeficiente al correcto
  ibdsComprobantesCOEFICIENTE.AsFloat:=1;
  ibdsComprobantes.CheckBrowseMode;
  ibdsComprobantes.Edit;
end;

procedure TdmComprobantesVentas.nuevaNotaCredito;
begin
  ibdsComprobantes.Insert;
  // datos iniciales para una nueva nota de credito
  ibdsComprobantesNROSUCURSAL.AsInteger:=
    StrToInt(uPublicos.LeerIni(ChangeFileExt(Application.ExeName,'.INI'),
    'VENTAS','PUNTODEVENTA','1'));
  ibdsComprobantesNROCOMPROBANTE.AsInteger:=-1;
  // nota de credito 600
  ibdsComprobantesIDTIPOCOMPROBANTE.AsInteger:=600;
  ibdsComprobantesFECHA.AsDateTime:=date;
  ibdsComprobantesIDCLIENTE.AsInteger:=0; // id cliente VARIOS
  ibdsComprobantesIDFORMAPAGO.AsInteger:=100; // CONTADO
  ibdsComprobantesTOTAL_NETO.AsFloat:=0;
  ibdsComprobantesTOTAL_IVA.AsFloat:=0;
  ibdsComprobantesTOTAL_DESCUENTO.AsFloat:=0;
  ibdsComprobantesTOTAL_GENERAL.AsFloat:=0;
  ibdsComprobantesCOEFICIENTE.AsFloat:=1;
  ibdsComprobantes.CheckBrowseMode;
  ibdsComprobantes.Edit;
  ibqTiposcomprobantes.Close;
  ibqTiposcomprobantes.Open;
end;

procedure TdmComprobantesVentas.nuevoPresupuesto;
begin
  ibdsComprobantes.Insert;
  // datos iniciales para un nuevo presupuesto
  ibdsComprobantesNROSUCURSAL.AsInteger:=
    StrToInt(uPublicos.LeerIni(ChangeFileExt(Application.ExeName,'.INI'),
    'VENTAS','PUNTODEVENTA','1'));
  ibdsComprobantesNROCOMPROBANTE.AsInteger:=-1;
  // presupuesto 200
  ibdsComprobantesIDTIPOCOMPROBANTE.AsInteger:=200;
  ibdsComprobantesFECHA.AsDateTime:=date;
  ibdsComprobantesIDCLIENTE.AsInteger:=0; // id cliente VARIOS
  ibdsComprobantesIDFORMAPAGO.AsInteger:=100; // CONTADO
  ibdsComprobantesTOTAL_NETO.AsFloat:=0;
  ibdsComprobantesTOTAL_IVA.AsFloat:=0;
  ibdsComprobantesTOTAL_DESCUENTO.AsFloat:=0;
  ibdsComprobantesTOTAL_GENERAL.AsFloat:=0;
  ibdsComprobantesCOEFICIENTE.AsFloat:=1;
  ibdsComprobantes.CheckBrowseMode;
  ibdsComprobantes.Edit;
  ibqTiposcomprobantes.Close;
  ibqTiposcomprobantes.Open;
end;

procedure TdmComprobantesVentas.ibdsItemsCalcFields(DataSet: TDataSet);
begin
  ibdsItemsSUBTOTAL.AsFloat:=ibdsItemsPRECIO.AsFloat*ibdsItemsCANTIDAD.AsFloat;
  // calculo el descuento
  ibdsItemsSUBTOTAL.AsFloat:=ibdsItemsSUBTOTAL.AsFloat-ibdsItemsDESCUENTO.AsFloat;
  self.refrescarDetalle;
end;

procedure TdmComprobantesVentas.ibdsItemsNewRecord(DataSet: TDataSet);
begin
  ibdsItemsID_NROCOMPROBANTE.AsInteger:=
  ibdsComprobantesID_NROCOMPROBANTE.AsInteger;
  ibdsItemsCANTIDAD.AsFloat:=1;
  ibdsItemsPRECIO.AsFloat:=0;
  ibdsItemsDESCUENTO.AsFloat:=0;
  ibdsItemsSUBTOTAL.AsFloat:=0;
end;

procedure TdmComprobantesVentas.ibdsItemsIDARTICULOChange(Sender: TField);
begin
  ibdsItemsDESCRIPCION.AsString:=ibqArticulos.Fields[2].AsString;
  ibdsItemsPRECIO.AsFloat:=ibqArticulos.Fields[3].AsFloat;
  ibdsItemsIVA.AsFloat:=ibqArticulos.Fields[4].AsFloat;
  self.refrescarDetalle;
end;

procedure TdmComprobantesVentas.grabar;
var
  idCliente:integer;
  formaPago:integer;
begin
  ibdsComprobantes.CheckBrowseMode;
  ibdsItems.CheckBrowseMode;
  idCliente:=ibdsComprobantesIDCLIENTE.AsInteger;
  formapago:=ibdsComprobantesIDFORMAPAGO.AsInteger;
  // cargo los datos en el SP por si hace falta ejecutarlo
  ibspControlCtaCte.Close;
  ibspControlCtaCte.ParamByName('PEID_NROCOMPROBANTE').AsInteger:=
    ibdsComprobantesID_NROCOMPROBANTE.AsInteger;
  ibspControlCtacte.ParamByName('PEIDRECIBO').AsInteger:=0;
  ibspControlCtaCte.ParamByName('PEIDCLIENTE').AsInteger:=idCliente;
  ibspControlCtaCte.Prepare;
  try
    ibtComprobantes.CommitRetaining;
    self.grabarTotalesGral;
    if not ibdsItems.IsEmpty then
      if ibdsComprobantesIDTIPOCOMPROBANTE.AsInteger = 600 then
      // si es nota de credito, devuelvo el stock
        begin
        ibspDevolverStock.Close;
        ibspDevolverStock.ParamByName('PEID_NROCOMPROBANTE').AsInteger:=
          ibdsComprobantesID_NROCOMPROBANTE.AsInteger;
          ibspDevolverStock.ExecProc;
        end
      else
      // si no es nota de credito, actualizo el stock
        self.actualizarStock;
    // Asigno el numero de comprobante
    self.asignarNumeroComprobante;
    if (formaPago = 500) and (idCliente > 0) then
    // si es pago Cta. Cte. y no es cliente Varios ejecuto un SP para
    // control de las cuentas
      begin
      ibspControlCtaCte.ExecProc;
      end;
    ibdsComprobantes.ApplyUpdates;
    ibdsItems.ApplyUpdates;
    ibtComprobantes.Commit;
  except
    ibtComprobantes.Rollback;
  end;
end;

procedure TdmComprobantesVentas.grabarPresupuesto;
begin
  ibdsComprobantes.CheckBrowseMode;
  ibdsItems.CheckBrowseMode;
  try
    ibtComprobantes.CommitRetaining;
    self.grabarTotalesGral;
    self.asignarNumeroComprobante;
    ibdsComprobantes.ApplyUpdates;
    ibdsItems.ApplyUpdates;
    ibtComprobantes.Commit;
  except
    ibtComprobantes.Rollback;
  end;
end;

procedure TdmComprobantesVentas.refrescarDetalle;
begin
  ibqDetalleGral.Close;
  ibqDetalleGral.Open;
end;

procedure TdmComprobantesVentas.grabarTotalesGral;
begin
  ibdsComprobantes.Edit;
  ibdsComprobantesTOTAL_NETO.AsFloat:=ibqDetalleGral.Fields[0].AsFloat;
  ibdsComprobantesTOTAL_DESCUENTO.AsFloat:=ibqDetalleGral.Fields[1].AsFloat;
  ibdsComprobantesTOTAL_GENERAL.AsFloat:=ibqDetalleGral.Fields[2].AsFloat;
  ibdsComprobantes.Post;
end;

procedure TdmComprobantesVentas.actualizarStock;
begin
  // actualizo el valor de stock en la tabla de articulos segun lo vendido
  ibqControlStock.Close;
  ibdsItems.First;
  while not ibdsItems.Eof do
    begin
    ibqControlStock.ExecSQL;
    ibqControlStock.Close;
    ibdsItems.Next;
    end;
end;

procedure TdmComprobantesVentas.dspComprobantesGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  if DataSet = ibdsComprobantes then
    TableName:='COMPROBANTES'
  else
    TableName:='ITEMS';
end;

procedure TdmComprobantesVentas.asignarNumeroComprobante;
begin
  ibdsComprobantes.Edit;
  // asigno el numero correspondiente al tipo de comprobante
  ibdsComprobantesNROCOMPROBANTE.AsInteger:=
    dmConexion.getSecuencia(ibqTiposComprobantes.Fields[1].asstring);
  ibdsComprobantes.Post;
end;

procedure TdmComprobantesVentas.ibdsComprobantesIDFORMAPAGOChange(
  Sender: TField);
var
  formapago:integer;
  idCliente:integer;
begin
  if ibdsComprobantes.State = dsEdit then
    begin
    formapago:=ibdsComprobantesIDFORMAPAGO.AsInteger;
    idCliente:=ibdsComprobantesIDCLIENTE.AsInteger;
    if (formaPago = 500) and (idCliente > 0) then // 500 es pago Cta. Cte.
                                                 // 0 cliente Varios, no puede ser
      begin  // busco que coeficiente tiene el cliente
      ibdsComprobantesCOEFICIENTE.AsFloat:=ibqClientes.Fields[7].AsFloat;
      end
    else // grabo el coeficiente segun la forma de pago
      ibdsComprobantesCOEFICIENTE.AsFloat:=ibqFormasPagos.Fields[2].AsFloat;
    ibdsComprobantes.CheckBrowseMode;
    ibdsComprobantes.Edit;
    self.refrescarDetalle;
    end;
end;

procedure TdmComprobantesVentas.verificarModificacionPrecio;
var
  estado: string;
begin
  // verifico en el ini si se puede modificar el precio en la grilla del
  // comprobante de venta
  estado:=uPublicos.LeerIni(ChangeFileExt(Application.ExeName,'.INI'),
    'VENTAS','LECTURA','');
  ibdsItemsPRECIO.ReadOnly:=StrToBool(estado);
end;

function TdmComprobantesVentas.buscarCodigoInterno(
  elCodigo: string): integer;
begin
  // función para buscar artículos por código interno. Devuelve un int con la
  // cantidad de resultados que arroja la consulta
  ibqBusquedaArt.Close;
  ibqBusquedaArt.ParamByName('CODIGO_INTERNO').AsString:=elCodigo;
  ibqBusquedaArt.Open;
  result:= ibqBusquedaArt.RecordCount;
  // asigno el artículo
  dsItems.DataSet.FieldByName('IDARTICULO').AsInteger:=
    ibqBusquedaArt.FieldByName('IDARTICULO').AsInteger;
  dsItems.DataSet.FieldByName('PRECIO').AsFloat:=
    ibqBusquedaArt.FieldByName('PRECIO_PUBLICO').AsFloat;
  dsItems.DataSet.FieldByName('IVA').AsFloat:=
    ibqBusquedaArt.FieldByName('IVA').AsFloat;
end;

procedure TdmComprobantesVentas.grabarRenglon;
begin
  // procedimiento para grabar el articulo seleccionado en los componentes
  // externos a la grilla
  if ibdsItemsCANTIDAD.AsFloat <= 0 then
    ibdsItemsCANTIDAD.AsFloat:=1;
  ibdsItems.CheckBrowseMode;
  ibdsItems.ApplyUpdates;
  self.comprobarStock;
  // lo cierro y abro porque tengo problemas con el componente cxdblcbDescripcion
  ibdsItems.Close;
  ibdsItems.Open;
  ibdsItems.First;
  ibdsItems.Insert;
end;

function TdmComprobantesVentas.comprobarLimiteCredito: boolean;
begin
  // comprueba si el cliente no supera su límite de crédito
  // devuelve true si el cliente puede realizar la operacíon
  ibqSaldo.Close;
  ibqSaldo.Open;
  if (ibqSaldoSALDO.AsFloat + ibqDetalleGralTOTAL_FINANCIADO.AsFloat) <=
    ibqClientes.FieldByName('LIMITE_CREDITO').AsFloat then
    result:=true
  else
    result:=false;
  ibqSaldo.Close;
end;

procedure TdmComprobantesVentas.comprobarStock;
begin
  // comprueba el stock del artículo
  if ibqArticulosCONTROL_STOCK.AsInteger = 1 then
    begin
    if ibqArticulosSTOCK.AsFloat <= 0 then
      // no quedan en stock
      application.MessageBox('El artículo no cuenta con stock disponible',
        'Atención',MB_ICONWARNING)
    else
      if (ibqArticulosSTOCK.AsFloat-ibdsItemsCANTIDAD.AsFloat)
        <= ibqArticulosPUNTO_REPOSICION.AsFloat then
        // alcanzó el punto de reposición
        application.MessageBox('El artículo alcanzó su punto de reposición',
          'Atención',MB_ICONINFORMATION);
    end;
end;

end.
