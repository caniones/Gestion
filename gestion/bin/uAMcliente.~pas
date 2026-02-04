unit uAMcliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls, jpeg;

type
  TfrmImputCliente = class(TfrmImput)
    dsClientes: TDataSource;
    GroupBox1: TGroupBox;
    dblcSituacion: TDBLookupComboBox;
    dbeNombre: TDBEdit;
    dbeDireccion: TDBEdit;
    dbeCodigoPostal: TDBEdit;
    dblcLocalidad: TDBLookupComboBox;
    dbeTelFijo: TDBEdit;
    dbeTelMovil: TDBEdit;
    dbetelTrabajo: TDBEdit;
    dbeTelFax: TDBEdit;
    dbeMail: TDBEdit;
    dbeLimiteCredito: TDBEdit;
    dbeSaldoInicial: TDBEdit;
    GroupBox2: TGroupBox;
    dbtFechaIngreso: TDBText;
    dbtFechaBaja: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dsSituacion: TDataSource;
    dsLocalidades: TDataSource;
    btnRecuperar: TBitBtn;
    Label15: TLabel;
    dbeCuit: TDBEdit;
    dbeInteres: TDBEdit;
    Label16: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRecuperarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnRecuperarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImputCliente: TfrmImputCliente;

implementation

uses udmClientes;

{$R *.dfm}

procedure TfrmImputCliente.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if (dblcSituacion.KeyValue > 0) and (dbeNombre.Text <> '') and
    (dbeDireccion.Text <> '') and (dblcLocalidad.KeyValue > 0) and
    (dbeCuit.Text <> '') and (dbeInteres.Text <> '') then
    Modalresult:= mrOK
  else
    application.MessageBox('Debe completar todos los campos marcados en color'+
    ' Naranja','Atención',MB_ICONERROR);
end;

procedure TfrmImputCliente.FormShow(Sender: TObject);
begin
  inherited;
  if dsClientes.DataSet.State = dsEdit then
    begin
    self.Caption:= self.Caption+' - Modificación de datos';
    dbeSaldoInicial.Enabled:=false;
    if not dsClientes.DataSet.FieldByName('FECHA_BAJA').IsNull then
      btnRecuperar.Visible:=true;
    end;
  if dsClientes.DataSet.State = dsInsert then
    begin
    self.Caption:= self.Caption+' - Alta de datos';
    end;
  dblcSituacion.SetFocus;
end;

procedure TfrmImputCliente.btnRecuperarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btnRecuperar.Hint:='Recupera el registro dado de baja';
end;

procedure TfrmImputCliente.btnRecuperarClick(Sender: TObject);
begin
  inherited;
  dsClientes.DataSet.FieldByName('FECHA_BAJA').Clear;
end;

end.
