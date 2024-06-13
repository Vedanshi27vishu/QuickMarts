import 'package:ecommerce/common/widgets/profile/profile_edit.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateName extends StatelessWidget {
  UserModel? usermodel;
  String? fieldfirst;
  String? fieldlast;
  UpdateName({
    super.key,
    this.usermodel,
    this.fieldfirst,
    this.fieldlast,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    var first = TextEditingController();
    var last = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileEdit(usermodel: usermodel)),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: dark ? Colors.white : Colors.black,
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Headings
                const Text("Update Details", style: TextStyle(fontSize: 25)),
                const SizedBox(height: ESizes.spaceBtwItems),

                //  Text field
                TextFormField(
                  //validator: (value) => Forgetpassword.validateEmail(value),
                  controller: first,
                  decoration: const InputDecoration(
                    labelText: "FirstName",
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwSections),
                TextFormField(
                  controller: last,
                  decoration: const InputDecoration(
                    labelText: "LastName",
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwSections),
                //  Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        await UserRepository.updateUserRecord(
                            usermodel!, "First", first.text);
                        await UserRepository.updateUserRecord(
                            usermodel!, "Last", last.text);
                        UserModel? userdata =
                            await UserRepository.getUserDetail(
                                usermodel!.email);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileEdit(
                                      usermodel: userdata!,
                                    )));
                      },
                      child: const Text("Submit")),
                ),
              ],
            )));
  }
}
