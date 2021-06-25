# Orsted
Orsted casestudy


This repo  is based on the casestudy of orsted and minimum viable product.

It has following components.

1.Py script etl_orsted.py whole ETL is going on this script.(Copy randomly generated Dataframe to Postgres SQL) 1000,000 Rows in Market_Data table.

2.Py script Rest_call.py is a REST API exposing data from database to Customized rest call to perform simple Aggregates and Filtering.

3.Docker file to Host the whole solution both Python files along with dependencies.

# Limitations.

1.Docker file is using Postgres localhost application which is currently not accessible inside Docker container i have to assign Database server an IP and listner to read.

2.SQL call is simple aggregates and filtering.I will shortly attach all the required SQL cases as seprate sql file GIT.Which can than be added and altered in the Rest_api call.


# Orscehstration:

This is a hypothetical design how the solution will look like in the cloud.

1.We will host the container in a Container registery service e.g. Fargate in AWS and schedule it to run.

2.Another solution is to avoid using Container and use Function as service (FaaS) like AWS Lambda Functions and Azure function in Azure to do the compute and remain highly available triggered on event.

3.I would like to deploy all the infrastructure as code so we can use Cloud formation and Azure pipline tool to deploy the stack in the cloud.

![AWS Application Architecture](https://user-images.githubusercontent.com/49390251/123450094-a0123000-d5dc-11eb-9b33-a9f14c5f41ec.jpeg)


# Outputs

1-- 1 Million Rows stored in POST Gres Market_Data table 

![Screen Shot 2021-06-25 at 5 55 42 PM](https://user-images.githubusercontent.com/49390251/123452523-c8029300-d5de-11eb-95be-67207fa3592d.png)

2-- Call from REST API Using my Local Machine.

Call will be look like this.
http://127.0.0.1:5000/users?col=price&agg=sum&groupby=market,product_type&product_duration=30min


![Screen Shot 2021-06-25 at 6 03 11 PM](https://user-images.githubusercontent.com/49390251/123453294-a81f9f00-d5df-11eb-8a98-fdd64cd877a2.png)








