unit ULocAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TFrmLocAdicionais = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    grp1: TGroupBox;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    cbbCodigo: TComboBox;
    lbl2: TLabel;
    edtConteudo: TEdit;
    btn1: TBitBtn;
    btnSair: TBitBtn;
    dsAdicionais: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    vCodigo:Integer;
    { Public declarations }
  end;

var
  FrmLocAdicionais: TFrmLocAdicionais;


  
implementation

uses
  UDM;

{$R *.dfm}

procedure TFrmLocAdicionais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := Cafree;
end;

procedure TFrmLocAdicionais.btn1Click(Sender: TObject);
begin
    DM.ZAdicionais.Close;
    DM.ZAdicionais.SQL.Clear;
    DM.ZAdicionais.SQL.Add('SELECT * FROM ADICIONAIS');

    if cbbCodigo.Text = 'Código' then
    begin
      DM.ZAdicionais.SQL.Add(' WHERE CODIGO =:PCODIGO');
      DM.ZAdicionais.ParamByName('PCODIGO').AsInteger := StrToInt(edtConteudo.Text);
      DM.ZAdicionais.SQL.Add('ORDER BY CODIGO ASC');
    end;

    if cbbCodigo.Text = 'Descrição' then
    begin
      DM.ZAdicionais.SQL.Add(' WHERE DESCRICAO LIKE :PDESCRICAO');
      DM.ZAdicionais.ParamByName('PDESCRICAO').AsString := '%' +edtConteudo.Text +'%';
      DM.ZAdicionais.SQL.Add('ORDER BY DESCRICAO ASC');
    end;

//DM.ZAdicionais.SQL.Add('ORDER BY DESCRICAO ASC');
    DM.ZAdicionais.Open;    

end;

procedure TFrmLocAdicionais.dbgrd1DblClick(Sender: TObject);
begin
    vCodigo := DM.ZAdicionais.FieldByName('CODIGO').AsInteger;
    btnSairClick(Sender);
end;

procedure TFrmLocAdicionais.btnSairClick(Sender: TObject);
begin
    Close;
end;

end.




