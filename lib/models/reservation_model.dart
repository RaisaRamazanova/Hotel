class ReservationModel {
  int? id;
  String? hotelName;
  String? hotelAdress;
  int? horating;
  String? ratingName;
  String? departure;
  String? arrivalCountry;
  String? tourDateStart;
  String? tourDateStop;
  int? numberOfNights;
  String? room;
  String? nutrition;
  int? tourPrice;
  int? fuelCharge;
  int? serviceCharge;

  ReservationModel(
      {this.id,
        this.hotelName,
        this.hotelAdress,
        this.horating,
        this.ratingName,
        this.departure,
        this.arrivalCountry,
        this.tourDateStart,
        this.tourDateStop,
        this.numberOfNights,
        this.room,
        this.nutrition,
        this.tourPrice,
        this.fuelCharge,
        this.serviceCharge});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelName = json['hotel_name'];
    hotelAdress = json['hotel_adress'];
    horating = json['horating'];
    ratingName = json['rating_name'];
    departure = json['departure'];
    arrivalCountry = json['arrival_country'];
    tourDateStart = json['tour_date_start'];
    tourDateStop = json['tour_date_stop'];
    numberOfNights = json['number_of_nights'];
    room = json['room'];
    nutrition = json['nutrition'];
    tourPrice = json['tour_price'];
    fuelCharge = json['fuel_charge'];
    serviceCharge = json['service_charge'];
  }
}
