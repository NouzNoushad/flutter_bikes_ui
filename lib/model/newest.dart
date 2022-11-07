class Newest {
  final String image, name;
  final int price;
  final Map details;

  Newest({
    required this.image,
    required this.name,
    required this.price,
    required this.details,
  });
}

final NewestList = [
  Newest(
    image: 'ktm_duke',
    name: 'KTM 125 Duke',
    price: 2200,
    details: {
      'engine': 125.7,
      'power': 14.75,
      'mileage': 40,
      'brake': 'Disk',
    },
  ),
  Newest(
    image: 'honda_activa',
    name: 'Honda Activa',
    price: 900,
    details: {
      'engine': 109.51,
      'power': 7.68,
      'mileage': 48,
      'brake': 'Drum',
    },
  ),
];
