unit UResult2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrmResult2 = class(TForm)
    LayoutMain: TLayout;
    LayoutTop: TLayout;
    ImgMsg: TImage;
    TextMsgInicial: TText;
    LayoutCenter: TLayout;
    LayoutImage: TLayout;
    ImgIcon: TImage;
    LayoutResult: TLayout;
    LytResultClient: TLayout;
    LayoutResultTop: TLayout;
    ImgBackPercent: TImage;
    TextPercent: TText;
    LblVc: TLabel;
    Layout3: TLayout;
    TextCons: TText;
    LayoutBottom: TLayout;
    ImgBackBtn: TImage;
    BtnConfirmar: TSpeedButton;
    TextText: TText;
    Text1: TText;
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResult2: TFrmResult2;

implementation

{$R *.fmx}

uses UMenu;

procedure TFrmResult2.BtnConfirmarClick(Sender: TObject);
begin
FrmResult2.Close;
FrmMenu.EducacaoApertado.Visible:=false;
FrmMenu.SaudeApertado.Visible:=false;
FrmMenu.MeioAmbienteApertado.Visible:=false;
FrmMenu.SociedadeApertado.Visible:=false;
end;

end.
