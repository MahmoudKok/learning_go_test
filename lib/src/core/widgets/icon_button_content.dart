import 'package:learning_go_test/src/core/enums/general_enums.dart';
import 'package:flutter/material.dart';

class IconButtonContent extends StatelessWidget {
  const IconButtonContent({
    super.key,
    required this.initContent,
    required this.loadingContent,
    required this.errorContent,
    required this.successContent,
    required this.buttonState,
  });

  final Widget initContent, loadingContent, errorContent, successContent;
  final RequestState buttonState;

  @override
  Widget build(BuildContext context) {
    switch (buttonState) {
      case RequestState.init:
        return initContent;
      case RequestState.loading:
        return loadingContent;
      case RequestState.success:
        return successContent;
      case RequestState.error:
        return errorContent;
    }
  }
}
