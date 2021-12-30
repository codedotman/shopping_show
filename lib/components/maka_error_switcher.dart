import 'package:flutter/material.dart';
import 'package:shopping_show/components/maka_button.dart';
import 'package:shopping_show/utils/maka_app_strings.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class ErrorSwitcher extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorSwitcher({required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return _ErrorWidget(
      onRetry: onRetry,
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const SizedBox(
            height: 10,
          ),
          Text(
            genericErrorMsg,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: textV2Colour,
                  fontSize: 18,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: textV2Colour,
                  fontSize: 12,
                ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MakaButton(
                title: retry,
                callback: onRetry,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
