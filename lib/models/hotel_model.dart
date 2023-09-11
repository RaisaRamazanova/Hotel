class HotelModel {
  int? id;
  String? name;
  String? adress;
  int? minimalPrice;
  String? priceForIt;
  int? rating;
  String? ratingName;
  List<String>? imageUrls;
  AboutTheHotel? aboutTheHotel;

  HotelModel(
      {this.id,
        this.name,
        this.adress,
        this.minimalPrice,
        this.priceForIt,
        this.rating,
        this.ratingName,
        this.imageUrls,
        this.aboutTheHotel});

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    minimalPrice = json['minimal_price'];
    priceForIt = json['price_for_it'];
    rating = json['rating'];
    ratingName = json['rating_name'];
    imageUrls = json['image_urls'].cast<String>();
    aboutTheHotel = json['about_the_hotel'] != null
        ? new AboutTheHotel.fromJson(json['about_the_hotel'])
        : null;
  }
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({this.description, this.peculiarities});

  AboutTheHotel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    peculiarities = json['peculiarities'].cast<String>();
  }
}
