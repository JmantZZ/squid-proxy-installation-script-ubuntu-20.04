#Colors

YELLOW='\033[1;33m'
NC='\033[0m' 
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
LRED='\033[1;31m'

echo -e "${YELLOW}This script will install the squid proxy server and allow everyone to have access to it.${NC}"
echo -e "${YELLOW}Proceed? [Press any key to continue or CTRL+C to cancel${NC}"
read meow

echo -e "${CYAN}Installing dependancies${NC}"
sudo apt-get -y install squid squid-common
echo -e "${GREEN}Finished Installing dependancies${NC}"

cd /etc/squid
echo -e "${CYAN}Creating a backup of the default configuration${NC}"
sudo cp squid.conf squid.conf.backup
echo -e "${GREEN}Finished creating backup${NC}"

echo -e "${YELLOW}Importing the configuration file and deleting the original one...${NC}"
sudo rm squid.conf
sudo wget https://github.com/JmantZZ/squid-proxy-installation-script-ubuntu-20.04/raw/main/squid.conf
echo -e "${GREEN}Finished tasks..${NC}"

echo -e "${YELLOW}Restarting squid proxy and cleaning up [This might take a few mins]..${NC}"
sudo systemctl restart squid
echo -e "${GREEN}Finished!${NC}"

echo -e "${LRED}Make sure that iptables have been properly configured and the port 3128 is open.${NC}"
echo -e "${LRED}Feel free to change the port in the settings.${NC}"
echo -e "${LRED}Have fun.${NC}"
sleep 5