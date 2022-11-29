class OnboardingContent {
  String image;
  String title;
  String description;
  
  OnboardingContent({required this.image,required this.description, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(image: 'assets/images/bro.png', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum ligula id ligula.', title: 'Find Blood Donors'),
  OnboardingContent(image: 'assets/images/rafiki.png', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum ligula id ligula.', title: 'Post A Blood Request'),
];

class HomeContent {
  String image;
  String name;

  HomeContent({required this.name, required this.image});
}

List<HomeContent> details = [
  HomeContent(name: 'Donors List', image: 'assets/images/ion_search-outline.png'),
  HomeContent(name: 'Request Blood', image: 'assets/images/si-glyph_blood-bag.png'),
  HomeContent(name: 'My Request', image: 'assets/images/openmoji_blood-transfusion.png')
];