unit UTipoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, StdCtrls;

type
  TFrmTipoPedido = class(TForm)
    btnLoja: TAdvGlowButton;
    btnViagem: TAdvGlowButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLojaClick(Sender: TObject);
    procedure btnViagemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoPedido: TFrmTipoPedido;

implementation

uses UFechaVenda;

{$R *.dfm}

procedure TFrmTipoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFrmTipoPedido.btnLojaClick(Sender: TObject);
begin
  FrmFechamentoVenda.vTipoPedido := 'TOMAR NA LOJA';
  FrmFechamentoVenda.btnFecharVendaClick(Sender);
  Close;
end;

procedure TFrmTipoPedido.btnViagemClick(Sender: TObject);
begin
  FrmFechamentoVenda.vTipoPedido := 'LEVAR PARA VIAGEM';
  FrmFechamentoVenda.btnFecharVendaClick(Sender);
  Close;
end;

procedure TFrmTipoPedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Exit;
end;

procedure TFrmTipoPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
    Exit;
  end;
end;

end.

