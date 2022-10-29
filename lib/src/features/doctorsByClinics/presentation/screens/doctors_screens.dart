import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/doctorsByClinics/presentation/cubit/doctorsbyclinics_cubit.dart';
import 'package:clinic_app/src/features/reservation/presentation/screens/reservation_screens.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

import '../../../../cores/app_string.dart';
import '../../../../cores/components/components.dart';

class DoctorsScreens extends StatelessWidget {
  int? clinicID;
  String? name;
  String? address;
  DoctorsScreens({super.key, this.clinicID, this.name, this.address});
  var cubit = di.sl<DoctorsbyclinicsCubit>();
  @override
  Widget build(BuildContext context) {
    var h = AppMediaQuery.height(context: context);
    var w = AppMediaQuery.width(context: context);

    return Builder(builder: (context) {
      cubit.getAllDocByClinics(id: clinicID!);
      return BlocConsumer<DoctorsbyclinicsCubit, DoctorsbyclinicsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('اختر طبيك'),
                  centerTitle: true,
                ),
                body: Padding(
                  padding: EdgeInsets.all(h * 0.02),
                  child: Column(
                    children: [
                      defaultSearch(
                        onChange: (value) => cubit.searchDoc(value: value),
                        hint: 'بحث عن طبيب او تخصص او سعر',
                        type: TextInputType.name,
                        action: TextInputAction.done,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Expanded(
                        child: state is DoctorsbyclinicsErrorsState
                            ? const Center(child: Text(AppString.errorServer))
                            : ConditionalBuilder(
                                condition:
                                    state is DoctorsbyclinicsSuccesState &&
                                        cubit.listDoctors != null,
                                builder: (context) {
                                  return cubit.listDoctors!.isEmpty
                                      ? const Center(
                                          child: Text('لا يوجد اطباء'))
                                      : ListView.separated(
                                          itemBuilder: (context, index) {
                                            return Card(
                                              child: ListTile(
                                                isThreeLine: true,
                                                title: Text(cubit
                                                    .filterlistDoctors![index]
                                                    .name),
                                                contentPadding:
                                                    EdgeInsets.all(w * 0.02),
                                                subtitle: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: w * 0.02),
                                                  child: Text(cubit
                                                          .filterlistDoctors![
                                                              index]
                                                          .price +
                                                      " جنيه سوداني "),
                                                ),
                                                leading: Card(
                                                  color: Colors.amber,
                                                  child: Text(cubit
                                                      .filterlistDoctors![index]
                                                      .section),
                                                ),
                                                trailing: defaultButton(
                                                    context: context,
                                                    title: 'طلب حجز',
                                                    colorTitle: Colors.white,
                                                    colorBtn:
                                                        Colors.red.shade900,
                                                    onPressed: () {
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (_) => ReservationScreen(
                                                              name: name,
                                                              address: address,
                                                              nameDoc: cubit.filterlistDoctors![
                                                                      index]
                                                                  .name,
                                                              price: cubit
                                                                  .filterlistDoctors![
                                                                      index]
                                                                  .price,
                                                               doctorId: cubit.filterlistDoctors![index].id,   
                                                              section: cubit
                                                                  .filterlistDoctors![
                                                                      index]
                                                                  .section)));
                                                    }),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              Divider(),
                                          itemCount:
                                              cubit.filterlistDoctors!.length);
                                },
                                fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
