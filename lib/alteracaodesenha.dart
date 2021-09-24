import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loguinsintese_app/postatSenha.dart';
import 'Pcontribuicaoanual.dart';
import 'Pconveniados.dart';
import 'Phome.dart';
import 'carteiraDigital.dart';
import 'Pfiliacoes.dart';
import 'plogin.dart';

class alteracaodesenha extends StatefulWidget {
  @override
  String CpfDigitado;

  alteracaodesenha(this.CpfDigitado);
  _alteracaodesenha createState() => _alteracaodesenha();
}

class _alteracaodesenha extends State<alteracaodesenha> {
  final _controllernovasenha = TextEditingController();
  final _controllerconfirmacaodesenha = TextEditingController();

  Future<atsenha> _atSenha() async {
    String novaSenha = _controllernovasenha.text;
    String confirmacaodesenha = _controllerconfirmacaodesenha.text;
    String UrlLogin =
        'https://sgs.sintese.org.br/sintese/WebLoginUserTrocaSenha.rule?sys=SIF&pLogin=${widget.CpfDigitado};${novaSenha}';
    http.Response response;
    response = await http.get(UrlLogin);
    Map<String, dynamic> retorno = json.decode(response.body);
    String Resposta = retorno["Resposta"];
    _controllernovasenha.text = Resposta;

    if (_controllernovasenha.text == 'Ok') {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      phome(widget.CpfDigitado)));
        },
      );
      AlertDialog alerta = AlertDialog(
        title: Text("Atenção!"),
        content: Text("Senha atualizada com sucesso"),
        actions: [okButton],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          });
    } else {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      phome(widget.CpfDigitado)));
        },
      );
      AlertDialog alerta = AlertDialog(
        title: Text("Atenção!"),
        content: Text("Algo deu errado verifique sua conexão com a internet"),
        actions: [okButton],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualização de senha"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(child: FutureBuilder<atsenha>(
                //future:_atSenha(),
                builder: (context, snapshot) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Atualização de senha',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 05.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Senha :"),
                    ),
                    TextField(
                      controller: _controllernovasenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Digite a nova senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 05.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirmação de senha :"),
                    ),
                    TextField(
                      controller: _controllerconfirmacaodesenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Repita a nova senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 05.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 200),
                      child: RaisedButton(
                          child: Text(
                            "Enviar",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Colors.red,
                          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            if ((_controllernovasenha.text == '') ||
                                (_controllerconfirmacaodesenha.text == '')) {
                              Widget okButton = FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              alteracaodesenha(
                                                  widget.CpfDigitado)));
                                },
                              );
                              AlertDialog alerta = AlertDialog(
                                title: Text("Atenção!"),
                                content: Text(
                                    "Senha ou confirmação de senha, não podem está vazio"),
                                actions: [okButton],
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alerta;
                                  });
                            } else if ((_controllernovasenha.text !=
                                _controllerconfirmacaodesenha.text)) {
                              Widget okButton = FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              alteracaodesenha(
                                                  widget.CpfDigitado)));
                                },
                              );
                              AlertDialog alerta = AlertDialog(
                                title: Text("Atenção!"),
                                content:
                                    Text("As senha digitadas não conferem"),
                                actions: [okButton],
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alerta;
                                  });
                            } else {
                              _atSenha();
                            }
                          }),
                    )
                  ]);
            })),
          )),
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
