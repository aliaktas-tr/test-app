class BrandDetailModel {
  String? product, productTitle, productID, brand;
  double? sales, percentageOfSale, changePercentage, changeValue;
  int? unit, stock, salesFor30, salesFor14, salesForWeek, salesForDay;
  bool? changeIsNegative;

  BrandDetailModel(
      {this.product,
      this.productTitle,
      this.productID,
      this.sales,
      this.percentageOfSale,
      this.changePercentage,
      this.changeValue,
      this.unit,
      this.stock,
      this.salesFor30,
      this.salesFor14,
      this.salesForWeek,
      this.salesForDay,
      this.brand,
      this.changeIsNegative = false});
}

List<BrandDetailModel> allDetail = [
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Premium 3.5G Mylar Bags',
      productID: 'B0089FJD1U',
      sales: 18650,
      changePercentage: 17.5,
      changeValue: 3280,
      stock: 19,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Grape Guava 3.5G',
      productID: 'B0089FJD1X',
      sales: 17350,
      changePercentage: 17.3,
      changeValue: 2800,
      stock: 9,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
  BrandDetailModel(
      brand: 'Circles',
      product: 'Flower',
      productTitle: 'Mint Sherbert 3.5G',
      productID: 'B0088FJX2X',
      sales: 17000,
      changePercentage: 0.0,
      changeValue: 0,
      stock: 15,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
  BrandDetailModel(
      brand: 'Flow Kana',
      product: 'Flower',
      productTitle: '99 Problems 3.5G',
      productID: 'B00G5JX2X',
      sales: 16500,
      changeIsNegative: true,
      changePercentage: 8.9,
      changeValue: 1468.5,
      stock: 21,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
  BrandDetailModel(
      brand: 'Flow Kana',
      product: 'Flower',
      productTitle: 'Afternoon Delight 3.5G',
      productID: 'B00G5JX2X',
      sales: 15000,
      changePercentage: 7.5,
      changeValue: 1125,
      stock: 5,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
];

List<BrandDetailModel> stiiizyDetail = [
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Premium 3.5G Mylar Bags',
      productID: 'B0089FJD1U',
      sales: 18650,
      changePercentage: 17.5,
      changeValue: 3280,
      stock: 45,
      salesForDay: 18,
      salesForWeek: 110,
      salesFor14: 190,
      salesFor30: 373),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Bubblegum Gelato 3.5G',
      productID: 'B0089KDD3M',
      sales: 16500,
      changePercentage: 9.8,
      changeValue: 1617,
      stock: 15,
      salesForDay: 12,
      salesForWeek: 69,
      salesFor14: 208,
      salesFor30: 330),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Orange Sunrise 3.5G',
      productID: 'B0089MNN8W',
      sales: 16100,
      changePercentage: 5,
      changeValue: 805,
      stock: 13,
      salesForDay: 10,
      salesForWeek: 54,
      salesFor14: 169,
      salesFor30: 322),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Banana Cream Cake 3.5G',
      productID: 'B0089OLJ5A',
      sales: 16100,
      changePercentage: 10.5,
      changeValue: 1690.5,
      stock: 15,
      salesForDay: 10,
      salesForWeek: 54,
      salesFor14: 169,
      salesFor30: 322),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Flower',
      productTitle: 'Ghost Face Mintz 3.5G',
      productID: 'B0089KLL3J',
      sales: 11300,
      changePercentage: 1.3,
      changeValue: 146.9,
      stock: 5,
      salesForDay: 8,
      salesForWeek: 62,
      salesFor14: 123,
      salesFor30: 226),
  BrandDetailModel(
      brand: 'Stiiizy',
      product: 'Concentrates',
      productTitle: 'Triple Platinum 1G',
      productID: 'B0080UUD5W',
      sales: 11300,
      changePercentage: 1.3,
      changeValue: 146.9,
      stock: 11,
      salesForDay: 8,
      salesForWeek: 62,
      salesFor14: 123,
      salesFor30: 226),
];

class BrandModel {
  String? brandName,
      brandDescription,
      licence,
      address,
      phone,
      webSite,
      brandImage,
      product,
      productTitle,
      productID,
      facebook,
      instagram,
      twitter,
      tiktok,
      mail;
  int? totalProduct,
      unit,
      stock,
      salesFor30,
      salesFor14,
      salesForWeek,
      salesForDay;
  double? sales, percentageOfSale, changePercentage, changeValue, rating;
  bool? changeIsNegative, isOpen;

  BrandModel(
      {this.brandName,
      this.brandDescription,
      this.licence,
      this.address,
      this.phone,
      this.webSite,
      this.totalProduct,
      this.product,
      this.productTitle,
      this.productID,
      this.sales,
      this.percentageOfSale,
      this.changePercentage,
      this.changeValue,
      this.unit,
      this.stock,
      this.salesFor30,
      this.salesFor14,
      this.salesForWeek,
      this.salesForDay,
      this.changeIsNegative,
      this.brandImage,
      this.isOpen,
      this.rating,
      this.facebook,
      this.instagram,
      this.twitter,
      this.mail,
      this.tiktok});
}

List<BrandModel> brandChartList = [
  BrandModel(
      brandName: 'All Brands',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Stiiizy',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/the_artist_tree.jpg'),
  BrandModel(
      brandName: 'Circles',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Flow Kana',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Jetty Extracts',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Leune',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Raw Garden',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
  BrandModel(
      brandName: 'Cannabiotix',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: ''),
];

List<BrandModel> brandList = [
  BrandModel(brandName: 'Stiiizy'),
  BrandModel(brandName: 'Cannabiotix'),
  BrandModel(brandName: 'Circles'),
  BrandModel(brandName: 'Flow Kana'),
  BrandModel(brandName: 'Jetty Extracts'),
  BrandModel(brandName: 'Leune'),
  BrandModel(brandName: 'Lowell Farms'),
  BrandModel(brandName: 'Ozone'),
  BrandModel(brandName: 'Raw Garden'),
  BrandModel(brandName: 'Slims'),
];

List<BrandModel> brandDisplayList = [
  BrandModel(
      brandName: 'Stiiizy',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/stiiizy.svg',
      rating: 4.3,
      brandDescription:
          'STIIIZY offers a line of premium cannabis products that has set a new industry standard for portability and convenience. STIIIZY\'s proprietary pod system has garnered a cult-like following since its launch and has emerged as a leading lifestyle brand in cannabis.',
      instagram: 'https://www.instagram.com/stiiizy/',
      facebook: 'https://www.facebook.com/stiiizy/',
      twitter: 'https://twitter.com/stiiizy'),
  BrandModel(
    brandName: 'Circles',
    licence: '',
    address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
    phone: '(310) 461–4134',
    webSite: '',
    isOpen: true,
    brandImage: 'assets/dispensary/circle.svg',
    rating: 4.1,
    instagram: 'https://www.instagram.com/expandyourcircles/',
    mail: 'circlescannabis@gmail.com',
    brandDescription:
        'Circles is an Eaze brand aiming to provide approachable and affordable vape cartridges for the daily smoker. All of their carts are available in half or full-gram cartridges, and they usually have three different strains spanning the hybrid, indica and sativa spectrum. Their carts are meant to be shared to expand your circle, and further the cannabis conversation in everyday life.',
  ),
  BrandModel(
      brandName: 'Green Earth Collective',
      licence: '',
      address: '4801 York Blvd Los Angeles, CA 90042',
      phone: '(323) 349-0949',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/gec.svg',
      rating: 4.0,
      brandDescription:
          'To educate our customers on the natural and holistic benefits of cannabis. We aim to ensure that we provide both medical and recreational users the necessary information to choose the best product for their specific needs.Our goal is to become the premier local dispensary serving the greater Los Angeles Area. With this platform, we aim to continue offering a variety of high quality cannabis products to our customers in a safe, and clean environment.',
      instagram: 'https://www.instagram.com/greenearthco/',
      facebook: 'https://www.facebook.com/greenearthcola',
      twitter: 'https://twitter.com/greenearthcola'),
  BrandModel(
      brandName: 'Flow Kana',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/flow_kana.svg',
      rating: 4.4,
      brandDescription:
          'Flow Kana\'s collective of over 100 farms has the firepower to bring you bud for any occasion. By partnering with independent, multi-generational cultivators across the state, their catalog makes everything California cannabis has to offer more accessible than ever. Their sunkissed flower is influenced by the terroir of each surrounding region, giving you a taste of everywhere from Mendocino to Escondido—and best of all, a portion of every purchase has been committed to their mission of making the cannabis industry more sustainable and inclusive.'),
  BrandModel(
      brandName: 'Jetty Extracts',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/jetty.svg',
      rating: 4.1,
      facebook: 'https://www.facebook.com/jettyextracts',
      instagram: 'https://www.instagram.com/jettyextracts/',
      twitter: 'https://twitter.com/jettyextracts',
      brandDescription:
          'Jetty Extracts is raising the quality bar by experimenting with extraction methods and clean product design. The brand aims to enrich your life by enhancing it with the right cannabis for the right moment. Since 2014, they\'ve been providing free medicinal cannabis to cancer patients and tackling unfair cannabis legislation.'),
  BrandModel(
      brandName: 'Leune',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/leune.svg',
      rating: 4.7,
      instagram: 'https://www.instagram.com/leunebrand/',
      facebook: 'https://www.facebook.com/leunebrand',
      brandDescription:
          'LEUNE is a women-owned, Los Angeles-based brand with a dedication to clean weed and terpene infusion. They serve the smart, modern cannabis consumer so you can expect honest and affordable products with convenient design.'),
  BrandModel(
      brandName: 'Raw Garden',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/raw_garden.svg',
      rating: 4.0,
      instagram: 'https://www.instagram.com/rawgarden.farm/',
      facebook: 'https://www.facebook.com/rawgarden.farm',
      twitter: 'https://twitter.com/_rawgarden',
      brandDescription:
          'Raw Garden\'s products are centered around concentrates, from resins to vapes. Founded by farmers on the central coast of California, they steer clear of additives and fillers. They have a Cryogenic harvesting process that freezes the cannabis to capture the whole essence of the plant and its cannabinoids.'),
  BrandModel(
      brandName: 'Cannabiotix',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      isOpen: true,
      brandImage: 'assets/dispensary/cannabiotix.svg',
      rating: 4.4,
      instagram: 'https://www.instagram.com/cannabiotix/',
      twitter: 'https://twitter.com/cannabiotix',
      tiktok: 'https://www.tiktok.com/@cannabiotix',
      brandDescription:
          'Cannabiotix is a boutique cannabis company based in both California and Nevada founded by two expert cultivators who set out to develop and cultivate the most elite genetics in the cannabis industry today.'),
];

class DispensaryModel {
  String? name,
      licence,
      address,
      phone,
      webSite,
      brandInfo,
      brandImage,
      brandTag;
  List<String>? stores;
  double? rating;
  bool? haveStock;
  bool? isOpen;

  DispensaryModel(
      {this.name,
      this.licence,
      this.address,
      this.phone,
      this.webSite,
      this.brandInfo,
      this.brandImage,
      this.stores,
      this.brandTag,
      this.rating,
      this.haveStock,
      this.isOpen});
}

/*List<DispensaryModel> dispensaryList = [
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand5',
      name: 'The Artist Tree',
      licence: '',
      address: '8625 Santa Monica Blvd. West Hollywood, CA 90069',
      phone: '(310) 461–4134',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/the_artist_tree.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand3',
      name: 'Herbarium',
      licence: '',
      address: '979 N La Brea Ave Los Angeles, CA 90038',
      phone: '(323) 447-2037',
      webSite: '',
      brandInfo: '',
      haveStock: false,
      isOpen: true,
      brandImage: 'assets/dispensary/herbarium.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand1',
      name: 'House of Flowers',
      licence: '',
      address: '180 S Alvarado St, Los Angeles, CA 90057',
      phone: '(213) 352-4108',
      webSite: '',
      brandInfo: '',
      haveStock: false,
      isOpen: true,
      brandImage: 'assets/dispensary/house_of_flowers.png'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand2',
      name: 'Velvet',
      licence: '',
      address: '1118 Colorado Blvd. Los Angeles, CA 90041',
      phone: '(925) 222-5044',
      webSite: '',
      brandInfo: '',
      haveStock: false,
      isOpen: true,
      brandImage: 'assets/dispensary/velvet.jpeg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand4',
      name: 'Green Earth Collective',
      licence: '',
      address: '4801 York Blvd. Los Angeles, CA 90042',
      phone: '(323) 349-0949',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/green-earth-collective.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand6',
      name: 'Mary Jane\'s Collective',
      licence: '',
      address: '4901 Melrose Ave, Los Angeles, CA 90029',
      phone: '(323) 466-6636',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/mary_janes.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand6',
      name: 'Jokes Up Ice Kream',
      licence: '',
      address: '11376 Ventura Blvd. Studio City, CA 91604',
      phone: '(844) 688-7339',
      webSite: '',
      brandInfo: 'Closed. Opens as 10:00AM today *20 Miles away',
      haveStock: false,
      isOpen: false,
      brandImage: 'assets/dispensary/ice_kream.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand6',
      name: 'Project Cannabis',
      licence: '',
      address: '11557 Ventura Blvd. Studio City, CA 91604',
      phone: '(818) 980-2265',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/project_cannabis_offices_.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand6',
      name: 'WHTC Weed Dispensary',
      licence: '',
      address: '3760 Cahuenga Blvd. Studio City, CA 91604',
      phone: '(818) 980-8338',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/whtc_la.jpg'),
  DispensaryModel(
      rating: 4.1,
      brandTag: 'brand6',
      name: 'Rose Collective Cannabis',
      licence: '',
      address: '411 Rose Ave. Venice, CA 90291',
      phone: '(424) 252-9365',
      webSite: '',
      brandInfo: '',
      haveStock: true,
      isOpen: true,
      brandImage: 'assets/dispensary/rose_collective.jpg'),
];*/