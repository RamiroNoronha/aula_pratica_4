class Authenticator {
  // Method to validate CPF
  bool validateCPF(String cpf) {
    // Regular expression to validate CPF format
    RegExp regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
    if (!regex.hasMatch(cpf)) {
      return false;
    }

    // Remove dots and dashes to check the numbers
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Simple validation for length (should have 11 digits)
    if (cpf.length != 11) return false;

    // Simplified verification (for illustrative purposes)
    // In a real-world scenario, you'd need to validate the CPF's check digits
    return true;
  }

  // Method to validate credit card number using the Luhn algorithm
  bool validateCreditCard(String cardNumber) {
    // Remove non-numeric characters (like spaces or dashes)
    cardNumber = cardNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the card number has exactly 16 digits
    if (cardNumber.length != 16) {
      return false;
    }

    int sum = 0;
    bool alternate = false;

    // Apply Luhn algorithm to validate the card number
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    // The card number is valid if the sum is divisible by 10
    return sum % 10 == 0;
  }
}
