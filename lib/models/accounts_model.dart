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
}