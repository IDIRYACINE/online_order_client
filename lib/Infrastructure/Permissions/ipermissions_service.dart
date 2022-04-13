abstract class IPermissionsService {
  Future<void> requestGpsPermission();
  Future<void> requestNotificationPermission();
}
