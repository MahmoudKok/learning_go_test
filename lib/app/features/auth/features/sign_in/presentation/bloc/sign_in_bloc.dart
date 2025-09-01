// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:learning_go_test/app/features/auth/features/sign_in/domain/usecases/sign_in_use_case.dart';
import 'package:learning_go_test/src/core/enums/user_auth.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:learning_go_test/src/core/services/secure_storage_servcies.dart';

import '../../../../../../../src/core/di/service_locator.dart';
import '../../../../../../../src/core/enums/general_enums.dart';
import '../../../../../../../src/logger/dev_logger.dart';
import '../../data/models/sign_in_model.dart';
import '../../domain/entities/params/sign_in_params.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@Injectable()
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final LoginUseCase _loginUseCase;
  SignInBloc(this._loginUseCase) : super(SignInState.initial()) {
    on<UsernameChangedEvent>(_onUsernameChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<TogglePasswordObscureEvent>(_onToggleObscure);
    on<ValidateFieldsEvent>(_onValidate);
    on<ResetSignInEvent>(_onReset);
    on<SubmitSignInEvent>(_onSubmit); // left empty
  }

  void _onUsernameChanged(
    UsernameChangedEvent event,
    Emitter<SignInState> emit,
  ) {
    final username = event.username.trim();
    String? error;
    if (username.isEmpty) {
      error = 'Username is required';
    } else if (username.length < 3) {
      error = 'Min 3 characters';
    }

    emit(
      state.copyWith(
        params: state.params.copyWith(username: username),
        usernameError: error,
        usernameDirty: true,
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<SignInState> emit,
  ) {
    final password = event.password;
    String? error;
    if (password.isEmpty) {
      error = 'Password is required';
    } else if (password.length < 4) {
      error = 'Min 4 characters';
    }

    emit(
      state.copyWith(
        params: state.params.copyWith(password: password),
        passwordError: error,
        passwordDirty: true,
      ),
    );
  }

  void _onToggleObscure(
    TogglePasswordObscureEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onValidate(ValidateFieldsEvent event, Emitter<SignInState> emit) {
    String? usernameError;
    String? passwordError;

    if (state.params.username.trim().isEmpty) {
      usernameError = 'Username is required';
    } else if (state.params.username.trim().length < 3) {
      usernameError = 'Min 3 characters';
    }

    if (state.params.password.isEmpty) {
      passwordError = 'Password is required';
    } else if (state.params.password.length < 4) {
      passwordError = 'Min 4 characters';
    }

    emit(
      state.copyWith(
        usernameError: usernameError,
        passwordError: passwordError,
        usernameDirty: true,
        passwordDirty: true,
      ),
    );
  }

  void _onReset(ResetSignInEvent event, Emitter<SignInState> emit) {
    emit(SignInState.initial());
  }

  Future<void> _onSubmit(
    SubmitSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(signInState: RequestState.loading));
      final result = await _loginUseCase(state.params);
      await result.fold(
        (left) async {
          emit(
            state.copyWith(
              signInState: RequestState.error,
              errorMessage: left.errorResponse.message,
            ),
          );

          await Future.delayed(const Duration(seconds: 2));
          emit(
            state.copyWith(signInState: RequestState.init, errorMessage: null),
          );
        },
        (right) async {
          await sl<SecureStorageServices>().saveTokens(
            accessToken: right.accessToken ?? 'INVALID_TOKEN',
            refreshToken: right.accessToken ?? 'INVALID_REFRESH_TOKEN',
          );
          await sl<LocalStorage>().saveUserSettings(
            sl<LocalStorage>().userSettings.copyWith(
              userAuth: UserAuth.authorized,
            ),
          );
          emit(state.copyWith(signInState: RequestState.success));
        },
      );
    } catch (e) {
      Dev.logError(e);
      emit(state.copyWith(signInState: RequestState.error));
    }
  }
}
