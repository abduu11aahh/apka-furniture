import '../bidding_screen_two_page/widgets/biddingscreenlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';

// ignore_for_file: must_be_immutable
class BiddingScreenSellerTwoPage extends StatefulWidget {
  const BiddingScreenSellerTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  BiddingScreenSellerTwoPageState createState() =>
      BiddingScreenSellerTwoPageState();
}

class BiddingScreenSellerTwoPageState extends State<BiddingScreenSellerTwoPage>
    with AutomaticKeepAliveClientMixin<BiddingScreenSellerTwoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Column(
        children: [
          SizedBox(height: 25.v),
          _buildBiddingScreenList(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBiddingScreenList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.v),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 15.v,
            );
          },
          //itemCount: 1,
          itemCount: 0,
          itemBuilder: (context, index) {
            return BiddingscreenlistItemWidget();
          },
        ),
      ),
    );
  }
}
