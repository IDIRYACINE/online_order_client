import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Models/Cart/cart_model.dart';
import 'package:online_order_client/Models/Cart/icart.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';
import 'package:online_order_client/Models/Products/product_model.dart';

void main() {
  final ICart cartMock = CartModel();
  late IProduct mockProduct;
  setUp(() {
    Map<String, Object?> productMap = {
      'Name': 'IDIR',
      'Description': 'Nothing',
      'Price': '21',
      'Image_URL': 'test.com'
    };
    mockProduct = ProductModel(productMap: productMap);
    cartMock.addProduct(product: mockProduct);
  });
  test('Should add product', () {
    cartMock.addProduct(product: mockProduct);
    expect(cartMock.getProductsCount(), 2);
    expect(cartMock.getProduct(productId: 0).getName(), 'IDIR');
  });
  test('Should remove product ', () {
    cartMock.removeProduct(productId: 0);
    expect(cartMock.getProductsCount(), 2);
  });
  test('Should edit product order details', () {});
  test('Should clear cart', () {
    cartMock.clearCart();
    expect(cartMock.getProductsCount(), 0);
  });
  test('Should calculate products total price', () {
    cartMock.addProduct(product: mockProduct);
    expect(cartMock.getTotalPrice(), 42);
  });
}
