import 'package:equatable/equatable.dart';

class ProductGetCart extends Equatable {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  bool inCart;

  ProductGetCart({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inCart,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
        inCart,
      ];
}
