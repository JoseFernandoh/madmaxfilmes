package br.com.madmaxfilmes.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

		private static String url = "jdbc:postgresql://127.0.0.1:5433/madmaxfilmes?autoReconnect=true";
		private static String user = "postgres";
		private static String pass =  "admin";
		private static Connection connection = null;
		
		static {
			conectar();
		}
		
		public SingleConnectionBanco() {
			conectar();
		}
		
		private static void conectar() {
			
			try {
				
				if(connection == null) {
					Class.forName("org.postgresql.Driver");
					connection = DriverManager.getConnection(url, user, pass);
					connection.setAutoCommit(false);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		public static Connection getConnection() {
			return connection;
		}
}
