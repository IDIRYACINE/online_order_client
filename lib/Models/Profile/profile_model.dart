import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'address_model.dart';
import 'iprofile.dart';

class ProfileModel implements IProfile {
  static final ProfileModel _profileModel = ProfileModel._();
  late String _email, _fullName, _phoneImei, _phoneNumber;
  late Address _address;
  String _json = '';

  factory ProfileModel() {
    return _profileModel;
  }

  ProfileModel._() {
    loadProfile();
  }

  @override
  String getEmail() {
    return _email;
  }

  @override
  String getFullName() {
    return _fullName;
  }

  @override
  String getPhoneImei() {
    return _phoneImei;
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

  String _encodeToJson() {
    String addressJson = _address.toJson();
    String profileJson = jsonEncode({
      "profile": {
        'fullName': _fullName,
        'phoneNumber': _phoneNumber,
        'email': _email,
      }
    });
    _json = '{"$_phoneImei":$profileJson,$addressJson}';
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
    _phoneImei = '6548bba32';
    _phoneNumber = '';
    _address = Address();
  }

  void _populateProfileData(Map<String, String> dataSource) {
    _email = dataSource['email']!;
    _phoneNumber = dataSource['phoneNumber']!;
    _phoneImei = dataSource['phoneImei']!;
    _fullName = dataSource['fullName']!;
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
}
