unit UFechaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit,
  DBCtrls, DB, RxMemDS, Wwdbigrd, Wwdbgrid, sButton, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxDBEdit, RDprint,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmFechamentoVenda = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rxTempPAG: TRxMemoryData;
    rxTempPAGDESCRICAO: TStringField;
    rxTempPAGVALOR: TFloatField;
    dsTempPAG: TDataSource;
    dsFormasPGTO: TDataSource;
    GridFormasPGTO: TwwDBGrid;
    btnSair: TsButton;
    btnFecharVenda: TsButton;
    wwDBGrid1: TwwDBGrid;
    RDprint1: TRDprint;
    CTotal: TCurrencyEdit;
    CDesconto: TCurrencyEdit;
    CLiquido: TCurrencyEdit;
    CPago: TCurrencyEdit;
    CTroco: TCurrencyEdit;
    ZSenhaAtual: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CDescontoExit(Sender: TObject);
    procedure CPagoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnFecharVendaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure CPagoKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure PImprimeCupom;
    procedure PImprimeCupom2;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RDprint1Preview(Sender: TObject);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1BeforePrint(Sender: TObject; var Continuar: Boolean);
  private
    { Private declarations }
    ComponentePro: TComponent;
    procedure ProCode(Sender: TObject);
  public
    vTipoPedido: string;
    vSenha: Integer;
    { Public declarations }
  end;

var
  FrmFechamentoVenda: TFrmFechamentoVenda;

implementation

uses UPrincipal, UDM, ZSequence, UTipoPedido, UListaAdicionais, UProdutos;

{$R *.dfm}

procedure TFrmFechamentoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmFechamentoVenda.CDescontoExit(Sender: TObject);
begin
  if (CDesconto.Value > CTotal.Value) then
  begin
    Application.MessageBox('Desconto maior que o valor total, verifique.', 'Informação', MB_ICONWARNING + mb_ok);
    exit;
  end;

  CLiquido.Value := CTotal.Value - CDesconto.Value;
end;

procedure TFrmFechamentoVenda.CPagoExit(Sender: TObject);
begin
  if CPago.Value >= CLiquido.Value then
    CTroco.Value := CPago.Value - CLiquido.Value;

  if (CPago.Value < CLiquido.Value) then
  begin
    Application.MessageBox('Valor Pago é menor que o valor total, confira.', 'Informação', mb_iconinformation + mb_ok);
    Exit;
  end;

  if rxTempPAG.Locate('DESCRICAO', DM.ZFormasPGTO.FieldByName('DESCRICAO').AsString, []) then
    rxTempPAG.Edit
  else
    rxTempPAG.Append;

  rxTempPAG.FieldByName('DESCRICAO').AsString := DM.ZFormasPGTO.FieldByName('DESCRICAO').AsString; //DBListBox1.Items.Strings[1];
  rxTempPag.FieldByName('VALOR').AsFloat := CLiquido.Value;
  rxTempPAG.Post;

  btnFecharVenda.SetFocus;
end;

procedure TFrmFechamentoVenda.FormCreate(Sender: TObject);
begin
  CTotal.Value := FrmPrincipal.VTotalGeral; //FrmPrincipal.RxTotal.Value;
  CLiquido.Value := FrmPrincipal.VTotalGeral;
  DM.ZFormasPGTO.Close;
  DM.ZFormasPGTO.Open;

   // Screen.OnActiveControlChange := ProCode;

    //DM.ZFormasPGTO.First;
   // while not DM.ZFormasPGTO.eof do
   // begin
   ////   DBListBox1.Items.Add(DM.ZFormasPGTO.FieldByName('DESCRICAO').AsString);
    //  DM.ZFormasPGTO.Next;
   // end;

   // DM.ZFormasPGTO.First;

  rxTempPag.Close;
  rxTempPag.Open;

  vTipoPedido := '';

end;

procedure TFrmFechamentoVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFechamentoVenda.btnFecharVendaClick(Sender: TObject);
begin
  DM.ZEmpresa.Close;
  DM.ZEmpresa.Open;
  CPagoExit(Sender);

  if vTipoPedido <> '' then
  begin
    with FrmPrincipal do
    begin
      if (rxTemp.IsEmpty) then
      begin
        Application.MessageBox('Não existe venda iniciada, verifique.', 'Informação', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      if (CTotal.Value <= 0) then
      begin
        Application.MessageBox('Total zerado, verifique.', 'Informação', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      if (CPago.Value <= 0) then
      begin
        Application.MessageBox('Informe o valor pago.', 'Informação', MB_ICONWARNING + MB_OK);
        CPago.SetFocus;
        Exit;
      end;

      if (CPago.Value < CLiquido.Value) then
      begin
        Application.MessageBox('Valor pago é menor que o valor da venda, verifique.', 'Informação', MB_ICONWARNING + MB_OK);
        CPago.SetFocus;
        Exit;
      end;

      DM.ZVendas.Close;
      DM.ZVendas.Open;
      DM.ZVendas.Append;
      DM.ZVendasDATA_VENDA.AsDateTime := Now;
      DM.ZVendasCODCLIENTE.AsInteger := 0;
      DM.ZVendasTOTAL.AsFloat := CTotal.Value;
      DM.ZVendasDESCONTO.AsFloat := CDesconto.Value;
      DM.ZVendasFORMA_PGTO.AsInteger := DM.ZFormasPGTO.FieldByName('CODIGO').AsInteger;
      DM.ZVendas.FieldByName('NOME_PGTO').AsString    :=  DM.ZFormasPGTO.FieldByName('DESCRICAO').AsString;
      DM.ZVendas.Post;
      DM.ZVendas.ApplyUpdates;


      rxTemp.First;
      DM.ZItensVenda.Close;
      DM.ZItensVenda.Open;
      while not rxTemp.Eof do
      begin
        with DM do
        begin
          ZItensVenda.Append;
          ZItensVendaCODVENDA.AsInteger := ZSeqVenda.GetCurrentValue; //ZVendasCODIGO.AsInteger;
          ZItensVendaCODPRODUTO.AsInteger := rxTempCODIGO.AsInteger;
          ZItensVendaQTDE.AsFloat := rxTempQTDE.AsFloat;
          ZItensVendaVALOR_UNIT.AsFloat := rxTempVALOR.AsFloat;
          ZItensVendaTOTAL.AsFloat := rxTempTOTAL.AsFloat;
          ZItensVenda.Post;
          ZItensVenda.ApplyUpdates;

          if rxTemp.FieldByName('ADICIONAL').AsString = '' then
          begin
            FBaixaEstoqueProd(rxTemp.FieldByName('QTDE').AsFloat, rxTemp.FieldByName('CODIGO').AsInteger);
          end;
        end;
        rxTemp.Next;
      end;
    {Gera Senha Eletronica}
      ZSenhaAtual.Close;
      ZSenhaAtual.SQL.Clear;
      ZSenhaAtual.SQL.Add('SELECT SENHA_ATUAL FROM CONFIG');
      ZSenhaAtual.Open;
      ZSenhaAtual.Edit;

      if (ZSenhaAtual.FieldByName('SENHA_ATUAL').AsInteger + 1) > 999 then
        ZSenhaAtual.FieldByName('SENHA_ATUAL').AsInteger := 0;

      ZSenhaAtual.FieldByName('SENHA_ATUAL').AsInteger := ZSenhaAtual.FieldByName('SENHA_ATUAL').AsInteger + 1;

      vSenha := ZSenhaAtual.FieldByName('SENHA_ATUAL').AsInteger;

      ZSenhaAtual.Post;
      ZSenhaAtual.ApplyUpdates;
      
    {Fim Gera Senha Eletronica}
      PImprimeCupom2;
      FrmPrincipal.rxTemp.First;

      while not FrmPrincipal.rxTemp.Eof do
      begin
        if FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString = 'S' then
        begin
          FrmPrincipal.FBaixaEstoqueAdicional(FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat, FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger); //Baixa Estoque Adicionais
        end
        else
        begin
          FrmPrincipal.FBaixaEstoqueProd(FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat, FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger); //Baixa Estoque Produto
        end;
        FrmPrincipal.rxTemp.Next;
        Application.ProcessMessages;
      end;

      while not FrmPrincipal.rxTemp.Eof do
      begin
        if FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString = 'C' then
        begin
          FrmPrincipal.FBaixaEstoqueAdicional(FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat, FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger); //Baixa Estoque Adicionais
        end
        else
        begin
          FrmPrincipal.FBaixaEstoqueProd(FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat, FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger); //Baixa Estoque Produto
        end;
        FrmPrincipal.rxTemp.Next;
        Application.ProcessMessages;
      end;

    end;
  end
  else
  begin
    FrmTipoPedido := TFrmTipoPedido.Create(Self);
    FrmTipoPedido.ShowModal;
    Exit;
  end;

  FrmPrincipal.rxTemp.EmptyTable;
  rxTempPAG.EmptyTable;

  FrmPrincipal.VItem := 0;
  FrmPrincipal.VTotalGeral := 0;

    //FrmPrincipal.vQtde            :=  0;
    //FrmPrincipal.vQtdePassou      :=  0;
    //FrmPrincipal.vQtdeCalc        :=  0;
    //FrmPrincipal.vValor           :=  0;
    //FrmPrincipal.vQtdeSimples     :=  0;
    //FrmPrincipal.vQtdeEspecial    :=  0;

  FrmPrincipal.rxTotal.Caption := '0,00';

  if FrmListaAdicionais = nil then
    FrmListaAdicionais.Free;

  if FrmListaAdicionais.Visible then
    FrmListaAdicionais.Close;
    
  //FrmListaAdicionais.Close;

  if FrmProdutos = nil then
    FrmProdutos.Free;

  if FrmProdutos.Visible then
      FrmProdutos.Close;
  
  Close;
end;

procedure TFrmFechamentoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 { if (Key = VK_RETURN) and (CPago.Value > 0) then
  begin
    btnFecharVendaClick(Sender);
  end;}

  if (Key = VK_ESCAPE) then
  begin
    btnSairClick(Sender);
  end;

  if (Key = VK_F6) then
  begin
    btnFecharVendaClick(Sender);
  end;
end;

procedure TFrmFechamentoVenda.CDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  {If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;}
end;

procedure TFrmFechamentoVenda.CPagoKeyPress(Sender: TObject;
  var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
 { If key = #13 then Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end; }
end;

procedure TFrmFechamentoVenda.ProCode(Sender: TObject);
begin
   {if Assigned(ComponentePro) then
      TcxCurrencyEdit(ComponentePro).Style.Color := clWindow; // cor ao sair
   if (ActiveControl is TCustomEdit) or
      (ActiveControl is TComboBox) or
      (ActiveControl is TcxCurrencyEdit) or
      (ActiveControl is TMemo) then
    begin
        TcxCurrencyEdit(ActiveControl).Style.Color := $00FFDDFF;  // cor ao focar
        ComponentePro := ActiveControl;
    end; }
end;

procedure TFrmFechamentoVenda.FormDestroy(Sender: TObject);
begin
   //Screen.OnActiveControlChange := nil;
end;

procedure TFrmFechamentoVenda.PImprimeCupom;
var
  subtotal, total: currency;
  linha: integer;
  traco: string;
begin
  total := 0;
  Traco := '-------------------------------------------------------';
     // Parametros para o CUPOM FISCAL
  rdprint1.TamanhoQteLinhas := 1; // Linhas (deve ser 1 quando for CUPOM)
  rdprint1.TamanhoQteColunas := 55; // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
  rdprint1.FonteTamanhoPadrao := s20cpp; // Fonte Comprimido em 20 cpp
  rdprint1.OpcoesPreview.Preview := false;

     // Cabeçalho do Cupom...
  with rdprint1 do
  begin
    abrir;
    impc(02, 28, 'EMPRESA TESTE', [Comp12, Negrito]);
    impc(03, 28, 'Av. Teste, 78', [Comp12]);
    impc(04, 28, '17500-000 - CIDADE - UF', [Comp12]);
    impc(05, 28, 'Fone (31) 1234-5678', [Comp12]);
    imp(07, 01, 'Nº ' + IntToStr(DM.ZSeqVenda.GetCurrentValue) +
      '   ' + datetimetostr(now) +
      '    Op.: ' + '0');

        // Dados do Cliente...
    imp(08, 01, traco);
    impf(09, 01, 'CLIENTE AVULSO', [comp12]);
    impf(10, 01, '', [comp12]); //Endereço cliente
    impf(11, 01, '' + ' - ' +
      '' + ' - '
      , [comp12]); //estado cliente

        // Titulo dos Itens...
    imp(12, 01, traco);
    imp(13, 01, 'Qte Descrição dos Produtos        UN Unitário Sub-Total');
    imp(14, 01, traco);
  end;

     // Imprime itens do pedido...
  linha := 15;
  with FrmPrincipal do
  begin
    rxTemp.First;
    while not rxTemp.eof do
    begin
      with rdprint1 do
      begin
        impval(linha, 01, '##0', rxTempQTDE.value, []);
        impf(linha, 05, rxTempDESCRICAO.value, []);
        impf(linha, 35, 'UN', []);
        impval(linha, 38, '#,##0.00', rxTempVALOR.value, []);
        subtotal := rxTempQTDE.value * rxTempValor.value;
        total := total + subtotal;
        impval(linha, 47, '##,##0.00', subtotal, []);
        inc(linha);
      end;
      rxTemp.next;
    end;
  end;

     // Parte final do Cupom... (daqui pra frente continuo incrementando a LINHA
  with rdprint1 do
  begin
        // Total...
    imp(linha, 01, traco);
    inc(linha);
    imp(linha, 01, 'Total Geral do Cupom');
    impval(linha, 42, '###,###,##0.00', total, []);
        // Desconto Global
    inc(linha);
    imp(linha, 01, '(-) Desconto Global');
    if (CDesconto.Text = '') then
      CDesconto.Text := '0';
    impval(linha, 42, '-##,###,##0.00', strtofloat(CDesconto.Text), []);
        // Total Liquido...
    inc(linha);
    impf(linha, 01, 'VALOR A PAGAR R$', [comp12, negrito]);
    impval(linha, 33, '###,###,##0.00', Total - strtofloat(cdesconto.text), [comp12, negrito]);

    inc(linha);
    impf(linha, 01, 'VALOR PAGO R$', [comp12, negrito]);
    impval(linha, 33, '###,###,##0.00', CPago.Value, [comp12, negrito]);

        // Final...
    inc(linha);
    imp(linha, 01, traco);
    inc(linha);
    impc(linha, 28, 'Obrigado pela preferência', [comp12]);
    inc(linha);
    inc(linha);
    impc(linha, 28, 'VOLTE SEMPRE', [Normal]);
    inc(linha);
    inc(linha);
    impc(linha, 28, '***  SEM VALOR FISCAL  ***', []);

        // Avança 7 linhas em Branco...
    linha := linha + 7;
    imp(linha, 01, ' '); // Para forçar impressão da página

   {===========================================================================}
   {        Mostra preview com tamanho variavel de um cupom nao Fiscal         }
   {                                                                           }
   {              ISTO NAO DEVERIA SER FEITO, NÃO ESTA PREVISTO NOS            }
   {               RECURSOS DO RDPRINT,  USE POR SUA CONTA E RISCO...          }
   {===========================================================================}
   {}rdprint1.OpcoesPreview.Preview := true; {}
   {}rdprint1.TamanhoQteLinhas := linha; // Qte de linhas do cupom {}
   {===========================================================================}

    fechar;
  end;
    // Restaura valores normais para imprimir Cupom Não Fiscal...
  rdprint1.OpcoesPreview.Preview := false;
  rdprint1.TamanhoQteLinhas := 1;

end;

procedure TFrmFechamentoVenda.PImprimeCupom2;
var
  subtotal, total: currency;
  linha: integer;
  traco: string;
begin

   { if not (vSelecinouPGTO) then
    begin
        Application.MessageBox('Informe a forma de pagamento.', 'Atenção', MB_OK);
        btnDinheiro.SetFocus;
        Exit;
    end;

    if (vTipoPedido = '') then
    begin
        FrmTipoPedido := TFrmTipoPedido.Create(Self);
        FrmTipoPedido.ShowModal;
        Exit;
    end; }


  total := 0;
  linha := 1;
  Traco := '---------------------------------------------';
     // Parametros para o CUPOM FISCAL
  rdprint1.TamanhoQteLinhas := 1; // Linhas (deve ser 1 quando for CUPOM)
  rdprint1.TamanhoQteColunas := 48; // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
  RDprint1.Acentuacao := SemAcento;
  RDprint1.MostrarProgresso := false;
     //rdprint1.FonteTamanhoPadrao    := S10cpp;//s20cpp; // Fonte Comprimido em 20 cpp
  rdprint1.FonteTamanhoPadrao := s12cpp;
  rdprint1.OpcoesPreview.Preview := false;
     //RDprint1.ImpASCII(01,01,'27 64');  // RESET DARUMA para possicionar a cabeça de impressão

     // Cabeçalho do Cupom...
  with rdprint1 do
  begin
    abrir;

    //RDprint1.Imp(Linha, 01, '---------------------------------------------');
    imp(linha, 01, traco);
    inc(Linha);
    RDprint1.Imp(Linha, 01, '       C U P O M    N Ã O    F I S C A L        ');
    inc(Linha);
    imp(linha, 01, traco);
    inc(Linha);
    Impc(Linha, 01, 'CUPOM: ' + Format('%6.6d', [DM.ZVendas.FieldByName('CODIGO').AsInteger]) + '   ' + datetimetostr(now), [normal]);
    Inc(linha);

    //RDprint1.Imp(Linha, 01, '---------------------------------------------');
    imp(linha, 01, traco);
    inc(Linha);
    RDprint1.Imp(Linha, 01, '            ' + dm.ZEmpresa.FieldByName('NOME_FANTASIA').AsString);
    inc(Linha);
    RDprint1.Imp(Linha, 01, DM.ZEmpresa.FieldByName('ENDERECO').AsString);
    RDprint1.Imp(Linha, 20, DM.ZEmpresa.FieldByName('NUMERO').AsString);
    RDprint1.Imp(Linha, 25, DM.ZEmpresa.FieldByName('BAIRRO').AsString);
    inc(Linha);
    RDprint1.Imp(Linha, 01, '                ' + dm.ZEmpresa.FieldByName('CIDADE').AsString);
    RDprint1.Imp(Linha, 27, dm.ZEmpresa.FieldByName('uf').asstring);
    inc(Linha);
    inc(Linha);
    Inc(linha);
    RDprint1.Impc(Linha, 01, 'OBS.: ' + vTipoPedido, [negrito]);
    inc(linha);
    //RDprint1.Imp(Linha, 01, '---------------------------------------------');
    imp(linha, 01, traco);
    inc(linha);
        // Titulo dos Itens...
    //RDprint1.Imp(10, 01, '---------------------------------------------');
    //imp(linha, 10, traco);
    RDprint1.Imp(linha, 01, 'Cod  Produto            Quant   Unit    Total');
    //RDprint1.Imp(12, 01, '---------------------------------------------');
    inc(linha);
    imp(linha, 01, traco);
  end;

     // Imprime itens do pedido...
  linha := 15;
  with FrmPrincipal do
  begin
    FrmPrincipal.rxTemp.First;
    while not FrmPrincipal.rxTemp.eof do
    begin
      with rdprint1 do
      begin

        if ((FrmPrincipal.rxTempITEM.AsString = '') and
          (FrmPrincipal.rxTempDESCRICAO.AsString = '')) then
        begin
          RDprint1.Imp(linha, 01, '');
          inc(linha);
          FrmPrincipal.rxTemp.Next;
        end;

        impval(linha, 01, '##0', FrmPrincipal.rxTempITEM.value, []);
        imp(linha, 05, copy(FrmPrincipal.rxTempDESCRICAO.value, 1, 20));
        impval(linha, 27, '0', FrmPrincipal.rxTempQTDE.Value, []);
        impval(linha, 29, '#,##0.00', FrmPrincipal.rxTempVALOR.value, []);
        subtotal := FrmPrincipal.rxTempQTDE.value * FrmPrincipal.rxTempValor.value;
        total := total + subtotal;
        impval(linha, 37, '##,##0.00', subtotal, []);
        inc(linha);
      end;
      FrmPrincipal.rxTemp.next;
    end;
  end;

     // Parte final do Cupom... (daqui pra frente continuo incrementando a LINHA
  with rdprint1 do
  begin
        // Total...
    imp(linha, 01, traco);
    inc(linha);
    imp(linha, 01, 'Total Geral do Cupom');
    impval(linha, 29, '###,###,##0.00', total, [normal]);
        // Desconto Global
    inc(linha);
    imp(linha, 01, '(-) Desconto Global');
    if (CDesconto.Text = '') then
      CDesconto.Text := '0';
    impval(linha, 32, '-##,###,##0.00', CDesconto.Value, []);
        // Total Liquido...
    inc(linha);
    imp(linha, 01, 'Valor a Pagar');
    impval(linha, 29, '###,###,##0.00', Total - cdesconto.Value, [normal]);
        // Final...

        // Valor Pago
        //if cPago.Value > 0 then
        //begin
    inc(linha);
    imp(linha, 01, 'Valor Pago');
    impval(linha, 32, '###,###,##0.00', cPago.Value, []);
       // end;

        //Troco
      //  if CTroco.Value > 0 then
       // begin
    inc(linha);
    imp(linha, 01, 'Troco');
    impval(linha, 32, '###,###,##0.00', CTroco.Value, []);
      //  end;

    inc(linha);
    imp(linha, 01, traco);
    inc(linha);
    Impc(Linha, 01, 'SENHA: ' + Format('%3.3d', [vSenha]) + '        ', [negrito]);
    inc(linha);
    imp(linha, 01, traco);
    inc(linha);
    imp(linha, 10, 'Obrigado pela preferência');
    inc(linha);
    inc(linha);
    imp(linha, 20, 'VOLTE SEMPRE');
    inc(linha);
    inc(linha);
    inc(linha);
    inc(linha);
        //imp(linha,10,'***  SEM VALOR FISCAL  ***');
        //inc(linha);
        //inc(linha);

        //inc(linha);
       // inc(linha);

    imp(linha, 01, ' ');

        // Avança 7 linhas em Branco...
       // linha := linha + 2;
       // imp (linha,01,' '); // Para forçar impressão da página

   {===========================================================================}
   {        Mostra preview com tamanho variavel de um cupom nao Fiscal         }
   {                                                                           }
   {              ISTO NAO DEVERIA SER FEITO, NÃO ESTA PREVISTO NOS            }
   {               RECURSOS DO RDPRINT,  USE POR SUA CONTA E RISCO...          }
   {===========================================================================}
   {}rdprint1.OpcoesPreview.Preview := true; {}
   {}rdprint1.TamanhoQteLinhas      := linha; // Qte de linhas do cupom {}
   {===========================================================================}

        //ImpASCII(01,01,'27,109');
    fechar;
  end;
    // Restaura valores normais para imprimir Cupom Não Fiscal...
  rdprint1.OpcoesPreview.Preview  := false;
  rdprint1.TamanhoQteLinhas       := 1;

end;

procedure TFrmFechamentoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  if key = #13 then begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFrmFechamentoVenda.wwDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    CDesconto.SetFocus;
    Key := #0;
    Exit;
  end;
end;

procedure TFrmFechamentoVenda.RDprint1Preview(Sender: TObject);
begin
    RDprint1.Impressora := grafico;
end;

procedure TFrmFechamentoVenda.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
    RDprint1.Impressora := grafico;
end;

procedure TFrmFechamentoVenda.RDprint1BeforePrint(Sender: TObject;
  var Continuar: Boolean);
begin
  RDprint1.Impressora := grafico;
end;

end.

