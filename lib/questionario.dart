import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas_statefull/questao.dart';
import 'package:projeto_perguntas_statefull/resposta.dart';

class Questionario extends StatelessWidget {
  //const MyWidget({super.key});

  final List perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get perguntaValida {
    return (perguntaSelecionada < perguntas.length);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = perguntaValida
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Questao(perguntas[perguntaSelecionada]['enunciado']),
        ...respostas.map((resp) {
          return Resposta(resp['texto'].toString(),
              () => responder(int.parse(resp['pontuacao'].toString())));
        }).toList(),

        /* Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );*/
        /*
            .map((t) => Resposta(t['texto'] as String, responder))
            .toList(),*/
        //Text('A resposta está $gabarito'),
      ],
    );
  }
}
