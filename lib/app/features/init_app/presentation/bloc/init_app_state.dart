part of 'init_app_bloc.dart';

class InitAppState extends Equatable {
  final UserLocalSettings userSettings; // <-- مطلوب: اسم المتغيّر userSettings

  const InitAppState({required this.userSettings});

  /// ✅ تابع ستاتيك يرجّع الـ init state
  static InitAppState initial() =>
      InitAppState(userSettings: UserLocalSettings.defaultSettings);

  InitAppState copyWith({UserLocalSettings? userSettings}) {
    return InitAppState(userSettings: userSettings ?? this.userSettings);
  }

  @override
  List<Object?> get props => [userSettings];
}
