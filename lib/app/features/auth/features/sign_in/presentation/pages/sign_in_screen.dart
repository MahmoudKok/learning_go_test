import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:learning_go_test/src/core/extensions/custom_extensions/auth_extensions/request_extension.dart';
import 'package:learning_go_test/src/core/layouts/app_messages.dart';
import 'package:learning_go_test/src/core/router/app_router.dart';
import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:learning_go_test/src/resources/assets_manager.dart';
import '../../../../../../../src/core/di/service_locator.dart';
import '../../../../../../../src/resources/color_provider.dart';
import '../bloc/sign_in_bloc.dart';

// Assumes your size extensions .sw .sh .w .h .r .sp are globally available.

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorProvider = ColorProvider();

    return BlocProvider(
      create: (_) => sl<SignInBloc>(),
      child: Scaffold(
        backgroundColor: colorProvider.background,
        body: Stack(
          children: [
            // blobs background
            Positioned(
              top: -120,
              right: -100,
              child: _Blob(
                size: 280,
                colors: [colorProvider.primary, colorProvider.green],
              ),
            ),
            Positioned(
              bottom: -160,
              left: -120,
              child: _Blob(
                size: 340,
                colors: [colorProvider.green, colorProvider.primary],
              ),
            ),

            // form
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      AppImages.appSlug.asImageAssets(
                        width: 100.w,

                        height: 100.h,
                      ),
                      24.verticalSpace,

                      // Title
                      Text(
                        'Welcome Back',
                        style: textTheme.headlineLarge!.copyWith(
                          color: colorProvider.darkest,
                        ),
                      ),
                      24.verticalSpace,

                      // Username field
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, c) =>
                            p.params.username != c.params.username ||
                            p.usernameError != c.usernameError,
                        builder: (context, state) {
                          return TextFormField(
                            onChanged: (v) => context.read<SignInBloc>().add(
                              UsernameChangedEvent(v),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: colorProvider.grey,
                              ),
                              hintText: 'Username',
                              errorText: state.usernameDirty
                                  ? state.usernameError
                                  : null,
                              filled: true,
                              fillColor: colorProvider.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorProvider.greyStroke,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorProvider.primary,
                                  width: 1.2,
                                ),
                              ),
                            ),
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorProvider.darkest,
                            ),
                          );
                        },
                      ),
                      12.verticalSpace,

                      // Password field
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, c) =>
                            p.params.password != c.params.password ||
                            p.passwordError != c.passwordError ||
                            p.obscurePassword != c.obscurePassword,
                        builder: (context, state) {
                          return TextFormField(
                            obscureText: state.obscurePassword,
                            onChanged: (v) => context.read<SignInBloc>().add(
                              PasswordChangedEvent(v),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: colorProvider.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => context.read<SignInBloc>().add(
                                  const TogglePasswordObscureEvent(),
                                ),
                                icon: Icon(
                                  state.obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: colorProvider.grey,
                                ),
                              ),
                              hintText: 'Password',
                              errorText: state.passwordDirty
                                  ? state.passwordError
                                  : null,
                              filled: true,
                              fillColor: colorProvider.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorProvider.greyStroke,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: colorProvider.primary,
                                  width: 1.2,
                                ),
                              ),
                            ),
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorProvider.darkest,
                            ),
                          );
                        },
                      ),
                      24.verticalSpace,

                      // Submit button
                      BlocConsumer<SignInBloc, SignInState>(
                        listener: (context, state) {
                          if (state.signInState.isError) {
                            AppMessages.showError(message: state.errorMessage);
                          } else if (state.signInState.isSuccess) {
                            AppRouter.getRouter.push(AppRoutes.home);
                          }
                        },
                        buildWhen: (p, c) =>
                            p.signInState != c.signInState ||
                            p.isValid != c.isValid,
                        builder: (context, state) {
                          final isLoading = state.isSubmitting;
                          final isEnabled = state.isValid && !isLoading;

                          return GestureDetector(
                            onTap: isEnabled
                                ? () => context.read<SignInBloc>().add(
                                    const SubmitSignInEvent(),
                                  )
                                : null,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: isEnabled
                                    ? LinearGradient(
                                        colors: [
                                          colorProvider.primary,
                                          colorProvider.green,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          colorProvider.grey,
                                          colorProvider.greyStroke,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  if (isEnabled)
                                    BoxShadow(
                                      color: colorProvider.shadow,
                                      blurRadius: 14,
                                      offset: const Offset(0, 6),
                                    ),
                                ],
                              ),
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              colorProvider.onPrimary,
                                            ),
                                      ),
                                    )
                                  : Text(
                                      'Get Started',
                                      style: textTheme.titleLarge!.copyWith(
                                        color: colorProvider.onPrimary,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.colors});
  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}
