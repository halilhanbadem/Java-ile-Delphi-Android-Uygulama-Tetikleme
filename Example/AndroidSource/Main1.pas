unit Main1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Androidapi.JNI.JavaTypes, Androidapi.JNI.App, Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    Text1: TText;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
 System.Android.Service;

function getTimeAfterInSecs(Seconds: Integer): Int64;
var
  Calendar: JCalendar;
begin
  Calendar := TJCalendar.JavaClass.getInstance;
  Calendar.add(TJCalendar.JavaClass.SECOND, Seconds);
  Result := Calendar.getTimeInMillis;
end;


procedure TfrmMain.Button1Click(Sender: TObject);
var
  Intent: JIntent;
  PendingIntent: JPendingIntent;
begin
  Intent := TJIntent.Create;
  Intent.setClassName(TAndroidHelper.Context, StringToJString('com.embarcadero.firemonkey.FMXNativeActivity'));
  PendingIntent := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, 1, Intent, 0);
  TAndroidHelper.AlarmManager.&set(TJAlarmManager.JavaClass.RTC_WAKEUP, getTimeAfterInSecs(30),
    PendingIntent);
end;

end.
