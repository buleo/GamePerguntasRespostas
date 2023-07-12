import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  // const MyWidget({super.key});

  final int pontuacao;
  void Function() reiniciar;

  Resultado(this.pontuacao, this.reiniciar);

  String get fraseResultado {
    String _frase = '';

    if (pontuacao == 9) {
      _frase = 'Acertou tudo! Nota $pontuacao';
    } else if (pontuacao == 6) {
      return _frase = 'Médio... Nota $pontuacao';
    } else if (pontuacao == 3) {
      return _frase = 'Ruim, hein? ... Nota $pontuacao';
    } else if (pontuacao == 0) {
      return _frase = 'ZEROU! Terrível!';
    }
    return _frase;
  }

  @override
  Widget build(BuildContext context) {
    return //const Placeholder();
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: reiniciar,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black26)),
          child: Text('Reiniciar', style: TextStyle(fontSize: 30)),
        )
      ],
    );
  }
}
