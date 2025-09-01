import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/extensions/custom_extensions/auth_extensions/request_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../../../../src/resources/color_provider.dart';
import '../../../home/data/models/product_model.dart';
import '../bloc/search_products_bloc.dart';

class SearchProductsScreen extends StatelessWidget {
  const SearchProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorProvider = ColorProvider();

    return BlocProvider(
      create: (_) => sl<SearchProductsBloc>(),
      child: Scaffold(
        backgroundColor: colorProvider.background,
        appBar: AppBar(
          backgroundColor: colorProvider.white,
          elevation: 0,
          title: Text(
            'Search',
            style: textTheme.headlineLarge!.copyWith(
              color: colorProvider.darkest,
            ),
          ),
        ),
        body: Column(
          children: [
            // search field
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: _SearchField(
                textTheme: textTheme,
                colorProvider: colorProvider,
              ),
            ),
            8.verticalSpace,

            // results
            Expanded(
              child: BlocBuilder<SearchProductsBloc, SearchProductsState>(
                builder: (context, state) {
                  final isInitialLoading = state.isInitialLoading;
                  final isPaginating = state.isPaginating;

                  final products = state.products;
                  if (state.products.isEmpty && !state.requestState.isLoading) {
                    return Center(
                      child: Text(
                        'There is no products',
                        style: textTheme.displayMedium!.copyWith(
                          color: colorProvider.darkest,
                          fontSize: 16.sp,
                        ),
                      ),
                    );
                  }
                  return Stack(
                    children: [
                      NotificationListener<ScrollNotification>(
                        onNotification: (n) {
                          if (n.metrics.pixels >=
                                  n.metrics.maxScrollExtent - 120 &&
                              state.hasMore &&
                              !isPaginating &&
                              state.requestState != RequestState.loading) {
                            context.read<SearchProductsBloc>().add(
                              const SearchFetchMoreEvent(),
                            );
                          }
                          return false;
                        },
                        child: Skeletonizer(
                          enabled: isInitialLoading,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            itemCount: products.length + 1,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              if (index == products.length && state.hasMore) {
                                return _LoadingCard(
                                  textTheme: textTheme,
                                  colorProvider: colorProvider,
                                );
                              } else if (!(index == products.length)) {
                                final product = products[index];

                                return _ProductRowCard(
                                  product: product,
                                  textTheme: Theme.of(context).textTheme,
                                  colorProvider: ColorProvider(),
                                );
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                      // Loader at the bottom (not inside list)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ProductModel dummyProduct() => const ProductModel(
  //   id: 0,
  //   title: "Loading...",
  //   description: "",
  //   category: "",
  //   price: 0,
  //   discountPercentage: 0,
  //   rating: 0,
  //   stock: 0,
  //   tags: [],
  //   brand: "",
  //   sku: "",
  //   weight: 0,
  //   dimensions: Dimensions(width: 0, height: 0, depth: 0),
  //   warrantyInformation: "",
  //   shippingInformation: "",
  //   availabilityStatus: "",
  //   reviews: [],
  //   returnPolicy: "",
  //   minimumOrderQuantity: 0,
  //   meta: Meta(createdAt: "", updatedAt: "", barcode: "", qrCode: ""),
  //   thumbnail: "",
  //   images: [],
  // );
}

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
            fillColor: colorProvider.white,
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

class _ProductRowCard extends StatelessWidget {
  const _ProductRowCard({
    required this.product,
    required this.textTheme,
    required this.colorProvider,
  });

  final ProductModel product;
  final TextTheme textTheme;
  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorProvider.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorProvider.shadow,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Image.network(
              product.thumbnail,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 100,
                height: 100,
                color: colorProvider.lightGrey,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand
                  Text(
                    product.brand ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.displaySmall!.copyWith(
                      color: colorProvider.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.copyWith(
                      color: colorProvider.darkest,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price, Rating, Stock
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: textTheme.titleLarge!.copyWith(
                          color: colorProvider.primary,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorProvider.dark,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Availability
                  Text(
                    product.availabilityStatus,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.displaySmall!.copyWith(
                      color: product.stock > 0
                          ? colorProvider.green
                          : colorProvider.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
