// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class ValueCubit<T> extends Cubit<T> {
  ValueCubit(super.value) : _value = value;

  T _value;

  set value(T value) {
    if (value != _value) {
      _value = value;
      emit(value);
    }
  }
}
