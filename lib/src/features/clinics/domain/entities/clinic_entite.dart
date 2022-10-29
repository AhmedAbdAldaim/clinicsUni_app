import 'package:equatable/equatable.dart';

class ClinicEntit extends Equatable {
  late int id;
  late String name;
  late String address;

  //constractour
  ClinicEntit({required this.id, required this.name, required this.address});
  
  @override
  List<Object?> get props => [id , name , address];


}
