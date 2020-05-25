echo "STOPPING RABBIT-2"
rabbitmqctl -n rabbit2@rabbit-mq-2 stop_app
echo "RABBIT-2 IS JOINING CLUSTER WITH RABBIT-1"
rabbitmqctl -n rabbit2@rabbit-mq-2 join_cluster rabbit1@rabbit-mq-1
echo "STARTING RABBIT-2"
rabbitmqctl -n rabbit2@rabbit-mq-2 start_app
echo "SETTING RABBIT-1 POLICY"
rabbitmqctl -n rabbit1@rabbit-mq-1 set_policy ha-all "^.*" "{\"ha-mode\":\"all\"}"
