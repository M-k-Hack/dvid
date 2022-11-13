import 'package:fluent_ui/fluent_ui.dart';

import './assets/create_personality.dart';
import './assets/create_security.dart';

class NewIdentity extends StatefulWidget {
  const NewIdentity({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  State<NewIdentity> createState() => _NewIdentity();
}

class _NewIdentity extends State<NewIdentity> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabView(
        onChanged: (index) => setState(() => currentIndex = index),
        tabWidthBehavior: TabWidthBehavior.compact,
        closeButtonVisibility: CloseButtonVisibilityMode.never,
        currentIndex: currentIndex,
        tabs: const [
          Tab(text: Text("Identity"),
              icon: Icon(FluentIcons.contact),
              body: CreatePersonality()
    ),
          Tab(text: Text("Security"),
              icon: Icon(FluentIcons.lock),
              body: CreateSecurity()
    ),
        ]);
  }
}