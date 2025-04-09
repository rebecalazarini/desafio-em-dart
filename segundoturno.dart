import 'dart:io';

void main() {
  Eleicao eleicao = Eleicao();
  eleicao.menu();
}

class Candidato {
  String nome;
  int votos;

  Candidato({required this.nome, required this.votos});
}

class Eleicao {
  List<Candidato> candidatos = [];

  void menu() {
    while (true) {
      print("\nMenu:");
      print("1. Adicionar candidato");
      print("2. Excluir candidato");
      print("3. Mostrar porcentagem");
      print("4. Sair");
      stdout.write("Escolha uma opção: ");
      String? opcao = stdin.readLineSync();

      switch (opcao) {
        case "1":
          adicionarCandidato();
          break;
        case "2":
          excluirCandidato();
          break;
        case "3":
          mostrarPorcentagem();
          break;
        case "4":
          print("Saindo do programa...");
          return;
        default:
          print("Opção inválida, tente novamente.");
      }
    }
  }

  void adicionarCandidato() {
    stdout.write("\nDigite o nome do candidato: ");
    String? nome = stdin.readLineSync();
    stdout.write("Digite a quantidade de votos do candidato: ");
    int? votos = int.tryParse(stdin.readLineSync() ?? "");

    if (nome != null && votos != null && votos >= 0) {
      candidatos.add(Candidato(nome: nome, votos: votos));
      print("Candidato '$nome' adicionado com sucesso!");
    } else {
      print("Entrada inválida. Tente novamente.");
    }
  }

  void excluirCandidato() {
    if (candidatos.isEmpty) {
      print("\nNão há candidatos cadastrados para excluir.");
      return;
    }

    stdout.write("\nDigite o nome do candidato a ser excluído: ");
    String? nome = stdin.readLineSync();

    candidatos.removeWhere((candidato) => candidato.nome == nome);
    print("Candidato '$nome' removido com sucesso!");
  }

  void mostrarPorcentagem() {
    if (candidatos.isEmpty) {
      print("\nNão há candidatos cadastrados.");
      return;
    }

    // Calcula o total de votos
    int totalVotos = candidatos.fold(0, (soma, candidato) => soma + candidato.votos);

    if (totalVotos == 0) {
      print("\nNenhum voto registrado.");
      return;
    }

    // Ordena os candidatos por votos (decrescente)
    candidatos.sort((a, b) => b.votos.compareTo(a.votos));

    // Exibe os candidatos e suas porcentagens
    print("\nResultados da Eleição:");
    for (var candidato in candidatos) {
      double porcentagem = (candidato.votos / totalVotos) * 100;
      print("${candidato.nome}: ${candidato.votos} votos (${porcentagem.toStringAsFixed(2)}%)");
    }

    // Verifica se o primeiro candidato é eleito em primeiro turno
    if ((candidatos[0].votos / totalVotos) > 0.5) {
      print("\n${candidatos[0].nome} foi eleito em primeiro turno!");
    } else {
      print("\nHaverá segundo turno!");
    }
  }
}
