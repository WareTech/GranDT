function setEnabled(playerId, value)
{
	document.getElementById("cleanGoal_" + playerId).disabled = value;
	document.getElementById("recivedGoals_" + playerId).disabled = value;
	document.getElementById("cachedPenalties_" + playerId).disabled = value;
	document.getElementById("mom_" + playerId).disabled = value;
	document.getElementById("goals_" + playerId).disabled = value;
	document.getElementById("penaltyGoals_" + playerId).disabled = value;
	document.getElementById("freeKickGoals_" + playerId).disabled = value;
	document.getElementById("ownGoals_" + playerId).disabled = value;
	document.getElementById("missedPenalties_" + playerId).disabled = value;
	document.getElementById("yellowCard_" + playerId).disabled = value;
	document.getElementById("redCard_" + playerId).disabled = value;
}
