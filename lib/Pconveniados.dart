import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:loguinsintese_app/PostFiliacoes.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'Pcontribuicaoanual.dart';
import 'Pfiliacoes.dart';
import 'Phome.dart';
import 'Plistadeconvenio.dart';
import 'PostConvenios.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';

class pconveniados extends StatefulWidget {
  var CpfDigitado;
  pconveniados(this.CpfDigitado);
  @override
  _pconveniadosState createState() => _pconveniadosState();
}

class _pconveniadosState extends State<pconveniados> {
  String _urlBase =
      "https://sgs.sintese.org.br/sintese/WebConsultarConvenios.rule?sys=SIF";
  Future<List<convenios>> _recuperarConvenios() async {
    http.Response response = await http.get(_urlBase);
    var dadosJson = json.decode(response.body);

    List<convenios> postagens = List();
    for (var post in dadosJson) {
      print("post: " + post["Convenio"]);
      convenios p = convenios(
        post["postId"],
        post["Convenio"],
      );
      postagens.add(p);
    }
    return postagens;
    print(postagens.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convenios"),
      ),
      body: Center(
        child: FutureBuilder<List<convenios>>(
          future: _recuperarConvenios(),
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
                        List<convenios> lista = snapshot.data;
                        convenios post = lista[index];
                        return ListTile(
                          leading: Icon(Icons.accessibility),
                          title: Text(post.Convenio),
                          subtitle: Text("Categoria"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        plistadeconvenios()));
                          },
                          trailing: Icon(Icons.arrow_forward),
                        );
                      });
                }
                break;
            }
            return Center();
          },
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
