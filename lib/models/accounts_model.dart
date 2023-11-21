class AccountsData {
  String? _id;
  String? _accountNumber;
  String? _accountType;
  double? _balance;
  String? _accountHolder;

  AccountsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _accountNumber = json['accountNumber'];
    _accountType = json['accountType'];
    _balance = json['balance'];
    _accountHolder = json['accountHolder'];
  }

  String get getAccountNumber => _accountNumber ?? '';
  String get getAccountType => _accountType ?? '';
  double get getAccountBalance => _balance ?? 0.0;
  String get getAccountHolder => _accountHolder ?? '';
}