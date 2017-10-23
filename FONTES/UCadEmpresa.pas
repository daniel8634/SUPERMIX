unit UCadEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, JvComponentBase, JvEnterTab, DB, StdCtrls, Buttons,
  sBitBtn, Grids, Wwdbigrd, Wwdbgrid, RzTabs, RzGroupBar, ComCtrls, Mask,
  DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSequence,
  UCBase;

type
  TFrmCadEmpresa = class(TFrmCadPadrao)
    Label1: TLabel;
    dbedtCODIGO: TDBEdit;
    Label2: TLabel;
    dbedtRAZAO_SOCIAL: TDBEdit;
    Label3: TLabel;
    dbedtNOME_FANTASIA: TDBEdit;
    Label4: TLabel;
    dbedtENDERECO: TDBEdit;
    Label5: TLabel;
    dbedtNUMERO: TDBEdit;
    Label6: TLabel;
    dbedtBAIRRO: TDBEdit;
    Label7: TLabel;
    dbedtCIDADE: TDBEdit;
    Label8: TLabel;
    dbedtUF: TDBEdit;
    Label9: TLabel;
    dbedtCEP: TDBEdit;
    Label10: TLabel;
    dbedtTELEFONE: TDBEdit;
    dsEmpresa: TDataSource;
    ZEmpresa: TZQuery;
    ZSeqEmpresa: TZSequence;
    ZEmpresaCODIGO: TIntegerField;
    ZEmpresaRAZAO_SOCIAL: TStringField;
    ZEmpresaNOME_FANTASIA: TStringField;
    ZEmpresaNUMERO: TStringField;
    ZEmpresaBAIRRO: TStringField;
    ZEmpresaCIDADE: TStringField;
    ZEmpresaUF: TStringField;
    ZEmpresaCEP: TStringField;
    ZEmpresaTELEFONE: TStringField;
    ZEmpresaENDERECO: TStringField;
    UCControls1: TUCControls;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dsEmpresaStateChange(Sender: TObject);
    procedure GridVisualizacaoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEmpresa: TFrmCadEmpresa;

implementation

uses
  UDM, UPrincipal;

{$R *.dfm}

procedure TFrmCadEmpresa.btnNovoClick(Sender: TObject);
begin
  inherited;
    RzPageControl1.ActivePageIndex := 0;  
    ZEmpresa.Close;
    ZEmpresa.SQL.Clear;
    ZEmpresa.SQL.Add('SELECT * FROM EMPRESA');
    ZEmpresa.Open;
    ZEmpresa.Append;
    dbedtRAZAO_SOCIAL.SetFocus;
end;

procedure TFrmCadEmpresa.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    ZEmpresa.Post;
    ZEmpresa.ApplyUpdates;
    Application.MessageBox('Dados salvos com sucesso.','Informação',MB_ICONINFORMATION+MB_OK);
    except on E:Exception do
    begin
        Application.MessageBox(PChar('Erro ao gravar dados. ' + #13+
                                     'Informações do Erro: ' + E.Message)
                                    ,'Erro',MB_ICONERROR + MB_OK);
        ZEmpresa.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadEmpresa.btnCancelarClick(Sender: TObject);
begin
  inherited;
    ZEmpresa.CancelUpdates;
end;

procedure TFrmCadEmpresa.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Confirma exclusão do registro?','Informação',MB_ICONQUESTION+MB_YESNO)=id_YES then
  begin
    try
        ZEmpresa.Delete;
        ZEmpresa.ApplyUpdates;
        Application.MessageBox('Registro excluido com sucesso.','Informação',MB_ICONINFORMATION+MB_OK);
        except on E:Exception do
        begin
            Application.MessageBox(PChar('Erro ao excluir registro. ' + #13+
                                         'Informações do Erro: ' + E.Message)
                                        ,'Erro',MB_ICONERROR + MB_OK);
            ZEmpresa.CancelUpdates;
        end;
    end;
  end;
end;

procedure TFrmCadEmpresa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    ZEmpresa.Edit;
    except on E:Exception do
    begin
        Application.MessageBox(PChar('Erro ao alterar registro. ' + #13+
                                     'Informações do Erro: ' + E.Message)
                                    ,'Erro',MB_ICONERROR + MB_OK);
        ZEmpresa.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadEmpresa.btnLocalizarClick(Sender: TObject);
begin
  inherited;
   ZEmpresa.Close;
   ZEmpresa.Open;
   RzPageControl1.ActivePageIndex := 1;
end;

procedure TFrmCadEmpresa.dsEmpresaStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled     :=  dsEmpresa.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled  :=  dsEmpresa.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled  :=  dsEmpresa.State in [dsBrowse]; //Alterar
  btnGravar.Enabled   :=  dsEmpresa.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled :=  dsEmpresa.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadEmpresa.GridVisualizacaoDblClick(Sender: TObject);
begin
  inherited;
      RzPageControl1.ActivePageIndex := 0;
end;

end.
