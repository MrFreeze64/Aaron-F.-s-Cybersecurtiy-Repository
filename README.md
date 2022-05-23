# Freezy_CS_Repo
a Repository for my current projects in my class or to hold potential projects and diagrams
![ElkVM Diagram](https://github.com/MrFreeze64/Freezy_CS_Repo/blob/main/VM-Diagrams/Elk_VM%20Diagram.PNG)

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted above.


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

/ansible/filebeat-playbook.yml
/ansible/metricbeat-playbook.yml
/ansible/filebeat-config.yml
/ansible/metricbeat.yml
/ansible/pentest.yml
/ansible/elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load Balancers are a type of reverse proxy, or In other words it distributes a network or application's traffic across servers. In addition it Runs on layers 4 (Transport) and 7 (Application) of the OSI Model, running on the Application layer it can Run HTTP requests and on the Transport layer it can run IP and TCP Requests  This is a useful device as it can prevent traffic jams on a server, by sending traffic to other servers, it can keep the performance running.  In a big company, Load Balancers are an absolute must, with hundreds, thousands, tens of thousands or more clients coming through their server, they need to run multiple servers to prevent slow performance or crashes.  In addition to this they are very good at protection from Denial-of-Service (DOS) attacks, where an attacker will send an overwhelming amount of traffic that will not only slow down a server but possibly crash it and make it impossible to access it.  In addition to the load balancer preventing a denial of service attack it is useful to use a jumpbox with a load balancer becuase with a jumpbox, you have to have a specfic IP from a machine to get into the jumpbox, meaning that the only way an attacker would be able to get in would be to steal the computer, ot grab the creditentials off the computer, making it harder for them to access the VM's.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the __data___ and system _logs_.
An Elk Server is a server that is an acroynm for Elasticsearch, Logstash and Kibana, they are 3 different programs that were developed at different times starting with elasticsearch, it was a search engine developed with Java, it was a free and open source search engine that released in 2010.  It was used tools for collecting and storing data and it was a more lightweight tool than having massive servers.  However while it worked well it was then realised it would need more additions so Logstash and Kibana were dseigned too, they are used to help streamline Elasticsearch and make saving logs easier, in addition with these tools and logging of files it was easier to automate the whole process to save time and resources. In addition to Kibana there were filebeats and metricbeat, filebeats was a way to keep track of changes to the logs while metricbeat allowed you to take metrics of the servers and use them in a meaningful way to monitor servers.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| RedWeb1    |VM      | 10.0.0.5   | Linux            |
| RedWeb2    |VM      | 10.0.0.6   | Linux            |
| RedWeb3    |VM      | 10.0.0.7   | Linux            |
| Elk-VM     |HOST    | 10.1.0.4   | Linus            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the _Jump Box____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
My Public IP Address

Machines within the network can only be accessed by jumpbox 20.213.60.24__.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |  No PORT22          | My personal IP       |
| RedWeb-1    NO                    10.0.0.5
  RedWeb-2    NO                    10.0.0.6   
  RedWeb-3 |  NO                 |  10.0.0.7            |
|  Elk-VM  |  NO  Kibana         |  10.1.0.4            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

There are several advantages to using ansible, first, it is relatively easy to read, you don't need to have massive experience to read and with tasks chronologically running it makes the deployment and use of ansible benefitial. Next, they are powerful, ansible is a very useful tool in automating the process of updating or running servers, the reason is you can write up code to automate tasks and make it so you don't have to log into 50+ computers and running these commands indivdually it can run it for you.  Lastly with SSH as the archtecture, there is not a middle man program that needs to be updated (which is a real pain when you need the system) and in addition to not needing updates its more difficult to exploit the system

The playbook implements the following tasks:
1. Install Docker: Docker containers are used to connect to the server
2. Install Pip3: used to install additional items in docker
3. Docker Mods: used pip3 to install docker modules, uses python
4. Increase memory: needed for a heavy server, allows it to launch
5. Download and launch elk: download this container to use elk

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(![image](https://user-images.githubusercontent.com/97210115/169726394-38ee123a-5935-407a-9035-c2fc2b7a6116.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.5 (RedWeb-1)
10.0.0.6 (RedWeb-2) 
10.0.0.7 (RedWeb-3)           
10.1.0.4 (Elk-VM)         


We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
MetricBeat
Filebeat

These Beats allow us to collect the following information from each machine:
- _TODO: MetricBeat: collects data from a Vm or a service. If you use it with Elastic Search, Logstash and Kibana, you can monitor data of the systems.  It provides graphs and charts of information collects and can put it in a readable form.
FileBeat: file beat allows you to collect logs and files and provides you with an easier way to store the files than to have massive servers on site. It can also be monitored in Kibana for an easier way to observe and monitor data 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _ansible.cfg__ file to  _etc/ansible___.
- Update the _host and ansible .cfg____ file to include The machine IPS (Redweb-1, 2, and 3, and the elk machine later) and the ‘ansible_python_interpreter=/usr/bin/python3’ to the hosts IP’s

- Run the playbook, and navigate to __kibana___ to check that the installation worked as expected. In my case I would use the Elkserver IP: (Elk_VM IP:5601)

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_ 
   The YML files for Elk_Vm were install-elk.yml, and pentest.yml
These files were copied to /etc/ansible

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- to run the ansible playbook on a specific machine you need to add it through the nano ‘hosts’ file. To set the filebeats you set the location via the filebeat-config.yml. 

- _Which URL do you navigate to in order to check that the ELK server is running? KIBANA (ELK_VM IP:5601)

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

For this assignment, we were able to download a YML file $ sudo apt-get install python-yaml, then downloaded the file from gitlab. With YML we can create a yml by using the command nano <name_of_file>.yml this will allow you to make a playbook.  once in you need to include --- to start the file, next you format the files you use a – to separate the commands, once done you run the comman ansible-playbook<name_of_file> and it will verify everything in the file.
