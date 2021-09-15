import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:loguinsintese_app/postCarteirinha.dar.dart';

class carteiraDigital extends StatefulWidget {
  @override
  String CpfDigitado;
  String urlCarteiraDigitalAT;
  carteiraDigital(this.CpfDigitado);
  _carteiraDigitalState createState() => _carteiraDigitalState();
}
class _carteiraDigitalState extends State<carteiraDigital> {

  Future<carteirinha> getCarteirinha() async{
    final response = await http.get("https://sgs.sintese.org.br/sintese/WebCarteira.rule?sys=SIF&pCPF=${widget.CpfDigitado}");
    if(response.statusCode == 200){
      return carteirinha.fromJson(json.decode(response.body));
    }else{
      throw Exception('Falha na conexão com o servidor');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Carteira Digital"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder<carteirinha>(
            future: getCarteirinha(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Center(child: Image.network(snapshot.data.uRL));
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          ),
        ),
      )
  );
 }
}
