#
# collection of variables to define apigee hybrid topology and configuration
#
#  cloud: GCP
#  cluster: small, single-zone
#  
#
# usage:
#    source <env-conf-file>

export PLATFORM=${PLATFORM:-linux}  # linux | osx | win

export CERT_MANAGER_MANIFEST=https://github.com/jetstack/cert-manager/releases/download/v0.14.2/cert-manager.yaml

export ASM_VERSION=1.5.9-asm.0
export ASM_TEMPLATE=$AHR_HOME/templates/asm-overrides.yaml
export ASM_CONFIG=$HYBRID_HOME/asm.yaml

export PROJECT_NUMBER=$(gcloud projects describe ${PROJECT} --format="value(projectNumber)")
export MESH_ID="proj-${PROJECT_NUMBER}"

#
# Hybrid release configuration
#
export HYBRID_VERSION=1.3.0
export HYBRID_TARBALL=apigeectl_linux_64.tar.gz




#
# GCP Project:
#

export NETWORK=default
export SUBNETWORK=default

export REGION=${REGION:-europe-west1}
export ZONE=${ZONE:-europe-west1-b}
export AX_REGION=${AX_REGION:-europe-west1}
#

#
# Runtime Cluster definition
#
export CLUSTER_TEMPLATE=$AHR_HOME/templates/cluster-single-zone-one-nodepool-template.json
export CLUSTER_CONFIG=$HYBRID_HOME/cluster-sz.json

export MACHINE_TYPE_DATA=${MACHINE_TYPE_DATA:-e2-standard-8}
export MACHINE_TYPE_RUNTIME=${MACHINE_TYPE_RUNTIME:-e2-standard-4}

export CLUSTER_VERSION=1.16

export CLUSTER=hybrid-cluster
export CLUSTER_ZONE=${ZONE}
export CLUSTER_LOCATIONS='"'${ZONE:-europe-west1-b}'"'
export CONTEXT=$CLUSTER


#------------------------------------------------------------

# 
# Runtime Hybrid configuration
#
export RUNTIME_CONFIG=$HYBRID_HOME/runtime-sz.yaml


export ORG=$PROJECT
export ENV=test
export ENV_GROUP=test-group

#export ENC_KEY_KMS=$(LC_ALL=C tr -dc "[:print:]" < /dev/urandom | head -c 32 | openssl base64)
#export ENC_KEY_KVM=$ENC_KEY_KMS
#export ENC_KEY_CACHE=$ENC_KEY_KMS


export SA_DIR=$HYBRID_HOME/service-accounts

export MART_ID=apigee-mart
export SYNCHRONIZER_ID=apigee-synchronizer


export SYNCHRONIZER_SA=$SA_DIR/$PROJECT-$SYNCHRONIZER_ID.json
export UDCA_SA=$SA_DIR/$PROJECT-apigee-udca.json
export MART_SA=$SA_DIR/$PROJECT-apigee-mart.json
export METRICS_SA=$SA_DIR/$PROJECT-apigee-metrics.json
export WATCHER_SA=$SA_DIR/$PROJECT-apigee-watcher.json

export MART_SA_ID=$MART_ID@$PROJECT.iam.gserviceaccount.com
export SYNCHRONIZER_SA_ID=$SYNCHRONIZER_ID@$PROJECT.iam.gserviceaccount.com

export RUNTIME_HOST_ALIAS=$ORG-$ENV.hybrid-apigee.net
export RUNTIME_SSL_CERT=$HYBRID_HOME/hybrid-cert.pem
export RUNTIME_SSL_KEY=$HYBRID_HOME/hybrid-key.pem
export RUNTIME_IP=$(gcloud compute addresses describe runtime-ip --region $REGION --format='value(address)')

#------------------------------------------------------------
