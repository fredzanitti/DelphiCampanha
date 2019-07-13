unit UProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ComCtrls, ShellAnimations;

type
  TfrmProgresso = class(TForm)
    gauProgresso: TGauge;
    lblMensagem: TLabel;
    aniProgresso: TAnimate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgresso: TfrmProgresso;

implementation

{$R *.dfm}

end.
