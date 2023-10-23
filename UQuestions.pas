unit UQuestions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, UMenu;

type
  TFrmQuestions = class(TForm)
    LayoutMain: TLayout;
    LayoutTop: TLayout;
    LayoutCenter: TLayout;
    LayoutBottom: TLayout;
    LytA: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Image1: TImage;
    Pergunta: TText;
    Image6: TImage;
    BtnConfirmar: TSpeedButton;
    Layout1: TLayout;
    Image2: TImage;
    RBA: TRadioButton;
    Layout5: TLayout;
    Image3: TImage;
    Layout6: TLayout;
    Image4: TImage;
    Layout2: TLayout;
    Image5: TImage;
    RBD: TRadioButton;
    RBC: TRadioButton;
    RBB: TRadioButton;
    LblAlert: TLabel;
    procedure RBAChange(Sender: TObject);
    procedure RBBChange(Sender: TObject);
    procedure RBCChange(Sender: TObject);
    procedure RBDChange(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure ExecuteQuestions;
    procedure UpdateQuestions;
  private
  public
    pontuacao: double;
    posicaoPergunta: integer;
    posicaoResposta: integer;
    pontuacaoMaxima: double;
    porcentagem: double;
  end;

var
  FrmQuestions: TFrmQuestions;

implementation

{$R *.fmx}

uses UResult1, UResult2, UResult3, UResult4;

procedure TFrmQuestions.ExecuteQuestions;
begin
  FrmQuestions.Show;
  posicaoPergunta := 0;
  posicaoResposta := 0;
  FrmQuestions.UpdateQuestions;
end;

procedure TFrmQuestions.UpdateQuestions;
begin
  FrmQuestions.Pergunta.Text := FrmMenu.perguntas[FrmMenu.coluna, posicaoPergunta];
  FrmQuestions.RBA.Text := FrmMenu.respostas[FrmMenu.coluna, posicaoResposta];
  FrmQuestions.RBB.Text := FrmMenu.respostas[FrmMenu.coluna, posicaoResposta + 1];
  FrmQuestions.RBC.Text := FrmMenu.respostas[FrmMenu.coluna, posicaoResposta + 2];
  FrmQuestions.RBD.Text := FrmMenu.respostas[FrmMenu.coluna, posicaoResposta + 3];
end;

procedure TFrmQuestions.BtnConfirmarClick(Sender: TObject);
begin
  if (RBA.IsChecked=False) and (RBB.IsChecked=False) and
  (RBC.IsChecked=false) and(RBD.IsChecked=False) then
  begin
    LblAlert.Visible:=True
  end;

  if posicaoPergunta = 0 then
    begin
      if RBA.IsChecked then
    begin
      pontuacao := 0.25;
      LblAlert.Visible:=False;
    end
    else if RBB.IsChecked then
    begin
      pontuacao := 0.20;
      LblAlert.Visible:=False;
    end
    else if RBC.IsChecked then
    begin
      pontuacao := 0.15;
      LblAlert.Visible:=False;
    end
    else if RBD.IsChecked then
    begin
      pontuacao := 0.10;
      LblAlert.Visible:=False;
    end
    else
    begin
      exit;
    end;
  end
  else if RBA.IsChecked then
  begin
    pontuacao := pontuacao + 0.25;
    LblAlert.Visible:=False;
  end
  else if RBB.IsChecked then
  begin
    pontuacao := pontuacao + 0.20;
    LblAlert.Visible:=False;
  end
  else if RBC.IsChecked then
  begin
    pontuacao := pontuacao + 0.15;
    LblAlert.Visible:=False;
  end
  else if RBD.IsChecked then
  begin
    pontuacao := pontuacao + 0.10;
    LblAlert.Visible:=False;
  end
  else
  begin
    exit;
  end;
  RBA.IsChecked := False;
  RBB.IsChecked := False;
  RBC.IsChecked := False;
  RBD.IsChecked := False;
  if posicaoPergunta = 3 then
  begin
    pontuacaoMaxima := (4 * 0.25);
    porcentagem := (pontuacao / pontuacaoMaxima) * 100;
    if ((porcentagem >= 90) and (porcentagem<=100)) then
    begin
      FrmResult1.TextPercent.Text := FloatToStr(porcentagem) + '%';
      FrmResult1.Show;
      FrmQuestions.Close;
    end
    else if (porcentagem >= 70) then
    begin
      FrmResult2.TextPercent.Text := FloatToStr(porcentagem) + '%';
      FrmResult2.Show;
      FrmQuestions.Close;
    end
    else if (porcentagem >= 50) then
    begin
      FrmResult3.TextPercent.Text := FloatToStr(porcentagem) + '%';
      FrmResult3.Show;
      FrmQuestions.Close;
    end
    else
    begin
      FrmResult4.TextPercent.Text := FloatToStr(porcentagem) + '%';
      FrmResult4.Show;
      FrmQuestions.Close;
    end;
    posicaoPergunta := 0;
  end
  else if posicaoPergunta < 3 then
  begin
    posicaoPergunta := posicaoPergunta + 1;
    posicaoResposta := posicaoResposta + 4;
    FrmQuestions.UpdateQuestions;
  end;
end;

procedure TFrmQuestions.RBAChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBC.IsChecked) or (RBD.IsChecked) then
  begin
    RBB.IsChecked := False;
    RBC.IsChecked := False;
    RBD.IsChecked := False;
    RBA.IsChecked := True;
  end;
end;

procedure TFrmQuestions.RBBChange(Sender: TObject);
begin
  if (RBA.IsChecked) or (RBC.IsChecked) or (RBD.IsChecked) then
  begin
    RBA.IsChecked := False;
    RBC.IsChecked := False;
    RBD.IsChecked := False;
    RBB.IsChecked := True;
  end;
end;

procedure TFrmQuestions.RBCChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBA.IsChecked) or (RBD.IsChecked) then
  begin
    RBB.IsChecked := False;
    RBA.IsChecked := False;
    RBD.IsChecked := False;
    RBC.IsChecked := True;
  end;
end;

procedure TFrmQuestions.RBDChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBC.IsChecked) or (RBA.IsChecked) then
  begin
    RBB.IsChecked := False;
    RBC.IsChecked := False;
    RBA.IsChecked := False;
    RBD.IsChecked := True;
  end;
end;

end.
