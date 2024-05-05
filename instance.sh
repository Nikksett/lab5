aws ec2 run-instances \
    --image-id ami-04b70fa74e45c3917 \
    --count 1 \
    --instance-type t2.micro \
    --key-name labs \
    --security-group-ids sg-0630913385b3b25bb \
    --subnet-id subnet-0c4e546e9a99fcf31 \
    --user-data file://script_5.sh

