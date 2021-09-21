class Pegar{

  String _empresa;
  String _predio;
  String _matricula;
  String _telefone;
  String _profissao;
  String _funcao;
  String _cargo;
  String _regiao;
  String _lotacao;
  String _sindicalizacao;
  String _situacao;

  Pegar(
      this._empresa,
      this._predio,
      this._matricula,
      this._telefone,
      this._profissao,
      this._funcao,
      this._cargo,
      this._regiao,
      this._lotacao,
      this._sindicalizacao,
      this._situacao);

  String get situacao => _situacao;

  set situacao(String value) {
    _situacao = value;
  }

  String get sindicalizacao => _sindicalizacao;

  set sindicalizacao(String value) {
    _sindicalizacao = value;
  }

  String get lotacao => _lotacao;

  set lotacao(String value) {
    _lotacao = value;
  }

  String get regiao => _regiao;

  set regiao(String value) {
    _regiao = value;
  }

  String get cargo => _cargo;

  set cargo(String value) {
    _cargo = value;
  }

  String get funcao => _funcao;

  set funcao(String value) {
    _funcao = value;
  }

  String get profissao => _profissao;

  set profissao(String value) {
    _profissao = value;
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get matricula => _matricula;

  set matricula(String value) {
    _matricula = value;
  }

  String get predio => _predio;

  set predio(String value) {
    _predio = value;
  }

  String get empresa => _empresa;

  set empresa(String value) {
    _empresa = value;
  }
}