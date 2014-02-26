package ar.com.WareTech.GranDT.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Stadistics_Clausura2009 
{
	static public void main(String[] args)
		throws Exception
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/waretech_GranDT_Apertura2009", "grandt", "Pa$$word");
		ResultSet resultSet = connection.createStatement().executeQuery(
				"SELECT p.lastname, p.firstname, pp.name, c.name, played, ROUND(totalPoints / played, 2) AS average, mom, ROUND(olePoints  / played, 2) AS oleAverage, cleanGoal, ownGoal, goals, penaltyGoals, freeKickGoals, missedPenalties, cachedPenalties, yellowCard, redCard"
				+ " FROM ("
				+ " SELECT player, COUNT(player) played, SUM(totalPoints) totalPoints, SUM(mom) mom, SUM(olePoints) olePoints, SUM(cleanGoal) cleanGoal, SUM(ownGoal) ownGoal, SUM(goals) goals, SUM(penaltyGoals) penaltyGoals, SUM(freeKickGoals) freeKickGoals, SUM(missedPenalties) missedPenalties, SUM(cachedPenalties) cachedPenalties, SUM(yellowCard) yellowCard, SUM(redCard) redCard"
				+ " FROM playermatch"
				+ " GROUP BY player"
				+ " ) t"
				+ " LEFT JOIN player p ON p.id = player"	
				+ " LEFT JOIN playerposition pp ON pp.id = p.position"
				+ " LEFT JOIN club c ON c.id = p.club"
				+ " ORDER BY average DESC"
				);
		ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
		int columnCount = resultSetMetaData.getColumnCount();
		String value;
		while (resultSet.next())
		{
			for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++)
			{
				value = resultSet.getString(columnIndex);
				System.out.print(value);
				System.out.print(";");
			}
			System.out.println();
		}
		connection.close();
	}
}
