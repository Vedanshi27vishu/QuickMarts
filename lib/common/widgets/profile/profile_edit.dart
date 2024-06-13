import 'dart:typed_data';

import 'package:ecommerce/Updateinformation/update%20singleinfo.dart';
import 'package:ecommerce/Updateinformation/updatename.dart';
import 'package:ecommerce/common/widgets/profile/ImagePicker.dart';
import 'package:ecommerce/common/widgets/profile/profile_details.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/profile.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  final UserModel? usermodel;
  ProfileEdit({
    super.key,
    this.usermodel,
  });

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  Uint8List? _image;

  void selectImage() async {
    _image =
        (await ImagePickers.pickImage(ImageSource.gallery, widget.usermodel!))
            as Uint8List?;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userdata = widget.usermodel;
    String? photo = userdata!.profilePicture;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(usermodel: userdata)));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Profile"),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  _image != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage:NetworkImage(photo),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(photo),
                        ),
                  TextButton(
                      onPressed: () {
                        selectImage();
                      },
                      child: const Text('Change Profile Picture')),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 170),
                    child: Text("Profile Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontStyle,
                          color: Colors.white,
                          fontSize: 17,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: ProfileDetails(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateName(
                                    usermodel: widget.usermodel!,
                                    fieldfirst: "firstName",
                                    fieldlast: "lastName")),
                          );
                        },
                        title: "Name",
                        value: "${userdata.firstName} ${userdata.lastName}"),
                  ),
                  ProfileDetails(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateSingleinfo(
                                    fieldlabel: "Username",
                                    usermodel: widget.usermodel)));
                      },
                      title: "Username",
                      value: userdata.id),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 170),
                    child: Text("Profile Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontStyle,
                          color: Colors.white,
                          fontSize: 17,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProfileDetails(
                      onPressed: () {}, title: "User ID", value: userdata.id),
                  ProfileDetails(
                      onPressed: () {}, title: "E-mail", value: userdata.email),
                  ProfileDetails(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateSingleinfo(
                                    fieldlabel: "Phone",
                                    usermodel: widget.usermodel)));
                      },
                      title: "Phone Number",
                      value: userdata.phoneNumber),
                  ProfileDetails(
                      onPressed: () {}, title: "Gender", value: "Female"),
                  ProfileDetails(
                      onPressed: () {},
                      title: "Date of Birth",
                      value: "27 Aug,2004"),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: TextButton(
                    onPressed: () {
                      UserRepository.deleteuserRecord(
                          widget.usermodel!, context);
                    },
                    child: const Text("Close Account",
                        style: TextStyle(color: Colors.red)),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
