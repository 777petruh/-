object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1040#1088#1093#1080#1074#1072#1088#1080#1091#1089
  ClientHeight = 617
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 598
    Width = 998
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 813
    Height = 598
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1073#1072#1079#1077
      object Splitter1: TSplitter
        Left = 201
        Top = 0
        Height = 568
        ExplicitLeft = 264
        ExplicitTop = 153
        ExplicitHeight = 314
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 201
        Height = 568
        Align = alLeft
        Caption = 'Panel2'
        TabOrder = 0
        object RichEdit1: TRichEdit
          Left = 1
          Top = 86
          Width = 199
          Height = 481
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          StyleElements = [seClient, seBorder]
          OnKeyDown = RichEdit1KeyDown
          OnSelectionChange = RichEdit1SelectionChange
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 199
          Height = 41
          Align = alTop
          Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'. '#1059#1090#1086#1095#1085#1077#1085#1080#1077' Ctrl+F'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Panel1: TPanel
          Left = 1
          Top = 42
          Width = 199
          Height = 44
          Align = alTop
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 2
          object ProgressBar1: TProgressBar
            Left = 1
            Top = 26
            Width = 197
            Height = 17
            Align = alBottom
            TabOrder = 0
          end
          object Button7: TButton
            Left = 1
            Top = 1
            Width = 197
            Height = 25
            Align = alTop
            Caption = #11015#65039#11015#65039#11015#65039' '#1053#1072#1095#1072#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091' '#11015#65039#11015#65039#11015#65039
            TabOrder = 1
            OnClick = Button7Click
          end
        end
      end
      object Panel3: TPanel
        Left = 204
        Top = 0
        Width = 601
        Height = 568
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object ScrollBox1: TScrollBox
          Left = 1
          Top = 1
          Width = 599
          Height = 566
          VertScrollBar.Tracking = True
          Align = alClient
          TabOrder = 0
          OnMouseWheel = ScrollBox1MouseWheel
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 595
            Height = 145
            Align = alTop
            Lines.Strings = (
              'Memo1')
            ScrollBars = ssVertical
            TabOrder = 0
            Visible = False
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1073#1072#1079#1099
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 425
        Top = 184
        Height = 384
        ExplicitLeft = 416
        ExplicitTop = 296
        ExplicitHeight = 100
      end
      object Splitter3: TSplitter
        Left = 0
        Top = 144
        Width = 805
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 428
        ExplicitTop = 145
        ExplicitWidth = 431
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 33
        Width = 805
        Height = 111
        Align = alTop
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Punkt'
            Title.Caption = #1055#1091#1085#1082#1090
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Text_for_seach'
            Title.Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
            Width = 378
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Text_All'
            Title.Caption = #1055#1086#1083#1085#1099#1081' '#1090#1077#1082#1089#1090
            Width = 300
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 805
        Height = 33
        Align = alTop
        Caption = 'Panel5'
        ShowCaption = False
        TabOrder = 1
        object Button9: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 185
          Height = 25
          Align = alLeft
          Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1074#1089#1077' '#1076#1072#1085#1085#1099#1077
          TabOrder = 0
          OnClick = Button9Click
        end
        object DBNavigator1: TDBNavigator
          Left = 413
          Top = 1
          Width = 240
          Height = 31
          DataSource = DataSource1
          Align = alLeft
          TabOrder = 1
        end
        object CheckBox1: TCheckBox
          Left = 192
          Top = 1
          Width = 221
          Height = 31
          Align = alLeft
          Caption = #1074#1082#1083'. '#1088#1077#1076#1072#1082#1090#1080#1088'. '#1089#1090#1088#1086#1082
          TabOrder = 2
          OnClick = CheckBox1Click
        end
      end
      object DBRichEdit1: TDBRichEdit
        Left = 0
        Top = 184
        Width = 425
        Height = 384
        Align = alLeft
        DataSource = DataSource1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 2
      end
      object DBRichEdit2: TDBRichEdit
        Left = 428
        Top = 184
        Width = 377
        Height = 384
        Align = alClient
        DataSource = DataSource1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ReadOnly = True
        TabOrder = 3
      end
      object Panel6: TPanel
        Left = 0
        Top = 147
        Width = 805
        Height = 37
        Align = alTop
        Caption = 'Panel6'
        ShowCaption = False
        TabOrder = 4
        object Panel8: TPanel
          Left = 422
          Top = 1
          Width = 421
          Height = 35
          Align = alLeft
          Caption = #1055#1086#1083#1085#1099#1081' '#1090#1077#1082#1089#1090' '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 421
          Height = 35
          Align = alLeft
          Caption = #1058#1077#1082#1089#1090' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1073#1091#1076#1077#1090' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1087#1086#1080#1089#1082
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object Panel9: TPanel
    Left = 813
    Top = 0
    Width = 185
    Height = 598
    Align = alRight
    Caption = 'Panel9'
    TabOrder = 2
    object Button6: TButton
      Left = 1
      Top = 26
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1076#1083#1086#1075#1080' '#1080' '#1089#1086#1102#1079#1099
      TabOrder = 0
      OnClick = Button6Click
    end
    object Button8: TButton
      Left = 1
      Top = 76
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1044#1041
      TabOrder = 1
      OnClick = Button8Click
    end
    object Button2: TButton
      Left = 1
      Top = 1
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1087#1086#1080#1089#1082' email'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 1
      Top = 51
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1085#1072#1082#1080
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 1
      Top = 126
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1042#1099#1076#1077#1083#1077#1085#1077' '#1094#1074#1077#1090#1086#1084' '#1085#1072#1081#1076#1077#1085#1086#1075#1086
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button4: TButton
      Left = 1
      Top = 101
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1091#1076#1072#1083#1077#1085#1080#1077
      TabOrder = 5
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 1
      Top = 151
      Width = 183
      Height = 25
      Align = alTop
      Caption = #1076#1086#1073#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 6
      OnClick = Button3Click
    end
    object CheckBox2: TCheckBox
      Left = 1
      Top = 176
      Width = 183
      Height = 17
      Align = alTop
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1083#1086#1075
      TabOrder = 7
      OnClick = CheckBox2Click
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    Left = 725
    Top = 394
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from main where Text_for_seach like :S1')
    Left = 469
    Top = 400
    ParamData = <
      item
        Name = 'S1'
        ParamType = ptInput
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 312
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1083#1086#1074#1086' '#1080#1079' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1074' '#1073#1072#1079#1077
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery2
    Left = 629
    Top = 298
  end
  object FDQuery2: TFDQuery
    BeforePost = FDQuery2BeforePost
    FieldOptions.BlobDisplayValue = dvFullText
    Connection = FDConnection1
    SQL.Strings = (
      'select * from main ')
    Left = 541
    Top = 400
  end
end
