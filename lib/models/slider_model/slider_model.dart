class SliderModel {
  String? imagePath,
      imagePath2,
      title,
      subTitle,
      button1Title,
      button2Title,
      button1Route,
      button2Route;
  bool? isMultiButton;

  SliderModel(
      {this.imagePath,
      this.imagePath2,
      this.title,
      this.subTitle,
      this.button1Title,
      this.button2Title,
      this.button1Route,
      this.button2Route,
      this.isMultiButton = false});
}

List<SliderModel> bannerModel = [
  SliderModel(
      imagePath: 'assets/carousel/b5.jpg',
      title: 'Enjoy these\ngreat cultivators.',
      subTitle: 'Get 20% off Circle,\nFlow Kana, and Cannabiotix.',
      button1Title: 'Shop Now'),
  SliderModel(
      imagePath: 'assets/carousel/bg4-3.jpg',
      title: 'Weedus Rewards',
      subTitle: 'Say "high" to our\nnew loyalty program.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/carousel/1-1.jpg',
      title: 'Looking for deals?',
      subTitle: 'Check out evergreen savings\nto brighten your day.',
      button1Title: 'View Deals'),
  SliderModel(
      imagePath: 'assets/carousel/b2-4.jpg',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
          'Don\'t forget to opt in for our emails\nso you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/carousel/empty.jpg',
      imagePath2: 'assets/carousel/thump_up.png',
      title: 'Refer a friend.',
      subTitle: 'Enjoy big savings\nwhen you bring a bud.',
      button1Title: 'Learn More'),
];
List<SliderModel> subBannerModel = [
  SliderModel(
      imagePath: 'assets/carousel/sale2.jpg',
      title: 'Deals on popular products.',
      subTitle:
          'Discover our best prices on fan favorites, while supplies last.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/carousel/stiiizy_gummy.png',
      title: 'Add a little STIIZY.',
      subTitle:
          'Introducing our new line of STIIIZY edibles. Your favorite live resin infused gummies are formulated with fast-acting nanotechnology in 10 mg pieces.',
      button1Title: 'Shop Now'),
  SliderModel(
      imagePath: 'assets/carousel/sub-b1.jpg',
      title: 'Say "high" to our new loyalty program.',
      subTitle:
          'Join now to start earning points that you can use towards future purchases.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/carousel/sale2.jpg',
      title: 'Rise, refresh, and rest with best flower.',
      subTitle: 'Sativa, hybrid, and Indica strains are made for the moment.',
      button1Title: 'Learn More'),
];

List<SliderModel> blackBannerModel = [
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Weedus Rewards',
      subTitle: 'Say "high" to our\nnew loyalty program.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Weedus Rewards',
      subTitle: 'Say "high" to our\nnew loyalty program.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Looking for deals?',
      subTitle: 'Check out evergreen savings\nto brighten your day.',
      button1Title: 'View Deals'),
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
          'Don\'t forget to opt in for our emails\nso you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
          'Don\'t forget to opt in for our emails\nso you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/banner/smoke_background.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
          'Don\'t forget to opt in for our emails\nso you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
];


List<SliderModel> topEdiblesSliderModel = [
  SliderModel(
      imagePath: 'assets/edibles/e1.png',
      title: 'Weedus Rewards',
      subTitle: 'Say "high" to our new loyalty program.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/edibles/e2.png',
      title: 'Weedus Rewards',
      subTitle: 'Say "high" to our new loyalty program.',
      isMultiButton: true,
      button1Title: 'Join Now',
      button2Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/edibles/e3.png',
      title: 'Looking for deals?',
      subTitle: 'Check out evergreen savings to brighten your day.',
      button1Title: 'View Deals'),
  SliderModel(
      imagePath: 'assets/edibles/e4.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
      'Don\'t forget to opt in for our emails so you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/edibles/e6.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
      'Don\'t forget to opt in for our emails so you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
  SliderModel(
      imagePath: 'assets/edibles/e9.png',
      title: 'Sign up for easy\nonline ordering.',
      subTitle:
      'Don\'t forget to opt in for our emails so you won\'t miss out on low prices.',
      button1Title: 'Learn More'),
];