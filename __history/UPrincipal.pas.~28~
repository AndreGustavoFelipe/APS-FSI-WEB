unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Menus, D2Bridge.Forms, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxMaskEdit, Vcl.ExtCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UCadAgendamento, Vcl.DBCtrls, UReagendar, Vcl.ComCtrls; //Declare D2Bridge.Forms always in the last unit

type
  TForm1 = class(TD2BridgeForm)
    MainMenu1: TMainMenu;
    Module11: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    qryAgendamentos: TFDQuery;
    ds: TDataSource;
    btnRefresh: TButton;
    Panel3: TPanel;
    lblDtAgendada: TLabel;
    DBTextDataAgendamento: TDBText;
    btnCancelarAgendamento: TButton;
    btnReagendar: TButton;
    dateBusca: TDateTimePicker;
    lblHoraAgendada: TLabel;
    DBTextHoraAgendamento: TDBText;
    lblHoraEntrega: TLabel;
    DBTextHoraEntrega: TDBText;
    lblFuncionario: TLabel;
    DBTextFuncionario: TDBText;
    lblStatus: TLabel;
    DBTextStatus: TDBText;
    qryAgendamentosID: TIntegerField;
    qryAgendamentosID_CLIENTE: TIntegerField;
    qryAgendamentosID_FUNCINARIO: TIntegerField;
    qryAgendamentosDATA_AGENDAMENTO: TDateField;
    qryAgendamentosDATA_AGENDADA: TDateField;
    qryAgendamentosHORA_AGENDAMENTO: TTimeField;
    qryAgendamentosHORA_ENTREGA: TTimeField;
    qryAgendamentosPLACA: TStringField;
    qryAgendamentosMODELO: TStringField;
    qryAgendamentosTIPO_VEICULO: TSmallintField;
    qryAgendamentosSTATUS: TStringField;
    qryAgendamentosRESULTADO_LEGIVEL: TStringField;
    procedure Module11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelarAgendamentoClick(Sender: TObject);
    procedure btnReagendarClick(Sender: TObject);
  private
    vFormReagendamento : TFormReagendamento;

  public
    codigoReagendamento : integer;

  protected
   procedure ExportD2Bridge; override;
   procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
   procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

Function Form1: TForm1;

implementation

Uses
   APSFSIWEBWebApp, UDataModule, Unit_Login;

Function Form1: TForm1;
begin
 Result:= TForm1(TForm1.GetInstance);
end;

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnCancelarAgendamentoClick(Sender: TObject);
var
  status: Integer;
begin
  status := ds.DataSet.FieldByName('STATUS').AsInteger;

  if status in [0, 1] then
  begin
    if (MessageDlg('Tem certeza que deseja cancelar este agendamento?', mtWarning, [mbNo, mbYes], 0) = mrYes) then
    begin
      with TFDQuery.Create(Self) do
      begin
        try
          connection := dm.con;

          SQL.Add('update agendamentos');
          SQL.Add('set status = :status');
          SQL.Add('where id = :id');

          ParamByName('id').Value := ds.DataSet.FieldByName('id').Value;
          ParamByName('status').Value := 3;

          ExecSQL;

        finally
          Free;
        end;
      end;

      btnRefreshClick(Self);
    end;
  end
  else if status = 2 then
    ShowMessage('Este agendamento já foi concluído e não pode ser cancelado.')
  else if status = 3 then
    ShowMessage('Este agendamento já está cancelado.')
  else if status = 4 then
    ShowMessage('Este agendamento está atrasado e não pode ser cancelado.');
end;

procedure TForm1.btnReagendarClick(Sender: TObject);
var
  status: Integer;
begin
  status := ds.DataSet.FieldByName('STATUS').AsInteger;

  if status in [0, 1, 4] then
  begin
    codigoReagendamento := ds.DataSet.FieldByName('ID').AsInteger;
    ShowPopupModal('PopupReagendamento');
    btnRefreshClick(Self);
  end
  else if status = 2 then
    ShowMessage('Este agendamento já foi concluído e não pode ser reagendado.')
  else if status = 3 then
    ShowMessage('Este agendamento está cancelado e não pode ser reagendado.');

  if IsD2BridgeContext then

end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
  qryAgendamentos.Close;
  qryAgendamentos.Open;
end;

procedure TForm1.ExportD2Bridge;
begin
 inherited;

 Title:= 'Seja bem vindo!';
 SubTitle:= 'Veja seus agendamentos:';

 D2Bridge.HTML.Render.BodyStyle := 'background-color: #191970;';

 //TemplateClassForm:= TD2BridgeFormTemplate;
 D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
 D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

 vFormReagendamento := TFormReagendamento.Create(Self);
 D2Bridge.AddNested(vFormReagendamento);

 //Export yours Controls
 with D2Bridge.Items.add do
 begin


  with SideMenu(MainMenu1) do
    HTMLStyle := 'background-color: #191970; color: white;';

  with Row.Add do
  begin
//    FormGroup('Informe uma data').AddVCLObj(maskEditData, CSSClass.Col.colsize1);
//    FormGroup('').AddVCLObj(btnRefresh, CSSClass.Button.refresh);

    with FormGroup('Informe uma data', CSSClass.Col.colsize3).Items.Add do
    begin
      VCLObj(dateBusca);
      VCLObj(btnRefresh, CSSClass.Button.search);
    end;
  end;

  with CardGrid(ds) do
  begin

    CardGridSize := CSSClass.CardGrid.CardGridX2;

   with CardDataModel.Items.Add do
   begin
    with Row.Items.Add do
    begin
     Col{Auto}.Add.VCLObj(lblStatus, CSSClass.Col.colsize6);
     Col.Add.VCLObj(DBTextStatus, CSSClass.Col.colsize6);
    end;

    with Row.Items.Add do
    begin
     Col{Auto}.Add.VCLObj(lblDtAgendada, CSSClass.Col.colsize6);
     Col.Add.VCLObj(DBTextDataAgendamento, CSSClass.Col.colsize6);
    end;

    with Row.Items.Add do
    begin
     Col{Auto}.Add.VCLObj(lblHoraAgendada, CSSClass.Col.colsize6);
     Col.Add.VCLObj(DBTextHoraAgendamento, CSSClass.Col.colsize6);
    end;

    with Row.Items.Add do
    begin
     Col{Auto}.Add.VCLObj(lblHoraEntrega, CSSClass.Col.colsize6);
     Col.Add.VCLObj(DBTextHoraEntrega, CSSClass.Col.colsize6);
    end;

    with Row.Items.Add do
    begin
     Col{Auto}.Add.VCLObj(lblFuncionario, CSSClass.Col.colsize6);
     Col.Add.VCLObj(DBTextFuncionario, CSSClass.Col.colsize6);
    end;

    with Row.Items.Add do
      VCLObj(btnReagendar, CSSClass.Button.edit + CSSClass.Col.colsize12);

    with Row.Items.Add do
      VCLObj(btnCancelarAgendamento, CSSClass.Button.cancel + CSSClass.Col.colsize12);

  end;


    with Popup('PopupReagendamento', 'Reagendamento').Items.Add do
      Nested(vFormReagendamento);

//  with Row.Add do
//    VCLObj(cxGridAgendamentos);

//  with Row.Add do
//    VCLObj(cxGridAgendamentos, CSSClass.Col.colsize12);

//  with Row.Add do
//  begin
//    with card do
//    begin
//      CSSClasses:= CSSClass.Card.Card_Center_Fullscreen;
//
//      with BodyItems.Add do
//      begin
//        with Row.Items.Add do
//          VCLObj(cxGridAgendamentos, CSSClass.Col.colsize12);
//
//      end;
//    end;
//  end;

  end;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//  if dtm = nil then
//    Tdtm.CreateInstance;

//  dtm.con.Connected := true;
  with qryAgendamentos do
  begin
    sql.Clear;
    sql.Add('SELECT ID, ID_CLIENTE, ID_FUNCINARIO, DATA_AGENDAMENTO, DATA_AGENDADA,');
    sql.Add('       HORA_AGENDAMENTO, HORA_ENTREGA, PLACA, MODELO, TIPO_VEICULO, status,');
    sql.Add('       CASE status');
    sql.Add('         WHEN ''0'' THEN ''Agendado''');
    sql.Add('         WHEN ''1'' THEN ''Em andamento''');
    sql.Add('         WHEN ''2'' THEN ''Finalizado''');
    sql.Add('         WHEN ''3'' THEN ''Cancelado''');
    sql.Add('         WHEN ''4'' THEN ''Atrasado''');
    sql.Add('         ELSE ''Desconhecido''');
    sql.Add('       END AS resultado_legivel');
    sql.Add('FROM agendamentos');

    sql.Add('where id_cliente = :id_cliente');
    ParamByName('id_cliente').Value := Form_Login.idUsuario.ToInteger;
  end;

  qryAgendamentos.Active := true;
//  btnRefreshClick(self);
end;

procedure TForm1.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

// if PrismControl.VCLComponent = maskEditData then
//  PrismControl.AsEdit.TextMask := TPrismTextMask;

 //Menu example
 {
  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Title:= 'AppTeste'; //or in SideMenu use asSideMenu

  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Image.URL:= 'https://d2bridge.com.br/images/LogoD2BridgeTransp.png'; //or in SideMenu use asSideMenu

  //GroupIndex example
  if PrismControl.VCLComponent = MainMenu1 then
   with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu
   begin
    MenuGroups[0].Caption:= 'Principal';
    MenuGroups[1].Caption:= 'Services';
    MenuGroups[2].Caption:= 'Items';
   end;

  //Chance Icon and Propertys MODE 1 *Using MenuItem component
  PrismControl.AsMainMenu.MenuItemFromVCLComponent(Abrout1).Icon:= 'fa-solid fa-rocket';

  //Chance Icon and Propertys MODE 2 *Using MenuItem name
  PrismControl.AsMainMenu.MenuItemFromName('Abrout1').Icon:= 'fa-solid fa-rocket';
 }

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

procedure TForm1.Module11Click(Sender: TObject);
begin
  if FormCadAgendamentos = nil then
    TFormCadAgendamentos.CreateInstance;

  FormCadAgendamentos.Show;

end;

procedure TForm1.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
