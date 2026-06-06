import 'package:go_router/go_router.dart';
import 'route_names.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/otp_verification_screen.dart';
import '../../features/auth/presentation/pages/forgot_password_screen.dart';
import '../../features/auth/presentation/pages/reset_password_screen.dart';
import '../../features/auth/presentation/pages/terms_and_conditions_screen.dart';
import '../../features/main/presentation/pages/main_layout.dart';
import '../../features/home/presentation/pages/search_screen.dart';
import '../../features/home/presentation/pages/search_results_screen.dart';
import '../../features/restaurant/presentation/pages/restaurant_list_screen.dart';
import '../../features/restaurant/presentation/pages/restaurant_detail_screen.dart';
import '../../features/restaurant/presentation/pages/menu_item_detail_screen.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/checkout/presentation/pages/checkout_screen.dart';
import '../../features/checkout/presentation/pages/address_selection_screen.dart';
import '../../features/checkout/presentation/pages/add_edit_address_screen.dart';
import '../../features/checkout/presentation/pages/map_picker_screen.dart';
import '../../features/checkout/presentation/pages/payment_method_screen.dart';
import '../../features/checkout/presentation/pages/order_confirmation_screen.dart';
import '../../features/order/presentation/pages/order_tracking_screen.dart';
import '../../features/order/presentation/pages/order_detail_screen.dart';
import '../../features/order/presentation/pages/order_history_screen.dart';
import '../../features/order/presentation/pages/rate_order_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/profile/presentation/pages/edit_profile_screen.dart';
import '../../features/profile/presentation/pages/address_book_screen.dart';
import '../../features/profile/presentation/pages/add_edit_address_screen.dart'
    as profile_address;
import '../../features/profile/presentation/pages/discount_points_screen.dart';
import '../../features/profile/presentation/pages/favourites_screen.dart';
import '../../features/profile/presentation/pages/notifications_screen.dart';
import '../../features/profile/presentation/pages/settings_screen.dart';
import '../../features/support/presentation/pages/help_support_screen.dart';
import '../../features/support/presentation/pages/about_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    // Auth UI Preview Mode: start from splash for design review.
    // TODO: Decide startup route once real auth/onboarding is ready.
    initialLocation: RouteNames.splash,
    // TODO: add redirect guard (auth check)
    routes: [
      GoRoute(path: RouteNames.splash, builder: (c, s) => const SplashScreen()),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (c, s) => const OnboardingScreen(),
      ),
      GoRoute(path: RouteNames.login, builder: (c, s) => const LoginScreen()),
      GoRoute(
        path: RouteNames.register,
        builder: (c, s) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouteNames.otp,
        builder: (c, s) {
          final email = s.extra is String ? s.extra as String : '';
          return OtpVerificationScreen(email: email);
        },
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (c, s) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.resetPassword,
        builder: (c, s) {
          final email = s.extra is String ? s.extra as String : '';
          return ResetPasswordScreen(email: email);
        },
      ),
      GoRoute(
        path: RouteNames.termsAndConditions,
        builder: (c, s) => const TermsAndConditionsScreen(),
      ),
      GoRoute(path: RouteNames.home, builder: (c, s) => const MainLayout()),
      GoRoute(path: RouteNames.search, builder: (c, s) => const SearchScreen()),
      GoRoute(
        path: RouteNames.searchResults,
        builder: (c, s) => const SearchResultsScreen(),
      ),
      GoRoute(
        path: RouteNames.restaurantList,
        builder: (c, s) => const RestaurantListScreen(),
      ),
      GoRoute(
        path: RouteNames.restaurantDetail,
        builder: (c, s) => const RestaurantDetailScreen(),
      ),
      GoRoute(
        path: RouteNames.menuItemDetail,
        builder: (c, s) => const MenuItemDetailScreen(),
      ),
      GoRoute(path: RouteNames.cart, builder: (c, s) => const CartScreen()),
      GoRoute(
        path: RouteNames.checkout,
        builder: (c, s) => const CheckoutScreen(),
      ),
      GoRoute(
        path: RouteNames.addressSelection,
        builder: (c, s) => const AddressSelectionScreen(),
      ),
      GoRoute(
        path: RouteNames.addEditAddress,
        builder: (c, s) => const AddEditAddressScreen(),
      ),
      GoRoute(
        path: RouteNames.mapPicker,
        builder: (c, s) => const MapPickerScreen(),
      ),
      GoRoute(
        path: RouteNames.paymentMethod,
        builder: (c, s) => const PaymentMethodScreen(),
      ),
      GoRoute(
        path: RouteNames.orderConfirmation,
        builder: (c, s) => const OrderConfirmationScreen(),
      ),
      GoRoute(
        path: RouteNames.orderTracking,
        builder: (c, s) => const OrderTrackingScreen(),
      ),
      GoRoute(
        path: RouteNames.orderDetail,
        builder: (c, s) => const OrderDetailScreen(),
      ),
      GoRoute(
        path: RouteNames.orderHistory,
        builder: (c, s) => const OrderHistoryScreen(),
      ),
      GoRoute(
        path: RouteNames.rateOrder,
        builder: (c, s) => const RateOrderScreen(),
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (c, s) => const ProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.editProfile,
        builder: (c, s) => const EditProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.addressBook,
        builder: (c, s) => const AddressBookScreen(),
      ),
      GoRoute(
        path: RouteNames.addressBookAddMap,
        builder: (c, s) => const profile_address.AddressMapSelectionScreen(
          mode: profile_address.AddressFlowMode.add,
        ),
      ),
      GoRoute(
        path: RouteNames.addressBookAddDetails,
        builder: (c, s) => const profile_address.AddressDetailsScreen(
          mode: profile_address.AddressFlowMode.add,
        ),
      ),
      GoRoute(
        path: RouteNames.addressBookEditMap,
        builder: (c, s) => const profile_address.AddressMapSelectionScreen(
          mode: profile_address.AddressFlowMode.edit,
        ),
      ),
      GoRoute(
        path: RouteNames.addressBookEditDetails,
        builder: (c, s) => const profile_address.AddressDetailsScreen(
          mode: profile_address.AddressFlowMode.edit,
        ),
      ),
      GoRoute(
        path: RouteNames.favourites,
        builder: (c, s) => const FavouritesScreen(),
      ),
      GoRoute(
        path: RouteNames.discountPoints,
        builder: (c, s) => const DiscountPointsScreen(),
      ),
      GoRoute(
        path: RouteNames.notifications,
        builder: (c, s) => const NotificationsScreen(),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (c, s) => const SettingsScreen(),
      ),
      GoRoute(
        path: RouteNames.helpSupport,
        builder: (c, s) => const HelpSupportScreen(),
      ),
      GoRoute(path: RouteNames.about, builder: (c, s) => const AboutScreen()),
    ],
  );
}
