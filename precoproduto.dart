import 'dart:io';

void main() {
  print('Digite o preço do produto: ');

  // Entrada de dados como string
  String? entrada = stdin.readLineSync();

  // Verifica se a entrada não é nula e converte para double
  if (entrada != null && entrada.isNotEmpty) {
    double preco = double.parse(entrada);

    if (preco > 1000) {
      preco = preco * 0.08;
      print('Desconto aplicado de 8%.');
    } else {
      print('Desconto não aplicado.');
    }

    // Exibe o preço final
    print('desconto: R\$${preco.toStringAsFixed(2)}');
  } else {
    print('Entrada inválida. Por favor, insira um número válido.');
  }
}
