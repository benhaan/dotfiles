export EDITOR="vim"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"

export VAGRANT_HOME="/Volumns/Universe/Vagrant"

if [[ -d ~/.ec2 ]]
then
  # AWS Tools
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
  export EC2_HOME="/opt/boxen/homebrew/Library/LinkedKegs/ec2-api-tools/libexec"
  export EC2_AMITOOL_HOME="/opt/boxen/homebrew/Library/LinkedKegs/ec2-ami-tools/libexec"
  export AWS_ELB_HOME="/opt/boxen/homebrew/Library/LinkedKegs/elb-tools/libexec"
  export AWS_RDS_HOME="/opt/boxen/homebrew/Library/LinkedKegs/rds-command-line-tools/libexec"
fi
