import 'package:mysql_client/mysql_client.dart';
import 'package:dotenv/dotenv.dart'; // Import dotenv

class MySQLDatabase {
  static MySQLConnection? _connection;

  static Future<MySQLConnection> getConnection() async {
    if (_connection == null || _connection!.connected == false) {
      // Load environment variables from .env file
      final env = DotEnv()..load();

      _connection = await MySQLConnection.createConnection(
        host: env['DB_HOST'] ?? '127.0.0.1',
        port: int.parse(env['DB_PORT'] ?? '3306'),
        userName: env['DB_USER'] ?? 'root',
        password: env['DB_PASSWORD'] ?? '',
        databaseName: env['DB_NAME'] ?? 'your_database_name',
        secure: false, // Set to true if using SSL
      );
      await _connection!.connect();
      print('MySQL connection established!');
    }
    return _connection!;
  }

  static Future<void> closeConnection() async {
    if (_connection != null && _connection!.connected) {
      await _connection!.close();
      _connection = null;
      print('MySQL connection closed.');
    }
  }
}