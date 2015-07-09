set -eux

base_directory=$(cd `dirname $0` && pwd)
cd $base_directory/terraform
echo 'yes' | terraform destroy --input=false