# **Pi-hole Docker Setup Script**

This script automates the setup of a Pi-hole instance using Docker on Ubuntu Linux. It pulls the latest Pi-hole Docker image from Docker Hub and starts a container with the specified configurations.

### Prerequisites

    Ubuntu Linux (tested on Ubuntu 20.04)
    Docker installed and configured

### Usage

1. Clone this repository or download the script file.

`curl -O https://raw.githubusercontent.com/LucianDev/LucianDevs-Useful-Scripts/main/Linux/Docker/Pi-Hole/PiHole.sh`

2. Make the script executable.

`chmod +x PiHole.sh`

3. Run the script.

`./PiHole.sh`

### Accessing Pi-hole

Upon successful setup, the script will provide the following information to access the Pi-hole dashboard:

-     Address: The IP address or hostname where Pi-hole is hosted.
-     Password: The password to access the Pi-hole dashboard.

The script will output the password for accessing the Pi-hole web interface. Make sure to note it down.

### Additional Configuration

You can modify the script to customize the Pi-hole setup according to your requirements. Refer to the script comments for guidance.

### Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

### License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/LucianDev/LucianDevs-Useful-Scripts/blob/main/LICENSE "LICENSE") file for details.