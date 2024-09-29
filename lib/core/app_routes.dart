import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/pages/success_screen.dart';
import 'package:blue_collar_app/features/user_app_features/create_profile/presentation/pages/create_profile_main.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/pages/filter_page.dart';
import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/pages/home_screen.dart';
import 'package:blue_collar_app/features/user_app_features/invite_friends/presentation/pages/invite_friends_page.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/pages/job_page.dart';
import 'package:blue_collar_app/features/user_app_features/jobs/presentation/pages/live_tracking.dart';
import 'package:blue_collar_app/features/user_app_features/notifications/presentation/page/notification_page.dart';
import 'package:blue_collar_app/features/user_app_features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:blue_collar_app/features/user_app_features/person_information/presentation/pages/person_information_page.dart';
import 'package:blue_collar_app/features/user_app_features/suggestion_page/presentation/pages/suggestion_page.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/field_of_expertise.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/login_page.dart';
import 'package:blue_collar_app/features/user_app_features/settings/presentation/pages/settings_page.dart';
import 'package:blue_collar_app/features/user_app_features/settings/presentation/pages/password_manager_page.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/verify_email.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/verify_otp_page.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/presentation/pages/verify_phone.dart';
import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/pages/artisan_page.dart';
import 'package:blue_collar_app/features/user_app_features/artisan_view/presentation/pages/location_picker_page.dart';
import 'package:blue_collar_app/wrapper.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Wrapper()),
    GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/sign-up', builder: (context, state) => const SignUpPage()),
    GoRoute(
        path: '/verify-email',
        builder: (context, state) =>
            VerifyEmailAddress(email: state.extra as String)),
    GoRoute(
        path: '/verify-phone',
        builder: (context, state) => const VerifyPhone()),
    GoRoute(
        path: '/verify-otp',
        builder: (context, state) =>
            VerifyOtpPage(phone: state.extra as String)),
    GoRoute(
        path: '/field-of-expertise',
        builder: (context, state) => const FieldOfExpertise()),
    GoRoute(
        path: '/create-profile',
        builder: (context, state) => const CreateProfileMain()),
    GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              path: 'jobs',
              builder: (context, state) => const JobPage(),
              routes: [
                GoRoute(
                    path: 'live-track',
                    builder: (context, state) => const LiveTracking()),
              ]),
          GoRoute(
              path: 'notification',
              builder: (context, state) => const NotificationPage()),
          GoRoute(
              path: 'location-picker',
              builder: (context, state) => const LocationPickerPage()),
          GoRoute(
              path: 'suggestion',
              builder: (context, state) => const SuggestionPage()),
          GoRoute(
              path: 'filter-page',
              builder: (context, state) => const FilterPage()),
          GoRoute(
              path: 'personal-info',
              builder: (context, state) => const PersonalInformationPage()),
          GoRoute(
              path: 'invite-friends',
              builder: (context, state) => const InviteFriendsPage()),
          GoRoute(
              path: 'artisan',
              builder: (context, state) => const ArtisanPage()),
          GoRoute(
              path: 'success',
              builder: (context, state) => const SuccessScreen()),
          GoRoute(
              path: 'settings',
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                    path: 'password-manager',
                    builder: (context, state) => const PasswordManagerPage())
              ]),
        ]),
  ],
);

GoRouter get router => _router;
