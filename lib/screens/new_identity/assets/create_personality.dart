// create personality screen page
import "package:fluent_ui/fluent_ui.dart";

import '../../../widgets/inputs/switch_input.dart';

class CreatePersonality extends StatefulWidget {
  const CreatePersonality({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  State<CreatePersonality> createState() => _CreatePersonality();
}

class _CreatePersonality extends State<CreatePersonality> {
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
        header:
            PageHeader(title: Text(widget.header ?? 'This is a header text')),
        content: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ToggleSwitch(
                content: const Text('Randomize all'),
                checked: enable,
                onChanged: (v) => {setState(() => enable = v)},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Firstname',
                placeholder: 'Firstname',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Lastname',
                placeholder: 'Lastname',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Nickname',
                placeholder: 'Nickname',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Email',
                placeholder: 'Email',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Phone',
                placeholder: 'Phone',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Address',
                placeholder: 'Address',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a City',
                placeholder: 'City',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a State',
                placeholder: 'State',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Zip',
                placeholder: 'Zip',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              TextSwitchInput(
                header: 'Enter a Country',
                placeholder: 'Country',
                forceSwitch: enable,
                handleSwitch: () => {},
              ),
              const SizedBox(height: 20),
              DateSwitchInput(
                header: 'Enter a Birthday',
                placeholder: 'Birthday',
                forceSwitch: enable,
                handleSwitch: () => {},
                date: DateTime.now(),
              ),
            ],
          ),
        )));
  }
}
