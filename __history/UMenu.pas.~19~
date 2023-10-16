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
    procedure BtnJogarClick(Sender: TObject);
    procedure BtnSaudeClick(Sender: TObject);
    procedure BtnEducacaoClick(Sender: TObject);
    procedure BtnMeioAmbienteClick(Sender: TObject);
    procedure BtnSociedadeClick(Sender: TObject);
  private
  public
    { Public declarations }
    tema: string;
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UQuestions;

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
  tema := 'educacao';
end;

procedure TFrmMenu.BtnJogarClick(Sender: TObject);
begin
  FrmQuestions.Show;
  if (tema = 'educacao') then
  begin
    FrmQuestions.RBA.Text := 'oiii';
  end;

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
  tema := 'meioambiente';
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
  tema := 'saude';
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
  tema := 'sociedade';
end;

end.
