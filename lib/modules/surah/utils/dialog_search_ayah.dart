// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/common/constants/constant.dart';
import 'package:quran_app/modules/home/widgets/input_box.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void showSearchAyahDialog(
  BuildContext context,
  TextEditingController controller,
  ItemScrollController scrollController,
  int totalAyat,
) {
  // ignore: inference_failure_on_function_invocation
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: backgroundColor2,
        title: Text(
          // TODO(Alfaizkhan): use plain bcs there is problem when using context.l10n
          'Search Ayat',
          style: lightBoldTitle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Ayat: $totalAyat',
              style: smallText,
            ),
            const SizedBox(
              height: 8,
            ),
            InputBox(
              labelText: 'Which Ayat?',
              controller: controller,
              maxLength: 3,
              autofocus: true,
              keyboardType: TextInputType.number,
              formatter: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ],
        ),
        actions: <Widget>[
          OutlinedButton(
            child: Text(
              'Close',
              style: smallText,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          OutlinedButton(
            child: Text(
              'Search',
              style: smallText,
            ),
            onPressed: () {
              if (controller.value.text.isNotEmpty) {
                if (int.parse(controller.value.text) <= totalAyat) {
                  Navigator.of(context).pop();
                  scrollController.scrollTo(
                    index: int.parse(
                      controller.value.text,
                    ),
                    duration: const Duration(seconds: 1),
                  );
                } else {
                  Navigator.of(context).pop(true);
                }
              }
            },
          ),
        ],
      );
    },
  );
}
