for i in `find /home/database/ -name "*.sql" | sort --version-sort`; do mysql -udocker - pdocker docker_to_aws_with_dotnet < $i; done;
