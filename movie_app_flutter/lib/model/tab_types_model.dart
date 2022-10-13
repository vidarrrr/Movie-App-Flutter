//https://stackoverflow.com/questions/38908285/how-do-i-add-methods-or-values-to-enums-in-dart
enum TabTypes {
  inTheatre(0),
  boxOffice(1),
  comingSoon(2);

  const TabTypes(this.type);

  final int type;
}
