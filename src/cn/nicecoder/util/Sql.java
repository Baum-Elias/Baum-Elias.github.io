package cn.nicecoder.util;

/**
 * sql语句
 *-------------------------------
 * @author longtian
 * @date 2018年4月13日下午9:49:56
 * @description nicecoder.cn
 *-------------------------------
 */
public class Sql {
	
	//建表语句（news表）
	public static final String SQL_NEWS_DROP = "DROP TABLE IF EXISTS `news`;";
	public static final String SQL_NEWS_CREATE = "CREATE TABLE `news` (\n" + 
						"  `id` int(10) NOT NULL AUTO_INCREMENT,\n" + 
						"  `img` varchar(100) DEFAULT NULL,\n" + 
						"  `title` varchar(50) DEFAULT NULL,\n" + 
						"  `content` Blob DEFAULT NULL,\n" + 
						"  `type` varchar(10) DEFAULT NULL,\n" + 
						"  `author` varchar(50) DEFAULT NULL,\n" + 
						"  `pudate` varchar(50) DEFAULT NULL,\n" + 
						"  `click` varchar(20) DEFAULT NULL,\n" + 
						"  PRIMARY KEY (`id`)\n" + 
						") ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;";
	
	//插入语句（news表）
	public static final String SQL_NEWS_INSERT = 
			"INSERT INTO NEWS(img, title, content, type, author, pudate, click) values (?,?,?,?,?,?,?)";

	//查询所有（news表）
	public static final String SQL_NEWS_SELECTALL = 
			"SELECT a.id, img, title, content, type, author, pudate, click, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id ORDER BY pudate DESC LIMIT ?, ?";
	
	//查询news表的总记录数（news表）
	public static final String SQL_NEWS_COUNT = "SELECT count(0) FROM news";
	
	//查询特定用户news
	public static final String SQL_NEWS_SELECTTD = 
			"SELECT a.id, img, title, content, type, author, pudate, click, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id WHERE a.author = ? ORDER BY pudate DESC LIMIT ?, ?";
	
	//查询单条信息（news表）
	public static final String SQL_NEWS_SELECTBYID = "SELECT a.id, img, title, content, type, author, pudate, click, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id WHERE a.id = ?";

	//删除单条信息（news表）
	public static final String SQL_NEWS_DELETE = "DELETE FROM news WHERE id = ?";
	
	//更新语句（news表）
	public static final String SQL_NEWS_UPDATE = 
			"UPDATE NEWS SET img=?, title=?, content=?, type=?, author=?, pudate=?, click=? where id=?";
	
	public static final String SQL_NEWS_UPDATE_CILICK = 
			"UPDATE NEWS SET click=? where id=?";
	
	//创建评论表（discuss表）
	public static final String SQL_DISSCUSS_CREATE = "CREATE TABLE `discuss` (\n" + 
			"  `id` int(10) NOT NULL AUTO_INCREMENT,\n" + 
			"  `type` varchar(10) DEFAULT NULL,\n" + 
			"  `discussid` varchar(10) DEFAULT NULL,\n" + 
			"  `content` Blob DEFAULT NULL,\n" + 
			"  `userid` varchar(50) DEFAULT NULL,\n" + 
			"  `pudate` varchar(50) DEFAULT NULL,\n" + 
			"  `agree` varchar(20) DEFAULT NULL,\n" + 
			"  PRIMARY KEY (`id`)\n" + 
			") ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;";
	
	//查询多条信息（discuss表）
	public static final String SQL_DISSCUSS_SELECTBYID = "SELECT id, type, discussid, content, userid, pudate, agree FROM discuss WHERE type=? and discussid = ? ORDER BY agree DESC, pudate DESC LIMIT 0,10";

	//查询相邻数据（news表）
	public static final String SQL_DISSCUSS_NEARID = "(SELECT *,0 as dir FROM news WHERE id < ? ORDER BY id DESC LIMIT 1) UNION ALL (SELECT *,1 as dir FROM news WHERE id > ? LIMIT 1)";
	
	//插入单条信息（discuss表）
	public static final String SQL_DISSCUSS_INSERT = "INSERT INTO discuss (type, discussid, content, userid, pudate, agree) values (?,?,?,?,?,?) ";
	
	//修改单条信息（discuss表）
	public static final String SQL_DISSCUSS_UPDATEAGREE = "UPDATE discuss SET agree = ? WHERE id = ?";
	
	//创建点赞表
	public static final String SQL_AGREE_CREATE = "CREATE TABLE `agree` (\n" + 
			"  `id` int(10) NOT NULL AUTO_INCREMENT,\n" + 
			"  `type` varchar(10) DEFAULT NULL,\n" + 
			"  `agreeid` varchar(10) DEFAULT NULL,\n" + 
			"  `userid` varchar(50) DEFAULT NULL,\n" + 
			"  `pudate` varchar(50) DEFAULT NULL,\n" + 
			"  PRIMARY KEY (`id`)\n" + 
			") ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;";
	
	//插入单条点赞
	public static final String SQL_AGREE_INSERT = "INSERT INTO agree (type, agreeid, userid, pudate) values (?,?,?,?)";
	
	//查询是否已经点赞
	public static final String SQL_AGREE_SELECTBYUSERID = "SELECT type, agreeid, userid, pudate FROM agree WHERE userid = ? and agreeid=?";
	
	//删除点赞
	public static final String SQL_AGREE_DELETE = "DELETE  FROM agree WHERE userid = ? and agreeid=?";

	//查询所有按条件（news表）
	public static final String SQL_NEWS_SELECTALLINDEX = 
			//"SELECT t.* FROM (SELECT a.id, img, title, content, type, author, pudate, click, b.id as clsid, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id ORDER BY pudate DESC LIMIT ?, ?) t ";
			"SELECT t.* FROM (SELECT a.id, img, title, content, type, author, pudate, click, b.id as clsid, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id ORDER BY pudate DESC) t ";
	
	//查询所有按条件（news表）
	public static final String SQL_NEWS_COUNTINDEX = "SELECT count(0) FROM (SELECT a.id, img, title, content, type, author, pudate, click, b.id as clsid, b.clsname FROM news a LEFT JOIN newsclass b on a.type = b.id ORDER BY pudate DESC LIMIT ?, ?) t WHERE  t.clsid = ? AND content like ?";

	//插入用户
    public static final String SQL_USER_INSERT = "INSERT INTO user (name,mima,authority) values (?,?,?)"; 

    //验证用户登录
    public static final String SQL_USER_SELECTDL = "SELECT * FROM user WHERE name = ? and mima = ? and authority = ?";
}
