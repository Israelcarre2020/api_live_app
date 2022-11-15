import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/chuck_model.dart';
import '../../domain/use_cases/get_chuck_use_case.dart';

part 'chuck_state.dart';
part 'chuck_cubit.freezed.dart';

class ChuckCubit extends Cubit<ChuckState> {
  final GetChuckUseCase _getChuckUseCase;

  ChuckCubit({required GetChuckUseCase getChuckUseCase})
      : _getChuckUseCase = getChuckUseCase,
        super(const ChuckState.initial());

  Future<void> getChuckList(int chucksAmount) async {
    emit(const ChuckState.loading());

    final chuckList = <ChuckModel>[];

    try {
      for (var i = 0; i < chucksAmount; i++) {
        final chuck = await _getChuckUseCase(null);
        chuckList.add(chuck);
      }
      emit(ChuckState.loadedChucks(chuckList));
    } on DioError catch (e) {
      emit(ChuckState.error(e.message));
    } catch (e) {
      emit(const ChuckState.error('Unhandled Error!'));
    }
  }
}
