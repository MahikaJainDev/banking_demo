import 'transaction_model.dart';

class HomeDataModel {
  String? sTypename;
  Home? home;

  HomeDataModel({this.sTypename, this.home});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
}

class Home {
  String? _name;
  String? _currency;
  String? _accountNumber;
  num? _balance;
  Address? _address;
  List<TransactionsData>? _recentTransactions;
  List<TransactionsData>? _upcomingBills;

  Home.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _accountNumber = json['accountNumber'];
    _balance = json['balance'];
    _currency = json['currency'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['recentTransactions'] != null) {
      _recentTransactions = <TransactionsData>[];
      json['recentTransactions'].forEach((v) {
        _recentTransactions!.add(TransactionsData.fromJson(v));
      });
    }
    if (json['upcomingBills'] != null) {
      _upcomingBills = <TransactionsData>[];
      json['upcomingBills'].forEach((v) {
        _upcomingBills!.add(TransactionsData.fromJson(v));
      });
    }
  }

  Address? get getAddress => _address;
  String get getName => _name ?? '';
  String get getCurrency => _currency ?? '';
  String get getAccountNumber => _accountNumber ?? '';
  num get getBalance => _balance ?? 0.0;
  List<TransactionsData> get getUpcomingBills => _upcomingBills ?? [];
  List<TransactionsData> get getRecentTransactions => _recentTransactions ?? [];

}

class Address {
  String? _streetName;
  String? _country;
  String? _townName;
  int? _buildingNumber;
  int? _postCode;

  Address.fromJson(Map<String, dynamic> json) {
    _streetName = json['streetName'];
    _buildingNumber = int.tryParse(json['buildingNumber']);
    _townName = json['townName'];
    _postCode = int.tryParse(json['postCode']);
    _country = json['country'];
  }

  @override
  String toString() => '$_buildingNumber, $_streetName, $_townName, $_country, $_postCode';
}