object dm: Tdm
  OldCreateOrder = False
  Height = 249
  Width = 335
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Users\rrobasseto\Desktop\Mobile\BD\Banco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDQueryPessoa: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoa')
    Left = 96
    Top = 48
    object FDQueryPessoaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryPessoanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object FDQueryPessoausuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 50
    end
    object FDQueryPessoasenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object FDQueryPessoatelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
  end
end
