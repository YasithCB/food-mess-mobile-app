class MaterialItem {
  final String name;
  final double? ratePerSqFt;
  final double? ratePerUnit;
  final double? rate;

  MaterialItem({
    required this.name,
    this.ratePerSqFt,
    this.ratePerUnit,
    this.rate,
  });

  factory MaterialItem.fromJson(Map<String, dynamic> json) {
    return MaterialItem(
      name: json['name'],
      ratePerSqFt: (json['ratePerSqFt'] as num?)?.toDouble(),
      ratePerUnit: (json['ratePerUnit'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
    );
  }
}

class SubServiceModel {
  final String name;
  final String image;
  final String desc;
  final List<MaterialItem>? materials;

  SubServiceModel({
    required this.name,
    required this.image,
    required this.desc,
    this.materials,
  });

  factory SubServiceModel.fromJson(Map<String, dynamic> json) {
    return SubServiceModel(
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      materials: (json['materials'] as List?)
          ?.map((m) => MaterialItem.fromJson(m))
          .toList(),
    );
  }
}

class ServiceModel {
  final String name;
  final String image;
  final String description;
  final List<SubServiceModel> subcategories;

  ServiceModel({
    required this.name,
    required this.image,
    required this.description,
    required this.subcategories,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      subcategories: (json['subcategories'] as List)
          .map((s) => SubServiceModel.fromJson(s))
          .toList(),
    );
  }
}
