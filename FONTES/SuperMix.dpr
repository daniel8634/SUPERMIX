program SuperMix;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCadPadrao in 'Forms Padrao\UCadPadrao.pas' {FrmCadPadrao},
  UCadProdutos in 'UCadProdutos.pas' {FrmCadProduto},
  UCadAdicionais in 'UCadAdicionais.pas' {FrmCadAdicionais},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadEmpresa in 'UCadEmpresa.pas' {FrmCadEmpresa},
  URelVendas_Periodo in 'URelVendas_Periodo.pas' {FrmVendasPeriodo},
  USobre in 'USobre.pas' {FrmSobre},
  URegistro in 'URegistro.pas' {FrmAtivar},
  UCadCategorias in 'UCadCategorias.pas' {FrmCadCategorias},
  UCat_x_Produtos in 'UCat_x_Produtos.pas' {FrmCat_Prod},
  UCadCliente in 'UCadCliente.pas' {FrmCadCliente},
  UCadCombo in 'UCadCombo.pas' {FrmCadCombo},
  ULocAdicionais in 'ULocAdicionais.pas' {FrmLocAdicionais},
  UConfig in 'UConfig.pas' {FrmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SUPERMIX';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmConfig, FrmConfig);
  Application.Run;
end.
