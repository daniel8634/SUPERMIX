program SuperMixPDV;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UFechaVenda in 'UFechaVenda.pas' {FrmFechamentoVenda},
  UAdicionais in 'UAdicionais.pas' {FrmAdicionais},
  UDM in 'UDM.pas' {DM: TDataModule},
  uResolucao in '..\Funcoes\uResolucao.pas',
  UBuscaProduto in 'UBuscaProduto.pas' {FrmBuscarProdutos},
  URegistro in 'URegistro.pas' {FrmAtivar},
  UProdutos in 'UProdutos.pas' {FrmProdutos},
  UListaAdicionais in 'UListaAdicionais.pas' {FrmListaAdicionais},
  UTipoPedido in 'UTipoPedido.pas' {FrmTipoPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
