import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/common/constants/constant.dart';
import 'package:quran_app/common/widgets/base_page.dart';
import 'package:quran_app/l10n/l10n.dart';
import 'package:quran_app/modules/home/widgets/app_title.dart';
import 'package:quran_app/modules/home/widgets/menu_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            backgroundColor: backgroundColor2,
            title: Text(
              l10n.salam,
              textDirection: TextDirection.rtl,
              style: arabicText.copyWith(color: backgroundColor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(l10n.duaForParents, style: largeText),
                  Text(
                    l10n.jazakallahKhair,
                    textDirection: TextDirection.rtl,
                    style: arabicText.copyWith(color: backgroundColor),
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.builtWithLove, style: smallText),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(l10n.close, style: smallText),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return BasePage.noPadding(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: cardGreyColor,
          onPressed: _showMyDialog,
          child: Image.asset(
            '$iconAsset/dua.png',
            height: 24,
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: MediaQuery.of(context).size.height / 6,
              ),
            ),
            const SliverToBoxAdapter(
              child: MenuList(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 3 - shrinkOffset;
    final l10n = context.l10n;
    return SizedBox(
      height: expandedHeight + expandedHeight / 1.5,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: backgroundColor2,
              centerTitle: true,
              title: const AppTitle(),
              actions: [
                GestureDetector(
                  onTap: () {
                    showInfoDialog(
                      context,
                      l10n.appName,
                      l10n.appDesc,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Icon(Icons.info_outline_rounded),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 16),
                SvgPicture.asset(
                  '$iconAsset/bismillah.svg',
                  width: 0.6.sw,
                  colorFilter:
                      ColorFilter.mode(backgroundColor, BlendMode.srcIn),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   CustomSliverDelegate({
//     required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });
//
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;
//
//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 3.5 - shrinkOffset;
//     final l10n = context.l10n;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 1.5,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//               backgroundColor: backgroundColor2,
//               centerTitle: true,
//               title: const AppTitle(),
//               actions: [
//                 GestureDetector(
//                   onTap: () {
//                     showInfoDialog(
//                       context,
//                       l10n.appName,
//                       l10n.appDesc,
//                     );
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.only(right: 24),
//                     child: Icon(Icons.info_outline_rounded),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             top: cardTopPosition > 0 ? cardTopPosition : 0,
//             bottom: 0,
//             child: const Column(
//               children: [
//                 SizedBox(height: 16),
//                 HeaderCard(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
