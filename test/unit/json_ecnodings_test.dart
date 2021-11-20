import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Models/Cart/cart_item.dart';
import 'package:online_order_client/Models/Cart/cart.dart';
import 'package:online_order_client/Models/Cart/icart.dart';
import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Models/Products/product_model.dart';
import 'package:online_order_client/Models/GpsLocation/address.dart';
import 'package:online_order_client/Models/Profile/iprofile.dart';
import 'package:online_order_client/Models/Profile/profile_model.dart';

Future<void> setUpProfile(IProfile profileMock) async {
  Address addressModel = Address();
  addressModel.updateInfos(infos: "bloc C");
  addressModel.updateLocation(latitude: 32.0, longitude: 64.0);
  profileMock.setAddress(address: addressModel);
  profileMock.setEmail(email: 'idir@gmail');
  profileMock.setFullName(fullName: 'idir yacine');
  profileMock.setPhoneNumber(number: '0621xxxxx');
  profileMock.saveProfile();
}

Future<void> setUpOrderTest(ICart cart) async {
  Product product = Product("pizza", "none", "test.com", [32.0], ["normal"]);
  ICartItem cartItem = CartItem(id: '0', product: product, quantity: 1);
  cartItem.setSize(0);
  cart.addProduct(product: cartItem);
}

void main() {
  group('Profile encoding', () {
    IProfile profileMock = ProfileModel();

    String expectedJson =
        '{"profile":{"fullName":"idir yacine","phoneNumber":"0621xxxxx","email":"idir@gmail"},"address":{"latitude":32.0,"longitude":64.0,"extras":"bloc C"}}';

    setUpAll(() async {
      setUpProfile(profileMock);
    });

    test('should correctly Load profile Json', () {
      profileMock.loadProfile();
      expect(profileMock.getProfileJson(), expectedJson);
    });
  });

  group("Order encoding", () {
    ICart cartMock = Cart();
    IOrder order;
    setUpAll(() async {
      setUpOrderTest(cartMock);
    });

    test("encode order To Server Map Format", () {
      Map<String, dynamic> expectedResult = {
        "0": {"name": "pizza", "quantity": 1, "size": "normal"}
      };
      order = cartMock.placeOrder();
      expect(order.formatOnlineOrder(), expectedResult);
    });
    test("encode order to Status Map", () {
      Map<String, dynamic> expectedResult = {"status": "Waiting"};
      order = cartMock.placeOrder();
      expect(order.toMap(), expectedResult);
    });
  });
}
