unit uAMlinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, jpeg, Mask, DBCtrls, DB;

type
  TfrmImputLinea = class(TfrmImput)
    Image1: TImage;
    Label1: TLabel;
    dsLineas: TDataSource;
    dbeLinea: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImputLinea: TfrmImputLinea;

implementation

uses udmLineas;

{$R *.dfm}

procedure TfrmImputLinea.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if dbeLinea.Text <> '' then
    Modalresult:= mrOK
  else
    application.MessageBox('¡Debe ingresar el nombre de la Linea!','Atención',MB_ICONERROR);
end;

procedure TfrmImputLinea.FormShow(Sender: TObject);
begin
  inherited;
  if dsLineas.DataSet.State = dsEdit then
    self.Caption:= self.Caption+' - Modificación de datos';
  if dsLineas.DataSet.State = dsInsert then
    self.Caption:= self.Caption+' - Alta de datos';
  dbeLinea.SetFocus;
end;

end.
