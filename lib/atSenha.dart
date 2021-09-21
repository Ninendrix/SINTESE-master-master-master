class atsenha {
  String resposta;

  atsenha({this.resposta});

  atsenha.fromJson(Map<String, dynamic> json) {
    resposta = json['Resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Resposta'] = this.resposta;
    return data;
  }
}