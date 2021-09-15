class filiado {
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
  List<Filiacao> filiacao;

  filiado(
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
        this.telefone,
        this.filiacao});

  filiado.fromJson(Map<String, dynamic> json) {
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
    if (json['Filiacao'] != null) {
      filiacao = new List<Filiacao>();
      json['Filiacao'].forEach((v) {
        filiacao.add(new Filiacao.fromJson(v));
      });
    }
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
    if (this.filiacao != null) {
      data['Filiacao'] = this.filiacao.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filiacao {
  String empresa;
  String predio;
  String matricula;
  String telefone;
  String profissao;
  String funcao;
  String cargo;
  String regiao;
  String lotacao;
  String sindicalizacao;
  String situacao;

  Filiacao(
      {this.empresa,
        this.predio,
        this.matricula,
        this.telefone,
        this.profissao,
        this.funcao,
        this.cargo,
        this.regiao,
        this.lotacao,
        this.sindicalizacao,
        this.situacao});

  Filiacao.fromJson(Map<String, dynamic> json) {
    empresa = json['Empresa'];
    predio = json['Predio'];
    matricula = json['Matricula'];
    telefone = json['Telefone'];
    profissao = json['Profissao'];
    funcao = json['Funcao'];
    cargo = json['Cargo'];
    regiao = json['Regiao'];
    lotacao = json['Lotacao'];
    sindicalizacao = json['Sindicalizacao'];
    situacao = json['Situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Empresa'] = this.empresa;
    data['Predio'] = this.predio;
    data['Matricula'] = this.matricula;
    data['Telefone'] = this.telefone;
    data['Profissao'] = this.profissao;
    data['Funcao'] = this.funcao;
    data['Cargo'] = this.cargo;
    data['Regiao'] = this.regiao;
    data['Lotacao'] = this.lotacao;
    data['Sindicalizacao'] = this.sindicalizacao;
    data['Situacao'] = this.situacao;
    return data;
  }
}