import 'package:ecommerce/features/authentication/screens/loginscreen.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  get automaticallyImplyLeading => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Lottie.asset("assets/Images/animations/Animation - 1716672502062.json"),
          const SizedBox(height: ESizes.spaceBtwSections),
          Text(
            "Your account successfully created!",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),
          Text(
            "Welcome to Your Ultimate Shopping Destination Your Account is Created, Unleash the Joy of Seamless Online Shopping! ",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: ESizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text("Continue"))),
        ],
      ),
    )));
  }
}
