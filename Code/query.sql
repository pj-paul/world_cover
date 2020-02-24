
CREATE TABLE contracts (
	cntr_id DECIMAL, 
	cust_id DECIMAL, 
	status VARCHAR, 
	season VARCHAR, 
	product_code VARCHAR, 
	date_issued DATE, 
	amount DECIMAL, 
	amount_usd DECIMAL, 
	date_planted DATE, 
	date_planted_imp DATE, 
	date_planted_in DATE, 
	loc_id DECIMAL, 
	payout DECIMAL, 
	payout_usd DECIMAL, 
	mm_paid BOOLEAN
);

COPY contracts FROM '/Users/paulpj/GoogleDrive/Career/Job_Apps/2020/WorldCover_Data_Scientist/Project_Report/Data/WC_Dump/Clean/contracts.csv' DELIMITER ',' NULL AS '' CSV HEADER;

CREATE TABLE cryield (
	cust_id DECIMAL, 
	cntr_id DECIMAL, 
	weight DECIMAL, 
	strata DECIMAL, 
	treatment VARCHAR, 
	caller VARCHAR, 
	date_called DATE, 
	call_status VARCHAR, 
	planted_acres DECIMAL, 
	yield_bags DECIMAL, 
	fert_bags DECIMAL, 
	yield_rate VARCHAR, 
	yield_lost VARCHAR, 
	reason VARCHAR, 
	yield_max_bags DECIMAL, 
	sold_bags DECIMAL, 
	sold_price DECIMAL, 
	notes VARCHAR, 
	call_count DECIMAL
);

COPY cryield FROM '/Users/paulpj/GoogleDrive/Career/Job_Apps/2020/WorldCover_Data_Scientist/Project_Report/Data/WC_Dump/Clean/cryield.csv' DELIMITER ',' NULL AS '' CSV HEADER;

CREATE TABLE customers (
	cust_id DECIMAL, 
	date_reg DATE, 
	gender VARCHAR, 
	literacy VARCHAR, 
	farm_size DECIMAL, 
	num_parcels DECIMAL, 
	cht_season VARCHAR, 
	cht_channel VARCHAR, 
	cht_phone BOOLEAN, 
	has_mobile_money BOOLEAN, 
	ussd_created BOOLEAN, 
	type VARCHAR, 
	amount_usd DECIMAL
);

COPY customers FROM '/Users/paulpj/GoogleDrive/Career/Job_Apps/2020/WorldCover_Data_Scientist/Project_Report/Data/WC_Dump/Clean/customers.csv' DELIMITER ',' NULL AS '' CSV HEADER;

CREATE TABLE locations (
	loc_id DECIMAL, 
	loc_nm VARCHAR, 
	date_reg TIMESTAMP, 
	"cust_N" BOOLEAN, 
	"visit_N" BOOLEAN, 
	is_female BOOLEAN, 
	channel_zm BOOLEAN, 
	amount_usd DECIMAL, 
	ca_nm BOOLEAN, 
	iso3 VARCHAR, 
	country VARCHAR, 
	reg_nm VARCHAR, 
	dist_id DECIMAL, 
	dist_nm VARCHAR, 
	"X" DECIMAL, 
	"Y" DECIMAL
);

COPY locations FROM '/Users/paulpj/GoogleDrive/Career/Job_Apps/2020/WorldCover_Data_Scientist/Project_Report/Data/WC_Dump/Clean/locations.csv' DELIMITER ',' NULL AS '' CSV HEADER;

