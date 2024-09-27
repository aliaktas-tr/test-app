class SalesModel {
  String? category, productTitle, productImage, brand;
  double? rating, price;
  int? inStock, dailySales, monthlySales, mon, tue, wed, thu, fri, sat, sun;

  SalesModel(
      {this.category,
      this.productTitle,
      this.productImage,
      this.brand,
      this.price,
      this.dailySales,
      this.monthlySales,
      this.rating,
      this.inStock,
      this.mon,
      this.tue,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun});
}

DateTime dateTime = new DateTime.now();
String convertedTime =
    " ${dateTime.hour.toString().padLeft(2, '0')}-${dateTime.minute.toString().padLeft(2, '0')}";
String convertedDate =
    "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

List<SalesModel> model1 = [
  SalesModel(
      category: 'Flower',
      productTitle: 'The Glove 3.5g',
      productImage: 'assets/flowers/fp1.jpg',
      brand: 'Farmer And The Felon',
      price: 35,
      dailySales: 12,
      monthlySales: 405,
      rating: 4.2,
      inStock: 12,
      mon: 12,
      tue: 20,
      wed: 10,
      thu: 9,
      fri: 20,
      sat: 25,
      sun: 16

      ),
  SalesModel(
      category: 'Pre-Rolls',
      productTitle: 'Durban Poison 5Pk 2.5g',
      productImage: 'assets/preroll/jeeter_durban_poison_.png',
      brand: 'Jeeter',
      price: 20,
      dailySales: 32,
      monthlySales: 803,
      rating: 4.4,
      inStock: 50),
  SalesModel(
      category: 'Pre-Rolls',
      productTitle: 'Rainbow Sherbet Preroll 1g',
      productImage:
          'assets/preroll/west_coast_cure_reinbow_sherbet_preroll.jpg',
      brand: 'West Coast Cure',
      price: 13,
      dailySales: 43,
      monthlySales: 1196,
      rating: 4.4,
      inStock: 63),
  SalesModel(
      category: 'Flower',
      productTitle: 'Big Apple x Kush Mints 28g',
      productImage: 'assets/flowers/claybourne_co_big_apple_x_kush.jpg',
      brand: 'Claybourne Co.',
      price: 190,
      dailySales: 9,
      monthlySales: 183,
      rating: 4.1,
      inStock: 6),
  SalesModel(
      category: 'Edibles',
      productTitle: 'Cannabis Infused Watermelon Fruit Chews',
      productImage: 'assets/edibles/e1.jpg',
      brand: 'Smokies Co.',
      price: 20,
      dailySales: 24,
      monthlySales: 590,
      rating: 4.5,
      inStock: 21),
  SalesModel(
      category: 'Concentrate',
      productTitle: 'Lil Sebastian 1g',
      productImage: 'assets/concentrates/grassroots_lil_sebastian_con.jpg',
      brand: 'Grassroots',
      price: 50,
      dailySales: 9,
      monthlySales: 263,
      rating: 4.5,
      inStock: 11),
  SalesModel(
      category: 'Concentrate',
      productTitle: 'Ghost Hulk 1g',
      productImage: 'assets/concentrates/amigo_ghost_hulk.jpg',
      brand: 'Amigo',
      price: 25,
      dailySales: 9,
      monthlySales: 178,
      rating: 4.8,
      inStock: 13),
  SalesModel(
      category: 'Edibles',
      productTitle: 'Hybrid Blue Raspberry Gummies',
      productImage: 'assets/edibles/banano.jpeg',
      brand: 'Kanha',
      price: 26,
      dailySales: 15,
      monthlySales: 401,
      rating: 4.8,
      inStock: 0),
  SalesModel(
      category: 'Vaporizers',
      productTitle: 'Do-Si-Dos Original',
      productImage: 'assets/vaporizers/v1.jpg',
      brand: 'Stiiizy',
      price: 46,
      dailySales: 25,
      monthlySales: 438,
      rating: 4.1,
      inStock: 30),
  SalesModel(
      category: 'Vaporizers',
      productTitle: 'Birthday Cake',
      productImage: 'assets/vaporizers/v8.jpg',
      brand: 'Stiiizy',
      price: 41,
      dailySales: 25,
      monthlySales: 499,
      rating: 4.1,
      inStock: 30),
];

class StoreLastOrders {
  String? category, productTitle, productImage, brand, date, time, quantity;
  double? rating, price, total;

  StoreLastOrders(
      {this.category,
      this.productTitle,
      this.productImage,
      this.brand,
      this.date,
      this.time,
      this.rating,
      this.price,
      this.quantity,
      this.total});
}

List<StoreLastOrders> storeLastOrders = [
  StoreLastOrders(
      category: 'Vaporizers',
      productTitle: 'Birthday Cake',
      brand: 'Stiiizy',
      price: 45,
      total: 90,
      quantity: 'x1',
      time: 'Now',
      rating: 4.1),
  StoreLastOrders(
      category: 'Concentrate',
      productTitle: 'Ghost Hulk 1g',
      brand: 'Amigo',
      price: 25,
      quantity: 'x1',
      time: '20 min ago',
      total: 25,
      rating: 4.8),
  StoreLastOrders(
      category: 'Flower',
      productTitle: 'Big Apple x Kush Mints 28g',
      brand: 'Claybourne Co.',
      price: 190,
      quantity: 'x1',
      time: '35 min ago',
      total: 190,
      rating: 4.1),
  StoreLastOrders(
      category: 'Flower',
      productTitle: 'The Glove 3.5g',
      brand: 'Farmer And The Felon',
      price: 35,
      rating: 4.2,
      quantity: 'x1',
      time: '1 h ago',
      total: 70),
  StoreLastOrders(
      category: 'Edibles',
      productTitle: 'Hybrid Blue Raspberry Gummies',
      brand: 'Kanha',
      price: 26,
      rating: 4.8,
      quantity: 'x1',
      time: '17:50',
      total: 26)
];
