import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:loguinsintese_app/PostFiliacoes.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'Pconveniados.dart';
import 'Pfiliacoes.dart';
import 'Phome.dart';
import 'Postcontribuicaoanual.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';

class pcontribuicaoanual extends StatefulWidget {
  var CpfDigitado;
  pcontribuicaoanual(this.CpfDigitado);
  @override
  _pcontribuicaoanualState createState() => _pcontribuicaoanualState();
}

class _pcontribuicaoanualState extends State<pcontribuicaoanual> {
  String _urlBase =
      "https://sgs.sintese.org.br/sintese/WebConsultarContribuicao.rule?sys=SIF&pCPF=";

  Future<List<postcontribuicaoanual>> _recuperarContribuicaoanual() async {
    http.Response response = await http.get(_urlBase + "${widget.CpfDigitado}");
    var dadosJson = json.decode(response.body);

    List<postcontribuicaoanual> postagens = List();
    for (var post in dadosJson) {
      print("post: " + post["Empresa"]);
      postcontribuicaoanual p = postcontribuicaoanual(
        post["Empresa"],
        post["Matricula"],
        post["Janeiro"],
        post["Fevereio"],
        post["Março"],
        post["Abril"],
        post["Maio"],
        post["Junho"],
        post["Julho"],
        post["Agosto"],
        post["Setembro"],
        post["Outubro"],
        post["Novembro"],
        post["Dezembro"],
        post["Total"],
      );
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contribuição anual"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<postcontribuicaoanual>>(
            future: _recuperarContribuicaoanual(),
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
                          List<postcontribuicaoanual> lista = snapshot.data;
                          postcontribuicaoanual post = lista[index];
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
                                  "Janeiro :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Janeiro),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Fevereio :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Fevereio),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Março :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Marco),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Abril :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Abril),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Maio :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Maio),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Junho :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Junho),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Julho :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Julho),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Agosto :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Agosto),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Setembro :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Setembro),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Outubro :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Outubro),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Novembro :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Novembro),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Dezembro :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Dezembro),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Total :",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 05.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("RS:   " + post.Total),
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
