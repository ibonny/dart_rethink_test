import 'package:rethinkdb_dart/rethinkdb_dart.dart';

void main(List<String> args) async {
  Rethinkdb r = new Rethinkdb();

  var conn = await r.connect(db: 'test', host: 'localhost', port: 28015);

  var result = await r.table('test').changes().run(conn);

  await result.forEach((rec) {
    print(rec);
  });

  conn.close();
}
