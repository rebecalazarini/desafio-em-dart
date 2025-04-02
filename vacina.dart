import 'dart:io';

class Paciente {
  String nome;
  int idade;
  String sexo;
  bool apto;

  Paciente(this.nome, this.idade, this.sexo)
      : apto = false {
    apto = verificarAptidao();
  }

  bool verificarAptidao() {
    if (sexo.toLowerCase() == 'masculino' && idade >= 14 && idade <= 50) {
      return true;
    } else if (sexo.toLowerCase() == 'feminino' && idade >= 20 && idade <= 40) {
      return true;
    }
    return false;
  }
}

void main() {
  List<Paciente> pacientes = [];
  int opcao = 0;

  do {
    print('\nMenu:');
    print('1 - Adicionar paciente');
    print('2 - Listar pacientes');
    print('3 - Sair');
    stdout.write('Escolha uma opção: ');
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        stdout.write('Digite o nome do paciente: ');
        String nome = stdin.readLineSync()!;
        stdout.write('Digite a idade do paciente: ');
        int idade = int.parse(stdin.readLineSync()!);
        stdout.write('Digite o sexo do paciente (Masculino/Feminino): ');
        String sexo = stdin.readLineSync()!;
        pacientes.add(Paciente(nome, idade, sexo));
        print('Paciente adicionado com sucesso!');
        break;

      case 2:
        print('\nPacientes Aptos e Não Aptos:');
        for (var paciente in pacientes) {
          String status = paciente.apto ? 'Apto' : 'Não Apto';
          print('${paciente.nome} (${paciente.sexo}, ${paciente.idade} anos) - $status');
        }
        break;

      case 3:
        print('Encerrando o programa.');
        break;

      default:
        print('Opção inválida. Tente novamente.');
    }
  } while (opcao != 3);
}
