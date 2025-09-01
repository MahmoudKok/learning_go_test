part of '../pages/home_screen.dart';

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({required this.textTheme, required this.colorProvider});
  final TextTheme textTheme;
  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30.w,
        height: 30.h,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colorProvider.primary),
          ),
        ),
      ),
    );
  }
}
