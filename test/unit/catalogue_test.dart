import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Infrastructure/Database/products_mapper.dart';
import 'package:online_order_client/Infrastructure/Database/idatabase.dart';

import 'catalogue_test.mocks.dart';

@GenerateMocks([IProductsDatabase])
void main() {
  IProductsDatabase _databaseMock = MockIProductsDatabase();
  ProductsMapper _productsManager = ProductsMapper(_databaseMock);

  test('should return a list of categories', () async {
    when(_databaseMock.loadCategories())
        .thenAnswer((realInvocation) => Future(() => [
              {'Name': 'pizza'},
              {'Name': 'drinks'}
            ]));

    expect(await _productsManager.getCategories(), ['pizza', 'drinks']);
  });
  test('should return a map<category , product list>', () async {
    when(_databaseMock.loadProducts(category: 'pizza', startIndex: 0, count: 2))
        .thenAnswer((realInvocation) => Future(() => [
              {
                'Name': '4season',
                'Description': 'test',
                'Price': '32',
                'ImageUrl': 'test.com',
                'Size': 'normal'
              },
              {
                'Name': 'auFeu',
                'Description': 'test',
                'Price': '64',
                'ImageUrl': 'test.com',
                'Size': 'big'
              },
            ]));
    List<Product> resultProducts = await _productsManager.getProducts(
        categoryId: 'pizza', startIndex: 0, productsCount: 2);
    expect(resultProducts[0].getName(), "4season");
  });
}
