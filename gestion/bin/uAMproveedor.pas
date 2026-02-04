unit uAMproveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uImputForm, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, jpeg;

type
  TfrmImputProveedor = class(TfrmImput)
    dsProveedores: TDataSource;
    dblcSituacion: TDBLookupComboBox;
    dbeNombreFantasia: TDBEdit;
    dbeNombreReal: TDBEdit;
    dbeDireccion: TDBEdit;
    dblcLocalidad: TDBLookupComboBox;
    dbeCodigoPostal: TDBEdit;
    GroupBox1: TGroupBox;
    dbeTelefono1: TDBEdit;
    dbeTelefono2: TDBEdit;
    dbeTelefono3: TDBEdit;
    dbeNumeroFax: TDBEdit;
    dbeMail: TDBEdit;
    dsSituaciones: TDataSource;
    dsLocalidades: TDataSource;
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
    Image1: TImage;
    Label12: TLabel;
    dbtFechaBaja: TDBText;
    btnRecuperar: TBitBtn;
    dbeCuit: TDBEdit;
    Label13: TLabel;
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
  frmImputProveedor: TfrmImputProveedor;

implementation

uses udmProveedores;

{$R *.dfm}

procedure TfrmImputProveedor.btnAceptarClick(Sender: TObject);
begin
  inherited;
  if (dblcSituacion.KeyValue > 0) and (dbeNombreFantasia.Text <> '') and
    (dbeNombreReal.Text <> '') and (dbeDireccion.Text <> '') and
    (dblcLocalidad.KeyValue > 0) and (dbeCuit.Text <> '') then
    Modalresult:= mrOK
  else
    application.MessageBox('Debe completar todos los campos marcados en color'+
    ' Naranja','Atención',MB_ICONERROR);
end;

procedure TfrmImputProveedor.FormShow(Sender: TObject);
begin
  inherited;
  if dsProveedores.DataSet.State = dsEdit then
    begin
    self.Caption:= self.Caption+' - Modificación de datos';
    if not (dsProveedores.DataSet.FieldByName('FECHA_BAJA').IsNull) then
      btnRecuperar.Visible:=true;
    end;
  if dsProveedores.DataSet.State = dsInsert then
    begin
    self.Caption:= self.Caption+' - Alta de datos';
    end;
  dblcSituacion.SetFocus;
end;

procedure TfrmImputProveedor.btnRecuperarClick(Sender: TObject);
begin
  inherited;
  dsProveedores.DataSet.FieldByName('FECHA_BAJA').Clear;
end;

procedure TfrmImputProveedor.btnRecuperarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btnRecuperar.Hint:='Recupera el registro dado de baja';
end;


end.
