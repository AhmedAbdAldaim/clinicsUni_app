import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/components/components.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/clinics/presentation/cubit/clinics_cubit.dart';
import 'package:clinic_app/src/features/clinics/presentation/widgets/build_item_clinic.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class ClinicsScreen extends StatelessWidget {
  ClinicsScreen({super.key});

  var cubit = di.sl<ClinicsCubit>();

  @override
  Widget build(BuildContext context) {
    var h = AppMediaQuery.height(context: context);
    return BlocConsumer<ClinicsCubit, ClinicsState>(
      listener: (context, ClinicsState state) {},
      builder: (context, ClinicsState state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('اختر عيادتك'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      di.sl<SharedPrefrencesHelper>().clearData().then((value) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.loginScreen, (route) => false);
                      });
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(h * 0.02),
              child: Column(
                children: [
                  defaultSearch(
                    onChange: (value) => cubit.searchClinic(value: value),
                    hint: 'بحث',
                    type: TextInputType.name,
                    action: TextInputAction.done,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Expanded(
                    child: state is ClinicsErrorState
                        ? const Center(child: Text(AppString.errorServer))
                        : ConditionalBuilder(
                            condition: state is ClinicsSuccessState &&
                                cubit.listClinics != null,
                            builder: (context) {
                              return cubit.listClinics!.isEmpty
                                  ? const Center(child: Text('لا توجد عيادات'))
                                  : ListView.separated(
                                      itemBuilder: (context, index) {
                                        return BuildItemClinic(
                                            cubit: cubit
                                                .filterListClinics![index]);
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemCount:
                                          cubit.filterListClinics!.length);
                            },
                            fallback: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
