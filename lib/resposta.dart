import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //const Resposta({super.key});

  final String Texto;
  final void Function() quandoApertado;

  Resposta(this.Texto, this.quandoApertado);

  @override
  Widget build(BuildContext context) {
    // Variável criada para padronizar o tamanho do botão
    final ButtonStyle estilo =
        //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
        ElevatedButton.styleFrom(
            fixedSize: Size(300, 40), textStyle: TextStyle(fontSize: 20));

    return Container(
      //width: double.infinity,
      child: ElevatedButton(
        style: estilo,
        onPressed: quandoApertado,
        child: Text(Texto),
      ),
    );
  }
}
