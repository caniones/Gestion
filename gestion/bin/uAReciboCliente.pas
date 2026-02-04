unit uAReciboCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Mask, DBCtrls, DB, Buttons, ExtCtrls;

type
  TfrmAReciboCliente = class(TfrmImput)
    dsDatos: TDataSource;
    dblcCliente: TDBLookupComboBox;
    dbeImporte: TDBEdit;
    dblcFormaPago: TDBLookupComboBox;
    dsClientes: TDataSource;
    dsFormasPagos: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeSaldo: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbtFechaUltimoPago: TDBText;
    Label6: TLabel;
    dsSaldo: TDataSource;
    dsUltimoPago: TDataSource;
    dbeImporteRecargo: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure dblcFormaPagoClick(Sender: TObject);
    procedure dblcClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcFormaPagoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAReciboCliente: TfrmAReciboCliente;

implementation

uses udmRecibos, uAPago, udmPagos;

var
  dmPagos:TdmPagos;

{$R *.dfm}

procedure TfrmAReciboCliente.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if dbeImporte.Text <> '' then
  // si el campo importe contiene un valor, Acepto
    Modalresult:= mrOK
  else
    application.MessageBox('Debe completar todos los campos marcados en color'+
    ' Naranja','Atención',MB_ICONERROR);
end;

procedure TfrmAReciboCliente.dblcFormaPagoClick(Sender: TObject);
begin
  inherited;
  // luego de indicar la forma de pago muesro el btnAceptar
  btnAceptar.Visible:=true;
end;

procedure TfrmAReciboCliente.dblcClienteClick(Sender: TObject);
begin
  inherited;
  // luego de elegido el Cliente habilito la forma de pago
  dblcFormaPago.Enabled:=true;
end;

procedure TfrmAReciboCliente.FormShow(Sender: TObject);
begin
  inherited;
  // cuando muestro el form el Cliente toma el foco
  dblcCliente.SetFocus;
end;

procedure TfrmAReciboCliente.dblcFormaPagoExit(Sender: TObject);
var
  FImputPago:TfrmImputPago;
  idPago:integer;
begin
  inherited;
  if dblcFormaPago.KeyValue = 400 then // pago con Cheque
  // abro la ventana para indicar los datos del cheque
    begin
    dmPagos:=TdmPagos.Create(self);
    dmPagos.abrirCheques;
    FImputPago:=TfrmImputPago.Create(self);
    try
      // indico que se realizara un nuevo pago con cheque
      dmPagos.nuevoCheque;
      // muestro los datos del cheque
      FImputPago.verComo('CHEQUE');
      if FImputPago.ShowModal = mrOK then
      // si acepta tomo el IDPAGO
        begin
        dmPagos.grabarCheque(idPago);
        dsDatos.DataSet.FieldByName('IDPAGO').AsInteger:=idPago;
        dsDatos.DataSet.FieldByName('IMPORTE').AsFloat:=FImputPago.importe;
        dbeImporte.Enabled:=false;
        end
      else
      // si no acepta lo dejo en contado
        dblcFormaPago.KeyValue:=100;
    finally
      FImputPago.Free;
      dmPagos.Free;
    end;
    end;
end;

end.
