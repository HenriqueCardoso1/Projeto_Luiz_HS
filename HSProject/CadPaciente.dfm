object frmCadPaciente: TfrmCadPaciente
  Left = 205
  Top = 177
  ClientHeight = 442
  ClientWidth = 912
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    912
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 114
    Top = 10
    Width = 72
    Height = 18
    Caption = 'Paciente: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 120
    Width = 153
    Height = 18
    Caption = 'Data de Nascimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 192
    Top = 64
    Width = 38
    Height = 18
    Caption = 'CPF: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 64
    Width = 30
    Height = 18
    Caption = 'RG: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 8
    Top = 176
    Width = 292
    Height = 18
    Caption = 'Nome do Respons'#225'vel/Acompanhante: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 214
    Top = 120
    Width = 120
    Height = 18
    Caption = 'Tipo Sangu'#237'neo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 8
    Top = 256
    Width = 158
    Height = 18
    Caption = 'Resumo de Sintomas '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 442
    Top = 64
    Width = 79
    Height = 18
    Caption = 'Endere'#231'o: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 433
    Top = 120
    Width = 116
    Height = 18
    Caption = 'Complemento: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 433
    Top = 176
    Width = 71
    Height = 18
    Caption = 'Telefone:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl11: TLabel
    Left = 646
    Top = 176
    Width = 56
    Height = 18
    Caption = 'Celular:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl12: TLabel
    Left = 433
    Top = 226
    Width = 52
    Height = 18
    Caption = 'E-mail:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object lbl13: TLabel
    Left = 8
    Top = 10
    Width = 19
    Height = 18
    Caption = 'Id:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
  end
  object edtPaciente: TEdit
    Left = 114
    Top = 34
    Width = 790
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtDN: TEdit
    Left = 8
    Top = 146
    Width = 200
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtCPF: TEdit
    Left = 192
    Top = 90
    Width = 235
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtRG: TEdit
    Left = 8
    Top = 90
    Width = 178
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtAcompanhante: TEdit
    Left = 8
    Top = 202
    Width = 419
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object edtEndereco: TEdit
    Left = 433
    Top = 90
    Width = 471
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object edtComplemento: TEdit
    Left = 433
    Top = 146
    Width = 471
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object edtTelefone: TEdit
    Left = 433
    Top = 202
    Width = 207
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object edtCelular: TEdit
    Left = 646
    Top = 202
    Width = 258
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object edtEmail: TEdit
    Left = 433
    Top = 252
    Width = 471
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object mmoSintomas: TMemo
    Left = 8
    Top = 282
    Width = 896
    Height = 100
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object edtId: TEdit
    Left = 8
    Top = 34
    Width = 100
    Height = 24
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnExcluir: TBitBtn
    Left = 214
    Top = 405
    Width = 200
    Height = 25
    Caption = 'Excluir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000000000000827A7DFF6A6366FF6A6164FF6A6164FF6A6164FF6A6164FF6A61
      64FF6A6164FF6A6366FF6D6468FF000000000000000000000000000000000000
      0000787073FF93C4A8FF057B32FF007024FF006E21FFC7BDC0FFC5BCBEFF2384
      48FF26854BFF228348FF93C4A8FF787073FF0000000000000000000000000000
      00005D5357FF007423FF007D35FF007A2FFF00772BFFD5CACCFFD5CACCFF0076
      29FF00792DFF007C33FF007424FF5D5458FF000000000000000000000000E1DD
      DFFF9B9596FFB4D0C0FF008A39FF77BB93FFEDE2E7FFE0DEDEFFE0DEDEFFEAE1
      E4FFABCBB9FF008C3CFF93C4A8FF9C9596FFE4E0E1FF0000000000000000D4CF
      D1FFAAA6A8FFF7ECEFFF55B982FF009441FFD4E0D7FFE9E8E6FFE9E8E6FFE5E8
      E4FF09A24DFF22A85FFFFCEEF2FFAAA6A8FFE4E1E2FF0000000000000000A49C
      9FFFFDFDFCFFFBFBF8FFFDFBFAFFFFFEFFFFFFFFFFFFFCFBFAFFFCFBF9FFF7F9
      F6FFFFFFFFFFFFFCFCFFFBFBF9FFFDFDFCFFB9B3B5FF0000000000000000968D
      90FFFFFFFFFFFFFFFFFFFFFFFFFFD5F3E4FF4BC88BFFFFFFFFFFFFFFFFFF1FBC
      70FFDBF5E8FFFFFFFFFFFFFFFFFFFFFFFFFF988F92FF0000000000000000978E
      91FFF6F4F4FFEFEDEDFFEFEDEDFFFFF2F8FF31B87AFF1EB26DFF1DB26CFF10AE
      63FFF4F0F0FFEFEDEDFFEFEDEDFFF6F4F4FF978E91FF0000000000000000B3AA
      ADFFE8E7E5FFE4E2E1FFE4E2E1FFE9E4E5FFB8D7C7FF00A357FF00A257FFCADC
      D1FFEAE4E5FFE4E2E1FFE4E2E1FFE8E7E5FFB3AAADFF0000000000000000CABE
      C6FFD9D2D5FFD8D1D4FFD8D1D4FFD8D1D4FFDAD1D4FF79B59BFF89BAA2FFD9D0
      D4FFD8D1D4FFD8D1D4FFD8D1D4FFD9D2D5FFCABEC6FF000000009BB99BFF2B64
      22FF28611FFF28611FFF28611FFF28611FFF28611FFF2F6323FF2E6322FF2861
      1FFF28611FFF28611FFF28611FFF28611FFF2B6422FF9BB99BFF389547FF15AF
      47FF15AF47FF15AF47FF15AF47FF15AF47FF15AF47FF15AF47FF15AF47FF15AF
      47FF15AF47FF15AF47FF15AF47FF15AF47FF15AF47FF0E8624FF369C4EFF1FBA
      5AFF1FBA5CFF1EBA5BFF1FBA5CFF1FBA5CFF1FBA5CFF1EBA5BFF1EBA5BFF1FBA
      5CFF1FBA5CFF1EBA5AFF1FBA5AFF1FBA5AFF1FBA5AFF0E8D2EFF27A64DFF52D4
      90FF54D490FF54D490FF52D490FF54D490FF54D490FF52D490FF54D491FF54D4
      90FF54D490FF53D591FF54D490FF53D591FF52D490FF1EA548FFC4E7CCFF0462
      03FF036003FF036003FF036003FF036003FF036003FF036003FF036003FF0360
      03FF036003FF036003FF036003FF036003FF046103FFC4E3CAFF000000000000
      00000000000065AA70FF378E44FF0A7319FF0A7319FF097219FF097219FF0972
      19FF097219FF2F8A3DFF68AD73FF000000000000000000000000}
    ParentFont = False
    TabOrder = 13
    OnClick = btnExcluirClick
  end
  object btnGravar: TBitBtn
    Left = 464
    Top = 405
    Width = 200
    Height = 25
    Caption = 'Gravar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      00000000000000000000A3D8A4FF23A524FFCBEBCCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2E0B2FF2FB636FF24C332FF48C750FFD2EFD3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEE1AEFF2DB733FF2ACC3DFF2DD342FF25CA36FF45C84EFFD0EFD1FF0000
      000000000000000000000000000000000000000000000000000000000000B2E4
      B2FF2CB831FF2ACB3EFF32D64AFF40D958FF59DD6CFF29CC39FF47C850FFD1F0
      D3FF0000000000000000000000000000000000000000000000009ADE99FF2EBB
      31FF2BCA40FF36D852FF4ADB62FF50DF66FF88EA9BFF6CE27EFF28CB38FF45C7
      4EFFD0EDD1FF000000000000000000000000000000000000000037BF3AFF2CCA
      40FF39D95AFF50DE6BFF3DCA49FF6ACF6CFF4BC951FF8DEA9EFF61E075FF25CB
      36FF43C24BFFCFECD0FF000000000000000000000000000000002FC740FF41DB
      62FF60E17EFF4ACD57FF7ACE7AFF00000000BCE6BCFF53CD5AFF92EBA3FF57DD
      6AFF24CB36FF46C74FFFCFEBD0FF0000000000000000000000003AC846FF60DC
      7AFF5DD36FFF78CE7AFF000000000000000000000000BCE5BCFF5DD167FF93EC
      A4FF47D95CFF25CA36FF43BB48FFCDE9CDFF0000000000000000B4E8B5FF76CF
      79FF8ED390FF0000000000000000000000000000000000000000BDE7BEFF6FD7
      7BFF95EDA8FF47D95BFF24C835FF3EB743FFCEEACEFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFE9
      C1FF82E091FF9CEDAEFF47DA5CFF24C434FF3FB441FFD7EFD7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3ECC6FF7DE08DFF97EEABFF4BDB5FFF23C031FF59C25CFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C2EDC5FF6AD977FF83E794FF49DA5DFF17AC21FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0ECC3FF7EDE88FF62D972FF6ECF75FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E8F8E9FFCDF2D1FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentFont = False
    TabOrder = 12
    OnClick = btnGravarClick
  end
  object cbbTipoS: TComboBox
    Left = 214
    Top = 146
    Width = 213
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'Informe o Tipo Sangu'#237'neo'
    Items.Strings = (
      'Informe o Tipo Sangu'#237'neo'
      'A+'
      'A-'
      'B+'
      'B-'
      'AB+'
      'AB-'
      'O+'
      'O-')
  end
  object mm1: TMainMenu
    Left = 1090
    Top = 26
    object N: TMenuItem
      Caption = 'Sair'
      OnClick = NClick
    end
  end
end
