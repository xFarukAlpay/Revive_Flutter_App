import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/signup_ekran_bloc.dart';
import 'models/signup_ekran_model.dart';

class SignupEkranScreen extends StatelessWidget {
  const SignupEkranScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupEkranBloc>(
      create: (context) => SignupEkranBloc(
        SignupEkranState(signupEkranModelObj: SignupEkranModel()),
      )..add(SignupEkranInitialEvent()),
      child: SignupEkranScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onErrorContainer,
            border: Border.all(
              color: Theme.of(context).colorScheme.onError,
              width: 1,
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgSignupEkran),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                _buildLoginButton(context),
                SizedBox(height: 40),
                _buildTextFieldLabel(context, "lbl_email".tr),
                SizedBox(height: 10),
                _buildEmailInput(context),
                SizedBox(height: 10),
                _buildTextFieldLabel(context, "lbl_telefon".tr),
                SizedBox(height: 10),
                _buildPhoneInput(context),
                SizedBox(height: 10),
                _buildTextFieldLabel(context, "lbl_kullan_c_ad".tr),
                SizedBox(height: 10),
                _buildUsernameInput(context),
                SizedBox(height: 10),
                _buildTextFieldLabel(context, "lbl_ifre".tr),
                SizedBox(height: 10),
                _buildPasswordInput(context),
                SizedBox(height: 10),
                _buildTextFieldLabel(context, "lbl_ifre_tekrar".tr),
                SizedBox(height: 10),
                _buildConfirmPasswordInput(context),
                SizedBox(height: 28),
                _buildSignupButton(context),
                SizedBox(height: 16),
                _buildGoogleSignupButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldLabel(BuildContext context, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      height: 38,
      width: 154,
      text: "lbl_giri_yap".tr,
      buttonStyle: CustomButtonStyles.fillOnErrorContainer,
      buttonTextStyle: Theme.of(context).textTheme.titleLarge!,
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return BlocSelector<SignupEkranBloc, SignupEkranState, TextEditingController?>(
      selector: (state) => state.emailInputController,
      builder: (context, emailInputController) {
        return CustomTextFormField(
          width: 310,
          controller: emailInputController,
          hintText: "msg_email_veya_kullan_c".tr,
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 14),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email";
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildPhoneInput(BuildContext context) {
    return BlocSelector<SignupEkranBloc, SignupEkranState, TextEditingController?>(
      selector: (state) => state.phoneInputController,
      builder: (context, phoneInputController) {
        return CustomTextFormField(
          width: 310,
          controller: phoneInputController,
          hintText: "lbl_telefon".tr,
          contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 14),
        );
      },
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    return BlocSelector<SignupEkranBloc, SignupEkranState, TextEditingController?>(
      selector: (state) => state.usernameInputController,
      builder: (context, usernameInputController) {
        return CustomTextFormField(
          width: 310,
          controller: usernameInputController,
          hintText: "lbl_kullan_c_ad".tr,
          contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 14),
        );
      },
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return BlocSelector<SignupEkranBloc, SignupEkranState, TextEditingController?>(
      selector: (state) => state.passwordInputController,
      builder: (context, passwordInputController) {
        return CustomTextFormField(
          width: 310,
          controller: passwordInputController,
          hintText: "lbl_ifre".tr,
          contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 14),
        );
      },
    );
  }

  Widget _buildConfirmPasswordInput(BuildContext context) {
    return BlocSelector<SignupEkranBloc, SignupEkranState, TextEditingController?>(
      selector: (state) => state.confirmPasswordInputController,
      builder: (context, confirmPasswordInputController) {
        return CustomTextFormField(
          width: 310,
          controller: confirmPasswordInputController,
          hintText: "lbl_ifre_tekrar".tr,
          textInputAction: TextInputAction.done,
          contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 14),
        );
      },
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return CustomElevatedButton(
      width: 310,
      text: "lbl_kay_t_ol".tr,
    );
  }

  Widget _buildGoogleSignupButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 310,
      text: "lbl_google".tr,
      leftIcon: Padding(
        padding: EdgeInsets.only(right: 4),
        child: CustomImageView(
          imagePath: ImageConstant.imgContrast,
          height: 12,
          width: 12,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
