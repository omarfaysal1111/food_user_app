class CartItem {
  const CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    this.quantity = 1,
  });

  final String id;
  final String name;
  final String description;
  final int price;
  final String imageAsset;
  final int quantity;

  CartItem copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageAsset,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageAsset: imageAsset ?? this.imageAsset,
      quantity: quantity ?? this.quantity,
    );
  }
}
