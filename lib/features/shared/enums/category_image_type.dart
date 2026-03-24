/// Image slot types for category images (matches backend API).
enum CategoryImageType {
  info,
  monitor,
  action,
  critical,
  advice,
  watchAndAct,
  emergency,
  user,
}

extension CategoryImageTypeExtension on CategoryImageType {
  /// Form field name for multipart upload (e.g. info -> infoImage).
  String get multipartName {
    switch (this) {
      case CategoryImageType.info:
        return 'infoImage';
      case CategoryImageType.monitor:
        return 'monitorImage';
      case CategoryImageType.action:
        return 'actionImage';
      case CategoryImageType.critical:
        return 'criticalImage';
      case CategoryImageType.advice:
        return 'adviceImage';
      case CategoryImageType.watchAndAct:
        return 'watchAndActImage';
      case CategoryImageType.emergency:
        return 'emergencyImage';
      case CategoryImageType.user:
        return 'userImage';
    }
  }

  /// Display label for the form.
  String get displayLabel {
    switch (this) {
      case CategoryImageType.info:
        return 'Info';
      case CategoryImageType.monitor:
        return 'Monitor';
      case CategoryImageType.action:
        return 'Action';
      case CategoryImageType.critical:
        return 'Critical';
      case CategoryImageType.advice:
        return 'Advice';
      case CategoryImageType.watchAndAct:
        return 'Watch and act';
      case CategoryImageType.emergency:
        return 'Emergency';
      case CategoryImageType.user:
        return 'User';
    }
  }
}
