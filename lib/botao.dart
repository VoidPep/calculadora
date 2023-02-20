import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final int corDoBotao;
  final Function callback;

  const Botao({required this.texto, required this.corDoBotao, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          child: Text(texto, style: TextStyle(
            fontSize: 20,
          )),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(corDoBotao)),
            elevation: MaterialStateProperty.all(6),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          onPressed: () => callback(texto),
        ),
      ),
    );
  }
}
