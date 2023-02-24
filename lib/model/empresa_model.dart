class EmpresasModel {
  String? id;
  String? name;
  String? logoImage;
  String? description;
  int? discount;
  String? waitingTime;
  List<Products>? products;

  EmpresasModel(
      {this.id,
        this.name,
        this.logoImage,
        this.description,
        this.discount,
        this.waitingTime,
        this.products});

  EmpresasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoImage = json['logoImage'];
    description = json['description'];
    discount = json['discount'];
    waitingTime = json['waitingTime'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logoImage'] = logoImage;
    data['description'] = description;
    data['discount'] = discount;
    data['waitingTime'] = waitingTime;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? description;
  double? price;
  int? cashback;

  Products({this.name, this.description, this.price, this.cashback});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    cashback = json['cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['cashback'] = cashback;
    return data;
  }
}
