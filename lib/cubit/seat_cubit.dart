import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void reset() {
    emit([]);
  }

  void selectSeat(String id) {
    // add to list seat if it not in the list
    if (!isSelected(id)) {
      state.add(id);
    }
    // remove the seat from list
    else {
      state.remove(id);
    }
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);

    // tidak ada di list
    if (index == -1) {
      return false;
    }
    // ada di list
    else {
      return true;
    }
  }
}
