class HotelRoomModel {
  List<Rooms>? rooms;

  HotelRoomModel({this.rooms});

  HotelRoomModel.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }
}

class Rooms {
  int? id;
  String? name;
  int? price;
  String? pricePer;
  List<String>? peculiarities;
  List<String>? imageUrls;

  Rooms(
      {this.id,
        this.name,
        this.price,
        this.pricePer,
        this.peculiarities,
        this.imageUrls});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePer = json['price_per'];
    peculiarities = json['peculiarities'].cast<String>();
    imageUrls = json['image_urls'].cast<String>();
  }
}
