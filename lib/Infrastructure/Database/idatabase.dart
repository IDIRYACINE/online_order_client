typedef ResultSet = List<QueryResult>;
typedef QueryResult = Map<String, Object?>;

abstract class IProductsDatabase {
  Future<void> connect();
  Future<void> disconnect();
  Future<ResultSet> loadProducts(
      {required String category, required int startIndex, required int count});
  Future<ResultSet> loadCategories();
}
