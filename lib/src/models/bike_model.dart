class Bike{
  int id;
  String frameSize;
  String category;
  String location;
  String name;
  String photoUrl;
  String priceRange;
  String description;

  Bike({
    this.id,
    this.frameSize,
    this.category,
    this.location,
    this.name,
    this.photoUrl,
    this.priceRange,
    this.description,
  });

  Bike.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      frameSize = json['frameSize'],
      category = json['category'],
      location = json['location'],
      name = json['name'],
      photoUrl = json['photoUrl'],
      priceRange = json['priceRange'],
      description = json['description'];
}