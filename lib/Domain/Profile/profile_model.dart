// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../GpsLocation/address.dart';
import 'iprofile.dart';

class ProfileModel implements IProfile {
  late String _email, _fullName, _phoneNumber, _id = "f21";
  late Address _address;
  String _json = '';

  @override
  String getEmail() {
    return _email;
  }

  @override
  String getFullName() {
    return _fullName;
  }

  @override
  String getPhoneNumber() {
    return _phoneNumber;
  }

  @override
  void setEmail({required String email}) {
    _email = email;
  }

  @override
  void setFullName({required String fullName}) {
    _fullName = fullName;
  }

  @override
  void setPhoneNumber({required String number}) {
    _phoneNumber = number;
  }

  @override
  Address getAddress() {
    return _address;
  }

  @override
  void setAddress({required Address address}) {
    _address = address;
  }

  @override
  String getUserId() {
    return _id;
  }

  @override
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
  @override
  Future<void> saveProfile() async {
    try {
      File profile = await _getProfileFile();
      _encodeToJson();
      profile.writeAsString(_json);
    } catch (e) {}
  }

  Future<File> _getProfileFile() async {
    Directory saveDirectory = await getApplicationDocumentsDirectory();
    File profile = File('${saveDirectory.path}/profile.json');
    if (!(await profile.exists())) {
      profile.create();
    }
    return profile;
  }

  @override
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

  void _populateProfileData(Map<String, String> dataSource) {
    _email = dataSource['email']!;
    _phoneNumber = dataSource['phoneNumber']!;
    _fullName = dataSource['fullName']!;
    _id = dataSource['id']!;
    _address = Address();
  }

  /// Read profile json from storage and decode it
  @override
  Future<void> loadProfile() async {
    try {
      File profile = await _getProfileFile();
      _json = await profile.readAsString();
      Map<String, String> decodedProfile = jsonDecode(_json);
      _populateProfileData(decodedProfile);
    } catch (e) {
      _initProfileWithDefaults();
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'fullName': _fullName,
      'phoneNumber': _phoneNumber,
      'email': _email,
    };
  }
}
