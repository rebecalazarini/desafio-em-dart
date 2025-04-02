import 'dart:io';

void main() {
  print('Digite o salário do funcionário:');
  double salario = double.parse(stdin.readLineSync()!);

  double desconto = 0.0;

  if (salario <= 1518.00) {
    desconto = salario * 0.075;
  } else if (salario <= 2793.88) {
    desconto = (1518.00 * 0.075) + ((salario - 1518.00) * 0.09);
  } else if (salario <= 4190.83) {
    desconto = (1518.00 * 0.075) + ((2793.88 - 1518.00) * 0.09) + ((salario - 2793.88) * 0.12);
  } else if (salario <= 8157.41) {
    desconto = (1518.00 * 0.075) + ((2793.88 - 1518.00) * 0.09) + ((4190.83 - 2793.88) * 0.12) + ((salario - 4190.83) * 0.14);
  } else {
    desconto = (1518.00 * 0.075) + ((2793.88 - 1518.00) * 0.09) + ((4190.83 - 2793.88) * 0.12) + ((8157.41 - 4190.83) * 0.14);
  }

  double salarioFinal = salario - desconto;

  print('Desconto do INSS: R\$${desconto.toStringAsFixed(2)}');
  print('Salário final: R\$${salarioFinal.toStringAsFixed(2)}');
}
