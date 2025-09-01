import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_go_test/app/features/profile/data/models/user_model.dart';
import 'package:learning_go_test/src/core/architecture/base_usecase.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:learning_go_test/src/core/services/secure_storage_servcies.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../domain/usecases/get_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@Injectable()
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc(this._getProfileUseCase) : super(const ProfileState()) {
    on<GetProfileEvent>(_onGetProfile);
    on<LogoutUserEvent>(_logoutUser);
  }

  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _getProfileUseCase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.errorResponse.message,
        ),
      ),
      (user) =>
          emit(state.copyWith(requestState: RequestState.success, user: user)),
    );
  }

  Future<void> _logoutUser(
    LogoutUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await sl<LocalStorage>().deleteUserInfoLocalStorage();
    await sl<SecureStorageServices>().clear();
    emit(state.copyWith(logoutState: RequestState.success));
  }
}
