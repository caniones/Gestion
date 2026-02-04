unit uComprobantesProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, ComCtrls, Mask,
  DBCtrls;

type
  TfrmComprobantesProveedores = class(TfrmImput)
    dsDatos: TDataSource;
    dblcTipoComprobante: TDBLookupComboBox;
    dbeSucursal: TDBEdit;
    dbeNumero: TDBEdit;
    dtpFecha: TDateTimePicker;
    dblcProveedor: TDBLookupComboBox;
    dbeImporte: TDBEdit;
    dbeUnidades: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dsTiposComprobantes: TDataSource;
    dsProveedores: TDataSource;
    procedure btnAceptarClick(Sender: TObject);
    procedure dtpFechaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComprobantesProveedores: TfrmComprobantesProveedores;

implementation

uses udmEstadoCtasCtesProveedores;

{$R *.dfm}

procedure TfrmComprobantesProveedores.btnAceptarClick(Sender: TObject);
begin
  inherited;
  // valido el alta del comprobante
  if (dbeSucursal.Text <> '') and (dbeNumero.Text <> '') and (dbeImporte.Text <> '')
  and (dbeUnidades.Text <> '') then
    ModalResult:=mrOK
  else
    application.MessageBox('Debe completar los campos requeridos',
    'Atención',MB_ICONERROR);
end;

procedure TfrmComprobantesProveedores.dtpFechaChange(Sender: TObject);
begin
  inherited;
  // cuando cambia la fecha actualizo
  dsDatos.DataSet.FieldByName('FECHA').AsDateTime:=dtpFecha.Date;
end;

procedure TfrmComprobantesProveedores.FormShow(Sender: TObject);
begin
  inherited;
  if dsDatos.DataSet.State = dsBrowse then
  // si está mostrando datos desactivo lo que hace falta
    begin
    dblcTipoComprobante.Enabled:=false;
    dtpFecha.Enabled:=false;
    dbeSucursal.Enabled:=false;
    dbeNumero.Enabled:=false;
    dblcProveedor.Enabled:=false;
    dbeImporte.Enabled:=false;
    dbeUnidades.Enabled:=false;
    btnAceptar.Enabled:=false;
    end;
  dtpFecha.Date:=dsDatos.DataSet.FieldByName('FECHA').AsDateTime;
end;

procedure TfrmComprobantesProveedores.FormCreate(Sender: TObject);
begin
  inherited;
  // cargo los tipos de comprobantes. No uso un procedimiento del dm porque
  // desde este form no tengo acceso
  dsTiposComprobantes.DataSet.Close;
  dsTiposComprobantes.DataSet.Open;
  dsTiposComprobantes.DataSet.Last;
  dsTiposComprobantes.DataSet.First;
end;

procedure TfrmComprobantesProveedores.FormDestroy(Sender: TObject);
begin
  inherited;
  // cierro los data set
  dsDatos.DataSet.Cancel;
  dsDatos.DataSet.Close;
  dsTiposComprobantes.DataSet.Close;
end;

end.
