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
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 32
    Top = 16
  end
  object FDQueryPessoa: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoa'
      'where email =:pNome;')
    Left = 32
    Top = 72
    ParamData = <
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPessoaid: TFDAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object FDQueryPessoanome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object FDQueryPessoacpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object FDQueryPessoacelular: TStringField
      FieldName = 'celular'
      Size = 13
    end
    object FDQueryPessoaendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object FDQueryPessoacidade: TStringField
      FieldName = 'cidade'
      Size = 60
    end
    object FDQueryPessoauf: TStringField
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object FDQueryPessoabairro: TStringField
      FieldName = 'bairro'
      Size = 60
    end
    object FDQueryPessoaemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object FDQueryPessoasenha: TStringField
      FieldName = 'senha'
      Size = 40
    end
    object FDQueryPessoaimg_usuario: TBlobField
      FieldName = 'img_usuario'
    end
  end
  object FDQueryProduto: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto')
    Left = 32
    Top = 128
    object FDQueryProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryProdutonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
    end
    object FDQueryProdutodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object FDQueryProdutovalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 14
      Size = 2
    end
    object FDQueryProdutoquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDQueryProdutoimg_produto: TBlobField
      FieldName = 'img_produto'
      Origin = 'img_produto'
    end
  end
end
