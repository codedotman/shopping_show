import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_show/components/maka_error_switcher.dart';
import 'package:shopping_show/components/maka_images.dart';
import 'package:shopping_show/components/maka_no_data.dart';

enum PageState { loading, loaded, noData, error }

class MakaPageStateWidget extends StatelessWidget {
  final PageState pageState;
  final WidgetBuilder builder;
  final WidgetBuilder? noDataBuilder;
  final VoidCallback onRetry;
  final String noDataMessage;

  const MakaPageStateWidget(
      {required this.pageState,
      required this.builder,
      this.noDataBuilder,
      required this.onRetry,
      required this.noDataMessage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget pageBody = const SizedBox.shrink();
    switch (pageState) {
      case PageState.loading:
        pageBody = Lottie.asset(MakaImages.loadingLottie);
        break;
      case PageState.loaded:
        pageBody = Builder(builder: builder);
        break;
      case PageState.error:
        pageBody = ErrorSwitcher(
          onRetry: onRetry,
        );
        break;
      case PageState.noData:
        if (noDataBuilder != null) {
          pageBody = Builder(builder: noDataBuilder!);
        } else {
          pageBody = MakaNoData(noDataMessage);
        }

        break;
    }

    return pageBody;
  }
}
