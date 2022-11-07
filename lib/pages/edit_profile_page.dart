import 'package:flutter/material.dart';

import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        title: Text('Edit Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Name',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            style: primaryTextStyle,
            decoration: InputDecoration(
              hintText: 'Frengki Limbong',
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subTitleColor,
                ),
              ),
            ),
          )
        ]),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Username',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            style: primaryTextStyle,
            decoration: InputDecoration(
              hintText: '@frengkiller',
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subTitleColor,
                ),
              ),
            ),
          )
        ]),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Email Address',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          TextFormField(
            style: primaryTextStyle,
            decoration: InputDecoration(
              hintText: 'frengkiller@gmail.com',
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: subTitleColor,
                ),
              ),
            ),
          )
        ]),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: defaultMargin),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/image_profile.png'),
              ),
            ),
          ),
          nameInput(),
          usernameInput(),
          emailInput(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
