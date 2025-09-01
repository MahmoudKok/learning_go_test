import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../../../../src/resources/color_provider.dart';
import '../bloc/product_details_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String id;
  final String thumbnail;

  const ProductDetailsScreen({
    super.key,
    required this.id,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();

    return BlocProvider(
      create: (_) => sl<ProductDetailsBloc>()..add(GetProductDetailsEvent(id)),
      child: Scaffold(
        backgroundColor: colorProvider.background,
        body: SafeArea(
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              final product = state.product;
              final isLoading = state.requestState == RequestState.loading;
              final isError = state.requestState == RequestState.error;

              final imageUrl = product?.thumbnail ?? thumbnail;

              return Skeletonizer(
                enabled: isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero + overlay + back button
                      Stack(
                        children: [
                          Hero(
                            tag: 'product_$id',
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(24.r),
                              ),
                              child: Image.network(
                                imageUrl,
                                width: 1.sw,
                                height: 0.42.sh,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorProvider.scrim.withValues(alpha: 0.25),
                                    colorProvider.scrim.withValues(alpha: 0.0),
                                    colorProvider.scrim.withValues(alpha: 0.15),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12.h,
                            left: 12.w,
                            child: Material(
                              color: colorProvider.surface.withValues(
                                alpha: 0.9,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                borderRadius: BorderRadius.circular(14.r),
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    size: 22.sp,
                                    color: colorProvider.darkest,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,

                      // Title & price
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                product?.title ?? 'Loading title...',
                                style: textTheme.headlineLarge!.copyWith(
                                  color: colorProvider.darkest,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            12.horizontalSpace,
                            Text(
                              isError
                                  ? ''
                                  : (product != null
                                        ? "\$${product.price.toStringAsFixed(2)}"
                                        : 'Loading price...'),
                              style: textTheme.titleLarge!.copyWith(
                                color: colorProvider.primary,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,

                      // Details card
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorProvider.surface,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: colorProvider.shadow,
                                blurRadius: 14.r,
                                offset: Offset(0, 8.h),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(16.w),
                          child: Builder(
                            builder: (_) {
                              if (isError) {
                                return Text(
                                  "Failed to load details",
                                  style: textTheme.titleMedium!.copyWith(
                                    color: colorProvider.red,
                                    fontSize: 14.sp,
                                  ),
                                );
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?.description ??
                                        'Loading description...',
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  12.verticalSpace,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Stock: ${product?.stock ?? 0}",
                                          style: textTheme.titleSmall!.copyWith(
                                            color: colorProvider.green,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Category: ${product?.category ?? '...'}",
                                          textAlign: TextAlign.right,
                                          style: textTheme.titleSmall!.copyWith(
                                            color: colorProvider.grey,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  12.verticalSpace,
                                  Text(
                                    "Brand: ${product?.brand ?? '...'}",
                                    style: textTheme.titleSmall!.copyWith(
                                      color: colorProvider.dark,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      24.verticalSpace,
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
