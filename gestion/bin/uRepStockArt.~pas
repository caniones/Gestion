unit uRepStockArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepBase, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, QRExport;

type
  TfrmRepStockArt = class(TfrmRepBase)
    ibqMaster: TIBQuery;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    dsMaster: TDataSource;
    ibqDetalle: TIBQuery;
    ibqMasterTITULO: TIBStringField;
    ibqMasterLINEA: TIBStringField;
    ibqMasterRUBRO: TIBStringField;
    ibqMasterIDTITULO: TIntegerField;
    ibqMasterIDLINEA: TIntegerField;
    ibqMasterIDRUBRO: TIntegerField;
    ibqDetalleCODIGO_INTERNO: TIBStringField;
    ibqDetallePRECIO: TIBBCDField;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    ibqDetalleFECHA_BAJA: TDateField;
    ibqDetalleCONTROL_STOCK: TIntegerField;
    QRLabel16: TQRLabel;
    ibqDetalleDESCRIPCION: TIBStringField;
    ibqDetalleSTOCK: TIBBCDField;
    ibqDetalleVALOR: TFloatField;
    SaveDialog: TSaveDialog;
    ibqDetallePUNTO_REPOSICION: TIBBCDField;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure imprimir(laLinea, elRubro, elProveedor, elTitulo, laFecha,
    elCodigo : string);
    procedure reporteCsv(laLinea, elRubro, elProveedor, elTitulo, laFecha,
    elCodigo : string);
  end;

var
  frmRepStockArt: TfrmRepStockArt;

implementation

uses dmConex;

{$R *.dfm}

{ TfrmRepStockArt }

procedure TfrmRepStockArt.imprimir(laLinea, elRubro, elProveedor,
  elTitulo, laFecha, elCodigo: string);
begin
  // imprimo el reporte
  ibqMaster.Close;
  {SELECT DISTINCT T.DESCRIPCION AS TITULO, L.DESCRIPCION AS LINEA,
   R.DESCRIPCION AS RUBRO, A.IDTITULO, A.IDLINEA, A.IDRUBRO
   FROM ARTICULOS A, LINEAS L, RUBROS R, TITULOS T
   WHERE A.IDLINEA = L.IDLINEA
   AND A.IDRUBRO = R.IDRUBRO
   AND A.IDTITULO = T.IDTITULO}
  if laLinea <> '' then
    ibqMaster.SQL.Add('AND A.IDLINEA IN ('+laLinea+')');
  if elRubro <> '' then
    ibqMaster.SQL.Add('AND A.IDRUBRO IN ('+elRubro+')');
  if elTitulo <> '' then
    ibqMaster.SQL.Add('AND A.IDTITULO IN ('+elTitulo+')');
  // ordeno la consulta
  ibqMaster.SQL.Add('ORDER BY T.DESCRIPCION, L.DESCRIPCION, R.DESCRIPCION, '+
                    'A.DESCRIPCION');
  ibqMaster.Open;
  if ibqMaster.IsEmpty then
    begin
    application.MessageBox('No hay Artículos que coincidan con los parámetros'+
    ' seleccionados','Atención',MB_ICONWARNING);
    exit; // salgo si no hay renglones en el reporte
    end;
  ibqDetalle.Close;
  {SELECT A.CODIGO_INTERNO, A.DESCRIPCION, A.PRECIO_PUBLICO AS PRECIO, A.STOCK,
   A.PUNTO_REPOSICION, A.PRECIO_PUBLICO*A.STOCK AS VALOR
   FROM ARTICULOS A, LINEAS L, RUBROS R, TITULOS T
   WHERE A.IDLINEA = :IDLINEA
   AND A.IDRUBRO = :IDRUBRO
   AND A.IDTITULO = :IDTITULO}
  if elProveedor <> '' then
    ibqDetalle.SQL.Add('AND A.IDPROVEEDOR IN ('+elProveedor+')');
  if lafecha <> '' then
    ibqDetalle.SQL.Add('AND A.FECHA_ACTPRECIO IN ('+laFecha+')');
  if lafecha <> '' then
    ibqDetalle.SQL.Add('AND A.FECHA_ACTPRECIO IN ('+laFecha+')');
  if elCodigo <> '' then
    ibqDetalle.SQL.Add('AND A.CODIGO_INTERNO IN ('+elCodigo+')');
  // orderno la consulta
  ibqDetalle.SQL.Add('ORDER BY A.DESCRIPCION ');
  ibqDetalle.Open;
  qrBase.Prepare;
  qrBase.PreviewModal;
end;

procedure TfrmRepStockArt.reporteCsv(laLinea, elRubro, elProveedor,
  elTitulo, laFecha, elCodigo: string);
var
  TS:TStrings;
  x, s, nombreArchivo: String;
  mensaje: PAnsiChar;
begin
  ibqMaster.Close;
  if laLinea <> '' then
    ibqMaster.SQL.Add('AND A.IDLINEA IN ('+laLinea+')');
  if elRubro <> '' then
    ibqMaster.SQL.Add('AND A.IDRUBRO IN ('+elRubro+')');
  if elTitulo <> '' then
    ibqMaster.SQL.Add('AND A.IDTITULO IN ('+elTitulo+')');
  // ordeno la consulta
  ibqMaster.SQL.Add('ORDER BY T.DESCRIPCION, L.DESCRIPCION, R.DESCRIPCION, '+
                    'A.DESCRIPCION');
  ibqMaster.Open;
  if ibqMaster.IsEmpty then
    begin
    application.MessageBox('No hay Artículos que coincidan con los parámetros'+
    ' seleccionados','Atención',MB_ICONWARNING);
    exit; // salgo si no hay renglones en el reporte
    end;
  ibqDetalle.Close;
  if elProveedor <> '' then
    ibqDetalle.SQL.Add('AND A.IDPROVEEDOR IN ('+elProveedor+')');
  if lafecha <> '' then
    ibqDetalle.SQL.Add('AND A.FECHA_ACTPRECIO IN ('+laFecha+')');
  if lafecha <> '' then
    ibqDetalle.SQL.Add('AND A.FECHA_ACTPRECIO IN ('+laFecha+')');
  if elCodigo <> '' then
    ibqDetalle.SQL.Add('AND A.CODIGO_INTERNO IN ('+elCodigo+')');
  // orderno la consulta
  ibqDetalle.SQL.Add('ORDER BY A.DESCRIPCION ');
  ibqDetalle.Open;
  // genero el reporte CSV
  x:=';'; // separador de listas
  if SaveDialog.Execute then
    begin
    nombreArchivo:=SaveDialog.FileName;
    {while not dsDatosDetalles.DataSet.Eof do
        begin
        s:=s+caja+x+dsDatos.DataSet.FieldByName('NROCLIENTE').AsString+x+
        dsDatosDetalles.DataSet.FieldByName('MEDIOPAGO').AsString+x+
        dsDatosDetalles.DataSet.FieldByName('IMPORTE').AsString+x+
        dsDatosDetalles.DataSet.FieldByName('BANCOORIGEN').AsString+x;
        end;}
    while not ibqMaster.Eof do
      begin
      // guardo los datos del master
      s:=s+ibqMasterTITULO.AsString+x+#13;
      s:=s+ibqMasterLINEA.AsString+x+#13;
      s:=s+ibqMasterRUBRO.AsString+x+#13;
      s:=s+'CODIGO'+x+'DESCRIPCION'+x+'COSTO'+x+'PRECIO'+x+'STOCK'+x+
        'REPOSICION'+x+'BAJA'+x+#13;
      while not ibqDetalle.Eof do
        begin
        // guardo los datos del detalle
        s:=s+ibqDetalleCODIGO_INTERNO.AsString+x+
          ibqDetalleDESCRIPCION.AsString+x+
          ibqDetallePRECIO.AsString+x+
          ibqDetalleVALOR.AsString+x+
          ibqDetalleSTOCK.AsString+x+
          ibqDetallePUNTO_REPOSICION.AsString+x+
          ibqDetalleFECHA_BAJA.AsString+x+#13;
        ibqDetalle.Next;
        end;
      s:=s+#13;
      ibqMaster.Next;
      end;

    end;
      // guardo el archivo
  TS:=TStringList.Create();
  TS.Text:=s;
  TS.SaveToFile(nombreArchivo);
  TS.Free;
  mensaje:=PAnsiChar('Listo! el archivo se guardó en '+nombreArchivo);
  application.MessageBox(mensaje, 'Atención',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmRepStockArt.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Sender.Color:=clWhite;
  Sender.Font.Style:=[];
  if not ibqDetalle.FieldByName('FECHA_BAJA').IsNull then
    begin
    Sender.Font.Style:=[fsStrikeOut];
    end;
  if ibqDetalle.FieldByName('STOCK').AsInteger < 0 then
    begin
    Sender.Color:=clSilver;
    end;
  if ibqDetalle.FieldByName('CONTROL_STOCK').AsInteger = 0 then
    begin
    Sender.Font.Style:=[fsBold,fsItalic];
    end;
end;

end.
