import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:loguinsintese_app/carteiraDigital.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'carteiraDigital.dart';
import 'post.dart';

class phome extends StatefulWidget {
  String CpfDigitado;
  phome(this.CpfDigitado);
  @override
  _phomeState createState() => _phomeState();
}

class _phomeState extends State<phome> {
  @override
  
  Future<filiado> getDatafiliado() async{
    final response = await http.get('https://sgs.sintese.org.br/sintese/WebConsultarCPF.rule?sys=SIF&pCPF=${widget.CpfDigitado}');
    if(response.statusCode == 200){
      return filiado.fromJson(json.decode(response.body));
    }else{
      throw Exception('Falha na conexão com o servidor');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("APP SINTESE"),
      ),
      body: FutureBuilder<filiado>(
        future: getDatafiliado(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data.nome);
          }else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 20),
              ),
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
                        builder: (BuildContext context) =>
                            carteiraDigital(widget.CpfDigitado)));
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

