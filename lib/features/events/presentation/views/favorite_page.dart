import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/widgets/components/error_state_widget.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/features/events/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    // ✅ start listening to favorites stream
    context.read<EventsCubit>().getFavoriteEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            context.appLocalizations.favorite,
            style: context.textTheme.titleLarge!.copyWith(
              color: context.isDark
                  ? AppColors.surface
                  : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            if (state is EventsLoading || state is EventsInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EventsFailure) {
              return ErrorStateWidget(
                onRetry: () {
                  context.read<EventsCubit>().getFavoriteEvents(); // ✅ retry favorites
                },
              );
            }

            if (state is EventsLoaded) {
              final events = state.events;
              if (events.isEmpty) {
                return Center(
                  child: Text(
                    context.appLocalizations.no_favorite_event_found,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: context.isDark
                          ? AppColors.surface
                          : AppColors.textPrimary,
                    ),
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return EventCard(dataModel: events[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: context.paddingHeight8);
                },
                itemCount: events.length,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}