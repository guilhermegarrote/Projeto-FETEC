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
    LayoutText: TLayout;
    ImgIcon: TImage;
    TextResult: TText;
    TextExplicacao: TText;
    LayoutBottom: TLayout;
    Image7: TImage;
    BtnReiniciar: TSpeedButton;
    ImgMsg: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResult: TFrmResult;

implementation

{$R *.fmx}

end.
