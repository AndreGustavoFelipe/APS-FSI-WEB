unit UDataModule;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    con: TFDConnection;
  private
    { Private declarations }
  public
    class procedure CreateInstance;
  end;

function dm:Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

Uses
  D2Bridge.Instance, APSFSIWEBWebApp;

{$R *.dfm}

class procedure Tdm.CreateInstance;
begin
 D2BridgeInstance.CreateInstance(self);
end;

function dm:Tdm;
begin
 result:= Tdm(D2BridgeInstance.GetInstance(Tdm));
end;

end.