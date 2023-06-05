import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/internal/dependencies/events_repository_module.dart';
import 'package:events_attendance/presentation/global_widgets/custom_appbars.dart';
import 'package:events_attendance/presentation/screens/events/parts/event_container.dart';
import 'package:events_attendance/presentation/screens/login/widgets/text_fields_styling.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchEventsController = TextEditingController();
  late Stream<List<EventItem>> eventsStream;

  @override
  void initState() {
    eventsStream = EventsRepositoryModule.eventsRepository()
        .readEvents(searchFieldText: _searchEventsController.text);
    super.initState();
  }

  @override
  void dispose() {
    _searchEventsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PseudoAppBarTextOnly(
          title: S.of(context).events,
          screenBody: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomDimensions.screenHorizontalPadding,
                ),
                child: TextFormField(
                  controller: _searchEventsController,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 13.sp,
                      ),
                  onFieldSubmitted: _onSearchFieldSubmitted,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: TextFieldsStyling.searchFieldDecoration(
                    context: context,
                    controller: _searchEventsController,
                    onClearPressed: _onSearchFieldCleared,
                  ),
                  onChanged: (_) {
                    _onSearchFieldChanged();
                  },
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Expanded(
                child: StreamBuilder<List<EventItem>>(
                  stream: eventsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<EventItem> events = snapshot.data!;

                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: events.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomDimensions.screenHorizontalPadding,
                        ),
                        itemBuilder: (context, index) {
                          EventItem event = events[index];

                          return EventContainer(
                            eventItem: event,
                          );
                        },
                      );
                    } else {
                      print(snapshot.data);
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchFieldChanged() {
    setState(() {
      eventsStream = EventsRepositoryModule.eventsRepository()
          .readEvents(searchFieldText: _searchEventsController.text);
      _scrollController.jumpTo(0);
    });
  }

  void _onSearchFieldSubmitted(_) {
    setState(() {
      eventsStream = EventsRepositoryModule.eventsRepository()
          .readEvents(searchFieldText: _searchEventsController.text);
      _scrollController.jumpTo(0);

    });

  }

  void _onSearchFieldCleared() {
    setState(() {
      eventsStream = EventsRepositoryModule.eventsRepository()
          .readEvents(searchFieldText: _searchEventsController.text);
      _scrollController.jumpTo(0);

    });

  }
}
