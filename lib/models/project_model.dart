class ProjectModel {
  final String image;
  final String title;
  final String subtitle;
  final String? githubLink;

  ProjectModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.githubLink,
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
  ),
  ProjectModel(
    image: 'assets/projects/chatLite1.jpg',
    title: 'ChatLite',
    subtitle:
        'ChatLite is a messaging application powered by Flutter + Firebase. It provides users with the ability to exchange text messages and supports mobile (android and ios) platforms.',
    githubLink: 'https://github.com/DenisGrudin1n/ChatApp',
  ),
];
