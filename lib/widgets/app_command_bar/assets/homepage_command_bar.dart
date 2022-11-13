// stateless widget for the homepage command bar

import 'package:fluent_ui/fluent_ui.dart';

class HomepageCommandBar extends StatelessWidget {
  const HomepageCommandBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommandBar(
        overflowBehavior: CommandBarOverflowBehavior.noWrap,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.cafe),
            label: const Text('Coffee time'),
            onPressed: () {},
          ),
        ]);
  }
}
