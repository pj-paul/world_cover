#!/bin/bash 

# loop_populate_db: Loops over a set of csv files in a directory, creates table schemas for them, 
#  and adds them into a Postgres database.
# 
# Use cases: Typically used for cleaning csv files. 

############## Requirements ##############
# Assumes that the input data is comma-delimited and that it has a header.
# Depends on csvsql, which is part of csvkit: http://csvkit.readthedocs.org
# 

############## Usage #####################
# bash ./load_data_db.sh ../../Data/WC_Dump/Raw ../../Data/WC_Dump/Clean WC_Dump paulpj

# Author: http://pjpaul.info

############## Helper Functions #################
Clean_Empty_Strings(){
	input_file=$1
	output_file=$2
	gawk '{for(i=1;i<=NF;i++)if($i=="\"\"") $i="";print}' FS="," OFS="," "$1" > "$2"
}



dir=$1
#echo "dir" ${dir}
output_dir=$2
#echo "output dir" ${output_dir}
db_name=$3
user=$4
output_abs_path="$(cd "$output_dir" && pwd -P)"
parent_path="$(cd "$dir/../" && pwd -P)"


echo > query.sql

start=$SECONDS

for file in ${dir}/*.csv # Use file globbing to get the files
do
	name=${file##*/}
	base=${name%.csv}
	echo "Cleaning empty string in... " ${name}
	Clean_Empty_Strings ${file}  "${output_dir}/${name}"
	echo "Generating query for.... " ${name}
		# Run the schema generator on a restricted number of csv rows, here set to 100 rows.
		# This is to speed up the schema generation process
	echo ${file} 
	echo ${base}
	#csvsql --no-constraints --table ${base} ${file} | echo 
	head -n 1000 ${file}  | csvsql --no-constraints --table ${base} >> query.sql 
	echo >> query.sql
	echo "COPY ${base} FROM '${output_abs_path}/${name}' DELIMITER ',' NULL AS '' CSV HEADER;" >> query.sql
	echo >> query.sql
done

duration=$(( SECONDS - start ))

echo "That took" ${duration} "seconds"

echo "Creating the DB and tables"

dropdb ${db_name}
createdb ${db_name}
echo "Starting the copy process"
start=$SECONDS
psql -v ON_ERROR_STOP=1 -d ${db_name} -U ${user} -a -f "./query.sql"
psql -v ON_ERROR_STOP=1 -d ${db_name} -U ${user} -a -f "./queries_part2.sql.sql"
duration=$(( SECONDS - start ))
echo "That took" ${duration} "seconds"




