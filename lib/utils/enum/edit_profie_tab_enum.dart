enum EditProfileEnum { edit, preview }

extension EditProfileEnumExtension on EditProfileEnum {
  String getTitle() {
    return switch (this) {
      EditProfileEnum.edit => "Edit",
      EditProfileEnum.preview => "Preview",

    };
  }
}
