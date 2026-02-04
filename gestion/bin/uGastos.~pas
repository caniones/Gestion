unit uGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids,
  ComCtrls, Menus;

type
  TfrmGastos = class(TfrmImput)
    dtpFecha: TDateTimePicker;
    dbgDatos: TDBGrid;
    dsDatos: TDataSource;
    PopupMenu: TPopupMenu;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    Nuevo1: TMenuItem;
    Borrar1: TMenuItem;
    btnBorrarGasto: TSpeedButton;
    btnCancelarGasto: TSpeedButton;
    btnNuevoGasto: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dtpFechaChange(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure Nuevo1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure dbgDatosColEnter(Sender: TObject);
    procedure dbgDatosColExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalirClick(Sender: TObject);
    procedure btnNuevoGastoClick(Sender: TObject);
    procedure btnCancelarGastoClick(Sender: TObject);
    procedure btnBorrarGastoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGastos: TfrmGastos;

implementation

uses udmGastos, uAGasto;

var
  dm:TdmGastos;
  deboGrabar:boolean;

{$R *.dfm}

procedure TfrmGastos.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmGastos.Create(self);
  dtpFecha.Date:=date;
end;

procedure TfrmGastos.dtpFechaChange(Sender: TObject);
begin
  inherited;
  dsDatos.DataSet.Cancel;
  dm.buscarPorFecha(dtpFecha.Date);
end;

procedure TfrmGastos.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsInsert then
    begin
    nuevo1.Enabled:=false;
    borrar1.Enabled:=false;
    cancelar1.Enabled:=true;
    end
  else
    begin
    nuevo1.Enabled:=true;
    borrar1.Enabled:=true;
    cancelar1.Enabled:=false;
    end
end;

procedure TfrmGastos.Nuevo1Click(Sender: TObject);
begin
  inherited;
  btnNuevoGasto.Click;
end;

procedure TfrmGastos.Cancelar1Click(Sender: TObject);
begin
  inherited;
  btnCancelarGasto.Click;
end;

procedure TfrmGastos.Borrar1Click(Sender: TObject);
begin
  inherited;
  btnBorrarGasto.Click;
end;

procedure TfrmGastos.dbgDatosColEnter(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsInsert then
    //if dbgDatos.SelectedField = dbgDatos.Fields[3] then
      // controlar que no cambie el index del campo del dgGrid
      //deboGrabar:=true;
end;

procedure TfrmGastos.dbgDatosColExit(Sender: TObject);
begin
  inherited;
  if deboGrabar then
    try
      dm.grabar;
      deboGrabar:=false;
      dm.buscarPorFecha(dtpFecha.Date);
    except
      application.MessageBox('Debe ingresar una Descripción, el Importe'+
      ' y la Forma de Pago',
      'Atención',MB_ICONERROR);
    end;
end;

procedure TfrmGastos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dm.Free;
end;

procedure TfrmGastos.btnSalirClick(Sender: TObject);
begin
  inherited;
  dsDatos.DataSet.Cancel;
  Modalresult:= mrOK
end;

procedure TfrmGastos.btnNuevoGastoClick(Sender: TObject);
var
  FInput:TfrmAGasto;
begin
  inherited;
  FInput:=TfrmAGasto.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      begin
      dm.grabar;
      dm.buscarPorFecha(dtpFecha.Date);
      end;
  finally
    FInput.Free;
  end;
end;

procedure TfrmGastos.btnCancelarGastoClick(Sender: TObject);
begin
  inherited;
  dsDatos.DataSet.Cancel;
  dm.buscarPorFecha(dtpFecha.Date);
end;

procedure TfrmGastos.btnBorrarGastoClick(Sender: TObject);
begin
  inherited;
  If application.MessageBox('¿Desea eliminar el Gasto?',
    'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
    if not dsDatos.DataSet.IsEmpty then
      begin
      dsDatos.DataSet.Delete;
      dm.grabar;
      dm.buscarPorFecha(dtpFecha.Date);
      end;
  dm.buscarPorFecha(dtpFecha.Date);
end;

end.
