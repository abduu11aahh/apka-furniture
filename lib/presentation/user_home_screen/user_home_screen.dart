import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/cartBloc/cart_cubit.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_cubit.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_state.dart';
import 'package:Apka_Furniture/data/models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../user_home_screen/widgets/mask_item_widget.dart';
import 'widgets/category_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class UserHomeScreen extends StatefulWidget {
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  static bool _isInitialized = false;
  @override
  void initState() {
    super.initState();
    if (!_isInitialized) {
      context.read<ProductCubit>().fetchProducts();
      _isInitialized = true;
    }

    // BlocListener<ProductCubit, ProductState>(listener: (context, state) {
    //   if (state is ProductFetchSuccessState && state.products.length > 0) {
    //   } else {
    //     context.read<ProductCubit>().fetchProducts();
    //   }
    // });
    //context.read<ProductCubit>().fetchProducts();
  }

  int sliderIndex = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //context.read<ProductCubit>().fetchProducts();
    mediaQueryData = MediaQuery.of(context);
    String token = context.read<AuthCubit>().getToken();
    String name = 'Guest';
    if (token != '') {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      name = decodedToken['name'];
    }
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context, name),
      body: SizedBox(
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(height: 20.v),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildExploreNow(context),
                              SizedBox(height: 20.v),
                              Text("Categories",
                                  style: theme.textTheme.titleLarge),
                              SizedBox(height: 15.v),
                              _buildCategory(context),
                              SizedBox(height: 16.v),
                              InkWell(
                                onTap: () {
                                  context.read<ProductCubit>().fetchProducts();
                                },
                                child: Text("Featured Items",
                                    style: theme.textTheme.titleLarge),
                              ),
                              SizedBox(height: 17.v),
                              BlocBuilder<ProductCubit, ProductState>(
                                builder: (context, state) {
                                  if (state is ProductFetchLoadingState) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state
                                      is ProductFetchSuccessState) {
                                    return _buildFeatureItems(
                                        context, state.products);
                                  } else if (state is ProductFetchErrorState) {
                                    return Center(
                                      child:
                                          //Text('Error: ${state.errorMessage}'),
                                          Text(
                                              'Please check your internet connection!'),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                              SizedBox(height: 10.v),
                              // _buildFortySeven(context)
                            ]))))
          ])),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context, String name) {
    return AppBar(
        leadingWidth: 60.h,
        toolbarHeight: 80.v,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.h, top: 5.v, bottom: 5.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgEllipse2,
            height: 45.adaptSize,
            width: 45.adaptSize,
            fit: BoxFit.contain,
            radius: BorderRadius.circular(
              22.h,
            ),
          ),
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Welcome,",
            style: theme.textTheme.bodyMedium,
          ),
          Text("$name", style: theme.textTheme.titleLarge),
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 24.h, top: 10.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgOffer,
              height: 23.adaptSize,
              width: 23.adaptSize,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.h, top: 10.v, right: 15.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgNotification,
              height: 23.adaptSize,
              width: 23.adaptSize,
              fit: BoxFit.contain,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationScreen);
              },
            ),
          ),
        ]);
  }

  /// Section Widget
  Widget _buildExploreNow(BuildContext context) {
    return SizedBox(
        height: 154.v,
        width: 330.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                  height: 154.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    sliderIndex = index;
                  }),
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return MaskItemWidget();
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 3.v,
                  margin: EdgeInsets.only(bottom: 10.v),
                  child: AnimatedSmoothIndicator(
                      activeIndex: sliderIndex,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                          spacing: 4,
                          activeDotColor: appTheme.white,
                          dotColor: appTheme.whiteA700.withOpacity(0.53),
                          dotHeight: 3.v,
                          dotWidth: 15.h))))
        ]));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 72.v,
        child: ListView(
          padding: EdgeInsets.only(
            right: 22.h,
          ),
          scrollDirection: Axis.horizontal,
          children: [
            CategoryWidget(
                text: "Bed",
                imagePath: ImageConstant.imgPngegg31,
                color: Colors.cyan,
                onTapView: () {
                  onTapView('Bed');
                }),
            CategoryWidget(
                text: "Chair",
                imagePath: ImageConstant.chair,
                color: Colors.yellow,
                onTapView: () {
                  onTapView('Chair');
                }),
            CategoryWidget(
                text: "Sofa",
                imagePath: ImageConstant.sofa,
                color: Colors.orange,
                onTapView: () {
                  onTapView('Sofa');
                }),
            CategoryWidget(
                text: "Table",
                imagePath: ImageConstant.imgPngegg51,
                color: Colors.lightBlue,
                onTapView: () {
                  onTapView('Table');
                }),
            CategoryWidget(
                text: "See All",
                imagePath: ImageConstant.all,
                color: appTheme.gray400,
                onTapView: () {
                  onTapView('all');
                })
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItems(BuildContext context, List<ProductModel> products) {
    return Padding(
        padding: EdgeInsets.only(right: 0.h),
        child: GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return product(context, products[index]);
          },
        ));
  }

  Widget product(BuildContext context, ProductModel product) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.itemScreen, arguments: product);
      },
      child: Container(
          margin: EdgeInsets.only(left: 0.h),
          padding: EdgeInsets.all(5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.12),
              width: 1.h,
            ),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomImageView(
                    imagePath: product.images[0],
                    height: 142.v, //142
                    width: 165.h,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(4.h)),
                SizedBox(height: 10.v),
                Container(
                    width: 129.h,
                    margin: EdgeInsets.only(left: 4.h),
                    child: Text(product.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium)),
                SizedBox(height: 10.v),
                CustomElevatedButton(
                    onPressed: () {
                      context.read<CartCubit>().addToCart(product);
                      Fluttertoast.showToast(
                        msg: "Item added to the cart",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 13.0,
                      );
                      Future.delayed(Duration(milliseconds: 500), () {
                        context.read<ProductCubit>().removeProduct(product);
                      });
                    },
                    height: 24.v,
                    width: 160.h,
                    text: "Add to Cart",
                    buttonStyle: CustomButtonStyles.fillPrimaryTL4,
                    buttonTextStyle: theme.textTheme.labelSmall
                        ?.copyWith(color: appTheme.white),
                    alignment: Alignment.center),

                //SizedBox(height: 4.v)
              ])),
    );
  }

  /// Navigates to the orderScreenOneScreen when the action is triggered.
  onTapView(String category) {
    //Navigator.pushNamed(context, AppRoutes.orderScreenOneScreen);
    if (category == 'all') {
      context.read<ProductCubit>().fetchProducts();
    } else {
      context.read<ProductCubit>().fetchProducts(category: category);
    }
  }

  /// Navigates to the notificationScreenOneContainerScreen when the action is triggered.

  /// Navigates to the itemScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.itemScreen);
  }
}
