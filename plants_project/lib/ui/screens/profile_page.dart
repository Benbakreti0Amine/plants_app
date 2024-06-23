import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plants_project/constants.dart';
import 'package:plants_project/root_page.dart';
import 'package:plants_project/ui/screens/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
            width: size.width * .4,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.transparent,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(.4),
                  width: size.width * .01,
                )),
          ),
          SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("AmineBenbakreti"),
              SizedBox(width: 6),
              Icon(Icons.verified),
            ],
          ),
          Text(
            "m.benbakreti@esi-sba.dz",
            style: TextStyle(color: Constants.blackColor.withOpacity(.7)),
          ),
          SizedBox(
            height: 10,
          ),
          Profile_page_list_item(
            icon: Icons.person,
            text: 'Profile',
          ),
          Profile_page_list_item(
            icon: Icons.settings,
            text: 'Settings',
          ),
          Profile_page_list_item(
            icon: Icons.notifications,
            text: 'Notifications',
          ),
          Profile_page_list_item(
            icon: Icons.share,
            text: 'Share',
          ),
          Profile_page_list_item(
            icon: Icons.logout,
            text: 'LogOut',
            onpressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const RootPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    ));
  }
}

class Profile_page_list_item extends StatelessWidget {
  final VoidCallback? onpressed;
  final IconData icon;
  final String text;
  const Profile_page_list_item({
    super.key,
    required this.icon,
    required this.text,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onpressed != null) {
          onpressed!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: 10,
                ),
                Text(text)
              ],
            ),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
