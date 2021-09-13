//import 'dart:html';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './carteiraDigital.dart';


class carteiraDigital extends StatefulWidget {
  String CpfDigitado;
  String urlCarteiraDigitalAT;
  carteiraDigital(this.CpfDigitado);


    _carteiraDigital() async {
      String urlCarteiraDigital = "https://sgs.sintese.org.br/sintese/WebCarteira.rule?sys=SIF&pCPF=${CpfDigitado}";
      http.Response response;
      response = await http.get(urlCarteiraDigital);
      Map<String, dynamic> retorno = jsonDecode(response.body);
      //Variaves Recebendo dados d Json
      String url = retorno["URL"];
      urlCarteiraDigitalAT = url;
    }

  @override
  _carteiraDigitalState createState() => _carteiraDigitalState();
}
class _carteiraDigitalState extends State<carteiraDigital> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Carteira Digital"),
      ),
      body: Center(
         child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  Container(
                    child: Image.network('https://sgs.sintese.org.br/sintese///tmp/${widget.CpfDigitado}.jpg'),
                  ),
                  Container(
                  )
                ],
              ),
            ),
      )
  );
 }
}
