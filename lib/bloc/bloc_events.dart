import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable{
  @override
  List<Object> get props=>[];
}

class PostFetched extends PostEvents{}