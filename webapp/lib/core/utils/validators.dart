class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "L'email est requis";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Entrez un email valide";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Le mot de passe est requis";
    }
    if (value.length < 6) {
      return "Le mot de passe doit contenir au moins 6 caractères";
    }
    return null;
  }
}
