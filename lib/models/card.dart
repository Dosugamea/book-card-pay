class CardModel {
  final int id;
  final String title;
  final int balance;
  final String expireDate;
  final String cardId;
  final String cardPin;

  CardModel({
    required this.id,
    required this.title,
    required this.balance,
    required this.expireDate,
    required this.cardId,
    required this.cardPin,
  });

  /// Map型に変換
  Map toJson() => {
        'id': id,
        'title': title,
        'balance': balance,
        'expireDate': expireDate,
        'cardId': cardId,
        'cardPin': cardPin,
      };

  /// JSONオブジェクトを代入
  CardModel.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        balance = json['balance'],
        expireDate = json['expireDate'],
        cardId = json['cardId'],
        cardPin = json['cardPin'];
}
