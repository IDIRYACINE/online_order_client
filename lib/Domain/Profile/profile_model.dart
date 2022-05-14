// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:io';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:path_provider/path_provider.dart';

class ProfileModel {
  late String _email, _fullName, _phoneNumber, _id;
  late Address _address;
  String _json = '';

  String getEmail() {
    return _email;
  }

  String getFullName() {
    return _fullName;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  void setEmail({required String email}) {
    _email = email;
  }

  void setFullName({required String fullName}) {
    _fullName = fullName;
  }

  void setPhoneNumber({required String number}) {
    _phoneNumber = number;
  }

  Address getAddress() {
    return _address;
  }

  void setAddress({required Address address}) {
    _address = address;
  }

  String getUserId() {
    return _id;
  }

  void setUserId({required String id}) {
    _id = id;
  }

  String _encodeToJson() {
    Map<String, dynamic> addressJson = _address.toMap();
    Map<String, dynamic> profileJson = toMap();

    _json = jsonEncode({"profile": profileJson, "address": addressJson});
    return _json;
  }

  /// Save profile changes by writing it to json file
  Future<void> saveProfile() async {
    try {
      File profile = await _getProfileFile();
      _encodeToJson();
      profile.writeAsString(_json);
    } catch (e) {
      throw (e as Error);
    }
  }

  Future<File> _getProfileFile() async {
    Directory saveDirectory = await getApplicationDocumentsDirectory();
    File profile = File('${saveDirectory.path}/profile.json');
    if (!(await profile.exists())) {
      profile.create();
    }
    return profile;
  }

  String getProfileJson() {
    if (_json == '') {
      _encodeToJson();
    }
    return _json;
  }

  void _initProfileWithDefaults() {
    _email = '';
    _fullName = '';
    _phoneNumber = '';
    _id = '';
    _address = Address();
  }

  void _populateProfileData(Map<String, dynamic> dataSource) {
    _email = dataSource['email']!;
    _phoneNumber = dataSource['phoneNumber']!;
    _fullName = dataSource['fullName']!;
    _id = dataSource['id']!;
    _address = Address();
  }

  /// Read profile json from storage and decode it
  Future<void> loadProfile() async {
    try {
      File profile = await _getProfileFile();
      _json = await profile.readAsString();
      Map<String, dynamic> decodedProfile = jsonDecode(_json);
      _populateProfileData(decodedProfile['profile']);
    } catch (e) {
      _initProfileWithDefaults();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'fullName': _fullName,
      'phoneNumber': _phoneNumber,
      'email': _email,
    };
  }

  /// Make sure all fields are set correctly
  Future<bool> selfValidate() async {
    bool emptyCheck(String value) {
      return value != "";
    }

    if (emptyCheck(_fullName) || emptyCheck(_phoneNumber)) {
      return false;
    }
    return true;
  }
}
