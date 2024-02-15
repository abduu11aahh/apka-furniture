import 'package:Apka_Furniture/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:Apka_Furniture/presentation/cart_screen/cart_screen.dart';
import 'package:Apka_Furniture/presentation/user_home_screen/user_home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/cartBloc/cart_cubit.dart';
import 'package:Apka_Furniture/bloc/cartBloc/cart_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cart_screen_one_page/widgets/cartscreenone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';
import 'package:Apka_Furniture/presentation/cart_screen_dialog/cart_screen_dialog.dart';

class CartScreenOnePage extends StatefulWidget {
  const CartScreenOnePage({Key? key}) : super(key: key);

  @override
  CartScreenOnePageState createState() => CartScreenOnePageState();
}

class CartScreenOnePageState extends State<CartScreenOnePage>
    with AutomaticKeepAliveClientMixin<CartScreenOnePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillWhiteA,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.h),
          // child: Column(children: [
          //   _buildCartScreenOne(context),
          //   SizedBox(height: 35.v),
          //   _buildGetQuoteButton(context),
          // ])

          child: Stack(
            children: [
              _buildCartScreenOne(context),
              Positioned(
                bottom: 40.v, // Adjust the position as needed
                left: 0,
                right: 0,
                child: _buildGetQuoteButton(context),
              ),
            ],
          ),
        ));
  }

  /// Section Widget
  Widget _buildCartScreenOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 120.v),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.v);
              },
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return CartscreenoneItemWidget(
                    cartItem: state.cartItems[index]);
              });
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildGetQuoteButton(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state.status == QuoteStatus.success) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text("Quote added successfully!"),
          //     backgroundColor: Colors.green,
          //   ),
          // );
          //context.read<BottomBarCubit>().setCurrentTab(0, UserHomeScreen());
          Fluttertoast.showToast(
            msg: "Quote added Successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 13.0,
          );
          // context
          //     .read<BottomBarCubit>()
          //     .setCurrentTab(1, CartScreen(initialTabIndex: 1));
        }
        if (state.status == QuoteStatus.error) {
          // Fluttertoast.showToast(
          //   msg: "Error adding Quote!",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.BOTTOM,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Something goes wrong! Please check your internet connection and Try Again!"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        if (state.status == QuoteStatus.loading) {
          return SizedBox(
              width: 150.h,
              height: 80.v,
              child: Center(child: CircularProgressIndicator()));
        } else {
          return CustomElevatedButton(
            text: "Get Quote",
            isDisabled: !cartCubit.hasMoreThanOneItem,
            margin: EdgeInsets.only(left: 6.h, right: 5.h),
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.white,
            ),
            onPressed: () {
              onTapGetQuoteButton(context);
            },
          );
        }
      },
    );
  }

  /// Displays a dialog with the [CartScreenDialog] content.
  onTapGetQuoteButton(BuildContext context) {
    String token = context.read<AuthCubit>().getToken();

    if (token != '') {
      context.read<CartCubit>().addQuote(token);
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: CartScreenDialog(),
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.only(left: 0),
              ));
    }
  }
}
