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

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool? checkBox = false;
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
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Column(children: [
                    Image.asset(
                      AssetsManager.appLogo,
                      height: 130.h,
                    ),
                    Text(
                      StringsManager.login,
                      style: AppStyles.h2MediumDMSans,
                    ),
                    Text(
                      StringsManager.welcomeBack,
                      style: AppStyles.h4MediumDMSans(),
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
                            StringsManager.email,
                            style: AppStyles.h5RegularDMSans(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          DefaultTextFormField(
                            hintText: StringsManager.enterYourEmail,
                            controller: userNameController,
                            keyboardType: TextInputType.emailAddress,
                            iconPath: AssetsManager.emailIcon,
                            validator: (text) {
                              return Validators.validateUsername(text);
                            },
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
                            validator: (password) =>
                                Validators.validatePassword(password),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Checkbox(
                                value: checkBox,
                                onChanged: (value) {
                                  checkBox = value;
                                  setState(() {});
                                },
                                activeColor: ColorsManager.choosenColor,
                              ),
                            ),
                            Text(
                              StringsManager.rememberMe,
                              style: AppStyles.h5RegularDMSans()
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Text(
                          StringsManager.forgotPassword,
                          style: AppStyles.h5RegularDMSans(
                                  color: ColorsManager.choosenColor)
                              .copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    viewModel.isRightCredintials
                        ? Container()
                        : Center(
                            child: Text(
                              viewModel.error,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                    Center(
                      child: DefaultSubmitButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              await viewModel.login(userNameController.text,
                                  passwordController.text);
                              if (viewModel.isRightCredintials) {
                                Navigator.pushReplacementNamed(
                                    context, RoutesManager.home);
                              }
                            }
                          },
                          label: StringsManager.login),
                    ),
                    SizedBox(
                      height: 30.h,
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
                          StringsManager.orLoginWith,
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
                          StringsManager.dontHaveAnAccount,
                          style: AppStyles.b1MediumDMSans(),
                        ),
                        TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, RoutesManager.signUp),
                            child: Text(
                              StringsManager.signUp,
                              style: AppStyles.b1MediumDMSans(
                                  color: ColorsManager.choosenColor),
                            ))
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
