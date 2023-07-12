import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas_statefull/resultado.dart';
import 'package:projeto_perguntas_statefull/questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  // Contador de quantas vezes botão foi pressionado
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  // Lista de perguntas disponíveis
  final List _perguntas = [
    {
      'enunciado': 'Qual o primeiro campeão da Copa do Mundo de Futebol?',
      'respostas': [
        {'texto': 'Brasil', 'pontuacao': 0},
        {'texto': 'Uruguai', 'pontuacao': 3},
        {'texto': 'Argentina', 'pontuacao': 0}
      ],
      'gabarito': 2
    },
    {
      'enunciado': 'Quantas vezes o Brasil foi Campeão do Mundo?',
      'respostas': [
        {'texto': '6', 'pontuacao': 0},
        {'texto': '5', 'pontuacao': 3},
        {'texto': '4', 'pontuacao': 0}
      ],
      'gabarito': 1
    },
    {
      'enunciado':
          'Qual clube cedeu mais jogadores para a seleção brasileira em Copas do Mundo?',
      'respostas': ['Botafogo', 'urubu', 'vasCU'],
      'respostas': [
        {'texto': 'Botafogo', 'pontuacao': 3},
        {'texto': 'Santos', 'pontuacao': 0},
        {'texto': 'Cruzeiro', 'pontuacao': 0}
      ],
      'gabarito': 1
    }
  ];

  bool get perguntaValida {
    return (_perguntaSelecionada < _perguntas.length);
  }

  // Função acionada quando os botões de Resposta são pressionados
  void _responder(int pontuacao) {
    setState(() {
      perguntaValida ? _perguntaSelecionada++ : -1;
      _pontuacaoTotal += pontuacao;
    });
    print('respondida $_perguntaSelecionada');
    print('${_perguntas[0][1]}');
    print('Total = $_pontuacaoTotal, Esta Questão = $pontuacao');
  }

  // Função acionada quando o Botão de Reiniciar é pressionado
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = _pontuacaoTotal = 0;
    });
    print('respondida $_perguntaSelecionada');
    print('Total = $_pontuacaoTotal');
  }

  @override
  Widget build(BuildContext context) {
    // Variável criada para padronizar o tamanho do botão
    final ButtonStyle tamanho =
        //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
        ElevatedButton.styleFrom(fixedSize: Size(100, 30));

    String gabarito = '...';

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz - Copa do Mundo Masculina'),
              centerTitle: true,
            ),
            body: perguntaValida
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
