import 'dart:io';

class PalindromeChecker {
  String sentence;

  PalindromeChecker(this.sentence);

  String reverseSentence() {
    List<String> stack = [];
    
    // Menyimpan karakter ke dalam stack
    for (int i = 0; i < sentence.length; i++) {
      stack.add(sentence[i]);
    }

    // Membalik kalimat
    String reversedSentence = stack.reversed.join('');
    return reversedSentence;
  }

  bool isPalindrome() {
    // Menghapus spasi dan membandingkan kalimat asli dengan kalimat yang dibalik
    String cleanedSentence = sentence.replaceAll(' ', '').toLowerCase();
    String reversedSentence = reverseSentence().replaceAll(' ', '').toLowerCase();
    return cleanedSentence == reversedSentence;
  }
}

void main() {
  // Input kalimat dari pengguna
  stdout.write("Masukkan kalimat: ");
  String sentence = stdin.readLineSync()!;

  // Membuat objek PalindromeChecker
  PalindromeChecker checker = PalindromeChecker(sentence);

  // Membalik kalimat
  String reversedSentence = checker.reverseSentence();

  // Menentukan apakah kalimat adalah palindrom
  String palindromeStatus = checker.isPalindrome() ? "Palindrom" : "Bukan palindrom";

  // Menampilkan hasil
  print("Hasil = $reversedSentence");
  print(palindromeStatus);
}