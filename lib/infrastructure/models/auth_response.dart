class AuthResponse {
  final bool ok;
  final String? token;

  AuthResponse({
    required this.ok,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        ok: json["ok"],
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
      };
}
