package cn.nicecoder.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 鑾峰彇鏁版嵁搴撹繛鎺�
 *-------------------------------
 * @author longtian
 * @date 2018骞�4鏈�12鏃ヤ笅鍗�9:49:56
 * @description nicecoder.cn
 *-------------------------------
 */
public class DBUtil {
	public static final String url = "jdbc:mysql://127.0.0.1/news?characterEncoding=utf8&useUnicode=true&useSSL=false&createDatabaseIfNotExist=true";
	public static final String name = "com.mysql.jdbc.Driver";
	public static final String user = "root";
	public static final String password = "313182";
	
	public Connection conn = null;
	public Connection getConnection() {
		try {
			Class.forName(name);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
