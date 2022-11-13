import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    splitUrl(String url) {
      var spliturl = url.split('&');
      var splitted = spliturl[0] + '&' + spliturl[2] + '&' + spliturl[1];
      return splitted;
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    splitUrl(user.profilePhotoUrl),
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                    ),
                    Text(
                      '@${user.username}',
                      style: subTitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/button_exit.png',
                    width: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            text,
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          Icon(
            Icons.chevron_right,
            color: primaryTextColor,
          ),
        ]),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Account',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem('Edit Profile')),
            menuItem('Your Orders'),
            menuItem('Help'),
            SizedBox(
              height: 30,
            ),
            Text(
              'General',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            menuItem('Privacy and Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ]),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
