import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_state.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import '../cart_screen_two_page/widgets/cartscreentwo_quoteditem_widget.dart';

// ignore_for_file: must_be_immutable
class CartScreenTwoPage extends StatefulWidget {
  const CartScreenTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  CartScreenTwoPageState createState() => CartScreenTwoPageState();
}

class CartScreenTwoPageState extends State<CartScreenTwoPage>
    with AutomaticKeepAliveClientMixin<CartScreenTwoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    String token = context.read<AuthCubit>().getToken();
    context.read<QuoteCubit>().getQuotesOfBuyer(token);
    if (token == '') {
      return Padding(
        padding: EdgeInsets.only(left: 30.h, top: 0.v),
        child: Text('Please Login to see your quoted items!'),
      );
    }
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillWhiteA,
        child: Padding(
          padding: EdgeInsets.only(top: 0.v),
          child: Container(child: BlocBuilder<QuoteCubit, QuoteState>(
            builder: (context, state) {
              if (state is QuoteLoadingState) {
                return SizedBox(
                    width: 150.h,
                    height: 150.v,
                    child: Center(child: CircularProgressIndicator()));
              }
              return _buildCartScreenTwo(context);
            },
          )),
        ));
  }

  Widget _buildCartScreenTwo(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
        if (state is QuoteSuccessState) {
          if (state.quotes.length > 0) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15.v);
                },
                itemCount: state.quotes.length,
                itemBuilder: (context, index) {
                  return CartscreenTwoQuotedItemWidget(
                      quote: state.quotes[index]);
                });
          } else {
            return Text('You have not quoyed yet!');
          }
        } else if (state is QuoteErrorState) {
          return Text('${state.error}');
          //return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
