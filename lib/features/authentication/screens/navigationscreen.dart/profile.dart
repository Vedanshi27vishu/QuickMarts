import 'package:ecommerce/common/widgets/containers/tcircular.dart';
import 'package:ecommerce/common/widgets/curvededges/curve.dart';
import 'package:ecommerce/common/widgets/profile/profile_edit.dart';
import 'package:ecommerce/common/widgets/setting_menu.dart/SettingMenu.dart';
import 'package:ecommerce/features/personalissation/Screens/Address/address.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final UserModel ?usermodel;
  const Profile({super.key,required this.usermodel});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  
  Widget build(BuildContext context) {
      UserModel userdata = widget.usermodel!;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          tcurve(
            child: Container(
              color: ecolor.primary,
              child: SizedBox(
                height: 190,
                child: Container(
                    color: ecolor.primary,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -150,
                          right: -250,
                          child: Tcircular(
                            backgroundColor: ecolor.white.withOpacity(0.1),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: -300,
                          child: Tcircular(
                            backgroundColor: ecolor.white.withOpacity(0.1),
                          ),
                        ),
                        AppBar(
                          toolbarHeight: 150,
                          automaticallyImplyLeading: false,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/Icons/brands/woman.png"),
                                ),
                                title: Text(userdata.firstName+" "+userdata.lastName ,
                                    style: TextStyle(
                                        fontStyle: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .fontStyle,
                                        fontSize: 15)),
                                subtitle: Text(userdata.email,
                                    style: TextStyle(
                                        fontStyle: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontStyle,
                                        fontSize: 10)),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileEdit(usermodel: widget.usermodel,)));
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          ////BODY
          Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Account Settings",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontStyle,
                          color: Colors.white,
                          fontSize: 19),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //accountSettings
                  SettingMenu(
                      icon: Icons.home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressScreen(usermodel: widget.usermodel!,)));
                      }),
                  SettingMenu(
                      icon: Icons.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () {}),
                  SettingMenu(
                      icon: Icons.backpack,
                      title: 'My orders',
                      subTitle: 'In-progress and Completed orders',
                      onTap: () {}),
                  SettingMenu(
                      icon: Icons.account_balance,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  SettingMenu(
                      icon: Icons.discount,
                      title: 'My Coupons',
                      subTitle: 'List of all the disconnected coupons',
                      onTap: () {}),
                  SettingMenu(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message',
                      onTap: () {}),
                  SettingMenu(
                      icon: Icons.security,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {}),
                  //App settings
                  const SizedBox(height: 10),
                  Text(
                    "App Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontStyle,
                        color: Colors.white,
                        fontSize: 19),
                  ),
                  const SizedBox(height: 10),
                  SettingMenu(
                      icon: Icons.upload,
                      title: 'Load',
                      subTitle: 'Upload Data to your Clound Firebase',
                      onTap: () {}),
                  SettingMenu(
                    icon: Icons.document_scanner,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenu(
                      icon: Icons.location_city,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all apps',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SettingMenu(
                      icon: Icons.security,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {})),
                ],
              ))
        ],
      )),
    );
  }
}
