import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loguinsintese_app/plogin.dart';
import 'dart:convert';
import 'dart:async';
import 'package:loguinsintese_app/post.dart';
import 'package:loguinsintese_app/postfiliacao.dart';

import 'Phome.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';

class Empresa extends StatefulWidget {
  String CpfDigitado;
  Empresa(this.CpfDigitado);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Empresa> {
  String _urlBase =
      "https://sgs.sintese.org.br/sintese/WebConsultarCPF.rule?sys=SIF&pCPF=";

  Future<List<Pegar>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + widget.CpfDigitado);
    var dadosJson = json.decode(response.body);

    List<Pegar> postagens = List();
    for (var po in dadosJson) {
      print("post: " + po["title"]);
      Pegar p = Pegar(
        po["_empresa"],
        po["_predio"],
        po["_matricula"],
        po["_telefone"],
        po["_profissao"],
        po["_funcao"],
        po["_cargo"],
        po["_regiao"],
        po["_lotacao"],
        po["_sindicalizacao"],
        po["_situacao"],
      );
      postagens.add(p);
    }
    return postagens;
    //print( postagens.toString() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filiações"),
      ),
      body: FutureBuilder<List<Pegar>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print("lista: Erro ao carregar ");
              } else {
                print("lista: carregou!! ");
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Pegar> lista = snapshot.data;
                      Pegar post = lista[index];

                      return ListTile(
                        title: Text(post.empresa),
                        subtitle: Text(post.cargo),
                      );
                    });
              }
              break;
          }
          return Center();
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 12.0,
                        left: 16.0,
                        child: Text(
                          "Menu",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.person),
              title: Text("Dados pessoais"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            phome(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.work),
              title: Text("Filiação"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Empresa(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.account_circle),
              title: Text("Carteira Digital"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            carteiraDigital(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.password),
              title: Text("Atualização de senha"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            alteracaodesenha(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => plogin(),
                        ));
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
