// stateless widget for the new identity command bar

import 'package:fluent_ui/fluent_ui.dart';

class NewIdentityCommandBar extends StatelessWidget {
  NewIdentityCommandBar({
    Key? key,
    required this.handleCancelNewIdentity,
  }) : super(key: key);

  Function handleCancelNewIdentity;

  @override
  Widget build(BuildContext context) {
    return CommandBar(
        overflowBehavior: CommandBarOverflowBehavior.noWrap,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.cancel),
            label: const Text('Cancel'),
            onPressed: () {handleCancelNewIdentity();},
          ),
        ]
    );
  }
}
