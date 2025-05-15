unit UReagendar;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  D2Bridge.Forms, Vcl.ExtCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TFormReagendamento = class(TD2BridgeForm)
    pnlCenter: TPanel;
    btnReagendar: TButton;
    btnCancelarReagendamento: TButton;
    dtReagendamento: TDateTimePicker;
    dtHoraReagendamento: TDateTimePicker;
    procedure btnCancelarReagendamentoClick(Sender: TObject);
    procedure btnReagendarClick(Sender: TObject);
  private
    { Private declarations }
  public
  codigoReagendamento : integer;
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FormReagendamento:TFormReagendamento;

implementation

Uses
  APSFSIWEBWebApp, FireDAC.Comp.Client, UDataModule, Data.DB, UCadAgendamento,
  UPrincipal;

{$R *.dfm}

function FormReagendamento:TFormReagendamento;
begin
  result:= TFormReagendamento(TFormReagendamento.GetInstance);
end;

procedure TFormReagendamento.btnCancelarReagendamentoClick(Sender: TObject);
begin
  Close;
end;

procedure TFormReagendamento.btnReagendarClick(Sender: TObject);
begin
  with TFDQuery.Create(self) do
  begin
    try
      connection := dm.con;

      sql.Add('update agendamentos');
      sql.Add('set DATA_AGENDADA = :DATA_AGENDADA, HORA_AGENDAMENTO = :HORA_AGENDAMENTO, HORA_ENTREGA = :HORA_ENTREGA, STATUS = ''0''');
      sql.Add('where id = :id');

      ParamByName('DATA_AGENDADA').DataType :=  ftdate;
      ParamByName('DATA_AGENDADA').asdate :=  dtReagendamento.Date;

      ParamByName('HORA_AGENDAMENTO').DataType := ftTime;
      ParamByName('HORA_AGENDAMENTO').AsTime := dtHoraReagendamento.Time;

      ParamByName('HORA_ENTREGA').DataType := ftTime;
      ParamByName('HORA_ENTREGA').Astime := FormCadAgendamentos.HoraEntrega(dtHoraReagendamento.Time);

      ParamByName('id').Value := Form1.codigoReagendamento;

      ExecSQL;

    finally
      ShowMessage('Atualizado com sucesso!');
      Free;
    end;

  end;

  Close;
end;

procedure TFormReagendamento.ExportD2Bridge;
begin
  inherited;

//  Title:= 'My D2Bridge Form';

  D2Bridge.HTML.Render.BodyStyle:= 'background-color: #191970; color: #191970;';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin

    with Row.Items.Add do
     VCLObj(dtReagendamento, CSSClass.Col.colsize6);
    with Row.Items.Add do
    with Row.Items.Add do
     VCLObj(dtHoraReagendamento, CSSClass.Col.colsize6);
    with Row.Items.Add do
     VCLObj(btnReagendar, CSSClass.Button.save + CSSClass.Col.colsize6);
    with Row.Items.Add do
     VCLObj(btnCancelarReagendamento, CSSClass.Button.cancel + CSSClass.Col.colsize6);


//    with Row.Add do
//    begin
//    with Card do
//    begin
//     CSSClasses:= CSSClass.Card.Card_Center;
//     HTMLStyle := 'background-color: #191970;';
//
//  //   ImageICOFromTImage(Image_Logo, CSSClass.Col.ColSize4);
//
//     with BodyItems.Add do
//     begin
//      with Row.Items.Add do
//       VCLObj(maskEditDataReagendamento, 'ValidationLogin', true);
//      with Row.Items.Add do
//       VCLObj(btnReagendar, CSSClass.Button.save);
//      with Row.Items.Add do
//       VCLObj(btnCancelarReagendamento, CSSClass.Button.cancel);
//     end;
//    end;
//  end;
  end;

end;

procedure TFormReagendamento.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

//  if PrismControl.VCLComponent = maskEditDataReagendamento then
//    PrismControl.AsEdit.TextMask := TPrismTextMask.BrazilDate;

 //Change Init Property of Prism Controls
 {
  if PrismControl.VCLComponent = Edit1 then
   PrismControl.AsEdit.DataType:= TPrismFieldType.PrismFieldTypeInteger;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
  end;
 }
end;

procedure TFormReagendamento.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
begin
 inherited;

 //Intercept HTML
 {
  if PrismControl.VCLComponent = Edit1 then
  begin
   HTMLControl:= '</>';
  end;
 }
end;

end.