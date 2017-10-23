unit UCadAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DB, StdCtrls, Buttons, sBitBtn, Grids, Wwdbigrd,
  Wwdbgrid, RzTabs, RzGroupBar, ComCtrls, DBCtrls, Mask, rxToolEdit,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RXDBCtrl, ZSequence,
  JvComponentBase, JvEnterTab, ExtCtrls, UCBase;

type
  TFrmCadAdicionais = class(TFrmCadPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    dbedtUNIDADE: TDBEdit;
    lblEstoque: TLabel;
    dbedtESTOQUE: TDBEdit;
    Label6: TLabel;
    dbcbbUNIDADE: TDBComboBox;
    ZAdicionais: TZQuery;
    DBDateEdit1: TDBDateEdit;
    ZAdicionaisCODIGO: TIntegerField;
    ZAdicionaisDESCRICAO: TStringField;
    ZAdicionaisVALOR: TFloatField;
    ZAdicionaisESTOQUE: TFloatField;
    ZAdicionaisUNIDADE: TStringField;
    ZSeqAdicionais: TZSequence;
    dsAdicionais: TDataSource;
    ZAdicionaisDATA_CADASTRO: TDateTimeField;
    Panel6: TPanel;
    Label18: TLabel;
    EditPesquisa: TEdit;
    RGCampos: TRadioGroup;
    btnBuscar: TBitBtn;
    UCControls1: TUCControls;
    lbl1: TLabel;
    dbcbbTIPO: TDBComboBox;
    ZAdicionaisPESO_LIQUIDO: TFloatField;
    ZAdicionaisPESO_BRUTO: TFloatField;
    ZAdicionaisTIPO: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dsAdicionaisStateChange(Sender: TObject);
    procedure GridVisualizacaoDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAdicionais: TFrmCadAdicionais;

implementation

uses
  UDM, UPrincipal;

{$R *.dfm}

procedure TFrmCadAdicionais.btnNovoClick(Sender: TObject);
begin
  inherited;
    ZAdicionais.Close;
    ZAdicionais.SQL.Clear;
    ZAdicionais.SQL.Add('SELECT * FROM ADICIONAIS');
    ZAdicionais.Open;
    ZAdicionais.Append;
    ZAdicionais.FieldByName('DATA_CADASTRO').AsDateTime := Date;
    DBEdit2.SetFocus;
end;

procedure TFrmCadAdicionais.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    ZAdicionais.Post;
    ZAdicionais.ApplyUpdates;
    Application.MessageBox('Dados salvos com sucesso.','Informação',MB_ICONINFORMATION+MB_OK);
    except on E:Exception do
    begin
        Application.MessageBox(PChar('Erro ao gravar dados. ' + #13+
                                     'Informações do Erro: ' + E.Message)
                                    ,'Erro',MB_ICONERROR + MB_OK);
        ZAdicionais.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadAdicionais.btnCancelarClick(Sender: TObject);
begin
  inherited;
    ZAdicionais.CancelUpdates;
end;

procedure TFrmCadAdicionais.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Confirma exclusão do registro?','Informação',MB_ICONQUESTION+MB_YESNO)=id_YES then
  begin
    try
      ZAdicionais.Delete;
      ZAdicionais.ApplyUpdates;
      Application.MessageBox('Registro excluido com sucesso.','Informação',MB_ICONINFORMATION+MB_OK);
      except on E:Exception do
      begin
          Application.MessageBox(PChar('Erro ao excluir registro. ' + #13+
                                       'Informações do Erro: ' + E.Message)
                                      ,'Erro',MB_ICONERROR + MB_OK);
          ZAdicionais.CancelUpdates;
      end;
    end;
  end;
end;

procedure TFrmCadAdicionais.btnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    ZAdicionais.Edit;
    except on E:Exception do
    begin
        Application.MessageBox(PChar('Erro ao alterar registro. ' + #13+
                                     'Informações do Erro: ' + E.Message)
                                    ,'Erro',MB_ICONERROR + MB_OK);
        ZAdicionais.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadAdicionais.btnLocalizarClick(Sender: TObject);
begin
  inherited;
      RzPageControl1.ActivePageIndex := 1;
end;

procedure TFrmCadAdicionais.dsAdicionaisStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled     :=  dsAdicionais.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled  :=  dsAdicionais.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled  :=  dsAdicionais.State in [dsBrowse]; //Alterar
  btnGravar.Enabled   :=  dsAdicionais.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled :=  dsAdicionais.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadAdicionais.GridVisualizacaoDblClick(Sender: TObject);
begin
  inherited;
     if ZAdicionais.FieldByName('ESTOQUE').AsFloat < 0 then
     begin
        lblEstoque.Font.Color := clRed;
        dbedtEstoque.Font.Color := clRed;
     end;

     if ZAdicionais.FieldByName('ESTOQUE').AsFloat > 0 then
     begin
        lblEstoque.Font.Color := clGreen;
        dbedtEstoque.Font.Color := clGreen;
     end;

      RzPageControl1.ActivePageIndex := 0;
end;

procedure TFrmCadAdicionais.btnBuscarClick(Sender: TObject);
begin
  inherited;
    ZAdicionais.Close;
    ZAdicionais.SQL.Clear;
    ZAdicionais.SQL.Add('SELECT * FROM ADICIONAIS');

    if RGCampos.ItemIndex = 0 then
    begin
      ZAdicionais.SQL.Add(' WHERE CODIGO =:PCODIGO');
      ZAdicionais.SQL.Add(' ORDER BY CODIGO ASC');
      ZAdicionais.ParamByName('PCODIGO').AsInteger := StrToInt(EditPesquisa.Text);

    end;

    if RGCampos.ItemIndex = 1 then
    begin
      ZAdicionais.SQL.Add(' WHERE DESCRICAO LIKE :PDESCRICAO');
      ZAdicionais.SQL.Add(' ORDER BY DESCRICAO ASC');
      ZAdicionais.ParamByName('PDESCRICAO').AsString := '%'+EditPesquisa.Text +'%';
    end;

    ZAdicionais.Open;
end;

procedure TFrmCadAdicionais.FormCreate(Sender: TObject);
begin
  inherited;
    ZAdicionais.Close;
    ZAdicionais.SQL.Clear;
    ZAdicionais.SQL.Add('SELECT * FROM ADICIONAIS');
    ZAdicionais.SQL.Add('ORDER BY DESCRICAO ASC');
    ZAdicionais.Open;
end;

end.
