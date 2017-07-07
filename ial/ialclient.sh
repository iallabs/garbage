#!/bin/sh

source ./home/ubuntu/ial/mysql_utils/juice.sh
source ./home/ubuntu/ial/ialc-client/instancedata.sh
# source ./home/ubunut/ial/ial_analytics/juice.sh


feediallogs () {
    # feed ialinst.json file
    # parameters values (tuple)
    feedjson $1 logs /home/ubuntu/data/instances.json
}

feedialarc () {
    # feed ialdbhierarchy.json file
    # parameters values (tuple)
    feedjson $1 arc /home/ubuntu/data/hierarchy.json
}

send_data_toinstance () {

}

wget_data_frominstance () {

}

instance_db_architecture () {

}

instance_read_db_architecture () {

}

build_instance_database () {

}

save_instance_database () {

}

backup_instance_database () {

}

upgrade_instance_backup_database () {

}
