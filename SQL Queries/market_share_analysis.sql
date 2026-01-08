-- percentage of vehicles in each state are EVs, PHEVs, HEVs, and gasoline

with total_summary as
					(select
						SUM(Biodiesel) as biodiesel_total,
						SUM(Ethanol) as ethanol_total,
						SUM(Hydrogen) as hydrogen_total,
						SUM(EV + PHEV + HEV + Biodiesel + Ethanol + CNG + Propane + Hydrogen + Methanol + Gasoline + Diesel) as total_vehicles
					from vehicle_data)
select 
	biodiesel_total,
    ROUND((biodiesel_total*1.0/total_vehicles)*100.0,2) AS biodiesel_perc,
    ethanol_total,
    ROUND((ethanol_total*1.0/total_vehicles)*100.0,2) AS e85_perc,
    hydrogen_total,
    ROUND((hydrogen_total*1.0/total_vehicles)*100.0,2) AS hydrogen_perc
from total_summary
;

-- ev rates asc

select 
	State,
	ev_percentage
from vehicle_data vd 
order by ev_percentage asc
;

-- ev rates desc 

select 
	State,
	ev_percentage
from vehicle_data vd 
order by ev_percentage desc 
;
