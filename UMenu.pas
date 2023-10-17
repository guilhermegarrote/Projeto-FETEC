unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ExtCtrls;

type
  TFrmMenu = class(TForm)
    LayoutMain: TLayout;
    LayoutLogo: TLayout;
    Layout1: TLayout;
    LayoutGroup: TLayout;
    Line1: TLayout;
    Line2: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    W: TImage;
    Image3: TImage;
    Layout3: TLayout;
    Layout4: TLayout;
    Image2: TImage;
    Image4: TImage;
    Layout5: TLayout;
    Image7: TImage;
    Image8: TImage;
    Layout6: TLayout;
    RecSaude: TRectangle;
    FndSaude: TImage;
    TextSaude: TImage;
    BtnJogar: TSpeedButton;
    BtnSaude: TButton;
    Layout7: TLayout;
    RecEducacao: TRectangle;
    FndEducacao: TImage;
    TextEducacao: TImage;
    BtnEducacao: TButton;
    Layout8: TLayout;
    RecMeioAmbiente: TRectangle;
    FundoMeioAmbiente: TImage;
    TextMeioAmbiente: TImage;
    BtnMeioAmbiente: TButton;
    LayoutSociedade: TLayout;
    RecSociedade: TRectangle;
    FundoSociedade: TImage;
    TextSociedade: TImage;
    BtnSociedade: TButton;
    procedure InicializarMatrizes;
    procedure BtnSaudeClick(Sender: TObject);
    procedure BtnEducacaoClick(Sender: TObject);
    procedure BtnMeioAmbienteClick(Sender: TObject);
    procedure BtnSociedadeClick(Sender: TObject);
    procedure BtnJogarClick(Sender: TObject);
  private
  public
    perguntas: array of array of string;
    respostas: array of array of string;
    coluna: integer;
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UQuestions;

procedure TFrmMenu.InicializarMatrizes;
begin
  // Inicializar a matriz de perguntas (4 linhas e 4 colunas)
  SetLength(perguntas, 4, 4);

  // Preencher a matriz de perguntas com strings de exemplo
  perguntas[0, 0] := '1';
  perguntas[0, 1] := '2';
  perguntas[0, 2] := '3';
  perguntas[0, 3] := '4';

  perguntas[1, 0] := 'a';
  perguntas[1, 1] := 'a';
  perguntas[1, 2] := 'a';
  perguntas[1, 3] := 'a';

  perguntas[2, 0] := 'a';
  perguntas[2, 1] := 'a';
  perguntas[2, 2] := 'a';
  perguntas[2, 3] := 'a';

  perguntas[3, 0] := 'a';
  perguntas[3, 1] := 'a';
  perguntas[3, 2] := 'a';
  perguntas[3, 3] := 'a';

  // Inicializar a matriz de respostas (16 linhas e 4 colunas)
  SetLength(respostas, 4, 16);

  // Preencher a matriz de respostas com strings de exemplo
  respostas[0, 0] := 'a';
  respostas[0, 1] := 'b';
  respostas[0, 2] := 'v';
  respostas[0, 3] := 'c';
  respostas[0, 4] := 'd';
  respostas[0, 5] := 's';
  respostas[0, 6] := 'a';
  respostas[0, 7] := 'd';
  respostas[0, 8] := 'f';
  respostas[0, 9] := 'w';
  respostas[0, 10] := 'a';
  respostas[0, 11] := 'g';
  respostas[0, 12] := 'b';
  respostas[0, 13] := 'v';
  respostas[0, 14] := 's';
  respostas[0, 15] := 's';

  respostas[1, 0] := 'a';
  respostas[1, 1] := 'a';
  respostas[1, 2] := 'a';
  respostas[1, 3] := 'a';
  respostas[1, 4] := 'a';
  respostas[1, 5] := 'a';
  respostas[1, 6] := 'a';
  respostas[1, 7] := 'a';
  respostas[1, 8] := 'a';
  respostas[1, 9] := 'a';
  respostas[1, 10] := 'a';
  respostas[1, 11] := 'a';
  respostas[1, 12] := 'a';
  respostas[1, 13] := 'a';
  respostas[1, 14] := 'a';
  respostas[1, 15] := 'a';

  respostas[2, 0] := 'a';
  respostas[2, 1] := 'a';
  respostas[2, 2] := 'a';
  respostas[2, 3] := 'a';
  respostas[2, 4] := 'a';
  respostas[2, 5] := 'a';
  respostas[2, 6] := 'a';
  respostas[2, 7] := 'a';
  respostas[2, 8] := 'a';
  respostas[2, 9] := 'a';
  respostas[2, 10] := 'a';
  respostas[2, 11] := 'a';
  respostas[2, 12] := 'a';
  respostas[2, 13] := 'a';
  respostas[2, 14] := 'a';
  respostas[2, 15] := 'a';

  respostas[3, 0] := 'a';
  respostas[3, 1] := 'a';
  respostas[3, 2] := 'a';
  respostas[3, 3] := 'a';
  respostas[3, 4] := 'a';
  respostas[3, 5] := 'a';
  respostas[3, 6] := 'a';
  respostas[3, 7] := 'a';
  respostas[3, 8] := 'a';
  respostas[3, 9] := 'a';
  respostas[3, 10] := 'a';
  respostas[3, 11] := 'a';
  respostas[3, 12] := 'a';
  respostas[3, 13] := 'a';
  respostas[3, 14] := 'a';
  respostas[3, 15] := 'a';
end;

procedure TFrmMenu.BtnEducacaoClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecEducacao.Visible := True;
  coluna := 0;
end;

procedure TFrmMenu.BtnSaudeClick(Sender: TObject);
begin
  if ((RecEducacao.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecEducacao.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecSaude.Visible := True;
  coluna := 1;
end;

procedure TFrmMenu.BtnMeioAmbienteClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecEducacao.Visible = True) or
    (RecSociedade.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecEducacao.Visible := False;
    RecSociedade.Visible := False;
  end;
  RecMeioAmbiente.Visible := True;
  coluna := 2;
end;

procedure TFrmMenu.BtnSociedadeClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecMeioAmbiente.Visible = True) or
    (RecEducacao.Visible = True)) then
  begin
    RecSaude.Visible := False;
    RecMeioAmbiente.Visible := False;
    RecEducacao.Visible := False;
  end;
  RecSociedade.Visible := True;
  coluna := 3;
end;

procedure TFrmMenu.BtnJogarClick(Sender: TObject);
begin
  if ((RecSaude.Visible = True) or (RecEducacao.Visible = True) or
    (RecSociedade.Visible = True)) or (RecMeioAmbiente.Visible = True) then
  begin
    InicializarMatrizes;
    FrmQuestions.ExecuteQuestions;
  end;
end;
end.
