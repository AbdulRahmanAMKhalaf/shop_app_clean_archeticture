import '../../../Domain/Entity/CartField/GetCart/products_get_cart.dart';

class ProductsGetCartModel extends ProductGetCart {
  ProductsGetCartModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.description,
      required super.inCart,});
  factory ProductsGetCartModel.fromJason(Map<String, dynamic> json) {
    return ProductsGetCartModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        inCart: json['in_cart'],);
  }
}
