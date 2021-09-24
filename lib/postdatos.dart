class PostDados {
  String nome;
  String pai;
  String mae;
  String naturalidade;
  String rG;
  String sexo;
  String fatorRH;
  String estadoCivil;
  String endereco;
  String complemento;
  String bairro;
  String cidade;
  String uF;
  String cEP;
  String celular;
  String celular2;
  String telefone;

  PostDados(
      {this.nome,
        this.pai,
        this.mae,
        this.naturalidade,
        this.rG,
        this.sexo,
        this.fatorRH,
        this.estadoCivil,
        this.endereco,
        this.complemento,
        this.bairro,
        this.cidade,
        this.uF,
        this.cEP,
        this.celular,
        this.celular2,
        this.telefone});

  PostDados.fromJson(Map<String, dynamic> json) {
    nome = json['Nome'];
    pai = json['Pai'];
    mae = json['Mae'];
    naturalidade = json['Naturalidade'];
    rG = json['RG'];
    sexo = json['Sexo'];
    fatorRH = json['Fator RH'];
    estadoCivil = json['Estado Civil'];
    endereco = json['Endereco'];
    complemento = json['Complemento'];
    bairro = json['Bairro'];
    cidade = json['Cidade'];
    uF = json['UF'];
    cEP = json['CEP'];
    celular = json['Celular'];
    celular2 = json['Celular2'];
    telefone = json['Telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = this.nome;
    data['Pai'] = this.pai;
    data['Mae'] = this.mae;
    data['Naturalidade'] = this.naturalidade;
    data['RG'] = this.rG;
    data['Sexo'] = this.sexo;
    data['Fator RH'] = this.fatorRH;
    data['Estado Civil'] = this.estadoCivil;
    data['Endereco'] = this.endereco;
    data['Complemento'] = this.complemento;
    data['Bairro'] = this.bairro;
    data['Cidade'] = this.cidade;
    data['UF'] = this.uF;
    data['CEP'] = this.cEP;
    data['Celular'] = this.celular;
    data['Celular2'] = this.celular2;
    data['Telefone'] = this.telefone;
    return data;
  }
}