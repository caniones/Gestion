unit uAMrubro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls, jpeg;

type
  TfrmImputRubro = class(TfrmImput)
    dbeRubro: TDBEdit;
    Label1: TLabel;
    dsRubros: TDataSource;
    Image1: TImage;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImputRubro: TfrmImputRubro;

implementation

uses udmRubros;

{$R *.dfm}

procedure TfrmImputRubro.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if dbeRubro.Text <> '' then
    Modalresult:= mrOK
  else
    application.MessageBox('¡Debe ingresar el nombre del Rubro!','Atención',MB_ICONERROR);
end;

procedure TfrmImputRubro.FormShow(Sender: TObject);
begin
  inherited;
  if dsRubros.DataSet.State = dsEdit then
    self.Caption:= self.Caption+' - Modificación de datos';
  if dsRubros.DataSet.State = dsInsert then
    self.Caption:= self.Caption+' - Alta de datos';
  dbeRubro.SetFocus;
end;

end.
