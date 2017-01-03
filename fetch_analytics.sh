#!/bin/sh

DATE=`date +"%d-%m-%y-%H-%M"`
WORKSHOP_FOLDER="workshop-analytics-$DATE"
WORKSHOP_DIR="/root/workshop-analytics"
INDEX_NAME="vlabs"
CTID_ANALYTICS=280
CTID_FEEDBACK=278
mysql_user="root"
mysql_pass="root"
mysql_feedback_db="feedback"
institute_name=$1
LOCAL_WORKSHOP_DIR=$WORKSHOP_DIR/$WORKSHOP_FOLDER
mkdir $LOCAL_WORKSHOP_DIR

if [ "$#" -ne 1 ]
then 
	echo "Usage : This script expects College name as its argument" 
	echo "Usage : sh fetch_analytics.sh <your_college_name>" 
	echo "Usage : Exiting - Try again" 
	exit
fi

# Take elasticdump - the logs captured in ELK server
# Details 
# 1. Logs gets copied in localmachine in /root/workshop-analytics/workshop-analytics-$DATE folder
# 2. Two logs files - vlabs_mapping_$DATE.json and vlabs_data_$DATE.json files are generated.
# 3. Log files will not be generated in case they already exist.
 
echo "`date`: Executing elasticdump command " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt
echo "`vzctl exec $CTID_ANALYTICS elasticdump --input=http://localhost:9200/$INDEX_NAME --output=$WORKSHOP_DIR/vlabs_mapping_$DATE.json --type=mapping`"
echo "`vzctl exec $CTID_ANALYTICS elasticdump --input=http://localhost:9200/$INDEX_NAME --output=$WORKSHOP_DIR/vlabs_data_$DATE.json --type=data`"
echo "`date`: Finished Executing elasticdump command " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt

echo "`cp /vz/private/280/$WORKSHOP_DIR/vlabs_mapping_$DATE.json $LOCAL_WORKSHOP_DIR/`"
echo "`cp /vz/private/280/$WORKSHOP_DIR/vlabs_data_$DATE.json $LOCAL_WORKSHOP_DIR/`"
echo "`date`: Copied files in $LOCAL_WORKSHOP_DIR " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt

# Take mysqldump of feedback - only sql dump is captured and needed
# Details -
# 1. SQLdump  gets copied in /root/workshop-analytics/workshop-analytics-$DATE folder
# 2. filename will be feedbackdump-$DATE.sql 


echo "`date`: Start Mysql dump for feedback " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt
echo "`vzctl exec $CTID_FEEDBACK mysqldump -u $mysql_user -p$mysql_pass $mysql_feedback_db`" > $LOCAL_WORKSHOP_DIR/feedbackdump-$DATE.sql
echo "`date`: End Mysql dump for feedback " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt

# Compress the folder 
echo "`date`: Start Compressing " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt
echo "`tar -zvcf $institute_name.tar.gz $LOCAL_WORKSHOP_DIR`"
echo "`date`: File Compressed - Look for file - $institute_name.tar.gz " >> $LOCAL_WORKSHOP_DIR/exec-status-$DATE.txt

