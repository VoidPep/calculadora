import 'package:flutter/material.dart';

import 'botao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var numeros = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  late int primeiroNumero;
  late int segundoNumero;
  late int resultado;
  String historico = "";
  String textoExibido = "";
  String operador = "";
  bool novoValor = false;

  void Calcular(String valor) {
    if (valor == "AC") {
      historico = "";
      textoExibido = "";
      primeiroNumero = 0;
      segundoNumero = 0;
      resultado = 0;
    }
    else if (valor == "C") {
      textoExibido = "";
    }
    else if (valor == "<") {
      if (textoExibido.isNotEmpty) {
        textoExibido = textoExibido.substring(0, textoExibido.length - 1);
        historico = historico.substring(0, historico.length - 1);
      }
    }
    else if (valor == "+/-") {
      if (textoExibido[0] != "-") {
        textoExibido = "-" + textoExibido;
      } else {
        textoExibido = textoExibido.substring(1);
      }
    }
    else if (valor == "+" ||
        valor == "-" ||
        valor == "/" ||
        valor == "X" ||
        valor == "=") {
      historico = historico + " " + valor + " ";
      if (valor == "+") {
        operador = valor;
        primeiroNumero = int.parse(textoExibido);
        textoExibido = "";
      }
      else if (valor == "-") {
        operador = valor;
        primeiroNumero = int.parse(textoExibido);
        textoExibido = "";
      }
      else if (valor == "+") {
        operador = valor;
        primeiroNumero = int.parse(textoExibido);
        textoExibido = "";
      }
      else if (valor == "/") {
        operador = valor;
        primeiroNumero = int.parse(textoExibido);
        textoExibido = "";
      }
      else if (valor == "X") {
        operador = valor;
        primeiroNumero = int.parse(textoExibido);
        textoExibido = "";
      }
      else if (valor == "=") {
        segundoNumero = int.parse(textoExibido);
        if (operador == "+"){
          resultado = primeiroNumero + segundoNumero;
        } else if (operador == "-"){
          resultado = primeiroNumero - segundoNumero;
        }
        else if (operador == "X"){
          resultado = primeiroNumero * segundoNumero;
        }
        else if (operador == "/"){
          resultado = primeiroNumero ~/ segundoNumero;
        }
        textoExibido = resultado.toString();
        historico = historico + textoExibido;
        novoValor = true;
      }
    }
    else if (numeros.contains(int.parse(valor))) {
      if (novoValor) {
        textoExibido = "";
        historico = "";
      }

      novoValor = false;
      historico = historico + valor;
      textoExibido = textoExibido + valor;
    }

    setState(() {
      textoExibido;
    });
  }

  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1d2630),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              alignment: Alignment(1.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  textoExibido,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              alignment: Alignment(1.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  historico,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Botao(texto: "AC", corDoBotao: 0xFFF74F45, callback: Calcular),
                Botao(texto: "C", corDoBotao: 0xFFF74F45, callback: Calcular),
                Botao(texto: "<", corDoBotao: 0xFF4F79DD, callback: Calcular),
                Botao(texto: "/", corDoBotao: 0xFF4F79DD, callback: Calcular),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Botao(texto: "7", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "8", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "9", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "X", corDoBotao: 0xFF4F79DD, callback: Calcular),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Botao(texto: "6", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "5", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "4", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "-", corDoBotao: 0xFF4F79DD, callback: Calcular),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Botao(texto: "1", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "2", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "3", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "+", corDoBotao: 0xFF4F79DD, callback: Calcular),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Botao(texto: "+/-", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "0", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "00", corDoBotao: 0xFF37383F, callback: Calcular),
                Botao(texto: "=", corDoBotao: 0xFF4F79DD, callback: Calcular),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
