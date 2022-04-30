import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:online_order_client/Domain/Profile/iprofile.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';

Future<void> setUpProfile(IProfile profileMock) async {
  Address addressModel = Address();
  addressModel.updateAddress(infos: "bloc C");
  addressModel.updateCoordinates(latitude: 32.0, longitude: 64.0);
  profileMock.setAddress(address: addressModel);
  profileMock.setEmail(email: 'idir@gmail');
  profileMock.setFullName(fullName: 'idir yacine');
  profileMock.setPhoneNumber(number: '0621xxxxx');
  profileMock.setUserId(id: "idir");
  profileMock.saveProfile();
}

Future<void> setUpOrderTest(Cart cart) async {
  Product product = Product("pizza", "none", "test.com", [32.0], ["normal"]);
  CartItem cartItem = CartItem(product: product, quantity: 1);
  cartItem.setSize(0);
  cart.addProduct(product: cartItem);
}

void main() {
  group('Profile encoding', () {
    IProfile profileMock = ProfileModel();

    String expectedJson =
        '{"profile":{"id":"idir","fullName":"idir yacine","phoneNumber":"0621xxxxx","email":"idir@gmail"},"address":{"latitude":32.0,"longitude":64.0,"address":"bloc C"}}';

    setUpAll(() async {
      setUpProfile(profileMock);
    });

    test('should correctly Load profile Json', () {
      profileMock.saveProfile();
      profileMock.loadProfile();
      expect(profileMock.getProfileJson(), expectedJson);
    });
  });

  group("Order encoding", () {
    Cart cartMock = Cart();
    IOrder order;
    setUpAll(() async {
      setUpOrderTest(cartMock);
    });

    test("encode order To Server Map Format", () {
      Map<String, dynamic> expectedResult = {
        'items': [
          {'name': 'pizza', 'quantity': 1, 'size': 'n', 'price': 32.0}
        ]
      };
      order = cartMock.placeOrder();
      expect(order.formatOnlineOrder(), expectedResult);
    });
    test("encode order to Status Map", () {
      Map<String, dynamic> expectedResult = {"status": "Waiting"};
      order = cartMock.placeOrder();
      expect(order.orderStatusJson(), expectedResult);
    });
  });
}
