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

  Bike.fromJson(dynamic json)
    : id = json['id'] as int,
      frameSize = json['frameSize'] as String,
      category = json['category'] as String,
      location = json['location'] as String,
      name = json['name'] as String,
      photoUrl = json['photoUrl'] as String,
      priceRange = json['priceRange'] as String,
      description = json['description'] as String;
}