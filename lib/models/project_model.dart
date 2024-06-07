class ProjectModel {
  final String image;
  final String title;
  final String subtitle;
  final String? githubLink;
  final List<String> icons;

  ProjectModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.githubLink,
    required this.icons,
  });
}

// Projects
List<ProjectModel> projects = [
  ProjectModel(
    image: 'assets/projects/recipeApp1.jpg',
    title: 'Recipe App',
    subtitle:
        'RecipeApp is a mobile app developed using Flutter where users can explore collection of recipes, add custom ones and search for nearest shops and restaurants through integrated Google Maps.',
    githubLink: 'https://github.com/DenisGrudin1n/RecipeMobileApp',
    icons: [
      "assets/skillsIcons/android-original.svg",
      "assets/skillsIcons/ios-original.svg"
    ],
  ),
  ProjectModel(
    image: 'assets/projects/chatLite1.jpg',
    title: 'ChatLite',
    subtitle:
        'ChatLite is a messaging application powered by Flutter + Firebase. It provides users with the ability to exchange text messages and supports mobile (android and ios) platforms.',
    githubLink: 'https://github.com/DenisGrudin1n/ChatApp',
    icons: [
      "assets/skillsIcons/android-original.svg",
      "assets/skillsIcons/ios-original.svg"
    ],
  ),
  ProjectModel(
    image: 'assets/projects/portfolio4.jpg',
    title: 'DG.DEV',
    subtitle:
        'DG.DEV is a personal animated and fully responsive Portfolio Website created with Flutter Web.',
    githubLink: 'https://github.com/DenisGrudin1n/Portfolio-Website',
    icons: ["assets/skillsIcons/web_icon.png"],
  ),
];
