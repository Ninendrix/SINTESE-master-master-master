import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:loguinsintese_app/PostFiliacoes.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'Pfiliacoes.dart';
import 'Phome.dart';
import 'PostConvenios.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';

class plistadeconvenios extends StatefulWidget {
  @override
  _plistadeconveniosState createState() => _plistadeconveniosState();
}
class _plistadeconveniosState extends State<plistadeconvenios> {
  String _urlBase =
      "https://sgs.sintese.org.br/sintese/WebConsultarConvenios.rule?sys=SIF";
  Future<List<convenios>> _recuperarListaconvenio() async {
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
      body: Center(),
    );
  }
}
