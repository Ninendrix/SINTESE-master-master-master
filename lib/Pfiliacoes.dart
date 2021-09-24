import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:loguinsintese_app/PostFiliacoes.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'Pcontribuicaoanual.dart';
import 'Pconveniados.dart';
import 'Phome.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';

class pfiliacoes extends StatefulWidget {
  var CpfDigitado;
  pfiliacoes(this.CpfDigitado);
  @override
  _pfiliacoesState createState() => _pfiliacoesState();
}

class _pfiliacoesState extends State<pfiliacoes> {
  String _urlBase =
      "https://sgs.sintese.org.br/sintese/WebConsultarFiliacao.rule?sys=SIF&pCPF=";

  Future<List<postfiliacoes>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "${widget.CpfDigitado}");
    var dadosJson = json.decode(response.body);

    List<postfiliacoes> postagens = List();
    for (var post in dadosJson) {
      print("post: " + post["Empresa"]);
      postfiliacoes p = postfiliacoes(
          post["_postId"],
          post["Empresa"],
          post["Predio"],
          post["Matricula"],
          post["Telefone"],
          post["Profissao"],
          post["Funcao"],
          post["Cargo"],
          post["Regiao"],
          post["Lotacao"],
          post["Sindicalizacao"],
          post["Situacao"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filiações"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<postfiliacoes>>(
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
                    return Center(
                       child: Text(
                         "Você Não possui histórico de contribuição esté ano!"),
                      );
                          //print("lista: Erro ao carregar ");
                     } else {
                    print("lista: carregou!! ");
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List<postfiliacoes> lista = snapshot.data;
                          postfiliacoes post = lista[index];
                          return ExpansionTile(
                            leading: Icon(Icons.work),
                            title: Text("Empresa :"),
                            subtitle: Text(post.Empresa),
                            children: [
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Predio :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Predio),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Matricula :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Matricula),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Telefone :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Telefone),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Profissao :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Profissao),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Funcao :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Funcao),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Cargo :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Cargo),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Região :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Regiao),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Lotação :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Lotacao),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Sindicalização :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Sindicalizacao),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Situação :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(post.Situacao),
                              ),
                            ],
                          );
                        });
                  }
                  break;
              }
              return Center();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: AssetImage('imagens/logomarca.png'))),
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
                              color: Colors.black,
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
                            pfiliacoes(widget.CpfDigitado)));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.attach_money),
              title: Text("Contribuição anual"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            pcontribuicaoanual(widget.CpfDigitado)));
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
              leading: Icon(Icons.accessibility),
              title: Text("Conveniados"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            pconveniados(widget.CpfDigitado)));
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
