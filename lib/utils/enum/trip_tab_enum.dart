enum TripTabEnum { calender, map, todo }

extension TripTabEnumExtension on TripTabEnum {
  String getTitle() {
    return switch (this) {
      TripTabEnum.calender => "Calendar",
      TripTabEnum.map => "Map",
      TripTabEnum.todo => "To do List",
    };
  }
}
