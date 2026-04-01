class JerseyModel {
  String? name;
  String? price;
  String? imageUrl;

  JerseyModel({required this.name, required this.price, this.imageUrl});
  // factory JerseyModel.fromJson(Map<String, dynamic> json) {
  //   return JerseyModel(
  //     name: json['name'],
  //     price: json['price'],
  //     imageUrl: json['image'],
  //   );
  // }
}
