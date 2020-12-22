class ChatUser {
  ChatUser({
    this.username,
    this.photoUrl,
    this.aboutMe,
    this.id,
  });
  final String username;
  final String photoUrl;
  final String aboutMe;
  final String id;

  factory ChatUser.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    final String username = data['username'];
    final String aboutMe = data['aboutMe'];
    final String photoUrl = data['photoUrl'];

    return ChatUser(
      username: username,
      id: documentId,
      aboutMe: aboutMe,
      photoUrl: photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'aboutMe': aboutMe,
      'photoUrl': photoUrl,
    };
  }
}
