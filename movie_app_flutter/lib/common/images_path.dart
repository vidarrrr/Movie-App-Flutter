enum ImagesPath {
  menu("menu"),
  rectangleTab("rectangle_tab"),
  search("search");

  const ImagesPath(this.typeName);
  final String typeName;
}

extension ImagePath on ImagesPath {
  String getPath() {
    return "assets/png/$typeName.png";
  }
}
