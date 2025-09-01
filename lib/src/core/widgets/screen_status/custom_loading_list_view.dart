import 'package:learning_go_test/src/core/enums/roundnes_level.dart';
import 'package:learning_go_test/src/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../src/resources/color_provider.dart';
import '../../../../../../src/core/helpers/skeletonizer_skeltones/skeletonizer_layouts.dart';

class CustomLoadingScreenListView extends StatelessWidget {
  const CustomLoadingScreenListView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = ColorProvider();

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: colorProvider.grey.withAlpha(125),
        highlightColor: colorProvider.grey.withAlpha(50),
        duration: const Duration(seconds: 2),
      ),
      enabled: true,
      containersColor: colorProvider.grey,
      child: Column(
        children: [
          24.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SkeletonizerContainer(
                height: 80.h,
                width: 1.sw,
                roundnessLevel: RoundnessLevel.low,
                child: const ShimmerLoadingCard(),
              ).symmetricPadding(vertical: 4.sp);
            },
          ),
          // const TotalNumberOfShowedItemCard(),
          24.verticalSpace,
        ],
      ).symmetricPadding(horizontal: 20.sp),
    );
  }
}

class SearchFiltersSectionLoading extends StatelessWidget {
  const SearchFiltersSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = ColorProvider();
    return Center(
      child: Skeleton.shade(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Container(
              width: 0.25.sw,
              height: 30.0.h,
              decoration: BoxDecoration(
                color: colorProvider.grey.withAlpha(100),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            const Spacer(flex: 2),
            Container(
              width: 40.w,
              height: 40.0.h,
              decoration: BoxDecoration(
                color: colorProvider.grey.withAlpha(100),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
          ],
        ).symmetricPadding(horizontal: 12.w),
      ),
    );
  }
}

class ShimmerLoadingCard extends StatelessWidget {
  const ShimmerLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = ColorProvider();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.0.h,
            decoration: BoxDecoration(
              color: colorProvider.grey.withAlpha(100),
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(2, (index) {
              return SkeletonizerContainer(
                color: colorProvider.grey.withAlpha(150),
                height: 20.h,
                width: 0.22.sw,
                roundnessLevel: RoundnessLevel.medium,
              ).symmetricPadding(horizontal: 16.sp);
            }),
          ),
          const Spacer(flex: 3),
        ],
      ).symmetricPadding(horizontal: 12.w),
    );
  }
}

class TotalNumberOfShowedItemCard extends StatelessWidget {
  const TotalNumberOfShowedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = ColorProvider();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SkeletonizerContainer(
          color: colorProvider.grey.withAlpha(150),
          height: 20.h,
          width: 0.35.sw,
          roundnessLevel: RoundnessLevel.medium,
        ),
        const Spacer(),
        SkeletonizerCircle(color: colorProvider.grey.withAlpha(150)),
        8.horizontalSpace,
        SkeletonizerCircle(color: colorProvider.grey.withAlpha(150)),
      ],
    ).symmetricPadding(horizontal: 12.w);
  }
}
