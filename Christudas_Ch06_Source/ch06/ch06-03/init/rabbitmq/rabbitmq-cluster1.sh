echo "STOPPING RABBIT-1"
rabbitmqctl -n rabbit1@rabbit-mq-1 stop_app
echo "RABBIT-1 IS JOINING CLUSTER WITH RABBIT-2"
rabbitmqctl -n rabbit1@rabbit-mq-1 join_cluster rabbit2@rabbit-mq-2
echo "STARTING RABBIT-1"
rabbitmqctl -n rabbit1@rabbit-mq-1 start_app
echo "SETTING RABBIT-2 POLICY"
rabbitmqctl -n rabbit2@rabbit-mq-2 set_policy ha-all "^.*" "{\"ha-mode\":\"all\"}"
