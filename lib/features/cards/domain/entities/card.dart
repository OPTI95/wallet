class Card {
  final int? id;
  final String name;
  final String? numberCard;
  final String? cvcCode;
  final String scanCode;
  final String backImage;
  final String frontImage;

  Card(
      { this.id,
      required this.name,
      this.numberCard,
      this.cvcCode,
      required this.scanCode,
      required this.backImage,
      required this.frontImage});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': this.numberCard,
      'cvc': this.cvcCode,
      'scan': this.scanCode,
      "backImage": this.backImage,
      "frontImage": this.frontImage
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      id: map['_id'],
      name: map['name'],
      cvcCode: map['cvc'],
      numberCard: map['number'],
      backImage: map['backImage'],
      frontImage: map ['frontImage'],
      scanCode: map['scan'],
    );
  }
}
