// create a custom CommandBar
// it choose the CommandBar buttons based on the current index

import 'package:fluent_ui/fluent_ui.dart';

import './assets/homepage_command_bar.dart';
import './assets/identities_command_bar.dart';
import './assets/new_identity_command_bar.dart';


class AppCommandBar extends StatefulWidget {

  AppCommandBar({
    Key? key,
    required this.index,
    required this.makeNewIdentity,
    required this.handleCancelNewIdentity,
    required this.handleCreateNewIdentity,
  }) : super(key: key);

  int index;
  bool makeNewIdentity;
  Function handleCancelNewIdentity;
  Function handleCreateNewIdentity;

  @override
  State<AppCommandBar> createState() => _AppCommandBar();
}

class _AppCommandBar extends State<AppCommandBar> {

  itemsSelector() {
    if (widget.makeNewIdentity) {
      return NewIdentityCommandBar(
        handleCancelNewIdentity: widget.handleCancelNewIdentity,
      );
    } else {
      return [
        const HomepageCommandBar(),
        IdentitiesCommandBar(handleCreateNewIdentity: widget.handleCreateNewIdentity),
      ][widget.index];
    }
  }

  @override
  Widget build(BuildContext context) {
    return itemsSelector();
  }
}