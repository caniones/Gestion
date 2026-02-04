unit uPagosProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, ComCtrls, Mask,
  DB;

type
  TfrmPagosProveedores = class(TfrmImput)
    dblcProveedor: TDBLookupComboBox;
    dblcFormaPago: TDBLookupComboBox;
    dbeImporte: TDBEdit;
    dtpFecha: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dsDatos: TDataSource;
    dsProveedores: TDataSource;
    dsFormasPagos: TDataSource;
    procedure dtpFechaChange(Sender: TObject);
    procedure dblcFormaPagoExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcFormaPagoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagosProveedores: TfrmPagosProveedores;

implementation

uses udmEstadoCtasCtesProveedores, udmPagos, uAPago;

{$R *.dfm}

procedure TfrmPagosProveedores.dtpFechaChange(Sender: TObject);
begin
  inherited;
  // cuando cambia la fecha actualizo
  dsDatos.DataSet.FieldByName('FECHA').AsDateTime:=dtpFecha.Date;
end;

procedure TfrmPagosProveedores.dblcFormaPagoExit(Sender: TObject);
var
  FImputPago:TfrmImputPago;
  idPago:integer;
  dmPagos:TdmPagos;
begin
  inherited;
  // ---------------------- CHEQUE ----------------------
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
      // si acepta tomo el idpago
        begin
        dmPagos.grabarCheque(idPago);
        // tomo el idpago del cheque
        dsDatos.DataSet.FieldByName('IDPAGO').AsInteger:=idPago;
        // tomo el importe del cheque
        dsDatos.DataSet.FieldByName('IMPORTE').AsFloat:=FImputPago.importe;
        dbeImporte.Enabled:=false;
        end
      else
      // si no acepta lo dejo en contado
        begin
        dmPagos.cancelarCheque;
        dblcFormaPago.KeyValue:=100;
        end;
    finally
      FImputPago.Free;
      dmPagos.Free;
    end;
    end;
  // ---------------------- DEPOSITO ----------------------
  if dblcFormaPago.KeyValue = 700 then // deposito bancario
  // abro la ventana para indicar los datos del deposito
    begin
    dmPagos:=TdmPagos.Create(self);
    dmPagos.abrirDepositos;
    FImputPago:=TfrmImputPago.Create(self);
    try
      // indico que se realizara un nuevo pago con deposito
      dmPagos.nuevoDeposito;
      // muestro los datos del cheque
      FImputPago.verComo('DEPOSITO');
      if FImputPago.ShowModal = mrOK then
      // si acepta tomo el idpago
        begin
        dmPagos.grabarDeposito(idPago);
        // tomo el idpago del deposito
        dsDatos.DataSet.FieldByName('IDPAGO').AsInteger:=idPago;
        // tomo el importe del deposito
        dsDatos.DataSet.FieldByName('IMPORTE').AsFloat:=FImputPago.importe;
        dbeImporte.Enabled:=false;
        end
      else
      // si no acepta lo dejo en contado
        begin
        dmPagos.cancelarDeposito;
        dblcFormaPago.KeyValue:=100;
        end;
    finally
      FImputPago.Free;
      dmPagos.Free;
    end;
    end;
  // si no es pago con CHEQUE o DEPOSITO en el idpago es -1
  if (dblcFormaPago.KeyValue<>400) and (dblcFormaPago.KeyValue<>700) then
   dsDatos.DataSet.FieldByName('IDPAGO').AsInteger:=-1;
end;

procedure TfrmPagosProveedores.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if (dbeImporte.Text <> '') then
    ModalResult:=mrOK
  else
    application.MessageBox('Debe completar los campos requeridos',
    'Atención',MB_ICONERROR);
end;

procedure TfrmPagosProveedores.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsBrowse then
  // si está mostrando datos desactivo lo que hace falta
    begin
    dtpFecha.Enabled:=false;
    dblcProveedor.Enabled:=false;
    dblcFormaPago.Enabled:=false;
    dbeImporte.Enabled:=false;
    btnAceptar.Enabled:=false;
    end;
  dtpFecha.Date:=dsDatos.DataSet.FieldByName('FECHA').AsDateTime;
end;

procedure TfrmPagosProveedores.dblcFormaPagoClick(Sender: TObject);
begin
  inherited;
  btnAceptar.Enabled:=true;
end;

procedure TfrmPagosProveedores.FormCreate(Sender: TObject);
begin
  inherited;
  // cargo las formas de pago
  dsFormasPagos.DataSet.Close;
  dsFormasPagos.DataSet.Open;
  dsFormasPagos.DataSet.Last;
  dsFormasPagos.DataSet.First;
end;

procedure TfrmPagosProveedores.FormDestroy(Sender: TObject);
begin
  inherited;
  // cierro los dataset
  dsDatos.DataSet.Cancel;
  dsDatos.DataSet.Close;
  dsFormasPagos.DataSet.Close;
end;

end.
