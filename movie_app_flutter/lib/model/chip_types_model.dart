enum ChipTypes {
  action(0),
  crime(1),
  comedy(2),
  drama(3),
  action1(4),
  action2(5),
  defaultType(-1);

  const ChipTypes(this.type);

  final int type;
}

extension ChipTypesExtension on ChipTypes {
  String getName() {
    return name.toString().toLowerCase();
  }
}
