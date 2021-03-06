import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:loguinsintese_app/carteiraDigital.dart';
import 'package:loguinsintese_app/plogin.dart';
import 'Pcontribuicaoanual.dart';
import 'Pconveniados.dart';
import 'alteracaodesenha.dart';
import 'carteiraDigital.dart';
import 'Pfiliacoes.dart';
import 'postdatos.dart';

class phome extends StatefulWidget {
  var CpfDigitado;
  phome(this.CpfDigitado);
  @override
  _phomeState createState() => _phomeState();
}

class _phomeState extends State<phome> {
  @override
  Future<PostDados> getDatafiliado() async {
    final response = await http.get(
        'https://sgs.sintese.org.br/sintese/WebConsultarDados.rule?sys=SIF&pCPF=${widget.CpfDigitado}');
    if (response.statusCode == 200) {
      return PostDados.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha na conexão com o servidor');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Dados pessoais"),
      ),
      body: Center(
          //padding: EdgeInsets.all(10),
          child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: FutureBuilder<PostDados>(
              future: getDatafiliado(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Nome : "),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.nome),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Nome do pai :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.pai),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Nome da mãe :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.mae),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Naturalidade :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.naturalidade),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Rg :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.rG),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Sexo :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.sexo),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Fator RH :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.fatorRH),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Estado cívil :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.estadoCivil),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Endereço :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.endereco),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Complemento :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.complemento),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Bairro :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.bairro),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cidade :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.cidade),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("UF :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.uF),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cep :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.cEP),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Celular :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.celular),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Celular2 :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.celular2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Telefone :"),
                      ),
                      SizedBox(
                        height: 05.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: (snapshot.data.telefone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
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
                          builder: (context) => plogin(),
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
