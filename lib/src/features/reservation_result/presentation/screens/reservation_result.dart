import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/components/components.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/cubit/reservation_result_cubit.dart';
import 'package:clinic_app/src/features/reservation_result/presentation/screens/reservation_result_by_id.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class ReservationResultScreen extends StatelessWidget {
  ReservationResultScreen({super.key});

  var cubit = di.sl<ReservationResultCubit>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      cubit.getAllReservationResultFun();
      
      return BlocBuilder<ReservationResultCubit, ReservationResultState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('الفحوصات السابقة'),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state is ReservationResultError
                    ? const Center(
                        child: Text(AppString.errorServer),
                      )
                    : ConditionalBuilder(
                        condition: state is ReservationResultSuccess &&
                            cubit.list != null,
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
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('د .'),
                                                Expanded(
                                                    child: Text(cubit
                                                        .list![index]
                                                        .doctorModel!
                                                        .name)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'التخصص :',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple),
                                                ),
                                                Text(cubit.list![index]
                                                    .doctorModel!.section),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            Row(
                                              children: [
                                                Text('السعر  :',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.deepPurple)),
                                                Text(cubit.list![index]
                                                        .doctorModel!.price +
                                                    ' جنيه سوداني'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppMediaQuery.height(
                                                      context: context) *
                                                  0.02,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              child: defaultButton(
                                                  context: context,
                                                  title: 'النتائج',
                                                  colorTitle: Colors.white,
                                                  colorBtn: Colors.red.shade900,
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                ReservationResultByIdScreen(
                                                                    id: cubit
                                                                        .list![
                                                                            index]
                                                                        .id)));
                                                  }),
                                            )
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
                                  itemCount: cubit.list!.length);
                        },
                        fallback: (context) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )),
              ),
            ),
          );
        },
      );
    });
  }
}
