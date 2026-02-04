unit uComprobantesVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DBCtrls, DB, StdCtrls, Grids, DBGrids, Mask,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmComprobantesVentas = class(TForm)
    btnSalir: TSpeedButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    GroupBox2: TGroupBox;
    DBText4: TDBText;
    Label1: TLabel;
    dsCliente: TDataSource;
    dsComprobante: TDataSource;
    dblcCliente: TDBLookupComboBox;
    dbtDireccion: TDBText;
    dbtCp: TDBText;
    dbtLocalidad: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbtCuit: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    dsTiposComprobantes: TDataSource;
    dbgDatos: TDBGrid;
    Panel1: TPanel;
    dsItems: TDataSource;
    btnAgregar: TSpeedButton;
    Panel2: TPanel;
    dsDetalleGral: TDataSource;
    btnQuitar: TSpeedButton;
    btnModi: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnListo: TSpeedButton;
    btnAnularComprobante: TSpeedButton;
    btnBuscar: TSpeedButton;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText2: TDBText;
    dbmObservaciones: TDBMemo;
    dbeCantidad: TDBEdit;
    dbeDescuento: TDBEdit;
    eCodigoInterno: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dsArticulos: TDataSource;
    cxdblcbDescripcion: TcxDBLookupComboBox;
    dsBusquedaArt: TDataSource;
    dbeDescripcion: TDBEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAnularComprobanteClick(Sender: TObject);
    procedure btnListoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCantidadEnter(Sender: TObject);
    procedure eCodigoInternoEnter(Sender: TObject);
    procedure eCodigoInternoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDescuentoEnter(Sender: TObject);
    procedure dblcClienteEnter(Sender: TObject);
    procedure dbeDescuentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure cxdblcbDescripcionEnter(Sender: TObject);
    procedure cxdblcbDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCantidadKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure cerrarComprobante();
    procedure grabarRenglon();
  public
    { Public declarations }
    procedure nuevoRemito();
    procedure nuevaFactura();
    procedure nuevaNotaCredito();
    procedure nuevoPresupuesto();
  end;

var
  frmComprobantesVentas: TfrmComprobantesVentas;

implementation

uses   udmComprobantesVentas, uFormaPagoVenta, uBuscarArtVenta,
  uRepComprobantes;

var
  dm:TdmComprobantesVentas;

{$R *.dfm}

procedure TfrmComprobantesVentas.btnSalirClick(Sender: TObject);
begin
  if dsItems.DataSet.IsEmpty then
    begin
    // si el comprobante no tiene detalle lo elimino
    //dsComprobante.DataSet.Cancel;
    dsComprobante.DataSet.Delete;
    self.close();
    end
  else
    // si tiene algun detalle pregunto si se elimina
    If application.MessageBox('¿Desea Cancelar el Comprobante?  '+#13+#13,
      'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
      begin
      //dsComprobante.DataSet.Cancel;
      dsComprobante.DataSet.Delete;
      // cierro el formulario de ventas
      self.close();
      end;
end;

procedure TfrmComprobantesVentas.FormCreate(Sender: TObject);
begin
  dm:=TdmComprobantesVentas.Create(self);
end;

procedure TfrmComprobantesVentas.FormShow(Sender: TObject);
begin
  dblcCliente.SetFocus;
end;

procedure TfrmComprobantesVentas.btnAgregarClick(Sender: TObject);
begin
  // agregar articulo al detalle
  dsItems.DataSet.Insert;
  eCodigoInterno.Text:='';
end;

procedure TfrmComprobantesVentas.btnQuitarClick(Sender: TObject);
begin
  if dsItems.DataSet.IsEmpty then
    // si se intenta quitar un articulo del detalle cuando no hay
    application.MessageBox('No hay renglones para quitar',
    'Atención',MB_ICONERROR)
  else
    // si hay articulos en el detalle se quita
    dsItems.DataSet.Delete;
end;

procedure TfrmComprobantesVentas.btnModiClick(Sender: TObject);
begin
  dsItems.DataSet.Edit;
end;

procedure TfrmComprobantesVentas.btnCancelarClick(Sender: TObject);
begin
  dsItems.DataSet.Cancel;
end;

procedure TfrmComprobantesVentas.btnAnularComprobanteClick(
  Sender: TObject);
begin
  // confirmacion para anular el comprobante
  if application.MessageBox('¿Desea Cancelar el Comprobante? '+#13+#13,
    'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
    begin
    // elimino la cabecera del comprobante y automaticamente se borra
    // el detalle del mismo en la DB
    //dsComprobante.DataSet.Cancel;
    dsComprobante.DataSet.Delete;
    // cierro el formulario de ventas
    self.Close();
    end;
end;

procedure TfrmComprobantesVentas.btnListoClick(Sender: TObject);
begin
  dsItems.DataSet.CheckBrowseMode;
  if dsItems.DataSet.IsEmpty then
    application.MessageBox('No hay renglones para cobrar',
      'Atención',MB_ICONERROR)
  else
    self.cerrarComprobante;
end;

procedure TfrmComprobantesVentas.btnBuscarClick(Sender: TObject);
var
  FBuscarArticulo:TfrmBuscarArtVenta;
begin
  // busqueda de articulos
  dsItems.DataSet.Cancel;
  dsItems.DataSet.Insert;
  FBuscarArticulo:=TfrmBuscarArtVenta.Create(self);
  try
    FBuscarArticulo.ShowModal;
  finally
    FBuscarArticulo.Free;
  end;
  dbeCantidad.SetFocus;
end;

procedure TfrmComprobantesVentas.nuevoRemito;
begin
  // creo un nuevo remito
  self.Caption:=self.Caption+' Remito';
  dm.nuevoRemito;
end;

procedure TfrmComprobantesVentas.nuevaFactura;
begin
  // creo una nueva factura
  self.Caption:=self.Caption+' Factura';
  dm.nuevaFactura;
end;

procedure TfrmComprobantesVentas.nuevaNotaCredito;
begin
  // creo una nueva nota de credito
  self.Caption:=self.Caption+' Nota de Crédito';
  dm.nuevaNotaCredito;
end;

procedure TfrmComprobantesVentas.nuevoPresupuesto;
begin
  // nuevo presupuesto
  self.Caption:=self.caption+' Presupuesto';
  dm.nuevoPresupuesto;
end;

procedure TfrmComprobantesVentas.dbeCantidadEnter(Sender: TObject);
begin
  if (dsItems.DataSet.State <> dsInsert) and (dsItems.DataSet.State <> dsEdit) then
    btnAgregar.Click;
  dbeCantidad.SelectAll;
end;

procedure TfrmComprobantesVentas.eCodigoInternoEnter(Sender: TObject);
begin
  if (dsItems.DataSet.State <> dsInsert) and (dsItems.DataSet.State <> dsEdit) then
    btnAgregar.Click;
  eCodigoInterno.Text:='';
end;

procedure TfrmComprobantesVentas.eCodigoInternoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    if dm.buscarCodigoInterno(eCodigoInterno.Text)> 0 then
      dbeCantidad.SetFocus;
    end;
end;

procedure TfrmComprobantesVentas.dbeDescuentoEnter(Sender: TObject);
begin
  dbeDescuento.SelectAll;
end;

procedure TfrmComprobantesVentas.dblcClienteEnter(Sender: TObject);
begin
  dblcCliente.DropDown;
end;

procedure TfrmComprobantesVentas.dbeDescuentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    self.grabarRenglon;
    end;
end;

procedure TfrmComprobantesVentas.dbeCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    self.grabarRenglon;
    end;
end;

procedure TfrmComprobantesVentas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
    begin
    btnBuscar.Click;
    end;
end;

procedure TfrmComprobantesVentas.FormDestroy(Sender: TObject);
begin
  // libero el módulo de datos
  dm.Free;
end;

procedure TfrmComprobantesVentas.cxdblcbDescripcionEnter(Sender: TObject);
begin
  if (dsItems.DataSet.State <> dsInsert) and (dsItems.DataSet.State <> dsEdit) then
    btnAgregar.Click;
end;

procedure TfrmComprobantesVentas.cxdblcbDescripcionKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = char(VK_RETURN) then
    begin
    key:= #0;
    self.grabarRenglon;
    end;
end;

procedure TfrmComprobantesVentas.cerrarComprobante;
var
  FFormaPago:TfrmFormaPagoVenta;
  FRepComprobantes:TfrmRepComprobantes;
  idComprobante:integer;
  grabar:boolean;
begin
   // procedimiento para cerrar el comprobante
   // tomo el idComprobante para poder imprimirlo
   idComprobante:=
     dsComprobante.DataSet.FieldByName('ID_NROCOMPROBANTE').AsInteger;
   grabar:=false;
   // muestro la ventana de formas de pago
   FFormaPago:=TfrmFormaPagoVenta.Create(self);
   try
     if FFormaPago.ShowModal = mrOK then
       begin
       if dsComprobante.DataSet.FieldByName('IDTIPOCOMPROBANTE').AsInteger = 200 then
         // es un presupuesto y tiene otro tratamiento
         begin
         dm.grabarPresupuesto;
         if FFormaPago.cantCopias > 0 then
           begin
           // aca imprimo el comprobante de venta
           FRepComprobantes:=TfrmRepComprobantes.Create(self);
           FRepComprobantes.imprimir(idComprobante,FFormaPago.cantCopias);
           FRepComprobantes.Free;
           end;
         // cierro el formulario de ventas
         self.close();
         end
       else
         begin
         grabar:=true;
         if dsComprobante.DataSet.FieldByName('IDFORMAPAGO').AsInteger = 500 then
           begin
           if dm.comprobarLimiteCredito then
              grabar:=true
           else
             if application.MessageBox('El cliente ha superado el límite de crédito'+
               ' autorizado. ¿Desea continuar?'+#13+#13, 'Atención',
               MB_YESNO + MB_ICONWARNING) = 6 Then
               grabar:=true
             else
               grabar:=false;
           end;
         end;
       if grabar then
         begin
         dm.grabar;
         if FFormaPago.cantCopias > 0 then
           begin
           // aca imprimo el comprobante de venta
           FRepComprobantes:=TfrmRepComprobantes.Create(self);
           FRepComprobantes.imprimir(idComprobante,FFormaPago.cantCopias);
           FRepComprobantes.Free;
           end;
         // cierro el formulario de ventas
         self.close();
         end;
       end;
   finally
     FFormaPago.Free;
   end;
end;

procedure TfrmComprobantesVentas.grabarRenglon;
begin
  dm.grabarRenglon;
  dbeDescripcion.DataSource.DataSet.Close;
  eCodigoInterno.SetFocus;
end;

end.
