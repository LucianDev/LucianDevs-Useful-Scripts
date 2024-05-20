# **Pi-hole Docker Setup Script**

This script automates the setup of a Pi-hole instance using Docker on Ubuntu Linux. It pulls the latest Pi-hole Docker image from Docker Hub and starts a container with the specified configurations.

### Prerequisites

    Ubuntu Linux (tested on Ubuntu 20.04)
    Docker installed and configured

### Usage

1. Clone this repository or download the script file.

`git clone https://github.com/LucianDev/LucianDevs-Useful-Scripts/blob/main/Linux/Docker/PiHole.sh`

2. Make the script executable.

`chmod +x PiHole.sh`

3. Run the script.

`./PiHole.sh`

### Accessing Pi-hole

Once the setup is complete, you can access Pi-hole using the following URL:

http://localhost/admin/

The script will output the password for accessing the Pi-hole web interface. Make sure to note it down.

### Additional Configuration

You can modify the script to customize the Pi-hole setup according to your requirements. Refer to the script comments for guidance.

### Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

### License

This project is licensed under the MIT License.