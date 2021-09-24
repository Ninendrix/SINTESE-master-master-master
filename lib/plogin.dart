import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'Phome.dart';
import 'Postlogin.dart';
class plogin extends StatefulWidget {
  @override
  _ploginState createState() => _ploginState();
}
class _ploginState extends State<plogin> {
  final _formkey = GlobalKey<FormState>();
  final _ControlerCpf = TextEditingController();
  final _ControlerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset('imagens/LOGOTIPO.png', width: 300, height: 300,),

                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  controller: _ControlerCpf,
                  //autofocus: true,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "CPF :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (cpf) {
                    if((cpf == null) || (cpf.isEmpty)){
                      return 'por favor digite o cpf';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 05.0,
                ),
                TextFormField(
                  controller: _ControlerSenha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      labelText: "Senha :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (senha){
                    if((senha == null)||(senha.isEmpty)){
                      return 'por favor digite a senha';
                    }else{
                      return null;
                    }
                  }
                ),
                ElevatedButton(onPressed:() async {
                  if(_formkey.currentState.validate()){
                    _conexaologin();
                  }else{
                    throw Exception('Falha na conexão com o servidor');
                  }
                }, child: Text('Entrar'),)

              ],
            ),
          ),
        ),
      )
    );
  }
  Future _conexaologin() async {
    String UrlLogin =
        "https://sgs.sintese.org.br/sintese/WebLoginUser.rule?sys=SIF&pLogin=${_ControlerCpf.text};${_ControlerSenha.text}";
    http.Response response;
    response = await http.get(UrlLogin);
    Map<String, dynamic> retorno = json.decode(response.body);
    String Resposta = retorno["Resposta"];
    //_ControlerCpf.text = Resposta;
    if (Resposta == "Error") {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alerta = AlertDialog(
        title: Text("Alerta!"),
        content: Text("Usuário Invalido!"),
        actions: [okButton],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          });
      _ControlerSenha.text = "";
    } else {
      Widget okButton = FlatButton(
        child: Text("Ok"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => phome(
                    _ControlerCpf.text,
                  )));
        },
      );
      AlertDialog alerta = AlertDialog(
        title: Text("Olá"),
        content: Text("Bem Vindo: ${Resposta}"),
        actions: [
          okButton,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          });
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
  abrirUrl() async {
    const url = 'https://www.sintese.org.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
