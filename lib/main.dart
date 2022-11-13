import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:window_manager/window_manager.dart';
import 'widgets/app_command_bar/command_bar.dart';

import 'routes/routing.dart' deferred as routing;

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
/*  if (isDesktop) {
    await flutter_acrylic.Window.initialize();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setSize(const Size(755, 545));
      await windowManager.setMinimumSize(const Size(350, 600));
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }*/

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int topIndex = 0;
  bool makeNewIdentity = false;

  handleCancelNewIdentity() {
    setState(() {
      makeNewIdentity = false;
    });
  }

  handleCreateNewIdentity() {
    setState(() {
      makeNewIdentity = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
        home: FutureBuilder(
            future: routing.loadLibrary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return NavigationView(
                  appBar: NavigationAppBar(
                    title: AppCommandBar(
                      index: topIndex,
                      makeNewIdentity: makeNewIdentity,
                      handleCancelNewIdentity: handleCancelNewIdentity,
                      handleCreateNewIdentity: handleCreateNewIdentity,
                    ),
                  ),
                  pane: NavigationPane(
                    selected: topIndex,
                    onChanged: (index) => setState(() => topIndex = index),
                    displayMode: PaneDisplayMode.compact,
                    items: [
                      PaneItem(
                        icon: const Icon(FluentIcons.home),
                        title: const Text('Home'),
                        body: const BodyItem(
                          header: 'Homepage',
                          content: Text("this is the homepage"),
                        ),
                      ),
                      PaneItem(
                        icon: const Icon(FluentIcons.business_card),
                        title: const Text('Identities'),
                        body: makeNewIdentity
                            ? routing.NewIdentity(
                                header: 'New Identity',
                                content:
                                    const Text("this is the new identity page"),
                              )
                            : routing.Identity(
                                header: 'Identities',
                                content:
                                    const Text("this is the identities page"),
                              ),
                      ),
                    ],
                    footerItems: [
                      PaneItem(
                        icon: const Icon(FluentIcons.settings),
                        title: const Text('Settings'),
                        body: const BodyItem(),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: ProgressRing());
              }
            }));
  }
}

class BodyItem extends StatelessWidget {
  const BodyItem({
    Key? key,
    this.header,
    this.content,
  }) : super(key: key);

  final String? header;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(header ?? 'This is a header text')),
      content: content ?? const SizedBox.shrink(),
    );
  }
}
