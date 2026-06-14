# Auth UI Preview Guide

## Current Goal

Run and review Auth UI/design on iPhone in a UI-only preview mode, without backend/API integration.

## Current Auth Flow (Temporary)

- App starts on splash route (`/`) for design preview.
- Splash navigates locally to login after a short delay.
- Login validates email/password locally in UI.
- Login button shows a short local “submitting” state then navigates locally to home placeholder.
- Register, forgot password, OTP, and reset password are reachable through local routes only.
- Social login buttons show placeholder behavior (`SnackBar`) and do not call backend.

## Files Involved

### Auth UI Preview (active now)

- `lib/features/auth/presentation/pages/login_screen.dart`
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/auth/presentation/widgets/login_form.dart`
- `lib/features/auth/presentation/widgets/social_login_buttons.dart`
- `lib/features/auth/presentation/widgets/auth_text_field.dart`
- `lib/features/auth/presentation/widgets/auth_scaffold.dart`
- `lib/features/auth/presentation/widgets/auth_primary_button.dart`
- `lib/features/auth/presentation/widgets/auth_back_button.dart`
- `lib/features/auth/presentation/widgets/auth_language_chip.dart`
- `lib/features/auth/presentation/pages/register_screen.dart`
- `lib/features/auth/presentation/pages/forgot_password_screen.dart`
- `lib/features/auth/presentation/pages/otp_verification_screen.dart`
- `lib/features/auth/presentation/pages/reset_password_screen.dart`
- `lib/core/router/app_router.dart`
- `lib/features/home/presentation/pages/home_screen.dart`
- `lib/app.dart`
 - `lib/features/splash/presentation/pages/splash_screen.dart`

### Kept for later backend reconnect (do not remove)

- `lib/features/auth/presentation/bloc/auth_bloc.dart`
- `lib/features/auth/presentation/bloc/auth_event.dart`
- `lib/features/auth/presentation/bloc/auth_state.dart`
- `lib/features/auth/domain/usecases/login_usecase.dart`
- `lib/features/auth/domain/repositories/auth_repository.dart`
- `lib/features/auth/data/repositories/auth_repository_impl.dart`
- `lib/features/auth/data/datasources/auth_remote_data_source.dart`
- `lib/core/di/injection_container.dart`
- `lib/core/network/dio_client.dart`

## What Is Temporary

- Login submit uses local navigation callback, not Bloc dispatch.
- No `BlocProvider<AuthBloc>` in auth UI preview screens.
- No runtime dependency on `DioClient` for opening auth screens.
- Home route points to a temporary placeholder screen for preview flow.
- Auth UI visual system is hardcoded to match Figma (colors/radius/spacing) until design tokens are formalized.

## What Must Be Reconnected Later

- Re-enable `BlocProvider<AuthBloc>` in login entry screen.
- Reconnect `LoginForm` submit to `LoginSubmitted` event.
- Re-enable DI registrations for real network client and data source wiring.
- Replace mock/local auth behavior with real backend API flow.

## Rules For Future Changes (while in preview mode)

- Do not initialize Dio for auth preview.
- Do not call real API from auth UI.
- Keep routing local and stable for design validation.
- Keep Clean Architecture files in place even if unused temporarily.
- Add TODO markers near temporary logic for easy rollback/reconnect.

## How To Run On iPhone

1. `flutter pub get`
2. Open iOS simulator/device
3. `flutter run -d ios`
4. Verify:
   - app opens to login UI
   - auth pages navigate locally
   - social buttons do not crash

## Common Issues Faced Today And Fixes

- **Issue:** App crash/blank on startup from auth DI chain.
  - **Reason:** login entry was creating `AuthBloc`, which depended on network setup during preview.
  - **Fix:** removed Bloc usage from auth UI preview path; local-only navigation flow.

- **Issue:** Runtime errors around Dio initialization.
  - **Reason:** backend not ready while network stack was still partially wired.
  - **Fix:** no Dio usage in auth preview screens; keep backend files for later reconnect.

- **Issue:** Need RTL Arabic preview fidelity on iOS.
  - **Fix:** auth screens use RTL layout and Arabic-first text for design validation.

- **Issue:** Inconsistent backgrounds/spacing across auth pages.
  - **Fix:** introduced shared `AuthScaffold` + shared button/text-field styles to keep screens visually consistent.

## Reconnect Checklist (when backend is ready)

- Restore `BlocProvider<AuthBloc>` in login flow.
- Restore login event dispatch in `LoginForm`.
- Re-enable full DI chain for real auth dependencies.
- Replace local navigation success path with Bloc success state handling.
- Keep form validation and UI components unchanged where possible.
