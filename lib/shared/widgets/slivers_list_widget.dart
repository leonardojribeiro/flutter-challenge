import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/utils/debouncer.dart';

class SliversListWidget extends StatefulWidget {
  const SliversListWidget({Key? key, required this.slivers, this.onEndScroll}) : super(key: key);
  final List<Widget> slivers;
  final VoidCallback? onEndScroll;

  @override
  State<SliversListWidget> createState() => _SliversListWidgetState();
}

class _SliversListWidgetState extends State<SliversListWidget> {
  final scrollController = ScrollController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    scrollController.addListener(() {
      final scrollProgress = scrollController.offset / scrollController.position.maxScrollExtent;
      if (scrollProgress > 0.7 && scrollProgress <= 1.0) {
        _debouncer.run(() {
          widget.onEndScroll?.call();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: widget.slivers,
    );
  }
}
