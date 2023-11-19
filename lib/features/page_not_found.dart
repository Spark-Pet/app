import 'package:flutter/material.dart';

const pageSpecification = '''
# Page Not Found

This page appears when there is a bug in routing.
''';

/// Build a page indicating an attempt to route to a non-existent page.
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  static const routeName = '/page_not_found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: const Text('404 - Routing error')
    );
  }
}
