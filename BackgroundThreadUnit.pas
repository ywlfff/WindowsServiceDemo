unit BackgroundThreadUnit;

interface

uses
  System.Classes,
  SvcMgr,
  CnDebug;

type
  TBackgroundThread = class(TServiceThread)
  private
    FPaused: Boolean;
    // FTerminated: Boolean;
    // FOnTerminate: TNotifyEvent;
  protected
    procedure Execute; override;
  public
    procedure Pause;
    procedure Continue;
    procedure ProcessRequests(WaitForMessage: Boolean);

    // procedure Terminate;
    // property OnTerminate: TNotifyEvent read FOnTerminate write FOnTerminate;
  end;

implementation

uses
  System.SysUtils, System.IOUtils;

procedure TBackgroundThread.Continue;
begin
  FPaused := False;
end;

  // process something here
procedure TBackgroundThread.Execute;
var
  LogFile: TextFile;
begin
  try

    FPaused := False;
//    AssignFile(LogFile, 'C:TempLogs.log');
//    Rewrite(LogFile);

    while not Terminated do
    begin
//       CnDebugger.LogMsg(dateTimeToStr(Now));
      if not FPaused then
      begin
        CnDebugger.LogMsg(dateTimeToStr(Now));
//        WriteLn(LogFile, 'Logs From Background Thread: ' + DateTimeToStr(Now));
      end;
      TThread.Sleep(1000);
    end;
  finally
//    CloseFile(LogFile);
  end;
end;

procedure TBackgroundThread.Pause;
begin
  FPaused := True;
end;

procedure TBackgroundThread.ProcessRequests(WaitForMessage: Boolean);
begin
     CnDebugger.LogMsg(dateTimeToStr(Now));
end;

end.
