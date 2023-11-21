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
  String? sTypename;
  String? name;
  int? accountNumber;
  double? balance;
  String? currency;
  Address? address;
  List<TransactionsData>? recentTransactions;
  List<TransactionsData>? upcomingBills;

  Home(
      {this.sTypename,
        this.name,
        this.accountNumber,
        this.balance,
        this.currency,
        this.address,
        this.recentTransactions,
        this.upcomingBills});

  Home.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    name = json['name'];
    accountNumber = int.tryParse(json['accountNumber']);
    balance = json['balance'];
    currency = json['currency'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['recentTransactions'] != null) {
      recentTransactions = <TransactionsData>[];
      json['recentTransactions'].forEach((v) {
        recentTransactions!.add(TransactionsData.fromJson(v));
      });
    }
    if (json['upcomingBills'] != null) {
      upcomingBills = <TransactionsData>[];
      json['upcomingBills'].forEach((v) {
        upcomingBills!.add(TransactionsData.fromJson(v));
      });
    }
  }

}

class Address {
  String? sTypename;
  String? streetName;
  int? buildingNumber;
  String? townName;
  int? postCode;
  String? country;

  Address(
      {this.sTypename,
        this.streetName,
        this.buildingNumber,
        this.townName,
        this.postCode,
        this.country});

  Address.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    streetName = json['streetName'];
    buildingNumber = int.tryParse(json['buildingNumber']);
    townName = json['townName'];
    postCode = int.tryParse(json['postCode']);
    country = json['country'];
  }
}