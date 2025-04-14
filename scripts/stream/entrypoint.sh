#!/bin/bash

# Function to initialize KRaft metadata
initialize_kraft_metadata() {
  if [ ! -f /var/lib/kafka/data/meta.properties ]; then
    echo "Initializing KRaft metadata..."
    CLUSTER_ID=$(kafka-storage.sh random-uuid)
    kafka-storage.sh format -t $CLUSTER_ID -c /etc/kafka/server.properties
    echo "Cluster ID: $CLUSTER_ID"
  else
    echo "KRaft metadata already initialized."
  fi
}

# Call the function to initialize metadata
initialize_kraft_metadata

# Start Kafka broker
exec kafka-server-start.sh /etc/kafka/server.properties 