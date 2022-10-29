import 'package:equatable/equatable.dart';

class CompanyEntite extends Equatable {
  late int id;
  late String name;
  late String phone;
  late String address;
  late String discount;
  late String type;
  
  CompanyEntite({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.discount,
    required this.type,
  });
  
  @override
  List<Object?> get props => [id, name, phone, address, discount, type];

}
