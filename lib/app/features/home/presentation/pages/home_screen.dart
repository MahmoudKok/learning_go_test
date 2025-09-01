import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/extensions/custom_extensions/auth_extensions/request_extension.dart';
import 'package:learning_go_test/src/core/router/app_router.dart';
import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/core/enums/general_enums.dart';
import '../../../../../src/resources/color_provider.dart';
import '../../data/models/product_model.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider();
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => sl<HomeBloc>()..add(const FetchProductsEvent()),
      child: Scaffold(
        backgroundColor: colorProvider.background,
        appBar: AppBar(
          backgroundColor: colorProvider.white,
          elevation: 0,
          title: Text(
            'Products',
            style: textTheme.headlineLarge!.copyWith(
              color: colorProvider.darkest,
            ),
          ),
          leadingWidth: 0.5.sw,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  AppRouter.getRouter.push(AppRoutes.searchProducts);
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AppRouter.getRouter.push(AppRoutes.profile);
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final isInitialLoading =
                state.status == RequestState.loading && state.products.isEmpty;
            final isPaginating =
                state.status == RequestState.loading &&
                state.products.isNotEmpty &&
                state.hasMore;

            final products = state.products.isNotEmpty
                ? state.products
                : List.generate(6, (_) => dummyProduct());
            if (state.products.isEmpty && !state.status.isLoading) {
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
                    final bloc = context.read<HomeBloc>();
                    final state = bloc.state; // read it once here

                    final isPaginating =
                        state.status == RequestState.loading &&
                        state.products.isNotEmpty &&
                        state.hasMore;

                    if (n.metrics.pixels >= n.metrics.maxScrollExtent - 40 &&
                        state.hasMore &&
                        !isPaginating &&
                        state.status != RequestState.loading) {
                      bloc.add(const FetchMoreProductsEvent());
                    }
                    return false;
                  },
                  child: Skeletonizer(
                    enabled: isInitialLoading,
                    child: RefreshIndicator(
                      notificationPredicate: (notification) {
                        return true;
                      },
                      onRefresh: () async {
                        context.read<HomeBloc>().add(
                          const FetchProductsEvent(),
                        );
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 10,
                        ),
                        itemCount: products.length + 1,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          if (index == products.length && state.hasMore) {
                            return _LoadingCard(
                              colorProvider: colorProvider,
                              textTheme: textTheme,
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
                ),

                // Loader at the bottom (not inside list)
              ],
            );
          },
        ),
      ),
    );
  }

  ProductModel dummyProduct() => const ProductModel(
    id: 0,
    title: "Loading...",
    description: "",
    category: "",
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    tags: [],
    brand: "",
    sku: "",
    weight: 0,
    dimensions: Dimensions(width: 0, height: 0, depth: 0),
    warrantyInformation: "",
    shippingInformation: "",
    availabilityStatus: "",
    reviews: [],
    returnPolicy: "",
    minimumOrderQuantity: 0,
    meta: Meta(createdAt: "", updatedAt: "", barcode: "", qrCode: ""),
    thumbnail: "",
    images: [],
  );
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
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        AppRouter.getRouter.push(
          AppRoutes.productDetails,
          extra: {'id': product.id, "thumbnail": product.thumbnail},
        );
      },
      child: Container(
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
            Hero(
              tag: "product_${product.id}",
              child: ClipRRect(
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
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 2,
                ),
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
