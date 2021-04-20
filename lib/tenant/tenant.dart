class Tenant {
  static const tableContact = 'tenants';
  static const colId = 'id';
  static const colName = 'name';
  static const colMobile = 'mobile';

  int id;
  String name;
  String mobile;
  Tenant({this.id, this.name, this.mobile});
// retrieving
  Tenant.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    mobile = map[colMobile];
  }
// sending
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colName: name, colMobile: mobile};
    if (id != null) {
      map[colId] = id;
      return map;
    }
  }
}
