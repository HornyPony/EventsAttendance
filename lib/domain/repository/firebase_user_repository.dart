

abstract class FirebaseUserRepository {
  Future<void> createFirebaseUser({
    required String login,
    required String deviceToken,
  });

  Future<bool> getIsUserExists({required String login});
}
