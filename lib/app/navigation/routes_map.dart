// import 'package:catechism/features/about/presentation/pages/about_page.dart';
// import 'package:catechism/features/account/presentation/pages/account_page.dart';
// import 'package:catechism/features/article/presentation/pages/article_page.dart';
// import 'package:catechism/features/avatar_editor/presentation/pages/avatar_edit_page.dart';
// import 'package:catechism/features/book/presentation/pages/book_page.dart';
// import 'package:catechism/features/books/presentation/pages/books_page.dart';
// import 'package:catechism/features/calendar/presentation/pages/calendar_page.dart';
// import 'package:catechism/features/card/presentation/pages/card_page.dart';
// import 'package:catechism/features/chat/list/presentation/pages/list_page.dart';
// import 'package:catechism/features/child/presentation/pages/child_page.dart';
// import 'package:catechism/features/dashboard/presentation/pages/dashboard_page.dart';
// import 'package:catechism/features/donation/dashboard/presentation/pages/donation_dashboard_page.dart';
// import 'package:catechism/features/donation/item/presentation/pages/donation_item_page.dart';
// import 'package:catechism/features/donation/onboarding/presentation/pages/donation_onboarding_page.dart';
// import 'package:catechism/features/faq/presentation/pages/faq_page.dart';
// import 'package:catechism/features/faq_item/presentation/pages/faq_item_page.dart';
// import 'package:catechism/features/favorites/presentation/pages/favorites_page.dart';
// import 'package:catechism/features/help/presentation/pages/help_page.dart';
// import 'package:catechism/features/home/presentation/pages/home_page.dart';
// import 'package:catechism/features/login/presentation/pages/login_page.dart';
// import 'package:catechism/features/map/presentation/pages/map_page.dart';
// import 'package:catechism/features/map_location/presentation/pages/map_location_page.dart';
// import 'package:catechism/features/map_onbording/presentation/pages/map_onbording_page.dart';
// import 'package:catechism/features/onboarding/presentation/pages/onboarding_page.dart';
// import 'package:catechism/features/password_change/presentation/pages/password_change_page.dart';
// import 'package:catechism/features/personalinfo/presentation/pages/personal_info_page.dart';
// import 'package:catechism/features/profile_edit/presentation/pages/profile_edit_page.dart';
// import 'package:catechism/features/profile_field_editor/presentation/pages/profile_field_editor_page.dart';
// import 'package:catechism/features/profile_settings/presentation/pages/profile_settings_page.dart';
// import 'package:catechism/features/recovery/presentation/pages/recovery_page.dart';
// import 'package:catechism/features/register/presentation/root/pages/register_page.dart';
// import 'package:catechism/features/resources/presentation/pages/resources_page.dart';
// import 'package:catechism/features/social_settings/presentation/pages/social_settings_page.dart';
// import 'package:catechism/features/statistic/presentation/pages/statistic_page.dart';
// import 'package:catechism/features/training_detail/presentation/pages/training_detail_page.dart';
// import 'package:catechism/features/training_list/presentation/pages/training_list_page.dart';
// import 'package:catechism/features/training_onbording/presentation/pages/training_onbording_page.dart';
// import 'package:catechism/features/training_test/presentation/pages/training_test_page.dart';
// import 'package:catechism/features/training_test_result/presentation/pages/training_test_result_page.dart';
// import 'package:catechism/features/video_cast/presentation/pages/video_cast_page.dart';
// import 'package:catechism/navigation/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:routemaster/routemaster.dart';

// RouteMap routeMap(
//   bool showTrainingOnboarding,
//   bool showCalendarOnboarding,
//   bool showMapOnboarding,
//   bool showDonationOnboarding,
// ) =>
//     RouteMap(routes: {
//       Routes.root: (_) => const IndexedPage(
//             child: HomePage(),
//             paths: [
//               Routes.dashboard,
//               Routes.trainingList,
//               Routes.calendar,
//               Routes.profile,
//             ],
//           ),
//       Routes.dashboard: (_) => const MaterialPage<void>(child: DashboardPage()),
//       Routes.article: (data) => MaterialPage<void>(child: ArticlePage(articleId: data.queryParameters['id']!)),
//       Routes.book: (data) => MaterialPage<void>(child: BookPage(book: data.queryParameters['book']!)),
//       Routes.child: (_) => const MaterialPage<void>(child: ChildPage()),
//       Routes.videoCast: (_) => const MaterialPage<void>(child: VideoCastPage()),
//       Routes.books: (_) => const MaterialPage<void>(child: BooksPage()),
//       Routes.calendar: (_) => const MaterialPage<void>(child: CalendarPage()),
//       Routes.profile: (_) => const MaterialPage<void>(child: AccountPage()),
//       Routes.profileBooks: (_) => const MaterialPage<void>(child: BooksPage()),
//       Routes.resources: (_) => const MaterialPage<void>(child: ResourcesPage()),
//       Routes.profileSettings: (_) => const MaterialPage<void>(child: ProfileSettingsPage()),
//       Routes.profileEdit: (_) => const MaterialPage<void>(child: ProfileEditPage()),
//       Routes.profileFieldEditor: (data) =>
//           MaterialPage<void>(child: ProfileFieldEditorPage(fieldTypeIndex: data.queryParameters['type']!)),
//       Routes.help: (_) => const MaterialPage<void>(child: HelpPage()),
//       Routes.faq: (_) => const MaterialPage<void>(child: FaqPage()),
//       Routes.faqItem: (data) => MaterialPage<void>(child: FaqItemPage(modelString: data.queryParameters['model']!)),
//       Routes.favorites: (_) => const MaterialPage<void>(child: FavoritesPage()),
//       Routes.about: (_) => const MaterialPage<void>(child: AboutPage()),
//       Routes.statistic: (_) => const MaterialPage<void>(child: StatisticPage()),
//       Routes.map: (_) {
//         if (showMapOnboarding) {
//           return const MaterialPage<void>(child: MapOnbordingPage());
//         } else {
//           return const MaterialPage<void>(child: MapPage());
//         }
//       },
//       Routes.mapLocation: (data) => MaterialPage<void>(
//               child: MapLocationPage(
//             item: data.queryParameters['item']!,
//           )),
//       Routes.donation: (_) {
//         if (showDonationOnboarding) {
//           return const MaterialPage<void>(child: DonationOnboardingPage());
//         } else {
//           return const MaterialPage<void>(child: DonationDashboardPage());
//         }
//       },
//       Routes.socialSettings: (_) => const MaterialPage<void>(child: SocialSettingsPage()),
//       Routes.donationItem: (data) => MaterialPage<void>(child: DonationItemPage(model: data.queryParameters['item']!)),
//       Routes.trainingList: (_) {
//         if (showTrainingOnboarding) {
//           return const MaterialPage<void>(child: TrainingOnbordingPage());
//         } else {
//           return const MaterialPage<void>(child: TrainingListPage());
//         }
//       },
//       Routes.trainingDetails: (data) =>
//           MaterialPage<void>(child: TrainingDetailPage(modelJson: data.queryParameters['model']!)),
//       Routes.trainingTest: (data) =>
//           MaterialPage<void>(child: TrainingTestPage(modelJson: data.queryParameters['model']!)),
//       Routes.trainingResult: (data) => MaterialPage<void>(
//             child: TrainingTestResultPage(
//               result: data.queryParameters['result']!,
//               title: data.queryParameters['title']!,
//               score: data.queryParameters['score']!,
//             ),
//           ),
//       Routes.avatarEdit: (data) => MaterialPage<void>(
//             child: AvatarEditPage(
//               isPhoto: data.queryParameters['isPhoto'] == '1',
//               name: data.queryParameters['name']!,
//             ),
//           ),
//       Routes.chat: (_) => const MaterialPage<void>(child: ListPage()),
//       Routes.card: (_) => const MaterialPage<void>(child: CardPage()),
//       Routes.paswordChange: (_) => const MaterialPage<void>(child: PasswordChangePage()),
//     });

// final RouteMap loggedOutRouteMap = RouteMap(
//   onUnknownRoute: (route) => const Redirect(Routes.root),
//   routes: {
//     Routes.root: (_) => const MaterialPage<void>(child: LoginPage()),
//     Routes.register: (data) => MaterialPage<void>(
//           child: RegisterPage(
//             socialToken: data.queryParameters['socialToken'],
//             socialTokenType: data.queryParameters['socialTokenType'],
//           ),
//         ),
//     Routes.personalInfo: (_) => const MaterialPage<void>(child: PersonalInfoPage()),
//     Routes.passwordRecovery: (_) => const MaterialPage<void>(child: RecoveryPage()),
//   },
// );

// final RouteMap onboardingRouteMap = RouteMap(
//   onUnknownRoute: (route) => const Redirect(Routes.root),
//   routes: {
//     Routes.root: (_) => const MaterialPage<void>(child: OnboardingPage()),
//   },
// );
