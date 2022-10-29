import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/cores/components/components.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/auth/domain/entities/register_entite.dart';
import 'package:clinic_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var cubit = di.sl<AuthCubit>();
  var shared = di.sl<SharedPrefrencesHelper>();
  @override
  Widget build(BuildContext context) {
    var h = AppMediaQuery.height(context: context);
    var w = AppMediaQuery.width(context: context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          context.loaderOverlay.hide();
          defaultSnakbar(content: state.message, context: context);
        } else if (state is AuthSuccessState) {
          if (state.registerEntite.status == true) {
            shared.setData(
                key: 'name', value: state.registerEntite.user!.name);
            shared.setData(key: 'password', value: passwordController.text);
            shared.setData(
                key: 'email', value: state.registerEntite.user!.email);
            shared.setData(
                key: 'token', value: 'Bearer ${state.registerEntite.token}');
            context.loaderOverlay.hide();
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.clinicsScreen, (route) => false);
          }
        } 
      },
      builder: (context, state) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: LoaderOverlay(
              useDefaultLoading: true,
              overlayColor: Colors.black,
              overlayOpacity: 0.3,
              child: Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                      child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(h * 0.05),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.jpg',
                                width:w* 0.20,
                              ),
                              Text(
                                'فيزيتا',
                                style: TextStyle(
                                    fontSize: w * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:h * 0.03,
                              ),
                              Text(
                                'تسجيل حساب',
                                style: TextStyle(
                                    fontSize: w * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:h * 0.03,
                              ),
                              defaultTextFormFaield(
                                  controller: nameController,
                                  type: TextInputType.name,
                                  hint: 'الإسم',
                                  action: TextInputAction.next,
                                  valid: (val) {
                                    if (val.isEmpty) {
                                      return 'أدخل الإسم !';
                                    }
                                    return null;
                                  },
                                  context: context),
                              SizedBox(
                                height:h * 0.02,
                              ),
                              defaultTextFormFaield(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  hint: 'البريد الإلكتروني',
                                  action: TextInputAction.next,
                                  valid: (val) {
                                    if (val.isEmpty) {
                                      return 'أدخل البريد الإلكتروني !';
                                    }
                                    return null;
                                  },
                                  context: context),
                              SizedBox(
                                height:h * 0.02,
                              ),
                              defaultTextFormFaield(
                                  controller: passwordController,
                                  type: TextInputType.text,
                                  hint: 'كلمة المرور',
                                  action: TextInputAction.next,
                                  valid: (val) {
                                    if (val.isEmpty) {
                                      return 'أدخل كلمة المرور !';
                                    }
                                    return null;
                                  },
                                  ispassword: cubit.ispassword,
                                  changepassword: () =>  cubit.obscurePasswordFun(),
                                  suffixicon: cubit.ispassword
                                      ? const Icon(Icons.visibility_off_rounded)
                                      : const Icon(Icons.visibility_rounded),
                                  context: context),
                              SizedBox(
                                height:h * 0.02,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: defaultButton(
                                    context: context,
                                    title: 'تسجيل',
                                    colorTitle: Colors.white,
                                    colorBtn: Colors.Mycolor,
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        context.loaderOverlay.show();

                                        UserEntite userEntite = UserEntite(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            companyID: shared.getData(key: 'companyID').toString());

                                        cubit.register(
                                            data: userEntite.toMap());
                                      }
                                    }),
                              ),
                              SizedBox(
                                height:h * 0.02,
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(AppRoutes.loginScreen,
                                        (route) => false),
                                child: Text(
                                  'لديك حساب ؟ سجل الدخول .',
                                  style: TextStyle(
                                      fontSize: AppMediaQuery.width(
                                              context: context) *
                                          0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                           
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
            ));
      },
    );
  }
}
