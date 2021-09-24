class postlogin {

  String _Resposta;

  postlogin(this._Resposta);

  String get Resposta => _Resposta;

  set Resposta(String value) {
    _Resposta = value;
  }

  static Future<postlogin> fromJson(decode) {}
}