import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'costume_list_event.dart';
part 'costume_list_state.dart';

class CostumeListBloc extends Bloc<CostumeListEvent, CostumeListState> {
  CostumeListBloc() : super(CostumeListInitial());

  @override
  Stream<CostumeListState> mapEventToState(
    CostumeListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
