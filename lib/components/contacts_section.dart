import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/services/download_service.dart';

class ContactsSection extends StatelessWidget {
  const ContactsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 75),
      color: bgLight1,
      child: Column(
        children: [
          const Text(
            "Contacts",
            style: TextStyle(
              fontSize: 30,
              fontWeight: boldFontWeight,
              color: kLight,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contactItem(contactItems[0], launchUrl),
                  contactItem(contactItems[1], launchUrl),
                  contactItem(contactItems[2], launchUrl),
                ],
              ),
              const SizedBox(width: 350),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contactItem(contactItems[3], launchUrl),
                  contactItem(contactItems[4], launchUrl),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contactItem(Map<String, String> item, Function(String) launchUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: kLight,
            child: Image.asset(
              item["icon"]!,
              height: 32.5,
              width: 32.5,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["title"]!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: boldFontWeight,
                  color: kLight,
                ),
              ),
              InkWell(
                onTap: item["link"] != null
                    ? () => launchUrl(item["link"]!)
                    : null,
                child: Text(
                  item["subtitle"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: mediumFontWeight,
                    color: kLightSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
