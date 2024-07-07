// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit({bool initialState = false}) : super(initialState);

  void toggle() => emit(!state);
}
