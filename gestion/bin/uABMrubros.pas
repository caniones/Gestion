unit uABMrubros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TfrmABMrubros = class(TfrmABMbase)
    cxGridDBTableView1DESCRIPCION: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMrubros: TfrmABMrubros;

implementation

uses udmRubros, uAMrubro;

var
  dm:TdmRubros;

{$R *.dfm}

procedure TfrmABMrubros.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmRubros.Create(self);
end;

procedure TfrmABMrubros.btnAltaClick(Sender: TObject);
var
  FInput:TfrmImputRubro;
begin
  inherited;
  FInput:=TfrmImputRubro.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      if dm.validar then
        application.MessageBox('El nombre ya se encuentra en la lista',
        'Atención',MB_ICONINFORMATION)
      else
        dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMrubros.btnModiClick(Sender: TObject);
var
  FInput:TfrmImputRubro;
begin
  inherited;
  FInput:=TfrmImputRubro.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      if dm.validar then
        application.MessageBox('El nombre ya se encuentra en la lista',
        'Atención',MB_ICONINFORMATION)
      else
        dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMrubros.btnBajaClick(Sender: TObject);
begin
  inherited;
  If application.MessageBox('¿Desea eliminar el Rubro?  '+#13+#13,
    'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
    if dm.permisoBaja then
      begin
      dsDatos.DataSet.Delete;
      dm.grabar;
      end
    else
      application.MessageBox('El Rubro que desea borrar posee Artículos'+#13+#13+
      'Primero borre los Artículos','Atención',MB_ICONINFORMATION);
end;

procedure TfrmABMrubros.dbgDatosDblClick(Sender: TObject);
begin
  inherited;
  btnModi.Click;
end;

end.
