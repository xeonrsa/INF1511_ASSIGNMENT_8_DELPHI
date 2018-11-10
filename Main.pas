unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Spin;

type
  TformCalsLost = class(TForm)
    imgRun: TImage;
    spinJogging: TSpinEdit;
    spinRowing: TSpinEdit;
    lblJoggin: TLabel;
    lblRowing: TLabel;
    lblTitle: TLabel;
    btnCalc: TButton;
    btnReset: TButton;
    btnAddNote: TButton;
    edtResultGrams: TEdit;
    lblResultGrams: TLabel;
    memNotes: TMemo;
    edtResultKG: TEdit;
    lblResultKG: TLabel;
    procedure btnCalcClick(Sender: TObject);
    procedure btnAddNoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function AddGrams(agJoggingHours,agRowingHours : Real) : Real;
    Procedure AddNote;
  end;

var
  formCalsLost: TformCalsLost;

implementation

{$R *.dfm}

{************* AddGrams *************}

function TformCalsLost.AddGrams(agJoggingHours, agRowingHours: Real): Real;
var
  // Declare required Vars
  TotalCal, GramsLost : Integer;
begin
  // Calculate Total cals
  TotalCal := Round(agJoggingHours * 200) + Round(agRowingHours * 475);
  // Calculate Grams Lost
  Gramslost := TotalCal * 10 DIV 77;
  // Return Grams lost as function result
  Result := GramsLost;
end;

{************* AddNote *************}

procedure TformCalsLost.AddNote;
Var
  // Declare required Vars
  tmpNote : String;
  tmpDate : String;
begin
  // Set Defualt Values
  tmpDate := DateTimeToStr(Now);
  // Get Required input from user
  tmpNote := InputBox('Cal Cals Lost','Add Personal Comment?','');
  // Check if user entered valid input
  If (tmpNote <> '') Then Begin
    // Display user input 
    formCalsLost.memNotes.Lines.Add(tmpDate);
    formCalsLost.memNotes.Lines.Add(tmpNote);
    formCalsLost.memNotes.Lines.Add('***********');
  End Else Begin
    // Inform user if input not correct
    ShowMessage('Note can''t be blank!');
  End;
end;

procedure TformCalsLost.btnCalcClick(Sender: TObject);
Var
  GramsLost : Real;
begin
  GramsLost := AddGrams(formCalsLost.spinJogging.Value,formCalsLost.spinRowing.Value);
  edtResultGrams.Text := FloatToStr(GramsLost) + ' GRAMS';
  edtResultKG.Text    :=  FloatToStr(GramsLost/1000) + ' KG';
end;

procedure TformCalsLost.btnAddNoteClick(Sender: TObject);
begin
  AddNote;
end;

end.

