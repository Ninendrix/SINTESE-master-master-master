class postfiliacoes{
  int _postId;
  String _Empresa;
  String _Predio;
  String _Matricula;
  String _Telefone;
  String _Profissao;
  String _Funcao;
  String _Cargo;
  String _Regiao;
  String _Lotacao;
  String _Sindicalizacao;
  String _Situacao;

  postfiliacoes(
      this._postId,
      this._Empresa,
      this._Predio,
      this._Matricula,
      this._Telefone,
      this._Profissao,
      this._Funcao,
      this._Cargo,
      this._Regiao,
      this._Lotacao,
      this._Sindicalizacao,
      this._Situacao,
      );

  String get Situacao => _Situacao;

  set Situacao(String value) {
    _Situacao = value;
  }

  String get Sindicalizacao => _Sindicalizacao;

  set Sindicalizacao(String value) {
    _Sindicalizacao = value;
  }

  String get Lotacao => _Lotacao;

  set Lotacao(String value) {
    _Lotacao = value;
  }

  String get Regiao => _Regiao;

  set Regiao(String value) {
    _Regiao = value;
  }

  String get Cargo => _Cargo;

  set Cargo(String value) {
    _Cargo = value;
  }

  String get Funcao => _Funcao;

  set Funcao(String value) {
    _Funcao = value;
  }

  String get Profissao => _Profissao;

  set Profissao(String value) {
    _Profissao = value;
  }

  String get Telefone => _Telefone;

  set Telefone(String value) {
    _Telefone = value;
  }

  String get Matricula => _Matricula;

  set Matricula(String value) {
    _Matricula = value;
  }

  String get Predio => _Predio;

  set Predio(String value) {
    _Predio = value;
  }

  String get Empresa => _Empresa;

  set Empresa(String value) {
    _Empresa = value;
  }

  int get postId => _postId;

  set postId(int value) {
    _postId = value;
  }

  static Future<postfiliacoes> fromJson(decode) {}
}