import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/profile.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewAddress extends StatefulWidget {
  final UserModel usermodel;
  const NewAddress({super.key,required this.usermodel});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              usermodel: widget.usermodel,
                            )));
              },
              icon: Icon(
                Icons.arrow_back,
                color: dark ? Colors.white : Colors.black,
              )),
          title: Text("Add new Address"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person), labelText: "Name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone Number"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                labelText: "Street"),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.code),
                                labelText: "Pincode"),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.streetview_sharp),
                                labelText: "City"),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.code),
                                labelText: "State"),
                          )),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.circle),
                            labelText: "Country"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
