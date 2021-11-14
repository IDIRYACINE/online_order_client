import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Models/Cart/cart_item.dart';
import 'package:online_order_client/Models/Cart/cart.dart';
import 'package:online_order_client/Models/Cart/icart.dart';
import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';
import 'package:online_order_client/Models/Products/product_model.dart';

void main() {
  final ICart cartMock = Cart();
  late ICartItem cartItem;
  setUp(() {
    IProduct product =
        Product('IDIR', 'Nothing', 'test.com', [21, 32], ["mid,large"]);
    cartItem = CartItem(id: '0', product: product, quantity: 1);

    cartMock.addProduct(product: cartItem);
  });
  test('Should add product', () {
    cartMock.addProduct(product: cartItem);
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
    cartMock.addProduct(product: cartItem);
    expect(cartMock.getTotalPrice(), 42);
  });
}
