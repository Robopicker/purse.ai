import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfilePage> {
  onBackPressed() {
    Navigator.pop(context);
  }

  Widget renderOptionTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26, top: 24),
      child: Text(
        title,
        style: temp['optionTitleStyle'],
      ),
    );
  }

  Widget optionCta(dynamic image, String title, [onPressed]) {
    return GestureDetector(
        onTap: () => {onPressed()},
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(image),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: Text(
                      title,
                      style: temp['optionTextStyle'],
                    ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(),
            const SizedBox(
              height: 12,
            )
          ],
        ));
  }

  onProfilePressed() {
    Navigator.of(context).pushNamed('/MyProfilePage');
  }

  Widget userInfo() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assest/UserIcon.png',
          height: 100,
          width: 100,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          'Simran',
          style: temp['userTextStyle'],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderOptionTitle('Personal Information'),
            optionCta(Icons.verified_user_outlined, 'Your Profile ',
                onProfilePressed),
            optionCta(Icons.download, 'History Transaction'),
            renderOptionTitle('Security'),
            optionCta(Icons.face, 'FaceId'),
            optionCta(Icons.lock, 'Change password'),
            optionCta(Icons.lock_open, 'Forgot password'),
            renderOptionTitle('General'),
            optionCta(Icons.notifications, 'Notifications'),
            optionCta(Icons.no_backpack, 'Languages'),
            optionCta(Icons.warning, 'Help and Support')
          ],
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget userLogoutCta() {
    return GestureDetector(
        onTap: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      content: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () => {Navigator.pop(context)},
                                    child: const Icon(Icons.close))),
                            const SizedBox(
                              height: 12,
                            ),
                            const Center(
                                child: Text(
                              'Are you sure want to Log Out?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            )),
                            GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () => {Navigator.pop(context)},
                                child: const Text('UserLogout'))
                          ],
                        ),
                      ),
                    );
                  })
            },
        child: Text(
          'Logut',
          style: temp['textStyle'],
        ));
  }

  Widget mainContent() {
    return Column(
      children: [
        GenericHeader(
          title: 'Profile',
          onBackPressed: onBackPressed,
        ),
        userInfo(),
        userLogoutCta()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: mainContent());
  }
}

final temp = {
  'textStyle': const TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  'userTextStyle': const TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
  'optiontextStyle': const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  'optionTitleStyle': const TextStyle(
      color: Color.fromRGBO(156, 164, 171, 1),
      fontSize: 14,
      fontWeight: FontWeight.w500)
};
