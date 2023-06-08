class ActionFigureModel {
  final String image, caracter, title, sold;
  final double price, rate;
  final int reviews;
  final Spesification spesification;
  final List<String> category;

  ActionFigureModel(
      {required this.image,
      required this.caracter,
      required this.title,
      required this.price,
      required this.sold,
      required this.rate,
      required this.reviews,
      required this.category,
      required this.spesification});
}

List<ActionFigureModel> actionModel = [
  ActionFigureModel(
    image: 'imageedit_41_8583442855.png',
    caracter: 'Yukino',
    title: 'Oregairu',
    price: 20.06,
    rate: 5.0,
    reviews: 345,
    sold: '1.2k',
    category: ['Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '15 x 5 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_37_5503588264.png',
    caracter: 'Nezuko',
    title: 'Demon Slayer',
    price: 16.56,
    rate: 4.3,
    reviews: 321,
    sold: '114',
    category: ['Action', 'Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '23 x 8 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_19_6023112161.png',
    caracter: 'Mikasa',
    title: 'Attack On Titan',
    price: 15.56,
    rate: 5.0,
    reviews: 378,
    sold: '10.2k',
    category: ['Action', 'Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '20 x 7 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_27_5042846923.png',
    caracter: 'Eren',
    title: 'Attack On Titan',
    price: 15.56,
    rate: 5.0,
    reviews: 654,
    sold: '14k',
    category: ['Action'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '20 x 7 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_33_7012743070.png',
    caracter: 'Levi',
    title: 'Attack On Titan',
    price: 15.56,
    rate: 5.0,
    sold: '411',
    reviews: 122,
    category: ['Action'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '20 x 7 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_39_6051412966.png',
    caracter: 'Zoro',
    title: 'One Piece',
    price: 30.56,
    rate: 5.0,
    sold: '412',
    reviews: 232,
    category: ['Action'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '23 x 8 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_3_9913196565.png',
    caracter: 'Tanjiro',
    title: 'Demon Slayer',
    price: 16.56,
    rate: 4.3,
    sold: '412',
    reviews: 232,
    category: ['Action', 'Chibi'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '23 x 8 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_18_6019283717.png',
    caracter: 'Boa Hancock',
    title: 'One Piece',
    price: 22.56,
    rate: 5.0,
    sold: '412',
    reviews: 232,
    category: ['Action', 'Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '30 x 10 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_21_2672093552.png',
    caracter: 'Nico Robin',
    title: 'One Piece',
    price: 20.86,
    rate: 4.8,
    sold: '412',
    reviews: 232,
    category: ['Action', 'Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '30 x 10 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_23_6779667173.png',
    caracter: 'Boa Hancock',
    title: 'One Piece',
    price: 26.6,
    rate: 4.0,
    sold: '462',
    reviews: 232,
    category: ['Action', 'Best 3D Girl'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '30 x 10 cm'),
  ),
  ActionFigureModel(
    image: 'imageedit_2_2978617423.png',
    caracter: 'Itadori Yoji',
    title: 'Jujutsu Kaisen',
    price: 15.56,
    rate: 4.2,
    sold: '12k',
    reviews: 432,
    category: ['Action', 'Chibi'],
    spesification: Spesification(
        material: 'PVC',
        type: 'Model',
        condition: 'New 100%',
        size: '10 x 5 cm'),
  ),
];

class Spesification {
  final String material, type, condition, size;

  Spesification(
      {required this.material,
      required this.type,
      required this.condition,
      required this.size});
}
