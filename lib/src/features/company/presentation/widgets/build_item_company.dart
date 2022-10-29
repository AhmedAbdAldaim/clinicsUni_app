import 'package:clinic_app/src/cores/components/components.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/company/presentation/cubit/company_cubit.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/dependency_injection.dart' as di;

class BuildItemCompany extends StatelessWidget {
  int index;
  var cubit = di.sl<CompanyCubit>();
  BuildItemCompany({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = AppMediaQuery.width(context: context);
    return RadioListTile<int>(
      title: Text(
        cubit.listCompany![index].name,
        style: TextStyle(fontSize: w * 0.04),
      ),
      subtitle: Text(
        cubit.listCompany![index].phone,
        style: TextStyle(fontSize: w * 0.03),
      ),
    
      groupValue: cubit.values,
      onChanged: (val) {
        cubit.select(val);
      },
      value: cubit.listCompany![index].id,
    );
  }
}
