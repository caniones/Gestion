unit uABMclientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DBCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmABMclientes = class(TfrmABMbase)
    cxGridDBTableView1NOMBRE: TcxGridDBColumn;
    cxGridDBTableView1DIRECCION: TcxGridDBColumn;
    cxGridDBTableView1FECHA_BAJA: TcxGridDBColumn;
    cxGridDBTableView1CUIT: TcxGridDBColumn;
    cxGridDBTableView1LOCALIDAD: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMclientes: TfrmABMclientes;

implementation

uses uAMcliente, udmClientes;

var
  dm:TdmClientes;

{$R *.dfm}

procedure TfrmABMclientes.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmClientes.Create(self);
end;

procedure TfrmABMclientes.btnAltaClick(Sender: TObject);
var
  FInput:TfrmImputCliente;
begin
  inherited;
  FInput:=TfrmImputCliente.Create(self);
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

procedure TfrmABMclientes.btnModiClick(Sender: TObject);
var
  FInput:TfrmImputCliente;
begin
  inherited;
  FInput:=TfrmImputCliente.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      {if dm.validar then
        application.MessageBox('El nombre ya se encuentra en la lista',
        'Atención',MB_ICONINFORMATION)
      else}
        dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMclientes.btnBajaClick(Sender: TObject);
begin
  inherited;
  If application.MessageBox('¿Desea eliminar el Cliente?  '+#13+#13,
    'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
    if (dsDatos.DataSet.FieldByName('FECHA_BAJA').IsNull) then
      begin
      dsDatos.DataSet.Delete;
      dm.grabar;
      end
    else
      application.MessageBox('El Cliente ya se encuentra dado de baja',
      'Atención',MB_ICONINFORMATION);
end;

procedure TfrmABMclientes.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.Free;
end;

procedure TfrmABMclientes.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if not AViewInfo.GridRecord.Selected then
    if(AViewInfo.GridRecord.Values[cxGridDBTableView1FECHA_BAJA.Index]
      <> null) then
      begin
      // si está dado de baja lo pinto
      ACanvas.Brush.Color:=$00A4FFFF;
      ACanvas.Font.Color:=clRed;
      end;
end;

end.
