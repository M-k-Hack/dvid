// create security screen page
import "package:fluent_ui/fluent_ui.dart";

class CreateSecurity extends StatefulWidget {
  const CreateSecurity({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  State<CreateSecurity> createState() => _CreateSecurity();
}

class _CreateSecurity extends State<CreateSecurity> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(widget.header ?? 'This is a header text')),
      content: widget.content ?? const SizedBox.shrink(),
    );
  }
}