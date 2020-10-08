import 'dart:developer';

import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IGoogleCalenderFacade {
  Future<Event> createEvent(
      {String title, DateTime startTime, DateTime endTime, String description});
}

class GoogleCalenderRepository implements IGoogleCalenderFacade {
  GoogleCalenderRepository();

  @override
  Future<Event> createEvent(
      {String title,
      DateTime startTime,
      DateTime endTime,
      String description}) async {
    const _scopes = const [CalendarApi.CalendarEventsScope];

    var _clientID = ClientId(
        "1082627845787-totqm538e3tfqcv0qsvllk876t2l0vc7.apps.googleusercontent.com",
        "");

    void prompt(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    AuthClient client = await clientViaUserConsent(_clientID, _scopes, prompt);

    var calendar = CalendarApi(client);

    //calenderID
    String calendarId = "primary";

    // Create object of event
    Event event = Event();

    event.summary = title;
    event.description = description;

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+03:00";
    event.start = start;

    EventDateTime end = EventDateTime();
    end.timeZone = "GMT+03:00";
    end.dateTime = endTime;
    event.end = end;

    //insert event to user calender
    final result = await calendar.events.insert(event, calendarId);

    client.close();
    return result;
  }
}
