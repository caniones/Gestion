unit uAMtitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB;

type
  TfrmImputTitulo = class(TfrmImput)
    dsTitulos: TDataSource;
    dbeTitulo: TDBEdit;
    Label1: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImputTitulo: TfrmImputTitulo;

implementation

uses udmTitulos;

{$R *.dfm}

procedure TfrmImputTitulo.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if dbeTitulo.Text <> '' then
    Modalresult:= mrOK
  else
    application.MessageBox('¡Debe ingresar el nombre del Titulo!','Atención',MB_ICONERROR);
end;

procedure TfrmImputTitulo.FormShow(Sender: TObject);
begin
  inherited;
  if dsTitulos.DataSet.State = dsEdit then
    self.Caption:= self.Caption+' - Modificación de datos';
  if dsTitulos.DataSet.State = dsInsert then
    self.Caption:= self.Caption+' - Alta de datos';
  dbeTitulo.SetFocus;
end;

end.
