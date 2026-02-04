unit uComprobantesAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls,
  DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TfrmComprobantesAdmin = class(TfrmImput)
    dbgDatos: TDBGrid;
    gbDetalles: TGroupBox;
    btnImprimir: TSpeedButton;
    btnAnular: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    dsMaestro: TDataSource;
    dsDetalle: TDataSource;
    dsDetalleGral: TDataSource;
    Label11: TLabel;
    DBText9: TDBText;
    dsClientes: TDataSource;
    Label12: TLabel;
    lEstado: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1NROSUCURSAL: TcxGridDBColumn;
    cxGrid1DBTableView1NROCOMPROBANTE: TcxGridDBColumn;
    cxGrid1DBTableView1FECHA: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1FORMA_PAGO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dsMaestroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure verComo(como:string);
  end;

var
  frmComprobantesAdmin: TfrmComprobantesAdmin;

implementation

uses udmComprobantesAdmin, uRepComprobantes;

var
  dm:TdmComprobantesAdmin;

{$R *.dfm}

{ TfrmCancelarComprobante }

procedure TfrmComprobantesAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  dm:=TdmComprobantesAdmin.Create(self);
end;

procedure TfrmComprobantesAdmin.verComo(como: string);
begin
  // como muestro el formulario
  lEstado.Caption:= '';
  if como = 'ANULAR' then
    begin
    self.Caption:=self.Caption+'Anulación de comprobantes';
    lRequeridos.Caption:=lRequeridos.Caption+'que desea anular';
    btnImprimir.Enabled:=false;
    btnImprimir.Visible:=false;
    end;
  if como = 'REIMPRIMIR' then
    begin
    self.Caption:=self.Caption+'Re Impresión de comprobantes';
    lRequeridos.Caption:=lRequeridos.Caption+'que desea re imprimir';
    btnAnular.Enabled:=false;
    btnAnular.Visible:=false;
    end;
end;

procedure TfrmComprobantesAdmin.btnAnularClick(Sender: TObject);
begin
  inherited;
  if not dsMaestro.DataSet.IsEmpty then
    if application.MessageBox('¡Cuidado! Está por anular un comprobante.'+
      #10+#13+#10+#13+'¿Seguro que desea continuar con la anulación?',
      'Atención',MB_YESNO + mb_ICONWARNING)= 6 Then
      begin
      dm.anularComprobante;
      end
    else
      application.MessageBox('La acción fue cancelada',
      'Atención',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmComprobantesAdmin.btnImprimirClick(Sender: TObject);
var
  FRepComprobantes:TfrmRepComprobantes;
  idComprobante:integer;
begin
  inherited;
  idComprobante:=dsMaestro.DataSet.Fields[0].AsInteger;
  if idComprobante > 0 then
    begin
    FRepComprobantes:=TfrmRepComprobantes.Create(self);
    FRepComprobantes.imprimir(idComprobante,1);
    FRepComprobantes.Free;
    end
  else
    application.MessageBox('Debe seleccionar un comprobante',
    'Atención',MB_OK + MB_ICONINFORMATION);
  end;

procedure TfrmComprobantesAdmin.btnSalirClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmComprobantesAdmin.dsMaestroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsMaestro.DataSet.FieldByName('ANULADO').AsInteger = 1 then
    begin
    lEstado.Caption:= 'ANULADO';
    lEstado.Font.Color:=clRed;
    end;
  if dsMaestro.DataSet.FieldByName('ANULADO').AsInteger = 0 then
    begin
    lEstado.Caption:='ACTIVO';
    lEstado.Font.Color:=clBlue;
    end;
end;

end.
