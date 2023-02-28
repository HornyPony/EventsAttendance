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
  final TextEditingController _searchEventsController = TextEditingController();

  @override
  void dispose() {
    _searchEventsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: PseudoAppBarTextOnly(
          title: 'Мероприятия',
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
                child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomDimensions.screenHorizontalPadding,
                  ),
                  itemBuilder: (context, index) {
                    return const EventContainer();
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
      if (_searchEventsController.text.isNotEmpty) {
        /* locator.get<ScreenerCompaniesState>().notEmptySearchCompanies(
          searchText: _getSearchText(),
          isNeedSaveSearch: false,
          orderBy: _getSortingType());*/
      } else {
        /*locator
          .get<ScreenerCompaniesState>()
          .emptySearchCompanies(orderBy: _getSortingType());*/
      }
      //_scrollController.jumpTo(0);
    });
  }

  void _onSearchFieldSubmitted(_) {
    /*locator.get<ScreenerCompaniesState>().notEmptySearchCompanies(
        searchText: _getSearchText(),
        orderBy: _getSortingType(),
        isNeedSaveSearch: true);
    _scrollController.jumpTo(0);*/
  }

  void _onSearchFieldCleared() {
    /*locator
        .get<ScreenerCompaniesState>()
        .emptySearchCompanies(orderBy: _getSortingType());
    _scrollController.jumpTo(0);*/
  }
}
