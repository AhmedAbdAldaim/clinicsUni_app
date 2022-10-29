import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/company/presentation/cubit/company_cubit.dart';
import 'package:clinic_app/src/features/company/presentation/widgets/build_item_company.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = AppMediaQuery.height(context: context);
    var w = AppMediaQuery.width(context: context);
    var cubit = di.sl<CompanyCubit>()..getAllCompany();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CompanyCubit, CompanyState>(
        builder: (context, state) {
          var cubit = CompanyCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('اختر شركة تأمين'),
                centerTitle: true,
              ),
              body: Center(
                child: state is CompanyErrorState
                    ? const Center(child: Text(AppString.errorServer))
                    : ConditionalBuilder(
                        condition: cubit.listCompany != null &&
                            state is CompanySuccessState,
                        builder: (context) {
                          return cubit.listCompany!.isEmpty
                              ? const Center(
                                  child: Text("لا توجد اي شركات تامين"))
                              : Padding(
                                  padding: EdgeInsets.all(w * 0.06),
                                  child: Column(
                                    children: [
                                      Text(
                                        "قم بإختيار شركة التأمين",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: w * 0.03),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            itemCount:
                                                cubit.listCompany!.length,
                                            itemBuilder: (context, index) {
                                              return BuildItemCompany(
                                                  index: index);
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    Divider()),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(w * 0.04),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          w * 0.04))),
                                          onPressed: () {
                                            di.sl<SharedPrefrencesHelper>()
                                                .setData(
                                                    key: 'companyID',
                                                    value: cubit.values)
                                                .then((value) {
                                              Navigator.of(context).pushNamed(
                                                  AppRoutes.loginScreen);
                                            });
                                          },
                                          child: const Text("موافق"))
                                    ],
                                  ),
                                );
                        },
                        fallback: (context) =>
                            const CircularProgressIndicator.adaptive(),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
