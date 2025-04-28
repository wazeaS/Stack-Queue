import 'package:stack/stack.dart';
import 'dart:io';

class Converter {
  // Mengonversi desimal ke biner
  String decimalToBinary(int decimal) {
    Stack<int> stack = Stack<int>();
    while (decimal > 0) {
      stack.push(decimal % 2);
      decimal ~/= 2;
    }
    String binary = '';
    while (!stack.isEmpty) {
      binary += stack.pop().toString();
    }
    return binary;
  }

  // Mengonversi desimal ke oktal
  String decimalToOctal(int decimal) {
    Stack<int> stack = Stack<int>();
    while (decimal > 0) {
      stack.push(decimal % 8);
      decimal ~/= 8;
    }
    String octal = '';
    while (!stack.isEmpty) {
      octal += stack.pop().toString();
    }
    return octal;
  }

  // Mengonversi desimal ke heksadesimal
  String decimalToHexadecimal(int decimal) {
    Stack<String> stack = Stack<String>();
    const hexDigits = '0123456789ABCDEF';
    while (decimal > 0) {
      stack.push(hexDigits[decimal % 16]);
      decimal ~/= 16;
    }
    String hexadecimal = '';
    while (!stack.isEmpty) {
      hexadecimal += stack.pop();
    }
    return hexadecimal;
  }
}

void main() {
  Converter converter = Converter();
  
  stdout.write('Masukkan nilai desimal: ');
  int decimal = int.parse(stdin.readLineSync()!);

  String binary = converter.decimalToBinary(decimal);
  String octal = converter.decimalToOctal(decimal);
  String hexadecimal = converter.decimalToHexadecimal(decimal);

  print('Hasil nilai biner: $binary');
  print('Hasil nilai oktal: $octal');
  print('Hasil nilai heksadesimal: $hexadecimal');
}