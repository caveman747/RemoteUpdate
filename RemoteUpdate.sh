#collects command line arguments
while getopts u:a:f: flag
do
    case "${flag}" in
        f) firmware_filename=${OPTARG};;
    esac
done

echo "This is the firmware:" $firmware_filename;

#Copies firmware update from local RemoteUpdate directory to remote host
scp DR9401542.DAT root@10.1.72.58:/usr/local/Datalogic/JavaPOS/


ssh -l root 10.1.72.58 "cd /usr/local/Datalogic/JavaPOS/; /usr/local/Datalogic/JavaPOS/cmdfwu.sh2 -f $firmware_filename"

