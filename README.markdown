# Demo deployed on Heroku
[http://livingsocial-data-engineering.herokuapp.com](http://livingsocial-data-engineering.herokuapp.com)


## Deployment Instructions:
1. Fork or clone the repository.
1. create 1.9.3 gemset
1. run 'bundle'
1. create postgres database
1. run 'rake db:migrate'
1. startup rails application- 'rails server'
1. hit 'locahost:3000' on the browser


## Usage
1. Login with 'admin@example.com' and 'password'.
1. Next, Navigate to 'Orders' menu item.
1. Click on 'Upload CSV' action button.
1. Browse for a CSV file on you machine and click 'submit'.
1. CSV should be uploaded and you should be able to see the uploaded data in a table.
1. 'Total Gross Revenue' is also visible on the sidebar.
1. You can use the hyperlink in the result table to view specific data items.

## Domain Model
1. Access the file in doc/domain-model.zargo.
1. Download ArgoUML to view the model.

## Time Taken
1. 20min - Project setup
1. 90min - Development
1. 20min - Heroku Cloud Deployment
1. 15min - Documentation
Total- 145mins