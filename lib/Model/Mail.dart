class Mail {
  final String useravatar;
  final String username;
  final String subject;
  final String body;
  final bool starred;
  final String timeago;
  final bool seen;
  final bool file;
  final String filename;

  Mail({
    required this.useravatar,
    required this.username,
    required  this.subject,
    required this.body,
    required this.starred,
    required this.timeago,
    required this.seen,
    required  this.file,
    required this.filename
  });
}