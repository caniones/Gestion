unit uABMarticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uABMbase, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DBCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TfrmABMarticulos = class(TfrmABMbase)
    Label1: TLabel;
    btnDuplicar: TBitBtn;
    eBuscarArticulo: TEdit;
    cxGridDBTableView1CODIGO_INTERNO: TcxGridDBColumn;
    cxGridDBTableView1DESCRIPCION: TcxGridDBColumn;
    cxGridDBTableView1FECHA_BAJA: TcxGridDBColumn;
    cxGridDBTableView1FECHA_ACTPRECIO: TcxGridDBColumn;
    cxGridDBTableView1PRECIO_PUBLICO: TcxGridDBColumn;
    cxGridDBTableView1LINEA: TcxGridDBColumn;
    cxGridDBTableView1RUBRO: TcxGridDBColumn;
    cxGridDBTableView1PROVEEDOR: TcxGridDBColumn;
    cxGridDBTableView1MONEDA: TcxGridDBColumn;
    dbgDatos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure eBuscarArticuloKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbgDatosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABMarticulos: TfrmABMarticulos;

implementation

uses uAMarticulo, udmArticulos;

var
  dm:TdmArticulos;

{$R *.dfm}

procedure TfrmABMarticulos.FormCreate(Sender: TObject);
begin
  inherited;
  // modifico el grid mode para optimizar el rendimiento de la grilla
  // cuando tiene muchos registros se vuelve lenta.
  //cxGridDBTableView1.DataController.DataModeController.GridMode:=true;
  //cxGridDBTableView1.DataController.DataModeController.GridModeBufferCount:=50;
  dm:=TdmArticulos.Create(self);
end;

procedure TfrmABMarticulos.btnDuplicarClick(Sender: TObject);
var
  FInput:TfrmImputArticulo;
begin
  inherited;
  FInput:=TfrmImputArticulo.Create(self);
  try
    dm.duplicarArticulo;
    if FInput.ShowModal = mrOK then
      if dm.validarCodigoInterno then
        application.MessageBox('Ya existe un Artículo con el mismo Código '+
        'Interno en la lista', 'Atención',MB_ICONINFORMATION)
      {else
        if dm.validarAlta then
          application.MessageBox('Ya existe un Artículo con la misma'+
          ' Descripción y Línea en la lista', 'Atención',MB_ICONINFORMATION)}
        else
          dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMarticulos.btnAltaClick(Sender: TObject);
var
  FInput:TfrmImputArticulo;
begin
  inherited;
  FInput:=TfrmImputArticulo.Create(self);
  try
    dsDatos.DataSet.Insert;
    if FInput.ShowModal = mrOK then
      if dm.validarCodigoInterno then
        application.MessageBox('Ya existe un Artículo con el mismo Código '+
        'Interno en la lista', 'Atención',MB_ICONINFORMATION)
        else
          dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMarticulos.btnModiClick(Sender: TObject);
var
  FInput:TfrmImputArticulo;
begin
  inherited;
  FInput:=TfrmImputArticulo.Create(self);
  try
    dsDatos.DataSet.Edit;
    if FInput.ShowModal = mrOK then
      if dm.validarCodigoInterno then
        application.MessageBox('Ya existe un Artículo con el mismo Código '+
        'Interno en la lista', 'Atención',MB_ICONINFORMATION)
        else
          dm.grabar;
    dsDatos.DataSet.Cancel;
  finally
    FInput.Free;
  end;
end;

procedure TfrmABMarticulos.btnBajaClick(Sender: TObject);
begin
  inherited;
  If Application.MessageBox('¿Desea eliminar el Artículo?  '+#13+#13,
    'Atención',MB_YESNO + MB_ICONWARNING) = 6 Then
    begin
    dsDatos.DataSet.Delete;
    dm.grabar;
    end;
end;

procedure TfrmABMarticulos.eBuscarArticuloKeyPress(Sender: TObject;
  var Key: Char);
var
  sEsto:string;
  FInput:TfrmImputArticulo;
begin
  inherited;
  if Key = char(VK_RETURN) then
  // cuando detecta un ENTER hago la busqueda
  begin
    key:=#0;
    sEsto:=eBuscarArticulo.Text;
    if dsDatos.DataSet.Locate('CODIGO_INTERNO', sEsto, [loCaseInsensitive]) then
      btnModi.Click
    else
      begin
      FInput:=TfrmImputArticulo.Create(self);
      try
        dsDatos.DataSet.Insert;
        dsDatos.DataSet.FieldByName('CODIGO_INTERNO').AsString:=
          eBuscarArticulo.Text;
        if FInput.ShowModal = mrOK then
          if dm.validarCodigoInterno then
            application.MessageBox('Ya existe un Artículo con el mismo Código '+
              'Interno en la lista', 'Atención',MB_ICONINFORMATION)
          else
            dm.grabar;
        dsDatos.DataSet.Cancel;
      finally
        FInput.Free;
      end;
      end;
  end;
end;

procedure TfrmABMarticulos.cxGridDBTableView1CustomDrawCell(
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

procedure TfrmABMarticulos.dbgDatosDblClick(Sender: TObject);
begin
  inherited;
  self.btnModiClick(self);
end;

procedure TfrmABMarticulos.FormResize(Sender: TObject);
begin
  inherited;
  dbgDatos.Height:=self.Height-155;
  dbgDatos.Width:=self.Width-16;
end;

procedure TfrmABMarticulos.dbgDatosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dsDatos.DataSet.FieldByName('FECHA_BAJA').AsString <> '' then
    begin
    // Cambiamos el color
    dbgDatos.Canvas.Brush.Color:=$00FED967;
    dbgDatos.Canvas.Font.Color:=clRed;
    dbgDatos.DefaultDrawColumnCell(rect,DataCol,Column,State);
    end;end;

end.
