import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/ProposalBloc/proposal_cubit.dart';
import 'package:frontend/bloc/ProposalBloc/proposal_state.dart';
import 'package:frontend/bloc/cartBloc/cart_cubit.dart';
import 'package:frontend/bloc/cartBloc/cart_state.dart';
import 'package:frontend/presentation/proposal_screen_dialog/proposal_screen_dialog.dart';

import '../bidding_screen_one_page/widgets/biddingscreenone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

class BiddingScreenOnePage extends StatefulWidget {
  const BiddingScreenOnePage({Key? key}) : super(key: key);

  @override
  BiddingScreenThreePageState createState() => BiddingScreenThreePageState();
}

class BiddingScreenThreePageState extends State<BiddingScreenOnePage>
    with AutomaticKeepAliveClientMixin<BiddingScreenOnePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    String token = context.read<AuthCubit>().getToken();
    List<int?> productIds = context.read<CartCubit>().getProductIds();
    if (token != '') {
      context.read<ProposalCubit>().getProposalforQuote(token, productIds);
    }

    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillWhiteA,
        child: Column(children: [
          SizedBox(height: 30.v),
          BlocBuilder<ProposalCubit, ProposalState>(
            builder: (context, state) {
              if (state is ProposalLoadingState) {
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
      child: BlocBuilder<ProposalCubit, ProposalState>(
        builder: (context, state) {
          if (state is ProposalSuccessState) {
            if (state.proposals.length > 0) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15.v);
                      },
                      itemCount: state.proposals.length,
                      itemBuilder: (context, index) {
                        return BiddingscreenoneItemWidget(
                            // onTapConfirm: () {
                            //   onTapConfirm(context);
                            // },
                            proposal: state.proposals[index]);
                      }));
            } else {
              return Text('You do not have any proposals yet!');
            }
          } else if (state is ProposalErrorState) {
            return Text('${state.error}');
          } else {
            return Text('Add someting in quote to get proposal!');
          }
        },
      ),
    );
  }

  /// Navigates to the paymentMethodOneScreen when the action is triggered.
  // onTapConfirm(BuildContext context) {
  //   //Navigator.pushNamed(context, AppRoutes.paymentMethodOneScreen);
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             content: ProposalScreenDialog(),
  //             backgroundColor: Colors.transparent,
  //             contentPadding: EdgeInsets.zero,
  //             insetPadding: const EdgeInsets.only(left: 0),
  //           ));
  // }
}
