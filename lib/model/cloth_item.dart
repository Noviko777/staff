class ClothItem {
  String id;
  String name;
  String sizes;
  int cost;
  String description;
  String type;

  ClothItem(
      {this.id, this.name, this.cost, this.sizes, this.description, this.type});

  factory ClothItem.fromJson(Map<String, dynamic> json) {
    return ClothItem(
        id: json['id'],
        name: json['name'],
        sizes: json['sizes'],
        cost: json['cost'],
        description: json['description'],
        type: json['type']);
  }
}
