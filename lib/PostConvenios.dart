class convenios{
  int _postId;
  String _Convenio;

  convenios(this._postId, this._Convenio);

  String get Convenio => _Convenio;

  set Convenio(String value) {
    _Convenio = value;
  }

  int get postId => _postId;

  set postId(int value) {
    _postId = value;
  }
  static Future<convenios> fromJson(decode) {}
}