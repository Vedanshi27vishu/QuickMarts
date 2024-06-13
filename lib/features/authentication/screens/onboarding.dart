// ignore: unused_import
import 'package:ecommerce/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/loginscreen.dart';
//import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  //statelesswidget means the properties will be const. no changes.
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        body: Stack(
      children: [
        //Horizontal Scrolluble Pages
        PageView(children: [
          OnBoardingPage1(
            image:
                "assets/Images/on_boarding_images/sammy-line-sailor-on-mast-looking-through-telescope.gif",
            title: "Choose your product",
            subTitle:
                "Welcome to a world of Limitless choices- Your Perfect Product Awaits! ",
          ),
          OnBoardingPage2(
            image:
                "assets/Images/on_boarding_images/sammy-line-woman-in-shopping-cart-placing-order-on-smartphone.gif",
            title: "Select Payment Method",
            subTitle:
                "For Seamless Transactions.Choose Your Payment Path - Your Convenience ,Our Priority ",
          ),
          OnBoardingPage3(
            image:
                "assets/Images/on_boarding_images/sammy-line-man-and-dog-delivering-packages-on-a-moped.gif",
            title: "Delivery at your door step",
            subTitle:
                "From Our Doorstep to Yours - Swift,Secure,and Contactless Delivery! ",
          ),
        ]),
        //Skip Button

        //Dot Navigation SmoothPageIndicator
        //Smooth page is not being imported.

        //Circular Button
      ],
    ));
  }

  Positioned get OnBoardPageskip => Positioned(
        top: kToolbarHeight,
        right: ESizes.defaultSpace,
        child: TextButton(onPressed: () {}, child: const Text('Skip')),
      );
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.8,
                height: THelperFunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
            right: ESizes.defaultSpace,
            bottom: kBottomNavigationBarHeight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnBoardingPage2(
                      image:
                          "assets/Images/on_boarding_images/sammy-line-woman-in-shopping-cart-placing-order-on-smartphone.gif",
                      title: "Select Payment Method",
                      subTitle:
                          "For Seamless Transactions.Choose Your Payment Path - Your Convenience ,Our Priority ",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? Color.fromARGB(255, 211, 158, 247)
                      : Color.fromARGB(255, 48, 39, 39)),
              child: Icon(Icons.arrow_right),
            )),
        Positioned(
          top: kToolbarHeight,
          right: ESizes.defaultSpace,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.8,
                height: THelperFunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
            right: ESizes.defaultSpace,
            bottom: kBottomNavigationBarHeight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnBoardingPage3(
                      image:
                          "assets/Images/on_boarding_images/sammy-line-man-and-dog-delivering-packages-on-a-moped.gif",
                      title: "Delivery at your door step",
                      subTitle:
                          "From Our Doorstep to Yours - Swift,Secure,and Contactless Delivery! ",
                    ), 
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? Color.fromARGB(255, 211, 158, 247)
                      : Color.fromARGB(255, 48, 39, 39)),
              child: Icon(Icons.arrow_right),
            )),
        Positioned(
          top: kToolbarHeight,
          right: ESizes.defaultSpace,
          child: TextButton(
            onPressed: () {
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.8,
                height: THelperFunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
            right: ESizes.defaultSpace,
            bottom: kBottomNavigationBarHeight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? Color.fromARGB(255, 211, 158, 247)
                      : Color.fromARGB(255, 48, 39, 39)),
              child: Icon(Icons.arrow_right),
            )),
        Positioned(
          top: kToolbarHeight,
          right: ESizes.defaultSpace,
          child: TextButton(
            onPressed: () {
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}
