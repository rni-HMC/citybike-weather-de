This folder contains all the secret sauce needed to spin up the AWS EC2 instance that hosts the application.
 
Follow these steps:
1. Set these environment variables. Reminder - these access keys were [generated from the AWS Security credentials page](https://us-east-1.console.aws.amazon.com/iam/home#/security_credentials).
```
export AWS_ACCESS_KEY_ID=<get from lastpass>
export AWS_SECRET_ACCESS_KEY=<get from lastpass>
```
2. `cd infrastructure`
3. Make sure you have `/home/richard/Projects/CityBikeWeather/learn-terraform-aws-instance/aws_key.pem` (also in lastpass)
4. `terraform init && terraform apply`
5. Connect to EC2 instance ![](connect_to_ec2_instance.png)
6. Go through [Airbyte setup](https://docs.airbyte.com/deploying-airbyte/on-aws-ec2)
```bash
# Install Docker
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker $USER
# Install Docker Compose - Note: Don't follow the airbyte instructions. Install it manually
# https://docs.docker.com/compose/install/linux/#install-the-plugin-manually
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version
logout # This is required for the user to be added to the docker usergroup to take effect
# Reconnect back into the instance
mkdir airbyte && cd airbyte
chmod +x run-ab-platform.sh
wget https://raw.githubusercontent.com/airbytehq/airbyte/master/run-ab-platform.sh
./run-ab-platform.sh -b
```
