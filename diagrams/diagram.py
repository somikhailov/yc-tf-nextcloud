# diagram.py
from diagrams import Diagram, Cluster
from diagrams.onprem.container import Docker
from diagrams.onprem.network import Nginx
from diagrams.programming.language import PHP
from diagrams.onprem.inmemory import Redis
from diagrams.onprem.database import PostgreSQL

# from diagrams.programming.language import Python

with Diagram("app", show=False):
    with Cluster("host"):
        Docker("docker")
        with Cluster("docker image"):
            nextcloud = PHP("nextcloud") 
            Redis("redis") >> nextcloud << PostgreSQL("postgresql")
            Nginx("nginx") << nextcloud