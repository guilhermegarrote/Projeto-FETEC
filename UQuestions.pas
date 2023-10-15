unit UQuestions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmQuestions = class(TForm)
    LayoutMain: TLayout;
    Layout1: TLayout;
    ListView1: TListView;
    RBA: TRadioButton;
    RBD: TRadioButton;
    RBC: TRadioButton;
    RBB: TRadioButton;
    RoundRect1: TRoundRect;
    BtnConfirmar: TSpeedButton;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    RoundRect5: TRoundRect;
    BtnJogar: TSpeedButton;
    procedure RBAChange(Sender: TObject);
    procedure RBBChange(Sender: TObject);
    procedure RBCChange(Sender: TObject);
    procedure RBDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQuestions: TFrmQuestions;

implementation

{$R *.fmx}

procedure TFrmQuestions.RBAChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBC.IsChecked) or (RBD.IsChecked) then
    begin
      RBB.IsChecked:=False;
      RBC.IsChecked:=False;
      RBD.IsChecked:=False;
      RBA.IsChecked:=True;
    end;
end;

procedure TFrmQuestions.RBBChange(Sender: TObject);
begin
  if (RBA.IsChecked) or (RBC.IsChecked) or (RBD.IsChecked) then
    begin
      RBA.IsChecked:=False;
      RBC.IsChecked:=False;
      RBD.IsChecked:=False;
      RBB.IsChecked:=True;
    end;
end;

procedure TFrmQuestions.RBCChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBA.IsChecked) or (RBD.IsChecked) then
    begin
      RBB.IsChecked:=False;
      RBA.IsChecked:=False;
      RBD.IsChecked:=False;
      RBC.IsChecked:=True;
    end;
end;

procedure TFrmQuestions.RBDChange(Sender: TObject);
begin
  if (RBB.IsChecked) or (RBC.IsChecked) or (RBA.IsChecked) then
    begin
      RBB.IsChecked:=False;
      RBC.IsChecked:=False;
      RBA.IsChecked:=False;
      RBD.IsChecked:=True;
    end;
end;

end.