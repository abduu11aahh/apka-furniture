import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/BidBloc/bid_cubit.dart';
import 'package:Apka_Furniture/bloc/BidBloc/bid_state.dart';
import '../bidding_screen_one_page_seller/widgets/biddingscreenone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';

class BiddingScreenSellerOnePage extends StatefulWidget {
  const BiddingScreenSellerOnePage({Key? key}) : super(key: key);

  @override
  BiddingScreenThreePageState createState() => BiddingScreenThreePageState();
}

class BiddingScreenThreePageState extends State<BiddingScreenSellerOnePage>
    with AutomaticKeepAliveClientMixin<BiddingScreenSellerOnePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    String token = context.read<AuthCubit>().getToken();
    context.read<BidCubit>().getBidBySeller(token);
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillWhiteA,
        child: Column(children: [
          SizedBox(height: 30.v),
          BlocBuilder<BidCubit, BidState>(
            builder: (context, state) {
              if (state is BidbySellerLoadingState) {
                return CircularProgressIndicator();
              }
              return _buildBiddingScreenThree(context);
            },
          )
        ]));
  }

  /// Section Widget
  Widget _buildBiddingScreenThree(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BidCubit, BidState>(
        builder: (context, state) {
          if (state is BidbySellerSuccessState) {
            if (state.bids.length > 0) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15.v);
                      },
                      itemCount: state.bids.length,
                      itemBuilder: (context, index) {
                        return BiddingscreenlistItemWidget(
                            bid: state.bids[index]);
                      }));
            } else {
              return Text('You have not bidded yet!');
            }
          } else if (state is BidbySellerErrorState) {
            return Text('${state.error}');
          } else {
            return Container();
          }
        },
      ),
    );
  }

  /// Navigates to the paymentMethodOneScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentMethodOneScreen);
  }
}
