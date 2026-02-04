unit uAGasto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DB;

type
  TfrmAGasto = class(TfrmImput)
    dsDatos: TDataSource;
    dsFormasPagos: TDataSource;
    dbeDescrip: TDBEdit;
    dbeImporte: TDBEdit;
    dblcFormaPago: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure dblcFormaPagoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAGasto: TfrmAGasto;

implementation

uses udmGastos;

{$R *.dfm}

procedure TfrmAGasto.dblcFormaPagoClick(Sender: TObject);
begin
  inherited;
  btnAceptar.Visible:=true;
end;

procedure TfrmAGasto.FormShow(Sender: TObject);
begin
  inherited;
  dbeDescrip.SetFocus;
end;

procedure TfrmAGasto.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if dbeDescrip.Text <> '' then
    begin
    if dbeImporte.Text <> '' then
      Modalresult:= mrOK;
    end
  else
    application.MessageBox('Debe completar todos los campos marcados en color'+
    ' Naranja','Atención',MB_ICONERROR);
end;

end.
