import 'package:equatable/equatable.dart';

class DoctorEntite extends Equatable {
  late int id;
  late String name;
  late String section;
  late String price;
  DoctorEntite(
    {
      required this.id,
      required this.name,
      required this.section,
      required this.price,
    }
  );
  @override
  List<Object?> get props => [id,name,section,price];
}
