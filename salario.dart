import 'dart:io';

void main() {
  print('Digite seu salario: ');
  double salario = double.parse(stdin.readLineSync()!);

  print('Digite o numeros de filhos: ');
  int filhos = int.parse(stdin.readLineSync()!);

  double salarioF = 0.0;
    if (salario < 2000) {
      salarioF = filhos * 60.0;
      double salarioFi = salario + salarioF;
      print('Salario atualizado:  R\$${salarioFi.toStringAsFixed(2)} ');
    } else {
      print('Salario sem alteração');
    }
}