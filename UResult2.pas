unit UResult2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrmResult2 = class(TForm)
    LayoutMain: TLayout;
    Layout1: TLayout;
    LayoutBottom: TLayout;
    ImgBackBtn: TImage;
    BtnConfirmar: TSpeedButton;
    TextText: TText;
    Text1: TText;
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
    LayoutTop: TLayout;
    ImgMsg: TImage;
    TextMsgInicial: TText;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
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
FrmMenu.LblAlert.Visible:=False;
end;

procedure TFrmResult2.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if(Key=vkHardwareBack) then
  begin
    Key:=0;
  end;
end;

end.
