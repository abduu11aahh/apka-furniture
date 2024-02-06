import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/QuoteBloc/quote_cubit.dart';
import 'package:frontend/bloc/QuoteBloc/quote_state.dart';
import 'package:frontend/data/models/quote_model.dart';
import '../order_screen_three_page/widgets/orderscreen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/presentation/order_screen_two_dialog/order_screen_two_dialog.dart';

class OrderScreenThreePage extends StatefulWidget {
  const OrderScreenThreePage({Key? key}) : super(key: key);

  @override
  OrderScreenPageState createState() => OrderScreenPageState();
}

class OrderScreenPageState extends State<OrderScreenThreePage>
    with AutomaticKeepAliveClientMixin<OrderScreenThreePage> {
  @override
  bool get wantKeepAlive => true;
  // @override
  // void initState() {
  //   super.initState();
  //   String token = context.read<AuthCubit>().getToken();
  //   context.read<QuoteCubit>().getQuotesByCategory('Table', token);
  // }

  @override
  Widget build(BuildContext context) {
    String token = context.read<AuthCubit>().getToken();
    context.read<QuoteCubit>().getQuotesByCategory('Table', token);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  BlocBuilder<QuoteCubit, QuoteState>(
                    builder: (context, state) {
                      if (state is QuoteLoadingState) {
                        return CircularProgressIndicator();
                      }
                      return _buildOrderScreen(context);
                    },
                  )
                ]))));
  }

  /// Section Widget
  Widget _buildOrderScreen(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: BlocBuilder<QuoteCubit, QuoteState>(
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
                          return OrderscreenItemWidget(
                            quote: state.quotes[index],
                            onTapBidButton: () {
                              onTapBidButton(context, state.quotes[index]);
                            },
                          );
                        });
                  } else {
                    return Text(
                        'There are not any orders of this category yet!');
                  }
                } else if (state is QuoteErrorState) {
                  return Text('${state.error}');
                } else {
                  return Container();
                }
              },
            )));
  }

  /// Displays a dialog with the [OrderScreenTwoDialog] content.
  onTapBidButton(BuildContext context, QuoteModel quote) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: OrderScreenTwoDialog(quote: quote),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
