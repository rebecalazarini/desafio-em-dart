import 'dart:io';

class Candidato {
  int id;
  String nome;
  int votos;

  Candidato(this.id, this.nome, this.votos);
}

void main() {
  List<Candidato> candidatos = [];
  int opcao = 0;

  do {
    print('\nMenu:');
    print('1 - Adicionar candidato');
    print('2 - Excluir candidato');
    print('3 - Mostrar porcentagem de votos');
    print('4 - Sair');
    stdout.write('Escolha uma opção: ');
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        stdout.write('Digite o nome do candidato: ');
        String nome = stdin.readLineSync()!;
        stdout.write('Digite a quantidade de votos: ');
        int votos = int.parse(stdin.readLineSync()!);
        int id = candidatos.length + 1;
        candidatos.add(Candidato(id, nome, votos));
        print('Candidato adicionado com sucesso!');
        break;

      case 2:
        stdout.write('Digite o ID do candidato a ser excluído: ');
        int id = int.parse(stdin.readLineSync()!);
        candidatos.removeWhere((candidato) => candidato.id == id);
        print('Candidato excluído com sucesso!');
        break;

      case 3:
        int totalVotos = candidatos.fold(0, (soma, candidato) => soma + candidato.votos);
        print('\nCandidatos\tVotos\tPorcentagem');
        for (var candidato in candidatos) {
          double porcentagem = (candidato.votos / totalVotos) * 100;
          print('${candidato.nome}\t${candidato.votos}\t${porcentagem.toStringAsFixed(2)}%');
        }
        break;

      case 4:
        print('Encerrando o programa.');
        break;

      default:
        print('Opção inválida. Tente novamente.');
    }
  } while (opcao != 4);
}
