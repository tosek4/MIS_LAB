class ClothingItem {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  ClothingItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

final List<ClothingItem> clothingItems = [
  ClothingItem(
    name: "T-Shirt",
    imageUrl: "assets/images/t-shirt.png",
    description: "A comfortable cotton T-shirt.",
    price: 15.99,
  ),
  ClothingItem(
    name: "Jeans",
    imageUrl: "assets/images/jeans.png",
    description: "Stylish blue jeans.",
    price: 49.99,
  ),
   ClothingItem(
    name: "Blouse",
    imageUrl: "assets/images/blouse.png",
    description: "A comfortable cotton blouse.",
    price: 22.20,
  ),
  ClothingItem(
    name: "Dress",
    imageUrl: "assets/images/dress.png",
    description: "Formal dress for performance",
    price: 80.49,
  ),
    ClothingItem(
    name: "Tracksuits",
    imageUrl: "assets/images/tracksuits.png",
    description: "Comfortable gym sweatpants",
    price: 120.00,
  ),
];
