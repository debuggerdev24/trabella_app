enum TopUpEnum { AUD50, AUD100, AUD150, AUD200 }

extension TopUpEnumExtension on TopUpEnum {
  String getTitle() {
    return switch (this) {
      TopUpEnum.AUD50 => "AUD 50",
      TopUpEnum.AUD100 => "AUD 100",
      TopUpEnum.AUD150 => "AUD 150",
      TopUpEnum.AUD200 => "AUD 200",
    };
  }
}
