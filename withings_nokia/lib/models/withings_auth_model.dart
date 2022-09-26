class WithingsAuth {
  int? status;
  Body? body;

  WithingsAuth({this.status, this.body});

  WithingsAuth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  var userid;
  var accessToken;
  var refreshToken;
  var scope;
  var expiresIn;
  var tokenType;

  Body(
      {this.userid,
      this.accessToken,
      this.refreshToken,
      this.scope,
      this.expiresIn,
      this.tokenType});

  Body.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    return data;
  }
}
