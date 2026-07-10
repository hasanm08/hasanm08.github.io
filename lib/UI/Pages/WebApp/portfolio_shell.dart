import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/base_widget.dart';
import 'package:hasanm08/UI/Pages/WebApp/about.dart';
import 'package:hasanm08/UI/Pages/WebApp/contact.dart';
import 'package:hasanm08/UI/Pages/WebApp/mobile_page.dart';
import 'package:hasanm08/UI/Pages/WebApp/more.dart';
import 'package:hasanm08/UI/Pages/WebApp/packages.dart';
import 'package:hasanm08/UI/Pages/WebApp/projects.dart';
import 'package:hasanm08/UI/Pages/WebApp/web_root.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';
import 'package:hasanm08/Utils/sizing_information.dart';
import 'package:hasanm08/showcase/portfolio_showcase.dart';
import 'package:hasanm08/showcase/portfolio_showcase_target.dart';

/// Responsive shell shared by all portfolio tab routes.
///
/// Tab routes share a [pageKey] in the router so the navigator page is reused.
/// The active section is selected from [FlowRouter.location] via [IndexedStack].
class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  static const _tabBodies = [
    Center(child: About()),
    Center(child: Contact()),
    Center(child: Projects()),
    Center(child: Packages()),
    Center(child: More()),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PortfolioShowcase.tryStart(context);
    });
  }

  @override
  void dispose() {
    PortfolioShowcase.disposeActive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPath = context.location;
    final selectedIndex = AppShellRoutes.indexForPath(currentPath);
    final body = PortfolioShowcaseTarget(
      id: PortfolioShowcaseIds.contentArea,
      child: IndexedStack(
        index: selectedIndex,
        children: _tabBodies,
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: BaseWidget.getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );
        return _appRootForSize(context, sizingInformation, currentPath, body);
      },
    );
  }
}

Widget _appRootForSize(
  BuildContext context,
  SizingInformation sizingInformation,
  String currentPath,
  Widget child,
) {
  final mobile = MobilePage(
    currentPath: currentPath,
    child: child,
  );
  final web = WebRoot(
    currentPath: currentPath,
    child: child,
  );
  switch (sizingInformation.deviceType) {
    case null:
      return const Text('');
    case DeviceScreenType.mobile:
      return mobile;
    case DeviceScreenType.tablet:
      return mobile;
    case DeviceScreenType.desktop:
      return BaseWidget(builder: (context, sizingInformation) {
        return web;
      });
  }
}
