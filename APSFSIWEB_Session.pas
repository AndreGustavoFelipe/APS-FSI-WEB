unit APSFSIWEB_Session;

interface

uses
  System.SysUtils, System.Classes,
  Prism.SessionBase;

type
  TAPSFSIWEBSession = class(TPrismSessionBase)
  private

  public
   constructor Create(APrismSession: TPrismSession); override;  //OnNewSession
   destructor Destroy; override; //OnCloseSession
  end;


implementation

Uses
  D2Bridge.Instance,
  APSFSIWEBWebApp;

{$R *.dfm}

constructor TAPSFSIWEBSession.Create(APrismSession: TPrismSession); //OnNewSession
begin
 inherited;



end;

destructor TAPSFSIWEBSession.Destroy; //OnCloseSession
begin
 //Close ALL DataBase connection
 //Ex: Dm.DBConnection.Close;

 inherited;
end;

end.

