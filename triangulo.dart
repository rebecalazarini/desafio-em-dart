import 'dart:io';

void main() {
  
  print('Digite o valor do lado a:');
  double a = double.parse(stdin.readLineSync()!);

  print('Digite o valor do lado b:');
  double b = double.parse(stdin.readLineSync()!);

  print('Digite o valor do lado c:');
  double c = double.parse(stdin.readLineSync()!);

  
if (a + b > c && a + c > b && b + c > a) {
    if (a == b && b == c) {
      print('Triângulo equilatero');
    } else if (a != b && b != c && a != c) {
      print('Triângulo escaleno');
    } else {
      print('Triângulo isóseles');
    }
  } else {
    print('Não é um triangulo');
  }
}
