import 'dart:convert';

class Product {
  int id;
  String name;
  double price;
  double? discountPrice;
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.discountPrice,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    double? discountPrice,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': name,
      'price': price,
      'discount_price': discountPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['product'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      discountPrice: map['discount_price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, discountPrice: $discountPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.discountPrice == discountPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        discountPrice.hashCode;
  }
}
