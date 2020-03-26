import 'package:equatable/equatable.dart';

class Bike extends Equatable{
  
  final int id;
  final String frameSize;
  final String category;
  final String location;
  final String name;
  final String photoUrl;
  final String priceRange;
  final String description;

  const Bike({
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

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'id': id,
      'frameSize': frameSize,
      'category': category,
      'location': location,
      'name': name,
      'photoUrl': photoUrl,
      'priceRange': priceRange,
      'description': description,
    };
  }
  
  @override
  List<dynamic> get props => <dynamic>[
    id,
    frameSize,
    category,
    location,
    name,
    photoUrl,
    priceRange,
    description,
  ];
}