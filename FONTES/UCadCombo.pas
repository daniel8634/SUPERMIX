unit UCadCombo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls, sMaskEdit,
  sCustomComboEdit, sComboEdit, sCurrEdit, sCurrencyEdit, DB;

type
  TFrmCadCombo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dbedtCODIGO: TDBEdit;
    Label2: TLabel;
    dblkcbbCODADICIONAL: TDBLookupComboBox;
    sEdtPesquisa: TsComboEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dsAdicionais: TDataSource;
    dsCombos: TDataSource;
    dbedtVALOR: TDBEdit;
    dbedtESTOQUE: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sEdtPesquisaButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sEdtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCombo: TFrmCadCombo;

implementation

uses
  ULocAdicionais, UDM, UCadProdutos;

{$R *.dfm}

procedure TFrmCadCombo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := Cafree;
end;

procedure TFrmCadCombo.sEdtPesquisaButtonClick(Sender: TObject);
begin
    if sEdtPesquisa.Text <> '' then
    begin
        DM.ZAdicionais.Close;
        DM.ZAdicionais.SQL.Clear;
        DM.ZAdicionais.SQL.Add(' SELECT * FROM ADICIONAIS');
        DM.ZAdicionais.SQL.Add(' WHERE CODIGO=:PCODIGO');
        DM.ZAdicionais.ParamByName('PCODIGO').AsInteger := StrToInt(sEdtPesquisa.Text);
        DM.ZAdicionais.Open;

        if dm.ZAdicionais.RecordCount <= 0 then
        begin
          Application.MessageBox('Nenhum registro encontrado com o código informado.','Informação',MB_ICONINFORMATION+MB_OK);

          FrmLocAdicionais := TFrmLocAdicionais.Create(Self);
          FrmLocAdicionais.ShowModal;

          sEdtPesquisa.SetFocus;
          Exit;
        end;
    end
    else
    begin
      FrmLocAdicionais := TFrmLocAdicionais.Create(Self);
      FrmLocAdicionais.ShowModal;
    end;
    dblkcbbCODADICIONAL.KeyValue := IntToStr(FrmLocAdicionais.vCodigo);
    sEdtPesquisa.Text := IntToStr(FrmLocAdicionais.vCodigo);
end;

procedure TFrmCadCombo.BitBtn1Click(Sender: TObject);
begin
      //DM.ZCombos.FieldByName('CODADICIONAL').AsInteger := dm.ZAdicionais.FieldByName('CODIGO').AsInteger;
      DM.ZCombos.FieldByName('DESCRICAO').AsString := DM.ZAdicionais.FieldByName('DESCRICAO').AsString;
      DM.ZCombos.FieldByName('VALOR').AsFloat      := DM.ZAdicionais.FieldByName('VALOR').AsFloat;
      DM.ZCombos.Post;
      DM.ZCombos.ApplyUpdates;
      DM.ZCombos.Append;



      if Application.MessageBox('Incluir novo item?','Confirmação',MB_ICONQUESTION+MB_YESNO)= idYes then
      begin
        DM.ZCombos.Append;
        DM.ZCombos.FieldByName('CODIGO').AsInteger := DM.fGeraCodigo('COMBOS','CODIGO');
        DM.ZCombos.FieldByName('COD_PRODUTO').AsInteger := FrmCadProduto.ZProdutos.FieldByName('CODIGO').AsInteger;
      end;

      sEdtPesquisa.SetFocus;

end;

procedure TFrmCadCombo.FormShow(Sender: TObject);
begin
    DM.ZAdicionais.Close;
    DM.ZAdicionais.Open;
end;

procedure TFrmCadCombo.BitBtn2Click(Sender: TObject);
begin
      DM.ZCombos.CancelUpdates;
      dblkcbbCODADICIONAL.KeyValue := Null;
      Close;
end;

procedure TFrmCadCombo.sEdtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13 
  If key = #13 then Begin 
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key 
    Key:= #0; 
    Perform(Wm_NextDlgCtl,0,0); 
  end;
end;

end.
