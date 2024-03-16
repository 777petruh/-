unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,RegularExpressions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Button9: TButton;
    DBRichEdit1: TDBRichEdit;
    DBNavigator1: TDBNavigator;
    DBRichEdit2: TDBRichEdit;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    CheckBox1: TCheckBox;
    Panel9: TPanel;
    Button6: TButton;
    Button8: TButton;
    Button2: TButton;
    Button1: TButton;
    Button5: TButton;
    Button4: TButton;
    Button3: TButton;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Button7: TButton;
    procedure FormResize(Sender: TObject);
    Function Find_in_DB(FindString:string; ADD_in_result:boolean ):boolean;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RichEdit1SelectionChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button9Click(Sender: TObject);
    procedure FDQuery2BeforePost(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var Memos:array [0..200]of TRichEdit;

implementation

{$R *.dfm}

Function Find_email(s:string; var res:Tstringlist ):boolean;
var
  RegEx: TRegEx;
  i:integer;
  M: TMatchCollection;
begin
//https://stackoverflow.com/questions/3809401/what-is-a-good-regular-expression-to-match-a-url
///происк Емайлов
RegEx := TRegex.Create('[\w-\.]+@([\w-]+\.)+[\w-]{2,4}',[roIgnoreCase,roMultiline]);
///происк ссылок
//RegEx := TRegex.Create('https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',[roIgnoreCase,roMultiline]);
///происк номеро
//RegEx := TRegex.Create('^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$',[roIgnoreCase,roMultiline]);
//поиск цифр
//RegEx := TRegex.Create('\d{3,}',[roIgnoreCase,roMultiline] );
if RegEx.IsMatch(s) then
   begin
      M:=RegEx.Matches(s);//получаем коллекцию совпадений
      for  i:=0 to M.Count-1 do  res.Add(M.Item[i].Value);
   end;
end;

Function Find_phones(s:string; var res:Tstringlist ):boolean;
var
  RegEx: TRegEx;
  i:integer;
  M: TMatchCollection;
begin
RegEx := TRegex.Create('(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?',[roIgnoreCase,roMultiline]);
//RegEx := TRegex.Create('((8|\+7)[\- ]?)?(\(?\d{3,4}\)?[\- ]?)?[\d\- ]{5,10}$',[roIgnoreCase]);
if RegEx.IsMatch(s) then
   begin
      M:=RegEx.Matches(s);//получаем коллекцию совпадений
      for  i:=0 to M.Count-1 do  res.Add(M.Item[i].Value);
   end;
end;

Function Find_URls(s:string; var res:Tstringlist ):boolean;
var
  RegEx: TRegEx;
  i:integer;
  M: TMatchCollection;
begin
RegEx := TRegex.Create('https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',[roIgnoreCase,roMultiline]);
if RegEx.IsMatch(s) then
   begin
      M:=RegEx.Matches(s);//получаем коллекцию совпадений
      for  i:=0 to M.Count-1 do  res.Add(M.Item[i].Value);
   end;
end;

Function Find_numbers(s:string; var res:Tstringlist ):boolean;
var
  RegEx: TRegEx;
  i:integer;
  M: TMatchCollection;
begin
RegEx := TRegex.Create('\d{3,}',[roIgnoreCase,roMultiline] );
if RegEx.IsMatch(s) then
   begin
      M:=RegEx.Matches(s);//получаем коллекцию совпадений
      for  i:=0 to M.Count-1 do  res.Add(M.Item[i].Value);
   end;
end;


Function delete_znac(s:string; ProgBar:TProgressBar):string;
var Znaki:string;
i:integer;
begin
Znaki:='!?:;".,<>—…0123456789-−«#»%()';
ProgBar.Position:=0;
ProgBar.Max:=length(Znaki);

For i:=1 to length(Znaki) do
  begin
  ProgBar.Position:=i;
  s:=StringReplace(s,Znaki[i],'',[rfReplaceAll, rfIgnoreCase]);
  end;
result:=s;
end;

Function delete_Predlogi_souzi(s:string; ProgBar:TProgressBar):string;
Var T:Tstringlist;
i:integer;
SpisokSort:TStringList;
begin


s:=#13#10+s;
s:=StringReplace(s,' ',#13#10,[rfReplaceAll, rfIgnoreCase]);

SpisokSort:=TStringList.Create;
SpisokSort.Duplicates:=dupIgnore;
SpisokSort.Sorted := True;
SpisokSort.Text:=s;
s:=SpisokSort.Text;
SpisokSort.Free;

T:=Tstringlist.Create;
T.LoadFromFile('Союзы.txt');
ProgBar.Position:=0;
ProgBar.Max:=t.Count-1;
for i := 0 to t.Count-1 do
  begin
  s:=StringReplace(s,#13#10+T[i]+#13#10,#13#10,[rfReplaceAll, rfIgnoreCase]);
  ProgBar.Position:=i;
  end;
T.LoadFromFile('Предлоги.txt');
ProgBar.Position:=0;
ProgBar.Max:=t.Count-1;
for i := 0 to t.Count-1 do
  begin
  s:=StringReplace(s,#13#10+T[i]+#13#10,#13#10,[rfReplaceAll, rfIgnoreCase]);
  ProgBar.Position:=i;
  end;
T.LoadFromFile('Местоимения.txt');
ProgBar.Position:=0;
ProgBar.Max:=t.Count-1;
for i := 0 to t.Count-1 do
  begin
  s:=StringReplace(s,#13#10+T[i]+#13#10,#13#10,[rfReplaceAll, rfIgnoreCase]);
  ProgBar.Position:=i;
  end;

result:=s;
end;

Function Find_and_ADDcolor(FindText:string;RichEdit: TRichEdit):boolean;
var s:string;
i,a:integer;
begin
If FindText='' then exit;
FindText:=ansilowercase(FindText);
s:='';
i:=1;
a:=1;
while I < length(RichEdit.Text) do
begin
  if ansilowercase(RichEdit.Text[i])=FindText[1] then
    begin
      s:=Copy(RichEdit.Text,i,length(FindText));
      if AnsiLowerCase(s)=AnsiLowerCase(FindText) then
        begin
          RichEdit.SelStart:=i-a;
          RichEdit.SelLength:=length(FindText);
          RichEdit.SelAttributes.Color:=clred;
        end;
    end;
if RichEdit.Text[i]=#10 then
  begin
    i:=i+1;
    a:=a+1;
  end
    else i:=i+1;
end;
end;

procedure TForm1.FDQuery2BeforePost(DataSet: TDataSet);
var
  buttonSelected : Integer;
begin
buttonSelected := MessageDlg('Вы уверены в изменении поисковой строки??',mtConfirmation, [mbYes,mbCancel], 0);
  if buttonSelected = mrYes then DataSet.FieldByName('Text_for_seach').Text:=DBRichEdit1.Text;
  if buttonSelected = mrCancel then DataSet.Cancel;

end;

Function TForm1.Find_in_DB(FindString:string; ADD_in_result:boolean ):boolean;
var i,j:integer;
begin
for i := 200 downto 0 do If Memos[i]<>nil then begin Memos[i].Destroy; Memos[i]:=nil;  end;
If FindString='' then exit;
j:=0;
result:=false;
FDQuery1.Close;
var s:=ansilowercase(FindString);
FDQuery1.ParamByName('S1').AsString:='%'+ansilowercase(FindString)+'%';
FDQuery1.Open();
if FDQuery1.IsEmpty=false then
begin
  result:=true;

  if ADD_in_result then
  begin

    FDQuery1.First;
    while not FDQuery1.eof do
    begin

      Memos[j]:=TRichEdit.Create(ScrollBox1);
      Memos[j].Parent:=ScrollBox1;
      Memos[j].Align:=alTop;
      Memos[j].ScrollBars:=ssVertical;
      Memos[j].Lines.Text:=FDQuery1.FieldByName('Text_All').AsString;
      Memos[j].OnSelectionChange:=RichEdit1SelectionChange;
      Memos[j].PopupMenu:=PopupMenu1;
      Memos[j].StyleElements:=[seClient,seBorder];
      Memos[j].Height:=150;
      Find_and_ADDcolor (ansilowercase(FindString),Memos[j]);

    inc(j);
    FDQuery1.Next;

    end;




  end
  else exit;

end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

RichEdit1.Lines.Text:=delete_znac(RichEdit1.Lines.Text,ProgressBar1);
While pos('  ',RichEdit1.Lines.Text)>0 do RichEdit1.Lines.Text:=StringReplace(RichEdit1.Lines.Text,'  ',' ',[rfReplaceAll, rfIgnoreCase]);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  RegEx: TRegEx;
  i:integer;
  M: TMatchCollection;
begin
//https://stackoverflow.com/questions/3809401/what-is-a-good-regular-expression-to-match-a-url
///происк Емайлов
//RegEx := TRegex.Create('[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',[roIgnoreCase,roMultiline]);
///происк ссылок
RegEx := TRegex.Create('https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',[roIgnoreCase,roMultiline]);
///происк номеро
//RegEx := TRegex.Create('^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$',[roIgnoreCase,roMultiline]);
//поиск цифр
//RegEx := TRegex.Create('\d{3,}',[roIgnoreCase,roMultiline] );
if RegEx.IsMatch(RichEdit1.Lines.Text) then

   begin

     M:=RegEx.Matches(RichEdit1.Lines.Text);//получаем коллекцию совпадений
     for  i:=0 to M.Count-1 do
       begin
         memo1.lines.Add(M.Item[i].Value);//выводим совпадение
          Find_and_ADDcolor(M.Item[i].Value,RichEdit1);
       end;
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
for i := 1 to 200 do
  begin

  Memos[i]:=TRichEdit.Create(ScrollBox1);
  Memos[i].Parent:=ScrollBox1;
  Memos[i].Align:=alTop;
  Memos[i].Lines.Text:=i.ToString;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i:integer;
begin
for i := 1 to 200 do If Memos[i]<>nil then  Memos[i].Destroy;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
    richedit1.selstart := 0;
    richedit1.sellength:=length(richedit1.Text);
    RichEdit1.SelAttributes.color:=clBlack;
    Find_and_ADDcolor ('123',RichEdit1);
end;

procedure TForm1.Button6Click(Sender: TObject);
Var T:Tstringlist;
i:integer;
SpisokSort:TStringList;
Time:longint;
begin

time:=gettickcount;
RichEdit1.Lines.Text:=#13#10+RichEdit1.Lines.Text;
RichEdit1.Lines.Text:=StringReplace(RichEdit1.Lines.Text,' ',#13#10,[rfReplaceAll, rfIgnoreCase]);

SpisokSort:=TStringList.Create;
SpisokSort.Duplicates:=dupIgnore;
SpisokSort.Sorted := True;
SpisokSort.Text:=Richedit1.Text;
Richedit1.Text:=SpisokSort.Text;
SpisokSort.Free;

T:=Tstringlist.Create;
T.LoadFromFile('Союзы.txt');
for i := 0 to t.Count-1 do
  begin
  RichEdit1.Lines.Text:=StringReplace(RichEdit1.Lines.Text,#13#10+T[i]+#13#10,#13#10,[rfReplaceAll, rfIgnoreCase]);
  end;
T.LoadFromFile('Предлоги.txt');
for i := 0 to t.Count-1 do
  begin
  RichEdit1.Lines.Text:=StringReplace(RichEdit1.Lines.Text,#13#10+T[i]+#13#10,#13#10,[rfReplaceAll, rfIgnoreCase]);
  end;



time:=(gettickcount-time);
StatusBar1.Panels[0].Text:=RichEdit1.Lines.Count.ToString;
StatusBar1.Panels[1].Text :='время работы: '+time.ToString +'ms';
end;

procedure TForm1.Button7Click(Sender: TObject);
var T:Tstringlist;
i:integer;
Time:longint;
begin
time:=gettickcount;
memo1.Clear;
    richedit1.selstart := 0;
    richedit1.sellength:=length(richedit1.Text);
    RichEdit1.SelAttributes.color:=clBlack;

T:=Tstringlist.Create;
///Поиск E-mail
If CheckBox2.Checked then memo1.Lines.Add('Поиск E-mail');
Find_email(RichEdit1.Lines.Text,t);
for i := 0 to T.Count-1 do if Find_in_DB(T[i],false) then Find_and_ADDcolor(T[i],RichEdit1);
If CheckBox2.Checked then for i := 0 to T.Count-1 do memo1.Lines.Add(T[i]);
T.Clear;
///Поиск телефонных номеров
If CheckBox2.Checked then memo1.Lines.Add('Поиск телефонных номеров');
Find_phones(RichEdit1.Lines.Text,t);
for i := 0 to T.Count-1 do if Find_in_DB(T[i],false) then Find_and_ADDcolor(T[i],RichEdit1);

If CheckBox2.Checked then for i := 0 to T.Count-1 do memo1.Lines.Add(T[i]);
T.Clear;

///Поиск URL адресов
If CheckBox2.Checked then memo1.Lines.Add('URL адресов');
Find_URls(RichEdit1.Lines.Text,t);
for i := 0 to T.Count-1 do if Find_in_DB(T[i],false) then Find_and_ADDcolor(T[i],RichEdit1);

If CheckBox2.Checked then for i := 0 to T.Count-1 do memo1.Lines.Add(T[i]);
T.Clear;

///Поиск цифр последовательнсоти цифр от 3 и более
If CheckBox2.Checked then memo1.Lines.Add('Поиск цифр последовательнсоти цифр от 3 и более');
Find_numbers(RichEdit1.Lines.Text,t);
for i := 0 to T.Count-1 do if Find_in_DB(T[i],false) then Find_and_ADDcolor(T[i],RichEdit1);

If CheckBox2.Checked then for i := 0 to T.Count-1 do memo1.Lines.Add(T[i]);
T.Clear;

///Поиск слов в словаре
///
T.Text:=RichEdit1.Lines.Text;
///Удаляем лишние знаки
If CheckBox2.Checked then memo1.Lines.Add('Удаляем лишние знаки');
StatusBar1.Panels[2].Text:='Удаляем знаки препинания';

T.Text:=delete_znac(T.Text,ProgressBar1);
///Удаляем двойные пробелы
If CheckBox2.Checked then memo1.Lines.Add('Удаляем двойные пробелы');
StatusBar1.Panels[2].Text:='Удаляем двойные пробелы';
While pos('  ',T.Text)>0 do T.Text:=StringReplace(T.Text,'  ',' ',[rfReplaceAll, rfIgnoreCase]);
///Удаляем предлоги и союзы, местоимения + сортировка
If CheckBox2.Checked then memo1.Lines.Add('Удаляем предлоги и союзы, местоимения + сортировка');
StatusBar1.Panels[2].Text:='Удаляем предлоги и союзы';
T.Text:=delete_Predlogi_souzi(T.Text,ProgressBar1);
//Удаляев короткие слова и союзы
for i := T.Count-1 downto 0 do if T[I].Length<3 then T.Delete(i);

for i := 0 to T.Count-1 do if Find_in_DB(T[i],false) then Find_and_ADDcolor(T[i],RichEdit1);

If CheckBox2.Checked then for i := 0 to T.Count-1 do memo1.Lines.Add(T[i]);
StatusBar1.Panels[0].Text:='Слов обработанно: '+T.Count.ToString;
T.Clear;

time:=(gettickcount-time);

StatusBar1.Panels[1].Text :='время работы: '+time.ToString +'ms';
StatusBar1.Panels[2].Text:='Готово';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
FDQuery1.Close;
FDQuery1.ParamByName('S1').AsString:='%глаз%';
FDQuery1.Open();
if FDQuery1.IsEmpty=false then
begin

  Memos[1]:=TRichEdit.Create(ScrollBox1);
  Memos[1].Parent:=ScrollBox1;
  Memos[1].Align:=alTop;
  Memos[1].ScrollBars:=ssVertical;
  Memos[1].Lines.Text:=FDQuery1.FieldByName('Text_All').AsString;
  Memos[1].OnSelectionChange:=RichEdit1SelectionChange;
  Memos[1].PopupMenu:=PopupMenu1;
  Find_and_ADDcolor ('глаз',Memos[1]);
end;


end;

procedure TForm1.Button9Click(Sender: TObject);
begin

FDQuery2.Open();
DBRichEdit1.DataField:='Text_for_seach';
DBRichEdit2.DataField:='Text_All';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
If CheckBox1.Checked then dbgrid1.Options := dbgrid1.Options + [dgEditing] else dbgrid1.Options := dbgrid1.Options - [dgEditing];
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
If CheckBox2.Checked then  memo1.Visible:=true else memo1.Visible:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FDConnection1.Params.Database:=ExtractFileDir(Application.ExeName)+'\New';
FDConnection1.Connected:=true;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
Panel2.Width:=Form1.Width div 2;
DBRichEdit1.Width:=Form1.Width div 2;
DBGrid1.Columns[1].Width:=Form1.Width div 2 - 70;
DBGrid1.Columns[2].Width:=Form1.Width div 2-50;
Panel7.Width:=Form1.Width div 2 ;
Panel8.Width:=Form1.Width div 2;
end;

procedure TForm1.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  C: String;
begin
if ssCtrl in Shift then begin
    C:= LowerCase(Char(Key));
    if C = 'f' then begin
      Find_in_DB(RichEdit1.SelText,true);
    end;
end;
end;

procedure TForm1.RichEdit1SelectionChange(Sender: TObject);
var i:integer;
begin
//if RichEdit1.SelText.Length>0 then memo1.Lines.Add(RichEdit1.SelText);
//if RichEdit1.SelText.Length>0 then Find_in_DB(RichEdit1.SelText,true);

//for i := 1 to 200 do If Memos[i]<>nil then  if Memos[i].SelText.Length>0 then memo1.Lines.Add(Memos[i].SelText);
end;

/// функция для прокрутки колосиком скролбокса
procedure TForm1.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
if WheelDelta>0 then
  Scrollbox1.VertScrollBar.Position:=Scrollbox1.VertScrollBar.Position-15
  else Scrollbox1.VertScrollBar.Position:=Scrollbox1.VertScrollBar.Position+15;
end;

end.
