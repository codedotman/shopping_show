import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_show/components/maka_page_state_widget.dart';

class MakaScaffold extends StatefulWidget {
  /// Extras:
  ///  - Handles different [PageState] widgets using `state`
  const MakaScaffold(
      {Key? key,
      this.scaffoldKey,
      this.appBar,
      required this.builder,
      this.noDataBuilder,
      this.floatingActionButton,
      this.backgroundColor = Colors.white,
      this.resizeToAvoidBottomInset = true,
      required this.state,
      this.disablePointer = false,
      this.forceAppBar = false,
      this.extendBodyBehindAppBar = false,
      this.disablePopOnBackIfLoading = false,
      this.padding})
      : super(key: key);

  final Key? scaffoldKey;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final WidgetBuilder builder;
  final WidgetBuilder? noDataBuilder;
  final Widget? floatingActionButton;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final AppState state;
  final bool disablePointer;
  final bool forceAppBar;
  final bool extendBodyBehindAppBar;
  final bool disablePopOnBackIfLoading;

  @override
  MakaScaffoldState createState() => MakaScaffoldState();
}

class MakaScaffoldState extends State<MakaScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Theme(
      data: Theme.of(context),
      child: Scaffold(
        key: widget.scaffoldKey,
        appBar: widget.appBar,
        body: Padding(
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
          child: AbsorbPointer(
            absorbing: widget.disablePointer,
            child: Stack(
              children: [
                SizedBox.expand(
                    child: MakaPageStateWidget(
                  pageState: widget.state.pageState,
                  builder: widget.builder,
                  noDataBuilder: widget.noDataBuilder,
                  onRetry: widget.state.onRetry ?? () {},
                  noDataMessage: widget.state.noDataMessage,
                )),
                // _buildBlur(),
              ],
            ),
          ),
        ),
        floatingActionButton: widget.floatingActionButton,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      ),
    );

    return scaffold;
  }
}

// holds page state properties
class AppState {
  final PageState pageState;

  /// to show no data default widget, if null doesn't appear
  final String noDataMessage;

  /// when an error is showing, a retry button will be display
  final VoidCallback? onRetry;

  const AppState({
    this.pageState = PageState.loaded,
    this.noDataMessage = '',
    this.onRetry,
  });
}
