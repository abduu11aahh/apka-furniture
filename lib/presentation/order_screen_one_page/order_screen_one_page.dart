import 'package:Apka_Furniture/bloc/QuoteBloc/bed_quote_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_state.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../order_screen_one_page/widgets/orderscreen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/presentation/order_screen_two_dialog/order_screen_two_dialog.dart';

class OrderScreenOnePage extends StatefulWidget {
  const OrderScreenOnePage({Key? key}) : super(key: key);

  @override
  OrderScreenPageState createState() => OrderScreenPageState();
}

class OrderScreenPageState extends State<OrderScreenOnePage>
    with AutomaticKeepAliveClientMixin<OrderScreenOnePage> {
  @override
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();
  bool _showTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }
  // @override
  // void initState() {
  //   super.initState();
  //   String token = context.read<AuthCubit>().getToken();
  //   context.read<QuoteCubit>().getQuotesByCategory('Bed', token);
  // }

  @override
  Widget build(BuildContext context) {
    // context.read<QuoteCubit>().getQuotesByCategory('Bed', token);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
              children: [SizedBox(height: 20.v), _buildOrderScreen(context)])),
      floatingActionButton: _showTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Icon(Icons.arrow_upward, color: Colors.white)),
            )
          : null,
    ));
  }

  /// Section Widget
  Widget _buildOrderScreen(BuildContext context) {
    String token = context.read<AuthCubit>().getToken();
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: BlocBuilder<BedQuoteCubit, QuoteBedState>(
              builder: (context, state) {
                if (state is BedQuoteSuccessState) {
                  return LazyLoadScrollView(
                    onEndOfPage: () {
                      context.read<BedQuoteCubit>().getTenQuotes(token);
                    },
                    scrollOffset: 70,
                    child: state.bedQuotes.length > 0
                        ? ListView.separated(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15.v);
                            },
                            itemCount: state.bedQuotes.length,
                            itemBuilder: (context, index) {
                              return OrderscreenItemWidget(
                                quote: state.bedQuotes[index],
                                onTapBidButton: () {
                                  onTapBidButton(
                                      context, state.bedQuotes[index]);
                                },
                              );
                            },
                          )
                        : Text(
                            'There are not any orders of this category yet!'),
                  );
                } else if (state is BedQuoteErrorState) {
                  return Text('${state.error}');
                } else if (state is BedQuoteLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(child: Text('kksks'));
                }
              },
            )));
  }

  void _handleScroll() {
    if (_scrollController.offset >= 100 && !_showTopButton) {
      //print('helllloooooooooo');
      setState(() {
        _showTopButton = true;
      });
    } else if (_scrollController.offset < 100 && _showTopButton) {
      setState(() {
        _showTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
