import 'package:ecommerce/features/authentication/controllers/signup_controller.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    "Let's Create Your Account,",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 3),

                  //Forms
                  Form(
                      key: SignupController.signupFormKey,
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                  controller: SignupController.firstName,
                                  validator: (value) =>
                                      TValidator.validateEmptyText(
                                          'First name', value),
                                  expands: false,
                                  decoration: const InputDecoration(
                                    labelText: "First Name",
                                    prefixIcon: Icon(Icons.person),
                                  )),
                            ),
                            const SizedBox(width: ESizes.spaceBtwInputFields),
                            Expanded(
                              child: TextFormField(
                                  controller: SignupController.lastName,
                                  validator: (value) =>
                                      TValidator.validateEmptyText(
                                          'Last name', value),
                                  expands: false,
                                  decoration: const InputDecoration(
                                    labelText: "Last Name",
                                    prefixIcon: Icon(Icons.person),
                                  )),
                            )
                          ],
                        ),
                        //Username
                        const SizedBox(height: ESizes.spaceBtwInputFields),
                        TextFormField(
                            validator: (value) =>
                                TValidator.validateEmptyText('Username', value),
                            controller: SignupController.username,
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person),
                            )),
                        //E-Mail
                        const SizedBox(height: ESizes.spaceBtwInputFields),
                        TextFormField(
                            validator: (value) =>
                                TValidator.validateEmptyText('email', value),
                            controller: SignupController.email,
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "E-Mail",
                              prefixIcon: Icon(Icons.email_rounded),
                            )),
                        //Phone Number
                        const SizedBox(height: ESizes.spaceBtwInputFields),
                        TextFormField(
                            validator: (value) => TValidator.validateEmptyText(
                                'phoneNumber', value),
                            controller: SignupController.phoneNumber,
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                            )),
                        //Password
                        const SizedBox(height: ESizes.spaceBtwInputFields),
                        TextFormField(
                            validator: (value) =>
                                TValidator.validateEmptyText('Password', value),
                            controller: SignupController.password,
                            expands: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: Icon(Icons.remove_red_eye_sharp),
                            )),
                        const SizedBox(height: ESizes.spaceBtwSections),
                        Row(
                          children: [
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: ischecked,
                                  onChanged: (value) {
                                    setState(() {
                                      ischecked = !ischecked;
                                    });
                                  },
                                  checkColor: Color.fromARGB(255, 4, 50, 88),
                                )),
                            const SizedBox(width: 5),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "I agree to ",
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: "Privacy Policy ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                      )),
                              TextSpan(
                                  text: "and ",
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: "Terms of use",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 8, 38, 62),
                                      )),
                            ]))
                          ],
                        ),
                        //sign up Button
                        const SizedBox(
                          height: ESizes.spaceBtwSections,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (SignupController
                                          .signupFormKey.currentState!
                                          .validate() &&
                                      SignupController.ischecked(ischecked) ==
                                          true) {
                                    UserRepository.createUser(
                                        SignupController.user,context);
                                    SignupController.SignUp(
                                        SignupController.email.text,
                                        SignupController.password.text,
                                        context);
                                  }
                                  ;
                                },
                                child: const Text("Create Account"))),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Divider(
                                    color: dark
                                        ? Colors.grey
                                        : const Color.fromARGB(
                                            255, 78, 196, 255),
                                    thickness: 0.5,
                                    indent: 60,
                                    endIndent: 5)),
                            Text("Or Sign In",
                                style: Theme.of(context).textTheme.labelMedium),
                            Flexible(
                                child: Divider(
                                    color: dark ? Colors.grey : Colors.blueGrey,
                                    thickness: 0.5,
                                    indent: 5,
                                    endIndent: 60)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        //Footer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/Icons/brands/icons8-google-48.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/Icons/brands/icons8-facebook-48.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        )
                      ]))
                ],
              )),
        ));
  }
}
