import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/features/auth/data/repository_imp/auth_repository_impl.dart';
import 'package:event_app/features/auth/domain/repository/auth_repository.dart';
import 'package:event_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:event_app/features/events/data/data_sources/%20repository_imp/events_repository_impl.dart';
import 'package:event_app/features/events/data/data_sources/online/events_online_data_source.dart';
import 'package:event_app/features/events/domain/repository/events_repository.dart';
import 'package:event_app/features/events/domain/usecase/add_event_use_case.dart';
import 'package:event_app/features/events/domain/usecase/delete_event_use_case.dart';
import 'package:event_app/features/events/domain/usecase/get_events_use_case.dart';
import 'package:event_app/features/events/domain/usecase/get_favorite_events_use_case.dart';
import 'package:event_app/features/events/domain/usecase/toggle_favorite_use_case.dart';
import 'package:event_app/features/events/domain/usecase/update_event_use_case.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(googleSignIn: GoogleSignIn.instance),
  );

  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepository>()));
  sl.registerLazySingleton<AppSettingsCubit>(() => AppSettingsCubit());

  // ─── Events — Data Sources ───────────────────────────────────
  sl.registerLazySingleton<EventsOnlineDataSource>(
        () => EventsOnlineDataSourceImpl(),
  );

  // ─── Events — Repository ─────────────────────────────────────
  sl.registerLazySingleton<EventsRepository>(
        () => EventsRepositoryImpl(
      onlineDataSource: sl<EventsOnlineDataSource>(),
    ),
  );

  // ─── Events — Use Cases ──────────────────────────────────────
  sl.registerLazySingleton(
        () => GetEventsUseCase(sl<EventsRepository>()),
  );
  sl.registerLazySingleton(
        () => GetFavoriteEventsUseCase(sl<EventsRepository>()),
  );
  sl.registerLazySingleton(
        () => AddEventUseCase(sl<EventsRepository>()),
  );
  sl.registerLazySingleton(
        () => UpdateEventUseCase(sl<EventsRepository>()),
  );
  sl.registerLazySingleton(
        () => DeleteEventUseCase(sl<EventsRepository>()),
  );
  sl.registerLazySingleton(
        () => ToggleFavoriteUseCase(sl<EventsRepository>()),
  );

  // ─── Events — Cubit ──────────────────────────────────────────
  sl.registerFactory<EventsCubit>(
        () => EventsCubit(
      getEventsUseCase: sl<GetEventsUseCase>(),
      getFavoriteEventsUseCase: sl<GetFavoriteEventsUseCase>(),
      addEventUseCase: sl<AddEventUseCase>(),
      updateEventUseCase: sl<UpdateEventUseCase>(),
      deleteEventUseCase: sl<DeleteEventUseCase>(),
      toggleFavoriteUseCase: sl<ToggleFavoriteUseCase>(),
    ),
  );
}
