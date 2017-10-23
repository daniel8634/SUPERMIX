unit UCadCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, JvComponentBase, JvEnterTab, DB, StdCtrls, Buttons,
  sBitBtn, Grids, Wwdbigrd, Wwdbgrid, RzTabs, RzGroupBar, ComCtrls, Mask,
  DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls,
  ExtDlgs;

type
  TFrmCadCategorias = class(TFrmCadPadrao)
    Label1: TLabel;
    dbedtCODIGO: TDBEdit;
    Label2: TLabel;
    dbedtDESCRICAO: TDBEdit;
    ZCategorias: TZQuery;
    ZCodigo: TZQuery;
    ZCategoriasCODIGO: TIntegerField;
    ZCategoriasDESCRICAO: TStringField;
    grp1: TGroupBox;
    img1: TImage;
    pnl4: TPanel;
    btnAdicionarFoto: TSpeedButton;
    btnExcluirFoto: TSpeedButton;
    ZCategoriasIMAGEM: TStringField;
    dsCategorias: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel6: TPanel;
    Label18: TLabel;
    EditPesquisa: TEdit;
    RGCampos: TRadioGroup;
    btnBuscar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAdicionarFotoClick(Sender: TObject);
    procedure btnExcluirFotoClick(Sender: TObject);
    procedure GridVisualizacaoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsCategoriasStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCategorias: TFrmCadCategorias;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmCadCategorias.btnNovoClick(Sender: TObject);
begin
  inherited;
  ZCategorias.Open;
  ZCategorias.Append;
  ZCodigo.Close;
  ZCodigo.Open;

  ZCategorias.FieldByName('CODIGO').AsInteger := ZCodigo.FieldByName('CODIGO').AsInteger + 1;
end;

procedure TFrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    ZCategorias.Post;
    ZCategorias.ApplyUpdates;
    Application.MessageBox('Dados salvos com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao gravar dados. ' + #13 +
        'Informações do Erro: ' + E.Message)
        , 'Erro', MB_ICONERROR + MB_OK);
      ZCategorias.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadCategorias.btnAdicionarFotoClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
  begin
    img1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'IMAGENS') then
      CreateDir(ExtractFilePath(Application.ExeName) + 'IMAGENS');

    if DirectoryExists(ExtractFilePath(Application.ExeName) + 'IMAGENS') then
      CopyFile(Pchar(OpenPictureDialog1.FileName), PChar(ExtractFilePath(Application.ExeName) + 'IMAGENS\' + ExtractFileName(OpenPictureDialog1.FileName)), False);

    ZCategorias.FieldByName('IMAGEM').AsString := ExtractFilePath(Application.ExeName) + 'IMAGENS\' + ExtractFileName(OpenPictureDialog1.FileName); //OpenPictureDialog1.FileName;
  end;
end;

procedure TFrmCadCategorias.btnExcluirFotoClick(Sender: TObject);
begin
  inherited;
  if not (ZCategorias.IsEmpty) then
  begin
    ZCategorias.Edit;
    ZCategorias.FieldByName('IMAGEM').AsString := '';
    ZCategorias.Post;
    ZCategorias.ApplyUpdates;

  end
  else
  begin
    Application.MessageBox('Busque um produtos antes.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;
end;

procedure TFrmCadCategorias.GridVisualizacaoDblClick(Sender: TObject);
begin
  inherited;
  if ZCategorias.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(ZCategorias.FieldByName('IMAGEM').AsString) then
      img1.Picture.LoadFromFile(ZCategorias.FieldByName('IMAGEM').AsString)
    else
      img1.Picture := nil;
  end
  else
  begin
    img1.Picture := nil;
  end;
  RzPageControl1.ActivePageIndex := 0;
end;

procedure TFrmCadCategorias.FormShow(Sender: TObject);
begin
  inherited;
  if ZCategorias.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(ZCategorias.FieldByName('IMAGEM').AsString) then
      img1.Picture.LoadFromFile(ZCategorias.FieldByName('IMAGEM').AsString)
    else
      img1.Picture := nil;
  end
  else
  begin
    img1.Picture := nil;
  end;
end;

procedure TFrmCadCategorias.dsCategoriasStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := dsCategorias.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled := dsCategorias.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled := dsCategorias.State in [dsBrowse]; //Alterar
  btnGravar.Enabled := dsCategorias.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled := dsCategorias.State in [dsInsert, dsEdit]; //Cancelar
  btnAdicionarFoto.Enabled := dsCategorias.State in [dsInsert, dsEdit]; //Cancelar
  btnExcluirFoto.Enabled := dsCategorias.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadCategorias.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ZCategorias.CancelUpdates;
end;


procedure TFrmCadCategorias.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Confirma exclusão do registro?', 'Informação', MB_ICONQUESTION + MB_YESNO) = id_YES then
  begin
    try

      ZCategorias.Delete;
      ZCategorias.ApplyUpdates;
      Application.MessageBox('Registro excluido com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
    except on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao excluir registro. ' + #13 +
          'Informações do Erro: ' + E.Message)
          , 'Erro', MB_ICONERROR + MB_OK);
        ZCategorias.CancelUpdates;
      end;
    end;
  end;
end;

procedure TFrmCadCategorias.btnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    ZCategorias.Edit;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao alterar registro. ' + #13 +
        'Informações do Erro: ' + E.Message)
        , 'Erro', MB_ICONERROR + MB_OK);
      ZCategorias.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadCategorias.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  ZCategorias.Close;
  ZCategorias.Open;
  RzPageControl1.ActivePageIndex := 1;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

procedure TFrmCadCategorias.btnBuscarClick(Sender: TObject);
begin
  inherited;
  ZCategorias.Close;
  ZCategorias.SQL.Clear;
  ZCategorias.SQL.Add('SELECT * FROM CATEGORIAS');

  if RGCampos.ItemIndex = 0 then
  begin
    ZCategorias.SQL.Add(' WHERE CODIGO =:PCODIGO');
    ZCategorias.SQL.Add(' ORDER BY CODIGO ASC');
    ZCategorias.ParamByName('PCODIGO').AsInteger := StrToInt(EditPesquisa.Text);

  end;

  if RGCampos.ItemIndex = 1 then
  begin
    ZCategorias.SQL.Add(' WHERE DESCRICAO LIKE :PDESCRICAO');
    ZCategorias.SQL.Add(' ORDER BY DESCRICAO ASC');
    ZCategorias.ParamByName('PDESCRICAO').AsString := '%' + EditPesquisa.Text + '%';
  end;

  ZCategorias.Open;
end;

end.

