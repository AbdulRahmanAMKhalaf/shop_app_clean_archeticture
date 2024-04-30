import 'package:equatable/equatable.dart';

class Products extends Equatable {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;

  Products(
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
        this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.description,
        this.name,
        this.image
      ];
}
