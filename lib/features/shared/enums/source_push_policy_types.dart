/// When alerts from a source generate a push notification (V3 §1).
///
/// The backend is the authority on whether a push is actually sent; this mirror
/// lets the client reason about and label the policy. Mirrors the backend
/// `SourcePushPolicy` enum.
enum SourcePushPolicy {
  /// Push at every level (AWS).
  everyLevel,

  /// Push once the internal band crosses the threshold (official agencies, default).
  bandThreshold,

  /// Push only after the nearby-confirmation threshold, never on submission (community).
  afterConfirmation,

  /// Push except for the suppressed colour (GDACS Green = no push).
  greenExempt,

  /// Quiet advisory push at most (ALRT Intel).
  advisoryOnly,
}
