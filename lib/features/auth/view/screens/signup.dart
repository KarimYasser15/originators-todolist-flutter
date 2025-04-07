import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/auth/view/widgets/facebook_google_item.dart';
import 'package:todo_list/features/auth/view/widgets/password_text_form_field.dart';
import 'package:todo_list/features/auth/view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          body: Stack(children: [
            viewModel.isLoading ? CircularLoading() : Container(),
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsManager.appLogo,
                        height: 130.h,
                      ),
                      Text(
                        StringsManager.signUp,
                        style: AppStyles.h3MediumDMSans(
                            color: ColorsManager.choosenColor),
                      ),
                      Text(
                        StringsManager.welcomeToOriginatorsTracker,
                        style: AppStyles.h5MediumDMSans(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.fullName,
                              style: AppStyles.h5RegularDMSans(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultTextFormField(
                              hintText: StringsManager.fullName,
                              controller: fullNameController,
                              iconPath: AssetsManager.userIcon,
                              validator: (fullName) {
                                return Validators.validateFullName(fullName);
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              StringsManager.userName,
                              style: AppStyles.h5RegularDMSans(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultTextFormField(
                              hintText: StringsManager.userName,
                              controller: userNameController,
                              iconPath: AssetsManager.userIcon,
                              validator: (username) {
                                return Validators.validateUsername(username);
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              StringsManager.email,
                              style: AppStyles.h5RegularDMSans(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultTextFormField(
                              hintText: StringsManager.enterYourEmail,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              iconPath: AssetsManager.emailIcon,
                              // validator: (email) {
                              //   return Validators.validateEmail(email);
                              // },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              StringsManager.password,
                              style: AppStyles.h5RegularDMSans(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            PasswordTextFormField(
                              hintText: StringsManager.enterPassword,
                              controller: passwordController,
                              validator: (password) {
                                return Validators.validatePassword(password);
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              StringsManager.confirmPassword,
                              style: AppStyles.h5RegularDMSans(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            PasswordTextFormField(
                              hintText: StringsManager.confirmPassword,
                              controller: confirmPasswordController,
                              validator: (password) {
                                return Validators.validateTwoPasswords(
                                    password, passwordController.text);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      DefaultSubmitButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              await viewModel.signup(
                                  fullNameController.text,
                                  userNameController.text,
                                  emailController.text,
                                  passwordController.text);
                              if (viewModel.isRightCredintials) {
                                Navigator.pushReplacementNamed(
                                    context, RoutesManager.login);
                              }
                            }
                          },
                          label: StringsManager.signUp),
                      viewModel.isRightCredintials
                          ? Container()
                          : Center(
                              child: Text(
                                viewModel.error,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: ColorsManager.neutralGrey7,
                              endIndent: 12,
                            ),
                          ),
                          Text(
                            StringsManager.orSignUpWith,
                            style: AppStyles.h5MediumDMSans(),
                          ),
                          Expanded(
                            child: Divider(
                              color: ColorsManager.neutralGrey7,
                              indent: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FacebookGoogleItem(
                            label: StringsManager.google,
                            iconLabel: AssetsManager.googleIcon,
                            borderColor: ColorsManager.orange,
                            onPressed: () {},
                          ),
                          FacebookGoogleItem(
                            label: StringsManager.facebook,
                            iconLabel: AssetsManager.facebookIcon,
                            borderColor: ColorsManager.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            StringsManager.alreadyHaveAnAccount,
                            style: AppStyles.b1MediumDMSans(),
                          ),
                          TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, RoutesManager.login),
                              child: Text(
                                StringsManager.login,
                                style: AppStyles.b1MediumDMSans(
                                    color: ColorsManager.choosenColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
