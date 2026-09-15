import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Primeiro Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MinhaTela(),
    );
  }
}

class MinhaTela extends StatelessWidget {
  const MinhaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Column(
        children: [
          CartaoAluno(nome: 'Ana Souza', curso: 'Sistemas de Informação'),
          CartaoAluno(nome: 'Bruno Lima', curso: 'Ciência da Computação', periodo: 7),
        ],
      ),
    );
  }
}

class CartaoAluno extends StatelessWidget {
  const CartaoAluno({
    super.key,
    required this.nome,          // required = obrigatório passar
    required this.curso,
    this.periodo = 5,            // com valor padrão = opcional
  });

  final String nome;             // final: configuração imutável
  final String curso;
  final int periodo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              // primeira letra do nome, em maiúscula
              child: Text(nome.isNotEmpty ? nome[0].toUpperCase() : '?'),
            ),
            const SizedBox(width: 16),        // espaçamento entre os dois
            Expanded(                          // ocupa o espaço que sobrar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text('$curso — $periodoº período'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}