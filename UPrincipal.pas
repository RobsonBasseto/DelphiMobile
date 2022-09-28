unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdCtrls,
  FMX.Objects, FMX.MultiView, FMX.Controls.Presentation, IOUtils, Data.FMTBcd,
  Data.DB, Data.SqlExpr;

type
  TFrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    Button2: TButton;
    Button1: TButton;
    MultiView1: TMultiView;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    VertScrollBoxMinhaLista: TVertScrollBox;
    TabItem2: TTabItem;
    VertScrollFavoritos: TVertScrollBox;
    TabItem3: TTabItem;
    Layout2: TLayout;
    Image5: TImage;
    Layout3: TLayout;
    Layout4: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    EditCPF: TEdit;
    EditNome: TEdit;
    BtnLogin: TButton;
    EditCelular: TEdit;
    Label2: TLabel;
    EditEmail: TEdit;
    Label3: TLabel;
    EditEndereco: TEdit;
    Label4: TLabel;
    EditCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditUF: TEdit;
    Label9: TLabel;
    EditBairro: TEdit;
    Button3: TButton;
    Layout1: TLayout;
    Salvar: TButton;
    VertScrollBox1: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarListaProdutos(id: integer; nome, descricao: string;
      valor: double);
    procedure CarregarListaFavoritos;
    procedure GetProdutosBase;
    procedure GetInforamacoesUsuario;
    procedure AddFavoritos(Sender: TObject);
    procedure RemoverFavoritos(Sender: TObject);
    procedure AddItem(Sender: TObject);
    function favorito(id: integer): boolean;

  public
    { Public declarations }
    vlrTotal: double;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UDM, UCadastro;

{ TFrmPrincipal }

procedure TFrmPrincipal.AddFavoritos(Sender: TObject);
var
  AId: string;
begin
  AId := (TRectangle(Sender).TagString);
  dm.FDQueryProduto.Locate('id', AId, []);
  dm.FDQueryProduto.Edit;
  dm.FDQueryProdutofavorito.AsString := 'S';
  dm.FDQueryProduto.Post;
  ShowMessage('Adicionado ao seus favoritos');
end;

procedure TFrmPrincipal.AddItem(Sender: TObject);
begin
  dm.FDQueryProduto.Locate('id', TButton(Sender).TagString, []);
  vlrTotal := dm.FDQueryProdutovalor.AsFloat;
  dm.FDQPedido.Append;
  dm.FDQPedido.FieldByName('idPessoa').AsInteger :=
    dm.FDQueryPessoaid.AsInteger;
  dm.FDQPedido.FieldByName('datahora').AsDateTime := now;
  dm.FDQPedido.FieldByName('vlrpedido').AsFloat := vlrTotal;
  dm.FDQPedido.FieldByName('statuspedido').AsString := 'A';
  dm.FDQPedido.Post;

  dm.FDQItemPedido.FieldByName('idpedido').AsInteger :=
    dm.FDQPedido.FieldByName('id').AsInteger;
  dm.FDQItemPedido.FieldByName('idproduto').AsInteger :=
    dm.FDQueryProdutoid.AsInteger;
  dm.FDQItemPedido.FieldByName('qteproduto').AsInteger :=
    dm.FDQItemPedido.FieldByName('qteproduto').AsInteger + 1;
  dm.FDQItemPedido.FieldByName('vlritem').AsFloat :=
    dm.FDQueryProdutovalor.AsFloat;
  dm.FDQItemPedido.Post;

end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  ChangeTabAction3.Execute;
end;

procedure TFrmPrincipal.CarregarListaProdutos(id: integer;
  nome, descricao: string; valor: double);
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;
begin
  // fundo
  rect := TRectangle.Create(VertScrollBoxMinhaLista);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
    TagString := IntToStr(id);
  end;
  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 45;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := False;
    rect.AddObject(rect_barra);
  end;

  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := nome;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 50;
    Position.Y := 10;
    Width := 200;
    rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(rect_barra);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FFDF0B0B;
    Text := descricao;
    font.Size := 11;
    font.Style := [TFontStyle.fsBold];
    Position.x := 5;
    Position.Y := 70;
    Width := 500;
    rect.AddObject(lbl);
  end;

  // ImgFavoritos
  img := TImage.Create(rect);
  if not favorito(id) then
  begin
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine('D:\Users\rrobasseto\Desktop\Mobile\img',
        'heart_nosel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'heart_nosel.png'));
{$ENDIF}
      Height := 30;
      Width := 30;
      Position.x := 210;
      Position.Y := 5;
      name := 'imgheartNoSel' + IntToStr(id);
      TagString := IntToStr(id);
      OnClick := AddFavoritos;
      Visible := true;
      rect.AddObject(img);
    end;
  end
  else
  begin

    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine('D:\Users\rrobasseto\Desktop\Mobile\img',
        'heart_yessel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'heart_yessel.png'));
{$ENDIF}
      Height := 30;
      Width := 30;
      Position.x := 210;
      Position.Y := 5;
      name := 'imgheartYesSel' + IntToStr(id);
      TagString := IntToStr(id);
      OnClick := RemoverFavoritos;
      Visible := true;
      rect.AddObject(img);
    end;
  end;
  VertScrollBoxMinhaLista.AddObject(rect);
end;

procedure TFrmPrincipal.CarregarListaFavoritos;
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;

begin
  dm.FDQListaFavoritos.Close;
  dm.FDQListaFavoritos.Open();

  while not dm.FDQListaFavoritos.Eof do

  begin
    // fundo
    rect := TRectangle.Create(VertScrollFavoritos);
    with rect do
    begin
      Align := TAlignLayout.Top;
      Height := 110;
      Fill.Color := $FFFFFFFF;
      Stroke.Kind := TBrushKind.Solid;
      Stroke.Color := $FFD4D5D7;
      Margins.Top := 10;
      Margins.Left := 10;
      Margins.Right := 10;
      XRadius := 8;
      YRadius := 8;
      TagString := IntToStr(dm.FDQListaFavoritosid.AsInteger);
    end;
    // Barra inferior...
    rect_barra := TRectangle.Create(rect);
    with rect_barra do
    begin
      Align := TAlignLayout.Bottom;
      Height := 45;
      Fill.Color := $FFF4F4F4;
      Stroke.Kind := TBrushKind.Solid;
      Stroke.Color := $FFD4D5D7;
      Sides := [TSide.Left, TSide.Bottom, TSide.Right];
      XRadius := 8;
      YRadius := 8;
      Corners := [TCorner.BottomLeft, TCorner.BottomRight];
      HitTest := False;
      rect.AddObject(rect_barra);
    end;

    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor := $FF333333;
      Text := dm.FDQListaFavoritosnome.AsString;
      font.Size := 16;
      font.Style := [TFontStyle.fsBold];
      Position.x := 50;
      Position.Y := 10;
      Width := 200;
      rect.AddObject(lbl);
    end;
    lbl := TLabel.Create(rect_barra);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor := $FFDF0B0B;
      Text := dm.FDQListaFavoritosdescricao.AsString;
      font.Size := 11;
      font.Style := [TFontStyle.fsBold];
      Position.x := 5;
      Position.Y := 70;
      Width := 500;
      rect.AddObject(lbl);
    end;
    // ImgFavoritos
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine('D:\Users\rrobasseto\Desktop\Mobile\img',
        'heart_yessel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'heart_nosel.png'));
{$ENDIF}
      Height := 30;
      Width := 30;
      Position.x := 210;
      Position.Y := 5;
      name := 'imgheartYesSel' + dm.FDQListaFavoritosid.AsString;
      TagString := IntToStr(dm.FDQListaFavoritosid.AsInteger);
      OnClick := RemoverFavoritos;
      Visible := true;
      rect.AddObject(img);
    end;
    VertScrollFavoritos.AddObject(rect);
    dm.FDQListaFavoritos.next;
  end;

end;

function TFrmPrincipal.favorito(id: integer): boolean;
begin
  dm.FDQFavoritos.Close;
  dm.FDQFavoritos.ParamByName('pIdProduto').AsInteger := id;
  dm.FDQFavoritos.Open();

  if not dm.FDQFavoritos.IsEmpty then
    Result := true
  else
    Result := False;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  GetProdutosBase;
  CarregarListaFavoritos;
  GetInforamacoesUsuario;
  ChangeTabAction1.Execute;
end;

procedure TFrmPrincipal.GetInforamacoesUsuario;
begin
  dm.FDQueryLogado.Close;
  dm.FDQueryLogado.ParamByName('pid').AsInteger := FrmCadastro.usuariologado;
  dm.FDQueryLogado.Open();

  EditNome.Text := dm.FDQueryPessoanome.AsString;
  EditCPF.Text := dm.FDQueryPessoacpf.AsString;
  EditCelular.Text := dm.FDQueryPessoacelular.AsString;
  EditEmail.Text := dm.FDQueryPessoaemail.AsString;
  EditEndereco.Text := dm.FDQueryPessoaendereco.AsString;
  EditCidade.Text := dm.FDQueryPessoacidade.AsString;
  EditUF.Text := dm.FDQueryPessoauf.AsString;
  EditBairro.Text := dm.FDQueryPessoabairro.AsString;

end;

procedure TFrmPrincipal.GetProdutosBase;
begin
  dm.FDQueryProduto.Close;
  dm.FDQueryProduto.Open();
  while not dm.FDQueryProduto.Eof do
  begin
    CarregarListaProdutos(dm.FDQueryProdutoid.AsInteger,
      dm.FDQueryProdutonome.AsString, dm.FDQueryProdutodescricao.AsString,
      dm.FDQueryProdutovalor.AsFloat);
    dm.FDQueryProduto.next;
  end;

end;

procedure TFrmPrincipal.RemoverFavoritos(Sender: TObject);
var
  AId: string;
begin
  AId := (TRectangle(Sender).TagString);
  dm.FDQueryProduto.Locate('id', AId, []);
  dm.FDQueryProduto.Edit;
  dm.FDQueryProdutofavorito.AsString := 'N';
  dm.FDQueryProduto.Post;
  ShowMessage('Removido ao seus favoritos');

end;

procedure TFrmPrincipal.SalvarClick(Sender: TObject);
begin
  dm.FDQueryPessoa.Edit;

  dm.FDQueryPessoanome.AsString := EditNome.Text;
  dm.FDQueryPessoacpf.AsString := EditCPF.Text;
  dm.FDQueryPessoacelular.AsString := EditCelular.Text;
  dm.FDQueryPessoaemail.AsString := EditEmail.Text;
  dm.FDQueryPessoaendereco.AsString := EditEndereco.Text;
  dm.FDQueryPessoacidade.AsString := EditCidade.Text;
  dm.FDQueryPessoauf.AsString := EditUF.Text;
  dm.FDQueryPessoabairro.AsString := EditBairro.Text;
  dm.FDQueryPessoa.Post;

  ShowMessage('Altera��o feita com sucesso!');
end;

end.
