import 'package:fluent_ui/fluent_ui.dart';

class Identity extends StatefulWidget {
  const Identity({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  State<Identity> createState() => _Identity();
}

class _Identity extends State<Identity> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(widget.header ?? 'This is a header text')),
      content: widget.content ?? const SizedBox.shrink(),
    );
  }
}