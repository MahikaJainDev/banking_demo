class AccountsModel {
  String? sTypename;
  List<AccountsData>? accounts;

  AccountsModel({this.sTypename, this.accounts});

  AccountsModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if (json['accounts'] != null) {
      accounts = <AccountsData>[];
      json['accounts'].forEach((v) {
        accounts!.add(new AccountsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AccountsData {
  String? sTypename;
  String? id;
  String? accountNumber;
  String? accountType;
  double? balance;
  String? accountHolder;

  AccountsData(
      {this.sTypename,
        this.id,
        this.accountNumber,
        this.accountType,
        this.balance,
        this.accountHolder});

  AccountsData.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    id = json['id'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    balance = json['balance'];
    accountHolder = json['accountHolder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['id'] = this.id;
    data['accountNumber'] = this.accountNumber;
    data['accountType'] = this.accountType;
    data['balance'] = this.balance;
    data['accountHolder'] = this.accountHolder;
    return data;
  }
}