import 'package:clinic_app/src/cores/app_string.dart';
import 'package:clinic_app/src/cores/mediquery/app_mediquery.dart';
import 'package:clinic_app/src/features/clinics/domain/entities/clinic_entite.dart';
import 'package:clinic_app/src/features/doctorsByClinics/presentation/screens/doctors_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildItemClinic extends StatelessWidget {
  ClinicEntit cubit;
  BuildItemClinic({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DoctorsScreens(clinicID: cubit.id, address: cubit.address, name: cubit.name,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: AppMediaQuery.height(context: context) * 0.1,
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Container(
                      alignment: AlignmentDirectional.centerStart,
                      height: constraints.maxHeight * 0.5,
                      child: Text(
                        cubit.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      alignment: AlignmentDirectional.centerStart,
                      height: constraints.maxHeight * 0.5,
                      child: Text(
                        cubit.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
