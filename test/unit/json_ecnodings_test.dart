import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Models/Profile/address_model.dart';
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

void main() {
  group('Profile Tests', () {
    IProfile profileMock = ProfileModel();

    String expectedJson =
        '{"6548bba32":"profile":{"fullName":"idir yacine","phoneNumber":"0621xxxxx","email":"idir@gmail"},"address":{"latitude":32.0,"longitude":64.0,"extras":"bloc C"}}';

    setUpAll(() async {
      setUpProfile(profileMock);
    });

    test('should correctly Load profile Json', () {
      profileMock.loadProfile();
      expect(profileMock.getProfileJson(), expectedJson);
    });
  });
}
