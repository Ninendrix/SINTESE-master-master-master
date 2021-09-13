import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:loguinsintese_app/carteiraDigital.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'carteiraDigital.dart';

class phome extends StatefulWidget {
  @override
  _phomeState createState() => _phomeState();
  String CpfDigitado;
  phome(this.CpfDigitado);
}

class _phomeState extends State<phome> {
  @override
  //Tranformando os controladores em TExtEditingController
  final _NomeControler = TextEditingController(); //Nome:
  final _NomePaiControler = TextEditingController();//Nome do Pai:
  final _NomeMaeControler = TextEditingController(); //Nome da mãe:
  final _NaturalidadeControler = TextEditingController(); //Naturalidade:
  final _RGControler = TextEditingController();//RG:
  final _SexoControler = TextEditingController();//Sexo:
  final _FatorRHControler = TextEditingController();//FatorRH:
  final _EstadoCivilControler = TextEditingController();//Estado Civil:
  final _EnderecoControler = TextEditingController();//Endereço:
  final _ComplementoControler = TextEditingController();//Complemento:
  final _BairroControler = TextEditingController();//Bairro:
  final _CidadeControler = TextEditingController();//Cidade:
  final _UFControler = TextEditingController();//Unidade Federativa UF:
  final _CEPControler = TextEditingController();//CEP:
  final _CelularControler = TextEditingController();//Celular 1°:
  final _Celular2Controler = TextEditingController();//Celular 2°:
  final _TelefoneControler = TextEditingController();//Telefone Fixo:
  final _FiliacaoControler = TextEditingController();//Filiação:
  _acessandocpfdadospessoais() async {
    String UrlDadospessoais =
        "https://sgs.sintese.org.br/sintese/WebConsultarCPF.rule?sys=SIF&pCPF=${widget.CpfDigitado}";
    http.Response response;
    response = await http.get(UrlDadospessoais);
    Map<String, dynamic> retorno = json.decode(response.body);
    //Variaveis recebendo dados em json da API sintese
    String Nome = retorno["Nome"];
    String NomePai = retorno["Pai"];
    String NomeMae = retorno["Mae"];
    String Naturalidade = retorno["Naturalidade"];
    String RG =  retorno["RG"];
    String Sexo =  retorno["Sexo"];
    String FatorRH =  retorno["Fator RH"];
    String EstadoCivil =  retorno["Estado Civil"];
    String Endereco = retorno["Endereco"];
    String Complemento = retorno["Complemento"];
    String Bairro = retorno["Bairro"];
    String Cidade = retorno ["Cidade"];
    String UF = retorno["UF"];
    String CEP = retorno["CEP"];
    String Celular = retorno["Celular"];
    String Celular2 = retorno["Celular2"];
    String Telefone = retorno["Telefone"];
    String Filiacao = retorno["0:"];
    //Controladores recebendo dados das variaveis api sintese

    _NomeControler.text = Nome;
    _NomePaiControler.text = NomePai;
    _NomeMaeControler.text = NomeMae;
    _NaturalidadeControler.text = Naturalidade;
    _RGControler.text = RG;
    _SexoControler.text = Sexo;
    _FatorRHControler.text = FatorRH;
    _EstadoCivilControler.text = EstadoCivil;
    _EnderecoControler.text = Endereco;
    _ComplementoControler.text = Complemento;
    _BairroControler.text = Bairro;
    _CidadeControler.text = Cidade;
    _UFControler.text = UF;
    _CEPControler.text = CEP;
    _CelularControler.text = Celular;
    _Celular2Controler.text = Celular2;
    _TelefoneControler.text = Telefone;
    _FiliacaoControler.text = Filiacao;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("APP SINTESE"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Image.asset("imagens/SINTESEEMACAO.png",
                      width: 150, height: 150),
                ),
                borderRadius: BorderRadius.circular(150),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: RaisedButton(
                    child: Text(
                      "exibir dados pessoais",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {_acessandocpfdadospessoais();}),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _NomeControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Nome:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _NomePaiControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Nome do pai:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _NomeMaeControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Nome do mãe:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _NaturalidadeControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Naturalidade:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _RGControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("RG:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _SexoControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Sexo:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _FatorRHControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Fator RH:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _EstadoCivilControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Estado civil:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _EnderecoControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Endereço:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _ComplementoControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Complemento:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _BairroControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Bairro:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _CidadeControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Cidade:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _UFControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("UF:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _CEPControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("CEP:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _CelularControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("1° Celular:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _Celular2Controler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("2° Celular:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _TelefoneControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Telefone fixo:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _FiliacaoControler,
                style: TextStyle(fontSize: 18),
                enabled: false,
                decoration: InputDecoration(
                  labelText: ("Filiação:"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 20),),
              decoration: BoxDecoration(color: Colors.red),
            ),
            ListTile(
              trailing: Icon(Icons.done),
              leading: Icon(Icons.photo),
              title: Text("Carteirinha Digital"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => carteiraDigital(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.done),
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {
                Widget NaoButton = FlatButton(
                  child: Text("Não"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
                Widget simButton = FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => plogin(),));
                  },
                );
                AlertDialog alerta = AlertDialog(
                  title: Text("Alerta"),
                  content: Text("Sair do app?"),
                  actions: [
                    simButton,
                    NaoButton,
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alerta;
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
