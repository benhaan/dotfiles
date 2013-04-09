export EDITOR="subl"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"

if [[ -d ~/.ec2 ]]
then
  # AWS Tools
  export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
  export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
  export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
  export AWS_RDS_HOME="/usr/local/Library/LinkedKegs/rds-command-line-tools/jar"
fi

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh