// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/GenericText.dart';

class GenericAppbar extends StatelessWidget {
  final bool showBackButton;
  final Widget trailing;
  final bool showUserIcon;
  final String title;

  const GenericAppbar(
      {super.key,
      this.title = "",
      this.trailing = const SizedBox(),
      this.showUserIcon = false,
      this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton) LeadingIcon(),
          showUserIcon
              ? UserInfo()
              : GenericText(
                  title: title,
                  size: 18,
                  lineHeight: 26,
                  fontWeight: FontWeight.w500,
                ),
          trailing
        ],
      ),
    );
  }
}

LeadingIcon() => Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey.shade400)),
      child: IconButton(
          onPressed: () => {
                // To Add pop functionality
              },
          icon: const Icon(Icons.arrow_back_ios)),
    );

UserInfo() => Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
              height: 48,
              width: 48,
              image: NetworkImage(
                  'https://randomuser.me/api/portraits/thumb/men/41.jpg')),
        ),
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GenericText(
                title: 'Welcome back',
                size: 12,
                lineHeight: 20,
                textColor: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              GenericText(
                title: 'Shreeyash Jejurkar',
                size: 18,
                lineHeight: 20,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        )
      ],
    );
