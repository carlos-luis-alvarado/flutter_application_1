


import 'package:flutter_application_1/src/domain/imputs/sing_up.dart';

abstract class SingUpRepository{
  Future<SingUpResponse> register(SingUpData data);
}
