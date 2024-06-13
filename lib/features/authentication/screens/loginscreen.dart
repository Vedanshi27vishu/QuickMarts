import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/features/authentication/controllers/signin_controller.dart';
import 'package:ecommerce/features/authentication/screens/password/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvisible = true;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: spacing.padding,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      height: 150,
                      image: AssetImage("assets/Logos/logoipsum-255 1.png"),
                    ),
                    Text("Welcome Back,",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: ESizes.sm),
                    Text(
                        "Discover Limitless Choices and Unmatched Conveinence.",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                //Form
                Form(
                    child: Padding(
                  padding: const EdgeInsets.only(top: ESizes.spaceBtwSections),
                  child: Column(children: [
                    //Email
                    TextFormField(
                        controller: SignInController.email,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "E-Mail")),
                    const SizedBox(height: ESizes.spaceBtwInputFields),
                    //PassWord
                    TextFormField(
                      controller: SignInController.password,
                      obscureText: isvisible,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: "Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              },
                              child: isvisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility))),
                    ),
                    const SizedBox(height: ESizes.spaceBtwInputFields / 2),

                    //Remember mee & forget Passwaord
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: ischecked,
                                onChanged: (value) {
                                  setState(() {
                                    ischecked = !ischecked;
                                  });
                                }),
                            const Text("Remember Me"),
                          ],
                        ),
                        // Forget Password
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassword()));
                            },
                            child: const Text("Forget Password")),
                      ],
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),

                    //Sign In Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              UserModel? usermodel =
                                  await UserRepository.getuseremail(
                                      SignInController.email.text);
                              SignInController.SignIn(
                                  usermodel!,
                                  SignInController.email.text,
                                  SignInController.password.text,
                                  context);
                            },
                            child: const Text("SignIn"))),
                    const SizedBox(height: ESizes.spaceBtwItems),

                    //Create Account Button
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ));
                            },
                            child: const Text("Create Account"))),
                    // const SizedBox(height: 0),
                  ]),
                )),
                //Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Divider(
                            color: dark ? Colors.grey : Colors.blueGrey,
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
              ],
            )),
      ),
    );
  }
}
