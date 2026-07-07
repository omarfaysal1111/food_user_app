import 'package:equatable/equatable.dart';

class Modifier extends Equatable {
  final String id;
  final String name;
  final List<Map<String, dynamic>> options;

  const Modifier({required this.id, required this.name, required this.options});

  @override
  List<Object?> get props => [id, name, options];
}
