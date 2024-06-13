import 'package:ecommerce/features/authentication/controllers/Forgetpassword.dart';
import 'package:ecommerce/features/authentication/screens/loginscreen.dart';
import 'package:ecommerce/features/authentication/screens/password/reset_password.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()),
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
                const Text("Forget Password", style: TextStyle(fontSize: 25)),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(
                    "Don't worry sometimes people can forget too,enter your email and we will send you a password reset link.",
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: ESizes.spaceBtwSections),

                //Text field
                TextFormField(
                  validator: (value) =>
                            Forgetpassword.validateEmail(value),
                            controller: Forgetpassword.Email,
                  decoration: const InputDecoration(
                      labelText: "E-Mail", prefixIcon: Icon(Icons.email)),
                ),
                const SizedBox(height: ESizes.spaceBtwSections),

                //Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Forgetpassword.sendPasswordResetEmail(Forgetpassword.Email.text, context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword()),
                        );
                      },
                      child: const Text("Submit")),
                ),
              ],
            )));
  }
}
