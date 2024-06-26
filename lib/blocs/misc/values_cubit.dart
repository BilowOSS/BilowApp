import 'package:flutter_bloc/flutter_bloc.dart';

class ValuesCubit<T> extends Cubit<List<T>> {
  ValuesCubit(super.values);

  void addItem(T item) {
    final values = List<T>.from(state);

    values.add(item);

    emit(values);
  }

  void addAll(List<T> items) {
    final values = List<T>.from(state);

    values.addAll(items);

    emit(values);
  }

  void removeItem(T item) {
    final values = List<T>.from(state);

    values.remove(item);

    emit(values);
  }

  void updateItem(int index, T newItem) {
    if (index < 0 || index >= state.length) return;

    final values = List<T>.from(state);

    values[index] = newItem;

    emit(values);
  }

  void setItems(List<T> items) => emit(items);

  void clearItems() => emit(<T>[]);

  bool hasItem(T item) => state.contains(item);
}
