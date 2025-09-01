# learning_go_test

A new Flutter project.

generate new locales for easy localization

dart run easy_localization:generate --source-dir ./assets/i18n/;dart run easy_localization:generate --source-dir ./assets/i18n -f keys -o locale_keys.g.dart

flutter pub run build_runner build --delete-conflicting-outputs
