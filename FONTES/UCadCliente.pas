unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, JvComponentBase, JvEnterTab, DB, StdCtrls, Buttons,
  sBitBtn, Grids, Wwdbigrd, Wwdbgrid, RzTabs, RzGroupBar, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask, DBCtrls, ExtCtrls;

type
  TFrmCadCliente = class(TFrmCadPadrao)
    dsCliente: TDataSource;
    ZCliente: TZQuery;
    ZCodCliente: TZQuery;
    ZCodClienteCODIGO: TIntegerField;
    ZClienteCODIGO: TIntegerField;
    ZClienteNOME: TStringField;
    ZClienteENDERECO: TStringField;
    ZClienteNUMERO: TStringField;
    ZClienteBAIRRO: TStringField;
    ZClienteCIDADE: TStringField;
    ZClienteUF: TStringField;
    ZClienteCEP: TStringField;
    ZClienteTELEFONE: TStringField;
    ZClienteCELULAR: TStringField;
    ZClienteDATA_CADASTRO: TDateTimeField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    dbedtCELULAR: TDBEdit;
    Panel6: TPanel;
    lblConteudo: TLabel;
    EditPesquisa: TEdit;
    RGCampos: TRadioGroup;
    btnBuscar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure GridVisualizacaoDblClick(Sender: TObject);
    procedure RGCamposClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  RzPageControl1.ActivePageIndex := 0;

  ZCodCliente.Close;
  ZCodCliente.Open;

  ZCliente.Append;
  ZCliente.FieldByName('CODIGO').AsInteger := ZCodCliente.FieldByName('CODIGO').AsInteger + 1;
  ZCliente.FieldByName('DATA_CADASTRO').AsDateTime := Date;
  DBEdit2.SetFocus;
end;

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
    ZCliente.Close;
    ZCliente.Open;
end;

procedure TFrmCadCliente.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    ZCliente.Post;
    ZCliente.ApplyUpdates;
    Application.MessageBox('Dados salvos com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao gravar dados. ' + #13 +
                                   'Informações do Erro: ' + E.Message)
                                  ,'Erro', MB_ICONERROR + MB_OK);
      ZCliente.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
    ZCliente.CancelUpdates;
end;

procedure TFrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if ZCliente.IsEmpty then
  begin
    Application.MessageBox('Sem registro para excluir.','Informação',MB_ICONINFORMATION+MB_OK);
    Exit;
  end;

  if not (ZCliente.IsEmpty) then
  begin
    if Application.MessageBox('Confirma exclusão do registro?', 'Informação', MB_ICONQUESTION + MB_YESNO) = id_YES then
    begin
      try
        ZCliente.Delete;
        ZCliente.ApplyUpdates;
        Application.MessageBox('Registro excluido com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
      except on E: Exception do
        begin
          Application.MessageBox(PChar('Erro ao excluir registro. ' + #13 +
            'Informações do Erro: ' + E.Message)
            , 'Erro', MB_ICONERROR + MB_OK);
          ZCliente.CancelUpdates;
        end;
      end;

    end;
  end
  else
  begin
    Application.MessageBox('Nenhum registro a ser excluido!', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;
end;

procedure TFrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    ZCliente.Edit;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao alterar registro. ' + #13 +
        'Informações do Erro: ' + E.Message)
        , 'Erro', MB_ICONERROR + MB_OK);
      ZCliente.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadCliente.dsClienteStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := dsCliente.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled := dsCliente.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled := dsCliente.State in [dsBrowse]; //Alterar
  btnGravar.Enabled := dsCliente.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled := dsCliente.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadCliente.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  ZCliente.Close;
  ZCliente.Open;
  RzPageControl1.ActivePageIndex := 1;
 // EditPesquisa.Clear;
//  EditPesquisa.SetFocus;
end;

procedure TFrmCadCliente.GridVisualizacaoDblClick(Sender: TObject);
begin
  inherited;
  RzPageControl1.ActivePageIndex := 0;
end;

procedure TFrmCadCliente.RGCamposClick(Sender: TObject);
begin
  inherited;
   if RGCampos.ItemIndex = 0 then
      lblConteudo.Caption := 'Buscar por código';

   if RGCampos.ItemIndex = 1 then
      lblConteudo.Caption := 'Buscar por nome';

  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

procedure TFrmCadCliente.btnBuscarClick(Sender: TObject);
begin
  inherited;
  ZCliente.Close;
  ZCliente.SQL.Clear;
  ZCliente.SQL.Add('SELECT * FROM CLIENTES');

  if RGCampos.ItemIndex = 0 then
  begin
    ZCliente.SQL.Add(' WHERE CODIGO =:PCODIGO');
    ZCliente.SQL.Add(' ORDER BY CODIGO ASC');
    ZCliente.ParamByName('PCODIGO').AsInteger := StrToInt(EditPesquisa.Text);

  end;

  if RGCampos.ItemIndex = 1 then
  begin
    ZCliente.SQL.Add(' WHERE NOME LIKE :PNOME');
    ZCliente.SQL.Add(' ORDER BY NOME ASC');
    ZCliente.ParamByName('PNOME').AsString := '%' + EditPesquisa.Text + '%';
  end;

  ZCliente.Open;
end;

end.
