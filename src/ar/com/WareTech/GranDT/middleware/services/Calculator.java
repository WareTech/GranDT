package ar.com.WareTech.GranDT.middleware.services;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Category;
import ar.com.WareTech.GranDT.middleware.entities.PlayerMatch;
import ar.com.WareTech.GranDT.middleware.entities.PlayerPosition;
import ar.com.WareTech.GranDT.middleware.entities.PlayerTeam;
import ar.com.WareTech.GranDT.middleware.entities.PlayerTeamWeek;
import ar.com.WareTech.GranDT.middleware.entities.PositionTeamWeek;
import ar.com.WareTech.GranDT.middleware.entities.Team;
import ar.com.WareTech.GranDT.middleware.entities.Week;

/**
 * @author Administrador
 *
 */
public class Calculator
{
	final static public DecimalFormat decimalFormat = new DecimalFormat(
			"#,##0.00;-#,##0.00",
			new DecimalFormatSymbols(
					new Locale("es_AR")
					)
			);
	
	static protected Calculator calculator = new Calculator();
	
	/**
	 * @return
	 */
	static public Calculator getInstance()
	{
		return calculator;
	}
	
	/**
	 * @param teamString
	 * @param weekString
	 */
	public void calculateTeamForWeek(
			String teamString,
			String weekString
			)
	{
		Session session = Database.getCurrentSession();
		Team team = (Team) session.get(Team.class, new Long(teamString));
		Week week = (Week) session.get(Week.class, new Long(weekString));
		
		this.calculateTeamForWeek(
				team, 
				week
				);
	}
	
	/**
	 * @param team
	 * @param week
	 */
	public void calculateTeamForWeek(
			Team team,
			Week week
			)
	{
		Session session = Database.getCurrentSession();

		// ----------------------------------------------------------------
		// Elimino los calculos ya realizados para este Team en esta Week
//		List playerTeamList = session.createCriteria(PlayerTeam.class)
//			.add(Expression.eq("team", team))
//			.list();
//		List playerTeamWeekList = session.createCriteria(PlayerTeamWeek.class)
//			.add(Expression.in("playerteam", playerTeamList))
//			.add(Expression.eq("week", week))
//			.list();
		List playerTeamList;
		Iterator playerTeamWeekIterator;
		PlayerTeamWeek playerTeamWeek;
		
		if (team.getPlayerTeamSet().size() > 0)
		{
			session.createQuery(
					"DELETE PlayerTeamWeek WHERE playerteam IN (:playerteam) AND week = :week"
					)
					.setParameterList("playerteam", team.getPlayerTeamSet())
					.setParameter("week", week)
					.executeUpdate();
			
//			List playerTeamWeekList = session.createCriteria(PlayerTeamWeek.class)
//				.add(Expression.in("playerteam", team.getPlayerTeamSet()))
//				.add(Expression.eq("week", week))
//				.list();
//
//			playerTeamWeekIterator = playerTeamWeekList.iterator();
//			while(playerTeamWeekIterator.hasNext())
//			{
//				playerTeamWeek = (PlayerTeamWeek) playerTeamWeekIterator.next();
//				session.delete(playerTeamWeek);
//			}
			session.flush();	
		}
		// ----------------------------------------------------------------
		
		PlayerTeam playerTeam;
		PlayerMatch playerMatch;
		Iterator playerTeamIterator = team.getPlayerTeamSet().iterator();
		List playerTeamWeekList = new ArrayList();
		while(playerTeamIterator.hasNext())
		{
			playerTeam = (PlayerTeam) playerTeamIterator.next();
			playerMatch = (PlayerMatch) session.createCriteria(PlayerMatch.class)
				.add(Expression.eq("player", playerTeam.getPlayer()))
				.add(Expression.eq("match", week.getMatchForClub(playerTeam.getPlayer().getClub())))
				.uniqueResult();
			
			playerTeamWeek = new PlayerTeamWeek();
			playerTeamWeek.setPlayerteam(playerTeam);
			playerTeamWeek.setWeek(week);
			playerTeamWeek.setPlays(Boolean.FALSE);
			if (playerMatch != null)
			{
				playerTeamWeek.setPoints(
						playerMatch.getTotalPoints()
						);
			}
			playerTeamWeekList.add(playerTeamWeek);
		}
		
		List principalPlayerTeamWeekList = new ArrayList();
		List substitutePlayerTeamWeekList = new ArrayList();
		playerTeamWeekIterator = playerTeamWeekList.iterator();
		while(playerTeamWeekIterator.hasNext())
		{
			playerTeamWeek = (PlayerTeamWeek) playerTeamWeekIterator.next();
			if (Boolean.TRUE.equals(playerTeamWeek.getPlayerteam().getIsPrincipal()))
			{
				principalPlayerTeamWeekList.add(playerTeamWeek);
			}
			else if (Boolean.TRUE.equals(playerTeamWeek.getPlayerteam().getIsSubstitute()))
			{
				substitutePlayerTeamWeekList.add(playerTeamWeek);
			}
			else
			{
				// isList!
			}
		}
		
		Collections.sort(
				substitutePlayerTeamWeekList,
				PlayerTeamWeek.NUMBER_COMPARATOR
				);
		playerTeamWeekIterator = principalPlayerTeamWeekList.iterator();
		Iterator substitutePlayerTeamWeekIterator;
		PlayerTeamWeek _playerTeamWeek = null;
		PlayerTeamWeek selectedPlayerTeamWeek = null;
		while(playerTeamWeekIterator.hasNext())
		{
			playerTeamWeek = (PlayerTeamWeek) playerTeamWeekIterator.next();
			if (playerTeamWeek.getPoints() != null)
			{
				playerTeamWeek.setPlays(Boolean.TRUE);
				continue;
			}
			
			playerTeamWeek.setPlays(Boolean.FALSE);
			
			// Arquero
			if (PlayerPosition.ARQUERO.equals(playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
			{
				substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
				while(substitutePlayerTeamWeekIterator.hasNext())
				{
					_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
					if (!PlayerPosition.ARQUERO.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
					{
						continue;
					}
					if (_playerTeamWeek.getPoints() != null)
					{
						selectedPlayerTeamWeek = _playerTeamWeek;
						break;
					}
				}
			}
			// Defensor
			else if (PlayerPosition.DEFENSOR.equals(playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
			{
				substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
				selectedPlayerTeamWeek = null;
				while(substitutePlayerTeamWeekIterator.hasNext())
				{
					_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
					if (!PlayerPosition.DEFENSOR.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
					{
						continue;
					}
					if (_playerTeamWeek.getPoints() != null)
					{
						selectedPlayerTeamWeek = _playerTeamWeek;
						break;
					}
				}
				// Si no hubo ningun defensor suplente disponible, busco un volante
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.VOLANTE.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
				// Si no hubo ningun volante ni defensor suplente disponible, busco un delantero
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.DELANTERO.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
			}
			// Volante
			else if (PlayerPosition.VOLANTE.equals(playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
			{
				substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
				selectedPlayerTeamWeek = null;
				while(substitutePlayerTeamWeekIterator.hasNext())
				{
					_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
					if (!PlayerPosition.VOLANTE.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
					{
						continue;
					}
					if (_playerTeamWeek.getPoints() != null)
					{
						selectedPlayerTeamWeek = _playerTeamWeek; 
						break;
					}
				}
				// Si no hubo ningun volante suplente disponible, busco un defensor
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.DEFENSOR.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
				// Si no hubo ningun volante ni defensor suplente disponible, busco un delantero
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.DELANTERO.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
			}
			// Delantero
			else if (PlayerPosition.DELANTERO.equals(playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
			{
				substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
				selectedPlayerTeamWeek = null;
				while(substitutePlayerTeamWeekIterator.hasNext())
				{
					_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
					if (!PlayerPosition.DELANTERO.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
					{
						continue;
					}
					if (_playerTeamWeek.getPoints() != null)
					{
						selectedPlayerTeamWeek = _playerTeamWeek; 
						break;
					}
				}
				// Si no hubo ningun delantero suplente disponible, busco un volante
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.VOLANTE.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
				// Si no hubo ningun delantero ni volante suplente disponible, busco un defensor
				if (selectedPlayerTeamWeek == null)
				{
					substitutePlayerTeamWeekIterator = substitutePlayerTeamWeekList.iterator();
					selectedPlayerTeamWeek = null;
					while(substitutePlayerTeamWeekIterator.hasNext())
					{
						_playerTeamWeek = (PlayerTeamWeek) substitutePlayerTeamWeekIterator.next();
						if (!PlayerPosition.DEFENSOR.equals(_playerTeamWeek.getPlayerteam().getPlayer().getPosition().getName()))
						{
							continue;
						}
						if (_playerTeamWeek.getPoints() != null)
						{
							selectedPlayerTeamWeek = _playerTeamWeek; 
							break;
						}
					}
				}
			}
			// Marco al reemplazante como que jugó para el equipo, y lo quito de la lista de suplentes
			if (selectedPlayerTeamWeek != null)
			{
				selectedPlayerTeamWeek.setPlays(Boolean.TRUE);
				substitutePlayerTeamWeekList.remove(selectedPlayerTeamWeek);
			}
		}
		
		// Duplico los puntos del Capitan
		// Se duplica el primer capitan que haya jugado, sin importar si es titular o suplente
		if (
				this.duplicatePoints(
						team.getCaptain1ForPlayerTeamSet(), 
						playerTeamWeekList
						) ||
				this.duplicatePoints(
						team.getCaptain2ForPlayerTeamSet(), 
						playerTeamWeekList
						) ||
				this.duplicatePoints(
						team.getCaptain3ForPlayerTeamSet(), 
						playerTeamWeekList
						)
			)
		{
			// NADA!
		}

		// Guardo los playerTeamWeek actualizados
		double points = 0d;
		playerTeamWeekIterator = playerTeamWeekList.iterator();
		while(playerTeamWeekIterator.hasNext())
		{
			playerTeamWeek = (PlayerTeamWeek) playerTeamWeekIterator.next();
			session.save(playerTeamWeek);
			if (playerTeamWeek.getPlays().booleanValue())
			{
				points += playerTeamWeek.getPoints().doubleValue(); 
			}
		}
		session.flush();
	}

	/**
	 * @param playerTeam
	 * @param playerTeamWeekList
	 * @return
	 */
	public boolean duplicatePoints(
			PlayerTeam playerTeam,
			List playerTeamWeekList
			)
	{
		if (playerTeam == null)
		{
			return false;
		}
		
		Iterator playerTeamWeekIterator = playerTeamWeekList.iterator();
		PlayerTeamWeek playerTeamWeek;
		while(playerTeamWeekIterator.hasNext())
		{
			playerTeamWeek = (PlayerTeamWeek) playerTeamWeekIterator.next();
			if (playerTeamWeek.getPlayerteam() == playerTeam)
			{
				if (playerTeamWeek.getPoints() != null && Boolean.TRUE.equals(playerTeamWeek.getPlays()))
				{
					playerTeamWeek.setPoints(
							new Double(playerTeamWeek.getPoints().doubleValue() * 2)
							);
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * @param weekString
	 */
	public void calculateWeek(
			String weekString
			)
	{
		Week week = (Week) Database.getCurrentSession().get(Week.class, new Long(weekString));
		this.calculateWeek(week);
	}
	
	/**
	 * @param week
	 */
	public void calculateWeek(
			Week week
			)
	{
		Iterator teamIterator = Database.getCurrentSession().createCriteria(Team.class).list().iterator();
		Team team;
		while(teamIterator.hasNext())
		{
			team = (Team) teamIterator.next();
			this.calculateTeamForWeek(
					team, 
					week
					);
		}
	}
	
	/**
	 * @param teamString
	 * @param weekString
	 * @return
	 */
	public PositionTeamWeek calculatePositionForTeamForWeek(
			String teamString,
			String weekString
			)
	{
		Session session = Database.getCurrentSession();
		
		Team team = (Team) session.get(Team.class, new Long(teamString));
		Week week = (Week) session.get(Week.class, new Long(weekString));

		return this.calculatePositionForTeamForWeek(
				team, 
				week
				);
	}
	
	/**
	 * @param team
	 * @param week
	 * @return
	 */
	public PositionTeamWeek calculatePositionForTeamForWeek(
			Team team,
			Week week
			)
	{
		Session session = Database.getCurrentSession();

		PositionTeamWeek positionTeamWeek = (PositionTeamWeek) session.createCriteria(
				PositionTeamWeek.class
				)
				.add(Expression.eq("team", team))
				.add(Expression.eq("week", week))
				.uniqueResult();
		
		if (positionTeamWeek != null)
		{
			session.delete(positionTeamWeek);
			session.flush();
		}
		
		Double weekPoints;
		if (team.getPlayerTeamSet().size() > 0)
		{
			weekPoints = (Double) session.createQuery(
				"SELECT SUM(points) FROM PlayerTeamWeek WHERE playerteam IN (:playerTeamList) AND week = :week AND plays = 1"
				)
				.setParameterList("playerTeamList", team.getPlayerTeamSet())
				.setEntity("week", week)
				.uniqueResult();
		}
		else
		{
			weekPoints = new Double(0.0d);
		}
		
		if (weekPoints == null)
		{
			weekPoints = new Double(0.0d);
		}
		
		Week lastWeek = (Week) session.createCriteria(
				Week.class
				)
				.add(Expression.eq("number", new Integer(week.getNumber().intValue() - 1)))
				.uniqueResult();

		positionTeamWeek = (PositionTeamWeek) session.createCriteria(
				PositionTeamWeek.class
				)
				.add(Expression.eq("team", team))
				.add(Expression.eq("week", lastWeek))
				.uniqueResult();
		
		Double totalPoints = weekPoints;
		if (positionTeamWeek != null)
		{
			totalPoints = new Double(
					totalPoints.doubleValue() + 
					positionTeamWeek.getPoints().doubleValue()
					);
		}

		positionTeamWeek = new PositionTeamWeek();
		positionTeamWeek.setTeam(team);
		positionTeamWeek.setWeek(week);
		positionTeamWeek.setWeekPoints(weekPoints);
		positionTeamWeek.setPoints(totalPoints);

		session.save(positionTeamWeek);
		session.flush();
		
		return positionTeamWeek;
	}
	
	/**
	 * @param week
	 */
	public void calculatePositionForWeek(
			Week week
			)
	{
		Session session = Database.getCurrentSession();
		
		Iterator teamIterator = session.createCriteria(Team.class).list().iterator();
		Team team;
		PositionTeamWeek positionTeamWeek = null;
		Map positionTeamWeekMap = new HashMap();
		List positionTeamWeekList;
		while(teamIterator.hasNext())
		{
			team = (Team) teamIterator.next();
			positionTeamWeek = this.calculatePositionForTeamForWeek(
					team, 
					week
					);
			
			positionTeamWeekList = (List) positionTeamWeekMap.get(positionTeamWeek.getTeam().getCategory());
			if (positionTeamWeekList == null)
			{
				positionTeamWeekList = new ArrayList();
				positionTeamWeekMap.put(
						positionTeamWeek.getTeam().getCategory(), 
						positionTeamWeekList
						);
			}
			positionTeamWeekList.add(
					positionTeamWeek
					);
		}
		
		Iterator positionTeamWeekMapIterator = positionTeamWeekMap.values().iterator();
		while(positionTeamWeekMapIterator.hasNext())
		{
			positionTeamWeekList = (List) positionTeamWeekMapIterator.next();
			Collections.sort(
					positionTeamWeekList,
					new Comparator()
					{
						public int compare(
								Object object1, 
								Object object2
								) 
						{
							return ((PositionTeamWeek) object1).getPoints().compareTo(
									((PositionTeamWeek) object2).getPoints()
									) * -1;
						}
					}
					);
			Iterator positionTeamWeekIterator = positionTeamWeekList.iterator();
			int position = 1;
			while(positionTeamWeekIterator.hasNext())
			{
				positionTeamWeek = (PositionTeamWeek) positionTeamWeekIterator.next();
				positionTeamWeek.setCategory(positionTeamWeek.getTeam().getCategory());
				positionTeamWeek.setPosition(new Integer(position));
				session.update(positionTeamWeek);
				position++;
			}
		}
		
		session.flush();
	}
	
	/**
	 * @param weekString
	 */
	public void calculatePositionForWeek(
			String weekString
			)
	{
		Week week = (Week) Database.getCurrentSession().get(
				Week.class, 
				new Long(weekString)
				);
		this.calculatePositionForWeek(week);
	}
	
	/**
	 * 
	 */
	public void updateBasePositions()
	{
		Session session = Database.getCurrentSession();
		List positionTeamWeekList = session.createCriteria(PositionTeamWeek.class)
				.add(Expression.isNull("weekPoints"))
				.addOrder(Order.desc("points"))
				.list();
	
		Iterator positionTeamWeekIterator = positionTeamWeekList.iterator();
		PositionTeamWeek positionTeamWeek;
		int primeraAPosition = 1;
		int nacionalBPosition = 1;
		while(positionTeamWeekIterator.hasNext())
		{
			positionTeamWeek = (PositionTeamWeek) positionTeamWeekIterator.next();
			positionTeamWeek.setCategory(positionTeamWeek.getTeam().getCategory());
			if (Category.PRIMERA_A.equals(positionTeamWeek.getTeam().getCategory().getName()))
			{
				positionTeamWeek.setPosition(new Integer(primeraAPosition));
				primeraAPosition++;
			}
			else if (Category.NACIONAL_B.equals(positionTeamWeek.getTeam().getCategory().getName())) 
			{
				positionTeamWeek.setPosition(new Integer(nacionalBPosition));
				nacionalBPosition++;
			}
			else
			{
				throw new RuntimeException(
						"Unexpected categoty " + positionTeamWeek.getTeam().getCategory().getName()
						);
			}
			session.update(positionTeamWeek);
		}
		
		session.flush();
	}
	
	/**
	 * @param args
	 * @throws Exception
	 */
	static public void main(
			String[] args
			)
		throws Exception
	{
		Database.getCurrentSession().beginTransaction();
		
		try
		{
//			Calculator.getInstance().calculateTeamForWeek("55", "13");
			Calculator.getInstance().calculateWeek("5");
//			Calculator.getInstance().calculatePositionForTeamForWeek("60", "12");
			Calculator.getInstance().calculatePositionForWeek("5");
			
//			Calculator.getInstance().updateBasePositions();
			
			Database.getCurrentSession().getTransaction().commit();
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
			Database.getCurrentSession().getTransaction().rollback();
		}
	}
}

