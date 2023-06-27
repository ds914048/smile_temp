
extension StringExtension on String {

  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get capitalizeAllLetter => toUpperCase();

  bool get isCharacters => RegExp(r'^[A-Za-z]+$').hasMatch(this);

  bool get isCharactersAndSpaces => RegExp(r'^[A-Za-z\ ]+$').hasMatch(this);
  bool get isName => RegExp(r'^[a-zA-z]+([\s][a-zA-Z]+)*$').hasMatch(this);
  bool get isCharactersNotSpaces => RegExp(r'^[^\s][a-zA-Z\s]+$').hasMatch(this);

  bool get isCharactersSpacesAndNum => RegExp(r'^[A-Za-z0-9\ ]+$').hasMatch(this);

  bool get isAlphaNumeric => RegExp(r'^[a-zA-Z0-9]*$').hasMatch(this);
  bool get isNumber => RegExp(r'^[0-9]*$').hasMatch(this);

  bool get containSpace => contains(' ');

  bool get isInteger => RegExp(r'^[0-9]+$').hasMatch(this);
  String get getIntegersFromString => replaceAll(RegExp(r'[^0-9]'), '');

  bool get isInPhoneNo => RegExp(r'^[0-9]+$').hasMatch(this) && length == 10;
  bool get isMobileNumber => RegExp(r'^[6-9][0-9]{9}$').hasMatch(this) && length == 10;

  bool get isInPinCode => RegExp(r'^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$').hasMatch(this);

  bool get isInPanCard => RegExp(r'^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}').hasMatch(this);

  bool get isValidEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  bool get isIfsc => RegExp(r'^[A-Za-z]{4}0[A-Za-z0-9]{6}$').hasMatch(this);


}
