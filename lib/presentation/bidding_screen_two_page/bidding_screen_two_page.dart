import '../bidding_screen_two_page/widgets/biddingscreenlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

// ignore_for_file: must_be_immutable
class BiddingScreenTwoPage extends StatefulWidget {
  const BiddingScreenTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  BiddingScreenTwoPageState createState() => BiddingScreenTwoPageState();
}

class BiddingScreenTwoPageState extends State<BiddingScreenTwoPage>
    with AutomaticKeepAliveClientMixin<BiddingScreenTwoPage> {
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return BiddingscreenlistItemWidget();
          },
        ),
      ),
    );
  }
}
