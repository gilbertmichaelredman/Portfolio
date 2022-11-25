--Select Data that I will analyze
SELECT date, umpire, home, away, home_team_runs, away_team_runs, pitches_called, incorrect_calls, expected_incorrect_calls, consistency, favor_home, total_run_impact
FROM [portfolio project]..[mlb-umpire-scorecard]

--Order Umpires by largest run impact
SELECT *
FROM [portfolio project]..[mlb-umpire-scorecard]
WHERE pitches_called != 'ND'
ORDER BY total_run_impact desc

--Looking at incorrect vs expected incorrect
SELECT date, umpire, home, away, home_team_runs, away_team_runs, CAST(pitches_called AS int), incorrect_calls, expected_incorrect_calls, consistency, favor_home, total_run_impact
FROM [portfolio project]..[mlb-umpire-scorecard]
WHERE incorrect_calls<expected_incorrect_calls AND pitches_called>100
ORDER BY pitches_called desc

--looking at individual umpires
SELECT umpire, AVG(CAST(favor_home as float)) as Avg_Home_Fav
FROM [portfolio project]..[mlb-umpire-scorecard]
WHERE favor_home != 'ND'
GROUP BY umpire
ORDER BY Avg_Home_Fav desc
