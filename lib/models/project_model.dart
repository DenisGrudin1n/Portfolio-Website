class ProjectModel {
  final String image;
  final String title;
  final String subtitle;
  final String? githubLink;
  final List<String> icons;
  final List<String>? iconsLinks;

  ProjectModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.githubLink,
    required this.icons,
    this.iconsLinks,
  });
}

// Projects
List<ProjectModel> projects = [
  ProjectModel(
      image: 'assets/projects/zenset.jpg',
      title: 'Zenset',
      subtitle:
          'Zenset is a modern alarm app that replaces harsh wake-up sounds with calming affirmations to promote peaceful, mindful mornings. Built with Flutter and Firebase, it integrates RevenueCat for subscriptions, OneSignal for push notifications, and uses Amplitude and Singular for analytics. Available on Google Play and App Store.',
      icons: [
        'assets/skillsIcons/google-play.svg',
        'assets/skillsIcons/app-store.svg'
      ],
      iconsLinks: [
        'https://play.google.com/store/apps/details?id=app.zenset.com&pcampaignid=web_share',
        'https://apps.apple.com/us/app/zenset/id6741804571?l=ru',
      ]),
  ProjectModel(
    image: 'assets/projects/portfolio1.jpg',
    title: 'DG.DEV',
    subtitle: 'DG.DEV is a personal animated and fully responsive Portfolio Website created with Flutter Web.',
    githubLink: 'https://github.com/DenisGrudin1n/Portfolio-Website',
    icons: ['assets/skillsIcons/web_icon.png'],
  ),
  ProjectModel(
    image: 'assets/projects/ecommerce-app.jpg',
    title: 'MyShop',
    subtitle:
        'MyShop is a sleek and modern e-commerce app that helps users browse and shop fashion items with ease. Built with Flutter and powered by Firebase, it features real-time product listings, intuitive navigation, and a personalized shopping experience.',
    githubLink: 'https://github.com/DenisGrudin1n/Ecommerce-App',
    icons: ['assets/skillsIcons/android-original.svg', 'assets/skillsIcons/ios-original.svg'],
  ),
  ProjectModel(
    image: 'assets/projects/whatsapp-redesign.jpg',
    title: 'WhatsApp Redesign',
    subtitle:
        'WhatsApp Redesign reimagines one of the world’s most popular messaging apps with a fresh, modern interface. The concept enhances usability, streamlines interactions, and brings a visually polished experience. Powered by Flutter and Supabase.',
    githubLink: 'https://github.com/DenisGrudin1n/WhatsApp-Redesign',
    icons: ['assets/skillsIcons/android-original.svg', 'assets/skillsIcons/ios-original.svg'],
  ),
  ProjectModel(
    image: 'assets/projects/recipeApp1.jpg',
    title: 'Recipe App',
    subtitle:
        'RecipeApp is a mobile app developed using Flutter where users can explore collection of recipes, add custom ones and search for nearest shops and restaurants through integrated Google Maps.',
    githubLink: 'https://github.com/DenisGrudin1n/RecipeMobileApp',
    icons: ['assets/skillsIcons/android-original.svg', 'assets/skillsIcons/ios-original.svg'],
  ),
  ProjectModel(
    image: 'assets/projects/chatLite1.jpg',
    title: 'ChatLite',
    subtitle:
        'ChatLite is a messaging application powered by Flutter + Firebase. It provides users with the ability to exchange text messages and supports mobile (android and ios) platforms.',
    githubLink: 'https://github.com/DenisGrudin1n/ChatApp',
    icons: ['assets/skillsIcons/android-original.svg', 'assets/skillsIcons/ios-original.svg'],
  ),
];
