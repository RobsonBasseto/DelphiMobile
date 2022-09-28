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
    Aggregates = <
      item
      end>
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
    object FDQueryProdutofavorito: TStringField
      FieldName = 'favorito'
      Origin = 'favorito'
      FixedChar = True
      Size = 32767
    end
    object FDQueryProdutoimg_produto: TBlobField
      FieldName = 'img_produto'
      Origin = 'img_produto'
    end
  end
  object FDQFavoritos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto where id = :pIdProduto'
      'and favorito = '#39'S'#39)
    Left = 136
    Top = 104
    ParamData = <
      item
        Name = 'PIDPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Origin = 'nome'
    end
    object StringField2: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object BCDField1: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 14
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object BlobField1: TBlobField
      FieldName = 'img_produto'
      Origin = 'img_produto'
    end
  end
  object FDQListaFavoritos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto where favorito = '#39'S'#39)
    Left = 176
    Top = 192
    object FDQListaFavoritosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListaFavoritosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
    end
    object FDQListaFavoritosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object FDQListaFavoritosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 14
      Size = 2
    end
    object FDQListaFavoritosquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDQListaFavoritosfavorito: TStringField
      FieldName = 'favorito'
      Origin = 'favorito'
      FixedChar = True
      Size = 32767
    end
    object FDQListaFavoritosimg_produto: TBlobField
      FieldName = 'img_produto'
      Origin = 'img_produto'
    end
  end
  object FDQPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pedido')
    Left = 200
    Top = 64
  end
  object FDQItemPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from itempedido')
    Left = 256
    Top = 136
  end
  object FDQueryLogado: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoa where id =:pid')
    Left = 32
    Top = 184
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
