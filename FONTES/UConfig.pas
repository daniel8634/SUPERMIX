unit UConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbImpressora: TComboBox;
    chbSenha: TCheckBox;
    chbEndereco: TCheckBox;
    chbOndeTomar: TCheckBox;
    Label2: TLabel;
    EditMensagem: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ZConfig: TZQuery;
    ZConfigSENHA_ATUAL: TIntegerField;
    ZConfigIMPRESSORA: TStringField;
    ZConfigIMP_SENHA_ATEND: TStringField;
    ZConfigIMP_END: TStringField;
    ZConfigIMP_ONDE_TOMAR: TStringField;
    ZConfigMSG_RODAPE: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PCarregaCampos;
    procedure PGravaCampos;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmConfig.BitBtn2Click(Sender: TObject);
begin
  if ZConfig.State in[dsEdit,dsInsert] then
  begin
    PGravaCampos;
    ZConfig.Post;
    ZConfig.ApplyUpdates;
  end
  else
  begin
    Application.MessageBox('Altere antes o registro, clicando no botão "Alterar".','Informação',MB_ICONINFORMATION+MB_OK);
    Exit;
  end;
end;

procedure TFrmConfig.BitBtn3Click(Sender: TObject);
begin
    ZConfig.Edit;
    cbImpressora.SetFocus;

    ZConfig.Edit;
    cbImpressora.SetFocus;
end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
    ZConfig.Close;
    ZConfig.Open;

    PCarregaCampos;
end;

procedure TFrmConfig.PCarregaCampos;
begin
    cbImpressora.Text := ZConfig.FieldByName('IMPRESSORA').AsString;

    if ZConfig.FieldByName('IMP_SENHA_ATEND').AsString = 'S' then
      chbSenha.Checked := True
    else
      chbSenha.Checked := False;


    if ZConfig.FieldByName('IMP_END').AsString = 'S' then
      chbEndereco.Checked := True
    else
      chbEndereco.Checked := False;


    if ZConfig.FieldByName('IMP_ONDE_TOMAR').AsString = 'S' then
      chbOndeTomar.Checked := True
    else
      chbOndeTomar.Checked := False;

    EditMensagem.Text := ZConfig.FieldByName('MSG_RODAPE').AsString;

end;

procedure TFrmConfig.PGravaCampos;
begin
    ZConfig.FieldByName('IMPRESSORA').AsString := cbImpressora.Text;

    if chbSenha.Checked then
      ZConfig.FieldByName('IMP_SENHA_ATEND').AsString := 'S'
    else
      ZConfig.FieldByName('IMP_SENHA_ATEND').AsString := 'N';


    if chbEndereco.Checked then
      ZConfig.FieldByName('IMP_END').AsString := 'S'
    else
      ZConfig.FieldByName('IMP_END').AsString := 'N';


    if chbOndeTomar.Checked then
      ZConfig.FieldByName('IMP_ONDE_TOMAR').AsString := 'S'
    else
      ZConfig.FieldByName('IMP_ONDE_TOMAR').AsString := 'N';

    ZConfig.FieldByName('MSG_RODAPE').AsString := EditMensagem.Text;
end;

end.
