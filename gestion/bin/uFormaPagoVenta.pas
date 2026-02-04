unit uFormaPagoVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB;

type
  TfrmFormaPagoVenta = class(TfrmImput)
    dsDatos: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dblcFormaPago: TDBLookupComboBox;
    dblcCliente: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    dsFormaPago: TDataSource;
    dsComprobante: TDataSource;
    dsCliente: TDataSource;
    cbCantidadCopias: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    DBText4: TDBText;
    procedure btnAceptarClick(Sender: TObject);
    procedure cbCantidadCopiasKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblcFormaPagoEnter(Sender: TObject);
    procedure dblcClienteEnter(Sender: TObject);
    procedure dblcClienteClick(Sender: TObject);
    procedure dblcFormaPagoClick(Sender: TObject);
  private
    FcantCopias: integer;
    procedure SetcantCopias(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property cantCopias:integer read FcantCopias write SetcantCopias;
  end;

var
  frmFormaPagoVenta: TfrmFormaPagoVenta;

implementation

uses udmComprobantesVentas, uPublicos;

{$R *.dfm}

procedure TfrmFormaPagoVenta.btnAceptarClick(Sender: TObject);
begin
  inherited;
  FCantCopias:=0;
  if cbCantidadCopias.Text <> 'Ninguna' then
    FCantCopias:= StrToInt(cbCantidadCopias.Text);
  if (dblcFormaPago.KeyValue = 500) and // forma de pago Cta. Cte
    (dblcCliente.KeyValue = 0) then     // cliente VARIOS
    application.MessageBox('Cliente "VARIOS" no puede pagar en cuenta corriente',
      'Atención', MB_ICONINFORMATION)
  else
    Modalresult:= mrOK;
end;

procedure TfrmFormaPagoVenta.cbCantidadCopiasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8,#9]) then
  begin
    key:=#0;
    application.MessageBox('Introduzca solo números','Atención',
      MB_ICONINFORMATION);
  end;
end;

procedure TfrmFormaPagoVenta.SetcantCopias(const Value: integer);
begin
  FcantCopias := Value;
end;

procedure TfrmFormaPagoVenta.FormShow(Sender: TObject);
begin
  inherited;
  cbCantidadCopias.ItemIndex:=StrToInt(uPublicos.LeerIni(ChangeFileExt(
    Application.ExeName,'.INI'), 'IMPRESION','COPIAS','0'));
  dblcCliente.SetFocus;
end;

procedure TfrmFormaPagoVenta.dblcFormaPagoEnter(Sender: TObject);
begin
  inherited;
  dsComprobante.DataSet.Edit;
end;

procedure TfrmFormaPagoVenta.dblcClienteEnter(Sender: TObject);
begin
  inherited;
  dsComprobante.DataSet.Edit;
end;

procedure TfrmFormaPagoVenta.dblcClienteClick(Sender: TObject);
begin
  inherited;
  dblcFormaPago.Enabled:=true;
end;

procedure TfrmFormaPagoVenta.dblcFormaPagoClick(Sender: TObject);
begin
  inherited;
  btnAceptar.Visible:=true;
end;

end.
