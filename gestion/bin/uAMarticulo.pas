unit uAMarticulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, Mask,
  ComCtrls;

type
  TfrmImputArticulo = class(TfrmImput)
    dsArticulos: TDataSource;
    dsRubros: TDataSource;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbtSinIva: TDBText;
    dbtIva: TDBText;
    dbtTotal: TDBText;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbeCodigoInterno: TDBEdit;
    dbeDescripcion: TDBEdit;
    dblcProveedor: TDBLookupComboBox;
    dblcRubro: TDBLookupComboBox;
    dblcLinea: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    dsLineas: TDataSource;
    dbePrecioCosto: TDBEdit;
    dbeIva: TDBEdit;
    GroupBox5: TGroupBox;
    dbtFechaActPrecio: TDBText;
    dbtFechaBaja: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dsProveedores: TDataSource;
    Label16: TLabel;
    dtpFechaCompra: TDateTimePicker;
    GroupBox6: TGroupBox;
    dbePuntoReposicion: TDBEdit;
    dbeStock: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    dbeUtilidad: TDBEdit;
    cbControlStock: TCheckBox;
    btnRecuperar: TBitBtn;
    Label6: TLabel;
    dblcTitulo: TDBLookupComboBox;
    dsTitulos: TDataSource;
    dbePrecioPublico: TDBEdit;
    Label10: TLabel;
    dsMonedas: TDataSource;
    dblcMoneda: TDBLookupComboBox;
    Label19: TLabel;
    Label20: TLabel;
    dbtCosto: TDBText;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpFechaCompraChange(Sender: TObject);
    procedure dblcProveedorClick(Sender: TObject);
    procedure cbControlStockClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImputArticulo: TfrmImputArticulo;

implementation

uses udmArticulos;

{$R *.dfm}

procedure TfrmImputArticulo.btnAceptarClick(Sender: TObject);
begin
  inherited;
  dbeCodigoInterno.SetFocus;
  dbeDescripcion.SetFocus;
  if dbeDescripcion.Text <> '' then
    begin
    Modalresult:= mrOK;
    end
  else
    application.MessageBox('Debe ingresar la Descripción del Artículo',
    'Atención',MB_ICONERROR);
end;

procedure TfrmImputArticulo.FormShow(Sender: TObject);
begin
  inherited;
  if dsArticulos.DataSet.State = dsEdit then
    begin
    self.Caption:= self.Caption+' - Modificación de datos';
    if not dsArticulos.DataSet.FieldByName('FECHA_BAJA').IsNull then
      btnRecuperar.Visible:=true;
    dbeDescripcion.SetFocus;
    end;
  if dsArticulos.DataSet.State = dsInsert then
    begin
    self.Caption:= self.Caption+' - Alta de datos';
    btnAceptar.Enabled:=False;
    dbeCodigoInterno.SetFocus;
    end;
  dtpFechaCompra.Date:=dsArticulos.DataSet.FieldByName('FECHA_COMPRA').AsDateTime;
  if dsArticulos.DataSet.FieldByName('CONTROL_STOCK').AsInteger = 1 then
    cbControlStock.Checked:=true
  else
    begin
    cbControlStock.Checked:=false;
    self.cbControlStockClick(self);
    end;
end;

procedure TfrmImputArticulo.dtpFechaCompraChange(Sender: TObject);
begin
  inherited;
  dsArticulos.DataSet.FieldByName('FECHA_COMPRA').AsDateTime:=dtpFechaCompra.Date;
end;

procedure TfrmImputArticulo.dblcProveedorClick(Sender: TObject);
begin
  inherited;
  btnAceptar.Enabled:=true;
end;

procedure TfrmImputArticulo.cbControlStockClick(Sender: TObject);
begin
  inherited;
  if cbControlStock.Checked then
    dsArticulos.DataSet.FieldByName('CONTROL_STOCK').AsInteger:=1
  else
    dsArticulos.DataSet.FieldByName('CONTROL_STOCK').AsInteger:=0;
  label18.Enabled:=cbControlStock.Checked;
  dbeStock.Enabled:=cbControlStock.Checked;
  label17.Enabled:=cbControlStock.Checked;
  dbePuntoReposicion.Enabled:=cbControlStock.Checked;
end;

procedure TfrmImputArticulo.btnRecuperarClick(Sender: TObject);
begin
  inherited;
  dsArticulos.DataSet.FieldByName('FECHA_BAJA').Clear;
end;

end.
