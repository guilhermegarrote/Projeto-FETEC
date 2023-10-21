unit UResult;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TFrmResult = class(TForm)
    LayoutMain: TLayout;
    LayoutTop: TLayout;
    LayoutCenter: TLayout;
    LayoutImage: TLayout;
    LayoutResult: TLayout;
    ImgIcon: TImage;
    ImgMsg: TImage;
    TextMsgInicial: TText;
    Image1: TImage;
    Txt1: TText;
    Layout1: TLayout;
    Text1: TText;
    LayoutBottom: TLayout;
    Image6: TImage;
    BtnConfirmar: TSpeedButton;
    Text2: TText;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    pontuacaoMaxima:double;
    porcentagem:double;
  end;

var
  FrmResult: TFrmResult;

implementation

{$R *.fmx}

uses UQuestions;

procedure TFrmResult.FormShow(Sender: TObject);
begin
pontuacaoMaxima := (4*0.25);
porcentagem:=(FrmQuestions.pontuacao/pontuacaoMaxima)*100;

if (porcentagem >= 90) then
  ImgIcon.Bitmap.LoadFromFile(ExtractFilePath(Application.PFetec) + 'emoji.png'));

end;

end.
