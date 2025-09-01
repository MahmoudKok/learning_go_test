import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/extensions/custom_extensions/auth_extensions/request_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../../../../src/core/router/app_router.dart';
import '../../../../../src/resources/color_provider.dart';
import '../../../home/data/models/product_model.dart';
import '../bloc/search_products_bloc.dart';
part '../widgets/search_field.dart';
part '../widgets/product_row_card.dart';
part '../widgets/loading_card.dart';

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
          leading: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              AppRouter.getRouter.pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: colorProvider.darkest,
            ),
          ),
          backgroundColor: colorProvider.surface,
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
