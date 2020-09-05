class ProductValidator {
  static String nameValidator(String value) {
    if (value.isEmpty) {
      return 'Please, provide a name';
    }

    return null;
  }

  static String numberValidator(String value, String field) {
    if (value.isEmpty) {
      return 'Please enter a $field';
    }

    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }

    if (double.parse(value) <= 0) {
      return 'Please enter a number greater than zero ';
    }

    return null;
  }

  static String imageURLValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter an image URL';
    }

    if (!value.endsWith('.jpg') &&
        !value.endsWith('.png') &&
        !value.endsWith('.jpeg')) {
      return 'Please enter a valid URL';
    }

    return null;
  }
}
