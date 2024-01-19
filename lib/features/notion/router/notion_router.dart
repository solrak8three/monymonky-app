import 'package:go_router/go_router.dart';
import 'package:monymonky/features/notion/2_presentation/pages/notion_response_page.dart';
import 'package:monymonky/features/notion/router/static_routes.dart';

List<GoRoute> getNotionRoutes() => [
  GoRoute(
    path: NotionRoutes.notionShowDatabase,
    name: NotionResponsePage.name,
    builder: (context, state) => const NotionResponsePage(),
  ),
];
