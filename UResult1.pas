unit UResult1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrmResult1 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResult1: TFrmResult1;

implementation

{$R *.fmx}

end.
