unit uFramePagoDeposito;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ComCtrls, StdCtrls, DBCtrls, Mask;

type
  TFramePagoDeposito = class(TFrame)
    dsDepositos: TDataSource;
    dbeNroDeposito: TDBEdit;
    dbtFecha: TDBText;
    dbeBanco: TDBEdit;
    dtpFechaDeposito: TDateTimePicker;
    dbeImporte: TDBEdit;
    dbeObservacion: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lFechaIngreso: TLabel;
    procedure dtpFechaDepositoChange(Sender: TObject);
    procedure dsDepositosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validar(): boolean;
  end;

implementation

uses udmPagos;

{$R *.dfm}

procedure TFramePagoDeposito.dtpFechaDepositoChange(Sender: TObject);
begin
  // cargo la fecha del deposito
  dsDepositos.DataSet.FieldByName('FECHA_DEPOSITO').AsDateTime:=
  dtpFechaDeposito.Date;
end;

function TFramePagoDeposito.validar: boolean;
begin
  // valido que los campos requeridos no esten vacios
  if (dbeNroDeposito.Text<>'') and (dbeBanco.Text<>'')
  and (dbeImporte.Text<>'') then
    begin
    // esto es para evitar que no grabe el componente que está seleccionado
    dbeNroDeposito.SetFocus;
    dbeImporte.SetFocus;
    result:=true;
    end
  else
    begin
    application.MessageBox('Debe completar todos los campos marcados en color'+
    ' Naranja','Atención',MB_ICONERROR);
    result:=false;
    end;
end;

procedure TFramePagoDeposito.dsDepositosStateChange(Sender: TObject);
begin
  if dsDepositos.DataSet.State = dsInsert then
  // si esta en modo insert = ingresa un pago con deposito
    begin
    // cargo la fecha del deposito
    dtpFechaDeposito.Date:=date;
    // oculto lo que no hace falta
    lFechaIngreso.Visible:=false;
    dbtFecha.Visible:=false;
    // activo y desactivo lo que hace falta
    dbeNroDeposito.Enabled:=true;
    dbtFecha.Enabled:=false;
    dtpFechaDeposito.Enabled:=true;
    dbeBanco.Enabled:=true;
    dbeImporte.Enabled:=true;
    dbeObservacion.Enabled:=true;
    end;
  if dsDepositos.DataSet.State = dsEdit then
  // si esta en modo edit = ingresa una observacion
    begin
    // cargo la fecha del deposito
    dtpFechaDeposito.Date:=dsDepositos.DataSet.FieldByName('FECHA').AsDateTime;
    // oculto lo que no hace falta
    lFechaIngreso.Visible:=false;
    dbtFecha.Visible:=false;
    // activo y desactivo lo que hace falta
    dbeNroDeposito.Enabled:=false;
    dbtFecha.Enabled:=true;
    dtpFechaDeposito.Enabled:=false;
    dbeBanco.Enabled:=false;
    dbeImporte.Enabled:=false;
    dbeObservacion.Enabled:=true;
    end;
  if dsDepositos.DataSet.State = dsBrowse then
  // si esta en modo browse = muestra detalles del pago con deposito
    begin
    // cargo la fecha del deposito
    dtpFechaDeposito.Date:=dsDepositos.DataSet.FieldByName('FECHA').AsDateTime;
    // muestro lo que no hace falta
    lFechaIngreso.Visible:=true;
    dbtFecha.Visible:=true;
    // activo y desactivo lo que hace falta
    dbeNroDeposito.Enabled:=false;
    dbtFecha.Enabled:=true;
    dtpFechaDeposito.Enabled:=false;
    dbeBanco.Enabled:=false;
    dbeImporte.Enabled:=false;
    dbeObservacion.Enabled:=false;
    end;
end;

end.
