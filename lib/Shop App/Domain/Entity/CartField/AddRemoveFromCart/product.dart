import 'package:equatable/equatable.dart';

class ProductAddRemoveCart extends Equatable {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String ?name;
  String ?description;

  ProductAddRemoveCart(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description});

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
      ];
}
