class BestChoiceModel {
  final int id;
  final String title;
  final String? image;

  BestChoiceModel({required this.id, required this.title, required this.image});
}

List<BestChoiceModel> bestChoice =[
  BestChoiceModel(id: 11, title: "'Best-Cannabis\nSativa Strains'", image: 'assets/images/best_selling1.png'),
  BestChoiceModel(id: 22, title: 'Best-Cannabis\nIndica Strains', image: 'assets/images/best_selling3.png'),
  BestChoiceModel(id: 33, title: "Top-Selling\nCannabis Strains", image: 'assets/images/awarded_strains.png'),
  BestChoiceModel(id: 44, title: "Award-Winning\nCannabis Strains", image: 'assets/images/best_selling6.png'),
  BestChoiceModel(id: 55, title: "High-THC\nCannabis Strains", image: 'assets/images/best_selling2.jpg'),
];