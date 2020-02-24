ALTER TABLE customers
	RENAME COLUMN amount_usd to total_premium_usd_customer; 

ALTER TABLE customers
	RENAME COLUMN date_reg to date_reg_customer; 

ALTER TABLE locations
	RENAME COLUMN amount_usd to total_premium_usd_location; 

ALTER TABLE locations
	RENAME COLUMN date_reg to date_reg_location; 

CREATE TABLE joint_table AS
	SELECT * FROM cryield 
		LEFT JOIN contracts using(cntr_id, cust_id)
		LEFT JOIN locations using(loc_id)
		LEFT JOIN customers using(cust_id)