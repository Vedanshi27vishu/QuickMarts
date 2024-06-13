import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/profile.dart';
import 'package:ecommerce/features/personalissation/Screens/Address/newaddress.dart';
import 'package:ecommerce/features/personalissation/Screens/singleaddress.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  final UserModel usermodel;
  const AddressScreen({super.key,required this.usermodel});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewAddress(usermodel:widget.usermodel)));
          },
          backgroundColor: ecolor.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile(usermodel: widget.usermodel,)));
              },
              icon: Icon(
                Icons.arrow_back,
                color: dark ? Colors.white : Colors.black,
              )),
          title: Text('Addresses',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                SingleAddress(selectedAddress: true),
                SingleAddress(selectedAddress: false),
              ],
            ),
          ),
        ));
  }
}
