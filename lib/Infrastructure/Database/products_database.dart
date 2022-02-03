// ignore_for_file: empty_catches

import 'dart:io';

import 'package:online_order_client/Infrastructure/Database/idatabase.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDatabase implements IProductsDatabase {
  static const String _productsDatabaseName = 'Products.db';

  late Database _productsDatabase;
  final IOnlineServerAcess _serverAccess;

  ProductsDatabase(this._serverAccess);

  @override
  Future<void> connect() async {
    File databaseFile = await _getLocalDatabaseFile();
    int databaseVersion = await _serverAccess.fetchData(dataUrl: 'version');

    if (!await databaseFile.exists()) {
      _serverAccess.downloadFile(
          fileUrl: _productsDatabaseName, out: databaseFile);
    }

    await _connectToLocalDatabase(localDatabasePath: databaseFile.path);
    if (await _checkForNewVersion(databaseVersion)) {
      disconnect();
      _serverAccess.downloadFile(
          fileUrl: _productsDatabaseName, out: databaseFile);
      await _connectToLocalDatabase(localDatabasePath: databaseFile.path);
      _productsDatabase.setVersion(databaseVersion);
    }
  }

  @override
  Future<void> disconnect() async {
    _productsDatabase.close();
  }

  @override
  Future<ResultSet> loadCategories() async {
    return await _productsDatabase.query('Categories',
        columns: ['Name', 'ImageUrl', 'ProductsCount', 'Id']);
  }

  @override
  Future<ResultSet> loadProducts(
      {required String category,
      required int startIndex,
      required int count}) async {
    return await _productsDatabase.query(category,
        columns: ['Name', 'Description', 'Price', 'ImageUrl', 'Size'],
        limit: count,
        where: "Position >= $startIndex");
  }

  Future<File> _getLocalDatabaseFile() async {
    String path = await getDatabasesPath();
    File databaseFile = File('$path/$_productsDatabaseName');
    return databaseFile;
  }

  Future<void> _connectToLocalDatabase(
      {required String localDatabasePath}) async {
    try {
      _productsDatabase = await openDatabase(localDatabasePath);
    } catch (e) {}
  }

  Future<bool> _checkForNewVersion(int fireBaseDatabaseVersion) async {
    int localDatabaseVersion = await _productsDatabase.getVersion();
    bool newUpdateAvaillable =
        (localDatabaseVersion != fireBaseDatabaseVersion);

    return newUpdateAvaillable;
  }
}
