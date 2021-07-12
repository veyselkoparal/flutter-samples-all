class Product {
  late int userId;
  late int id;
  late String title;

  Product(this.userId, this.id, this.title);

  Product.fromJson(Map json) {
    userId = json["userId"];
    id = int.parse(json["id"]);
    title = json["title"];
  }

  Map toJson() {
    return {"userId": userId, "id": id, "title": title};
  }
}
