import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';
import 'package:online_order_client/Models/Products/products_factory.dart';
import 'package:online_order_client/Utility/Database/idatabase.dart';
import 'catalogue_test.mocks.dart';

@GenerateMocks([IProductsDatabase])
void main() {
  IProductsDatabase _databaseMock = MockIProductsDatabase();
  ProductsFactory _productsManager = ProductsFactory(dataSource: _databaseMock);

  test('should return a list of categories', () async {
    when(_databaseMock.loadCategories())
        .thenAnswer((realInvocation) => Future(() => [
              {'name': 'pizza'},
              {'name': 'drinks'}
            ]));

    expect(await _productsManager.getCategories(), ['pizza', 'drinks']);
  });
  test('should return a map<category , product list>', () async {
    when(_databaseMock.loadProducts(category: 'pizza', count: 2))
        .thenAnswer((realInvocation) => Future(() => [
              {
                'name': '4season',
                'description': 'test',
                'price': '32',
                'image_url': 'test.com'
              },
              {
                'name': 'auFeu',
                'description': 'test',
                'price': '64',
                'image_url': 'test.com'
              },
            ]));
    List<IProduct> resultProducts = await _productsManager.getProducts(
        productCategory: 'pizza', productsCount: 2);
    expect(resultProducts[0].getName(), "4season");
  });
}
