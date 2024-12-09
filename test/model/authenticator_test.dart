import 'package:aula_pratica_4/model/authenticator.dart';
import 'package:test/test.dart';

void main() {
  group('Authenticator Tests', () {
    final authenticator = Authenticator();

    // Test for validateCPF method
    test('Valid CPF', () {
      String validCpf = '123.456.789-09';
      expect(authenticator.validateCPF(validCpf), isTrue);
    });

    test('Invalid CPF (wrong format)', () {
      String invalidCpf = '12345678909'; // Missing dots and dashes
      expect(authenticator.validateCPF(invalidCpf), isFalse);
    });

    test('Invalid CPF (wrong length)', () {
      String invalidCpf = '123.456.789-0'; // Only 10 digits
      expect(authenticator.validateCPF(invalidCpf), isFalse);
    });

    // Test for validateCreditCard method
    test('Valid Credit Card', () {
      String validCard = '1234 5678 9876 5437'; // Valid card number
      expect(authenticator.validateCreditCard(validCard), isTrue);
    });

    test('Invalid Credit Card (wrong length)', () {
      String invalidCard = '1234 5678 9876'; // Only 12 digits
      expect(authenticator.validateCreditCard(invalidCard), isFalse);
    });

    test('Invalid Credit Card (wrong checksum)', () {
      String invalidCard = '1234 5678 9876 0000'; // Invalid checksum
      expect(authenticator.validateCreditCard(invalidCard), isFalse);
    });

    test('Invalid Credit Card (non-numeric)', () {
      String invalidCard = '1234 5678 ABCD 5432'; // Contains letters
      expect(authenticator.validateCreditCard(invalidCard), isFalse);
    });
  });
}
