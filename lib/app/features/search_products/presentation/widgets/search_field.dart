part of '../pages/search_products_screen.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({required this.textTheme, required this.colorProvider});
  final TextTheme textTheme;
  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      buildWhen: (p, c) =>
          p.query != c.query || p.requestState != c.requestState,
      builder: (context, state) {
        return TextField(
          onChanged: (v) => context.read<SearchProductsBloc>().add(
            SearchQueryChangedEvent(v),
          ),
          decoration: InputDecoration(
            hintText: 'Search products…',
            prefixIcon: Icon(Icons.search, color: colorProvider.grey),
            filled: true,
            fillColor: colorProvider.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: colorProvider.greyStroke),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: colorProvider.primary, width: 1.2),
            ),
          ),
          style: textTheme.bodyLarge!.copyWith(color: colorProvider.darkest),
        );
      },
    );
  }
}
