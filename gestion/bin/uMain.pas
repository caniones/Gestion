unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, IB, ShellApi, WinInet;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    Archivo1: TMenuItem;
    SALIR1: TMenuItem;
    Proveedores1: TMenuItem;
    Artculos1: TMenuItem;
    Actualizacin1: TMenuItem;
    Actualizacin2: TMenuItem;
    Rubros1: TMenuItem;
    Lineas1: TMenuItem;
    Clientes1: TMenuItem;
    Ventas1: TMenuItem;
    Caja1: TMenuItem;
    Gastos1: TMenuItem;
    Estadsticas1: TMenuItem;
    Remito1: TMenuItem;
    Actualizacin3: TMenuItem;
    N1: TMenuItem;
    lCopyleft: TLabel;
    Titulos1: TMenuItem;
    ReciboCtasCtes1: TMenuItem;
    N2: TMenuItem;
    EstadodeCuentasCorrientes1: TMenuItem;
    N3: TMenuItem;
    Cierresdeturnosanteriores1: TMenuItem;
    Cierredeturno1: TMenuItem;
    Reportes1: TMenuItem;
    Listadeprecios1: TMenuItem;
    Stock1: TMenuItem;
    N4: TMenuItem;
    AnularComprobante1: TMenuItem;
    ReImprimirComprobante1: TMenuItem;
    btnSalir: TSpeedButton;
    NotadeCrdito1: TMenuItem;
    ReportedePagos1: TMenuItem;
    ReportedeGastos1: TMenuItem;
    N5: TMenuItem;
    Cheques1: TMenuItem;
    VentasMensualesAnuales1: TMenuItem;
    DepositosBancarios1: TMenuItem;
    EstadodeCuentasCorrientes2: TMenuItem;
    EstadoCargaArticulos1: TMenuItem;
    Presupuesto1: TMenuItem;
    N6: TMenuItem;
    Monedas1: TMenuItem;
    procedure SALIR1Click(Sender: TObject);
    procedure Rubros1Click(Sender: TObject);
    procedure Lineas1Click(Sender: TObject);
    procedure Actualizacin1Click(Sender: TObject);
    procedure Actualizacin2Click(Sender: TObject);
    procedure Actualizacin3Click(Sender: TObject);
    procedure lCopyleftMouseLeave(Sender: TObject);
    procedure lCopyleftMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lCopyleftClick(Sender: TObject);
    procedure Gastos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Titulos1Click(Sender: TObject);
    procedure Remito1Click(Sender: TObject);
    procedure ReciboCtasCtes1Click(Sender: TObject);
    procedure EstadodeCuentasCorrientes1Click(Sender: TObject);
    procedure Cierresdeturnosanteriores1Click(Sender: TObject);
    procedure Cierredeturno1Click(Sender: TObject);
    procedure Listadeprecios1Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure AnularComprobante1Click(Sender: TObject);
    procedure ReImprimirComprobante1Click(Sender: TObject);
    procedure NotadeCrdito1Click(Sender: TObject);
    procedure ReportedePagos1Click(Sender: TObject);
    procedure ReportedeGastos1Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure VentasMensualesAnuales1Click(Sender: TObject);
    procedure DepositosBancarios1Click(Sender: TObject);
    procedure EstadodeCuentasCorrientes2Click(Sender: TObject);
    procedure EstadoCargaArticulos1Click(Sender: TObject);
    procedure Presupuesto1Click(Sender: TObject);
    procedure Monedas1Click(Sender: TObject);
  private
    { Private declarations }
    function hayInternet():boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation                  

uses dmConex, uABMrubros, uABMlineas, uABMproveedores, uABMclientes,
  uABMarticulos, uAcerca, uGastos, uABMtitulos,
  uComprobantesVentas, uRecibosClientes, uEstadoCtasCtesClientes,
  udmCierreTurno, uCierresTurnos, uRepCierreTurno, uFiltroArticulos,
  uComprobantesAdmin, uFiltroFecha, uPagos, uPublicos,
  uEstadisticasVentas, uEstadoCtasCtesProveedores, uEstadoCargaArticulos,
  uMonedas;

{$R *.dfm}


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // configuracion inicial del sistema
  DecimalSeparator:='.';
  ThousandSeparator:=',';
  DateSeparator:='.';
  ShortDateFormat:='dd/mm/yy';
  LongDateFormat:='dd/mm/yyyy';
  ShortTimeFormat:='hh:mm am/pm';
  LongTimeFormat:='hh:mm am/pm';
  // titulo del sistema
  self.Caption:=self.Caption+uPublicos.LeerIni(ChangeFileExt(
    Application.ExeName,'.INI'), 'CONF','CAPTION','');
end;

//---------------------------- acciones del MENU ----------------------------//

procedure TfrmMain.SALIR1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.Rubros1Click(Sender: TObject);
var
  FRubros:TfrmABMrubros;
begin
  FRubros:=TfrmABMrubros.Create(self);
  try
    FRubros.ShowModal;
  finally
    FRubros.Free;
  end;
end;

procedure TfrmMain.Lineas1Click(Sender: TObject);
var
  FLineas:TfrmABMlineas;
begin
  FLineas:=TfrmABMlineas.Create(self);
  try
    FLineas.ShowModal;
  finally
    FLineas.Free;
  end;
end;

procedure TfrmMain.Titulos1Click(Sender: TObject);
var
  FTitulos:TfrmABMtitulos;
begin
  FTitulos:=TfrmABMtitulos.Create(self);
  try
    FTitulos.ShowModal;
  finally
    FTitulos.Free;
  end;
end;

procedure TfrmMain.Actualizacin1Click(Sender: TObject);
var
  FArticulos:TfrmABMarticulos;
begin
  try
    if dmConexion.conectarPorUsuario then // procedure para login de usuarios
      begin
      // usuarios correcto creo el form
      FArticulos:=TfrmABMarticulos.Create(self);
      try
        FArticulos.ShowModal;
      finally
        FArticulos.Free;
        dmConexion.conectarPorDefecto; // conecto por defecto al salir del form
      end;
      end
    else
      dmConexion.conectarPorDefecto;
  except
    on EIBClientError do
      dmConexion.conectarPorDefecto;
  end;
end;

procedure TfrmMain.Actualizacin2Click(Sender: TObject);
var
  FProveedores:TfrmABMproveedores;
begin
  FProveedores:=TfrmABMproveedores.Create(self);
  try
    FProveedores.ShowModal;
  finally
    FProveedores.Free;
  end;
end;

procedure TfrmMain.Actualizacin3Click(Sender: TObject);
var
  FClientes:TfrmABMclientes;
begin
  FClientes:=TfrmABMclientes.Create(self);
  try
    FClientes.ShowModal;
  finally
    FClientes.Free;
  end;
end;

procedure TfrmMain.Gastos1Click(Sender: TObject);
var
  FGastos:TfrmGastos;
begin
  FGastos:=TfrmGastos.Create(self);
  try
    FGastos.ShowModal;
  finally
    FGastos.Free;
  end;
end;

procedure TfrmMain.Remito1Click(Sender: TObject);
var
  FComprobantes:TfrmComprobantesVentas;
begin
  FComprobantes:=TfrmComprobantesVentas.Create(self);
  try
    // indico el tipo de comprobante
    FComprobantes.nuevoRemito;
    FComprobantes.ShowModal;
  finally
    FComprobantes.Free;
  end;
end;

procedure TfrmMain.Presupuesto1Click(Sender: TObject);
var
  FComprobantes:TfrmComprobantesVentas;
begin
  FComprobantes:=TfrmComprobantesVentas.Create(self);
  try
    // indico el tipo de comprobante
    FComprobantes.nuevoPresupuesto;
    FComprobantes.ShowModal;
  finally
    FComprobantes.Free;
  end;
end;

procedure TfrmMain.ReciboCtasCtes1Click(Sender: TObject);
var
  FRecibosClientes:TfrmRecibosClientes;
begin
  FRecibosClientes:=TfrmRecibosClientes.Create(self);
  try
    FRecibosClientes.ShowModal;
  finally
    FRecibosClientes.Free;
  end;
end;

procedure TfrmMain.EstadodeCuentasCorrientes1Click(Sender: TObject);
var
  FEstadoCtasCtesClientes:TfrmEstadoCtasCtesClientes;
begin
  FEstadoCtasCtesClientes:=TfrmEstadoCtasCtesClientes.Create(self);
  try
    FEstadoCtasCtesClientes.ShowModal;
  finally
    FEstadoCtasCtesClientes.Free;
  end;
end;

procedure TfrmMain.Cierresdeturnosanteriores1Click(Sender: TObject);
var
  FCierresTurnos:TfrmCierresTurnos;
begin
  FCierresTurnos:=TfrmCierresTurnos.Create(self);
  try
    FCierresTurnos.ShowModal;
  finally
    FCierresTurnos.Free;
  end;
end;

procedure TfrmMain.Cierredeturno1Click(Sender: TObject);
var
  dmCierre:TdmCierreTurno;
  idCierre:integer;
  FRepCierreTurno:TfrmRepCierreTurno;
begin
  if application.MessageBox('¿Seguro que desea cerrar el turno?',
    'Atención',MB_YESNO + mb_IconQuestion)= 6 Then
    begin
    try
      dmCierre:=TdmCierreTurno.Create(self);
      dmCierre.cerrarTurno(idCierre);
      //imprimo el cierre de caja
      FRepCierreTurno:=TfrmRepCierreTurno.Create(self);
      try
        FRepCierreTurno.ver(idCierre);
      finally
        FRepCierreTurno.Free;
      end;
    finally
      dmCierre.Free;
    end;
    end;
end;

procedure TfrmMain.Listadeprecios1Click(Sender: TObject);
var
  FFiltroArticulos:TfrmFiltroArticulos;
begin
  FFiltroArticulos:=TfrmFiltroArticulos.Create(self);
  FFiltroArticulos.verComo('PRECIO');
  try
    FFiltroArticulos.ShowModal;
  finally
    FFiltroArticulos.Free;
  end;
end;

procedure TfrmMain.Stock1Click(Sender: TObject);
var
  FFiltroArticulos:TfrmFiltroArticulos;
begin
  FFiltroArticulos:=TfrmFiltroArticulos.Create(self);
  FFiltroArticulos.verComo('STOCK');
  try
    FFiltroArticulos.ShowModal;
  finally
    FFiltroArticulos.Free;
  end;
end;
                                                                    
procedure TfrmMain.AnularComprobante1Click(Sender: TObject);
var
  FAnular:TfrmComprobantesAdmin;
begin
  FAnular:=TfrmComprobantesAdmin.Create(self);
  FAnular.verComo('ANULAR');
  try
    FAnular.ShowModal;
  finally
    FAnular.Free;
  end;
end;

procedure TfrmMain.ReImprimirComprobante1Click(Sender: TObject);
var
  FAnular:TfrmComprobantesAdmin;
begin
  FAnular:=TfrmComprobantesAdmin.Create(self);
  FAnular.verComo('REIMPRIMIR');
  try
    FAnular.ShowModal;
  finally
    FAnular.Free;
  end;
end;

procedure TfrmMain.ReportedePagos1Click(Sender: TObject);
var
  FFiltroFecha:TfrmFiltroFecha;
begin
  FFiltroFecha:=TfrmFiltroFecha.Create(self);
  FFiltroFecha.verComo('PAGO');
  try
    FFiltroFecha.ShowModal;
  finally
    FFiltroFecha.Free;
  end;
end;

procedure TfrmMain.ReportedeGastos1Click(Sender: TObject);
var
  FFiltroFecha:TfrmFiltroFecha;
begin
  FFiltroFecha:=TfrmFiltroFecha.Create(self);
  FFiltroFecha.verComo('GASTO');
  try
    FFiltroFecha.ShowModal;
  finally
    FFiltroFecha.Free;
  end;
end;

procedure TfrmMain.NotadeCrdito1Click(Sender: TObject);
var
  FComprobantes:TfrmComprobantesVentas;
begin
  // ------------- NOTA DE CREDITO -------------
  FComprobantes:=TfrmComprobantesVentas.Create(self);
  try
    // indico el tipo de comprobante
    FComprobantes.nuevaNotaCredito;
    FComprobantes.ShowModal;
  finally
    FComprobantes.Free;
  end;
end;

procedure TfrmMain.Cheques1Click(Sender: TObject);
var
  FPagos:TfrmPagos;
begin
  FPagos:=TfrmPagos.Create(self);
  FPagos.verComo('CHEQUE');
  try
    FPagos.ShowModal;
  finally
    FPagos.Free;
  end;
end;

procedure TfrmMain.DepositosBancarios1Click(Sender: TObject);
var
  FPagos:TfrmPagos;
begin
  FPagos:=TfrmPagos.Create(self);
  FPagos.verComo('DEPOSITO');
  try
    FPagos.ShowModal;
  finally
    FPagos.Free;
  end;
end;

procedure TfrmMain.VentasMensualesAnuales1Click(Sender: TObject);
var
  FVentas:TfrmEstadisticasVentas;
begin
  FVentas:=TfrmEstadisticasVentas.Create(self);
  try
    FVentas.ShowModal;
  finally
    FVentas.Free;
  end;
end;

procedure TfrmMain.EstadodeCuentasCorrientes2Click(Sender: TObject);
var
  FEstadoCtasCtesProveedores:TfrmEstadoCtasCtesProveedores;
begin
  // ESTADO DE CUENTAS CORRIENTES PROVEEDORES
  FEstadoCtasCtesProveedores:=TfrmEstadoCtasCtesProveedores.Create(self);
  try
    FEstadoCtasCtesProveedores.ShowModal;
  finally
    FEstadoCtasCtesProveedores.Free;
  end;
end;

procedure TfrmMain.EstadoCargaArticulos1Click(Sender: TObject);
var
  FEstadoCargaArticulos:TfrmEstadoCargaArticulos;
begin
  // reporte para verificar los artículos que se van cargando
  FEstadoCargaArticulos:=TfrmEstadoCargaArticulos.Create(self);
  try
    FEstadoCargaArticulos.ShowModal;
  finally
    FEstadoCargaArticulos.Free;
  end;
end;

procedure TfrmMain.Monedas1Click(Sender: TObject);
var
  FMonedas:TfrmMonedas;
begin
  FMonedas:=TfrmMonedas.Create(self);
  try
    FMonedas.ShowModal;
  finally
    FMonedas.Free;
  end;
end;

//---------------------------- seccion ACERCA DE ----------------------------//

procedure TfrmMain.lCopyleftMouseLeave(Sender: TObject);
begin
  lCopyleft.Font.Style:=[fsBold];
end;

procedure TfrmMain.lCopyleftMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lCopyleft.Font.Style:=[fsUnderLine, fsBold];
end;

procedure TfrmMain.lCopyleftClick(Sender: TObject);
var
  url :string;
  FAcerca :TfrmAcerca;
begin
{  if self.hayInternet then
    url:='http://4cuatros.com.ar'
  else
    begin
    FAcerca:=TfrmAcerca.Create(self);
    FAcerca.ShowModal;
    FAcerca.Free;
    end;
  ShellExecute(0, 'open', pchar(url), nil, nil, SW_NORMAL);}
end;

function TfrmMain.hayInternet: boolean;
var
  Estado: Cardinal;
begin
  Estado := INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@Estado, 0);
end;

//---------------------------- seccion SALIR ----------------------------//

procedure TfrmMain.btnSalirClick(Sender: TObject);
begin
  close();
end;

end.
