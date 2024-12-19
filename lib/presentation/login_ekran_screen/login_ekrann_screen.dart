import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/login_ekran_bloc.dart';
import 'models/login_ekran_model.dart';

class LoginEkranScreen extends StatelessWidget {
  const LoginEkranScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginEkranBloc>(
      create: (context) => LoginEkranBloc(
        LoginEkranState(loginEkranModelObj: LoginEkranModel()),
      )..add(LoginEkranInitialEvent()),
      child: const LoginEkranScreen(),
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
          width: double.infinity,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            border: Border.all(
              color: appTheme.black90001,
              width: 1.h,
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgLoginEkran),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 56.h, vertical: 28.h),
          child: Column(
            children: [
              _buildLoginButton(context),
              SizedBox(height: 40.h),
              _buildSectionTitle("msg_email_veya_kullan_c".tr),
              SizedBox(height: 10.h),
              _buildEmailInput(context),
              SizedBox(height: 20.h),
              _buildSectionTitle("lbl_ifre".tr, leftPadding: 8.h),
              SizedBox(height: 12.h),
              _buildPasswordInput(context),
              SizedBox(height: 32.h),
              _buildSubmitButton(context),
              SizedBox(height: 14.h),
              _buildForgotPasswordText(),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      height: 38.h,
      width: 154.h,
      text: "lbl_giri_yap".tr,
      buttonStyle: CustomButtonStyles.fillOnErrorContainer,
      buttonTextStyle: theme.textTheme.titleLarge!,
    );
  }

  Widget _buildSectionTitle(String text, {double leftPadding = 0}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding),
        child: Text(
          text,
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.h),
      child: BlocSelector<LoginEkranBloc, LoginEkranState, TextEditingController?>(
        selector: (state) => state.emailInputController,
        builder: (context, emailInputController) {
          return CustomTextFormField(
            controller: emailInputController,
            hintText: "msg_email_veya_kullan_c".tr,
            textInputType: TextInputType.emailAddress,
            contentPadding: EdgeInsets.fromLTRB(12.h, 10.h, 12.h, 14.h),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.h),
      child: BlocSelector<LoginEkranBloc, LoginEkranState, TextEditingController?>(
        selector: (state) => state.passwordInputController,
        builder: (context, passwordInputController) {
          return CustomTextFormField(
            controller: passwordInputController,
            hintText: "lbl_ifre2".tr,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.fromLTRB(12.h, 10.h, 12.h, 14.h),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTl22,
          );
        },
      ),
    );
  }
  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_giri_yap".tr,
      margin: EdgeInsets.only(right: 6.h),
      onPressed: () {
        context.read<LoginEkranBloc>().add(LoginEkranButtonPressed());
      },
    );
  }


  Widget _buildForgotPasswordText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "msg_ifrenimi_unuttun2".tr,
            style: CustomTextStyles.bodyMediumErrorContainer,
          ),
          TextSpan(
            text: "lbl".tr,
            style: CustomTextStyles.bodyMediumErrorContainer,
          ),
          TextSpan(
            text: "lbl_t_kla".tr,
            style: CustomTextStyles.bodyMediumPrimaryContainer,
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
