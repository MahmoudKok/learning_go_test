import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/extensions/custom_extensions/auth_extensions/request_extension.dart';
import 'package:learning_go_test/src/core/router/app_router.dart';
import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:learning_go_test/src/core/widgets/defualt_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/app_theme_types.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../../../../src/logger/dev_logger.dart';
import '../../../../../src/resources/color_provider.dart';
import '../../../../../src/resources/theme_manager.dart';
import '../../../init_app/presentation/bloc/init_app_bloc.dart';
import '../../data/models/user_model.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // --- helpers ---
  String maskMiddle(String input, {int keepStart = 4, int keepEnd = 4}) {
    if (input.isEmpty) return '';
    if (input.length <= keepStart + keepEnd) return input;
    final start = input.substring(0, keepStart);
    final end = input.substring(input.length - keepEnd);
    return '$start••••••••$end';
  }

  String maskId(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) return input;
    final last4 = digits.substring(digits.length - 4);
    return '•••-••-$last4';
  }

  String formatAddress(Address? a) {
    if (a == null) return '—';
    final parts = <String>[
      if ((a.address ?? '').trim().isNotEmpty) a.address!.trim(),
      [
        if ((a.city ?? '').trim().isNotEmpty) a.city!.trim(),
        if (((a.stateCode ?? a.state) ?? '').toString().trim().isNotEmpty)
          ((a.stateCode ?? a.state)!).toString().trim(),
      ].where((e) => e.toString().isNotEmpty).join(', ').trim(),
      if ((a.postalCode ?? '').trim().isNotEmpty) a.postalCode!.trim(),
      if ((a.country ?? '').trim().isNotEmpty) a.country!.trim(),
    ].where((e) => e.trim().isNotEmpty).toList();
    return parts.isEmpty ? '—' : parts.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorProvider = ColorProvider();

    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(const GetProfileEvent()),
      child: Scaffold(
        backgroundColor: colorProvider.background,
        body: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              final isLoading = state.requestState == RequestState.loading;
              final isError = state.requestState == RequestState.error;
              final user = state.user;

              return Skeletonizer(
                enabled: isLoading,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      // top bar
                      Row(
                        children: [
                          Material(
                            color: colorProvider.surface,
                            borderRadius: BorderRadius.circular(14.r),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              borderRadius: BorderRadius.circular(14.r),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: 22.sp,
                                  color: colorProvider.darkest,
                                ),
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Profile',
                              textAlign: TextAlign.center,
                              style: textTheme.displaySmall!.copyWith(
                                color: colorProvider.darkest,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 40.w),
                          IconButton(
                            icon: Icon(
                              context
                                          .read<InitAppBloc>()
                                          .state
                                          .userSettings
                                          .theme ==
                                      AppThemeType.dark
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              color: colorProvider.darkest,
                              size: 15.sp,
                            ),
                            onPressed: () {
                              context.read<InitAppBloc>().add(
                                ChangeAppThemeEvent(),
                              );
                            },
                          ),
                        ],
                      ),
                      24.verticalSpace,

                      // header card
                      Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: colorProvider.surface,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: colorProvider.shadow,
                              blurRadius: 16.r,
                              offset: Offset(0, 10.h),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(56.r),
                              child: Image.network(
                                user?.image ??
                                    'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png',
                                width: 96.w,
                                height: 96.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              user != null
                                  ? '${user.firstName} ${user.lastName}'
                                  : 'Loading name...',
                              style: textTheme.headlineLarge!.copyWith(
                                color: colorProvider.darkest,
                                fontSize: 20.sp,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              user?.username ?? '@username',
                              style: textTheme.titleSmall!.copyWith(
                                color: colorProvider.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                            8.verticalSpace,
                            if ((user?.companyName ?? '').isNotEmpty ||
                                (user?.title ?? '').isNotEmpty)
                              Text(
                                [
                                  if ((user?.companyName ?? '').isNotEmpty)
                                    user!.companyName!,
                                  if ((user?.title ?? '').isNotEmpty)
                                    user!.title!,
                                ].join(' • '),
                                textAlign: TextAlign.center,
                                style: textTheme.titleSmall!.copyWith(
                                  color: colorProvider.dark,
                                  fontSize: 12.sp,
                                ),
                              ),
                          ],
                        ),
                      ),

                      16.verticalSpace,

                      // email / gender
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorProvider.surface,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorProvider.shadow,
                                    blurRadius: 12.r,
                                    offset: Offset(0, 8.h),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(14.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: textTheme.titleSmall!.copyWith(
                                      color: colorProvider.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    user?.email ?? 'loading@email.com',
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorProvider.surface,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorProvider.shadow,
                                    blurRadius: 12.r,
                                    offset: Offset(0, 8.h),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(14.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender',
                                    style: textTheme.titleSmall!.copyWith(
                                      color: colorProvider.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    user?.gender ?? '—',
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      16.verticalSpace,

                      // role / user agent
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorProvider.surface,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorProvider.shadow,
                                    blurRadius: 12.r,
                                    offset: Offset(0, 8.h),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(14.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Role',
                                    style: textTheme.titleSmall!.copyWith(
                                      color: colorProvider.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    user?.role ?? '—',
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorProvider.surface,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorProvider.shadow,
                                    blurRadius: 12.r,
                                    offset: Offset(0, 8.h),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(14.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Agent',
                                    style: textTheme.titleSmall!.copyWith(
                                      color: colorProvider.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    user?.userAgent ?? '—',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      16.verticalSpace,

                      // address + coordinates
                      Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: colorProvider.surface,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: colorProvider.shadow,
                              blurRadius: 12.r,
                              offset: Offset(0, 8.h),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: textTheme.titleSmall!.copyWith(
                                color: colorProvider.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              formatAddress(user?.address),
                              style: textTheme.bodyLarge!.copyWith(
                                color: colorProvider.dark,
                                fontSize: 14.sp,
                              ),
                            ),
                            if (user?.address?.coordinates != null) ...[
                              10.verticalSpace,
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 16.sp,
                                    color: colorProvider.grey,
                                  ),
                                  6.horizontalSpace,
                                  Expanded(
                                    child: Text(
                                      'Lat: ${user!.address!.coordinates!.lat?.toStringAsFixed(6) ?? '-'}, '
                                      'Lng: ${user.address!.coordinates!.lng?.toStringAsFixed(6) ?? '-'}',
                                      style: textTheme.bodyMedium!.copyWith(
                                        color: colorProvider.dark,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),

                      16.verticalSpace,

                      // identity (id + masked ein/ssn)
                      Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: colorProvider.surface,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: colorProvider.shadow,
                              blurRadius: 12.r,
                              offset: Offset(0, 8.h),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Identity',
                              style: textTheme.titleSmall!.copyWith(
                                color: colorProvider.grey,
                                fontSize: 12.sp,
                              ),
                            ),

                            8.verticalSpace,
                            Text(
                              'EIN: ${user?.ein == null || user!.ein!.trim().isEmpty ? '—' : maskId(user.ein!)}',
                              style: textTheme.bodyLarge!.copyWith(
                                color: colorProvider.dark,
                                fontSize: 14.sp,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'SSN: ${user?.ssn == null || user!.ssn!.trim().isEmpty ? '—' : maskId(user.ssn!)}',
                              style: textTheme.bodyLarge!.copyWith(
                                color: colorProvider.dark,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      16.verticalSpace,

                      // crypto
                      if (user?.crypto != null)
                        Container(
                          width: 1.sw,
                          decoration: BoxDecoration(
                            color: colorProvider.surface,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: colorProvider.shadow,
                                blurRadius: 12.r,
                                offset: Offset(0, 8.h),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Crypto',
                                style: textTheme.titleSmall!.copyWith(
                                  color: colorProvider.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                              6.verticalSpace,
                              Row(
                                children: [
                                  Icon(
                                    Icons.currency_bitcoin,
                                    size: 18.sp,
                                    color: colorProvider.dark,
                                  ),
                                  8.horizontalSpace,
                                  Expanded(
                                    child: Text(
                                      '${user!.crypto!.coin ?? '—'} • ${user.crypto!.network ?? '—'}',
                                      style: textTheme.titleMedium!.copyWith(
                                        color: colorProvider.darkest,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              8.verticalSpace,
                              Text(
                                user.crypto!.wallet == null ||
                                        user.crypto!.wallet!.trim().isEmpty
                                    ? 'Wallet: —'
                                    : 'Wallet: ${maskMiddle(user.crypto!.wallet!, keepStart: 6, keepEnd: 4)}',
                                style: textTheme.bodyLarge!.copyWith(
                                  color: colorProvider.dark,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (isError) ...[
                        16.verticalSpace,
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorProvider.red,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                      20.verticalSpace,
                      BlocListener<ProfileBloc, ProfileState>(
                        listener: (context, state) async {
                          if (state.logoutState.isSuccess) {
                            Dev.logLine('Logout');
                            await sl.reset();
                            await configurationDependencies();
                            AppRouter.getRouter.pushReplacement(
                              AppRoutes.signin,
                            );
                          }
                        },

                        child: DefaultButton(
                          onTap: () {
                            context.read<ProfileBloc>().add(LogoutUserEvent());
                          },
                          content: Text(
                            'Logout',
                            style: textTheme.displayMedium!.copyWith(
                              color: colorProvider.onPrimary,
                              fontSize: 16.sp,
                            ),
                          ),
                          backgroundColor: colorProvider.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
