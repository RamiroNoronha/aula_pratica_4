import 'package:aula_pratica_4/model/authenticator.dart';

void main() {
  var authenticator = Authenticator();

  // Test CPF validation
  String cpf = "123.456.789-09";
  if (authenticator.validateCPF(cpf)) {
    print("Valid CPF!");
  } else {
    print("Invalid CPF.");
  }

  // Test credit card validation
  String cardNumber = "1234 5678 9876 5432";
  if (authenticator.validateCreditCard(cardNumber)) {
    print("Valid credit card number!");
  } else {
    print("Invalid credit card number.");
  }
}
