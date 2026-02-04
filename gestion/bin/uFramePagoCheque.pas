unit uFramePagoCheque;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, ComCtrls, Mask, DBCtrls;

type
  TFramePagoCheque = class(TFrame)
    dsCheques: TDataSource;
    dbeNroCheque: TDBEdit;
    dbeBanco: TDBEdit;
    dtpFechaCheque: TDateTimePicker;
    dbeImporte: TDBEdit;
    dtpFechaCobro: TDateTimePicker;
    dbeObservacion: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lFechaCobro: TLabel;
    dbtFecha: TDBText;
    lFechaIngreso: TLabel;
    procedure dtpFechaChequeChange(Sender: TObject);
    procedure dtpFechaCobroChange(Sender: TObject);
    procedure dsChequesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validar():boolean;
  end;

implementation

uses udmPagos;

{$R *.dfm}

procedure TFramePagoCheque.dtpFechaChequeChange(Sender: TObject);
begin
  // cargo la fecha del cheque
  dsCheques.DataSet.FieldByName('FECHA_CHEQUE').AsDateTime:=
  dtpFechaCheque.Date;
end;

procedure TFramePagoCheque.dtpFechaCobroChange(Sender: TObject);
begin
  // cargo la fecha de cobro del cheque
  dsCheques.DataSet.FieldByName('FECHA_COBRO').AsDateTime:=
  dtpFechaCobro.Date;
end;

function TFramePagoCheque.validar: boolean;
begin
  // valido que los campos requeridos no esten vacios
  if (dbeNroCheque.Text<>'') and (dbeBanco.Text<>'')
  and (dbeImporte.Text<>'') then
    begin
    // esto es para evitar que no grabe el componente que está seleccionado
    dbeNroCheque.SetFocus;
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

procedure TFramePagoCheque.dsChequesStateChange(Sender: TObject);
begin
  if dsCheques.DataSet.State = dsInsert then
  // si esta en modo insert = ingresa un pago con cheque
    begin
    // cargo la fecha del cheque
    dtpFechaCheque.Date:=date;
    // oculto lo que no hace falta
    lFechaIngreso.Visible:=false;
    dbtFecha.Visible:=false;
    lFechaCobro.Visible:=false;
    dtpFechaCobro.Visible:=false;
    // activo y desactivo lo que hace falta
    dbeNroCheque.Enabled:=true;
    dbtFecha.Enabled:=false;
    dtpFechaCheque.Enabled:=true;
    dtpFechaCobro.Enabled:=false;
    dbeBanco.Enabled:=true;
    dbeImporte.Enabled:=true;
    dbeObservacion.Enabled:=true;
    end;
  if dsCheques.DataSet.State = dsEdit then
  // si esta en modo edit = ingresa un cobro de cheque
    begin
    // cargo la fecha del cheque
    dtpFechaCheque.Date:=dsCheques.DataSet.FieldByName('FECHA').AsDateTime;
    // cargo la fecha de cobro del cheque
    dtpFechaCobro.Date:=date;
    // activo y desactivo lo que hace falta
    dbeNroCheque.Enabled:=false;
    dbtFecha.Enabled:=true;
    dtpFechaCheque.Enabled:=false;
    dtpFechaCobro.Enabled:=true;
    dbeBanco.Enabled:=false;
    dbeImporte.Enabled:=false;
    dbeObservacion.Enabled:=true;
    end;
  if dsCheques.DataSet.State = dsBrowse then
  // si esta en modo browse = muestra detalles del pago con cheque
    begin
    // cargo la fecha del cheque
    dtpFechaCheque.Date:=dsCheques.DataSet.FieldByName('FECHA').AsDateTime;
    // muestro lo que hace falta
    lFechaIngreso.Visible:=true;
    dbtFecha.Visible:=true;
    // aca tengo que ver como muestro la fecha de cobro para el caso que el
    // cheque no este cobrado todavia
    lFechaCobro.Visible:=true;
    dtpFechaCobro.Visible:=true;
    dtpFechaCobro.Date:=dsCheques.DataSet.FieldByName('FECHA_COBRO').AsDateTime;
    // activo y desactivo lo que hace falta
    dbeNroCheque.Enabled:=false;
    dbtFecha.Enabled:=true;
    dtpFechaCheque.Enabled:=false;
    dtpFechaCobro.Enabled:=false;
    dbeBanco.Enabled:=false;
    dbeImporte.Enabled:=false;
    dbeObservacion.Enabled:=false;
    end;
end;

end.
