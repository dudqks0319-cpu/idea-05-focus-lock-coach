class UserProfile {
  UserProfile({
    required this.userId,
    required this.defaultFocusLevel,
    required this.dailyFocusMinutes,
    required this.notificationsEnabled,
  });

  final String userId;
  final int defaultFocusLevel; // 1~5
  final int dailyFocusMinutes;
  final bool notificationsEnabled;

  UserProfile copyWith({
    String? userId,
    int? defaultFocusLevel,
    int? dailyFocusMinutes,
    bool? notificationsEnabled,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      defaultFocusLevel: defaultFocusLevel ?? this.defaultFocusLevel,
      dailyFocusMinutes: dailyFocusMinutes ?? this.dailyFocusMinutes,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'default_focus_level': defaultFocusLevel,
      'daily_focus_minutes': dailyFocusMinutes,
      'notifications_enabled': notificationsEnabled,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map, String userId) {
    return UserProfile(
      userId: userId,
      defaultFocusLevel: (map['default_focus_level'] as num?)?.toInt() ?? 3,
      dailyFocusMinutes: (map['daily_focus_minutes'] as num?)?.toInt() ?? 180,
      notificationsEnabled: (map['notifications_enabled'] as bool?) ?? true,
    );
  }

  static UserProfile defaults(String userId) {
    return UserProfile(
      userId: userId,
      defaultFocusLevel: 3,
      dailyFocusMinutes: 180,
      notificationsEnabled: true,
    );
  }
}
