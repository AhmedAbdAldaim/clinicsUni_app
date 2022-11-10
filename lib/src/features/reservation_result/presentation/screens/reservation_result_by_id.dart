import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/app_string.dart';
import '../../../../cores/components/components.dart';
import '../../../../cores/mediquery/app_mediquery.dart';
import '../cubit/reservation_result_cubit.dart';

class ReservationResultByIdScreen extends StatelessWidget {
  late int id;
  ReservationResultByIdScreen({super.key, required this.id});
  var cubit = di.sl<ReservationResultCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getAllReservationResultByIDFun(id: id),
      child: BlocBuilder<ReservationResultCubit, ReservationResultState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('نتيجة الفحص'),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is ReservationResultByIDError
                    ? const Center(
                        child: Text(AppString.errorServer),
                      )
                    : ConditionalBuilder(
                        condition: state is ReservationResultByIDSuccess &&
                            cubit.listbyid != null,
                        builder: (context) {
                          return cubit.list!.isEmpty
                              ? const Center(
                                  child: Text('خالية'),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return defaultListTitle(
                                        title: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'الحالة :',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit.listbyid![index]
                                                .sickModel!.status),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            const Text(
                                              'شركة التأمين :',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit
                                                .listbyid![index].companyname!),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            const Text(
                                              'نوع الشركة :',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit.listbyid![index].type!),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            const Text(
                                              ' السعر:',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit.listbyid![index].price!),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            const Text(
                                              'السعر بعد التخفيض:',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit
                                                .listbyid![index].discount!),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            const Text(
                                              'الادوية :',
                                              style: TextStyle(
                                                  color: Colors.deepPurple),
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit.listbyid![index]
                                                .sickModel!.drug),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            Text('ملاحظات  :',
                                                style: TextStyle(
                                                    color: Colors.deepPurple)),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.01,
                                            ),
                                            Text(cubit.listbyid![index]
                                                .sickModel!.note),
                                          ],
                                        ),
                                      ),
                                    ));
                                  },
                                  separatorBuilder: (context, indx) => SizedBox(
                                        height: AppMediaQuery.height(
                                                context: context) *
                                            0.01,
                                      ),
                                  itemCount: cubit.listbyid!.length);
                        },
                        fallback: (context) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )),
              ),
            ),
          );
        },
      ),
    );
  }
}
