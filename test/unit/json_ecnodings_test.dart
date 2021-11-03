import 'package:flutter_test/flutter_test.dart';
import 'package:online_order_client/Models/Profile/address_model.dart';
import 'package:online_order_client/Models/Profile/iprofile.dart';
import 'package:online_order_client/Models/Profile/profile_model.dart';

Future<void> setUpProfile(IProfile profileMock) async {
  AddressModel addressModel = AddressModel(
      coordinationX: '32', coordinationY: '64', extraInfos: 'bloc C');
  profileMock.setAddress(addressModel: addressModel);
  profileMock.setEmail(email: 'idir@gmail');
  profileMock.setFullName(fullName: 'idir yacine');
  profileMock.setPhoneNumber(number: '0621xxxxx');
  profileMock.saveProfile();
}

void main() {
  group('Profile Tests', () {
    IProfile profileMock = ProfileModel();
    String expectedJson =
        '{"6548bba32":{"fullName":"idir yacine","phoneNumber":"0621xxxxx","email":"idir@gmail","coordinationX":"32","coordinationY":"64","extraInfos":"bloc C"}}';

    setUpAll(() async {
      setUpProfile(profileMock);
    });
    test('should encode profile into json Format', () {
      expect(profileMock.getProfileJson(), expectedJson);
    });
    test('should correctly Load profile Json', () {
      profileMock.loadProfile();
      expect(profileMock.getProfileJson(), expectedJson);
    });
  });
}
