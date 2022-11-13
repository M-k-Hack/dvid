// stateless widget for the identities command bar

import 'package:fluent_ui/fluent_ui.dart';

class IdentitiesCommandBar extends StatelessWidget {
  IdentitiesCommandBar({
    Key? key,
    required this.handleCreateNewIdentity,
  }) : super(key: key);


  Function handleCreateNewIdentity;
  @override
  Widget build(BuildContext context) {
    return CommandBar(
        overflowBehavior: CommandBarOverflowBehavior.noWrap,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.add),
            label: const Text('Add'),
            onPressed: () {handleCreateNewIdentity();},
          ),
          CommandBarButton(
            icon: const Icon(FluentIcons.delete),
            label: const Text('Delete'),
            onPressed: () {},
          ),
        ],
    );
  }
}