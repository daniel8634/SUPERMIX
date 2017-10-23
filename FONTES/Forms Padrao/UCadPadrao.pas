unit UCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, sToolBar, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzTabs, RzGroupBar, Grids, Wwdbigrd, Wwdbgrid,
  RzButton, StdCtrls, Buttons, sBitBtn, sSkinManager, Mask, DBCtrls,
  JvComponentBase, JvEnterTab;

type
  TFrmCadPadrao = class(TForm)
    StatusBar1: TStatusBar;
    dsPadrao: TDataSource;
    RzGroupBar1: TRzGroupBar;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    GridVisualizacao: TwwDBGrid;
    btnNovo: TsBitBtn;
    btnGravar: TsBitBtn;
    btnCancelar: TsBitBtn;
    btnExcluir: TsBitBtn;
    btnLocalizar: TsBitBtn;
    btnSair: TsBitBtn;
    btnAlterar: TsBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MudaCor(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPadrao: TFrmCadPadrao;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFrmCadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmCadPadrao.MudaCor(Sender: TObject);
var nI: Integer;
begin
  for nI := 0 to ComponentCount - 1 do
  begin
    if (Components[nI] is TDBEdit) then
    begin
      if TDBEdit(Components[nI]).Focused then
        TDBEdit(Components[nI]).Color := clInfoBk
      else
        TDBEdit(Components[nI]).Color := clWhite;
    end;

    if (Components[nI] is TDBComboBox) then
    begin
      if TDBComboBox(Components[nI]).Focused then
        TDBComboBox(Components[nI]).Color := clInfoBk
      else
        TDBComboBox(Components[nI]).Color := clWhite;
    end;

  end;

end;

procedure TFrmCadPadrao.FormCreate(Sender: TObject);
var nI: Integer;
begin
  for nI := 0 to ComponentCount - 1 do
  begin
    if (Components[nI] is TDBEdit) then
      (Components[nI] as TDBEdit).OnEnter := MudaCor;

    if (Components[nI] is TDBComboBox) then
      (Components[nI] as TDBComboBox).OnEnter := MudaCor;
  end;

end;

procedure TFrmCadPadrao.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCadPadrao.dsPadraoStateChange(Sender: TObject);
var
  strStatus: string;
begin
  {:verifica o estado do CDS, ou seja em modo de insert, edit ou browser}
  case dsPadrao.DataSet.State of
    dsBrowse: strStatus := 'Formulário em modo de navegação.';
    dsEdit: strStatus := 'Formulário em modo de edição.';
    dsInsert: strStatus := 'Formulário em modo de inserção.';
    dsInactive: strStatus := 'Formulário em modo inativo';
  else
    strStatus := 'Formulário em outro modo';
  end;
  StatusBar1.Panels[0].Text := strStatus;

  {:Trata os botões no form Herdeiro}
  btnNovo.Enabled := dsPadrao.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled := dsPadrao.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled := dsPadrao.State in [dsBrowse]; //Alterar
  btnGravar.Enabled := dsPadrao.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled := dsPadrao.State in [dsInsert, dsEdit]; //Cancelar
  //btImprime.Enabled  := DsPadrao.State in [dsInsert,dsEdit];


end;

procedure TFrmCadPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13 
  If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key 
    Key:= #0; 
    Perform(Wm_NextDlgCtl,0,0); 
  end;
end;

end.

