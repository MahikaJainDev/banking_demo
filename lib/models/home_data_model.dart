class HomeDataModel {
  String? sTypename;
  Home? home;

  HomeDataModel({this.sTypename, this.home});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    return data;
  }
}

class Home {
  String? sTypename;
  String? name;
  int? accountNumber;
  double? balance;
  String? currency;
  Address? address;
  List<RecentTransactions>? recentTransactions;
  List<UpcomingBills>? upcomingBills;

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
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['recentTransactions'] != null) {
      recentTransactions = <RecentTransactions>[];
      json['recentTransactions'].forEach((v) {
        recentTransactions!.add(new RecentTransactions.fromJson(v));
      });
    }
    if (json['upcomingBills'] != null) {
      upcomingBills = <UpcomingBills>[];
      json['upcomingBills'].forEach((v) {
        upcomingBills!.add(new UpcomingBills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    data['balance'] = this.balance;
    data['currency'] = this.currency;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.recentTransactions != null) {
      data['recentTransactions'] =
          this.recentTransactions!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingBills != null) {
      data['upcomingBills'] =
          this.upcomingBills!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['streetName'] = this.streetName;
    data['buildingNumber'] = this.buildingNumber;
    data['townName'] = this.townName;
    data['postCode'] = this.postCode;
    data['country'] = this.country;
    return data;
  }
}

class RecentTransactions {
  String? sTypename;
  String? date;
  String? description;
  int? amount;
  String? fromAccount;
  String? toAccount;

  RecentTransactions(
      {this.sTypename,
        this.date,
        this.description,
        this.amount,
        this.fromAccount,
        this.toAccount});

  RecentTransactions.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    date = json['date'];
    description = json['description'];
    amount = json['amount'];
    fromAccount = json['fromAccount'];
    toAccount = json['toAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['date'] = this.date;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['fromAccount'] = this.fromAccount;
    data['toAccount'] = this.toAccount;
    return data;
  }
}

class UpcomingBills {
  String? sTypename;
  String? date;
  String? description;
  num? amount;
  String? fromAccount;
  String? toAccount;

  UpcomingBills(
      {this.sTypename,
        this.date,
        this.description,
        this.amount,
        this.fromAccount,
        this.toAccount});

  UpcomingBills.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    date = json['date'];
    description = json['description'];
    amount = json['amount'];
    fromAccount = json['fromAccount'];
    toAccount = json['toAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['date'] = this.date;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['fromAccount'] = this.fromAccount;
    data['toAccount'] = this.toAccount;
    return data;
  }
}