typedef CategoryMap = List<Category>;

class Category {
  late String _name;
  late String _imageUrl;

  Category(String name, String imageUrl) {
    _name = name;
    _imageUrl = imageUrl;
  }

  String getName() {
    return _name;
  }

  String getImageUrl() {
    return _imageUrl;
  }
}
