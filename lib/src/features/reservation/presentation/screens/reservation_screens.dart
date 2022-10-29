import 'package:clinic_app/src/config/app_routes.dart';
import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/components/components.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/auth/data/datasources/local/sharedprefrencese_helper.dart';
import 'package:clinic_app/src/features/reservation/presentation/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationScreen extends StatelessWidget {
  String? name;
  String? address;
  String? nameDoc;
  String? price;
  int? doctorId;
  String? section;
  ReservationScreen(
      {super.key,
      required this.name,
      required this.address,
      required this.nameDoc,
      required this.price,
      required this.doctorId,
      required this.section});
  var shared = di.sl<SharedPrefrencesHelper>();
  var cubit = di.sl<ReservationCubit>();
  @override
  Widget build(BuildContext context) {
    var w = AppMediaQuery.width(context: context);
    var h = AppMediaQuery.height(context: context);
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationErrorState) {
          defaultSnakbar(content: 'هناك خطأ ما', context: context);
        } else if (state is ReservationSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.clinicsScreen, (route) => false);
            
          defaultSnakbar(content: 'تم الطلب بنجاح',color: Colors.green.shade900 ,context: context);  
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('تفاصيل الحجز'),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(w * 0.07),
              child: Container(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم المريض :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(shared.getData(key: 'name'),
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'اسم الطبيب :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(nameDoc!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'اسم العيادة :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(name!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'اسم التخصص :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(section!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'الموقع :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(address!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Text(
                          'السعر :',
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(price! + "ج.س",
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.04,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        state is ReservationLoadingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                width: double.infinity,
                                child: defaultButton(
                                    context: context,
                                    title: 'حجز',
                                    colorTitle: Colors.white,
                                    colorBtn: Colors.deepPurple,
                                    onPressed: () {
                                      cubit.sendReservation(id: doctorId!);
                                    }),
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
