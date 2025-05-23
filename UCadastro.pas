unit UCadastro;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  D2Bridge.Forms, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormCadastro = class(TD2BridgeForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    editUsername: TEdit;
    editPassword: TEdit;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    ToolBar1: TToolBar;
    editRepeatPassword: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FormCadastro:TFormCadastro;

implementation

Uses
  APSFSIWEBWebApp, FireDAC.Comp.Client, UDataModule;

{$R *.dfm}

function FormCadastro:TFormCadastro;
begin
  result:= TFormCadastro(TFormCadastro.GetInstance);
end;

procedure TFormCadastro.btnCadastrarClick(Sender: TObject);
var
  existe : boolean;
begin
  existe := false;

  if (editPassword.Text = editPassword.Text) then
   begin
    with TFDQuery.Create(Self) do
      begin
        try
          Connection := dm.con;

          sql.Clear;
          sql.Add('select * from usuarios');
          sql.Add('where nome = :n');

          ParamByName('n').Value := editUsername.Text;

          open;

          if RecordCount > 0 then
            existe := true;

          if not existe then
          begin
            SQL.Clear;
            SQL.Add('insert into USUARIOS(NOME, SENHA, TIPO)');
            SQL.Add('values(:nome, :senha, :tipo)');

            ParamByName('nome').Value := editUsername.Text;
            ParamByName('senha').Value := editPassword.Text;
            ParamByName('tipo').Value := '0';

            ExecSQL;
            ShowMessage('Usuario Cadastrado com Sucesso!');
          end

          else
            ShowMessage('Esse Usu�rio j� Existe!');

        finally
          Free;
        end;
      end;

    if not existe then
      Close;
   end
   else
   begin
    D2Bridge.Validation(editUsername, false);
    D2Bridge.Validation(editPassword, false);
    D2Bridge.Validation(editRepeatPassword, false, 'Usuario ou senha inv�lidos!');
    Exit;
   end;


end;

procedure TFormCadastro.btnCancelarClick(Sender: TObject);
begin
  editUsername.text := '';
  editPassword.text := '';
  Close;
end;

procedure TFormCadastro.ExportD2Bridge;
begin
  inherited;

 Title:= 'My D2Bridge Web Application';
 SubTitle:= 'My WebApp';

 //Background color
 D2Bridge.HTML.Render.BodyStyle:= 'background-color: #191970;';

 //TemplateClassForm:= TD2BridgeFormTemplate;
 D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
 D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

 //Export yours Controls
 with D2Bridge.Items.add do
 begin

  //Image Backgroup Full Size *Use also ImageFromURL...
//  ImageFromTImage(Image_BackGround, CSSClass.Image.Image_BG20_FullSize);

  with Card do
  begin
   CSSClasses:= CSSClass.Card.Card_Center;
   HTMLStyle := 'background-color: #191970;';

//   ImageICOFromTImage(Image_Logo, CSSClass.Col.ColSize4);

   with BodyItems.Add do
   begin
    with Row.Items.Add do
     VCLObj(Label_Cadastro);
    with Row.Items.Add do
     VCLObj(editUsername, 'ValidationLogin', true);
    with Row.Items.Add do
     VCLObj(editPassword, 'ValidationLogin', true);
    with Row.Items.Add do
     VCLObj(editRepeatPassword, 'ValidationLogin', true);
    with Row.Items.Add do
     VCLObj(btnCadastrar, 'ValidationLogin', false);
    with Row.Items.Add do
     VCLObj(btnCancelar);
   end;
  end;
 end;

end;

procedure TFormCadastro.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

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

procedure TFormCadastro.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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