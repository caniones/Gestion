unit uAPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, uFramePagoCheque,
  uFramePagoDeposito;

type
  TfrmImputPago = class(TfrmImput)
    FramePagoCheque: TFramePagoCheque;
    FramePagoDeposito: TFramePagoDeposito;
    procedure btnAceptarClick(Sender: TObject);
  private
    FidPago: integer;
    Fimporte: real;
    procedure Setimporte(const Value: real);
    { Private declarations }
  public
    { Public declarations }
    procedure verComo(como:string);
    property importe: real read Fimporte write Setimporte;
  end;

var
  frmImputPago: TfrmImputPago;

implementation

uses udmPagos;

{$R *.dfm}

procedure TfrmImputPago.verComo(como: string);
begin
  // pago con cheque
  if como = 'CHEQUE' then
    begin
    if FramePagoCheque.dsCheques.DataSet.State = dsInsert then
      self.Caption:=self.Caption+' - Nuevo pago';
    if FramePagoCheque.dsCheques.DataSet.State = dsEdit then
      self.Caption:=self.Caption+' - Modificación del pago';
    if FramePagoCheque.dsCheques.DataSet.State = dsBrowse then
      begin
      self.Caption:=self.Caption+' - Datos del pago';
      btnAceptar.Visible:=false;
      end;
    lInfo.Caption:='Cheque';
    // muestro el frame de cheques y oculto los otros
    FramePagoCheque.Visible:=true;
    FramePagoDeposito.Visible:=false;
    end;
  // pago con deposito bancario
  if como = 'DEPOSITO' then
    begin
    if FramePagoDeposito.dsDepositos.DataSet.State = dsInsert then
      self.Caption:=self.Caption+' - Nuevo pago';
    if FramePagoDeposito.dsDepositos.DataSet.State = dsEdit then
      self.Caption:=self.Caption+' - Modificación del pago';
    if FramePagoDeposito.dsDepositos.DataSet.State = dsBrowse then
      begin
      self.Caption:=self.Caption+' - Datos del pago';
      btnAceptar.Visible:=false;
      end;
    lInfo.Caption:='Depósito bancario';
    // muestro el frame de depositos y oculto los otros
    FramePagoCheque.Visible:=false;
    FramePagoDeposito.Visible:=true;
    end;
end;

procedure TfrmImputPago.btnAceptarClick(Sender: TObject);
var
  id:integer;
begin
  inherited;
  if FramePagoCheque.Visible then
    if FramePagoCheque.validar then
    // si esta todo correcto salgo para grabar
      begin
      self.Setimporte(FramePagoCheque.dsCheques.DataSet.FieldByName('IMPORTE').AsFloat);
      Modalresult:= mrOK;
      end;
  if FramePagoDeposito.Visible then
    if FramePagoDeposito.validar then
    // si esta todo correcto salgo para grabar
      begin
      self.Setimporte(FramePagoDeposito.dsDepositos.DataSet.FieldByName('IMPORTE').AsFloat);
      Modalresult:= mrOK;
      end;
end;

procedure TfrmImputPago.Setimporte(const Value: real);
begin
  Fimporte := Value;
end;

end.
